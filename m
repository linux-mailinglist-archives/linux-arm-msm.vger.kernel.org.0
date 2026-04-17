Return-Path: <linux-arm-msm+bounces-103525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJN5AhMl4mlX1wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 14:18:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F9A41B2A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 14:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C40363036C15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 12:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60410396D2B;
	Fri, 17 Apr 2026 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPoeoUv9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E0A350D7F
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 12:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776428293; cv=pass; b=BFCpJ12cM2LcxI0Y5w1bvoWGZUIL2UZ+JIzCQiY9+j2HhmlN4lr9MP91ANapMzd27s9j5t2gmY2CSnjiy4jMBdJOeFi8ps5yo7S7sX3PaQmidFUQp4nbqPurcujddaQ9nB/n0NGYRndYgD5+01YcFbm8Tcqdu+7F6o2lg5Z5Z4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776428293; c=relaxed/simple;
	bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUHC1dZ7tFe7px50lc6mO9szB/xw3gLg3+YUG/onUetVVmnPldiPbd04PvQzKsZsKpfWaFX8ozYV0enqISgzgCl3PFfd+T4Cv2pGTzoKUNvOdXtczXWWL/xtRhXvXsBXAi5KwW1PrWq8G8EU8V+V2OaPECg5BjiMWjAfcXDN4AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPoeoUv9; arc=pass smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6058a955e04so431202137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 05:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776428290; cv=none;
        d=google.com; s=arc-20240605;
        b=gfRqzL35B0bHxzfiVhiicsQRydLA4ApQviqfC4ubhrykoWKR14+pL7JJQtgCqMB6F+
         He+IYE/dL/KMkfzV1yYK8qUKeSY3wtg0EppePV0F7eR5rq2vV+Uo6Jz8B66rhktPo//7
         74qT5EQUMb+xvaLBbqxORuDoDQ/m7IKJgdpn3ILMFu/6XK2vpgcwjji/U4pr14eDFepZ
         n2KFc32xozhqF+hoioz7U0Q/MD7ec1RL3OPRoMGCkoEVrdCtNIUPvN5WmbR4c2XEFN0K
         MrJTnWRFCcKVC25c4MqtIFUZfDVGV8VI01pCQsBk3FEGpSQxQwbJMv9nVzqKe0jpo1oK
         gCwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
        fh=vcO2Nr7IXdk433k711m1m84t0rOUn2ln0tpd0ZpYJT8=;
        b=cv5h1Uql+3sIdMQX5r/ECwNoxs37GkbahzarI4ztiGbwKswQdz01dVuhqbXpgmGnWN
         2nrHQ7nEi2fzIxkA4fo8gSqwnhvgkghUm0NaaPlI8lXgPp9pw0ZWlJE/9SWRs7lsEe6t
         hdGPqa4JzUmIlWkE6tFIRVlE3QOGiTmVm41jU/FoQgwH6zOKNxU6C/6dl5W3J9st2AJw
         YMdoFFnNIJIEio5vIjcCTjZb/K3WPEXRrykvriSmo6OKldVtZdMU6CR80DZOyWgxqLpq
         UX9U++gJA5t15BNnAbZzd5beTEUlYsCTwJodyBpmHewzOdgrlG8fztb/i9ma8iHSa0Nr
         7FgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776428290; x=1777033090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
        b=XPoeoUv9rScmaUqyWQSiJvbKUuBXj5IvwkeEqO9qwZ1N1Zi26m5ypKnq3nMAlaiYvp
         HRIvAeWMTy5Je01JKcws131EsdO1TlblBN5Bd2NEHLiQxfdcKktowfgkqPo0DikAGUVi
         Mw6OmIJmza7Py3pduhFODEECv2mWyb3eVYr/jo/uhezfe4JKBmPaC9IZpBaQCHnYJ9ZE
         aAvel87EGnyXYXuKqL0Jp533QkuODAexk7kG7BS8vz45SLwXeKNzzrMgRQjh49ISXri7
         +LlSIr9toOl0nKqPBugE4BsQFu+Nj6G+H5lYNG6cCeLfrZJcyC21i23D85qY+6rGlltG
         6ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776428290; x=1777033090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
        b=O/eCjoV23AW5CHqYBx2sKonYjXvmeZ7GdcmFqieZuw3+gezsd7z982kOMPcQb3aPQK
         hmytaCUbkGSbniWEf79zbZGiCi2onUoZVO9WzHUztXkJ14zJ88DQu5JfNCxREF9IWcEk
         jL4nqv3gj4GMhoLRX9CYhjxsLdHA3BKXF9UrMwl6JzvpuF8h+4zxeKIgNW0ayhtF0yDt
         2kD7pxkdIJvk905/u91v3rQqBnQJPVjkn36/HC0s751LGw7d1VBh1IZEf36fLILCd6i/
         Ef4sbYnjruYrP2absZ2Vbx1ZD/QBqorQU29yQ1oToltDJ9SXKQw4ZLWdnnMDpppmHq2c
         nJMg==
X-Forwarded-Encrypted: i=1; AFNElJ/kIDD1iE9OueIw8TWnABD5gJlkIerLt4+FbFhcQokIV1w4tWItJFhxogvw05URcukQiOQyJ9QoXX0RFMUt@vger.kernel.org
X-Gm-Message-State: AOJu0YwwSXHit7pvyxDDjB6daMXsVoYxmEgZHgoJNhcjJV6PbW0oa/cF
	q8euwprZ9t4yrad/Vb4uNVvLpOJK/+DwIxsQk2Qz0qxQevlcZFmOSaK73BBqcUwmgCn070iA5HS
	6Yix+7twsRY+7nH54DYsH8VmL8yZrtps=
X-Gm-Gg: AeBDievec/+20VUL2vlYGWvX6D2FwDYtiADG8+338ZDgq7UjVmDVqol6U1Y3h20Akyc
	1NMRMZNlMPFr+AOSx4khpbB61LijUXTzepF1cif0kLlDS3TOTxKrGBrBqjhU3nuCfBDx6RmOgjD
	5Ut9nK4IbJaBjc6SwTDYKiEM7DEvLo1N7zMTxLGAb49xsrLVN3gQ9OyUtbt2OJyhA9xliUipUes
	mTbP/vEPDpE4SQ1SJhaQjo05Ow0/3EWbJW4WHjFsbMJaQYaMskmd5H/fFHUr0aFleTQ5ymhiBAI
	1cM6Zn1s8GAYVqIjGg==
X-Received: by 2002:a67:e703:0:b0:602:afbc:ae78 with SMTP id
 ada2fe7eead31-616fb89ea6emr791230137.2.1776428289898; Fri, 17 Apr 2026
 05:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com> <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 17 Apr 2026 20:17:26 +0800
X-Gm-Features: AQROBzDTVswzyUjJ6xkXYjkzbvzXgr8nk22CVU17PBSoxKtVUOrPnYmdya4d4B0
Message-ID: <CAH2e8h4rLZB3E8Rdwy_LtfwtwAKZCOgL18fRFVqGBx32Cm2N2Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Nikita Travkin <nikita@trvn.ru>, 
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103525-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[42];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A3F9A41B2A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 7:22=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
> the DisplayPort driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>

Best wishes,
Pengyu

