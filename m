Return-Path: <linux-arm-msm+bounces-67031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1793B15087
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 17:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48CD1189E97B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 15:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6402957C1;
	Tue, 29 Jul 2025 15:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bMUkH3hW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E291207E1D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804540; cv=none; b=Feyw0ljY19+L70dYfCt2c204rsYJFBAAv141lTYj5ipnPigNeavO6wx/Bh/fAynbbDMhpE70S2fG3wqi0Xrwg4wth4Vvn9WIOpIB7Lf54uObUu2lGRLkcsuCJ9PXhSx9vpTlPNJPbVlNpZMHw1qvtFy4BMRILDDRw5H4tvc2Jvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804540; c=relaxed/simple;
	bh=zCssDT2BlR2ddGZ/s6nI3zWZcFEmq3mkKYK5ppXgMLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSe8OQABkovNajYTHKQgcJbFZWZX1/xeMHRJFQr4l22R375UibBCkO4JE+vByRWlYpdtRYEqqsGDfqap3ZBtJPvB4t18ivEftTCT1T23/xbALKsn34+UHRmvBl1V7KshN6PmnT71unougz/+ErnLWqE5rQpb5TVHPTh7yaPpAec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bMUkH3hW; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b350704f506so28899a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753804534; x=1754409334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELxIfhrJzM9gjDNT6LfSal3ycdHCOt4AXjIO7oTLtoU=;
        b=bMUkH3hWZCfKZNiXC9Ma3O4O8f7U18B8Wc/hje+qD8H0SPkyCKiOUAQbZQ6glUErW3
         n1bFeN7cSRcIhA8sJBUqjqRZjkGkYusyQDiyJKvtQdQAMRdRvI/HSrHz4iJbaFsdEJcs
         L/CpEuUu/fWPAv8kl5h2X5DKeju+/6T92edn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753804534; x=1754409334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELxIfhrJzM9gjDNT6LfSal3ycdHCOt4AXjIO7oTLtoU=;
        b=SGchmkRe2FWa7b1eXslXVwM8MeAkcMxZ5Kows2e1s6DN40jXT55BPP7trFP8vUPob3
         /cmDot9Qk3t1nVAKeYOQHSlO+yu/HLQPmmB30CjaSS7SvuqN+EPY+4F6ZJ/cugWq17RU
         8qyAjLuws+Nz7+z+6PVtG2gFEXzLDjpuR4pFhAPa29l6xuNq6uGYoLUVcCeXVH6rlOMM
         yPz/Ck2M0dGaxGY47VZJClIUxT5CfBhAISKu/emrX/8mINb3mNGrMIB6kTDig0v/TFI6
         PCmnfVB5uy2cuH/tG03lWciPaYTLiI8jEI7bfvDO74ZbCL1DZcjPiiy1/8eymGeq7JtG
         5PTA==
X-Forwarded-Encrypted: i=1; AJvYcCUg62JDxxjtIj/D2A+zg17I1NWiBdKPZrjodZbhzPqjfqOY8EyFjaFQPtMxumyh/QVZH5m3SjiQn8/UIG2C@vger.kernel.org
X-Gm-Message-State: AOJu0YyFA58vXq719AFiRvAX42fX+FVVTRPpm4DBi2pt82cHbPWSTSEJ
	Pe0X7HWoJEOnoqM70tAfbhVlOFu138T3JGrNP6s7i6Z3qENeF5SqZqYW0af8fFj5OG221AlR2mH
	+wck=
X-Gm-Gg: ASbGncv+4ayvb01+GX9HZbE9PwhLobc+NxEysxJoMP9SkXY1pDTAmXvSIC/Dokyuzdo
	V+5136GYOSVecua4s6PB6iLPsy+sf6fFhqhtBhSStsp2kiDOW6k7LrE8kYolui3Bwct5lbMvGPq
	M2G6v2d5QXjLU2k3AXRinH7atE5ITE0cqrF5EJBkfkxSbWFGrZXT8gvlgDQadviao2JqYn4+7Fn
	38JeGyIZm+pbPei1gaEDjRADhCir8UFx2bD/60R5qYVRTNsEhUNWFR6by7UWHC+OoZv7iQB5EvP
	6R9bJTHkouXOPoo7jECy21HxiAqVEz/3432opVGPPi9ruaYogSJ4R51ZMtvBLdXwBNdhxaekyln
	kU2g+IZCiZgHyaueyW1jor/hbsf6sIcFWTG6g6BDy70ofEHJDPk7xo12CXWQnuw==
X-Google-Smtp-Source: AGHT+IHPEk016rzgugs9eWOnX8Tlx4q/lCM/YZfR8JQidTDHh0fpYqHR9ZdPkBm4ooDKWgBwOizSXw==
X-Received: by 2002:a17:902:d492:b0:240:417d:8166 with SMTP id d9443c01a7336-240968a00b7mr519805ad.19.1753804534505;
        Tue, 29 Jul 2025 08:55:34 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24014fb8236sm55346805ad.17.2025.07.29.08.55.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 08:55:32 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31efefd2655so22793a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 08:55:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAwbsVezlJ59N3cBKV2p1fYoW2FxBSmf5VSyOyHAT+DMEH2Vt81mfHTM/VO0fRIkIdj9sCWNHgcyRpU6Zq@vger.kernel.org
X-Received: by 2002:a17:90b:3a8a:b0:31e:b772:dfcb with SMTP id
 98e67ed59e1d1-31f28cdb992mr5501419a91.10.1753804531722; Tue, 29 Jul 2025
 08:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728-topic-chrome_dt_fixup-v1-1-1fc38a95d5ea@oss.qualcomm.com>
In-Reply-To: <20250728-topic-chrome_dt_fixup-v1-1-1fc38a95d5ea@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Jul 2025 08:55:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-OkZMJCr2Dm1_z1qXaX8sJnX=LhRjXVZqMZNnYHna-g@mail.gmail.com>
X-Gm-Features: Ac12FXwhvU-MKljZvKjMKht93COeT38n82UujnqslPAoyz1yCqEzHnCwfYmzaX0
Message-ID: <CAD=FV=W-OkZMJCr2Dm1_z1qXaX8sJnX=LhRjXVZqMZNnYHna-g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280-chrome-common: Remove duplicate node
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 28, 2025 at 2:34=E2=80=AFAM 'Konrad Dybcio' via
cros-qcom-dts-watchers <cros-qcom-dts-watchers@chromium.org> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> sc7280.dtsi already includes the very same definition (bar 'memory@'
> vs 'video@', which doesn't matter). Remove the duplicate to fix a lot
> of dtbs W=3D1 warning instances (unique_unit_address_if_enabled).
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 5 -----
>  1 file changed, 5 deletions(-)

Seems reasonable to me:

Acked-by: Douglas Anderson <dianders@chromium.org>

