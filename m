Return-Path: <linux-arm-msm+bounces-92027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACD+NgLVhWl7HAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 12:48:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3F5FD59D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 12:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 920D330075CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 11:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C5733D6CA;
	Fri,  6 Feb 2026 11:48:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA1333CEB2
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 11:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770378496; cv=none; b=V4RjwDhOSWVb4pMW/8HWOl4ohTXK+LX3duvX5V05q7SCGhl/LQMyp8hEXVdrQT3jcPDM7vtIsUBeJasUU8AI++ilgv9/SMrHCqjSpsR9iJUUabOiX9/WkBYWAWUroMhE90K9Vhw4/Wr8mJKyC9Jxbb3He31+pY3WD/sb35rag0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770378496; c=relaxed/simple;
	bh=nDt/vXkdrwlFLc6IplzqVN4ERfQQEKntxnB2CbvM//0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSRgfu9WQNmPFJiami6Ah2oDShZqwVcH2uBzAd60QNlS6EiZsbWHc9UFZuQ2aBhNNfx/lp9MXQVrhkzfvbxHWlvVIMn1CXc/Wdum+o3k57CtEa6qlW6/R3zG6fEZodHBb6k5ZV3zu1ikXqQGPtGIB6Im8DzkhJofzw0VWk4R3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8ca01dc7d40so204634785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 03:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770378495; x=1770983295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9PKdkFDBpdEaAPJ8ineUNhYTfLtKuh6xL3hbE89jpuA=;
        b=M9kZn3FO/UaIxUJ9f0P3wxweCDpZ5++KlPGYLe1+hxVYaaPHoe+jpq45XWb5uhUewf
         fBxq+xMYZYXKShWYXRFZvdt9ZbHTR/QznB7Ip7x3RBUMSVCUMGjJA+VSKKElELQFJCrY
         EWhHQVek2bIQdjHqxM0ZSh3ikG7/OLf1o5mU6qRy5IvoiDyFdsy1BPM9WRUUBMcdcKCA
         ot86EGpywCQbkzXoWDagwB1115wWsAHUB4L3LSjzuXNnCX1e2m54dAvwCm0VZV62Xu+q
         lNVXIycPdYXXIsffZVr9Rb2JG93qT5X0x/cfdfEgk4KlJFFAOa5jVPfdoyv8CARDMGJm
         Sc6g==
X-Forwarded-Encrypted: i=1; AJvYcCWpdGLcWGRKgo5FCwUrq4DMYlX01YLfXVjMd4kZEfZaRr31KmriEe2XEJd9CEI1zUHzl1RbxbTcMHWOvFFe@vger.kernel.org
X-Gm-Message-State: AOJu0YyGRroOBAn6J8LS6qyZCw8CRvcXvyb80mRX1hDlkTHNsRWNE1HK
	cUtCsPeqs0xaiiZ7TiRK/6IUN+qwtMM7sKXoH7ryfBBv5SNObHTFxq1geLzAWwSL
X-Gm-Gg: AZuq6aLNjfYnTEa8e2l8qLj/7vEhPAEYWRB34jILqtgIkSmQeRueD9HDv2CNAfH9SuA
	TY9UAnsAMLmCYJgI1IE58PAQ6Q+lBlRDvz6DqbeZSIMk4q8WzSH0cqthL1UfaXC4Nhc5xIVFyOV
	PuUUEdWQ+rNqLpoUowA2WDRAdYe5dmtSkPM5v0W8SO6oYcO7ksQENLWQnaapuI5gLYNk2PUC98k
	sqHKRSclfqL5XjkZEpe4wRy45nqiUjnu/aYBN0LdY2FRzkQMHsNnbGJ4P2HSTsp0a5JuyDqxl+U
	XSEHqWsL6Yz6HEq8mO1e60DFOVwQobY6jL3Qtqu2Wb8en08lDFIDRgCt316MUPhgpUSDRMlHwdd
	MeVAQEuCmw85nBgJvYzNrFE78qZ4EJ4gt3ZeHnOnD+TqAa7C4dgPh5JuFc8NIgL8vzd0HGTpbh1
	4wss1rtOM1WpBmL4P0Ba7Bh5cLemdWSpyfmOdkxnTAbwWRZw==
X-Received: by 2002:a05:6102:3e81:b0:5df:bd66:7b76 with SMTP id ada2fe7eead31-5fae8a99122mr576083137.17.1770371852607;
        Fri, 06 Feb 2026 01:57:32 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9490173b2c1sm547281241.15.2026.02.06.01.57.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:57:32 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-566360cab02so1213252e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 01:57:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWax7BnmTySVlRKwnvAkElq7HDFOzPLOJ5Wmxo48kV+Caxngo91oek6U2k+DCplbh/g6Et1P77pT+o60xC1@vger.kernel.org
X-Received: by 2002:a53:c449:0:b0:649:d604:fb90 with SMTP id
 956f58d0204a3-649f205a43dmr1514153d50.53.1770371364383; Fri, 06 Feb 2026
 01:49:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com>
 <20260205-winged-alligator-of-sorcery-aada21@quoll> <CAEQ9gEkkK_qBCq__oSJb1D5J=gLyw-kVDx1OD4SMPry6z-F7nA@mail.gmail.com>
 <0bcd3cb0-9231-4cb0-a726-c439d01f63e5@kernel.org>
In-Reply-To: <0bcd3cb0-9231-4cb0-a726-c439d01f63e5@kernel.org>
From: Roger Shimizu <rosh@debian.org>
Date: Fri, 6 Feb 2026 01:49:13 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEnvM1x9zP2RDPpEs3TMZ2Jcah7OU6s0y9zJY-7qFUJJTw@mail.gmail.com>
X-Gm-Features: AZwV_QgaD4XmhDKNBHfx8XaTKWfKOlqUfpjXIlHN1Z6ouM3UQ5-2qulJHJBUYsw
Message-ID: <CAEQ9gEnvM1x9zP2RDPpEs3TMZ2Jcah7OU6s0y9zJY-7qFUJJTw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: lt9611: Support single Port
 B input
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hongyang Zhao <hongyang.zhao@thundersoft.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[thundersoft.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92027-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.957];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 0C3F5FD59D
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 11:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/02/2026 21:31, Roger Shimizu wrote:
> > On Thu, Feb 5, 2026 at 5:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Wed, Jan 28, 2026 at 07:15:45PM +0800, Hongyang Zhao wrote:
> >>> The LT9611 has two DSI input ports (Port A and Port B). Update the
> >>> binding to clearly document the port mapping and allow using Port B
> >>> alone when DSI is physically connected to Port B only.
> >>>
> >>> Changes:
> >>> - Clarify port@0 corresponds to DSI Port A input
> >>> - Clarify port@1 corresponds to DSI Port B input
> >>> - Change port requirement from mandatory port@0 to anyOf port@0/port@=
1,
> >>>   allowing either port to be used independently
> >>>
> >>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> >>> Reviewed-by: Roger Shimizu <rosh@debian.org>
> >>
> >> Where did this review happen? V1 had this tag, but the patch was
> >> completely different, which means you were supposed to drop the tag.
> >> Please perform review in public.
> >
> > FYI. v2 was updated per review feedback, which is public:
> > https://lore.kernel.org/all/7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro=
.org/
>
> Link above is not from Roger, so again - where did the review leading to
> above tag happen?

Per feedback of v1, v2 was quite different than v1.
For v2, it's close to initial review, because it looks like a new patch.
Of course, if you don't like this way, we can drop this next time.

-Roger

