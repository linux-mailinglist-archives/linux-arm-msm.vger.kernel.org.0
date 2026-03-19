Return-Path: <linux-arm-msm+bounces-98823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBjAIJVmvGnQyAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 22:11:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF58C2D28B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 22:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB5A43096F88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 21:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDBE35F5E6;
	Thu, 19 Mar 2026 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEX5Wntf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxNZd/0h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5EE3FAE1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 21:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773954690; cv=none; b=nZGJiSxQZRyFAQNYomo7TjXRJvUqZ+iABMG2jwErShO0AO70gzvilOZWFBk09hsnso52KahpF1C9/3Es2T5H8Nx0jge1kP6hwPPEPWjLB7ZEF1lp+MmyqiKYDZkW2feQonJaBDcPRHHX6mcpqQCziywEmyLrAK6rnKpKMtK9Um8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773954690; c=relaxed/simple;
	bh=XHHaVpErCnjT7aF1k/cRXYednZKCwp6cO1wqquwL0XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZz3Z1HRZnZsN7Qj7vO0NDQKNRXPMq3GHm1TiXUBEJOgE78/99llUPH+S9sYdEeJwvpNctpbNkts0odUkveTJJZ/F7XttPB+EAjXHcvwHa3lsdMmHtZu9i8bHB3VyBzTPXbk+XxgoloI33OghOin/jJlltQeDoBnBbfklX1YpNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEX5Wntf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxNZd/0h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JG6g8D920769
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 21:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Otb8v9RQVroNjZwJ0anB8GeB
	ecz+Y85WoWGferNtfVc=; b=kEX5WntfUxFhm6kJ3n0yf0yspQQet1uDklpAQNmP
	JnMa+Djr09dcAQlEZ9p3rITrWgSulqKl88UvYudmOvGuvcrgmKfYonUzigfbXDyp
	A5BsewouWFhIVXbEkp0zDMLRd6YOd/RoMqX6Yxmqpx5IOZsPGO+5m4JnAC9v9whB
	y0JuSWqFl+AQs5RXjiomLwsKGTcwtwkfx2D3s5ZmiTg1QiK08RbaDNM/uOxBzdBX
	DOwiV75wSM1ULUxgxRIBH+ZESmNM4G5eOhzk6vm2lAZGOK+/h2NFtrD60MzoWMBv
	1soeHvFl8lz3L++06+e3dUdO14yjIoX+teJ8bCluDJ4tBA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0mcm8xyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 21:11:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091f12ed3bso82422141cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773954682; x=1774559482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Otb8v9RQVroNjZwJ0anB8GeBecz+Y85WoWGferNtfVc=;
        b=CxNZd/0h0WcSCMiz2vwAondoKZnBMPm9GHStkkIDR0PlLLho+TDW4alO964QeS8TH9
         +mjKodOsZPmtjiqt3DBZ4PNMf66r2V1jvKNjOCfClmXMbVf78xTiSDXO066xFXRjUW6A
         F9I7ubageb0NM50pQ454MFBm6IvHSgci8vErZdtjcNFZ4h8EwB9NNT7a2A6hKvD1alvv
         CFWJuVjKXGIWKrXwXKpVydcG0ubXsORKqYd8cdXwBAk6kuJcIoZY4rPIOPhyorBUEES3
         4biEVenmSorpM9RbL6/nn4gLXHIChlPudyWQGPDEQYAtSESSNBemC1pU4m2uf9BcGZ35
         7xaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773954682; x=1774559482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Otb8v9RQVroNjZwJ0anB8GeBecz+Y85WoWGferNtfVc=;
        b=SY6JG9FOaNwYgZJOwtmw3t1R/h9VLtepfA6eg6swKrdMZxOt0lnnUq3PBY8BRpPjzX
         w1AyW7DVCNA3MnbtSX6yWQOjk2YNZrvqklPSaI6Z42HaBWaM0qNJanVOHByhD8ViBZzU
         jZWncdSINYV4PPmJIvnz+lETwuUo3uq9j3KoLnSXordC5U/MXnO9d39foEie87l8QPca
         /Rs5HD1eT+K3dpQ9+Is1m/px9Zn3B+UTBbmHcDKmU3GroejKtFh7wIlfjWdsN2QGmiTU
         fWPQ2Nl9bFFJXH2dispdXQ1mPyri08ASN68Is+mnoN0dFqoh8ZSuv5RPtROXue3XgYhM
         g3rA==
X-Forwarded-Encrypted: i=1; AJvYcCXzzkC82qgXLxHltGodkERHnvxzpwl09RmjvYmncPRjwjupR8Lrzo7RfN4+urrMCiNs5Bk2N9JBbIpHlYOe@vger.kernel.org
X-Gm-Message-State: AOJu0YxKkhQ9YJpTRITnUm7K9A65zjp3SjdGS2MPqPzBgCBWOSRBpfNU
	Xhb5Ba6FkrRJkoGSi2mpXtB30pGVpzLAp5bOnZ6Ab1lvhoQLU++xtFnM8VSsfGIHSihxEWqCk/q
	u8SClUt7/PHMe5yOApGNqjZkvuZ7eWCWdHAEaVHfCcQC8tsRyMXYpEI+hibLsX+WrcMrI
X-Gm-Gg: ATEYQzwNPpc3iFPCtYrOjutyw28dIrk+k4RFh0ScaqFULrI17G5O3P58agxUzwB6070
	gPE/C8zdlZp86xSGVvEZAgmy0CpCYUz3ZO74XzjrjB0BonopkMgF/sz6rbHQWKB+mmOGCPWyAf2
	HlVcYZlIzQDB+Y3m9GhaMJgGwSz5efiAbmixNzw7GBqfvcpXKwJtzRCie/+A6G9WromDySnGzFe
	dsPxRgHN9IPuFa24WLPsJ2BhzKO5OtOfb3e3T/J9bdQeodYlNXyd0MV/TKI4nNcbx528LKl/fvZ
	yODaSbfFXWu01DsAZQ8my1WbujSxUEO65LOVxeXd46eN74aDZ56DdW+lYPhOmDPf7qgPI3lhd7b
	a0ADEHaRMDFPf67q4s5Ohp/DS/IBaPdNppg==
X-Received: by 2002:a05:622a:83:b0:509:3d06:967 with SMTP id d75a77b69052e-50b375737dbmr10409861cf.54.1773954681362;
        Thu, 19 Mar 2026 14:11:21 -0700 (PDT)
X-Received: by 2002:a05:622a:83:b0:509:3d06:967 with SMTP id d75a77b69052e-50b375737dbmr10409391cf.54.1773954680805;
        Thu, 19 Mar 2026 14:11:20 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703650sm1153082f8f.20.2026.03.19.14.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 14:11:19 -0700 (PDT)
Date: Thu, 19 Mar 2026 23:11:18 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: glymur-crd: Enable keyboard,
 trackpad and touchscreen
Message-ID: <pnd7eeijf5cmo7nmydsd7bvuxhhqbkup6xv2fgpb5gfwqyfnf3@dfr44uwneph7>
References: <20260319-glymur-dts-crd-enable-kbd-tp-ts-v5-1-4a440594348b@oss.qualcomm.com>
 <funq3yjordebprhusdkkapw5m4fuqpavhyeguoo7tdffv2ebub@ozh5c7a3py6f>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <funq3yjordebprhusdkkapw5m4fuqpavhyeguoo7tdffv2ebub@ozh5c7a3py6f>
X-Proofpoint-GUID: xK_V__VCnai_L8myzD_nUZWFnpkRrctu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE3MCBTYWx0ZWRfXzQjkregpmUAS
 W+R2iLMU/b4f7qugQJwFO+HLRAc0jfnAPuQmZzibxVqaU4FmTS6KITH0X4GeultZUD5zkSM1wjX
 YPjcDCAX7ZHWLUGOszbnJ/QnamImJByCwyr3PHyrTD51kd4Pi71p8XAZt/sVHvXoUVf+g76iMOq
 xRyxqpsBY8mp/IW2JlnadjS2oyQgdIxf0/2XkvLFmYozdGVrVyBrh4Oak0DRI26Vc62en8c+Mw6
 H0cC0Ab83YqwYocpieGnJ3G6Fabr+hwzbRvqOaOcyKIf7APYE+fLCBeuK1rUVhpuRHEM3W4g6UA
 9wYqrvKnq4X6rDtxCvG3fskDdnZRLSwJR/K4M43QKEO6mP72RlL10ZBN6C2tcN1zYmQxpIe+i8y
 3f09KDlUIN4vTcZIQxiSamXqG4sBRiMnGMoD9zymWAa+9SiE8/5pDf9AZ6cPvzS98VbWVti8Uo1
 MjxJE+N/udlPZ5pVR0g==
X-Authority-Analysis: v=2.4 cv=BdLVE7t2 c=1 sm=1 tr=0 ts=69bc667a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=CPSBF7CHhaHz64fB1ucA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: xK_V__VCnai_L8myzD_nUZWFnpkRrctu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190170
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98823-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.38:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF58C2D28B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-19 21:49:07, Dmitry Baryshkov wrote:
> On Thu, Mar 19, 2026 at 05:30:48PM +0200, Abel Vesa wrote:
> > On CRD, the keyboard, trackpad and touchscreen are connected over I2C
> > and all share a 3.3V regulator.
> > 
> > So describe the regulator and each input device along with their
> > pinctrl states.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Changes in v5:
> > - Since this depends on Displat DT patchset and since that one
> >   had to be respun in order to drop the non-merging phy patch
> >   dependency, this one had to be respun as well so that the dependency
> >   tree is correct.
> 
> Where do the dependencies come from? Would it be easier to merge this
> one first? Or are there overlapping supplies?

The USB and DT patchsets were on the list first, so it makes sense to be
merged first. If this one was to be merged first, the other two would
have to be reworked due to conflicts. Also this is the order in which the
support was brought up. Also, keyboard, trackpad and touchscreen don't
really make sense without display.

> 
> > - Link to v4: https://patch.msgid.link/20260319-glymur-dts-crd-enable-kbd-tp-ts-v4-1-dfe67a134996@oss.qualcomm.com
> > 
> > Changes in v4:
> > - Rebased on next-20260318.
> > - Dropped all dependencies except the USB DT and Display DT patchesets,
> >   which are needed for this one to apply cleanly.
> > - Link to v3: https://patch.msgid.link/20260313-glymur-dts-crd-enable-kbd-tp-ts-v3-1-66c5ddfee97d@oss.qualcomm.com
> > 
> > Changes in v3:
> > - Picked up Dmitry's and Konrad's R-b tags.
> > - Drop the output-high and add bias-disable to the reset pin of the
> >   touchscreen default state.
> > - Link to v2: https://patch.msgid.link/20260312-glymur-dts-crd-enable-kbd-tp-ts-v2-1-2277bee4c564@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Rebased on next-20260311
> > - Re-ordered pinctrl properties in vreg_misc_3p3, as Konrad suggested.
> > - Dropped next level dependency patchset.
> > - Link to v1: https://patch.msgid.link/20260309-glymur-dts-crd-enable-kbd-tp-ts-v1-1-56e03f769a76@oss.qualcomm.com
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 117 ++++++++++++++++++++++++++++++++
> >  1 file changed, 117 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index 38cdcf662ba7..5089ff7cdca3 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -13,6 +13,8 @@
> >  #include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
> >  #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
> >  
> > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > +
> >  / {
> >  	model = "Qualcomm Technologies, Inc. Glymur CRD";
> >  	compatible = "qcom,glymur-crd", "qcom,glymur";
> > @@ -139,6 +141,23 @@ vreg_edp_3p3: regulator-edp-3p3 {
> >  		regulator-boot-on;
> >  	};
> >  
> > +	vreg_misc_3p3: regulator-misc-3p3 {
> > +		 compatible = "regulator-fixed";
> 
> Extra whitespaces before the 'compatible'

Will fix and respin tomorrow.

> 
> > +
> > +		regulator-name = "VREG_MISC_3P3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&misc_3p3_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +		regulator-always-on;
> 
> Why is it always on? Should it be on only if the HID is used?

Yeah, I think this should be dropped.

Double checked the schematics and, unlike Hamoa CRD, this one doesn't
use this regulator for fingerprint.

Will do in next version.

> 
> > +	};
> > +
> >  	vreg_nvme: regulator-nvme {
> >  		compatible = "regulator-fixed";
> >  
> > @@ -446,6 +465,64 @@ vreg_l4h_e0_1p2: ldo4 {
> >  	};
> >  };
> >  
> > +&i2c0 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	touchpad@2c {
> > +		compatible = "hid-over-i2c";
> > +		reg = <0x2c>;
> > +
> > +		hid-descr-addr = <0x20>;
> > +		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +		vdd-supply = <&vreg_misc_3p3>;
> > +		vddl-supply = <&vreg_l15b_e0_1p8>;
> > +
> > +		pinctrl-0 = <&tpad_default>;
> > +		pinctrl-names = "default";
> > +
> > +		wakeup-source;
> > +	};
> > +
> > +	keyboard@3a {
> > +		compatible = "hid-over-i2c";
> > +		reg = <0x3a>;
> > +
> > +		hid-descr-addr = <0x1>;
> > +		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +		vdd-supply = <&vreg_misc_3p3>;
> > +		vddl-supply = <&vreg_l15b_e0_1p8>;
> > +
> > +		pinctrl-0 = <&kybd_default>;
> > +		pinctrl-names = "default";
> > +
> > +		wakeup-source;
> > +	};
> > +};
> > +
> > +&i2c8 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	touchscreen@38 {
> > +		compatible = "hid-over-i2c";
> > +		reg = <0x38>;
> > +
> > +		hid-descr-addr = <0x1>;
> > +		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +		vdd-supply = <&vreg_misc_3p3>;
> > +		vddl-supply = <&vreg_l15b_e0_1p8>;
> > +
> > +		pinctrl-0 = <&ts0_default>;
> > +		pinctrl-names = "default";
> > +	};
> > +};
> > +
> >  &i2c5 {
> >  	clock-frequency = <400000>;
> >  
> > @@ -626,6 +703,19 @@ key_vol_up_default: key-vol-up-default-state {
> >  	};
> >  };
> >  
> > +&pmh0110_f_e0_gpios {
> > +	misc_3p3_reg_en: misc-3p3-reg-en-state {
> > +		pins = "gpio6";
> > +		function = "normal";
> > +		bias-disable;
> > +		input-disable;
> > +		output-enable;
> > +		drive-push-pull;
> > +		power-source = <1>; /* 1.8 V */
> > +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> > +	};
> > +};
> > +
> >  &pmk8850_rtc {
> >  	qcom,no-alarm;
> >  };
> > @@ -664,6 +754,33 @@ edp_reg_en: edp-reg-en-state {
> >  		bias-disable;
> >  	};
> >  
> > +	kybd_default: kybd-default-state {
> > +		pins = "gpio67";
> > +		function = "gpio";
> > +		bias-disable;
> > +	};
> > +
> > +	tpad_default: tpad-default-state {
> > +		pins = "gpio3";
> > +		function = "gpio";
> > +		bias-disable;
> > +	};
> > +
> > +	ts0_default: ts0-default-state {
> > +		int-n-pins {
> > +			pins = "gpio51";
> 
> What was the sorting order here? I assume you had one.

The way I see it, it should be based on state subnode name.
Which currently it is.

Do you suggest some other sorting order though ?

Thanks for reviewing!

