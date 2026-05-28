Return-Path: <linux-arm-msm+bounces-110106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPpsON0rGGqwfAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:49:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B1B5F18B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA0F130210F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908BA3E5567;
	Thu, 28 May 2026 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCYWWq9i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7613B3ACF1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 11:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779968637; cv=none; b=MoGByy0Ze4fXzfGPYQOAjv3QNIYhzNJy8Qi4meD7Y6MnoPwKugyOETw66zshHIV7tOjqWwsIU4KA9ai2tkcLzmQG/3j2ZhI2Lj2zyZokARj7RMlaJM/1LTPJEgvcUbmVbSStJTsmspl4OdUZjosF2j1kqvbTWG3OdsWOmeI25Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779968637; c=relaxed/simple;
	bh=FSUoz74TrT0zQzYeiPjrZsasRIeLZAQcNVbI2YX8Eh0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mykNhr7L770gPltr11HOwDx/kq+wlnU0V6eOEO/LhXt9s0HzBHWK6E6BccLEJ/EAY5wcR/y/MjAhotzQbheDy7vSnu5NMZ/IFhhykSv+NvzHJ5BPNjRYS1UgTJ4TGJP6SPKStBS6DE3ov5yC1HF81OSKOt/RNevz6Pb+rTbsa+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCYWWq9i; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3211F00A3F
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 11:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779968636;
	bh=FSUoz74TrT0zQzYeiPjrZsasRIeLZAQcNVbI2YX8Eh0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=FCYWWq9iPgwz3Eop35EmoWx+QCgoQdlASe411zNpi074sPfO+xF/7G56O3io9QBO5
	 a/doDuX7bz+tfQkCVPpVOuO2zVqLCqqMXSvAXPY8w40MKLmFTvJkrXenclcxwQi8FW
	 jdJk111LyspEpUW9FVxbjSpQU2tolO+JPvcSFVVN+wCMUCtagy+c7wMYFtx58IZyXh
	 2YNXYirbz7WV4NFb6El+5D/TSzfbfQjKJgmpcmhrkuks5ZGK29qd4vrwaD74aHq6JC
	 7bLafz1pOb6SHuU9aBG/8mCmVulWSvfMA2X1aUVqamqFSY64kvIS+/+dUscdJa85CE
	 0fjZGWWge6fcA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39556b00a85so92554881fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 04:43:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YxK+jgLS+qByRDzxkByx5B6+I6eXZKFdmPMZa9aYiROfOEjqZyC
	zO86hJtFjO9SffecyvmcE5xVbZAGdLd6vJm5c3zzikChh7Lsku1WlOdx2PRiAMJ2KcF4exO7UGA
	+G3fRWdmxt1zzDkhTLwepb1KDOkKRaMTLxbwuYvD5Zg==
X-Received: by 2002:a2e:9187:0:b0:38e:294a:d447 with SMTP id
 38308e7fff4ca-395d8d1d2a3mr64476751fa.28.1779968635101; Thu, 28 May 2026
 04:43:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 May 2026 07:43:53 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 May 2026 07:43:53 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260528-serial-rx-0-byte-fix-v1-1-dc4e876c7368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528-serial-rx-0-byte-fix-v1-1-dc4e876c7368@oss.qualcomm.com>
Date: Thu, 28 May 2026 07:43:53 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc4HD7f3D8DUGLKcz-66Bi8kKHw-WtPDVBp_YD3DiKEgQ@mail.gmail.com>
X-Gm-Features: AVHnY4IB70q5IozlS2a9GUGHIvRfqnu0lYWotLXMTsHITBij0XdGwpRzqGZPo2M
Message-ID: <CAMRc=Mc4HD7f3D8DUGLKcz-66Bi8kKHw-WtPDVBp_YD3DiKEgQ@mail.gmail.com>
Subject: Re: [PATCH v1] serial: qcom_geni: Fix RX DMA stall when
 SE_DMA_RX_LEN_IN is zero
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110106-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53B1B5F18B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 09:05:43 +0200, Viken Dadhaniya
<viken.dadhaniya@oss.qualcomm.com> said:
> In qcom_geni_serial_handle_rx_dma(), geni_se_rx_dma_unprep() clears
> port->rx_dma_addr before SE_DMA_RX_LEN_IN is read. If the register is zero,
> for example when the RX stale counter fires on an idle line, the handler
> returns without calling geni_se_rx_dma_prep().
>
> The next RX DMA interrupt then hits the !port->rx_dma_addr guard and
> returns immediately, so the RX DMA buffer is never rearmed and later input
> is lost.
>
> Keep the handler on the rearm path when rx_in is zero. Warn about the
> unexpected zero-length DMA completion, skip received-data handling, and
> always call geni_se_rx_dma_prep().
>
> Fixes: 2aaa43c70778 ("tty: serial: qcom-geni-serial: add support for serial engine DMA")
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

