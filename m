Return-Path: <linux-arm-msm+bounces-104364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBSJFAhM6mkhxgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 18:42:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E844550F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 18:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 374473014A30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 16:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD6637BE78;
	Thu, 23 Apr 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nS6W89vj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD0F29DB6E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776961446; cv=none; b=Fk/M2pBy7f8x4gWQHq+uPWOe2n+WjPEaJlScsx9zAaUPLnIBxwoT0eiEIzWTCz+0cnNv03Rc+fiAZdg+50LfZkYx0kBmxGBkcgyOhn5Lj9YATsufoMtOvXodFokWerrCrLrmQgA88hrpDd4jW2wX+OXCQablShBCacPYBKaZ57U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776961446; c=relaxed/simple;
	bh=U+KFmt95aVCklt9f5liT8xPIB/iXLBQ9X5Y2xAA1h0Y=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WhpykY+qXuKXe9laOv/kJQX4pHTSkmBLQ1rCnTInuuErA67IZk+G7khKR7zNTRSeFUIC5DlEvvs1Kwu89Sn7HdwewTg0aADwpRKhQ0EOvrd0sSwrBmQuhVOsKiAZRtMFyGyBHI/tsnJesXcDatCAoXGiUhSDkJdvRDL9eDYYksw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nS6W89vj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECA4C2BCF4
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776961446;
	bh=U+KFmt95aVCklt9f5liT8xPIB/iXLBQ9X5Y2xAA1h0Y=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=nS6W89vj0JqAP+zMKZnxP9lt6XnAIW+wpC2dm/vaVq/mMjJdNKZn4ttFFXdH/0+IL
	 uq6I2vCb9GKfgA9QOx1nQAc3Bx/zxcWPOGW95zw+HAxpTEF+Yx3g4w+gwhxiErrM6R
	 e2mnVXE04VBQWzcr21THDTTJRzx/e7aJL0VF1hipnEMCPZO42ADliQ21FQaZLkVpIx
	 otyvBGs2myhIt3NuncqRZ6be8OhC8/OTFIyhA02tsBP+DZK3LwAfmESP0o6pzYR94T
	 IfnFave+z7R8VYKilC+ZSi1djW0Uo+uafXCm2bvl3Kh5jYpr4Wwu7mzbbXwIryk55Y
	 XC/K7bOvyhWjQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e91b06006so57254941fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:24:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9IHNUSI0NvR98ZC1jZ6QwArXmXU7M9LNmFotE70OY31P5ZFJ++vT6uuI5AUglHqr57uHG9Ou1efcn7oThb@vger.kernel.org
X-Gm-Message-State: AOJu0YyHuQG8eaKBtgDEGSZosVZnDf4rR/3uGEGZ3R75AC5BH9Yme3eP
	dIBBQdS0TuZCO8I1zz1t5AdFSY87pLWa20fq5CR7BEfyYYAK2atEcEySOOg0W9eWBfPayIk1M/j
	w3MukjNSFquWCwFPTU+Dry0kzQB+oUiam5CaEBewAUg==
X-Received: by 2002:a05:651c:23d2:20b0:38c:594e:ffd4 with SMTP id
 38308e7fff4ca-38ec7af20b4mr66586491fa.25.1776961445086; Thu, 23 Apr 2026
 09:24:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Apr 2026 12:24:02 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Apr 2026 12:24:02 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260422-pwrseq-m2-bt-v1-1-720d02545a64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com> <20260422-pwrseq-m2-bt-v1-1-720d02545a64@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:24:02 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfCprFY4QCwEJzbBnROGJzrRE-sRAD89xDxsUsJVfqOiQ@mail.gmail.com>
X-Gm-Features: AQROBzCFPeFFKBDUBTFbF_d8cAOg-aBLOztoD_JeOpJg9Ts6CIUwK_iUG3b0JI0
Message-ID: <CAMRc=MfCprFY4QCwEJzbBnROGJzrRE-sRAD89xDxsUsJVfqOiQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] power: sequencing: Introduce an API to check
 whether the pwrseq is fixed or controllable
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Shuai Zhang <quic_shuaz@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104364-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,intel.com,holtmann.org,gmail.com,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,manivannan.sadhasivam.oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55E844550F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 22 Apr 2026 13:24:42 +0200, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Introduce an API pwrseq_is_fixed() so that the consumers can check whether
> the given power sequencer is fixed or controllable. This will come handy
> in situations where the consumers need to know whether the specific power
> sequencer like 'Bluetooth' can be controllable using properties like BT_EN.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>

I have several concerns about this new function: its name is very vague and
doesn't really indicate its function (how is it "fixed" if you still control
it?), it can be used to expose all kinds of things because of this lack of
precision. I feel like it goes against the goal of pwrseq which is to abstract
these things away from consumers.

The problem we have here is for now a HW quirk affecting a single driver. I'm
thinking that we can live with this driver just checking the relevant property
of the provider device.

Many subsystems provide functions that allow accessing the struct device
associated with the provider. Could we introduce something like:

struct device *pwrseq_to_device(struct pwrseq_desc);

that would return the address of struct device associated with the provider of
the descriptor? It wouldn't even have to return a new reference as holding a
descriptor already implies also holding a reference to the pwrseq device
backing it.

Then in the bluetooth driver you could do:

	struct pwrseq_desc *pwrseq = pwrseq_get(dev, "bluetooth");
	struct device *dev = pwrseq_to_device(pwrseq);

	// Big fat comment stating why you do this
	if (!device_property_present(dev, "enable-gpios")) {
		// do whatever quirk is required
	}

Would that make sense?

Bart

