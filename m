Return-Path: <linux-arm-msm+bounces-71850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 943BBB41E92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21A6E1B255F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2A92FD7CF;
	Wed,  3 Sep 2025 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqcM/3TH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B4B2FDC21
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 12:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901666; cv=none; b=UBGA/J8e0/wBegNliv4PKIQdfvgJT5TXJzROyIWRZogZfgoqhLw8LNKzM0g6V9qbYJ2mJ0QCbByEaLQB9qAr+8cBa426Nx2ppEqZ9osTv8eibZYvBQuTri/mYJMPRzhUxCNICuAk6QpZ4cN9+IHSYi1be1Wk1BDu+oSflxJM1oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901666; c=relaxed/simple;
	bh=rhcG8/VPnpbFKNJE/RJEZ6fxiaJwxSbJPaO6Ku2gAGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPm6cRlN3RVcRiGEBX9dPQLL/jiydFAdKYvd4YYSnOtwt5ga+ZQR/fu9jF8pIybw74JwVWPub0jo+jC9WTpd/jHNljbDdJnKJLaQmWTtX8LwhfvHPFijJHpF78zSm9lK6LpSIIaTkz+se0/MGSp/W9J/+jkK0P9tJLSQtcJq/8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqcM/3TH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEuKk020319
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 12:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mC6An3ACH4+NSeazLfe9JFoE+xEhWTvXPq1zxofMuEo=; b=AqcM/3THpaYT+ams
	5CYDdDcz8nDnksCpBVAPELLmtnVfkHuuv16SkmyGQ+IuK/C/iPq8tqJ8rYSiq2/j
	KoyyfhYDHrq0yE1a0QkOpaWmKxINXvoNmZpq+sscYDaACcHYyxGUNbpK64wkyW0A
	OjEsYBIcOzaoNJM+tFKQ6QeKyIw3DF/OwA7pH/Mi2Ef44gsg/AAI18P4tVvyushr
	xVBvrX8x+GgYv6XPoicQW7Iz7y2VXz+p+GNx7ZsDmepCvu0kGjNofa07S0JBefSa
	/pSFppoi3l0sQWv2OPo2sIqRfHlL+ktsGBtSsendSRjHcO3KUYnZc5HoV1dKU62h
	gQIWVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk93cej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 12:14:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3387c826eso12143961cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 05:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901663; x=1757506463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mC6An3ACH4+NSeazLfe9JFoE+xEhWTvXPq1zxofMuEo=;
        b=jQ4zOxdBF3G7kEmNN+aIgTRB8arBi2GEWsoRGFrFcd2XfBxVzIFCKbDAQSVnhAb9nq
         2O0fI/vvZI6ymBWxBvJ6WsO9UBc53EUz/4lNNRE3K9NvjqGlWs5XkkDmxDdy4Tao5B26
         TGx0RMjiHoLuKNnK6k88FFqtutODmtf8eeSv54N0lrhsnofpkqO2pqo/ywPKgULlGUCP
         HHftw9Ww6mTKXyjFvw8RoLQo9NazJ0NmNOIZbKnE2+zaZANSZSqnPc52flsqpmuLlNW9
         84GcL08ld98wheHNgT1uMiAR9Qs2vNBVvJDgJEmZGYZZKbYCOE7uJYIuOeQllw3ACwKJ
         Pv9Q==
X-Gm-Message-State: AOJu0YynTcmJRZCA3/TV1xDTWM4g2kc0P9rRQ4DWPmxJ6I4jiE/+bYnG
	edOo8fWHXqxuUW30fI96rT9KRmGAD4nNhNuVPIfn1F3G+hXJCIeNid7aLp094ntVXxSKRSfD+oI
	MWoJMH/r3vcr2yJq7gr8D0QBCSljeiWsIy7eOhKbqLhi5flUZLAuSwbT5e4GhAZQ5bcGI
X-Gm-Gg: ASbGnctEWq/QDQJxVEr9+2KNAOOuM00ROP9P+l1uAhKQbzBefujPMZRxLKfu+Fr5UZd
	A+pvH++zSIZ61JzxFtcPnjfMo9NKPlJqWBnd8mmLKjnnyNtB+VPI8D4ER8GOVLdlVd4q3PaTgrY
	Mm3oEeDi2fmwA1kpojkOfVCPExjC7gQv3UHCZig7rJ2LU3U/YBaWHQdJurHQC9YSorKzHNA8PGt
	qPX6kbjlcw+AYMH0xFFAvFAJnzI4ayLTOFWHjN158ylnQGyjt5PW8cCUGCQMuVtSj7YBTKOpaPo
	BXY6g+Xu3mMavEW25a+B6nw8GWqSrRBGa8DNazNzoOddeDy4oIxmSJBVwS46TW02XchemYMVYEw
	xqrJhp4+XkR1jPJC17Frq4Q==
X-Received: by 2002:a05:622a:314:b0:4b2:9c61:4925 with SMTP id d75a77b69052e-4b313f6f611mr137985561cf.11.1756901663145;
        Wed, 03 Sep 2025 05:14:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbGyRaZCILk5AbzkX5S7+FiK0ezTAsGQ11EcJB+LA2KwdbsAkKq1MEodJHRCgys5k9RkRULQ==
X-Received: by 2002:a05:622a:314:b0:4b2:9c61:4925 with SMTP id d75a77b69052e-4b313f6f611mr137985251cf.11.1756901662589;
        Wed, 03 Sep 2025 05:14:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046e6c630fsm97561366b.55.2025.09.03.05.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 05:14:22 -0700 (PDT)
Message-ID: <b4b6678b-46dd-4f57-9c26-ff0e4108bf79@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 14:14:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: lemans-evk: Add sound card
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250822131902.1848802-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822131902.1848802-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ncyGP5VyIrypHRSJfkpxaiRWMENcCtGM
X-Proofpoint-ORIG-GUID: ncyGP5VyIrypHRSJfkpxaiRWMENcCtGM
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b83120 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3ui42MrppmT3PW2QgFQA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX2TcxnX5KDWYI
 poep6nzmGSrZwaO22DpfUU1UyUyxD8V5abap5awEZjNX/FZXm3LgLIQp4mEEYULhV4S6PxfFCHz
 oVOS8fKhcyss8kNPi5E0gIgVhIs5qHw9la5W/vNVuTbfazWiYdNOaK1rK2jdxY/cajctROuM2gr
 wAf4F52OMr8UDgKWVg4C3Ci5tqMKPGb1MNGM+B177ACCQVHLNAw9jNcuc/vnvuQh+EPS2KVnS2T
 66Wd5Z7/G72Rv1PIanhLbE6xUPIOswM1ThiGzwSGsKEwDHn9Y9ZYdtAyXbX54VeZemoV/d4afcn
 dykGmfqio3mEBfyCUF2zOqmC1wv2BD4xRDDFk5zWqUdT0/610PATHt3JEn4u3Au/OICaJuyq/DY
 2U4GU+u5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On 8/22/25 3:19 PM, Mohammad Rafi Shaik wrote:
> Add the sound card node with tested playback over max98357a
> I2S speakers amplifier and I2S mic.
> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker amplifier is connected via HS0 and I2S
> microphones utilize the HS2 interface.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

