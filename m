Return-Path: <linux-arm-msm+bounces-81837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EACCCC5CCAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7F02634E4C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8722C1786;
	Fri, 14 Nov 2025 11:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTFNbaoX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WieTaLlP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBE52FDC39
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118601; cv=none; b=SB+r9E9MnONeNvIMjnX4TT2TKoFcnXLWoTyzFJaZvcPsgqxQZlg/Om8j16hkA2VvHLRIF9BIRcDj4fe+vkdOH17sZZKD1n5xzXDXRlBeHsNMebHD76DHScrHZnMySui1TOoKgzTnbSx7SLzcZADLrebd5sriBhFKXLvvTB+aq04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118601; c=relaxed/simple;
	bh=EfkgRk3J9QxgqGSmdmFnagNzEvxljlFd770O4c7I7r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cr2LzEvNLRorT96G6AF8m3RDwpUsdl6ttyUAQMFZvUPykUGjjt+FfyTPByrvG4mkvHNvRoIIKG4s1tV3YF8oq12P1h3Xbn4Xb/9lLUDBpgm5RN8qGGfWVhexqc9sb8A90VCLCNUW2ayn6w8wNFez4qedvIeRCdoFBvofT0ZOYLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTFNbaoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WieTaLlP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8GYll1747910
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wBQSiX1AhTI3AktJtS/fpyR+
	9HhCjXN+yY5aI2My/+4=; b=bTFNbaoXVZhAKbQ5+pxaJIoOu6vmcVCWzmBDncO5
	4p1MAp52pUW9hV3VwYy2lyoEk8q2jhCgzBAKCHkCmXJ9ul4ac75oKkWPoH+cUkN2
	dwvHUYCUBXvcwuAfTHVgPF/BUYILVejQKGad0w/V2+UFe6WfdALf98fN4L/T1n2v
	awsj49FIMBudRKJZk2Pn6VI9cNwgsxwOg5Vl1L7MNnKG+TKlBtaJ7DFESPB67G0O
	MW2gycgt4/D0e41+sqyMja9Hm2GsMTFWeYjG1jBYEljBsAnFszL85Jc9k8fXP7po
	U2+IoHQyXSYcXYviUmHAkGgLioDRIXjGSVoh9y/oaGR6Ag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ehxvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:09:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-89eb8ee2a79so1106843585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118597; x=1763723397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wBQSiX1AhTI3AktJtS/fpyR+9HhCjXN+yY5aI2My/+4=;
        b=WieTaLlPCiQRawuOV4OWJLegAlODow304iGLjK67rjzBIFMqFL3gsB5cHG47WIAxBa
         An6/UezkipuZmo0C797hFB3A2OSSdD1an+MHzul9KjrdfIZmgCg51bXKRlVLNL27mlEK
         RjZnEYlmp4UOKNqpl+HjuVEQXM8KLACjMGvB/i+6Uw0AJrdKYI6jAbs/PR5utRq26DxH
         oPd3fs76prQMxdZlFbmdJrC733gw5vKvJAyJRsCWPF4u4HxNJLbCG9wTuq3eU+XCqutq
         cK+CYm2tyKkwEhRglyhlZdHgbRArWU8dSdIz+wc3EdlXwIty64R2cLhpBzFYsgh69utA
         ejsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118597; x=1763723397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBQSiX1AhTI3AktJtS/fpyR+9HhCjXN+yY5aI2My/+4=;
        b=kMqbUsnE+eqJ8oJc/cFj39Fb1yjhHnU/2wja7mEhzMckytDIFW6iXOPwJE35LNVwm3
         NRII/6fuzzLHJeYBoRfx1Kl/htjnHNUy4NV7zhdDX/6tkGg84DuzNmkDIq3aUyqIkTLQ
         cLO9CiWM4KqC3Nt+jhG6f7asfArQ9HFMaUVtlAH3iz1BLQq6mNPDmzGZ9FK99bcB7tVx
         5nOZyGmmYaN3bzwAKbEB2UrtBe5kHhD1Xcr0XgFfP5nHRvRXRtmxv24FhRrWn0ut/u6t
         kO6FykrDlK5nNr5X9DbpgpAmRl190VXq8RDnUPIsJiP+e6lGbqxaxqNhlcp6KMtfT4f6
         U1Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXgxBpqw03MpfULI9Ld0XRnuxC7FB9Y2QGOzwJbXedr1uky0oIfqJWPk08mgaqD3bRnLfhSR1+CCi00GqM/@vger.kernel.org
X-Gm-Message-State: AOJu0YwuQHP9Ce8QUnLOW0kTZ7wZ4+J4HIQrzuo6gY4z7oy2Ygp2tt53
	9CiNhj3EwuFOQFvxzW+ngZd/mXcsVuQ0YhZ1QEJtQxPV1ihL+aagOca033rrpCMVIxphBWOisVr
	mTQSGe5GGnLUzDpiYw7qNqfe9R4hC+R6omFla1aChPhIeylsSO+xwqmHa6oj+HESeU8qI
X-Gm-Gg: ASbGnctEfa5O8h76R4Ie2W4187K3UgvFiz8qWpVFAp8BkwNWH4lFoSPd4RBwJTcJ/Ji
	KZVbSKAkAHZoJXjnA0GkZaXOEc2H2lpM00UmvVmTCH86KaGSzzcJlzbibHd7A3MhRZ6p04Vayeb
	L/MPchcE/ubFJ5paLhH91VzmEu3pI29m0uAE5TX1ay6dcZASch5/HCO7snU/23aiZwICv+iTZiH
	UaC89b/tDy+vp6MFJS6K5GyAkjIAvLsHhwU8VQkOLxw4acEGckYZPYkeUlPZ+SbbJUWoBWiXXgr
	JiXeb1odGGfK3IzfUHGW5ZijXPsryQ6nTIS7ddZse1xvayj74kW7dS/YBem5knpgiwIhPhu5Wsi
	gylROMOcG5zwlPA3/I7z+4WT/c4B6CxTOcC4KKZIk1YiuGi0OfgJDfOVzCisS3RkOoEF1YrzHN3
	CwwI9yOeWXY0gS
X-Received: by 2002:ac8:7d85:0:b0:4eb:a24d:8c24 with SMTP id d75a77b69052e-4edf2142ad2mr38875051cf.67.1763118597504;
        Fri, 14 Nov 2025 03:09:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFK+9+SvZia4jqDbTaZLAogfJK22m9sm1NMlYIXS3avqIBT31C2rlTSqkAFJsulJpvfGYAB8g==
X-Received: by 2002:ac8:7d85:0:b0:4eb:a24d:8c24 with SMTP id d75a77b69052e-4edf2142ad2mr38874601cf.67.1763118597067;
        Fri, 14 Nov 2025 03:09:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040d89csm979331e87.107.2025.11.14.03.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:09:56 -0800 (PST)
Date: Fri, 14 Nov 2025 13:09:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tingguo Cheng <tingguoc@hu-tingguoc-lv.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
        kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: enable pwm rg leds
Message-ID: <2pl6xvgotxwesfujlriq55sbwhy23yzna42p46ylh3apqmuop3@wtn6wsjzmxzr>
References: <20251114-add-rgb-led-for-hamoa-iot-evk-v3-1-5df1fcd68374@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-add-rgb-led-for-hamoa-iot-evk-v3-1-5df1fcd68374@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4NyBTYWx0ZWRfX3f5+PtNPT0nf
 Xd54LNJ3VGCoNdpBzx0EPgWaAQdQv0GWeXsYQgf8uu/BW7Vq77F82Afu47Q5fM8icD98KW3jOsl
 L9qZijqekNicY//FbpmwVR/e+/QnqPT1Ba1Rl4siT40yaInHzqd8YtNXFzy8c3OWgzWt0Coxhjj
 FdQ6ZbLANCGkhwp8zyfV7r9+s8a/PCn2EGUKXU6cvlf1bxbebQgyajPQHnvC/Ss1LyIgeyD7Rol
 rimn0JfoKLBqqiOg8qJ7RBVGVWsj6Jgugx/cKeQwFzZ0pAnSfmOqCh/L2SdFdqwOYEZAUzC+yli
 hQ8Ly5gpMrw+04TQIvNm6QxmR6TYdTxhElX5j9XsFuJn99G5kw8HSeADsyg9LParMGP2ZueYm3c
 UdvYclwIInZlw7Hi61htHUkwcd8xQg==
X-Proofpoint-ORIG-GUID: KtQaj7YRq39WSmw7RwY00dMPcKOUBDQJ
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=69170e06 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OI_lq_Cb0pO6qaT_r8AA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: KtQaj7YRq39WSmw7RwY00dMPcKOUBDQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140087

On Fri, Nov 14, 2025 at 12:13:03AM -0800, Tingguo Cheng wrote:
> From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> 
> Add RED and GREEN LED channels for the RGB device connected to PMC8380C
> PWM-LED pins. Omit BLUE channel to match default hardware setup where
> it's tied to EDL indicator.
> 
> Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> ---
> Changes in v3:
> - Rebased on next-20251113.
> - Validated the function based on the patch "[PATCH] leds: rgb: leds-qcom-lpg: Allow LED_COLOR_ID_MULTI".
> - Link to v2: https://lore.kernel.org/r/20251030-add-rgb-led-for-hamoa-iot-evk-v2-1-3b3326784d7b@oss.qualcomm.com
> 
> Changes in v2:
> - Rebased on next-20251030.
> - Remove BLUE led channel to align with the default hardware configuration.
> - Link to v1: https://lore.kernel.org/r/20251017-add-rgb-led-for-hamoa-iot-evk-v1-1-6df8c109da57@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Commit subject: PWM, RG, LEDs.

-- 
With best wishes
Dmitry

