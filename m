Return-Path: <linux-arm-msm+bounces-60262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D69ACE5CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 22:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A4283A7C52
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 20:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140B11C54AF;
	Wed,  4 Jun 2025 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQ9/uNIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870F319ABC6
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 20:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749069466; cv=none; b=lsT+84nB00CkIYG4XrQua6jTW+akDxFwa5qcvezQdMZIOjZcOsNb9Zx1D5qfotMJNGbsW68RwhkWnttYZGJ4IHxSBahm/DhBeFG+IMfGINJabEpr9YW+zUHx5K8r31pRW90fEQ2+DilrnRyzG4egqis8CyCzv2jQW2wrqrXsSg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749069466; c=relaxed/simple;
	bh=TcoYyxdp0UeD4GFoZWl51umtRzoaULT0AaGoGAdnp54=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=c35wLAaHmXoq4RhCdYI9QIQe0XnWnQGUZVYmXZjtHNoRghWWCv3l3eHRp5mlG+zeYFIa4zoHXr11s+mt/MFrYCExuEk0VOewExDwcp0xb/1Jq6dF9TNGRBwtx29w6UWceX2SmY2Jn4O7Frip5jgYI3seCUGxPXB32j9BJD40R3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQ9/uNIR; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3dc7c19a4c6so1623495ab.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 13:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749069463; x=1749674263; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XFwt8jx0g/c+CABPRMM8ZkkvfXfeIDPzYoKjG59j/ew=;
        b=SQ9/uNIRWK/Eps/4LHpNjOIfvRGpvEUamg5qwT7oCo/jCKHvzXTVXI8szhJMh9YTkk
         1TYhBQWHICtHSPvJarHyH/Y3yVxWZRSxh+YVllw75PCcfMIPBJ5gWXU+NpgS5IAnvzgO
         J+rjn+r/7YTWecJ81j4Z8H2GMPyQ+CdxszOsa5rStN5DBJwlJyY+N8RR4lMeeYKw07Z/
         hr57Qph/22uggtfWYXIIh7n0vrh+AMz+B4QVsZDC5/7q7pIJPV/5GKUEqX+cKj0To8r0
         hVcDqk2LmM+7GBX1JBEljMwp95pMkpkXoQtTDx9xSp220v2fABgzq9HUSnQr+fRdw5B/
         qYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749069463; x=1749674263;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFwt8jx0g/c+CABPRMM8ZkkvfXfeIDPzYoKjG59j/ew=;
        b=RQFqXBocjKf7NYt4Z1vpCF0GwGTR//nBSMaDgYMwdZrqY0JonTnT+LgqxKkDrFVsM3
         kLt41bXb1x6eE+DuV/ZGkivgFDnIetdcccobM7Qc4d95/DGGK5ELZ96HYuiWcGF2VCeA
         tihK5N2PyhEpRalIMSYd7AGCculChacImSLtl4gJcgaNaOcfYQgJWA5Km7ChW8qkFMc8
         vPj14JdzIQhW6F1mnZR5/ojdpp/QgjVDgNHqIKOrI13upJxBNSQh/nqDGN23MeCDJK0T
         B7B9Qapnnr2pEyfpAKfTCsml+DBttVBr5mEF0LL2WtUsB5tB4iWAq5ZIjpvYRvo4t1yB
         faIA==
X-Forwarded-Encrypted: i=1; AJvYcCU7OvaO7t1yW3PUyK+pSbsybkemR2SeuAOv/3K8tA/FotUB/8KCDHNuxu8gsnv+hw8fsN8kjBpJdXr54Bl6@vger.kernel.org
X-Gm-Message-State: AOJu0YzhBbfn1jO6V+MACFVWVdsOmOuEY8fnQdVF7mtU0FVCQkvYwNvR
	mQIPLoJhMDdtl+BI8MW+yGLmM3S/6JkugKEYISLlY5o5PghlUO+FYiOJ67CLWQd5C8bzMyZb2z3
	pJGp0HvUvQ5wPRPgUM3gET8O2J+p1iJU=
X-Gm-Gg: ASbGncu8uhhnp6UXTGPkMPFpcT5uvWR96uzBzqTEks3+sKutVX7bwEfcnEPq5+SDEvL
	UntXBjompfhbpWWhcBhw9DyxKjJ1XFMBWrEN60Ss6gealig7O5OtjlXrRzSQE9eQ6Bb5aZ+SnoQ
	6ZP2dHhdd8brDORuH0gxG+sgd9tt8eZucugwpk0RFsmfkduM4x6I0SVUzT4NEVtVon
X-Google-Smtp-Source: AGHT+IEkEn+Ys6yp8GhjuhLo+PHMDiCMbG10n36RLxCtVWagLr2ATCucAOGms2ilLGEuUYqFxod590RMviUUeMvmCio=
X-Received: by 2002:a05:6e02:32c3:b0:3dc:868e:dae7 with SMTP id
 e9e14a558f8ab-3ddbedd26e1mr52052875ab.15.1749069463257; Wed, 04 Jun 2025
 13:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Jun 2025 13:37:31 -0700
X-Gm-Features: AX0GCFtZPDMs3-fiKOKQL4sBwvvhTHcy7kFG4Zeir1ucFEyfE5oK_zHqGpJR7UA
Message-ID: <CAF6AEGuW1kpUijxzLCc4TKph72-PfXvHTttNu214_1GB-R8qwg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-06-04 for v6.16, the mailmap addition
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dave, Simona,

Some mailmap/MAINTAINER "fixes", as there have been some recent email
address changes and shufflings for drm/msm :-)

The following changes since commit fc5c669c902c3039aa41731b6c58c0960d0b1bbf:

  dt-bindings: display: msm: correct example in SM8350 MDSS schema
(2025-05-13 21:53:34 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-06-04

for you to fetch changes up to ee11d953fd230b4e1c28388913826ca832ae8444:

  MAINTAINERS: .mailmap: update Rob Clark's email address (2025-06-04
13:26:41 -0700)

----------------------------------------------------------------
Just some mailmap/MAINTAINER email address updates

----------------------------------------------------------------
Abhinav Kumar (2):
      MAINTAINERS: drop myself as maintainer
      MAINTAINERS: update my email address

Akhil P Oommen (1):
      mailmap: Update entry for Akhil P Oommen

Rob Clark (1):
      MAINTAINERS: .mailmap: update Rob Clark's email address

 .mailmap    |  5 ++++-
 MAINTAINERS | 11 ++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

