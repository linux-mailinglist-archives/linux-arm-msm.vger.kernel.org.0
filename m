Return-Path: <linux-arm-msm+bounces-104965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF+iMu6g8GnrWQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:58:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4294948467B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFDDF30ADACC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79F53FE679;
	Tue, 28 Apr 2026 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3xrjr7k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apvDNU6H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C4C3FE657
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375616; cv=none; b=QnPq42xeXJecl9o4wYcbRJCW1SSz7a9QuwADwogNEdieXGYHKEng3vTkBI4VgX9eIM17BBNKRu0sKYNW5tHlpQqcMjm7NLldCDu/7k4kioGTsVHEXYsi2TMYFA5L/Vdz4kcB58jnXPKvgHFLUUU/UIJoCorBahrFy3EWrIaq9z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375616; c=relaxed/simple;
	bh=3Rn+857zkrDFLYBUrf5Cyzg71vtUa3pKPZfiKCJ66mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0vl8exodUKIvb1NDx5Eqsj+GMJL9aajwGQ/nmxNpRckMNbujgBhmadLcI3Q1VWFb+d7EucNzSaXgQ6IOaFZLTGU8l/1FnpNBJRPet7lt3Nm65r+bsVIpKhFiLllLCwnX+eFhKM2U1pWI3i+mLQ8IaQPt8cD9Pe/nikvKXmXRiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3xrjr7k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apvDNU6H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA44uj3275414
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=03ou02At5F0k5bHCtPQ6XIG8
	n23e29Vm74dcPRA80+0=; b=C3xrjr7kklHd3+PzukV1xhRynVZHADOT5ayH+GAi
	0P7QzGCYFBC3S4LWZ2MMuPW2GYyxJ9GG8DG3mWV2U+gCn+7DhJDdPvTOMQaXuMFS
	GP1L5qs7091NAPSnqDLCNahCAN2kkaaPcFvrguzkdHXvplCwma54ZbJ8dS1ikwd7
	/PdyeHRqdklazf2e71sKULD5zwZob8NJ8QYCzoDwl2rXT+nFw4MCDz6K/a4CdKnE
	iHKN6EvK1l390wzCgcK4zbXloO65pcZcsmkUiSgiqyfhrzPhrFQ+2hafYRdtxRkG
	eBOBilAO+WAsld64foNrFF+pst8pdT3/MpVJPXDSx2FDug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjg92p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:26:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51009190feeso29959841cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375613; x=1777980413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=03ou02At5F0k5bHCtPQ6XIG8n23e29Vm74dcPRA80+0=;
        b=apvDNU6HbB3Ag8vUtl7MbtoOJzyfCz9pzzzZgntKK6YIrcoHQHwZak50HIb/pFfwJw
         gyTjCGe4Rl/FghMs1ZkoGkgKqCxMhUk9viieJpBhD50affwWiUILDF2ajbdaYTFaOGQ8
         yk6ShVWCT2mVS8tfibYyRuFJl9NRgtbaru8LIQbTyo1z1IYoaxjUkr/W+/bd/9smOd26
         j4ISgOaNe4w5WmodRMn2GDEQhcoRO802Lr10lYl+ejosh+gNNxvJH+HX34yNkVf0yvE3
         jLzCS7oHulPm5sFRUci11vOAYzn1rC9ERYg1O4akUjrkAy/lhaRU9XqPad3mpbSPckln
         p1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375613; x=1777980413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03ou02At5F0k5bHCtPQ6XIG8n23e29Vm74dcPRA80+0=;
        b=UMmtGyyX/SCecg7bcLllUPWwMH3NatFe9aeD0h//93n0C4eKmburX+2RByafi7qGCa
         5fdzdikilaPLyBL9lax2p+tI6icjSeN3e1gKGlWQJ0bPkkyVUMy7evtSpa1cGrV5Rh7R
         o7C0355U4ZDR6DkyBvPH0W8VdLypXCjYfZuKAESBMqDSPi5QYdkUfdkorgYM73GU/jrJ
         Z/ooMl5O3MDkewomB8QlHw/HaY+MLnFayNJPfNdkKwwMldT9GNYGRccWpiD3zvSmshSm
         yORimOAEQdaRXJTj7B1OXe4RNXPgbS/kOZluN6bZrC7575zZ1roGtMgK+6MCo1Y/WCDX
         uY+g==
X-Forwarded-Encrypted: i=1; AFNElJ8H0iroXiHTtG8AI5BnqeA6IyE7Zee5mnu2uiQF/BieD6hB9MvivjkSasrmx7J9Qe3wEgrATkYV+Dvfor3F@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy07tPGPCD9tuxb01ZQARxvvMXBGnEQy2/b1o10T2XK7w8TJif
	AKFiZgvlrZdtCiSmbOm1eNh7PXQ83k5m7sTuQvB6oyIF0+Bi/VBych9iQrEPI+ICJDGAbeGsRtL
	lqxDHXlJsTJtjEEoCVRsHhPxSc2IxdpA6rJ2NRKwElo2NaGakGGHPDAP0EQ06qiSr3vOp
X-Gm-Gg: AeBDiett7oMSvwJRcr//QZCMRM/KXAAlUP18Ealcp78XKDBAlRlKXBLTFpLejmF8Dck
	RAqjpO+e8P329AWK9eyBxTdGoMr+E6gvUTe/nXraMlS8WL7l90/TRSq2q2sCQhX2jLHzEVeTNRW
	zlJ2wdiNwENizKGNU5cHyifWjdprOze2A7238JQoo3zBJYkCnop2inY94evsb9IsYup4QywhoAW
	0sTNKwuI/OMIoV5mCdf6NekDOOpg0hhRjcmBOnaz+Yfc/vPucvUKgkweu5A6zTgQjIql3RKVlxW
	RFUaUKnt/OYsLJAHC54r2XGAYBLrpvavMVhIWisv91uOZ+PoE1/iZIjc6wJGpIOXwlwlY5T2xcN
	ZtJG353obknOsaaVm833cZdwnfvRXDmCp98n3QKqTLP+TT5sD7+9ZUCHj7ixdRbBhE6l6CXqoyJ
	M3GSlU4+wlIVzNqAXXQd600Af6ny5AVTBQgwQHL10EdBow8w==
X-Received: by 2002:a05:622a:653:b0:50b:38c1:c6a with SMTP id d75a77b69052e-5100e1256cbmr34995521cf.19.1777375613368;
        Tue, 28 Apr 2026 04:26:53 -0700 (PDT)
X-Received: by 2002:a05:622a:653:b0:50b:38c1:c6a with SMTP id d75a77b69052e-5100e1256cbmr34994721cf.19.1777375612542;
        Tue, 28 Apr 2026 04:26:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462cfef5sm550447e87.19.2026.04.28.04.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:26:51 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:26:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v1] arm64: dts: monac-arduino-monza: Add Bluetooth UART
 node
Message-ID: <ejjbhgo7xtkyggd3vobthtvep24p55bzqzfyogg6iemon6onjp@wch5b5jsz2u5>
References: <20260428025652.662502-1-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428025652.662502-1-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwMyBTYWx0ZWRfX+Zp4fhF65CW5
 eVY0sZdpUWLr0cdG7MiBYFi4dI5alT0g6e6RYtW7ox6za1rGA6ix85U33bMnLpgvfOqJ93+kOkk
 c3u5hJ5svfmHR9bsp7zjibAVdRmsz+MH8o6eDKcSDDq9j/6sQl3U1lHlq2ehRu71cKdVsCmkuUD
 QdWGzBPvAr/gKVBBZoPtBUGsIPMCAb8aQhTu4jKsgIUJYpNBqvu+mKAZU5R/aT3cgeVKDQtGVWm
 XenQO0XUH13gYmQ+5hwr/DaRD1la8QrAgWl0ddDkr30IMsx14I/lTjzjkvC2kgf/51TtPdgpeqc
 XRQJ00rub9rapcaoasa97yZNAYxrgS0/kvDx1UhI9rPoXqhqAdgDIT9Z8vkAuX+sihIAjiegib2
 hdVrNacPylXtdYOVSczbY9AsCd0lnTHWwUy/atIuQoMuTjWjN3B7jHVjBFHeTBzKFfYfyGBT/JQ
 Uj49PEIlYIh5gPsPjMQ==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0997e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KMwB8ELdjFECEPWHL98A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: g4n3WZiXr5suBELjYu26REqvk-Ka87Yn
X-Proofpoint-ORIG-GUID: g4n3WZiXr5suBELjYu26REqvk-Ka87Yn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280103
X-Rspamd-Queue-Id: 4294948467B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104965-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 10:56:52AM +0800, Shuai Zhang wrote:
> enable bt on monac-arduino-monza
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4..092ca0b59 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -21,6 +21,7 @@ aliases {
>  		ethernet0 = &ethernet0;
>  		i2c1 = &i2c1;
>  		serial0 = &uart7;
> +		serial1 = &uart10;
>  	};
>  
>  	chosen {
> @@ -454,6 +455,16 @@ &uart7 {
>  	status = "okay";
>  };
>  
> +&uart10 {
> +	status = "okay";
> +	bluetooth: bluetooth {
> +		compatible = "qcom,qca2066-bt";

What powers on this BT device?

> +		max-speed = <3200000>;
> +		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
> +		status = "okay";
> +	};
> +};
> +
>  &usb_1 {
>  	status = "okay";
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

