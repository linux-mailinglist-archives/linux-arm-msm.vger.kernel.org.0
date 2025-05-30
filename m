Return-Path: <linux-arm-msm+bounces-59877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD2AC8C74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 12:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 801D17A5166
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 10:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DABE221732;
	Fri, 30 May 2025 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cg7+edd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084049461
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602391; cv=none; b=mwPEfdkSclu/XwwuE89P+RfHanfVEXdbriB+gBRlOjtrrUHMtLrVJDKcrBdJItGenSwcsLLLcekIPwm1PxmqGp/JxX3IEWyHcOsaY/ze89vyacalYPy42VnHgk5Q9o5WB9CLb5P1hTyrMkLwcspRFQAZrpTZux3McWRo6ljeT08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602391; c=relaxed/simple;
	bh=BNi0Dd7a3ZFPlrWRHPsWBMyWUo7j4A0e2Uy8Euw5WRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWTppZ/T/V1kNKpCrwmuVCOatqkbeO6X0MIvNTLIPSyG8+b4EEZTv84iVHKDpG080hgnLsTngSiPwSjAfca6/b4AeOzk8AqxjvSt2V7tja5uZB7+wyucOJx9hUz65L2nTHlhlhiLmsbsnr+BisBoUFCzFSePFRFPihyBYBlLQ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cg7+edd0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAa1P6005273
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJVkXEX6v+g4dW/IugxFRNgld89BKF2lz5ziU7/jd94=; b=Cg7+edd0D++haUPz
	yKYCe2CmofYUebqtRccBKov60xcE10Zn3zxUZErfbuTsxCtXi4x+TDNaCmnWR6db
	hduWyepm//Ybez64ovFl6q4yE8nGudUfuVdQjOZntkMBlIUAk/TsmdoP7KfEt2i3
	HA9Oh107UCQRoX6KSfx/IZ21541DT9G5PrwJ7ePg5DD1dGHMrHZbwAvreqyDZ4kb
	Lv0h77qJTPrOXQeYRf/P/JsZ5VZOoeBqJDm74c6STrhUYou0sj2cQs+dZ3O/+mKw
	RqomKNqIFBl/xu00X1HjhH1R3XU/u1KE9wNrUtUwR4w8VTNrEk9RoB4jsg8HGpXi
	K7dU3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek8huu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:53:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0976a24ceso43434585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 03:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748602388; x=1749207188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJVkXEX6v+g4dW/IugxFRNgld89BKF2lz5ziU7/jd94=;
        b=HDJuhJ6jLovUpWoDA/ltBguVwxBW1Wdpnr9btD88gmhI4QqFGQat06H6MG93L9mAdd
         G/dhKgqhE+ZOwsFm7Lg6c9y7xYOKPnxZiQI4Je0kQ/GDo06zb2OckM8wD53vgC53kvXY
         IphmzQ/4S7JqOt2LVVUswBF91ARnbCMMK1A/8U74BIcGi+g9Gpo1uenmNT+nI7q7X2W/
         xgrLt2Api+CHyupML32i4pOquBJ8BTNL3gFAtIsxnADMfoS7ARnDPwk5v7j9g61NFs98
         gXEGCWFknjwUEKSz+MmPoF1N2LcP3gD1LrBF8tzWr3+JV7fIJYRa6OKm23BsvnZVaTNw
         cK/Q==
X-Gm-Message-State: AOJu0YxuDbRouaRAkjhRPu5nNimcDD90g9lkRMD79dDtuPB49XKLXVcS
	4ssLNgKBe1DLaNLtC6FEyDlb6hCKvRfCU0Vhh5cKhPj+V5w1a6BRxFzOtPfNiiVVTB6VmB/HP1K
	Hhj3jrlSnB3Q05qeqNfGE1cc2zX9hMNCJyZFq9CM2XcyKED4anwCDuCJv541/tceyEVd0
X-Gm-Gg: ASbGnctme4dM6mQi5uisqQzS88FAc4yxEGYkRi+c5aiT8LWVKM8mnonaHzkAfCsDcc6
	CuOCiDAQODpjmoWmPxTB4fgZ5JTdv4Wj2WoMMZlSeTqhSvIto6OOBLyP0+EyAWcZIjxWYv2Bxnl
	aJsZmDIID3negvmIZD9SbeQlrA5EXErjA4pvaaUZrjeHUvUzV48CeipAf60qV4USogVBQUmOT56
	eXJs8F/KFlDXRvXR65hkUZ5o2wytD1CNq+QU87s1EdMQXu14y45sKMVPk0ERxv+ar+BLCPS3W1g
	4K4kUGMpL/oRwqS4jLLB4hbXRpsvs4KwLyVm1USZkgygxwoy4BgqAlzKJff67B5vyw==
X-Received: by 2002:a05:620a:4110:b0:7d0:a0bd:d7ae with SMTP id af79cd13be357-7d0a3d7b291mr118256485a.5.1748602387865;
        Fri, 30 May 2025 03:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX+kHXUt2C/VW9tIjiRdPMxcEe2FZaJPTqu5+DoHzPVF0zM8rFm0up4eW5BqNb+FKxTf0v4A==
X-Received: by 2002:a05:620a:4110:b0:7d0:a0bd:d7ae with SMTP id af79cd13be357-7d0a3d7b291mr118255585a.5.1748602387501;
        Fri, 30 May 2025 03:53:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e870sm306935466b.53.2025.05.30.03.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 03:53:06 -0700 (PDT)
Message-ID: <bbc8522b-b261-44aa-9b8d-bb8127a71dc7@oss.qualcomm.com>
Date: Fri, 30 May 2025 12:53:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
 <20250528-ddr_stats_-v4-1-b4b7dae072dc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250528-ddr_stats_-v4-1-b4b7dae072dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68398e14 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=qHbP_aXdX6d-WoeHiv0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: OmEWa_Kg19gTtw2QpmNVUpV45pdsZelJ
X-Proofpoint-GUID: OmEWa_Kg19gTtw2QpmNVUpV45pdsZelJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5MyBTYWx0ZWRfX0pvHI1vmB9XS
 gqqteQIcJUgu5G3fgOVlb//Uwdut9d1QeWoSeT7P2spd2xxBgTU1ntzE/nEFpdtOec5KXUUeAgW
 nckUPP9T1XLRifq6dyIUBNEYh+y3ntX0QGxTlgA/pW5qquFa8N2Gmz27Br3mjNiQwH/DmwjnRTl
 C58TaxEIOVQsIXx22kd1lTirPiBZfLSh01TrkUzUbbwunwZu0rOhqWHtkFYsGGcJYqd/6JUeX/M
 c7DOXFKU/2OrJhGEQ7UlGeLJUd5US82aB4ogM39M+eWwVNGfVMAihJPRmhqz+kcjHHpxMig9fN/
 E2NNJpmqdH1U7XfMsB9LWHlfiloz8so6gtyCKEUledwqwaSPM7rtb4pZK1HO43XXh0chqmay9k0
 f4YHSL8y5CtXMnS8/XPd2xrFnUIDPu0NXE0A1Pv2Dj8cOphRhWIvdfIKs6NYQTjoy4055N8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=802 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300093

On 5/28/25 11:21 AM, Maulik Shah wrote:
> DDR statistic provide different DDR LPM and DDR frequency statistic.
> Add support to read from MSGRAM and display via debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

