Return-Path: <linux-arm-msm+bounces-91389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNAPByqxfmlrcwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Feb 2026 02:49:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B578C49A8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Feb 2026 02:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 971FD3018775
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Feb 2026 01:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E711F181F;
	Sun,  1 Feb 2026 01:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiDw3CgZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70E5199EAD
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Feb 2026 01:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769910561; cv=none; b=qtDnDEX/4baHbb30xRKYDK8duyOWktcg4hI6pfdgvX0Gw0SS8u0NNHM8SuzQPaCjGhSaIlCtgp4HtUayGB+t5d+E0xRcwkaKbSySojFPExEgkW/KIq6jgxsKGY7VRWP7ZDImSTkY0jCyGcMtIZUQ4I1Cglb3Ywg1TiwSuEuoDWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769910561; c=relaxed/simple;
	bh=jIM6ploEHr2xj4xww6y64sZmcRorm+yWkDbVtgVT0r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0B7lfFlnPGAd4vO2I8pkbqEbl4DBjtAmTThdSf/2kGD6/ettwJDjn+iQDUhvUypjq4trD4+Gt9hyZ7iMrYR4B2mMtA1cq6n21b5nhP4AfXxZLVF3X3zxinyvuqA3/qv6C9Rn2iaNTPPJy0w/gi5poZUA6FKhrVrmzRdpNUhxgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiDw3CgZ; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b704f08e73so1813442eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769910559; x=1770515359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fDZPiyu35gI7ry6ULQRYnogAcGNCJsm8fgf787oYOkY=;
        b=XiDw3CgZaIuk4hQt1sjqU270Hodr3ZR+4VRyndOiOH7zRyMmMc/9JGUXVr1ltDX/3Q
         DjbELBgpGWZVRas60rFpLuYLrvyIvk1cEKo1Uee7tShQG9FcJoXU+jVGS91/aAYEChGb
         crbvcVXYuZULFVxvtPF0BC6tgzRzB4xray+oy021gTyPcHsf2tIPj8TRwdiatteg0M7p
         3znZANxeEZydI1ifUZKQY5LgSr7n8ES0TZvbP9awbcvPxfqyECfu4mwwYsh4FTkDdiB3
         Q9f0ePw7GmK6uuNpJyaPc57lVmS7o4iWbD8eZZv83nqGUfsuuo7wUshcoad1Wn7wQQ1Y
         G9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769910559; x=1770515359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDZPiyu35gI7ry6ULQRYnogAcGNCJsm8fgf787oYOkY=;
        b=frC2pfMABykZp0lWP/b1E6JJWcVOlZlHc7P6S+tuYaEOa7p5DAVdfZFXqmes4oJYOV
         Y3GOsoWnmCnvwUIQYa3cjyTbVYDXNaBT8LtdlesiSXd081gmAtSsiwfpy0+sDJeYdQlu
         71OhFsXoE5stMI4LhARqXE8b/h9t8+8pNWzQN2Go1eF8xZCZjmdHHpqQWrRhMY9RZJQE
         Mb7UrdC0kioZdPAO9NPbZYb7tdtNskGOAwN3dR2e1fyY+x/zdPZV/0CmWzZUxc0ZlQRt
         asCbF0RcbXWe6hBO+nSfURzWwdlGEu7/G7DwFCt6eZygto8L6dWfAB0PaHD5CuNXYLy8
         Jl0g==
X-Forwarded-Encrypted: i=1; AJvYcCUnAuo+gxx8jlTYn4r6HtvPiKA4CBP1n4baw2nAYVw9iSAFVL7DFykcsFGVQvwv3iTu/nmSMBI0pYc8bIUb@vger.kernel.org
X-Gm-Message-State: AOJu0YxF6RgTYxXce7EdZS1eAhIehP+W8nIkt9keWP+0koYAqGS4OA9C
	i4DHRQs8MnUbznJiTokzp1Gmr+LRMePUZzsSYseuzNvzDBJcQfpmgg03
X-Gm-Gg: AZuq6aLztMvNGo/rZjiYheOxdPiluqhfHpCwM1ujd5pV4LmQ/6Ql5bFO3q7TPsV6AJM
	6WTSuvdlGa2aN5DHudEGWgtR6ly3DTHzCy5qWY3x16h79+NrbwMaTsw2+fcU76UCe/tl4Vbytvk
	TzUYIbJEmeyDok/C8O06uCkGb41YpM8Oz1ogEE3dcz72Bc4Upx2t9scMYproqtCH0ib4kWFiHty
	YeMt4/kIu+Adl1DdrsWFZDIvd62DtdcobmKUK7IDRUkSTJ3f0+cUHjkNemg9PjWN6ab2YtN4Qlk
	PFt1I6KIgoT7tcL9lDQFSF4ErtyTZW1V37RjBzjk35lzJYtkyPAXzRucjSfn3aa+u2ztSZ/91uF
	XHCUFU7XoJBzNVU0Dm34WvZ+3mq8FLH6wN7ZEz2AYDfy1lcPdzEKxLuZXWXt+NaFyceuSHgK9Kk
	uA7fd+u62L3JFCCcY3jVE=
X-Received: by 2002:a05:7301:9f0b:b0:2a4:3593:ccbb with SMTP id 5a478bee46e88-2b7c9124abbmr3386218eec.2.1769910558628;
        Sat, 31 Jan 2026 17:49:18 -0800 (PST)
Received: from google.com ([165.225.242.183])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe92dsm16914029eec.17.2026.01.31.17.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 17:49:18 -0800 (PST)
Date: Sun, 1 Feb 2026 01:49:15 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Input: aw86938 - add driver for Awinic AW86938
Message-ID: <aX6whqw7XyaKMd9m@google.com>
References: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
 <20260128-aw86938-driver-v2-2-b51ee086aaf5@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-aw86938-driver-v2-2-b51ee086aaf5@fairphone.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91389-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 8B578C49A8
X-Rspamd-Action: no action

Hi Griffin,

On Wed, Jan 28, 2026 at 04:51:14PM +0100, Griffin Kroah-Hartman wrote:
> @@ -717,9 +746,19 @@ static int aw86927_detect(struct aw86927_data *haptics)
>  
>  	chip_id = be16_to_cpu(read_buf);
>  
> -	if (chip_id != AW86927_CHIPID) {
> -		dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
> -		return -ENODEV;
> +	switch (haptics->model) {
> +	case AW86927:
> +		if (chip_id != AW86927_CHIPID) {
> +			dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
> +			return -ENODEV;
> +		}

If we are able to query chip ID why do we need to have separate
compatibles? I would define chip data structure with differences between
variants and assign and use it instead of having separate compatible.

Thanks.

-- 
Dmitry

