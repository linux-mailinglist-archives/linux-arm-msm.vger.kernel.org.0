Return-Path: <linux-arm-msm+bounces-112719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6m5jAW+UKmqSswMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:56:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 879E0671167
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:56:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="XjiNWG/H";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112719-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112719-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C69793016D1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92F43CAA5D;
	Thu, 11 Jun 2026 10:56:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C963D9DB9
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:56:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175373; cv=pass; b=KiRPNubeLpnanEqVLsthpvXy1sg1thJktN14xmWQ40kvdRdk4AK8hd/OJFQkzKmZSDgo4RN3EkV4oFZxHGZrF6tRKDEQro1KLVKF12/qB5N7fjrcFEZEO8x6OoxBrWOu2fpzxwK0tpBu3Rxjw2jEbgFp4qeXP3Z7Kja3eMBE51w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175373; c=relaxed/simple;
	bh=luwhS5VkVprOXRSpKOHs4TEOxJfjtiFwMOP/OMytiOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsup5um+MbVBQsDnMaQ8mnhID6RB1U01KWJc3MS+p9917mlXCG+OBQn1DPFlSWIt3Nzj2Ee3GGPXsuqszqqsxkeg/IOVAOMv/HUDC1p9kvu7SZ7lyjNNWBXQJ8sHfUWg0MN+XBScnfTziMDUflMC+00Zx16CxYpLGKHEN07momg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjiNWG/H; arc=pass smtp.client-ip=209.85.208.50
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6924a68e3f3so5104295a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781175370; cv=none;
        d=google.com; s=arc-20240605;
        b=R8lq4U06GsXXq2M59chVoJ4fKJO7llnMveEcPugndqGrlrnDplZvwTq35uxt/aJWNM
         xfjd2XhivRuEYA7aMF4IXqqI7eIhb9M9uR3KEXJlyX10gauP9qZDVqOYbod2sPdtw9Ru
         V/nsqDFDcvjSK+m577UK6qMiL3oGLNEFqMq+XeJzlpiFgH4zW2Tj63DbHT7sO6bj6wI1
         ulfWw74i7cjmXDNgYxRhmEMw3QqXEfvB01NP4IcmOO1RInJnOsykyD5prpXDEQHnpH3L
         qG8H+X4aXds+26kWTzYJ2wGbAVyfdB2M+WqVPpjB8tBoARlRIr45fPxdw3T/452XxPlX
         ziZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=luwhS5VkVprOXRSpKOHs4TEOxJfjtiFwMOP/OMytiOg=;
        fh=Z5GvhrayOZhA0bJL0BYFVOwtXuoJXniis/SDaHtkPZg=;
        b=GXHWrKWNoMT21fSK5hKFU4GMidtmG7ipJcjfARSqcMfhnusma4XQHSLwDN7FFCRB5C
         dnHQd5dDpZdTxe6Rn3T9uSVo+wyCcVFendTiwImlVi730Ow8OG2FGpj0LB0VK9bXSu/h
         hpTHRgA/wGaQQaPE0sv1FCBVHaQX39iuft1+AUj6d2PnjVfowjrBrJbE3Btqa4UlXCiK
         7kXUpwYqtBynlKAmcvwcYFVUSgCidTPEo5sU6o3PyYdG8WBJEu7XMwoSW5yANxvBgXcR
         wX0aaR/t5qWH7KXLjQIIk3D3Z5pwe/XD4wCwnmaYCk/nKtgSm1WzmvHEuWKRUC2wXbhF
         fxLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781175370; x=1781780170; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=luwhS5VkVprOXRSpKOHs4TEOxJfjtiFwMOP/OMytiOg=;
        b=XjiNWG/HKl11GxBEljH/pT4h0OIKpvBMwaymPl1yCDeBzSQGr7e68n0PZStPwI3EmQ
         5/n8KIAUkJaEwVnhU9Jx3gWQjlvc24LNktuqD9Ga8BJfo/QW8YJOM/AllV5XfHBtVJ/q
         4zmAPeSeeJ3rlmQfcAFdeZd0PutFjXSA6pU9VmYmss/0s6VB8oz8CfqCsS9HDsMO0p2c
         Clh832MEooLeTul/r5B6AFuLSVVUdAlyttCB0Gdh6KgPLVZNeA6aVyWbwI2UdGwhury7
         vO7VZL1VuqsERRdPoG9yN+UoitYR45+kA9kZu8GS1TqaUqq2hu/N42lByk9sx1lyV6Yw
         mpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175370; x=1781780170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luwhS5VkVprOXRSpKOHs4TEOxJfjtiFwMOP/OMytiOg=;
        b=WoRZI5LkI9MrtR3YzKUAcko/JZG3b9U+qp6hndXgTLUhLuQys6WUGzaWv37p76ctSc
         YRxPEBjdIARIPlIM5tuNkssMtPdL1w7Mg7OkGZsxOzeff+3k+XyXmSivRhfzP0ZUK9x8
         h91UCKI5/zDfcHlBEB3P/Aflk+S4nivL1Alq3cpIc+OBXCHGeHJWYyAxXQ17f1TJ/8gY
         cuRVgU0R7Ysu4nM/yHuzvYJ5sWG88vDZoMmuZBNe58vfERP2sCASSDFmrQwIF0+thRxr
         I44HfLFOxvOped8pXtQz6gGEVpe4SlK605fyJWW1YnLrNpPq+nrM3TUFw6uyZyFvQGMA
         eJhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CfmN0JeqcP4ZbFgSx5UvHREQSXOqZNnvBD2Y2KL2Tg89SmXT8YLxwzcmWm90WN8nOLOQ8cXgEWhjKTBZN@vger.kernel.org
X-Gm-Message-State: AOJu0YwLv3bIIU2gGVhg16ZuK5gRYjBX68s1/yQD7NCgWzVtpSV5yM5s
	SRW33ScXFjuRKPkAbzrKUfm7A64Oe1kLX3HJ44R9hoYnFBj7OHulyWHFGWT5h4mi628SkZ4CuHV
	GYdxqbeJ/IXJ19QBg+nsDWS7OWNSitco=
X-Gm-Gg: Acq92OFXIOI3N/LeOwol+9vGLdD9GKZmcmjIXzSANar/QHpe1sds0MordXoOTEHwqZR
	hExWooX0KaBiv6lqT1lWpabstSaAxUl9KLEzHPk0W77hYdN/fMP8PYGt9LYzt8x54jL3l50LI4U
	2ksTshFU9ZFhYeEV/BJ+mRw3XaGmBuHY3DlT7GmarZcrJFQf0dljrDwVUCfVn9LMM6VLpGAfB5O
	TKHRIQXRgwdTMSYAcWYKY0n8ae3K3UMcsbbfQi19vYW84Cw6Kozm3FFKrh80eCBvGvsoK1JJ0M3
	4It0ad4P5XC5MiQsYTpNU/nwy+9NZUC/v8KMvHGJOZtS0Ueh2GmItsYVUwNdliffAu/ahLUG/Wo
	MmRlkQsv/zLHjZ4Q=
X-Received: by 2002:a05:6402:1469:b0:68b:31c5:86f7 with SMTP id
 4fb4d7f45d1cf-6930e32ca54mr1052454a12.16.1781175370165; Thu, 11 Jun 2026
 03:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com> <8be0a964-e2fc-4c0a-a5ca-0e9e42b3d747@linaro.org>
In-Reply-To: <8be0a964-e2fc-4c0a-a5ca-0e9e42b3d747@linaro.org>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Thu, 11 Jun 2026 16:25:58 +0530
X-Gm-Features: AVVi8CeoYZl3tGdsy3kf7c0CBQMbyXc8Ifs4B6x18dtA99RJC4z5NJ6-soBhOkM
Message-ID: <CAJTcUFSLoQN0Opn_2LY1QT3EiSo7+nybebbOoscUSaTWF_HGAQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] media/arm64: HM1092 IR camera and ASUS Zenbook A14
 (X1P42100) camera support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Aleksandrs Vinarskis <alex@vinarskis.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112719-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 879E0671167

On Thu, 11 Jun 2026 at 15:31, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
> This patch should be removed from consideration, since it is not based on
> the upstream codebase.
>
> I'd suggest you to upstream the sensor driver only through linux-media, which
> is patches 2/9 and 3/8, all other changes should go only after it.

Will do, thanks. This is my first submission, so I hadn't realised the
sensor driver should go on its own. For v2, I'll send the HM1092 binding
and driver as a standalone linux-media series, and then I'll post the
A14 DTS and
PHY enablement separately once the driver and its prerequisites have landed

--

