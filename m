Return-Path: <linux-arm-msm+bounces-114124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8SFPCQJNOmpv5gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:08:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDAD6B5986
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:08:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="I4+MP/6z";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114124-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114124-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43A53301F5F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31AA282F24;
	Tue, 23 Jun 2026 09:03:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B756F246781
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:03:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205424; cv=none; b=JcyoV4a4Krijlp1g3CtJPdjMtLVjdEOeojGONbYBAe9gWOTlyoq0sgFgyRVbdnhOizQfib4wPDn7Ul2UYGDY5UXjWiYTtPsQ2yJ3uQDfYHpZhBEtd0sPdf0mnSz7xe/Pr6ZJOEVO11SyVkzCePkMGSHe0gUbaSVtzl+Q5wwIV0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205424; c=relaxed/simple;
	bh=pT3yi3oXbWdj6Gtbsf6AMtfsoW+ZyoWZR8DMmRApHoI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=esT6tmvScn/6zJdvr18fqVMHnzxG6ZEhnOrzRUUD1tG9EuV5n/Fh8Gce9wodwjvohXO/HsZMuFchKLu4vc7CeTif6VCjqUazxbGtUVnGkms6TmTM6J4FJupTNUOUrt7Ml0jJfvDz8qx1eHUOGwQvZ6lKaC119TpYlxL1ug0xP5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4+MP/6z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2931F00ADE
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782205423;
	bh=pT3yi3oXbWdj6Gtbsf6AMtfsoW+ZyoWZR8DMmRApHoI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=I4+MP/6zFs4LZHsEygAe80rzfLOmfUf35qPG9UNUlK+kSEsXeHr9cUyk9n52xAyGn
	 xn1BEOVk/ZQzTx3EXVqWo5o5VM0dCHCvMmEELNIduOFYGeVTWG/UX0e6TaOUZVO0Od
	 P//BV7RaV53HKZY6nvd9uAMJLjvvabSoRJGTGZ9qX7E36N7cJrB1syc3f0xGEmfo3j
	 8oQ9Bm0ZgkKJNIO0MAhWVC8Ztme5BstOOiak2XErAvLaFXj1HBqmQKWvA+pX0NbfQ4
	 L1e6HwuoBCOQq2kaQQNjNa9t5FjABcdOrcU6C51JpG5D8vZo1biyhThLLeY2qEW4wt
	 C818BFboM7KkA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3996f80800bso7697061fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:03:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ylG9dhfQxZeFzlf3aBGayy3vZqhM9x6K9oCdOH6tAb7fLhbl6NyLhL80EwY282OOO9B1DOVGBQ7wDxoUu@vger.kernel.org
X-Gm-Message-State: AOJu0YzUasgUCE0fG3YSbNgRMB+In3Pqmn8yVShz/3t5dt1yqIxXYO5T
	1L4Q1ObCmrEL0XgyWZP8zxBbgk+UMMVmV+N5Egzf5aXSZJavuKlzZWig7KqPz9bDOIl39XBU/48
	YodUuR7z1HdgRsColpz+QZEEdf9tghVQyKgHsR+TLYQ==
X-Received: by 2002:a2e:be9c:0:b0:38e:8c66:c02e with SMTP id
 38308e7fff4ca-399c53c2fd3mr6652711fa.4.1782205421991; Tue, 23 Jun 2026
 02:03:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 05:03:40 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 05:03:39 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260622-bt_bugfix-v1-12-11f936d84e72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com> <20260622-bt_bugfix-v1-12-11f936d84e72@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 05:03:39 -0400
X-Gmail-Original-Message-ID: <CAMRc=MemaY=ON2q-Cuzis0sZ9WfqjvBsFzxxCYRZrXeFPNJ0_w@mail.gmail.com>
X-Gm-Features: AVVi8Cd8xQgQy3OWP4JRXsOZj-DF64dfu775AJsANd7-NHT4tRCUvnXeggQTM30
Message-ID: <CAMRc=MemaY=ON2q-Cuzis0sZ9WfqjvBsFzxxCYRZrXeFPNJ0_w@mail.gmail.com>
Subject: Re: [PATCH 12/13] Bluetooth: btqca: Fix undetected error HCI status
 in qca_send_reset()
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, linux-arm-msm@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ben Young Tae Kim <ytkim@qca.qualcomm.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114124-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zijun.hu@oss.qualcomm.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EDAD6B5986

On Mon, 22 Jun 2026 16:52:25 +0200, Zijun Hu <zijun.hu@oss.qualcomm.com> said:
> qca_send_reset() uses __hci_cmd_sync() which returns an skb but never
> reads the HCI status byte from skb->data[0], so a non-zero error status
> returned by the controller is silently ignored.
>
> Fix by replacing qca_send_reset() with __hci_reset_sync() which
> properly extracts and converts the HCI status byte to a negative errno.
>
> Fixes: 83e81961ff7e ("Bluetooth: btqca: Introduce generic QCA ROME support")
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---

I think the fix should go in the front of the series. Even if it requires the
new function.

Bart

