Return-Path: <linux-arm-msm+bounces-96339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ0/F2ghr2myOQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 20:37:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E85240264
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 20:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE7D830AE770
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 19:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641383EF0B4;
	Mon,  9 Mar 2026 19:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbRa4em9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzwyjWiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FA236607E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 19:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773084262; cv=none; b=kjPOFRu621UWPe4ZQrSQiwzlvhk4fqcx5r+huKoYyL1L0o6kHzF28wKxiDfOML+TSWacCEOr+xq/mXNU/7goeECkvO9dQ2zU8dY3E6zVMv6gx0GmB1QPmIx0EVza3Smd/CKESohR6Nv8/o0y2fuBITU3AfGl+zuCA2wmfaFKN4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773084262; c=relaxed/simple;
	bh=/DWqK356g8O39VyEBcMs8UovoNzwScJQ1yKL2GEMdGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNZt8MfGfujuHfWOSdCDVxAYIWuq9g/wFB9mGml65bG0HaYaFujXU+gfvPKVuzxu25jPCs6eiTRK6UXTujLpVZv1frItgO0KmMMMFhjvwl3Na6jb/VaTNNUNsiMeaTXcJq981BlZqNWctXGKrdq13k/xhrUv3y0Kwu89kOTlpwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbRa4em9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzwyjWiS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBhMC859180
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 19:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7/TFK2ou1RY6Bs6Xc6cyhsshTZZpRLyCspkXyVQmBI=; b=bbRa4em9NmyHX6+a
	RlcY5mDuigTTyJCSlDT/0aAWvgC7ezDp+4ichI89aR/6XPRKDPOiwh4NDdDshy4I
	UvgEUjcL5Q2HAjjmwQQrZ6job2JASFo/Z6rKeP5VaWmpbg+Ds9pmbeVWXodB6qjz
	5T06I24ql80Lxi2GAcmqErp90Tg+WpqCxxYKurmT9rXPtK+fkIO2lB6jDCsmF27r
	pIZjGPUCjHzPg5Uh+cn1Rxm4oRNYqfxZT8Q8JTktkvK8mkLJoRK1mqIXvCLoAPpd
	HZhHE/7b5OuX2EK7dls/e/FLohenbvDFcOoJUe2omqzg41do2Mm/owFZI0DrzXPt
	mn3JjA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbs3sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 19:24:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090bc4823cso14630591cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773084257; x=1773689057; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c7/TFK2ou1RY6Bs6Xc6cyhsshTZZpRLyCspkXyVQmBI=;
        b=TzwyjWiSy1x6XgrkTL0+D9a9lENkgG+lMLCBsmAaQQmjMOraZxxeVo8SWTjOpZRmBE
         ocvdEPKt7Z+O+9QYTkhb9qlDT94+Ywb8GJ9K8C7bqME17GNsjK/LoYzod/xikC/7c4TK
         lLmPOHFH25g7cK1izZlPC7DcUk9nxevlbdeXxffmRwRt0cbs74n7mh/+m5+clnIdMofg
         WSVciV2WcUmxpyuXNUwu5FgUGX7/Msu+zPU+KLbERnRVUlLAhPXFJaSfyMEs2WMEL7uk
         ave8FU9NEXsUIj8pMnLo03d0BrK1Pnnbpyf4/MYJv7TIofQZaiFc+8LocESRpXqSnnQT
         2ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773084257; x=1773689057;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7/TFK2ou1RY6Bs6Xc6cyhsshTZZpRLyCspkXyVQmBI=;
        b=jsL9j38UtZYVEOvpIKWNUSfYlOM/GLMlBXZIZmRKe3TNohEYuZLMoZcc2jhx4S8yK3
         91dTWOhTBWvdCnijidAEqYiNYYN76+kz49ADm2mEtkeQNjOly6ehybKk8B6TBpLoXxvP
         mifFhl1vxgBV1uZarbZrYQIxlMqUTWOlQABhn2BpIRXsjYwrw7N3ZwiAN81mbv91XFFC
         3M1l0rsrcjYGX6qof2GZ0LVHeEFzGhLs0aSvxIjfNH/wQn4L5/dEt3UP46zHhS82kfIK
         6m95fFwh/PiRJwMUCePSm9DK5N53qx8obazsU9U49WqXzOltmKNoIpuwoJgKk0xVUoeO
         ptSA==
X-Forwarded-Encrypted: i=1; AJvYcCXsSOMuwgggq6j4t7Wlu/igapzkNIJ/D6v5g8LDwqX+lIDKAwDbsO/G2/BNzyqCrmEUM+iIHsohSsVSo/er@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7Jv1AQtuqIM4VVYossDvb+VkSAGycOLbM+di8h2XesaWLVle
	1IRad75hcL2ljJzqfqVx6/95rtN6y0oJMZqHW8dcoRStR/SmQbML/Iy7R3bfd/2+2T4kcXSgShY
	26Z+YunIrHeFIx3VQvHUlUEJQ1PWjHIqlzifBPjWXm+kZUJ3qhdwwEnFucYM2Pyi27bVp
X-Gm-Gg: ATEYQzw0hwJVkJymuC765KuT5KAYCJ59O9B+k6tfrN4dL/4H/dAjmBlDJ5landx/WW3
	DyJG2blixrNdv1Kf4cKjx6SZZKX+DKMPDqTD5o0Hc6eWzBD4q8xjTZl1CspPAsQ6WpAqauoQxx+
	kiTun0A7zhNuKABr9+1N9Vcs5XtRnXcTtXhk89NSajp7+1I1pevSAR+sbJY+8Umx8yGqt8IJsX7
	WIRxPskjP7DzBExIuIfVPzrInCIvuhlNtWYwIAQd9j7N3x/STKDrnWBBDi4XZ0ulvtq3QDVGSaQ
	fERP+Vp2OEupzhzuYz5EF413n/gxwfhJw8bntv1j1fVR+XUtobOoqytxCI6xBrGJOoTJ+oWW+Bu
	LLGxpNNcrq0bjDfkaVKouB9loxveAeP3hxJ+vMe/KBsTg1MA026IqLVATF3/q/kH8m//iQO0H+g
	uc3aDd+2DAotMXok5zQA9p/9+95GZM1nx6cS4=
X-Received: by 2002:a05:620a:2699:b0:8cd:8fc7:831f with SMTP id af79cd13be357-8cd8fc79807mr330474385a.56.1773084257363;
        Mon, 09 Mar 2026 12:24:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2699:b0:8cd:8fc7:831f with SMTP id af79cd13be357-8cd8fc79807mr330470385a.56.1773084256825;
        Mon, 09 Mar 2026 12:24:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07dffdsm2284093e87.45.2026.03.09.12.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:24:15 -0700 (PDT)
Date: Mon, 9 Mar 2026 21:24:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        geert+renesas@glider.be, arnd@arndb.de, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com
Subject: Re: [PATCH 1/7] arm64: dts: qcom: monaco: Add HS/SS endpoints for
 USB1 controller
Message-ID: <y4itfqnbpii2ovptfoy63ck5vavoqyzklgezq5bemeczbaqfo2@vkxgo375ialv>
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309152420.1404349-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309152420.1404349-2-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af1e62 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=od1gnLZaB1Y5O4OfTGMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3MiBTYWx0ZWRfX6xLSS6SPJRZd
 wo5ZADB6zTgVJXHUsX2LNpcZA1wxmOSsuyIQ4yuxtNtDgS0wqRdw6JGxvOZsN3+jlGg6k7TnkT5
 FkK03klGRQx0R9S+n4QZNN6r7EwRFyGQHgc9+/5RhBgOo+JafkCH560o8/t23g2yXU9nLv8wsW1
 NWblxOGpIFY1uIn4cQdtEHTdr+ZtDczVilUE0opqIvbESUoZiSC2XoEsHW3RuV8XTkxhEre6xhe
 drJDjXQGOLBogyusyTI+dvo5tm+VHpHmq3A4aYLFmny9h5wzSb5G8L8JyLapNMiXnVb88R2a8ff
 yo5uceFpnyQswZvKHfYO+aF6D3i5dlbyL6hl5JgVcCB20R1l1xd4g7plqjGljig97IBBQQfabnc
 /KeloYQYfTf9a6TCHpebkmf10UFU3mCXVQvtbecD2dyzLit4jJYnZIJjJMAjqDVs92XSw2/FU21
 1nACgLwzacHObCr6jBA==
X-Proofpoint-GUID: Q8rEH-lakRGrdKp_T0cap4gIjnYeLtC4
X-Proofpoint-ORIG-GUID: Q8rEH-lakRGrdKp_T0cap4gIjnYeLtC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090172
X-Rspamd-Queue-Id: C3E85240264
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96339-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,arndb.de,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 03:24:12PM +0000, Srinivas Kandagatla wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Add a port node exposing the High‑Speed and Super‑Speed endpoints,
> allowing the USB controller to be linked through the device‑tree
> graph.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

