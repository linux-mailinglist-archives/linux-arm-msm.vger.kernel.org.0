Return-Path: <linux-arm-msm+bounces-101718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFipMhUX0GmV3AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:37:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BD9397BBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B3F730D8B0C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 19:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA6E3D6497;
	Fri,  3 Apr 2026 19:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OA9PLhXO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPadb/yA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466933EAED
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 19:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244758; cv=none; b=bujFBD1E+MZB2WFt5a4kRGr71G67iIESnkCTlMxXjGfc8WBKmTzy1vEVkwFJ8stidVqwjrFP/wOvS2YDSJaOJr9clmwiDmKSBw2h4/TjlC6/xDReqrm0P85HjZ7eAAipoUnjceBpAAWpeYaZ+2sjXzAIjG9LOl4ZTN7pEbbi1tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244758; c=relaxed/simple;
	bh=rLBiThT6tmdqB3wRgoadCQfsJcjxkTpktBDsZA0y4hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxFhtISjkK7kPiQcFs9hBUa+H6sp+DQKzPbMJQvVk3yhmiprnBtYyqIi8PImg3rZgEaUj9aNqSShfpg1I54fhg7r88xA89NqNGI63Z41OSo2c3tBKzelIg2qgFMq30+myH4NMCcnS8i6xBK7cL4JMZo7qkjD94Ttw3TwKCmOJO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OA9PLhXO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPadb/yA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633G71Ha2707224
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 19:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=miF4cwndo+UagGtGzMGwU83n
	O7jsT3rW3iUuyZWlKVU=; b=OA9PLhXO3sLjtUco54mVLdVYVzlsxNPFOMTCF0EO
	LJRNW37pUdeK16IzY+5UB9lxjbNEiKMZ255B9KWDEK9upEArlemlVA0pa66B+XC8
	AGZcVKTfoADssrX6+HIPdCfFPyK/RNSUPN2imTcGA79tcOEnMMd1eU8I7f9E5Ar4
	NUiaYfdQztTQvj4YOoVI1UCrfEowqctWrX1N3NOEa1e+5NqHf0usFgfwvSX+A/hN
	eWkYdlNx0HS+OxGZwwFa4wJ/xAutWhMcsrLTfVdxHoAlIvRItm8jFxYJ4KvQkAsS
	vTGVwQ092tJGGTF2D72fv9VKh3SuK6h53aMmNILvWsTpSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjkj20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 19:32:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091327215dso105577411cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 12:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244755; x=1775849555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=miF4cwndo+UagGtGzMGwU83nO7jsT3rW3iUuyZWlKVU=;
        b=DPadb/yA9Yc/hOg4b3kXCZMsEqmkG95hur1+rLSvDHQ0SHaG2L5vPmfJd5NOMPTf26
         f57ILZQmRASMplepikC71Xfhf8MDssY5IvYqfG/INzVD3C/CJjRlsovydJsPggbS6l97
         GmgcV5jWSk5ToFW0OCo8be4pJcScamdOVVunIWEXSVDo0taBCVqfaxE+u9+0Fntw/y5y
         OJnr4F9/LKs5n+wwbCvXPlWfxJDWU9vSkDf3dUKNJgfuYSIzViyicBqqFL3uYLJ0us/m
         b+To1uqYDnd2xL4DfX6XW27D8a6FZd3HuaKnvOORlX9BSvbKsA3noDA1IW7uqhKZ+hAf
         3j4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244755; x=1775849555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miF4cwndo+UagGtGzMGwU83nO7jsT3rW3iUuyZWlKVU=;
        b=ltGAlnKcumKopdcdq1teFIe3y9Oglv0VRv8f8/u99B3CSB3Vpxm779MDpqDHBbSbgb
         jFmU8Zb8p8toOO/llEpUjFSBRBXyK1mhd9EYlxSqEc7hahMa3C+v+aItEWGRpCyCeKEu
         bndexyQSetu6zTLlCG8pdzW5oIj/xiTcD4Kv+rnfxCIHySqHyZQtN7SR9pvJkbetXNOy
         h2xz4TBCDWEjdut8jNj6UondVyYjKS3A/zX/nXbm2ZTcJIWTMxRLbNxP9gTkSvsozD3v
         mh2nzEqrRVzpkrXnU7Sr7NssOg+sdyyjYLed+HrLtsxyjCE5dVF22UcmiIfXQ59eU2C6
         qfKw==
X-Forwarded-Encrypted: i=1; AJvYcCXWJ1rLTIpoMRhSxjXJ8v/o70U6ZCjIzU1BR7cKqn28TtTMQGt409sU+ktZSzUmPjOTQtI6LPjzluA1wHHr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8nVh0PsTTS1ZISt0VrIv/Dbx96L5yH/5qtG1lDZWiCwI9dwHy
	oqhncQkVfwo2kgMqa53VoPjG3fDVWXmVGNnBVc8NabAc1tV8y41VkTgOzYjTn18ozopYRGbVW1c
	ed2MYmrfXmgBhJMamCc7U13rRkmdKV1kLYpBFSdTk3DsHqbh4uKC7/4UAGn7RYisvJobA
X-Gm-Gg: ATEYQzygG11u694jK8XKIF382wlFS8Qr8Uqh/NAIZv9+oB5raH1BVWpsPqR644JkrHl
	rqTe+JNPm5qAoiWOMEAWGu116/2LYVuALXmnDpoRPB+S2YTc0KKgiOYC1hfT/MBk8DUI27bp4cb
	nons32Whoum9WfwovWm3/S4XpraMGQQ4rd1JpOqSbndOiiOV3XM5d+wRq5Gpu6a1HTS0U4qy8Y2
	gmyzxX8xq1Wv6Cf4bon/Drd7PoRG0BpFTEETB7t1xjMZ/5vD/vRfgeBlSG591OrTIwFjfU1Wvdx
	zmrfP1X2cS4cUYTXohBn/BzViDSBfhpzdlv+/81NWYZoJ83mmff/bKRmcZ/5cBQL0jUzHbd71yN
	AahbdxiRJa1w8QdVUqOYHT0Cp02OGGIH8bZC1Te2ZRTm2jxOVkPQp+Qw3KfZfjGN+Q0B093hxZQ
	EHImR3P5Ww367xaaaYE9QicQ+qUayNeXpUmqI=
X-Received: by 2002:a05:622a:4112:b0:50d:6e4b:d8f4 with SMTP id d75a77b69052e-50d6e4be7edmr33157441cf.21.1775244755145;
        Fri, 03 Apr 2026 12:32:35 -0700 (PDT)
X-Received: by 2002:a05:622a:4112:b0:50d:6e4b:d8f4 with SMTP id d75a77b69052e-50d6e4be7edmr33157031cf.21.1775244754737;
        Fri, 03 Apr 2026 12:32:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fa8a79sm14362611fa.1.2026.04.03.12.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:32:33 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:32:31 +0300
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
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: milos: Split up uart11 pinctrl
Message-ID: <ep7xrcp5pvtcepq4wmiy7p2qal2qaupz3pae2cxopfnqwxqtij@ftzlldtpowdg>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
X-Proofpoint-GUID: AKMvBg9Kg3ajgtudpRQngdZrxxrHRaY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NCBTYWx0ZWRfX1xCLqe2CsfTp
 ZshmVffJ0imLXw+WOIgu1tIFM2udx7k0YZvEFGMXHpuua0cygRfiV6PaUziCzCwpkLWA5TJMdrN
 SxsrlAU6yubyld3ZCBiyIds/tj1HNEHJcUdeiJwuqW2gV9TJxzx2XML2iS8cat6vPMU2ydiHJbb
 qwLol+QAw4Vq4zCtYDpGEwkF6hF8YAOq0JxKwCz1mqDhqfaSj9QnWaBcrD4bZlgPtlMzk5bj1+1
 EkMoC04s/8uRqugyAYdZrb57AGMWqbfmU9RsCqDoweVQ/dwN5ViGgJpSMEUUTe009FOmGzpD3P/
 qMrgrfJcydz+8VEr+lvFB+UkJa4YxcM4CRx34zrs6LLfQpBHPx97FWdzZu+OWXYEsMpsoso7sgr
 shUJyF7Qj1r/bi2aT9EtLLbSCiuxg79KpAcxn3SGXuCTLGpDAFOl5DNcHTqQTKPThYqqlh8rUdO
 UcszdPh+g8iOhsE/+tA==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69d015d3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=WCMWw2a6SM-JmIkApqcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: AKMvBg9Kg3ajgtudpRQngdZrxxrHRaY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030174
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
	TAGGED_FROM(0.00)[bounces-101718-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net,lists.sr.ht,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,fairphone.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65BD9397BBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:52:50PM +0200, Luca Weiss wrote:
> In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
> split up the pinctrl configuration into 4 nodes so that boards can set
> some properties separately.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

