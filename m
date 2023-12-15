Return-Path: <linux-arm-msm+bounces-4922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3B8147DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 13:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDCF61F23661
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 12:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85DB2DB6F;
	Fri, 15 Dec 2023 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oy2IftDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8408F2DB81
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dbce6056e85so479484276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 04:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702642675; x=1703247475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVUgt3o5mUcfJYh8WI1Bvo3s5NmfbkvnzCcFCafce1g=;
        b=Oy2IftDYMlyhYd8tlCPHQl5z5VI9KHVBMy3hxqhybKVDFAj9/HaJMHFPw0kHShDUk3
         zK4oPrcr6D96RMxbDQ3UlN58euL0uB0JtxgFhV/6mR0xG9/Ldmo+86hulJeLrioqY2D3
         T9B9USyQopXrGACyXpam0o7NuYiXz6JiwMXrn7Bygsg6YpTHE6iReZZy5BupN+RRd0F2
         RifKhMT7jjE9q7aR7s5HlYkXfqXA6rZT32tJ/Zaol7Tf462O3zJomI8V45hiiTrrEjpi
         RH66LfeBBz7KXcj9dZhPPWK3CG8eBTbJfIWhNxhsnnc2aODVShRnyi7aFYLYXYxWOsQi
         SKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702642675; x=1703247475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVUgt3o5mUcfJYh8WI1Bvo3s5NmfbkvnzCcFCafce1g=;
        b=UNiBtH5z9lc46jfdG4XiZhYMUvb/YEH76u/WHod00emhX0oZ70/w9St6el0MmxJIxl
         z2iyvIQ+t1OYdBzCe+BsOaUCitj6nieawhYSckU5LU+CWHqSKQtJ5muSpRCfQp1ZQamI
         jvSFDtthhyr4mTOWA8jovi5ozBOQRhkxTwwqzVKNkiGF2s9BIFsgv/1o99zYEzMpWsU7
         7BtOW2FaJO6eCQp1pcfyNDw/hAAXAUUFDz2XcaHuvEZAul37OoNOmwrh2zmVdSd1B6gb
         M+287vg4ljZVyZH6O6Qy+LTebsFWutKQFqQCxKKlrCge/MOYU+HbC8oK45x4+AVytA4B
         X7DA==
X-Gm-Message-State: AOJu0YxdhB+xpgeA0ddxTBAeWBcQiSbShSeeQTp2ifXM/Eh+ApgrgJIe
	TjAk79a+KlWNU9Bp6UFvPL2/vU5QygJY34bdvnI=
X-Google-Smtp-Source: AGHT+IFeJ9g1nM4/h4KsH4odOlzsrb69XGUx2rrfVzZQhgOKkL55WPfX5PkQXV5nZB5KEtf9wL8VbLU1tByFsCqpl/4=
X-Received: by 2002:a25:6d45:0:b0:dbc:de49:6366 with SMTP id
 i66-20020a256d45000000b00dbcde496366mr2491851ybc.18.1702642675365; Fri, 15
 Dec 2023 04:17:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1353f064-62b2-486e-b6d3-1f9fcf5bb1e1@linaro.org>
In-Reply-To: <1353f064-62b2-486e-b6d3-1f9fcf5bb1e1@linaro.org>
From: Josh Boyer <jwboyer@gmail.com>
Date: Fri, 15 Dec 2023 07:17:44 -0500
Message-ID: <CA+5PVA6Qj5a8s2dSXTp2t32mNC76MwdXHbZWjOyCECM_bTbi2w@mail.gmail.com>
Subject: Re: [GIT PULL] Add Audio topology firmware for Qualcomm SM8550 and
 SM8650 QRD platforms
To: neil.armstrong@linaro.org
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 7:55=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> The following changes since commit c52dc2526009abe1a685f190423f605c01ac1b=
86:
>
>    Merge branch 'mlimonci/missing-dep-ci' into 'main' (2023-12-12 11:56:2=
6 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/neil.armstrong/linux-firmware.git sm8550-sm=
8650-audio-fw
>
> for you to fetch changes up to b80907ec3a811aff9afdeceb7410ad408f7e0de4:
>
>    qcom: Add Audio firmware for SM8650 QRD (2023-12-14 13:22:35 +0100)
>
> ----------------------------------------------------------------
> Neil Armstrong (2):
>        qcom: Add Audio firmware for SM8550 QRD
>        qcom: Add Audio firmware for SM8650 QRD

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/98

josh

>
>   WHENCE                          |  18 ++++++++++++++++++
>   qcom/sm8550/SM8550-QRD-tplg.bin | Bin 0 -> 24296 bytes
>   qcom/sm8650/SM8650-QRD-tplg.bin | Bin 0 -> 24296 bytes
>   3 files changed, 18 insertions(+)
>   create mode 100644 qcom/sm8550/SM8550-QRD-tplg.bin
>   create mode 100644 qcom/sm8650/SM8650-QRD-tplg.bin
>

