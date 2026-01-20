Return-Path: <linux-arm-msm+bounces-89893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDMJDgICcGmUUgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:30:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0684CFE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8D4B984EF07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 21:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB683D410E;
	Tue, 20 Jan 2026 21:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V1b5N+X3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105433A7DEF
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 21:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768945740; cv=none; b=hPkvO9G5AaH9NwvAZmyk/9sIDApzN3CcEpL3x1Uck2sUnvo3KimxySppnr2qcWO2nNbOnX/8NpoEC8Q8HGau74E25NHzOgNelUZbrpiXVGdPZFMfYaONTa3wfy4+oGNh2YeTJDDh4ERHDLwHwFGRfBZEYd7K+uDMqnAZ3vEoXs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768945740; c=relaxed/simple;
	bh=oSinNcy7MQJMB6O0vhsFi3YUrN1M6sLmjMn+yuyXi7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sb0XOwfcoGlIhTv5aeYsVVPp561RCwgf0JH8AQeaoVodAGzS99uu13t7LNkW0z7iinYMDi6Lu7jlY3VQs8tbovWmLgs71NZi9vtYyWztfdj3HzBzYSzUpGiKc+k+OPEodvEJdiEcT3aIqzLfJKippZoq3UENWHOpWF5Z5aFufCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V1b5N+X3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8710c9cddbso723891966b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 13:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768945734; x=1769550534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uywpCcOl3gnCRmtjGmJJnBGjcZqidvXnsvfeIDvMl1E=;
        b=V1b5N+X3aUnifDeSmiCPonij+j87zfkpXpxy0wJE3NQhA29no/M0XbLop6eoEMDdQh
         mBThXyrDiHZoJ0pDN8zSfUhTUpPPD/t+RyAEMVN143I6kCdOeZ26X0oPwzJatx2Gvql7
         qO1m4NQSpcgYaAHJ6JJMI9ro8k722HDCk8XRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768945734; x=1769550534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uywpCcOl3gnCRmtjGmJJnBGjcZqidvXnsvfeIDvMl1E=;
        b=SkRx6xSLR8VK/Y6oSOV3bN5xJlt5wLr0sMn6DhVdANesbdY0MuWCSn5vExutduCmdy
         Y4T+aOrNmlVS972dblrUKBBhxn6mtXOC6xG6BEodcLZ0Y1mwwsR++0hHGPK7D2jsyG3z
         LQt8WV51v2JLkrX///d0kUUW6z5i86rwIPCkO7sQKb/FJaJgaDaKVBycgek6oIrGQG6P
         hXQWHkZzamCEbnxHgliBS2gzRY0x5vA/9gJiNMfClsv5EsTdjrq1S5B/xYo4AV2a87Zu
         /CD3iHsvQBInZBCs1cZSn+pY+MNI62Th66oFU7io86By/u/DD4WPZUgfNIbWyfw8nu9f
         CP9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWU5HCctBaWnDr94LiCn+2nR1tdFnwBV6Ms1sqJVrsqELgP1xjnQ5VEWcIyerTv0TzW1+gSDXaRrjALHp0W@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5BF8iiKCy41mY7rXgekBjNMa0o2/AlE9cmAdVTBB0xhphi0Fg
	D5cWQQ/OnM7A6txXxdlkhaRNQFXoHRxhmM+8oT+rOoRcbq1SDYmoxivJpPyBdPZ7y5/AxECepqX
	4Uw2i6JAg
X-Gm-Gg: AZuq6aKDH+GaflxQJDt1auCn2w/XDMD9pdNuSgUgS7JjUwtlUnFwqwmY9ZbNncjia/G
	GMD8/z8i/n1aB/o8/v/jrUJotERRp5fqqmKYkyZCtiia4N4CImVfwtRh4BV4NeXW+5brQXMqxgU
	NYyv1Lxpj2ocUwg0CDetpEAl91x/ByCWWMGbxqaNv9RgYPFmS3xdQJpW1yX0syh0fj/wZHHtMKV
	wgz+67A6oD87V6olqbysPlZoZaQIialTQBqiSZnmpigO9xscpZDii9zGhAQyjgMMLf1uu3XyTJm
	71ACTKe/oJeFyZGiNGukS9ZvEAopfJ4X7A2wD/uHQz/XYmsvPQJcGgGO2zAgRdBpDOJblh4T65n
	DbwC3a+QJcCEzza+OfsgeXlESw/1ltwBIO8SAueBEEp8bUinZ6X1b3RLEu+XAVOCMjbvZdH+tyV
	GdBGUVG1ek0uNpznSNJESFtS6N5T1uOFZmWRfDPgHBSwG1POniuw==
X-Received: by 2002:a17:907:d716:b0:b7a:18ba:a63 with SMTP id a640c23a62f3a-b87968f6a60mr1206488966b.19.1768945734122;
        Tue, 20 Jan 2026 13:48:54 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fb980sm1570488066b.49.2026.01.20.13.48.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 13:48:52 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so5016622f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 13:48:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZGWa+O65wfw6QHQC8HbCjodFXuS2yiiYI3624oy9h/FVSonPxkeOPbZjZ5bzHlUQeMsHr7YPN0RG91vDb@vger.kernel.org
X-Received: by 2002:a05:6000:400f:b0:430:f41f:bd5d with SMTP id
 ffacd0b85a97d-4356a0897f0mr18898399f8f.55.1768945732512; Tue, 20 Jan 2026
 13:48:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
In-Reply-To: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 20 Jan 2026 13:48:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VPdf-X7HzCFTOKQATZpcgDXpMTXGQyTCAV=y_xr9pD1Q@mail.gmail.com>
X-Gm-Features: AZwV_QjaxP26eQTw4--8Qze5CTzgWoVmspYP5DVKJyJ5O4LuAjSnwcQLfdJ3TgI
Message-ID: <CAD=FV=VPdf-X7HzCFTOKQATZpcgDXpMTXGQyTCAV=y_xr9pD1Q@mail.gmail.com>
Subject: Re: [PATCH] mailmap: Update Jessica Zhang's email address
To: Jessica Zhang <jesszhan0024@gmail.com>
Cc: neil.armstrong@linaro.org, lumag@kernel.org, robin.clark@oss.qualcomm.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[chromium.org,none];
	TAGGED_FROM(0.00)[bounces-89893-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DF0684CFE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, Oct 29, 2025 at 11:31=E2=80=AFPM Jessica Zhang <jesszhan0024@gmail.=
com> wrote:
>
> Update mailmap to point to my current address
>
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Jessica Zhang <jesszhan0024@gmail.com>
> ---
>  .mailmap | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Pushed to drm-misc-next:

[1/1] mailmap: Update Jessica Zhang's email address
      commit: 6cdd8b58458941ab4c0ffade957db8dc773fd91c

