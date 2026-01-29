Return-Path: <linux-arm-msm+bounces-91189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP62J3F4e2nWEwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:10:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5EFB151A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D82843004D2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 15:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2947309EEC;
	Thu, 29 Jan 2026 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="BBeN9Gd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996521BBBFC;
	Thu, 29 Jan 2026 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769699439; cv=none; b=lFlX6PLizhFxM+Id5ELoJFW0H6PZpvjL0CBZ6IfgjGwjbNNZjYCEs5taKekNYmQ0jo54wEUZ58267EVGRgOG+CrkKHVle/Pm9kdzF3ZpNwqGTvzmR2Nd8pNyU0sUnRgbaxlBmiLyCz36xwDJIQ1+Ai9px7mvpQ/TGsIrkYgNyI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769699439; c=relaxed/simple;
	bh=IRHR5iQWIdeZaSG8skB+OmLU3CRMfWy31KvWkdkrpmM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=t0puQ/fgMlTcGHjR5XvyHYhafDOOQbpzbouTtUG8Mw+vu5E64vvanZ6QqkAAjjenLH8jybO9twWF011rOP7bWUXU+8ZjcW0GcTDnXLp/rT3/WcJB8TSMySw0KKE3D5SLJe4jmOK6QVAyEJND6VkhY4EVYP9FpkgVlgGQEM68fpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=BBeN9Gd3; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769699430; x=1770304230; i=markus.elfring@web.de;
	bh=IRHR5iQWIdeZaSG8skB+OmLU3CRMfWy31KvWkdkrpmM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BBeN9Gd3fqHO3PZKIr5aHfEFm3gfWGraXQzJJAd/uGBqi35ecXfN3wJKbbW7AIRj
	 Olq42SSb9nC47Pa7YHzjuzrlp9nZu8+ZI4bLOnsHQH6t+b4uIQ401T0ywSSkPHD+k
	 8HD5SWpSuWu46Fviv7qWOs++u1K378o2tff2kRQYmbtINBLM7XxypMq4tQC6lNPPp
	 o1XXWo7l7BSj70FMk8i1mW/ZeDLzgj7TlyVcnIiG4ANk9z0aitOC7w5cee9vQG8vr
	 uoFYKY6SibX4VrxVpCUOKNHYUaDIQdc34uzBghPrfnXMSHLmr2VJLc+Ag4pbZJ4DV
	 t960TytNe/+g0Qvmqw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.239]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCXVZ-1vbp0n1Wi3-000aa2; Thu, 29
 Jan 2026 16:10:30 +0100
Message-ID: <5795f914-e01d-4b85-82da-0e4762c81cc3@web.de>
Date: Thu, 29 Jan 2026 16:10:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
 linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Aniket Randive <aniket.randive@oss.qualcomm.com>,
 Chandana Chiluveru <chandana.chiluveru@oss.qualcomm.com>,
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
 Visweswara Tanuku <quic_vtanuku@quicinc.com>
References: <20260122151008.2149252-3-praveen.talari@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] spi: geni-qcom: Fix abort sequence execution for
 serial engine errors
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260122151008.2149252-3-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:loZby3KIyGpFeJspHQFrROPYnc6jxUFh2bEXPlm5Vt4VbiFKtvm
 hP9ZOCWqvyXmnsfyVMNoTjQ+UodgUnkQffvys5PoiwYbyAFxaOjz8PpUyoOhwKkJVVDK0Nw
 W1qUdo4NdIWb5XSB7QyamJWKb+UNO8QKDnTlMuaeBWAsuyA0gy8LRGhqCNe82X+TCyjNvYh
 5LwOSL5MwQF9pgFUWt9ag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Q7WFC7noZ2Q=;DBy63u3ZTQP9As+fXA/J7n5g6kJ
 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
 P5NSGTFw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91189-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[web.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7E5EFB151A
X-Rspamd-Action: no action

> Fix this by ensuring the abort sequence and DMA reset always execute dur=
ing
> error recovery, as both are required for proper serial engine error
> handling.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc7#n145

Regards,
Markus

