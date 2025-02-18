Return-Path: <linux-arm-msm+bounces-48330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F410FA3964F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 10:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B258C188C856
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 09:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6480222D7BD;
	Tue, 18 Feb 2025 08:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZZ2ki4+Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BC222DF8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 08:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739869116; cv=none; b=NR5f5Fm7ljycpzcZm6/8jgQoo8ORf4nYyJoHKDNBI6IfaOoG7lyPoJqjdS1ZxTsSAc8y7wl8soVqQLscMHTps9FT7p5HLedAZZjITWfU5yCT+dFXGTq9VRmRnu+QeyNHvJeVRU/VGlIDN/YKrv6UyQDrBcL/2exuUTJvhz17Dfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739869116; c=relaxed/simple;
	bh=Gf1I336jgiBsKtK6Xe3UxKCB8/iP1W2mCBQ9k2mDag8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpFDuFsTfIh+twOKyT41m0liF6H5xwjUb9j3s24XziZ7WY5MpuBrwRVGUebp1C/U5nh6bP95zi+SYmKALsiie49CGxT0vRpD73vPg4w8qMM5KLkZwQFm9mklNKrDtjR1WVHKnKvpr3Vdz76bZ8xdfGJhR+pkjKYlrifeSrg7/AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZZ2ki4+Z; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-220c8f38febso93805105ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 00:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739869114; x=1740473914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qqCVPwdqyK2Ili+2+zXGFMWFYgYIwIsQtKu/VjLpL8=;
        b=ZZ2ki4+ZluLnIrI8lGhVWfzy2c4QRjXxsq6o4smOG6YXKiwMtI4769jQ/eUySaXbip
         u7PCqorrd/xBE3GkM4sbwyf/lzw0SffuZagKspjRcxPs/SgaQNjcwkaaCYe5fMx+KxWm
         g4nYs3zf+ZZAuYPpHP5gqF9BWTCn6URDFtb8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739869114; x=1740473914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qqCVPwdqyK2Ili+2+zXGFMWFYgYIwIsQtKu/VjLpL8=;
        b=HZkli7u/+8nEbyv32s4qP1VEW6iiGZeVkNRWq2QUcu+4D8IqXkEaickGKvq13gzZGi
         b29/q0jxeEJWIjoC9h7V+pUzlXtd4WXRkT7a7aWCDuEM+Ck48hxV3eZFwXOvS+fR/6i8
         h/HX50DGUcpgYJY2TykUexuLY402ZBC2cSTbZHm1sKe9xRjI3jek7k2OZK0IpqudqB73
         kRKAKJM+lyMu6dFdueCX65+mZBY78hQu/OWHTzf4i+Rts7zl4KFueyuyR391ZB7SDU3M
         0c8eKGCVuk+5vWtAAdGqJb6rR5J0h24l2GUyx9WSWWUkDuyzk0Knl4tw7Okrdm+L/RiM
         0GPg==
X-Forwarded-Encrypted: i=1; AJvYcCWq2yZzljlhVHLRIm/kp/QyUXprwMM4slYoipfnJMI+om+vwPVojDzJMab3jnflQfhS+yNgp0ZAw60p52u+@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPLHDdhLnSm/oNmqFXcXVdLBTMoXQo8YjBkyH8JbI6+07ds7l
	1Kf5c7/1KwA9DCYUzpc3IrNYGwUVKO6pS+piGCrlW7B7rV82ts26SUvjTgBaoA==
X-Gm-Gg: ASbGnctCmHUgNbeylOeyrAmph7oYTLyhleBzELNRCWxheLdWejZ5TUrP7b9NG6Ax/TV
	SqQeBMaiTEe0uVWUDri3ssNuP1SafEiagaQrxxwFQdTFM3KVVSM0G/Yj25P4v4c3MgvziMb+KS/
	YDoxxaFwtxdDHXcxJpHFsl8+MvrL8fPbLD6dzvaf5A0sXFFkoXoSlnOIE6KpBEF+OAByIQJIDBL
	bLy95EGL+WxrUkVrX6TM+u+c+kzdN/lRYhC/jR1UrcvzA6gtEOTv5/3HHPq7cyYheZt6M7A+ZJz
	qInTT529djALrBdemC4=
X-Google-Smtp-Source: AGHT+IEEOJtMg2r+ExCu5k7nAqe+yfuyqpapvJqV+nJnjxWfgOfZJYnuiAmofVtL8kqiPugF9s2+qg==
X-Received: by 2002:a05:6a21:790b:b0:1ee:a914:1d64 with SMTP id adf61e73a8af0-1eea9142045mr12447625637.28.1739869114293;
        Tue, 18 Feb 2025 00:58:34 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:e8b0:5a6a:30d2:a33f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm828296a12.51.2025.02.18.00.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:58:33 -0800 (PST)
Date: Tue, 18 Feb 2025 17:58:26 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Eugen Hristev <eugen.hristev@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org, johannes@sipsolutions.net, gregkh@linuxfoundation.org, 
	rafael@kernel.org, dakr@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	tony.luck@intel.com, gpiccoli@igalia.com, pmladek@suse.com, rostedt@goodmis.org, 
	john.ogness@linutronix.de, senozhatsky@chromium.org, quic_mojha@quicinc.com, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Subject: Re: [RFC][PATCH 07/10] printk: export symbols for buffer address and
 length functions
Message-ID: <20250218-175733-neomutt-senozhatsky@chromium.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
 <20250217101706.2104498-8-eugen.hristev@linaro.org>
 <Z7RELnyWRLietj9b@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7RELnyWRLietj9b@infradead.org>

On (25/02/18 00:26), Christoph Hellwig wrote:
> On Mon, Feb 17, 2025 at 12:17:03PM +0200, Eugen Hristev wrote:
> > log_buf_addr_get() and log_buf_len_get() can be reused in another module,
> > export the symbols.
> 
> Err, no way.

Yeah I think we've been there before [1]

[1] https://lore.kernel.org/all/20230905081902.321778-1-hch@lst.de/

