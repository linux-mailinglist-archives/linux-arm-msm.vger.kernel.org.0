Return-Path: <linux-arm-msm+bounces-76191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC35BC10A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 12:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1391C189DDE5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 10:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAEB2D6636;
	Tue,  7 Oct 2025 10:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7bOiguQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E255619E7E2
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759833856; cv=none; b=Fh+jNYFwIFfsNMw7Ye7uzDUwcoceQL59G614zKCn+OzfJO1J+Ws82EUBxNzvTRWKHp9wWaHgjlVK7qPAigaC1HmQ/zO0FWzMSSaKdmfMvaU9kPtIxnyYSjXii7d6W4XAlbfEIayxlTDSyAa1SGnzPiCU0woAcWi+Iw9hjb0CZQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759833856; c=relaxed/simple;
	bh=tEzTFYsfmTotpGOcroEfG2QRzOXRVRs9LS7dQ7SLeaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRKHB6jmnatg7UU9jclA+Dvy3xC5xKJ+Tq0cUEmXuqVZH43IlxWMpPziyC3diYcgDmvzdmB995c2+kkB7o+4RM2ulzoWZicTDmpYsU5m7RRjGgVxYn/+hy8e+cHeGJvqhkqTeG1P1Ud68f0f8fPsbeneD1sHkCy5bx6LSN0q9Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7bOiguQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597A5gPL006173
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 10:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEzTFYsfmTotpGOcroEfG2QRzOXRVRs9LS7dQ7SLeaA=; b=O7bOiguQpSnuPcwT
	avAAPUKB/lvfpUOQ2TLKv8IPlELrvfmQwS1DhcamUu317pX13KA8bujbt0GgU3o3
	ue5Tw7uQxpuxZIyTVYHziWkkl212aN5X900YwTEGDPKjZy+ydMtm/duHyRb5yluk
	KR4WWFLrhBa4yZeUzAh2117seG4+I2tY6c/2b/njJ7u7X+8iCuBiRbbdem3uiwoL
	QPImyEimeTAcLGSY0e2Rfpx04A8Tu4HSo1QpGZhg81LE7WnS5hZHyJLW8wRPWnnR
	CehReSTJ2S6dvU89aDUCze9zMMpxBzYCV+qrtd7l4BDN6kIGksWHyHYeCpy7t/Mx
	y6E6Qw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6y0be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 10:44:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dc37a99897so15490631cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 03:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759833853; x=1760438653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tEzTFYsfmTotpGOcroEfG2QRzOXRVRs9LS7dQ7SLeaA=;
        b=uvQw/dO+DyUlx75XoGjbhxaQsFVqMtwlKrLgcguitotN+8df4mywsbALWEEhJw3MLp
         Ns6vpEwMRr3eAo2JZlPApFChgIAP1rSIZJd+bpwK6LGLe++BtrUEf+qEgja7Z8OsLQF4
         pnaatpbc8FgxYVLHAO2YolpCInz6KdK/vbWSdmsDip8NC6uzq5e+jx/fMnTewxa2KaXR
         r4UXqx3z6xKkgo99BeUNXeCdd1wXXpAQHo8xP9uV5EE3SATzLFZ99I5747mzhXMfSeko
         Z5Ts4NwaJGgUlLCmB1/Ru70WiPtmMH2/BqjZ1wX9ROWX+LsyMwu/Giwe6nPiNmemnOE5
         TKPA==
X-Forwarded-Encrypted: i=1; AJvYcCXeEVW0SVHB8KJHkHCeuDDK00VkFblO3tcwOLdlBly3s4wd0z19zLalYutti/hz558qesVV7Pu2WQRXg+y9@vger.kernel.org
X-Gm-Message-State: AOJu0YwS4qqMU7XGx7xRkcKBA3zpEoGUgwvTntxzo1RuuIO58cd7Zd5O
	I5KK5p7ydF4LNIMOhxG9z4JXl6B0ocsQnrDHjPeSj0AH9mm1DV2j05ihGJn053n2P/3/ZsIM4Mx
	+2NG9nxrGRH+fSpPN6tSQrbj6sj8p0YgNJ1f+3NtKVTJy4kMmk52NFufN/iEBJ8j09mZG
X-Gm-Gg: ASbGncseu/sYzMfMIf6XKfz+hIeV9T2Ch7Xc1exTT7WwZ/pWKtraQE4jhCFgXf5XYEC
	T1CeK7nC9fu3EmzPdcNdmkxQg07c4Gh2ZlWm8bsAG5D6FCZinyWcpmb8JnaVHZ/Z3M8qGh9oVoC
	JS5BbbbPo53Z3rAQtkxufocKHVr2d1d5LHu9uDC6cAG8mH84n2O+QdI7ikkm2Ail2LcPGa+Tbsi
	m/5BL0bjmkL2O/jTQ+0ivF51poblLeSdzBz8dJQABMkI5LuiUTN9n4wERbQFyTR2cnObDoRr/mW
	5UhPcXv2H+fjd+/Y0UxGZAJ8++iWmBbyNho3xFRTbikZc4NMyidYU5gYK2Gn6w5/jdKepzHBgF5
	x6TIoPy/7Oedyp/7Z8biATEZCHBQ=
X-Received: by 2002:a05:622a:10b:b0:4e0:3af:4e0e with SMTP id d75a77b69052e-4e576a82652mr142747741cf.5.1759833852823;
        Tue, 07 Oct 2025 03:44:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI56qcfMK4RSe4I5X9MhtuGJ6Iji7nF6p10dptreUulKjL5MYxLr5itidFjejQHJIj6jD+WA==
X-Received: by 2002:a05:622a:10b:b0:4e0:3af:4e0e with SMTP id d75a77b69052e-4e576a82652mr142747461cf.5.1759833852225;
        Tue, 07 Oct 2025 03:44:12 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6378811236csm12103474a12.42.2025.10.07.03.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:44:11 -0700 (PDT)
Message-ID: <0b7e71eb-1143-412e-a76e-b6f146cb60ed@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:44:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: qcom: camss: Add support for TPG common
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com>
 <20250925-camss_tpg-v4-1-d2eb099902c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-camss_tpg-v4-1-d2eb099902c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX3ASADUL3DNJM
 r2g+BS4Mc5wUn/x6duSCKm74tO8EerfsC+VOhn/dviZ9COf+/Guc0+8XAEPozUym/8aoFA5T/bH
 93FNkyHpcrhdxvQSGSFDUD9UI7VVd9NgVWkAANKLPbMZ/eDGCZmWkEKcL6bhNBjjKJJcjvXqNuX
 0pL5QEZbihlvDCv6yT6lmGG+ZMCeK79VLyV/aETlNhNEt85mpL/v/IvPbceByIqjnMwTsqIPmGI
 mBRDX3IasoIGSKBOOzKF0+bhbH2UNlr2Br1JVEF8TwFMJr4nple6Xh9QM42OHhuV48RuGP26ycS
 nycOmfNQ+vTa3bDDiGMSu0dCdKJoZC15ebzkAvNOxTdVsboH+O6nkb43+iCqKJzPWGkhGQUtU1l
 sWVoyG8HRbishDd610Xb9bsIyhAkxw==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e4eefd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=IOTsWFhAVgjdDaEP6ccA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Z2OEjdVF1IW0PT2RJCHIpKKiLHnj9WoK
X-Proofpoint-ORIG-GUID: Z2OEjdVF1IW0PT2RJCHIpKKiLHnj9WoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 9/25/25 2:31 AM, Wenmeng Liu wrote:
> Add support for TPG common, unlike CSID TPG, this TPG can

Is "TPG common" the actual name of the IP?

Konrad

