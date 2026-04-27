Return-Path: <linux-arm-msm+bounces-104842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HZCiKUXm72lPHgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 00:42:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 201DA47B901
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 00:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F9ED3016808
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 22:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BF7374E59;
	Mon, 27 Apr 2026 22:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYe5Oy+Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F05221FBB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 22:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777329729; cv=none; b=DUDLyLfVzNYOqtDF8R8ODmuqjRKu7HGTWqn+Xip/DjFLAokJBPj7bJQ2kJdQOXOtF+83sbBVdLL5CqdQQb6xRtX7uA44sn7oJo6HPc/3IqX6MyWCwjS1JPDyQD5p9myYeygwzvvPG18ltIN5CWO4Zde57oYJjuvGYonrWDKlTbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777329729; c=relaxed/simple;
	bh=DcS0xIbaiVfhw1uFxeAC+bBD9SzyqlKecFBf13wLMw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fth3uyffe/tI1llocbJb6GBGNP7S4zAMlvIqm+kaJF/dIoG6Cx0DT6bPFXB4BNZ3Wb8lhygyt5amUwNk3t/xNiVxlSzYsHiU8ewhrj3VVlR0IQSeIPU3B8bcxOVrc3HyESizBxMJ+epIcrfiSW8yBRvkUH4qToHfcWJq2SUVtcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYe5Oy+Q; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8ef5776530bso686729285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 15:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777329727; x=1777934527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiuuIIQgB/ng72B2X5qMWHFySgXXLT4/yH9F0w6bPag=;
        b=HYe5Oy+Q5CrNfEqUGc8pyz6CeloeJ8LMAhLSLkIhshbRXzxDKXFsuGAG6j4UYvNePR
         evRrqYPnHFuKsTFjY4D5u7pJ9iphnT612p1tY+tdnB9bUgFdYTOT7NAD6MgEwHmjNBd1
         nMFRHnxsQFngtNSfO0AwGcLdw0ZR7opTH83ANbs/OPM/64+mOIHWxjl8OpmhJ9Cxj9/f
         tiob6Niq366GgZ2SPveewOVaRc/Ej9sDx2SCd9744eS98y+t5ZmO5sOlAmw7lTe2p76Q
         uWbZMp+cjmPPWVEaNpkYu2ufekSGrATxdXFv85G7KxGIcu+71/72pZR3AiezN51Kn9kB
         girg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777329727; x=1777934527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiuuIIQgB/ng72B2X5qMWHFySgXXLT4/yH9F0w6bPag=;
        b=BG2+STemHUeTjmJW01Qv8Yb8nL7efUF4JEJDErHZSWN0hzwAJYiMigggNptMpsljez
         mA0wyrxLOFkGPy4RUAHGJiVK1OR0M7BbcUAGXg8KKhF1Rvf/1gvlmeyqpeYeyv82tshp
         b/3LC6JBBrqHzOvr3ub7UOBjqKPYv6sm5mr4yH2GSxrfoXjF9nQ/iH5x1DOge3I94U9R
         H8+kxqIBTgl9u3J1Qa54QsNAZfUQstqzkm9pWgd9tO2VEWv7RrtQzFJUOudT/YEA2Mhm
         ACN5Q8oZwHf2bf+4q7gEDXenyv4f1UpHHERg0r9abRV5Ht2vzuRtCS2ZFybEv+kKs94+
         T9ew==
X-Forwarded-Encrypted: i=1; AFNElJ8eG52gW2oOe504l24bl1QApjSKveTWe/O2HoZBE/qkllSwuD5tr4e+0WkXGNYIq8phAUS2ZYOWEk2NpPdL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmn0UHNR9//3oX8BbYgryd9MwhAbIFGwFfpDh7tPPHn1uYTrZM
	EvZfokGtjZf4sv8MyFnW02M8r1BwVfj0dW3qtefbhHtSvhxrDDIVRoy/
X-Gm-Gg: AeBDietEkaDpn9ipcstouwoC1Q6smVEnxVavq3i8G+DAHRMG5jxb9/jpTsx0PwIwe36
	LP2pB+dvKM/80xJE78Arr+I6QRNfb3TEQudxh7JCpvk/NUUQUIyqZw4F8b9agvOCEwXlV5t5SbT
	NnlQj3ND1r75Y8lAPE03ITOzPlzXHrm+1lZTw8kd8VuoiDsTDDxzPCss0eCYFxyuNq5n12MFM5R
	ggn5xfBtwlDbS4YFmiJ9D3zKFbYdjr809IKfr743Y1kFnpcpBPw+WdW1E2/1Eo5dmMQf8NgKeg7
	pifZP2RhiEsfZKq7KrY4J0k/uXciblo/dnZYjmoDu7fDEiD2boTPZ3VdDUC55ixASEL+7PEkCiv
	HmsNLyg6mjV8rFX05uUCZMY7D7a+IQdDp3FBIt3glylsLE1oZgyLQwUpKsyag3X48cPS96wQhxL
	PesiFrmLxzdMDGtdmM8BqtCZh3FoMzM2/LlFVn
X-Received: by 2002:a05:620a:4504:b0:8cf:c0c9:bca with SMTP id af79cd13be357-8f7d78342e7mr91392185a.17.1777329727373;
        Mon, 27 Apr 2026 15:42:07 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c50b7537sm48163785a.18.2026.04.27.15.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 15:42:06 -0700 (PDT)
Date: Mon, 27 Apr 2026 18:42:48 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Yifei Zhan <yifei@zhan.science>
Subject: Re: [PATCH v3 0/5] Support for the Pixel 3a XL with the Tianma panel
Message-ID: <ae_maHh5IMxQWxbM@rdacayan>
References: <20260310002606.16413-1-mailingradian@gmail.com>
 <ae-yXomgNWLd8IcE@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae-yXomgNWLd8IcE@baldur>
X-Rspamd-Queue-Id: 201DA47B901
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104842-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org,zhan.science];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 02:02:39PM -0500, Bjorn Andersson wrote:
> On Mon, Mar 09, 2026 at 08:26:01PM -0400, Richard Acayan wrote:
> > This expands Pixel 3a support to the Pixel 3a XL, starting with one of
> > the panel variants. The Pixel 3a XL has two variants with panels from
> > Samsung or from Tianma/Novatek.
> > 
> > This series depends on the IMX355 front camera devicetree patches
> > (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com).
> 
> Please resubmit the DeviceTree patches once this dependency has been
> resolved.

Actually, did anyone see v12 of the front camera patches? I'll just
rebase this on the revision of the camera patches that get applied.

https://lore.kernel.org/r/20260331194437.41041-1-mailingradian@gmail.com

