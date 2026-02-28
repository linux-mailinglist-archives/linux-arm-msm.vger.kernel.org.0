Return-Path: <linux-arm-msm+bounces-94646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCWQJnlpo2mACgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 23:17:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E441C96EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 23:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3B613014945
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F056A3D3CFD;
	Sat, 28 Feb 2026 22:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="VrQEcZTl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B96A394460;
	Sat, 28 Feb 2026 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772317016; cv=none; b=f+gDsgyliObwGGTZe//3OTJMcB5cisXGI0LY3nYH9lM2p9Y1XLD3ZzG8J5fBCRmPFbJPkSEHPKzUUEnx7+FEHyz9LTbdzr/aXVqp41d8BbOlOOQitVOlKda/GUf3WG8/Hf1gLusUkFaujfL373B2EBJh7dr+KGtLAeZ2QbsQqvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772317016; c=relaxed/simple;
	bh=po1GJ5OL+l37vGYwOeXHbTRrLbPHVWf6bedwzCyotzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqTdCNlBc/H6ylqVM1n0ob2AQ2LnSt2CAu8QGfy2/2S9iqVp2iDFPWcf/CtEBaWU+nWmu7A2Z5Ghr+rqkhYQHfAARzw0sNtz2Ygr4bqhY1hX3LUmoWFZQLPwLEkSsxB9S+crn9jwbN6Xw18VNfp0XHDlsPBfciUa2XnMhPJOCAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=VrQEcZTl; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <c4e93e78-427a-45a6-9560-399b578e9260@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772317013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mo8hhAD0T4w5u4cZDhtfyEdn8aaXHkZHMK1H62Gbpmw=;
	b=VrQEcZTlYvv3IkuNXllFn7cX8Ffj/S6Whqymcl4G5uECvZvknPoJnTjyWRxRoANd5EMbTG
	NfNaaASUoO2EhE5q9lq5zh9Uui+6r0H1IswxdEFvJWolIbxjk23zZUQVxvN37XsvRaECfh
	BcMfr39l9XpcXZll4VNUYcZGAURwkcSOyAgEckX9s3ImA+WDgV1miMo/kyvqAiM7SIMU6X
	BogSeBCDPcrGTpeiuU2jPr8omPStiFtiCTtZ11nNWCCgQwJr5Ltfklm3wrTQHQCW9FWdJy
	mjAgwaU8n/qoaMIGIlSxL7mqo74jwsE3R2o0gqwymjTunXurXtCzK0irezHRHg==
Date: Sat, 28 Feb 2026 19:16:44 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/3] drm/msm/adreno: Trust the SSoT UBWC config
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94646-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:mid,packett.cool:dkim,qualcomm.com:email,treehouse.systems:url]
X-Rspamd-Queue-Id: F2E441C96EC
X-Rspamd-Action: no action

On 1/8/26 11:21 AM, Konrad Dybcio wrote:

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Now that the highest_bank_bit value is retrieved from the running
> system and the global config has been part of the tree for a couple
> of releases, there is no reason to keep any hardcoded values inside
> the GPU driver.
[…]
> -	if (adreno_is_a610(gpu)) {
> -		cfg->highest_bank_bit = 13;
> -		cfg->ubwc_swizzle = 0x7;
> -	}


Just noticed that the SoCs with A610 (SM6115/SM6125) have 
.highest_bank_bit = 14 in drivers/soc/qcom/ubwc_config.c unlike this 13 
value here.

Could this have been the cause of the corruption I saw on SM6115 
initially? [1]

What's really strange though is that I wanted to test this now, but I 
removed the FD_MESA_DEBUG=noubwc workaround that solved it initially…

and the corruption *did not* come back so I can't even repro it to 
confirm that this would fix it o.0


[1]: 
https://cache.treehouse.systems/media_attachments/files/116/083/578/070/293/038/original/9b8e73e15bed644f.jpg 



