Return-Path: <linux-arm-msm+bounces-93060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLY5DQ4clGn0/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:43:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87704149449
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 195483032CD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164185FDA7;
	Tue, 17 Feb 2026 07:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hz82HG9C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9r2Ga5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32C42D8396
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314140; cv=none; b=PcAiwcRwX1dBQOAiTOHGbWppFaoodDsWxjm9uCmlaJxPGoXSeOxAKUFxNjeppjc3Ky4u0u/2RbLAZK1JSDSZHqtmorrizUeL1MJCMfanrjNu1KYLci4vxsA28PoQXIvhP+Oocjtp4gSH5PPTLYv9TRIMKofP1f7t+aFRBk8uO18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314140; c=relaxed/simple;
	bh=8CDvF4EZqywjeqq6n1Gkx5D8pKS9ktfF5GpIJMI0mXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/qfxowl7RaeqJNojWsb0M+48YOJM8mVr/1ZD7+xqZJHxBI3dYciQioj9zsVU+QkblGCRhh7ergsf1Syr+qykUDsHF0Fk9/d1yvRvYS81JamtvJ2h3NIOoTfIU8PW4PhtFWebyWMOCaPRQuM1U1EOeiyMxtnlYvC8SwtHNV2e6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hz82HG9C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9r2Ga5S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GH4mHm985497
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2P+ECG2vxZRApWW3EQOfpyiF
	thEBPrS5O1JGmhWTvVU=; b=hz82HG9CNLKnvW1q+EWyiLA/LZredeZN2J90x/qh
	dy4px04E/HNbPuq36qX1J7rOKW8e7CHt3IsdF9WYD2/6tw0gXMYPRuSvqRJaTadr
	pvdtO0SN8agIJ8p2RA4N0FVo6CI5o1vs3vxakzP2cXrKzFeEIuVNwNKu6lBOvTTQ
	QAZQ3bakDSXz5RqnBHE0VPE1Je6DyXOeYZvDMaMI+IH7gm5H0nEBAJoUU+OxVwDJ
	Ygo6j3/Idpivkt0CZixyqRQ03sAosTt/HjvWV7l6CU0wLBzczd8Xu3Mk/B17KRP2
	0EEb4XFPojmqhBUXmfph7uZUglaRI1S9s39BJ9GBISbO3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1dv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:42:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ab7f67fso3935179885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314137; x=1771918937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2P+ECG2vxZRApWW3EQOfpyiFthEBPrS5O1JGmhWTvVU=;
        b=F9r2Ga5S1XLhOgSAnVNOS2gATqdgzkI5vgHDC0waQHZpO1P+8iFF7sOwmPBxBIOxOp
         MLHxbkuXfzbBTdsBSDc8w4nU5YMR9kyk38hc8UQMP1tLzlV152/7Bkt94ld7wCFqNHN7
         D7qY5sWiqy44v703EUTBg5rHNhRSACf4VeGSlEGMRNfiSJ4nC+jR25HVUt8xmBZvY1De
         qG6GwBbCRo/pIX8QasTQmIAr1XQdARd3jaMLtaKi9Wlxjcr0ajtHsI+aRGMKVxw9+NUl
         qIQJDCPiVc0ytsYr59HOkUiSBj78T4IPLTPaPkrEhXcRIKB/P/4Ba1J38+B5EG8kkv+c
         7pLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314137; x=1771918937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2P+ECG2vxZRApWW3EQOfpyiFthEBPrS5O1JGmhWTvVU=;
        b=Pin/dxjmMPxbBAKrlDRvZR9NRzlltSvEX6vwtMdm8e7/lepNwDjPZblwETi074X0g0
         gxI1cppz90KWKzWk2ksjPeIQTaWThQCrXn4nvv05z6oJM8xyS7mgmNeyIoUdWQ5UeWhi
         3EwkoG+GyeiwPF11taLrKyGkxmtLInebhQeqmke687LmWbmx173rG1SEN/u9KwTb3KIt
         /kNGV37srHt2OBgNW4Q4lhUO6Xy5kTRPwnKz8bpnIXoVbjWXUk1F8Dn//ssMVYOC4NAd
         8TtkLlHQ0L9HpyqD8PBI7iQ+uVNrxo+Qi4PLtK9K373hk5kOOTGMVu+DpSZPHIXHPpfe
         4Ehw==
X-Forwarded-Encrypted: i=1; AJvYcCVYnt9Jq6CyUJjZmawVJ03GOKjBG102xDZYEsUgWCPuT2d4ZCS+4X34Q5JTPzyFOmsCHX7o8RmXWCfLZEW1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0xCP4XgNkerTYJflyNTJUOWLblcgDMYun88JqT/rCKPr/S6LA
	qIw+aC4/4XO80n5Hb2UM/dFoDBsaaW4jdB4XJldRcb8zuNrlcdEJDyRCIWJywNCJHzoBOWox0NB
	tx3mpSMN//SonslUn7sW6rQKVJQ8p+BX9XYpJ7YbV2GMFHTPNOGWhSAh37VygwjJkzrAp
X-Gm-Gg: AZuq6aKqYujWHdTNEzWdgeyqZc/GXol1AmNp6poz6Vgdr8A9/u/4M3wxn4Vb5zIKhHN
	Sof2EL4NuxWVf2MMEZmYoFLbaSknT4HbCbiSV8brQiHW+9ic3NiMlEshTZ6lMYtd8xQJkY0aJsQ
	WsywugKpZ+sFIy6kCVeq3Rxpu8GmohoJXzf6eGcPK/DqUNyuZ9p2CH4Sd5RinZ+qDft6wHy5zPM
	eV/kkGG7GlWElJma82JztSxZJ62XokvEMCdk8UEIsjpkZAH/oLeVH0fzwxJos5utz98fD6NW23g
	HpeIl03/+VerWmqfku1CCfu5WWxMH8QOBvBKIOjqTUxNj4E28uxlyVLu9e3HhEBdpvU8sYCZUCP
	pOxbexDM68d/QaglyySWLkc+9scM8k4LhD7ms0hYyf8zbBOfeG/lfWh76NWuaNKTKPB438cWGED
	Cg64ZuIyQqHOpEAZoJv+CiENnB1Kylg70tNgo=
X-Received: by 2002:a05:620a:454c:b0:8ca:4438:b8ef with SMTP id af79cd13be357-8cb4c025c1bmr1178895385a.69.1771314137252;
        Mon, 16 Feb 2026 23:42:17 -0800 (PST)
X-Received: by 2002:a05:620a:454c:b0:8ca:4438:b8ef with SMTP id af79cd13be357-8cb4c025c1bmr1178891485a.69.1771314136799;
        Mon, 16 Feb 2026 23:42:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4fcfsm3692473e87.46.2026.02.16.23.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:42:16 -0800 (PST)
Date: Tue, 17 Feb 2026 09:42:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: lemans: add mdss1 display
 device nodes
Message-ID: <konkomahmiuuqn757wjpsxt722lcbzougoqyxhzaskqquuzbfi@unets5hlsw7k>
References: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
 <20260217071420.2240380-2-mkuntuma@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217071420.2240380-2-mkuntuma@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MyBTYWx0ZWRfX0f1VQ9Odcqr3
 3Vtf2WiTMnlX60JvAw1YY5rAFfAT7xA5n2akkSJhdPi0fCwb4aYObmgLwN9EiPTidZkrotjb9Ke
 gcGCjLao0yNTFJ4ztFKJXDc5NM+xJx5YskgqRuYM0DpEnZEVOnrltZHNW8NBuPe/hw9K9vtE7rD
 pTEM6Gmw28pSxghvb8Di7Iqay5UhMjvWxBaZJf4uchjNv9xZ2BS/lelBSwbHUFGPa4N1fxRc0ij
 CTWk8NpBmuNcV5WiUl5wrFRiLmMbB0sOOg55nRf0Ux1o+vHMgPIbSq33BHeYZykGVup8xZ78sCp
 lbmJP2cKxGQscHlqaXO/JjlRb1g6J4eMGUJ77MlqS6ojuQ4MYIvgUNgNmuHwwnIEq0l0xPHHe7Y
 9JdQGERs69G4H97Dwdu+iY/EuFX7e6+J00+76UF3hADUhIEcfUsRXhbzQqW8txlMWYM8cDWBAe5
 xczRqJbNzunIm0ijxFg==
X-Proofpoint-ORIG-GUID: ydNXPN7pFJw8CaIgkIVw5d4yA9BopcsT
X-Proofpoint-GUID: ydNXPN7pFJw8CaIgkIVw5d4yA9BopcsT
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69941bda cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=SI5dRhP91uxaG1B2flAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93060-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[somainline.org,chromium.org,kernel.org,linaro.org,oss.qualcomm.com,linux.dev,poorly.run,gmail.com,ffwll.ch,quicinc.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1.81.56.32:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_PROHIBIT(0.00)[1.94.243.192:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87704149449
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 12:44:19PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> 
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 315 ++++++++++++++++++++++++++-
>  1 file changed, 313 insertions(+), 2 deletions(-)
> 

> +
> +				mdss1_mdp_opp_table: opp-table {

The OPP table is the same as the one used by MDSS0. Please move the OPP
table one layer up and use it for both nodes.

> +					compatible = "operating-points-v2";
> +
> +					opp-375000000 {
> +						opp-hz = /bits/ 64 <375000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-500000000 {
> +						opp-hz = /bits/ 64 <500000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +
> +					opp-575000000 {
> +						opp-hz = /bits/ 64 <575000000>;
> +						required-opps = <&rpmhpd_opp_turbo>;
> +					};
> +
> +					opp-650000000 {
> +						opp-hz = /bits/ 64 <650000000>;
> +						required-opps = <&rpmhpd_opp_turbo_l1>;
> +					};
> +				};
> +			};
> +

> +				mdss1_dp_opp_table: opp-table {

The same comment, use common OPP table.

> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +

> @@ -7055,13 +7366,13 @@ dispcc1: clock-controller@22100000 {
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>  				 <&sleep_clk>,
> -				 <0>, <0>, <0>, <0>,
> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
>  				 <0>, <0>, <0>, <0>;
>  			power-domains = <&rpmhpd SA8775P_MMCX>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> -			status = "disabled";

This needs to be explained in the commit messages.

>  		};
>  
>  		ethernet1: ethernet@23000000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

