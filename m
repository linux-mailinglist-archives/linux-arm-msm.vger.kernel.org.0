Return-Path: <linux-arm-msm+bounces-90390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAwjL4IMdGlV1wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 01:04:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 220E97B94D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 01:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3E24301496E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 00:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AF11FC8;
	Sat, 24 Jan 2026 00:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQrwhNlr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44183EBF18
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 00:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769213056; cv=none; b=tyXkdSGjUTIidtkWb17BdjOtILtW0uH7AIur9hor+6m+2QyB9Qp4qHiuPKbGCygXdSO6+FwNzIfjKSPdXrpW6crQ/rYGW8c8C6XbSfgGwzlcmHBDOHE5etDpwSkIjcmhjrfp7JvzDRbDsmBgpOPW9gSpF2L9O8DBRBUH5bqVAz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769213056; c=relaxed/simple;
	bh=zdkJCU+YqALmJbm7uee+ZMbnxI+rEjkN0g1hAPbe2Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZbZSKV8j70qzhJ2J14lCmlwaGnlto0bh9NlX/MnS+vc2PlHcohfmf8ULyS8lcE+z1V0YZfZyh2p1ugXZNCfUF6ZWr+GOqM5G+IEsVFFMf5wd5UlHGIihkobuYirAAeiR/TKPbTNwhbRgFA8xOnUIoOtmAPyJ9BtcqrP4PmjOus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQrwhNlr; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-435a510c211so317810f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 16:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769213053; x=1769817853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6r2QurZAQWCjh0fiFFVfKXSGYPjUAsKdH07r9CUR7DA=;
        b=AQrwhNlraQkih5w2PwJzErstyIV3VCLx0xwdcDN/ZzhIp4Kx0Q75zkpDuEgEFv3yxo
         mYgcfVO8G4Riap+0LYeUG+U7Niy8P/S5ec2C07LXTO14GM+JWEpm4dalbUXQipRlP3c8
         Y4PsFtBcSubHXcGVTWJDJFDq1rsaox3vrQyBDinXRQWrr8BewQYx3fPtCS7aTgB3pzmd
         dk0ifgKkjfZ01OikJ9gHL6pCfnOE4Wl2qWL5eZhCxKK7QNk81QYxWwxEkjAWM8820Pjv
         hA5SntkmUFpj4J76AhIsGwn6NscrNRtef/9kW4GQHhxCbf4Zg3Y8rVukIMqMEA6u6QsQ
         iWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769213053; x=1769817853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6r2QurZAQWCjh0fiFFVfKXSGYPjUAsKdH07r9CUR7DA=;
        b=ssB9K+jNCoFyhF+m2qVnVDUdVW2fJBdlwyPZLzb0gH5FY5S5wPwuGzDLMvB/ACKq72
         4x6WzyVzEe1w07EA2vUi9Ytx02HNNu6kVz++ey6vuq/1X+v5iWggz2a5irYRNcoE2QAv
         yxhIRdNXqIu44uBlFcw3aWYj8tmqdwZNz7AYgy3W8sQoIFdqOve4oLPrMBj4+8IiPKz5
         0maj9EmaHvBL7Y2iDzfGv9L94ZGWyoLqDVCKwS93cUgXqOYMR6a2eK85kX7xIBwyK5ix
         CTDL/78n0afS/trJ92L4uLGyMoo2KJpX3GpJRotIC1hUJ1myzn9gSwzxWhbxuBs/b31Y
         g3uA==
X-Forwarded-Encrypted: i=1; AJvYcCW7G+0YI/3ewxIwTTVY0oFeef3rW/v4npzaq8Fd4FcOyYaecXG9bTs0nY56jC73Ie0MeEYeujB8ugArpGXE@vger.kernel.org
X-Gm-Message-State: AOJu0YxNpNv+iwkMqOB/u/VtxyNnFU4ebPr588p9Xz4joAFhPSjLeP+f
	LlxRlWAzkqJn7IBHm1T2yfGJZtVyBHvW9HOZ8ey9wyYplTjFz6bPdh/c
X-Gm-Gg: AZuq6aLCAUphspeZlMi8mp05TlW6gnYvo5Jm4RRmFyMiPKFVgKwWTTYCbOWqfgkOWR7
	vnvGVa/QBZa9DEQVB40gyyJZikEfMc2bwwDS6WuT9+C3aDxYNNXCRhpbd+YcMRNJwemn8PCBw34
	3LcXD4EqYe66f07L71jbM2pbmyXC5nE25fia1ONZUatCMFrudQedBX2jClY8bRKaSh1STBmXube
	eOhWjKgAkWYqmWTPYIVcx52KCt1GRtN8aRKABVtOlrxQ/Y+IPPyy1K30YaCuF+XGR2JzHXrMdkv
	15gBds7k827rvmMcb+k3hZpT2A3f9wR+ZCPqfqVu773W/h11ImvUqLcl4zXJIwa5bcroE3zJV6A
	9fXxBINADhXbDGLrjCqXmY/bu5EvrRmZBM7bc9Jd3fVm8YPlTJeiHAYmTVVLMQviRSAzHAobvqt
	PjKQ==
X-Received: by 2002:a05:600c:3b29:b0:47a:8bfa:bd5 with SMTP id 5b1f17b1804b1-480541f9e3cmr11110495e9.8.1769213052988;
        Fri, 23 Jan 2026 16:04:12 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:1430:8b48:2d45:6c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e716b6sm10359890f8f.27.2026.01.23.16.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 16:04:12 -0800 (PST)
Date: Sat, 24 Jan 2026 02:04:09 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <20260124000409.36nsxlvkde4zpddk@skbuf>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXNX1oi7nWLcPK28@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXNX1oi7nWLcPK28@shell.armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90390-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 220E97B94D
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 11:13:26AM +0000, Russell King (Oracle) wrote:
> According to patchwork, this doesn't apply to net-next. That's odd,
> it was generated on last night's net next, and although there has been
> further work, it rebases cleanly on top of this morning's. How can
> these changes:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  6 +++++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++++----
>  2 files changed, 21 insertions(+), 5 deletions(-)
> 
> which happened in net-next overnight result in this change in patch 1:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> failing to apply?
> 
> No, patchwork is clearly wrong.

Conflicts with commit dc6597fab3e3 ("net: stmmac: dwmac-imx: keep
preamble before sfd on i.MX8MP"), merged in the meantime.

In include/linux/stmmac.h (your commit "net: stmmac: add stmmac core
serdes support" adds a "struct phy;" line, but that other commit
modifies the context by inserting:

#define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)

(the last stmmac flag in your context, at patch generation time, was:
#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
)

