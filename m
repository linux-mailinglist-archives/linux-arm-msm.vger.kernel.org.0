Return-Path: <linux-arm-msm+bounces-111312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8BPbNftTImqiVAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 06:43:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41461645113
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 06:43:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=e1NZXkkx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111312-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111312-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B5803047753
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 04:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AED82EEE98;
	Fri,  5 Jun 2026 04:43:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A36C225403
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 04:43:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780634617; cv=pass; b=cdywPKHSJQjZbS3lJ/qjzwYdrZQ8PnftCmCf151FQ67z5NmTSemB2s8N7Uo+7ihqja69PI7fjTszoNKdMOcz9B4g2oz71eMPJDmMOcXnZdItm5g3+d67M2d5gCb8/SsWT479RN0mOXxOdmqXvZA7hfhx30M1HUrCkTmWPMzrPIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780634617; c=relaxed/simple;
	bh=MITCSCbNsWNHD/j8VEN+t/03GrVhR7EFR2ySYOfPBOY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=EWQc/xggMSDLZ8wW7mPY+1dQ8ScM+5wDAA4mYoTlq429MzMoUEDyBEPGgmf8/rRsXtQB77k7ABVP56NRc/FFHA86ddw7eqgpd0o5rc3n3xNuNuWsa18U6OTTu2kO3UeG+TMeIjfefVZ0lvLUbbQM8Y1NVUvCnbcJvyOHHvdNiuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1NZXkkx; arc=pass smtp.client-ip=209.85.210.181
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8423f420455so648709b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 21:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780634615; cv=none;
        d=google.com; s=arc-20240605;
        b=TF95Z41ykTZioew87g9fcLRXgBgwYwdJu68H6+jdO6MXDYuCOhKmSZJfzWS74ePuDH
         8Jdb67y/5CwNmpE115RRbD9j+KwK/sZ0vcGCHcJ8ki62IcF2rxdpcC5+kcJMUWrPYK8z
         4tI0SZezWhiBi4X3Ehs/j567xKBIxmNQvAMoiJg17kVRITUNUusuBKEZV7WKNPnPdEEf
         OnxVkHITVemla1nAaOexNUatjOl0g93McBcFhP/TsQfrP/w1V9on7OQVchUI3vKrL+Jy
         pzvgs820E6oCwKfirRqTfbaNGRNAqGFOFC3MThIWqYGAHHJgjdWNxZgkDF8dDy/uSX1B
         kGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MITCSCbNsWNHD/j8VEN+t/03GrVhR7EFR2ySYOfPBOY=;
        fh=RNnTSOeQT52Yt0Mfiko4D0/fWez81ebqgIKS6gzjHPE=;
        b=HV+uxA76mQ3bbm6PAqdEF0W3laCXC9CnHij0oiYxp1vtjiOLhp+xMs6KYSFXUtWHoz
         m7jZ/Vm7z8tmbuRFLbzfjQKd/jMMZ8iZKZXvP7DE6kmATy6GHTkSCyI5Ah76da4JYVjI
         WLvs8qKzuQZ0R+LV9H1ENZVMogLBHkWxaspja9uhOWdSMa2rbS4K/lKwK2owMSWJ5Ggz
         kpIIIvDHv+I+jzPMymB2ZTvpduMtWUGkgMT4RJbS2IHqIMzFmG/mKXgvrNdqg/d8QQ5Q
         TnAIFT6OkIPaIxaySkKgxZFflGYv6YUlomCUEc4Z72//FBlGzcPFuJ0bZwG7F1hqIBoV
         zY9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780634615; x=1781239415; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MITCSCbNsWNHD/j8VEN+t/03GrVhR7EFR2ySYOfPBOY=;
        b=e1NZXkkxgAaWludQGs72sl2xinLo3s8bCFUkVM4M9gc7RcpfVGGmuGXTKuK2IlDM9b
         KdebaT791Re51C69jfaJ+m6W7mJ2HI9kYUL2tsRCROoO69K9gk7Ss2/iV2SmveLIb9tR
         GpZs5dsxqSrtQN5YTUQP2K0YKQfHID0Se/nqcn9uvaYRQZcEbAlbkT27RXg3rcPZe0kf
         qJJrWjPTioccWCE7AJO1v6i66XZmNhqkqhLZJRHmbi1w/+Q4UHuV7WNucut1YQyOu8JT
         DzEtY6Pd5MkM3S8UU9bI4Aoz2yYNaXoK9lLcec/dPhuKE3VMJUd4geTbFv/cLq4ZPLrG
         GdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780634615; x=1781239415;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MITCSCbNsWNHD/j8VEN+t/03GrVhR7EFR2ySYOfPBOY=;
        b=KxVMGWdXLM+eIviM2KHRXkU/04P/aaW11hlEqsy0tsL2OMZLPLf0pOKlviaVtjDxaT
         28b+Dq5B2TcbahhJ3jOs0XW10cplGogY5GjllY2GCdYUFNHZD5sEq1AZBEPeZolqkGT6
         ZJ4str4C66KOI3l8U7mKMpEjgVOTNXIw31EiPxy6UxiahCPV3d2uNQ6/8wBHxZo8jwFI
         G0VrX28ZBYAmenpq0DenYeiPDG/AGHG8BudvMd/n4Hjo1LbB2txhchJ2UxMG/ktua6Bh
         RohIDHqjTu1EeN1D/+zt/pk95fR8ACqH8/gn81j7k50qsRFWdB4yoLDk9WNvC45AOm+s
         h8xA==
X-Forwarded-Encrypted: i=1; AFNElJ+vNXZJI435aUfnDXrknTeulEXu6ympErWMhcjlRREJNvAeNdaMxF95314OVCPfU68jMokzvemMHqmA9Gjg@vger.kernel.org
X-Gm-Message-State: AOJu0YySnRX8TYDQmS+LLQPrX7bFGOL1XZ72rw1MDeprTBzsy/ovaBgT
	hvgofRy0vih5uI1fCqZaZq1vIUPTFKapJnQLsqteRpJwyBX8lI9SRztHvi9xYnGlfBkyTTXy0PR
	MYqkld0N0QdWOdWmNpxJsyN72k+uiPno=
X-Gm-Gg: Acq92OEsKNlYrU/QgArEvQR/L/amtCnM0iEWnckN+7LySs2ScqvLCs3oaUvCAXUsLSM
	D+bJ0ekKMBFC5gC8PZEnkKY1I/kIrLkDmB8lyF/jKBZUZXAzGUjopp+Bt+Bo+/ltirNYvQwvfbj
	qvDMwd8KeGFlHNxLS5Gj8s7bh5PHWN1sIO8EWXCsUEyiw/jBXSji0yS1gFbm7zhkpfeIrspuoFx
	zIn1iDHShiDyo1NSL+CmUfotcfpQJvt4pEvxflTLLn4Ff2EGlCrg4TXijVW6FDRAL0YOIjYhmxN
	wcNAnJUeM4RLYTiDtQe8FR1IXAoD7Z0piFaN/aUvtT35A9oAtsAqrTWrqkbE
X-Received: by 2002:a05:6a00:4098:b0:842:40f8:74d0 with SMTP id
 d2e1a72fcca58-842b0e2f5fcmr1823544b3a.6.1780634615345; Thu, 04 Jun 2026
 21:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Carter <carterd1016@gmail.com>
Date: Thu, 4 Jun 2026 23:43:24 -0500
X-Gm-Features: AVVi8CffcPSo8s9DT1ALeQJnF5y-62_ThH-wSB_n45JpRFZeqsCGrn9YkwXtWXE
Message-ID: <CAJ+nLsRXTc=3LagGVdNiAPttL38tPVub_UOKuqJq91J9U0M+9w@mail.gmail.com>
Subject: spi: geni-qcom: any planned QSPI support?
To: praveen.talari@oss.qualcomm.com, broonie@kernel.org, andi.shyti@kernel.org
Cc: linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111312-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:andi.shyti@kernel.org,m:linux-spi@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[carterd1016@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[carterd1016@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41461645113

I hope I've found myself in the correct location; I haven't ever
officially participated in kernel shenanigans. I've been working on
enabling the trackpad on a Surface Laptop 7 (x1e80100, "romulus"). The
touchpad is an HID-over-SPI device (with a driver patched from
https://lore.kernel.org/all/20260402-send-upstream-v3-0-6091c458d357@chromium.org/)
hanging off a GENI QUP serial engine (spi19 / qup2_se3), but it
requires QSPI transfers - the SE reports protocol 9 which is unknown
to the mainline spi-geni-qcom driver.

I did find a patch for this driver online out of the linux-surface
community which may have even gotten it from another source. The patch
seems to work, however it is very low quality and I suspect it may
have been vibe-coded. I wanted to ask: is there any active or planned
work to add a QSPI mode to qcom,geni-spi controllers? I was unable to
personally find any related patches or conversations on lore, but I
may not have been searching in the right places.

If nothing exists, I'm happy to make an attempt myself. I worry about
getting in the way of more important matters as this would be my first
time submitting any patch work and I am bound to make mistakes, but I
will attempt it where that is welcome.

Thanks for any guidance,
Carter Davis

