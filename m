Return-Path: <linux-arm-msm+bounces-6682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C7582795A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 21:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A9A71C20FEE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 20:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18B15467C;
	Mon,  8 Jan 2024 20:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iYqMdiv/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B454BDA
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 20:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704747033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mn8zF56qQqaxcdSRbUuqhYtScI9w6bUxhtcouXyELto=;
	b=iYqMdiv/V30q4VITFbcYsgYrJ8geYh53OeizSyvc6sIC3hu2U1+vNQrmzRwxNGKmHwtCRp
	KtuShCYCqih08oRssNGV6y0tYk+XR13U211FgXtqYDo/zHlFuF88wv4OlPjlp86ZT30u6j
	u4WUiLLQWTCB9KIYz52MW4Uhyb+0Dmo=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-3IViW1PxPaahxe14ZJsVxA-1; Mon, 08 Jan 2024 15:50:26 -0500
X-MC-Unique: 3IViW1PxPaahxe14ZJsVxA-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5e744f7ca3bso30750517b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 12:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704747026; x=1705351826;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mn8zF56qQqaxcdSRbUuqhYtScI9w6bUxhtcouXyELto=;
        b=IqJr47UVx7AvJFXdEXiGITzVKD0ZyNQzYA6tjNnVp2Jv47m9GvY4P/K4bn0LEVNvbQ
         orqsoqtGKxBniY+dlWJL3diwATaUtESVzWqs6tw8vn8pEGRPG+WkAaEYSVLA/9uB1K28
         7NvHQJFZSkXES2MR5wZzF7bWuzACPjsroAGvVqdP7OE2+NNn8WsQji2v5wnsN1VYCmvn
         qlRos80TfJZHSHF3m8D69E3WobQ0W+4QTwMXTOgH5LP0GcAbcGEk+PZpHuG2U+6oUZx/
         M5HXL/1nE544GPmmD5TwZRGZxmLZasrlThP9fuNmOH+VBTo78MP+SnLOtHhB/8JzLG+H
         0Hug==
X-Gm-Message-State: AOJu0YzQe9awURxZE5fjzcwM3XgHJ1PfjFgttFshc+r6sZNo0H72chQO
	QolYVTcZ9/MPGUf+I9Jotl4ZOKTjovtLHrEJfvRDg20ieMpB1XcHjNBmnkEczmSywewzY/9coKG
	swWDsghbjPxiMniRiI6RCscRTJT0iJQWuVg==
X-Received: by 2002:a81:8804:0:b0:5e8:ca4c:b981 with SMTP id y4-20020a818804000000b005e8ca4cb981mr3341428ywf.28.1704747026137;
        Mon, 08 Jan 2024 12:50:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhJi7ppbJ/V45mlpOBVKsCqrqBzYnljADA31fkTs4foRlp7uENPbxR2e/zGenbe4U8PExetA==
X-Received: by 2002:a81:8804:0:b0:5e8:ca4c:b981 with SMTP id y4-20020a818804000000b005e8ca4cb981mr3341422ywf.28.1704747025873;
        Mon, 08 Jan 2024 12:50:25 -0800 (PST)
Received: from x1 ([2600:382:1a01:8f9c:c88a:1625:2635:eb3c])
        by smtp.gmail.com with ESMTPSA id a4-20020a0df104000000b005e92fd632e0sm174135ywf.24.2024.01.08.12.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 12:50:24 -0800 (PST)
Date: Mon, 8 Jan 2024 15:50:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Eric Chanudet <echanude@redhat.com>,
	Prasad Sodagudi <psodagud@quicinc.com>
Subject: Re: sa8755p ufs ice bug: gcc_ufs_phy_ice_core_clk status stuck at
 'off'
Message-ID: <ZZxgCKQmQdUL81pX@x1>
References: <ZZYTYsaNUuWQg3tR@x1>
 <49d85352-d022-4b59-a3f2-d8f7ef3028ac@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49d85352-d022-4b59-a3f2-d8f7ef3028ac@quicinc.com>
User-Agent: Mutt/2.2.10 (2023-03-25)

On Mon, Jan 08, 2024 at 11:44:35PM +0530, Shazad Hussain wrote:
> I can see that gcc_ufs_phy_ice_core_clk needs the gcc_ufs_phy_gdsc to be
> enabled before this particular clk is enabled. But that required
> power-domain I do not see in the ice DT node. That can cause this
> problem.

Thank you! I'll work on and post a patch set as I find free time over
the next week or two.

Brian


