Return-Path: <linux-arm-msm+bounces-86728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC38CE5203
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 16:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDF6E300A36E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED752D0C8C;
	Sun, 28 Dec 2025 15:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/CuT1vp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtR6jzIU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDBC2D0C72
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766936648; cv=none; b=ngw1zor70YFmi5ikYqqVOutyiwH8/ViOcYh7r70GbxgqzfPOXGXh11g7bH2c48+YYOw1Ng0XqwubmXlaV1JAN+0GHwUzdQKGDsazjKtR7mq0Rp5hGf4uJ/q2uCUXJqwa00JeOjrBcF3hH5tIsLcCcuxHOSaGViAhhg82w83JnfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766936648; c=relaxed/simple;
	bh=MyPf3HVyRxvb60lZMD6KuvGT6pXi5grL8PVBYU+l/lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZbaqk2mHdkp5rxYqtnsBw3cmA6ZeXIrsurQlhyf+E+RRakzrRea33b1UZH7CwPW+34xVulvuJfnZeAbmqsYYKreRGGwT5SotVbiVCiFg6EB9WCkQJCviCSTSuhrHA3LyKcGilE3segvrfAAYlx4LW/lhRaWN0ESgoMHcXdfod0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/CuT1vp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtR6jzIU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS63E1Q1765606
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 15:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vt3ERzFRmaP+F7T8SqJsExii
	Vpavos6KKtOEhXUpS5k=; b=M/CuT1vp5Tcs1HtvE0IKQkNRpUnpBabOMIMGG3ZF
	S3Bh5Gcd5lC5kJFtkytZsnwCYzcgO1gZfupig0L7YWsBcqRvcftmyiNZhFnhrg6S
	7V+P1+wySSv+Z8OH5KC9AizhUlbn4V0xpZpkrLYq43zlP7gnIbYxQw57Dkd4ruwA
	4cg8a7r8UaGrpJzXi2h1HAHy+b4dqr/a8k7Jp4rr3moGVl8+Mlont1cxJzJllHXd
	l1M2pmfpMA/wJKvlA/r/T5mH8CQm8giQHkDWEov9jigFZi6IVJeTretWKo8vxoTD
	UArKlNzkaCXJY44N9msxOoShcJsitBaonaqdPNnvVVwqEQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7p1td85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 15:44:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso319582791cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766936645; x=1767541445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vt3ERzFRmaP+F7T8SqJsExiiVpavos6KKtOEhXUpS5k=;
        b=PtR6jzIU1+nlj3GrYBfBpOwtzqg9tR2HymaCaqlzv53nwChpLfmo1/pKaGm3bHwuuF
         uSiVEYQcrM1Fro3yFsCzcUgOjhBwgSrEcbkzYZyclOD8MaCUSANGx5Qd35JbPORYVEtx
         7kYnCV3/Xf9kLrV7khOa+/0qd7PqrHo3HOwXViXQx3H1pFAIT8OCDH95Tykw/KLWphQm
         UaynO/f4rFrROyiZK2Wq9JjrSIi0v/ZpbwQjgHX0yMCAftOzAWjylGpkgUf/e28mu7q+
         Sj36O1/BMWfZ4LTxf+uGg2QgFqlFe40CR3yQJGpA8pjC/fYfcuoeLp0Bdmi0o40TAgvZ
         kDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766936645; x=1767541445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vt3ERzFRmaP+F7T8SqJsExiiVpavos6KKtOEhXUpS5k=;
        b=OMLZvAToTWokhF/4Vb2U80ACx3JAZcBeOXtyYFeufKL40/qftS6cGB9SwzHsdvBvDz
         5fMe1BF+6Mk8NjPa+a40bH1S10RBnG/2UCBrOUZWevJpmVMaGXOadIuC6U5V0QQ/CcCH
         yrKE5lxyr7GputXjmMs2nk82LBaBqGXfWL8JjjQADSEH+8SmBR2yCgveu3kt3hsimTTt
         wuSR1d+Td35LXNp+/4S4Q98Vtb6kVSNqk3cIxJSK8D52+q7hyLw9Cf7sdWWQ0T4CWRGZ
         6iavGjJ9mRnqcCfgFzpyf01hATlmsKY9PqA8wCaaSJC3BOW78wiygxrE6VSi+XcHfQRG
         jdHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/wUv2YP3W8OcdnVAJpyFClgOjzWYbgSuMlb6htrQ+rZskFBHn+MzrOli72YG26hhqD5xc5qxar1pzJ6gn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7T9iW09sMfRjBLc13CWOWslla/B7RsVBVfL7Ex3Jv2/EzRhBA
	bQLuupjP2YCYvemBOmKXERBzxrZX7k70aecv1THGIMLRcM+36NPSI4o6UEFlX49PgKkRlWxKZH3
	1UADgKpgFEaVl8tX/w9pqolRATrHO09OtWBBvGl8WtFggVeVO3WuocVMZ4khr/r3r/6Z/
X-Gm-Gg: AY/fxX7Fie071QWEYZxckBFRwB17pv0XfsLjrst7R480jqpEq+vp2ZzBgbd/2WxozCf
	ZWbWSG4TMB1aV2osrN2kKLAHFQ9IHrr+nZ0NWRNTMvsI/wABITGLcVpZT1UGu/yJ9mxpx94gsCm
	mJhzoEvkdJDsa65F0ildWcgv96T+P4qKDqkbkRTfCj42S8YsPx7qsQMaMQQ53wjQbagcwkbzLJC
	QzcWHOhyE/i+XQUoCojbMKwUfIGM63abGsBDn3ESTTc0/DYGtpHVYz6xpuITKTmAhB8uDTSwvd7
	MzUih1fQ7ahlcMrAA/I/IYTdlel8gdXUErNXZJnQj41eFzm3cRCmR0rghoeuaMHN4HnTujBJnhC
	vuEoXm9o6L6RAUIKH/NcwdMxSoKeAZcHROehwIsJ3XDgfS9uRXKI2S2Gs7qevhvP5stCiZ9/vA5
	JRg+iFjpqRQAPdmKDQ6q1N4vg=
X-Received: by 2002:a05:622a:1650:b0:4ed:1af6:230e with SMTP id d75a77b69052e-4f4abd9cf7dmr431412851cf.56.1766936644755;
        Sun, 28 Dec 2025 07:44:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjPgUh9rVtjWbj8XpsjqmSrJurm/AxGi4MLoi+LEmZMWFinUu659NqLgcJmefJFeCVUVmZSg==
X-Received: by 2002:a05:622a:1650:b0:4ed:1af6:230e with SMTP id d75a77b69052e-4f4abd9cf7dmr431412641cf.56.1766936644358;
        Sun, 28 Dec 2025 07:44:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5f12sm8125706e87.3.2025.12.28.07.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 07:44:03 -0800 (PST)
Date: Sun, 28 Dec 2025 17:44:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: defconfig: Enable Lontium LT8713sx driver
Message-ID: <x2nd7fomiy46oi4kiftmuogvlcfyefqslgvz7r22neqgh5spln@icc2j5it6bdy>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
 <20251228-lt8713sx-bridge-linux-for-next-v3-2-3f77ad84d7d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228-lt8713sx-bridge-linux-for-next-v3-2-3f77ad84d7d1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bKv93sXzr7nxnvS3DTxkAeCuLC6EWXQG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE0MyBTYWx0ZWRfX1kCopGyuAz5W
 beJjdPzhR/VZw2X4x0gGck5Qv3coS8EXfDIjV/F8JNSxfZE5tRjhwkg6o6GXIAWMk4baKOvkSs8
 ohrl97goas0Y/BnCQj6dQJ/rKviNqE65VrRzasxtgO0MKx/2eI2CpHyZL7sRopZSQsdTDQlPhGP
 7/8OqmpMNuVFuRY6k0k3FXwgQZ9tswhsNotAoiTzRM+aUuHOKBqheas3UbxM54GE29aAc94Pf+r
 M6F4RglMZEaGkDKHgHd7G3Waxaglq7CGY6gABEesXZSZ2ddKq+bGx6A5pHtD70JpMjQ7iDmmwQF
 0cWqE56HQr9HeQ1f3JLrgQ9Tm88r9MPwB32C1HEcruU9qVJ7S3RLpxjHPqUdxddXwrBe5aHuVNR
 L5BS2zjBoB36rovhRmNf2QnrCw/rtAKIiaFGwk2gZJqycfuyTIn5n65BvYlahth7B94VwiEM7pu
 TKqJBAS61IB9DJ7pMOg==
X-Proofpoint-GUID: bKv93sXzr7nxnvS3DTxkAeCuLC6EWXQG
X-Authority-Analysis: v=2.4 cv=PKMCOPqC c=1 sm=1 tr=0 ts=69515045 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kbjQfm8kMj6zcM1R1AMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280143

On Sun, Dec 28, 2025 at 07:10:39PM +0530, Vishnu Saini wrote:
> Lontium LT8713sx DP bridge hub can be found on a Qualcomm
> Monaco EVK board for converting 1 DP to 3 DP output.
> 
> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

Does it really require two engineers to write a single defconfig line?

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 00d15233a72b..5f21bbdca902 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -958,6 +958,7 @@ CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
>  CONFIG_DRM_DISPLAY_CONNECTOR=m
>  CONFIG_DRM_FSL_LDB=m
>  CONFIG_DRM_ITE_IT6263=m
> +CONFIG_DRM_LONTIUM_LT8713SX=m
>  CONFIG_DRM_LONTIUM_LT8912B=m
>  CONFIG_DRM_LONTIUM_LT9611=m
>  CONFIG_DRM_LONTIUM_LT9611UXC=m
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

