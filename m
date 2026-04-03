Return-Path: <linux-arm-msm+bounces-101721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AMxFpQX0GmV3AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:40:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A6397BCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 273E63059FCF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 19:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF349367F46;
	Fri,  3 Apr 2026 19:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAwY1iFN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QV32aghr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999B629DB64
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 19:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244914; cv=none; b=PQ1mNoIRU5hw8wLtmTf1NSjqBkysdebaIv5rXFRxfDEwf/Ao57QANUqFR+eHG9IbAfQMQybRzJRmx0IjonizPWExPYOw1yFlwYLx4jvCVhNEXuOH9+wREUG+SBlW8E1uk3ZoWZQYGNDJmRtRUNoQMovlQna3lBGWhVBSzvxMGpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244914; c=relaxed/simple;
	bh=fCyKv6n213CXOIp+7Tf/ucX6AW1UwYyK4/dzZ0nNAjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhRvn1Mz1alx0vbTkGzU4gxQP6dZG/8On3SBTgnPICt4JO5YZ9a0O8IYq6cUk/jZLlepfIc/WYmiS/MIeg9wnkMkzx0MJqXyM17PGRSXVpIsHwCxmB1qecAH0S099wzGMsarqlbGvONuC7pzU+weGQvb0/C1S1VOopMzi/6xzWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAwY1iFN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QV32aghr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633DVrEZ2359527
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 19:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O/uAuFTU63ZTQFXA0UTCPixz
	BtzDQ6AHfdS8W91kFzo=; b=NAwY1iFN7wES1XbF+qYwbMkPS/sIEb1shxK9mmMQ
	eQhYi3VUmLjeESXKzt3ThRo/F63wV4qQb7INbB1W3UOrR80an/6Hu47gExXYbYb3
	nHSG/SnWFMD1bJBwL9ZkVF/uEGSxrdA+ZLkm0Oc2pIe9um/B9b7aVOq9NoaHuk/Y
	ZXDUJMyDkZgVrCtbqIRC4h++0cWg+4u7+eLls4PzX7Ot5eKmXeu1r3c//X8rzLeg
	c+zSjZ6YK/IHh0+0mnTtRD6BCkfjzaNfZLJgalQAqt2ej1oPRuhpY9r9wxbsGVuJ
	J+XT89XCIWwLlh0JqQldJALVd73Eo2cqrI9k4g4dYboqTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daeh1gy7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 19:35:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b31cff27fso20913601cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 12:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244912; x=1775849712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/uAuFTU63ZTQFXA0UTCPixzBtzDQ6AHfdS8W91kFzo=;
        b=QV32aghrMR9VPflPd5ZQXJk1rFAwsnMclmpwh4udYVE3EgCitGxig+EhyHRgkNZFdz
         oKMxGJIuIjz4YAb7vvPw9ir2OwXKA29PHzr5wnOINzjwn8K7Kc/Y3wDaAgLy4gMGlZ+A
         PRpKBl3zmbJ1DC2gJglWuK0upCgwZZuV4WAWI6UdDrzjTj4RrmczEI2PZofY5J0TIBTn
         g8vXnwI9a3ycNcFLMVRs90d0yfLTFBmM0KJIJ9109qkLODBNYFrSLDacz6tC9C/aqe6C
         VG3rIU7+6CbpRwigUb6tumwc9WBuBx6oopcC7faeDSvj0P0Al7DSulYYoD7UJu1R1BgZ
         GgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244912; x=1775849712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/uAuFTU63ZTQFXA0UTCPixzBtzDQ6AHfdS8W91kFzo=;
        b=rov2OYp3m9e3Rb6L4ejQ95SP5x6NLvmRc5EFKEVPqgKGYh+0K0V/CFltNn3kF2zQCc
         7VT/a5pOZBKVPuPCSWcN4HW414AUv/3WRuDXoLzIaKClzeGNEIaCVYLt2CKTC7GcGCTZ
         KKTwD5keJoAr+W+Fc5Xr6v3JR9BNliAWD0MHGchmiJb5ul2Mt8Fx5/lWEOmi+SfNhkcf
         4Y2H2fS1gCNs7wx9Vf/f27a4cAJZ9QP7n5mK9WA51xu/I/jjiJETfz9Tg7relcVKiWaL
         kwfIaFNFIaUbkFzcDa/yPE5NZRLgru3/6En/HSlH/E6YOPC0U9R23l7vtzL7p6wioVNa
         doow==
X-Forwarded-Encrypted: i=1; AJvYcCXYeGDOq8rt27zXcgemBodKjGwSTpP2Cpb4TCkqHiz8f6HQaMnyYTjgCXVMglCG3dqRsKbAajmKUX9mluPL@vger.kernel.org
X-Gm-Message-State: AOJu0YxZRILpuXTc46lnv4zbxvdaiVUHczcge2DdgCwjx/1H6EyHlqod
	IQO3NKy8sm041cOI5i/EPqmZxxWCnc3P6MTrcrnbNltwnG8kl3CtPmF05AvJVdZQoQ8aig1FD9c
	YXQSbfVpZ/pH6Sv5HyOT02PR9UB8y4HOFsHFidaKxByM0QlksvC4SW/CYnnx1Xxhlgl68
X-Gm-Gg: ATEYQzx5FYvDBrWs+iwtroMK8YfceVQUOn8Y4yRzRP8e06Q6o/XlmLcuaPn72Zn0vq5
	mCnz0+q6IPIGwlMh+o4IKtrIix2Inkick71eayeVV7I/jttB5IvdKygBDr5acJd204/hQixvObs
	BcdjQ55yZAB4OJZ5VONnc+SXRGLboLq3+Fo/830Gi1fueyoGKWNzg2Ch5JHOLJK1L58cg51ctAl
	gwaKBmpjttHIiO4EoP8Civ8q0ZGV2QYCT9Mk2qt7a7Pm/XocYnikn1lCRatxNZJpwUIAdRvQxE3
	QIroKmutqEnD/hWnbF8D42AmmZcNgGentycLG4aTXaw+C6L3U7XLRO33QvNaNnJub6B85ajZV7P
	2IMXM3hqdvn610gZEPWuG8Ry3Y3JJMGN0KfjpQgCerYcPxHWwTpYN1BlYM/qEOhhtPr5AJFouGP
	et+Rwwra1tm82OqJwHZOgCq19cQ2wkwA37Oao=
X-Received: by 2002:a05:622a:1f0d:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50d628bda1fmr64484701cf.18.1775244911950;
        Fri, 03 Apr 2026 12:35:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0d:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50d628bda1fmr64484211cf.18.1775244911443;
        Fri, 03 Apr 2026 12:35:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c951b1sm1664908e87.6.2026.04.03.12.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:35:09 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:35:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
Message-ID: <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
X-Proofpoint-GUID: Rc19Xdft-pWjYer2aTRlDwj-xBaww3m6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NCBTYWx0ZWRfX46jvyrmz6d5y
 GDYyVmFWO/R+EIPRms4MSfedqOUY4HLYAXpTstB38pDOCHbX8HIYpmca8uvorQcMlvehEwLH0VZ
 iNqOKv+tP9zXgUahcF4lG06aI5vCw08jXdaT2HvwA8iaE/F3bth1hH8kpxK9xEzUtTTxxvXCwW+
 qQJ5SKnkLh4AfUa4eMjGJbKtr+725BzRDd6mMbAHGZx4oBTdizRxQrHAgYU4BOVVcre8CpBvZEc
 4qsEv/8FK7DSQ9/QJ5zN7Bt9DJ+qqNfMp5kZTe7ferosGQkhfOshtJBwufSmgNpGNripuaCWNAp
 1ZupVHficS6ZZdzZH0gAcjBjAgmoV+XJG1ESngeUcW0a6os5Z0ZXwRSyRwVefuYelorWF68ilVi
 IqqC3yHx6wGEYhUYoSq+55ea8pPTv/2S3TvKCbXPajxqqSkZYXiR0o4jcJ7sJRQxTGgSfnKhxpj
 BLxvFFugN26iVvSTthQ==
X-Proofpoint-ORIG-GUID: Rc19Xdft-pWjYer2aTRlDwj-xBaww3m6
X-Authority-Analysis: v=2.4 cv=JoT8bc4C c=1 sm=1 tr=0 ts=69d01670 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Ae2tQB4DPc1jRJoPbowA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030174
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101721-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net,lists.sr.ht,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC8A6397BCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
> Configure and enable the WiFi node, and add the required pinctrl to
> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> the missing pinctrl to make the WPSS stop crashing.
> 
> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index db72418b7195..d8ac495ca7c8 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -242,7 +242,7 @@ wcn6750-pmu {
>  
>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>  
> -		pinctrl-0 = <&bluetooth_enable_default>;
> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>  		pinctrl-names = "default";
>  
>  		regulators {
> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>  };
>  
> +&pmk8550_gpios {
> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
> +		pins = "gpio5";
> +		function = "func1";
> +		input-disable;
> +		output-enable;

Hmm, if it's a sleep_clk, should it not be handled via the power
sequencer?

> +		bias-disable;
> +		power-source = <0>;
> +	};
> +};
> +
>  &pmr735b_gpios {
>  	s1j_enable_default: s1j-enable-default-state {
>  		pins = "gpio1";
> @@ -1049,3 +1060,9 @@ &usb_1_hsphy {
>  
>  	status = "okay";
>  };
> +
> +&wifi {
> +	qcom,calibration-variant = "Fairphone_Gen_6";
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

