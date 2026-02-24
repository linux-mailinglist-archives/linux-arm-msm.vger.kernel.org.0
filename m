Return-Path: <linux-arm-msm+bounces-93924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPFOEF1YnWlzOgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:50:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 944E41834A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22D333041A4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B95E303A12;
	Tue, 24 Feb 2026 07:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NceJLbXF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iqe++zmq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B85339B41
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919264; cv=none; b=RpdQEZt+lKa/RSUP6ScU5JejiIxmB8yaQ8ftg27bwE8S7dPX+TitJrzviW4vxWX8D/eNLMTtXNaXZ/PhYjm2RHA3tteqomOQM0NX+mHicLAwOSto6cAlB0R32ry9aCQCdCYz81yYdCSR4wvpVMuSunSzlGU9/xxGTMidnNhCq30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919264; c=relaxed/simple;
	bh=uSSCkgsucRzlBVF4MBhmS6fCMT5rOHKDP8+phMGopbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2UxpPbWk4tH6Z49/OlhI43lQ1xuneKMOAVUCKKOMC/j3/jsa5fvtMusJA7pq0XSkN/ZVVyzif80OKeecfbIxw7LAeHbFdJSyjPIpu05Zv6LPGQSRJsWxNackLFGDQ+kSNb1k7jrj8Al/VyU9oA4jfUgQ4wvkTGKDnG6EsxekbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NceJLbXF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iqe++zmq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LSgW3123834
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Nkk8MNVa9p4aBb4Bn0e8YFq
	a4T1gMfbm9SGZ2SOdBg=; b=NceJLbXFFswAoCLY4fsBziPCIjA94G8N/Mu483ej
	SSFCBFmhpx2FrmRUAku2eBUDNEZtsfcJEuCjmRp0OZjkHS4vMUD9dckAx/73YAHJ
	rpkYZDYDP6a1tkQsiA2u06/JBS0ynPfBInxGZoXyG1CopIMQ1KGLhpi9TXJuWpcq
	Hlkz5hB0Fttc1NKR72qbVx6yi7Dep0yDKB4R84KawSzV1ipPZyQpV9aIsESSPasj
	oRX9c7mlAJ/It2DadH8W43NCPCkgBkorwMndOJROz1JaIOzrzvE9CZYokzW70WSE
	q8WZkrht8EHu5Ic9nsap8TL0KnZi8Q6DCRGbNBFcT91Lng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8ta92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:47:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso732295385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771919261; x=1772524061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nkk8MNVa9p4aBb4Bn0e8YFqa4T1gMfbm9SGZ2SOdBg=;
        b=Iqe++zmqNboPJqj9eWBYHNylBU6o7o7RtDaa/f7bfIyOBcZvcfGlcM9NDJ7+jWGFtN
         hk6lbcnec/MKq6ILH4fZtKvciUfdBijC/Wt+ou7Cy7juLtZcn8nJ8jti0q6YX7HYqsKX
         mUFf5+8+qHGmzogtLBY9IDJjaJ9L1tM855KW6mxEZfox69t9mpKtpquMd3kmewRbONZn
         TbCaL4oWoRwWVvrymWeWIT2pqWM1A2Se9EoER87Ngv0tihK2fBZM//XpiE5030y5g6Lt
         dr2ySt5CNqHXUU31GqaEVlqj4dnh8461R5oRSY5YboocdXXbgkojhawTvJbR57P0608Z
         SjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771919261; x=1772524061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Nkk8MNVa9p4aBb4Bn0e8YFqa4T1gMfbm9SGZ2SOdBg=;
        b=wKkz14G7NiRFIkVGmK5Ii7wvBes+VKEc/J0LMOUV7LF+y7ZvWKw+pC/3gUxgrbIARi
         76wVZSQu7VPCfUlEeb17/0FKqTekEjD4ALYr05Uq8fDpK0clxniwEW9ynkSYGj5Xt0Sy
         U+FE/a2Re8Q7+Ubafgs0/ilK9PKKUu/z9J1QYTtpQo5hviJwGlheJXKQ1l7cpVxvlJnS
         bEWJjJfzXFI1G19JbCZLUxQ4lCRaA/a96/38iMV5fGmYQCBqsyRzmO+QngcvI2ZLJiKE
         fERcoJYU1vhGUahxgBQmLcS1ixy1AB7DYH44XbXn58b6QlS98Z64cKGifhIJjhgc1nBa
         idmw==
X-Forwarded-Encrypted: i=1; AJvYcCWwAAzJ+cKxesA9QSTCHpnIb2+1Su1uYl3xvallnHLAtd4w7h2ujMKFS+hHMmdsnlPOaBBgsL0WdIkbLuGb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9eoqnJrddauPqTtXywc9HRPxG5d/r+Tp7MuEWRCZn2dV7Nou1
	mhKnvArOl6T2fxdAir5VxlqIc4Mba28uTm7FzgUwoSl2/nqwTwbltIqariDUGW1rhb12InPxAHH
	MO0oqpDC4yE4s3eG/vvDgZAeJKFiBuVUbn6xqWmFZn32dtUD5afRvXZzeTlz+qIoqm+gl
X-Gm-Gg: AZuq6aKEMgIDgzow6kVz8k7ncPrNWksNcLBsf7y6XlCDMfGDkReX/pc2CVnOpecV6dU
	S8DAAUJ4KRXN2laS6Q6HNE0NsPH4Hwa7XOfzqlNa6BWIHi+89Px1OU9UeGCsnIPFPhhx4BUBfRD
	TVnr6aJP2BcS/Pamy4ZSk0Oxx2il1jUYiejXU3a0ABVR52GX/5IzfJmaFt0UsmQbtqScPTOsbjI
	3T9MvHi4wTzIP0q7C+vi+hti474H0Uk99vRBMUQaLIrVUbpkZj2zZrfZ8pVGo7USM6Lktl14HyU
	HVmax8jVR85a4BcqiBcAIs6FUlaST/wbQsMp5+einNEcgKcY+WNUDYieykQjPz3DtWg4Ku88+hJ
	DzYlqEd48IbQKaZD5lw2IHABZMxm2WzRZOfOoBO6OoNb78guAVab5H4GpVCJTSBlgEDoL2P75zF
	mu6RAKxa/LrWj5fK8HNa3GnR9QA6gMjFJ4NTs=
X-Received: by 2002:a05:620a:29c6:b0:8ca:55:ac60 with SMTP id af79cd13be357-8cb8ca98dd9mr1369021985a.78.1771919261083;
        Mon, 23 Feb 2026 23:47:41 -0800 (PST)
X-Received: by 2002:a05:620a:29c6:b0:8ca:55:ac60 with SMTP id af79cd13be357-8cb8ca98dd9mr1369019885a.78.1771919260500;
        Mon, 23 Feb 2026 23:47:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb44fb3sm2024777e87.61.2026.02.23.23.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:47:39 -0800 (PST)
Date: Tue, 24 Feb 2026 09:47:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL
 pointer
Message-ID: <itioeaycenubrafp6qy7qknshokosgicgzfzndwrtpj6bfcsxf@penpm5zdqk2e>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LSx_SKB6IA3DFBvMainVKcEmtpUhlCE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2NiBTYWx0ZWRfX8j93ospVJtNE
 y1T8QnfrXGjpgxkTWqpr0b/kBB6m9ibuABvFGGEf6kLek5BBMs5taRO2a6AmoYSusZsE0WedV+K
 FhIIwVHWa1hM/EdG+kxLQVE9VqV5BpR4CLY2D5Quy5wChpJ3B26BYf6sdmveBRP2bxCTw4cwF8z
 pxwv7+z+vCzUv1y8sBQr/DIhgN/RwbJ1XdzlOhJIXXuvFaj5li+a6up8DH1X847DNFN0+gTz+q7
 Hy/c0R3S9fEbXgME4Fz3NwZX09MYGABPCH5IZ6W+oJIMEgaSS9udWIIpGmVX7BKiPzkz7MHPHVv
 9BWaCKbT92IPEqGCP8iW9WwvQ1bX0oQ0he6NmNsrBOz+YznaFlD5atsxmG0Vh4bbMbNruf40exc
 GnGjpTAFPcklg132itHJ7FJu1Qc3BTsDCugWQFteJpJJqqf4HXwoagg6x5o66Lo9Yxodd8YMcNv
 2Csg8XFVNknc81m+BeA==
X-Proofpoint-GUID: LSx_SKB6IA3DFBvMainVKcEmtpUhlCE6
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d579d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=rQXAbXeZuVbgsyajZegA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93924-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 944E41834A0
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 12:04:16PM +0100, Krzysztof Kozlowski wrote:
> Pointers should not use explicit '0' comparison, so just use standard
> evaluation as non-NULL:
> 
>   phy-qcom-qmp-usbc.c:1682:31: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

