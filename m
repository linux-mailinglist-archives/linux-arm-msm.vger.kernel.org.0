Return-Path: <linux-arm-msm+bounces-55119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC49A9886D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 943137A72CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FE826F44D;
	Wed, 23 Apr 2025 11:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBKh4NWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01241FF5E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745407434; cv=none; b=L8xjElcAq7yYY0AdyXb46CBeVkGGDFx18C49WnC34pAqYGBPVHOpnXl5XTc145DAIwk2U26+GBDSHZA2Gk4bms/9Ly0IGtDI8qCiKxc0uIdkH3StslLxWzbcv91/AlQwZij8ZQV2USncDxOrKcponeTVhV9v7mGn1tGalog1814=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745407434; c=relaxed/simple;
	bh=2z6jgr2mydmIuSZkOkN5LFizXc1g8MQjKJz15NS0Gtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AzcbDMrZCUPzPJGQ9VeohLKNHlsiUEiN1ghJpZ26Fb35xC+o8/RkaP5WaGgjGYfDE6lkbgrCay9Dm/uilbZfrfBRNVelDdq3AFw328vwfr7Vvhto+IhCvgk2Wb5TUk1ifNBpqR0lyPAE1UDvYbIPos+QE6s/a0cyFSJhQKFCDco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBKh4NWS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NA59sI024290
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZ4ckw9phUjE/33TkefvnOiLJnkaspW3ubnn0WXfC08=; b=SBKh4NWSJXTdsQ/x
	R169j8ZWbp3gYKHHMSmHOzPn2rmDMTwDQWkI4cJzvCAcqAhDii1ffZXbOHQYgnMm
	Hn7wb+GpNmwkEQPqzlT/QsbH3Ef9IjmaxjLxD8llKoQY/bishKeZftBAQ/Kos7ug
	qMfljaq1Q2kstPjCwrg+1RRvJmQRpdP+Vd+hTUzPgwRFH5TVusZM2Ei+6D5e5ObQ
	F73kpc4AQfOReVoW4ZTmpK8H6izxkJOjh9eeuQDrjeflKC31xIxDMSnOlwGNoZxM
	syjhvVCQy3r3rqCRRw5WMB4e7UuqW5ocWxoz/Ok68ejDIPOzyizEKRdva2Gk2+CM
	/Vsgmg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh11wpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:23:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c76062c513so121204285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 04:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407431; x=1746012231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZ4ckw9phUjE/33TkefvnOiLJnkaspW3ubnn0WXfC08=;
        b=F9dLXKAzN2HBzDbH5sqMbXwYDrZwdkhlDFrpzKFBqUP/AkvFWr49awHhiTz/rJmXGW
         JCs9tIvbxZ8bPJ4HPM6X+KkD2JSbfdvp283b/rZYBrvIM11+/beDN8lwkzs+BZIkgkQ2
         Wz5r+6ASkRNMrS2IJDOerjk++RxFgA/jrC/LpDufpqQJ6zviYiM8PSo4azyC8EI5a4mr
         WFzZ+mTpGbHXktRwtZ2Pe/maXfxcYPinbFz6/1w3/xLjO3TPYerVWrI2STTu3z8AYSK7
         oBMYnr4CFqdNtdK486WISFKiKzCWllYIZFcGt/2kdnm3XPeWjl1g9jWc1g/Ya1LmgVxH
         DVHg==
X-Forwarded-Encrypted: i=1; AJvYcCUg5033PntppfdsUllIp2WHo0qIKQG7HeFvd5mSwn8wD7WH/3Bw1V+QYrDSosVOX5+++mFPGB8I4asLQKif@vger.kernel.org
X-Gm-Message-State: AOJu0YwR86su6V5WLcO3snffacIm8Fu9e/34x12Hg8xttP16xd9vlNGv
	6ypD45reB5wdhEkzlLLSF/P4IQrDSjb+vCwcrMLGYkAJ5MDfxeIyhAwjvFiJW8udEDR+MtXo/uy
	AZNjRINQMNzDqNA8RdxPRWffuUDt32gKZI0MhMSKx2IjF4gIIusQHqrRcN0jpZ58M
X-Gm-Gg: ASbGncuEh+gKgNwkcr0/8ZnpUrLOzVqHHGJ0ioUbJKWitHaabLtvwY7nz7ZIQSUtxCs
	pC5gnQFBeaCiF664xLC9veQrJJFxDhsVuhD2pYbkRp4l4Cjpm4YKkrlWjL2yg0XHttJNs4SmMBz
	s3Fy7V/XJTts9p5cDtW3xNNZZNxOp3LiLIU4bQ7gFTbCGP9TylD70sE2q9+6MKI4YXHz+MIpxU5
	P58B12SgyBlaN75Lb9JHALi9QqhvKJUx8Meb4hoPLD4cToefSiZD/+K/JrzMENw/AFu0UWjEIN/
	Fa30Os5ImYS/W3aKZvBcqh3drmMYTXxt3qYaFSWYnQkpyXnS5BgDSaUDwwXPy784oO4=
X-Received: by 2002:a05:620a:390b:b0:7c3:c814:591d with SMTP id af79cd13be357-7c94d243e9bmr190753485a.1.1745407430784;
        Wed, 23 Apr 2025 04:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdIHiXpPDkGGBJDXfBBBsFTvUdPXz6hDe/XrnRasquYh3mWBJjmxvRBRjElMM6IUIxVffCBw==
X-Received: by 2002:a05:620a:390b:b0:7c3:c814:591d with SMTP id af79cd13be357-7c94d243e9bmr190750985a.1.1745407430388;
        Wed, 23 Apr 2025 04:23:50 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0b1d3sm785726966b.4.2025.04.23.04.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 04:23:49 -0700 (PDT)
Message-ID: <fc6b1fe6-7847-4aa8-838a-dbd0ad675412@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 13:23:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p: Set max link speed to Gen4
 for PCIe EP
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com
References: <20250423-update_phy-v1-0-30eb51703bb8@oss.qualcomm.com>
 <20250423-update_phy-v1-2-30eb51703bb8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-update_phy-v1-2-30eb51703bb8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dOkV2qSrZ7lWytEQw_Ibq1qwrSfTXSdO
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808cdc7 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=iRih2zsw3dMuVQupJ74A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: dOkV2qSrZ7lWytEQw_Ibq1qwrSfTXSdO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3OCBTYWx0ZWRfX7ghF7q+koccM mhfTJ2O6LrpfTrfX63WTQJqmDslGcoRq1QQlskHbrJwwmFDrn0J5ccVDIus2AOwN5PzkSE/QMEU bi9F2BEpns+LdgfytpFelzLNN3HOnxSmws+o3S9FJKzYwZwUzUMY97fisYGLKO57J+9P07FFMaB
 mSnMjQ58oPyPI4k+ParVWyseGltDU7SY2oagsNBUlLIsmKFu875JPrYcG8OAQShscnBbw1X+YWn Yf3Cg97N3Jl7mXKRCTFmBxZ4+qmBt7NZOAoC8qEGY9d9viZhNegRuCiveHYcKJGIsFuCEWQOuss 25ovkhNHRRCgrIANJyIzRDesRsi90apbKMVYpXsQ33vjoREKMR8avh13UE7Dsw1mWtJ7EcBFGEK
 eFDXp+WnK/+iPhv/jel6Lt772oFCyJSCLWj8bE33Z8wB115ZqSXX0HN5i6noi0rdKlfoLxH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230078

On 4/23/25 1:15 PM, Mrinmay Sarkar wrote:
> The maximum link speed was previously restricted to Gen3 due to
> the absence of Gen4 equalization support in the driver.
> 
> Add this change to set the maximum link speed to Gen4, as Gen4
> equalization support has now been added into the driver.
> 
> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 5bd0c03476b143444543c68cd1c1d475c3302555..65d9433a298f80eb782439120ad9c3c74025b441 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -6462,7 +6462,7 @@ pcie0_ep: pcie-ep@1c00000 {
>  		power-domains = <&gcc PCIE_0_GDSC>;
>  		phys = <&pcie0_phy>;
>  		phy-names = "pciephy";
> -		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
> +		max-link-speed = <4>;

The property may now be removed, as 4 is the value read out from
the hardware

Konrad

