Return-Path: <linux-arm-msm+bounces-89565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C37E0D39ED2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 07:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 599DF3052201
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 06:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B278270ED2;
	Mon, 19 Jan 2026 06:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFATkz3v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/LQ+OPc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C992242D9D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804762; cv=none; b=QMBkDDHdJ8+P5hgp3M/BO4D83WVcY2eRROIGrMCkUQ98ihuY7IFmZv+SzfQr++k8D7W7wLU83QKnFoIG8GDhZW5JgH9iGG19GnjFBs7a3rPRU3kgBA1GAfJsLOycOH4/tXMbh9GxW4KCJhoG4SeB80bbIgiXrVCgrGxb7zYnv38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804762; c=relaxed/simple;
	bh=cdoIc5vD89kFd3CSCwCjRq+7uAe4L+ntCB8WZ7mF/r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dy0a2erKaY8FWUxPHK/K30refb9GX/Nhp0a6jf0BpwLq102Xk8dYjYIDpA3sExeGj0w5IJHMdOkTPr2ilXQsttNlmDZ2ntd37OoLVK/qWUGw7bFazQkXD6dxt98hySy9SEgmQdyh9d0pwZq/EfBV426MT34dtbtZsMmFLCL1m5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFATkz3v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/LQ+OPc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IMjUW94034204
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IA/eo2iVwvXN/TKZSuoLgwo8
	wSFQC43ZkLYtHdqBfws=; b=gFATkz3vD73RP3r2k/+R/W09xigfPTs6w8baLvM7
	HIoxueF9JanZrBYDu5Syh3Gg+h38kxwbehZ53HXhhTclUAG7vJOBHyHQ6Vs3xtrl
	DD4Nhj4SB7vBJmirTjpf78sOXGm/hGMlHQZOHlF3TjhCsGhYGRTTsq4hTpX2Cze0
	A4um35Zd7MYM0cM7Iyc1p1Nj8C/+8fKxpbaqWQOC7R6WCHQfx6ot5CuOJ0qwSc3b
	Yj0sC2beMM1OJUOhAYPBGErbqN5yX72KE9v5JRhUt9Mjo7qK2hMD0XANLu0P1oSm
	lzLNDo8kCS3xB6bm/XFR6h1clwhW/ct0mUVmzCMdck2fgA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e4a4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:39:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52dcf85b2so151485785a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 22:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768804741; x=1769409541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IA/eo2iVwvXN/TKZSuoLgwo8wSFQC43ZkLYtHdqBfws=;
        b=Q/LQ+OPc2oNFR/oIoBMohF5HMcr2dSuL+uexYQxi5P3z+WwKcpBmJCo5oSkXQOFniG
         18CvsGknHuUrCQHfudFHajbg+ygcgpqFrAx34tDOp9adVT713hxLV8eySGvVQs52B5kU
         06lKkW2Xeu83CcgNjZBG3EugkVcWb2yIZL2sPvpbsfyNwB/zaQDociygPOW10R7X78jD
         ozJu6MV2wk7ThMhXchDF1HFE9kVDLgcUX8uyYW+B9NUeYCHP7n800xPdy23SO+ki6Ec+
         uk33QItCUFAic/jvITrjbewqqOq3mo5pQ5bW22/W3uABoruwhblcRBKPqv1Ah1FwjnGl
         ecyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804741; x=1769409541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IA/eo2iVwvXN/TKZSuoLgwo8wSFQC43ZkLYtHdqBfws=;
        b=DkfKBFQPPEmgoAAmswb6QMPVVpX5sp6uxYpzJSnPkwoBhIqTfJdmgxeKqoay4RZMXi
         lFIQLgcreN++6KJRZinVNtiKbE3mun0bYDeRgkGezTyxQBumdw/pIbmnwX5JZWen+j1Q
         +FG1kiesaTwEZJLUD6/5uYSrd1EWwfJEecAC0yaREKkzIt3EkZKkHANNHR6WTNpE5bZC
         bjaipdzheOlOABieLIWHqRzH+iBdSU4JFlVkWyX1o0QjSDcsoa529NU/fBBbSsI/cZ9V
         GGkpXLHRcj7MTrRRd0k0ge8DoizhKAUHT7MoEzAOpkmPZbg7DZt/VKJK6ha5UpxUGsMP
         ilUg==
X-Forwarded-Encrypted: i=1; AJvYcCUA2xTUvlXKGItQ1WV9XlkXWL3QOC+HkkNhHHgd2A1mSjrbR7Cbn5DdP/l22uYQPRBdArm3crVmRrDx2Qdg@vger.kernel.org
X-Gm-Message-State: AOJu0YxelBfYxb6SGnohhkQEPzGFcZY2lJCKjE9MHCKOaXg6H98KDpbI
	zzf7UlhceD5BwUrWnZi8BMqyWc/vyna8oiniSbhjVfxVpwBxfqs8t+M4s2PS04DbMj3c0aG7eFv
	GQfXaDRgbgxvoUTBkJJDpWbixgOepewasdrXARrNV8oKEIRdGOcn8Fbg8gsX3k7cu+gKq
X-Gm-Gg: AY/fxX4SVvkYWc1zwkRL/Ano1KIGkRJVBZqg5FAEJ9krH1QL3KGZ0ueP1aUVyng6bOE
	cAx8I3f0JTn8sOPvxvwYq9oKC2r780JLsdMcLTqlnDIl+Qw6qhNhdXKfEAob63QV0yaq4WDw++h
	cLwrlyeLlLjW7xmF8Po4+iajWjDftCeA3KMXZKLxNSe85DVCwFhy6kISwQq3galnzIQ68HwTwih
	b6+1dP1DE/NxpWzR90lHknOFwKHvhf23AcVTmQBS3UvmYUiV0VQp0UftbLfO/MLoIM5UhDFKFSd
	TWuG/Ynu8I4MaSyb4tws11llqUHWA71I3yrrVDYpr/bCzALXd33QfRQZ09KcwSRglp9SQttA1Ov
	7cRrXGGiIIH546UABhOSNqeUYkYzLQkh41wky9STqLFmMoetKxMkjJF+80b9LbIAw2sfIk4ZJf8
	nugZZegsxC/mEdk94BkTaK9tQ=
X-Received: by 2002:a05:620a:4490:b0:8c5:c9a0:ac28 with SMTP id af79cd13be357-8c6a68ea37dmr1359568385a.21.1768804741500;
        Sun, 18 Jan 2026 22:39:01 -0800 (PST)
X-Received: by 2002:a05:620a:4490:b0:8c5:c9a0:ac28 with SMTP id af79cd13be357-8c6a68ea37dmr1359566985a.21.1768804740997;
        Sun, 18 Jan 2026 22:39:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a6dd9sm3083719e87.101.2026.01.18.22.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:39:00 -0800 (PST)
Date: Mon, 19 Jan 2026 08:38:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Sebastian Reichel <sre@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: supply: qcom_battmgr: Recognize "LiP" as
 lithium-polymer
Message-ID: <bih6lxs4u7q2kfe4kmid35cpmnqmvjltvzv4wrowah6x7v3tth@kptyk7bnmnhv>
References: <20260117210941.6219-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117210941.6219-1-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696dd198 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1UYfKuQU2Z-oU-oOffMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1MiBTYWx0ZWRfX5OfuK9gHwW09
 uQB9yn4SqCuDUmtnYYqLRqsXe4BgVs7FDbg+oR9SObC1EdeXq01buz7OWcm4V1bm8nUrKqQqdwF
 VO6Yi0gDwfVR3JsM94qOV4bAFfYKrbk2jfinVhwVIZkAtE+AR+CZbYeW8lWTVGO/Vi6T4pv3Wb4
 rsVlivSu05/BHU4yzPOeAltsyiKLoJPmVoS1mPTTaZ49kbSRS7fQYLbo1IPwrYiUcEbyV1TT7hQ
 X8OS9xiJUB+ATGnheQsPPcMMaoeupDao+zN9AuGAeEQehxdmOpaLl9E6o+aBYZbTcHOJTsqiar7
 IXNtdVF0VI7lVKc4O1xo8QHcYAXWWuytWAkvgMw8AhVVVtPiYNE96SWxLTiB+PcKwsPyQH1KkTn
 jU6furFlHfe7FfwERLce57QIgTRp78JePv8tx+62CXzB18cgwqSpX2u2aCLTagO33xKBlkVwmI9
 +K7NbnDCCUMdEun4hVQ==
X-Proofpoint-GUID: bp_ZD9kTyQJAkxTXE1sH2OM7fmaQIR7b
X-Proofpoint-ORIG-GUID: bp_ZD9kTyQJAkxTXE1sH2OM7fmaQIR7b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190052

On Sat, Jan 17, 2026 at 06:09:24PM -0300, Val Packett wrote:
> On the Dell Latitude 7455, the firmware uses "LiP" with a lowercase 'i'
> for the battery chemistry type, but only all-uppercase "LIP" was being
> recognized. Add the CamelCase variant to the check to fix the "Unknown
> battery technology" warning.
> 
> Fixes: 202ac22b8e2e ("power: supply: qcom_battmgr: Add lithium-polymer entry")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/power/supply/qcom_battmgr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index c8028606bba0..80e701c66434 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -1240,7 +1240,8 @@ static unsigned int qcom_battmgr_sc8280xp_parse_technology(const char *chemistry
>  	if ((!strncmp(chemistry, "LIO", BATTMGR_CHEMISTRY_LEN)) ||
>  	    (!strncmp(chemistry, "OOI", BATTMGR_CHEMISTRY_LEN)))
>  		return POWER_SUPPLY_TECHNOLOGY_LION;
> -	if (!strncmp(chemistry, "LIP", BATTMGR_CHEMISTRY_LEN))
> +	if (!strncmp(chemistry, "LIP", BATTMGR_CHEMISTRY_LEN) ||
> +	    (!strncmp(chemistry, "LiP", BATTMGR_CHEMISTRY_LEN)))

Why do you have extra brackets around the second strncmp?

>  		return POWER_SUPPLY_TECHNOLOGY_LIPO;
>  
>  	pr_err("Unknown battery technology '%s'\n", chemistry);
> -- 
> 2.51.2
> 

-- 
With best wishes
Dmitry

