Return-Path: <linux-arm-msm+bounces-118996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6vGZGoUFVmqWyAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 11:46:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ADB75309A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 11:46:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZogzCITA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gLy1sJt/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118996-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118996-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E4483109716
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2490A43FD2B;
	Tue, 14 Jul 2026 09:40:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20EB43FD07
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 09:40:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784022050; cv=none; b=bJWBGUqFtoVfgIZ0K5/WEa6IKGZIApUjx8qNjXQWOGEuSSb2aWedXpHLdOz6UXQSNsPILpmKuBwviSZ62LMW/HKzWeIJ7RJ69UHKwi+Lfwla9uouG7bMvGOV+NU+NcIMOZerl3pDnmfWffWwOgEiff9+oIT+BQFB541aoWBOr34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784022050; c=relaxed/simple;
	bh=4uVlRLOB2Dz2ou/g2e0sj8ArDYM9B8BpWIoR8yhRqos=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TyrTHbxKGrEpX0FfeHjcUXJW21GeoITcoBfDYqdveJOuvabhLtVcJx0MlxSdmqp9+l6rmyuO4MUpISWAJBPsTcun2eVEQytrqb/74k6BQoh/IxER6ILBLvMp4OEda8LKJ/37pTE4mmYDLsUERMmFRKwgY/BIcDBeQySG03+Xrnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZogzCITA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLy1sJt/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SbJT4005305
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 09:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9WmUzQ33MErj9lXDVH3MM2QRZKZngI8rpWpc6ys6++4=; b=ZogzCITAYjBl50RR
	IzoyMdMx7TJwj/U4yfgyiK3575WU78YkfPZNLsPdjL9y5Q07VPk0jumgDCO6F7Z9
	DwHP7P6bd6YIZVP6EoUvDmhJmJ2aB8yS6/uqCepFHIUFMJabbsKB6gvCywo1zpG9
	/K35sQrK2r+OyEjQIf7BsYxKtT5pw4k8NrQIUX3olKpVQe+PzEyaDd7IzdZrDaC/
	Sf9Bgn9gk+YU1fsnVEB8Ts/rXxxXkL65BrEofMqHg59PBbZijy9prZW/s7VsGBLz
	ftrwkxf9D+pA2JOT0xviWbn94VxeDo6t7T/b8C6YmtNt08sfPnd4SIyOsZxNr9CN
	FpglMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44cu3nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 09:40:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so11116195ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 02:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784022045; x=1784626845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WmUzQ33MErj9lXDVH3MM2QRZKZngI8rpWpc6ys6++4=;
        b=gLy1sJt/K1JtIgs3xqi/UO2yeRkgpZJrJ0VmZZsSjQFljhf9TQzQT2EPqESCLHX4rX
         TLUbfOer84YjSYhC0TZyb7RbxHFaL+tXuIWBWVDXYQGXLvYJpOEVIVi1LLDg3L6pN7nv
         6YATN3LjXcaifuCxlmjAMAFW4rMuXX4t262W0GKQ2NJ4v71uXCjzXdXEwbU30tniw/4F
         5VhxMEtT7v4me2PwX+th51f/37yKZ1CAQdm7KIiMZ/DzYQ/GgvIcrP1l9vJrI6bnnksu
         VjnAum3jh6iuXmWVODWYcQh8nHexStMfggmJX4PG6wuisCrkDwSBQZqBS+l6XIYsIAKY
         FNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784022045; x=1784626845;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WmUzQ33MErj9lXDVH3MM2QRZKZngI8rpWpc6ys6++4=;
        b=RLMh5inqrJGkHTxgtc82waDCqEpYMFwgesBtPeoWltpy6y5tEG6OG2hg88MDCOwtqj
         4W2Y3f6EpU9bgq9Vg6KM/zKNxPj1lcvUpn03QvLKpXXA1tAZ4XCrAmMhbKE1uMwqXDmK
         lyq+6r/WKiCKCuKMzUZg+uIPtzjlJ38PyESJEJmXUekCQ+nMOGtHKrPhWFzRuZAmlN2x
         YL7EDAMLdKG9dWpDKRPym04bhOgsnJUy1KjXNEpWcbbYBL+oojGxzYFvJ8FWFt5iUY+S
         7Y29wtFSf8KmgY+2NclKKiXcSyYwjMPZVwdAwVoKPWRfOLkEERubEfVWaPnHy1MxIVz9
         DnMw==
X-Forwarded-Encrypted: i=1; AHgh+RplHRl2cx5D0y8c8Qm4kMjswOJCk4vel9XI8vXYLGM5onMgIxwgTMxMmp3lHSMcLBgiraPEn3xCExzdXYi6@vger.kernel.org
X-Gm-Message-State: AOJu0YxHog6vakI53ZO08OBJC3lmX63xhgWcw+yO1PB82L0pZ8Wnm4IS
	H26X5ggIBqSHs91aBYEYpnZHSvg4Mzkmrh4ftNR2Fnh+QML9daxSbCG3e6qHYW9HJSNSXmc2IcV
	FMeSXZpxBQKOSjQUR8Gekm+9KA/sQRJ5fvPUfCy7bBfMdxHZ7H/Nod+gxZXI8Bd8czTFS
X-Gm-Gg: AfdE7clMp0GpN1roQk9nYkw07OxZUy/WINFXDyTrHGLLZguAEFjdOrXNBvieXk1hiex
	IfUPGLX82npMkVRM18E4tfnv3BZG4DC5f3YLkuawIeP/3N2TVnlwS2mPxVjuxk1ux20nDCs3eG/
	0XWR48/rC2/eOn6ko5gP9nI0IMtB3tCmkc8WKvmi4W/XVLzz6OEXxVHsq7fwo0Y7BvU8be3tYFS
	vuDbSTwj57pnR05b8jcWpkVkGELBlEfjDFNfRZFJr3h8PhRex3Oo7WFLAslaqLAIG5E5WJJzg0H
	juyeI1cxJw4VRtOq1/zB7k58u7OJaqJEF0WMx5fORHSka3Rx+VawJpaqhm8BNL7oesZ+8FZKxV0
	vR4ZyhDFtKWaDBvli5EYgLgxmNkVVkBuTP7V3woBscA==
X-Received: by 2002:a17:903:15c3:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2ce9e99be82mr125379025ad.13.1784022045005;
        Tue, 14 Jul 2026 02:40:45 -0700 (PDT)
X-Received: by 2002:a17:903:15c3:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2ce9e99be82mr125378715ad.13.1784022044490;
        Tue, 14 Jul 2026 02:40:44 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1edb0sm112560315ad.53.2026.07.14.02.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 02:40:44 -0700 (PDT)
Message-ID: <3942cbf8-62ac-4bdd-8fa7-fac6e121d5e2@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:10:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: crypto: qcom,inline-crypto-engine:
 Fix legacy/new SoC strictness split
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
 <20260706-b4-shikra_crypto_changse-v3-1-23b4c2054227@oss.qualcomm.com>
 <20260708-splendid-outrageous-saluki-aa52f5@quoll>
 <d9b63658-b588-4103-a247-cdd78910a89c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d9b63658-b588-4103-a247-cdd78910a89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h_lIDzybGlapVBC2MuPxGOzV7yc_y0jO
X-Proofpoint-ORIG-GUID: h_lIDzybGlapVBC2MuPxGOzV7yc_y0jO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwMCBTYWx0ZWRfXwjmNiLcYGpgj
 ZyQ65vk+B4keb0kOY9PEcSDD/KcS6C0Mz9LjLCI66Cq7KuW88FYOQJLAVbagSSeFQjqJRfOFhym
 tEanMiYML9x/+9gT81Sh8z/9jnCiLDo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwMCBTYWx0ZWRfX/D1RzrltvGaV
 mz5YmqLGT6ncAr8HSUqsqjfKcDPW2vgP3Q3d82yZtgkBwxh1AlE8rweFIhZik2tHZOfOvKxgH7u
 N51N0Hm65W0JPhpBMMPiNPAPgBG+GP39imzjKa0eYF5hJ/4lwbImh55j7E9++aOf0eZdD6eUfR0
 VoJ3V+oCKECwqoogtR4HsbHt84OCC8ZVelgeC7tHQaPT7svRsUcRSxx+ZRag09syGqOgFrc9Cd5
 HgvP0c9bs2DSUF9+aB2cv2k9W5Znt6WISTbLZYk/FxXxoJMyafhRb2wV//SbLgDX/fDMO8G7kcR
 J6qXFoZLEgpbuTbmIY6hUQYVY8TRyCJwR0i44WBGaKm1Ims0Rj8xR1cldPJLfzPa1ELq/Bbl8k5
 FkHhbH4lGlhwyxUU4eKx1GpRYFcU9JV6y+XGTABh83RPy9IaKBrZMO+tWdm8EU0jV7AXwUjB7xd
 tGIlkk1h1cBN+me3ppw==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a56041d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=f0zYKoChvmPFgximC2kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118996-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5ADB75309A

>> To re-iterate: You change the ABI for Hawi, this must be expressed and
>> explained why.
> 
> Ohh I see, hawi is different case(compared to milos/eliza) where
> bindings define the compatible but somehow was relaxed(got missed
> probably) from 2 clocks recommendation.
> Just hawi compatible is defined but no DT entry is present actually.
> 
>> I do not see any change in commit msg (listing "new SoC"
>> is not what I meant is not relevant here - it even suggests like
>> everything is here done without impact).

Hi Krzysztof,

It seems Herbert picked bindings patches of hawi/maili/nord and they are
now part of 2 clocks list.
This means there's no special case of hawi now and current change will
remain intact.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml#n60

Next rev just require rebasing. I'll do and post that.

-- 
Regards
Kuldeep


