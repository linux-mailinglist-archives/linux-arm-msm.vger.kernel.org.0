Return-Path: <linux-arm-msm+bounces-98584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNmjIJtlu2lVjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:55:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FD92C52DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D1A330A9040
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 02:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA6638757C;
	Thu, 19 Mar 2026 02:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx0ie2pf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4BYY0LY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAC6387587
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888854; cv=none; b=qYOGVRO8ZBKOImP2Dxp5eyhBkGp2MkLNA4Vn8knzTx6keZ/qykleJVBZjwXxyvvlzzKgjfErpCq7PKT2t2tyt8lzahigtHLq5SHXOJgYifB25aBjbk47n+X5NxM1c52Xgf0OA8bzXLQ6gkkzYk/hoDCjjsktuxOmhoEqPb6L5CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888854; c=relaxed/simple;
	bh=cwtugtBfxOb1exevIwwKfGheyVyy+1Dk7e+nOb7j+zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcQ4HkbE6mtiQgH6Lfp1khcWlLYMlp9YgOvalzmkvPqofzgrTeZmntR9zpbFYV1D8DiCSQeyetaKMnDSn8r8aTvHrH0QZvRC17ZLmwRTvR7NL0w5dyG2NEFh3jCWKLVXYiBlELZYa1DnBIrHOM+6Nb22TXEr6+THHs8SFEbXizw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx0ie2pf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4BYY0LY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62INXiMH4024343
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zr55jwjPMr4CipN/1sygJnvq
	rz4xwfpiIiHPxxrHDZg=; b=hx0ie2pfmgdGEhRAVhR9FDl2jhZcnRl6Ppzx868m
	iofY9UgiaU54YSIuaJvbiKsFaTwSydwa1ORGyJcmynTGr3ADtW5orx9ved2cO4DU
	o1pYfo9s1zlqYSRCWjK/CUzaLmRP2yGq7BgsPZn13RT2qBHvZpE27Q8Fr7o0E1Tw
	/FIegp58HHQUURYCmlxoqy3IWo+ebDpiua3AEE/M3zU6NFxdHyzfgGXIFfvz/kM1
	p0bwMRlkRT4Cx4PDdQI0c26QNE5VQriky3aURkMRBXPZ+T1B/a3UWyvhUa8ntjxx
	8mumGVis6JS9VVZlMN8des93uVw4lCa5DPSl4QNEvK1/YA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75su89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:54:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093b19111fso13175161cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 19:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773888850; x=1774493650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zr55jwjPMr4CipN/1sygJnvqrz4xwfpiIiHPxxrHDZg=;
        b=E4BYY0LYwXXJfyOn5eM6/TYWcrrk1kkKymQuIyEhN3ZmRJI19bfHsri2T+Ub+nwwa+
         SZiDF40TYzWBxWffTccF9GulVOz2fKS13ahuCp2mB3c5MV9TePg1tgmnb4zCupmyIKgy
         gVHpG63m9U4BXZF7f5UD/2wM+vI5gpUIedtpuNMc5UdDYlX4memelFkyf2ca8Ba0+g6I
         Fr7A3/G59n15WVZ5ZXTImR7jOK9eZXUlLXXYkmxrKUZSmbTQ3H1Y4mW9RMrlO8gaoc3D
         Ri2rlTbrqYX8ntIPcQB360NQrBwVKcTrpDnzR2GdnHOPPLdeYSxspoXfZ1EcbjwzyTHh
         y7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773888850; x=1774493650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zr55jwjPMr4CipN/1sygJnvqrz4xwfpiIiHPxxrHDZg=;
        b=nQDcHaQyHcTLYSC7YBQKfCnHtDYZuRlgsuL6vGJDS1xMzRQ/yrNq+HZUtxyyozuSuF
         OMuoBOOKQynw23ia3kR5Qj3GGZbdJrdNArklxbiRpRBQhc23WssRaCPFXQOlndmL1s4z
         A7QGpWhJ8ZcaQkUXNI5Ce37LoWpR0T1i6GW8Q5ywWYkATyAIPac29vGiKrrceE7SId0k
         1mUeJHp5oJwPDarAwLCJJcj6vMgKS1wz8WbueFYRiV9Hb+cKw8G5mW1hsds83uwkRXTe
         Y7Zaevsb5p5SCoaSRT+snkC78OYAvsrEdzwchvx/HAcG+V+nO+BxLpJrI9Q1MeG7NMD5
         mUBA==
X-Forwarded-Encrypted: i=1; AJvYcCV249cGwz+XFiZ0RDo1tlCq9wCaYCW0slYmOgq4/CIkRRdsCaxB/Gg/qMzf+/1dAvkzqpbGUoPUB1WAg4d4@vger.kernel.org
X-Gm-Message-State: AOJu0YyMsByDYRbexpPTABVq3GHj8+Gss7rWIi4/6y4buJ6SNRczYONH
	6VDYeVG8diwQ9gQO8HQD0WExUs+YjTo2WXY+MIAKHf2jaJofkypc8eIKrOmTZ1mjFzgb2mPIteA
	kN3n2j1dmCb+hWCNM9eMTXbl1lrro2awaayrzeB/gh5+WtKB2cJk41neJ+3bux04OD+sw
X-Gm-Gg: ATEYQzzwYLYrhjyfPAAoue3M6meifov3EOsnJ2DT3fYpXqvwxYPKhOKJ+Ri1/SddK3/
	hFIXP4FOtgVkc0pmXq38p6Vw5y8oT+FIdf4oSsm5t0YhjYUeM4JDQnVIK9A0+i0YW4fWQ0GyVtx
	RHtz8EgsyQAvHowzO6CrDy8NMF0CXdgHSKewA4LPIHyxqhEJdYb+hwi98+scpYbOTC95aloxUM9
	tL+zqubmAv8Zd3MalOqPcl6Am6l17cDqH7LHn25qIVp0DEoqOIJFkRo1nGleKHeJDN+Pq+4Q7fr
	nYsf2CcMv4WdYLeZMBC+fdvOEC2ANQWU1HJvqDRw/MptvKr/Qg5HTZBDYcHbaYjXPGnqfOU2SOF
	oC37Ydrr/gSgCJwXkw3ME+yhJEAF2+TRHBnsTIkHNWHA3HzJVyBg8BIMXWF3gSV+1WzRT6ZCEOx
	AMLXG1k1CbBk0VRndyeUVEshunZJHp861VLu4=
X-Received: by 2002:ac8:59cb:0:b0:508:ff31:47f1 with SMTP id d75a77b69052e-50b14889319mr77055201cf.50.1773888850371;
        Wed, 18 Mar 2026 19:54:10 -0700 (PDT)
X-Received: by 2002:ac8:59cb:0:b0:508:ff31:47f1 with SMTP id d75a77b69052e-50b14889319mr77054921cf.50.1773888849825;
        Wed, 18 Mar 2026 19:54:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd5157108sm9573101fa.1.2026.03.18.19.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 19:54:07 -0700 (PDT)
Date: Thu, 19 Mar 2026 04:54:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <jin2ecagomu2npjnqr6ejpair6d4uam3djznuaodjijqi6hilk@64ddbqaezuah>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
 <20260318-rimob-new-features-v2-3-c1bf8917449e@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-rimob-new-features-v2-3-c1bf8917449e@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAyMCBTYWx0ZWRfX1x1HGxP8+F2a
 LXUw8uUWfdv+ptVOieYZiMaMrTArL0ME+cYpwHUd2N/slta5XPzo4QTcP69/7Yhvkh+h268lybV
 kdSrC2dEC2k56NEYLEQnUXtmwozrS2+Mgv9T3CY7c6F4kj5xXR+FaYZZdnJbJ2AgeJsd3Uz41mX
 3LZde1SnDlWrlDIki/ni6iT2vkdkk/IQcxLkpNv+39CXUrpTC6ILSfDQwPFauGNUXimyGLrHupT
 u6otidF3iyZcQBvOEobKFxMgbXm005dlxAFNXLZtYQwQz3MgBlQC68CBqOkMSs4swca2gZWhXXr
 mOfE7Aa5i2Nf9m4GaD8ftD7BCOaTcRNatBPYLDqDmzBDAR5Hb0dOpMumzX6naaxX6Slx+QM4BN6
 BxpVea8Oj45qBLndrZywbQuQAteAcec7rvu2OBc5Bs9fIVbKvUET73SIaQoFytUnLxbmbGE6XVa
 PwCMalE9v/5puhJzSJg==
X-Proofpoint-ORIG-GUID: m-fGucb07mlVqR51rasVzsfuQGpq6i9Y
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bb6553 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=sfOm8-O8AAAA:8 a=QiVCaVSgwpAuPVqWOeAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: m-fGucb07mlVqR51rasVzsfuQGpq6i9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190020
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98584-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.948];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0FD92C52DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 11:28:11PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 74 ++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> index ef4faf763132..de287c8e9686 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> @@ -78,6 +78,13 @@ vph_pwr: vph-pwr-regulator {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/msm8953/flipkart/rimob/a506_zap.mdt";

.mbn, please. You can use https://github.com/linux-msm/pil-squasher to
squash .mdt+.bNN into .mbn.

> +};
>  
>  &hsusb_phy {
>  	vdd-supply = <&pm8953_l3>;

-- 
With best wishes
Dmitry

