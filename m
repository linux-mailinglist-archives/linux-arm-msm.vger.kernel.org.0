Return-Path: <linux-arm-msm+bounces-88476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB588D11270
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F56E305A8DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE79C33D518;
	Mon, 12 Jan 2026 08:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2/UuxZ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706F133C1A2
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205712; cv=none; b=sFrysYYrXkj32D8ipr+HoqtE+J1sWYbYXPEQDMwmabAUBDV8dMTCszRHh2kkdNVHXF1yOWctrYvZFqbVucMGeXjj4NP70dZOkPkAGXa88PnBAlAZs1bHRFSA1HWhEMECtTm4BBhc5v5jwrUjzgZKo+5t9Zz0CBtyCoLT02VowcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205712; c=relaxed/simple;
	bh=5iyGrD6t4jKVWo1soh2XCJ43j2Qzm08eL5ZkM2bIbFI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=EQ4fuODIL5mKfthsCGDLZS3hrKEunzZE5DzOnrfq9w3qD3Fmv7t7ju6X0XhwXLG5jk0xc+0i/cRafHRdw6XKG+3zrMnOUqohF0aP5fPTy1mnSZMBkTUPJnQF4jUJ7bEzB8hKM+hkLyt5eRAq45nf6dTEiPfqSN3DgMTjVf56Tx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2/UuxZ7; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c1d84781bso3433954a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 00:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768205711; x=1768810511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5iyGrD6t4jKVWo1soh2XCJ43j2Qzm08eL5ZkM2bIbFI=;
        b=H2/UuxZ7KuYZJWTND/PR6/gWyoqJa9ysZ/WtSno6++P3QA/RtqTUfxDVUbo+1Ymi1R
         E8wu8pOwtbtMS9EIHNZ2P7SlOxxftUTZDWlKToIg6PDXlaG8v+6ruYwA1d0vpv2jrUOq
         PP+pUlMyE/C65vOckKSD5Cl/mMtlOwbIppzIKU91T74bNRGVlpkdB4hWyhmxeHw5gyLl
         EuVVxzpzsW7pjPWhzjQG8CyS3qap+qt7Ic1zmJswbuGaWvCn9KVjEQSd1/VPRe3KKQ2j
         tIeKY5tzXeeGNK7q0TLpSqxwdVqc5A+y0S0vKMDXneirke9T9QKTzYMHtlGl/pG0KjxU
         y2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205711; x=1768810511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5iyGrD6t4jKVWo1soh2XCJ43j2Qzm08eL5ZkM2bIbFI=;
        b=hA7C7qFX8IWsgZEJd5BvnkDlm+vsAbKxW996nt+QohEG9A4J1D6wFqfPeGJkwKK9U5
         dIr7b1Asxhk7k4MLx9bE6EQ6EAOq654DdNiMSnayMB4Wg2woi9VC/wRgXadpbMVvNRIo
         a0s69zT7s+vK3OfFbhQtrwLQ0sDFK8xdme3xn73aZBckipF5+M0rd7bse/quExSH1Tys
         lMERlB2N04m3QxtFcQDKfauHBXfbu1rMHau4fq1QlTT2e6HHDQ5bnqgRhaHDNf1vab2P
         kj4f2JaA2+bwf9GP2Iij2LYVoY3q+SWRC/BIfmGy/nltueFC/qz5CBRDfmuu67ELabuO
         ZG9A==
X-Forwarded-Encrypted: i=1; AJvYcCWyzjH/AJMb0IlWHsZl+2sZEveTBwU1SiUslmCfs2lUYLw7VGLTVVEs/KxumwuNoxo1uMadI0Q/XoVLD/F0@vger.kernel.org
X-Gm-Message-State: AOJu0YwBsQA8IFm5IaRI+Bn8s/tgDttDyOy9PuV2nOGeKWcKDNand6I1
	572qth1XkqnLBZ8Y2yBseSDApP1UCfWpDWqwhnXlW7FLKkaRbHq82yPmt9mVkj3Vz9O5v2neCip
	QHhr1GEKO02VokKIhc/BZPwRkENKhq58=
X-Gm-Gg: AY/fxX6QtWblD95ZV7LeCD34/jOftqgfLUp4DtQGPWWfo7rLa5HVjKemdCwqc1zKIF6
	Snw6WG/yeqddiIEHVdNhyXbKtIwJNtmNh4YKr6Vsg8Vd1SKkTIQoDrfs/EbpqOifi8S8njR99Go
	bq7ReDrCJKL/MKZK13l0ZFYbT+iWV7ITS/zF2M9yltnvXjD6i2ExR7gEbRQiV8uYyKZ3Ticv4RN
	H+bKE5aIBiuWJGKOrMDRtoqpA9gOUT83ghbC67y1MiHU1+g9l2S+W42mXA1/0lbRhoir4SpRsKA
	Z5+XiAw=
X-Google-Smtp-Source: AGHT+IEO6LjtBiiTakABt83pr8vBjMWsli6acZVk0wkTf7Od07uEXvjAYcspCT/ZRXWJY1wLF7d5BoH0Kph9pg0c/zw=
X-Received: by 2002:a17:90b:2741:b0:341:88c9:aefb with SMTP id
 98e67ed59e1d1-34f68c0241cmr13310625a91.5.1768205710536; Mon, 12 Jan 2026
 00:15:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Mon, 12 Jan 2026 16:15:01 +0800
X-Gm-Features: AZwV_Qg4Brt-nf3YdMPJ1efWhynaAQd8e05kQhY2LdIZ369g5-5ixvAbos9jnQA
Message-ID: <CAK+ZN9rJypDknnR0b5UVme6x9ABx_hCVtveTyJQT-x0ROpU1vw@mail.gmail.com>
Subject: [BUG] misc: fastrpc: possible double-free of cctx->remote_heap
To: stable@vger.kernel.org
Cc: srini@kernel.org, amahesh@gti.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While reviewing drivers/misc/fastrpc.c, I noticed a potential lifetime
issue around struct fastrpc_buf *remote_heap;
In fastrpc_init_create_static_process(), the error path err_map: frees
fl->cctx->remote_heap but does not clear the pointer(set to NULL).
Later, in fastrpc_rpmsg_remove(), the code frees cctx->remote_heap
again if it is non-NULL.

Call paths (as I understand them)

1) First free (ioctl error path):

fastrpc_fops.unlocked_ioctl =E2=86=92 fastrpc_device_ioctl()
FASTRPC_IOCTL_INIT_CREATE_STATIC =E2=86=92 fastrpc_init_create_static_proce=
ss()
err_map: =E2=86=92 fastrpc_buf_free(fl->cctx->remote_heap) (pointer not cle=
ared)

2) Second free (rpmsg remove path):

rpmsg driver .remove =E2=86=92 fastrpc_rpmsg_remove()
if (cctx->remote_heap) fastrpc_buf_free(cctx->remote_heap);

