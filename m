Return-Path: <linux-arm-msm+bounces-80190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CD2C2EF35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 03:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD00A4E5973
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 02:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2605323EA89;
	Tue,  4 Nov 2025 02:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2D4Ognc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1IfgGBX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB121DE4DC
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 02:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762222840; cv=none; b=qguFDEsARnlIoaP9L7XiO/GLK8yqD4Z1ffSG/rYs7ojAVOoEtdenI2lHulICHw0nOXLu+dlwHso5WdzNhK4Sq4Tpi5H6QH/4N3hOuBEq3MOrGlRTw5+jw0oDKxitmmEsRCf76OgZwg+lqm9j+6elrJfQ5afXIfZ4aLA10FgPl30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762222840; c=relaxed/simple;
	bh=ZRHc12eMCiH3WZmqYEuImQ2rsYDOuFv+OK5STVVSVNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNVD5lQqRGPF41cPzxslxbhXTU3tWNB6MVQZMxuTcAXnOaxWDUc7mbiIRhlCZihaP6F2B/4KQUzSnZZ08vbV1tv8UDSMqA2YqJ/kMD0eT4xRxFYIG9rBYXPg73PIpzFNbTfHX6lxoHvIm1eZP1oUHELRvRadpmwzKbt0LfOIDR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2D4Ognc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1IfgGBX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3H6QSs3693393
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 02:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Smv4w59hwrUUsoCZ4mHIORjS
	htFGNZtEAs7OQXRjdlo=; b=o2D4OgncJ2olf0YzZLd52pbXlgbAXhMRZORbf7Ea
	5pjzrR6Ms8M6416OTi2UQslIlyyAjJkxK+1pKNSZmYQ/nMU3RZjxmnG06vu0fzMO
	AwTVxyL7vIPqG0BBTMmltXpaoLLf3hBu8Nv34hXpJiwv2lHstkLyWN2AibzMGZeC
	Muc+KRMENfipE2IC5hQR//MhC2OdW/2Jn+L0AtRSNIgUczq6/bCo55YBj1l+XBEM
	jKmbJrwmODqI42Sc+qfQlrxZ+qNs8Cv2XQbWlkJMcPlFWJovvjlhlyOTjhdBFrm8
	B634GSiTWeLNREDoFJHItCchJyjDZiewB74P7rAyTWj0Nw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70gm9a6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 02:20:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8a54cd09b97so2171977785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 18:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762222837; x=1762827637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Smv4w59hwrUUsoCZ4mHIORjShtFGNZtEAs7OQXRjdlo=;
        b=A1IfgGBXYL4q9BBPchsJgoUGljGcWCdiXAWCrdXCh1oEN2rOJCE37a1L4m5bbF6lYF
         5OZ6brIK+qf6vdsuzVg/kJEaEuOTK98a9DAytK3+9nAmIc1vBjHqT+rDzxTsle6vE4RN
         i5wcbl7xlUIkZggodtBOICc0elV5xqmtccWcZrXDX37iPFgaQEZId9FoQ+4No6WGBYga
         I5u0rpRp6K0Zty5zLmGnF+atqfXbGTynvzCWuhcnHqcfOZn8+GgfQN/IcMf9et2hIO01
         7jrAi+sNiLu+cqiP0IwNZpctFO4ZBlBsZfZ9Y8SOUX3rkLHLBB8/dy0CCuNMmpzQZr73
         TkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762222837; x=1762827637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Smv4w59hwrUUsoCZ4mHIORjShtFGNZtEAs7OQXRjdlo=;
        b=AgzX5J7BMVuqMGmw9FNUfbRZJx4SiyqX38nbDyD6sa7++PE3BwH20NHYKc7mAw4vkp
         Uf21rqrJRd5sSuBszaDwR6LkUXxlBM0s64B/w+6mY4gmT0MUVu8/XTa+p1DZFd5DDpB7
         zubM8jr1oJp4IQbFEJWvASJzYjal/vaEtLg9dgp/ILg/DOq8KDor9YkrHN4ImVFpSXPt
         dAi6F47KpY/9Q6HcRC1yEdfYJvvPU7ZrEPmZB0oE8FHTlQh5N5/2kmg1tOFFUpHQvgta
         q1FKQ0B9HWzu9XX99hXT9dmclptdvA0Ntkn5xErPxJ99XJpkKDz5LD8RFIng4FC4P0Jb
         4ooQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK70Bie1eaLVc2IqBw3z9OFSo8FyFNdzUs0nyVDNgfaC2+bHowz3jQYJuoZ7uju1ExfmRjgf9B2p+TicZu@vger.kernel.org
X-Gm-Message-State: AOJu0YzAX/MJ6bfl1rskgF1MAeISm37GDg2QtE5JJ11XNAl8xa5QRSiB
	2IFBboaAXyzSruvgfopvy4N9JlqfBNusA3IAfK5nULNfgH3CnzF9j4umhAWzjq3LFreGkeAHMRK
	WkRJWZq8awjxKjpIsRf3KtN35EG17hof5aqPdCbt2aMQv4oo9fw/h+10Edzxkyr7ziFS5
X-Gm-Gg: ASbGncvFcYbBE6htuVmjQlIMyyKJtQw6weShGTqCDbdofznOVObTI599ucsXSXP7IYK
	CW2v9yzg0vUDn7+kPvccO4bfiYcIn8TbmGQZoDNWEN7MQ6bI5qkdlwaiiwIiIugdC3RhtVtE2WJ
	Rd4QIyWFlpBIDEF9YTXfuiUKMt3s4IiLRFllxkgN/rJueIxkVzbeSXeJM8d0ewtRPKDsJJbsCkn
	BG6gpDLlkUx7L0EmbtQE7VwaE1nUiEsRCNu1XMXFSz6dybWt+6ihQ6Xc8iFc6wwcqddt7GgJVSO
	mRt213hwBerkRF6MmNO9cJIULtidsFdFodiGYIk1Zoht5rDBg4hxpGb9q7vxwfoy9Cd8Tcjtm/9
	i6iTvdlUHW/F4170us+pi8watQ9rJV+ikhdxMnbsmK+ko3G1wCE2tNMJrs6R3Y7+t7ZTiTuFmbx
	l9L36oYsTo/gJW
X-Received: by 2002:a05:620a:4450:b0:85e:5fef:86fa with SMTP id af79cd13be357-8ab99498ba0mr1865073385a.28.1762222836837;
        Mon, 03 Nov 2025 18:20:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSh0oJyfXp/I4QiiOo9v+UZZ5w0epuOXbMS/ogXjwqb82itu/slRbk7NRccoWK4dymtR9Efg==
X-Received: by 2002:a05:620a:4450:b0:85e:5fef:86fa with SMTP id af79cd13be357-8ab99498ba0mr1865068585a.28.1762222835992;
        Mon, 03 Nov 2025 18:20:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594343b79bcsm356023e87.47.2025.11.03.18.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 18:20:34 -0800 (PST)
Date: Tue, 4 Nov 2025 04:20:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qrb2210-rb1: Add support for EDL
 reboot
Message-ID: <z3uy3kx6qx7tcca3psfocrlkrrtumlqyzivrstyxfhbp6lkxti@eeolpv64365x>
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
 <20251103182006.1158383-6-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103182006.1158383-6-loic.poulain@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Jv8Ovx9s0yaTGHnFtc3WlumVKIZxW3tv
X-Proofpoint-GUID: Jv8Ovx9s0yaTGHnFtc3WlumVKIZxW3tv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAxNyBTYWx0ZWRfXyDPMTSQMYdFx
 qaXf3Bx+v2B1eFke25192WCMq1VN/vNuzxbxCJzJoaXkyrZBGnXJP2s6D313b7WXrHrOUEUuakx
 wenSs3Z03iXaOps5DOmVdaU8KvLpriFxQymSvHwYUBb8f+ev8P3plSYCKzPUaNwCcInB/m8odqL
 NGMges0+sqdUujS/vyjx34a7pz4yomJji3HkH3GEOmPWZmfGiIVDAF7DNU7NEPzkrbr1hNMENEK
 z4E7lVdzSUeaTDiXDDYtebseCgXg0z6uU44xEwqohys+VRlR9WDddKQVndcUo7ZksL3Z5mT02v5
 UvJp/Vv1wrL9qmb5CHm+W8FTTwqvMEvUbGQ6F0VzQYfygyBkEVRnSN6mPEx6yXwJ69pK0KGtnoN
 MnjW1J8+SmJT8Zo8W3VpTQGVRIYb8A==
X-Authority-Analysis: v=2.4 cv=CeMFJbrl c=1 sm=1 tr=0 ts=690962f5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EJiAk-FnVJfypVwXgQoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040017

On Mon, Nov 03, 2025 at 07:20:06PM +0100, Loic Poulain wrote:
> EDL reboot mode can be configured via qcom-scm, enabling the platform
> to enter Emergency Download Mode for recovery purposes. Additionally,
> we enable PMIC-driven warm reset as the RB1 platform's PSCI interface
> lacks support for warm reset.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm4125.dtsi     | 2 +-
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> index cf8c822e80ce..5d84a3250481 100644
> --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> @@ -15,7 +15,7 @@ pmic@0 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		pon@800 {
> +		pon: pon@800 {
>  			compatible = "qcom,pm8916-pon";
>  			reg = <0x800>;
>  
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index b2e0fc5501c1..70c6c929bbd3 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -322,6 +322,10 @@ &pm4125_vbus {
>  	status = "okay";
>  };
>  
> +&pon {
> +	qcom,warm-reset;
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -510,6 +514,11 @@ pm4125_l22: l22 {
>  	};
>  };
>  
> +&scm {
> +	qcom,dload-mode = <&tcsr_regs 0x13000>;
> +	mode-edl = <0x1>;

Why are these a part of the board DT file rather than the SoC DT? I'd
assume that at least dload-mode is generic to all devices.

> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm4125_l20>;
>  	vqmmc-supply = <&pm4125_l14>;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

