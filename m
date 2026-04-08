Return-Path: <linux-arm-msm+bounces-102309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB9LH1ko1mnqBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:05:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C013BA433
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 510563045002
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 10:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B313ACA45;
	Wed,  8 Apr 2026 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WqLwfpPJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CC83B27FF
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642606; cv=pass; b=iPdMDFIIC/lwcgpd0XUic4r6s/sFdkMdHYM5p3E8J8Dox5ov8SfOyPtNvox3aBXpi1gNwEAxAcAxC5JPKq/s/eRvvNU3CmGoeyQy+NmjA6wtYDnfSxL0QXqDPrPVey4wJhn32vjVzn68Lav+V5ZOdj3KZXE/fTMPA6owRKkoSTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642606; c=relaxed/simple;
	bh=pp052ayrbRL4wt7LydpOTffYxrE1Uhcra5kIgYO9sag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aai231HfIvFvaYKUsUuuS/VhmHnFkBMynfS2JLPmrqKjiASkvs4jga1ndp5Kt1f5DKlxQKII75Aa/92FYIBt1iwDN0kazezeDN15O5H+F9qRZg92NPEWFJtucpjpt6cF4gJJBCk+uKODy4O3XcYcrvz9ZD45C42TJG0HnINowus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WqLwfpPJ; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2b542cbaaso6579749e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 03:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775642598; cv=none;
        d=google.com; s=arc-20240605;
        b=WLSjkoFGm5Ta0yFtzd8o9XPisqJ0NObvn2ZFyuDvrTLVbj7d4N9t5xrp5Wr2k2XyBx
         iAz4Npc+yogFD++RxBAFpvedH1W9xO7GsPfTtaglP70UpHb5Zx64REdCvOw1Eb+B6+1B
         EPjoqg8liu5MYa8mgM8UK+UsinNpDCMYjSjHY/XGGt0VeaKh36lDqXlKmQNhr9TN/KcO
         kQDWW4ydB7+o35MXkiVnv08IrlvpXxNdq79L16kMO+K/sFCX/8ULALHuvOSaVPydnrXc
         ZWqkrnV98vB9UFmpwFUoxIVZ3DPvW+L/n9DaDjbp4ByfKcxPcN8oYRbSW64tDNsQGDHs
         G1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ml/GrUmk89MnBxJYMCpl21fN05QLwN5VJJYiJr+miYs=;
        fh=zbto/nT87GeNdDNCOiDN3PHpY2ruMZazoXxnmpfl9cQ=;
        b=Ys5v55dhFU2zAMW3SO6i82QAKu0ENfqv1fr8aLLVIvEOuYUo03LaqfzQI7dcen4WSt
         0eLQND7ybh0pfNgJeSK7eyZDW3aJV9L4/EHH6AcwACpOpT2p2YWp9TdVXmzwQkuariVM
         lQOX8yb24eI5vxsqd3H19CiA9sOE0P4H6AL1Q2vW88kXNdgC04gUNhQfEa3z0hFENRZG
         O4WpP6WkElJX+tx/CQ4wgEMJ/hj5nU9aKsd4zXsj4jAV6ftJmQVFj96ov3sv8NLrs+pV
         fZjHvtteb+cGJoalrJV+ingLV+dJgnnCc3xRXTdo1QoJ16JTIrjkr3toNom+ee2YlGJx
         uBsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775642598; x=1776247398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ml/GrUmk89MnBxJYMCpl21fN05QLwN5VJJYiJr+miYs=;
        b=WqLwfpPJXb0FnBNpVIWeM0Dwru/UevT8kZD9bitjhnbCPaLuocTlb9JovbJAA3ZWFo
         WSCLAwukrlQsDJJvVLVaQ4SkbO99DxwKiCErs6/dbECc7p+Fz9leXAx6hVQTUhpvFFS0
         xa74u2rLdqia9Ph7J2hnxeOs6fxKbJ7la64Ab+qigbamkPFl7OWH2CUlFXONcmj7hXS2
         rMko1YN4cHCBJS/Vx+TQMUa3kDjkljuAypb4IalqhYALzHmX82vOy0HZNjeysINtjY/Q
         41IWJEBI7gNzyLofj33V2CQo4/WG4gGKnbW+E7DshMBUlduwqvq9q925a5uqY55//FMu
         XX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642598; x=1776247398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ml/GrUmk89MnBxJYMCpl21fN05QLwN5VJJYiJr+miYs=;
        b=VvWNFgjCEjjC973Top6Hen9R8Zc5nAvMm2CA00747eN5bEPp9m5tLoT2eHAd0j+ltQ
         xfMICq0oTtp79aHHfP22RW+htxDPmb2M8dvwnsE55HMWMl0yZ8xZrZPr+fYfVyAf6ttL
         zRnuCarXxxnKkbhXjXs2ufStBdZs5njWUSg2cABfpi0j4Jqwzy/Rj9BB18HNb9i8bKaw
         qiFKoyeJFcMFk5GVHzTq7M6APub8iokijB0WscflLbLYim2i0iMGMd6glkCW4E7e1QPX
         CFHfqkF2kXJuMcGV6+3ohRavJYcV3Ky66XaULzt29UI92XeGqMA6NJl9xle6WuRizqfS
         dzGA==
X-Forwarded-Encrypted: i=1; AJvYcCWMz3rKRd1P7eKKpo4XQdcjiF2WfdCvMsJg8tGKsYQg0Ch+iPLr7hx67K86NaCHJIwDJetsirqt5aNwTzfz@vger.kernel.org
X-Gm-Message-State: AOJu0YwRnhLIyAdxIWhEjtD6K/48U3gBwgPCSTl93SXKXvNMmdb6LOC/
	FCuHVzinjoX3/EuydTw7ucVq9Kcx9gEDqUC2leMyoaJ1tIFmFiRlwUfKDAQQf5s4/Tk3qwgx0hW
	B+EHZJV+L2KzZjdWYa2nKlGVvyKY3Y/BntcqDV886bA==
X-Gm-Gg: AeBDiev8iAYZ3k7D+mivTJqyEaXeIRRIA6Vf6sBGfn2MRPTDkdh9Qb7QeHUg15KntZF
	DzWRoGzuRTc23dzTn/wYXqh5+WC2Xn55J8BA+rcpB1EvvZVcNY+Ytw5KcVPW3IIvncMnk3yCqLl
	ZBJSk8Iz4IcoYlWu8zcwcKK8n0IBvLYijF1KDb42bjh/2g/8chi9v0Wgb9DEIItSo9h2baCukdj
	7G3U5yboIiIxXAdPxUAKeCPuM9b1NEucRva7FTZzXIpPdovpRYajv2eMlmRiNYFAO/Xgy3Bj7G5
	cunGfAQ=
X-Received: by 2002:a05:6512:6d2:b0:5a2:aec9:95f8 with SMTP id
 2adb3069b0e04-5a33756030cmr6987228e87.17.1775642597659; Wed, 08 Apr 2026
 03:03:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
In-Reply-To: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 8 Apr 2026 12:02:41 +0200
X-Gm-Features: AQROBzDtafMmoyr_uPgMdOXiZvaWXClGB1QtNrcyqaeePtY9aOvDKCGpYJCPudA
Message-ID: <CAPDyKFqMp-uJouJuPNMmq1r8GTX4boVdVv4QqyZTpBqbQjD5kw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] power: qcom,rpmpd: add RPMh power doamins support
 for Hawi SoC
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, kernel@oss.qualcomm.com, 
	Taniya Das <taniya.das@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102309-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,msgid.link:url,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: D0C013BA433
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 3 Apr 2026 at 02:36, Fenglin Wu <fenglin.wu@oss.qualcomm.com> wrote:
>
> Add constant definitions for the new power domains and new voltage
> levels present in Hawi SoC. Also add RPMH power domain support for
> Hawi SoC.
>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

The series applied for next, thanks!

Note, patch1 is also available on the immutable dt branch.

Kind regards
Uffe


> ---
> Changes in v2:
> - Squash patch 1 and 2 into a single binding change
> - Add trailers for the new patch 2
> - Link to v1: https://patch.msgid.link/20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com
>
> ---
> Fenglin Wu (2):
>       dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Hawi SoC
>       pmdomain: qcom: rpmhpd: Add power domains for Hawi SoC
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                     | 38 ++++++++++++++++++++++
>  include/dt-bindings/power/qcom,rpmhpd.h            | 12 +++++++
>  3 files changed, 51 insertions(+)
> ---
> base-commit: 33b1a2ee3a3df63e7a08e51e6de2b2d28ddf257f
> change-id: 20260401-haw-rpmhpd-b40a68a3ce79
>
> Best regards,
> --
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>

