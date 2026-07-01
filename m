Return-Path: <linux-arm-msm+bounces-115806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WSEbOa2VRWpMCgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 00:33:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 281066F21DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 00:33:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="BTwi7D/c";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X+jXhuxS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115806-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115806-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D93B13001B43
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 22:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954D73ACA7F;
	Wed,  1 Jul 2026 22:31:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A95A175A68
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 22:30:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782945060; cv=none; b=Wc0g3inpi33yP8JmjivQxT7QeNukGxTIsc6+EjzWHMlhe4+JqX+/wKjj6+8k2WtVwUYZYjzGKYkH/i8hTnd19cwUe8DEfX7crS9cdKTN6XdGrCtTHC0YgaXMj/hyaHIoJQp2/ZlF6S+L6P/dJLGdFBrfbZBikbLeMkzuYVWsKg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782945060; c=relaxed/simple;
	bh=Vmnh47otpA4PBJIXUmSz/7RDAie5lV8O9Npi3AhWaNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQbgfdMEsbT+GuP0OvFOTc42pa2DGBS1akmH41G0SxTYVeoLQlnpqFRW9fx/E/9S+S8Cm/SnNtP/0bka73M4AG0ywmzdU2lXotiUDTYWIsqS9s8vEcP0czm6B9scoVl3Ci1PqOAAZvORdW104RmH6AEsrLz7yk5s2T5ylAKwwpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTwi7D/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+jXhuxS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661LhpoU2507277
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 22:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mRHu46H+L/pZVnmmXprEV1Kp
	VTSEZ4SeeP6kf2PnGMQ=; b=BTwi7D/cmFTbQy5GvWCK205Z2zfRf7YlNldmRSBV
	TskY//GOnIwfX6KTZQ9lgJC0Z4rrKWLRKANdfrHRI8aryNkY2qlAkxcdJ1LD712q
	xSRHP3tiQxg9LIdnN5/VIDZMhA+amVwmjBCZy0PDECVYh0Z+6ddK5gy/lhKjB64/
	0+JfFEKSUlSAWSeMPqpa13vMNG4Y/npgBN9TLD+RgTilqeDyFCGxPhkRx1I1ZH53
	vLRr75kgcsqsF2bOorNWgh6LgvDVpLVRK2zedNa+ClrLi3IdauaboP9UzxY5akR5
	5LMAB1up+2Us/m7iEvJj38lj/tg8iBI4AjH3WNRQoMB27A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ajunm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 22:30:58 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96925fc24a6so869971241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 15:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782945058; x=1783549858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mRHu46H+L/pZVnmmXprEV1KpVTSEZ4SeeP6kf2PnGMQ=;
        b=X+jXhuxSYvP1kZD3ap10ae0MqLDGFo9/uYUnPp7X5hxBBP4G/3pkWYdv6GwbAqggjJ
         BhV0dfvw3e0/TtaqpuhJOZkMvgxYoxQiMQXl61hrfAl0HzxatPIwIuMAEzYj9ZI7OlyT
         Uq21hRyTRlLyhJoJh72GpcJ5dHKC4cqpwIeRr8OmySd1J0Wq/6oDeFDX4MVwNO3UCFoD
         odNqPUVXejvhyWcE/1/mU5YgTm68QmI7X9Add9KZYfC54D1TwRUNBNTATZBDaUCgffjb
         xDIACWRaaTEiU7Wcsa3aisgzWdYys3/+j7uzaxHr8H59StTzlQJsKXkbHrpIlBv1bfsP
         pj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782945058; x=1783549858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRHu46H+L/pZVnmmXprEV1KpVTSEZ4SeeP6kf2PnGMQ=;
        b=m5gOi31Vmof5smBCGixVP3Rh3fRxet7vOdbbUbgOJFDo8Fe57ovUiAFY8vRno+/8XK
         87DztxAznezZKaaRfPyywRx/r67aFEQjeF4VyJYwwX9GxJdLh6VeXDKYYz+qDIanOAY+
         7iolhIW7C2Lyu3VRBfXtmJebm7eM0Md8mfV8QfGfm7JPjiinGDrxazgRJtQiTN2EH8l7
         nSFm3gW9pnxDnyKiGWG36XWOZlYlII8Wu0NZ/6K5SbNbb9TnY9TlbIQxBNzhstn1WZSh
         lFTyqGorxRZ8GfP7lBeCRLUK4GA9oZchh+uMIDcpjf8x03qKAdPHTAlVF0jX3hZUPMkB
         WJ9w==
X-Forwarded-Encrypted: i=1; AHgh+Rp2wAFaRpiN7kY6Uh9RHyu0Ie/KINFC128qwDkSTL5xC2jb28ZMvRXdShzpj6bNIbWLZnqinhbiNn/H9Nqq@vger.kernel.org
X-Gm-Message-State: AOJu0YwDXs+v+UjSa+KOcuUHpY5REKTlVzv3/EcBHWZenJNFOOQHHZzH
	H4yslwfT7rfuCVae9yuI0443cokNea/n9ljFo4405cH04BWafJsi521asnGkz9MUfrew69w2wrb
	YZe84elL+chajJb25kYyM2anV8Gr/yM3ekzA5UYIoXwL3FT2wbYxnOs8I95W4AmWRDPgVtVjfMV
	M3
X-Gm-Gg: AfdE7cklv4fBDnCO2j/1SqHcNoCu4teZ23wcIv6LZhcJR6AYC1kPWBy0tTPXK24htyD
	1IdwStigHTdfMBJnSts7ULc8r3SSKG6m939g/hGgA89Hn8ZDIpskMULVcevJIcQBVpJuCCW/vT7
	Is7/oioJKJbvGBP/9jjXh5kYoTZzAWjc0D1Y2O34wO4pJgVdzxpPQ2Xd75ZE6a4Ergy9CWYkbml
	Lco+oROv3K1jrdHG1RclNvsYnZNQiCU516dFsWotdBvrqUO+SRWzs6aIEgdsdCSjcji/UeBGCQ+
	tK3fuRosN/cK3dgrxTRcjNnAMmkyrho1kG9z+t9CIpqKudyHXIcB3j9EgB88xcvfjjWH3Ex8QIL
	W1DEKWNicRQltBgdBRT1CEMBIjToColYkFhZND+4HyPQiyiQMhbH3zBYRQkEZBEI37DtT8CnL9l
	Gr5009pVRdmZQy3uGmCRapMKvt
X-Received: by 2002:a05:6102:2c0d:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-73dbd5fca0bmr1485692137.4.1782945057875;
        Wed, 01 Jul 2026 15:30:57 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0d:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-73dbd5fca0bmr1485665137.4.1782945057461;
        Wed, 01 Jul 2026 15:30:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89eae45sm274731e87.84.2026.07.01.15.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 15:30:55 -0700 (PDT)
Date: Thu, 2 Jul 2026 01:30:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
        sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v10 2/3] arm64: dts: glymur: Add LPASS macro codecs and
 pinctrl
Message-ID: <ujd5oxvjmapkyz2rbl2ogs7m2tvj3lezp5oaeyovcqqp4gdwab@52pri5c4j4ti>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260701163115.3701298-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701163115.3701298-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: V71eMp-6h6AWiG1V-OUSwi-6b_3bqL8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDI0MSBTYWx0ZWRfX1dhNjiduBzfw
 0VVqxwpeLTlfR3Z+mleJF2KTQ/COf+L/fl+8e22dpwjg8UOCqGNnA8ojvI10k4yZEF6ACUdm+ZO
 +jyZIBphpN/TmOT6FDK5YORexNuOWxrwkPAWApG+O1TyX589guSnXVoZnP2Gi4LmY3MXDHOLYpW
 m9GunD4kot+P+bfPmTpnk5Km2FQVPbIG02YgrTh4QspCvzkKWLrKeOS/5ix4estneumSrCE7bn5
 2TpHSV6mV2MTEdibFVBpHBgfJvjaKo/Dd+GuJGDJqDmaQIM1JUMMr0HzKfp9hePGczRoGi+uePv
 AfdkaALgZ0+Vwpvaf8V+qJsZRvbsR3E1Ftg1hKthQknbiJ501FZwxXJ6LrsxCfLAiXojs1G0v1m
 IWpSPbjhgqXsI2dNCk2R+yTD7UKceM5OvQuVc6PSWsSlP+2o2EG1h9LiE7ZQDzjFL4oSjkOMcNn
 krG3XrxuvigsmnxnLJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDI0MSBTYWx0ZWRfXyhtfEPfdujlH
 4XwnSZ5KBl20XBqgPNIR5yXJhZtmeOUyglfOlVXzZBiXx2uJ5jxIc+HJALoLjRWI/VyxLxCiQ2c
 NziWmd/VDBm1SxUrbsFCbYQL3p4oQZk=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a459522 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=RsXTvpzNeT9CGwFVSHAA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: V71eMp-6h6AWiG1V-OUSwi-6b_3bqL8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010241
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115806-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,52pri5c4j4ti:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:prasad.kumpatla@oss.qualcomm.com,m:quic_srivasam@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 281066F21DA

On Wed, Jul 01, 2026 at 05:31:14PM +0100, Srinivas Kandagatla wrote:
> Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur
> for proper sound support.
> 
> Also add GPR (Generic Pack router) node along with APM (Audio Process
> Manager) and PRM (Proxy resource Manager) audio services.
> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Should be the last tag.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 263 +++++++++++++++++++++++++++
>  1 file changed, 263 insertions(+)
> 

-- 
With best wishes
Dmitry

