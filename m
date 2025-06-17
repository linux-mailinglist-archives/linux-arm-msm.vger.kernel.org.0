Return-Path: <linux-arm-msm+bounces-61577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8734ADC7E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 12:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6517F1666A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534571C54AF;
	Tue, 17 Jun 2025 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5iaxLfg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E927E54BC6
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155470; cv=none; b=ehIwh7zZbvtBa+W5EnOFhiBP/RZiPNtM5RmOzerqswoQePcjsFl9sZtdhaOkBZJw2z4PUCCbC4A24xdD9nN6imFmBqp/bL/QowPFu1Suwhg427ycmkHnRetGS62cMt71m/hdocVpLoX6ix6K98uUBpaTRNANaX2koUQ7Gj0v8I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155470; c=relaxed/simple;
	bh=jeu8aHsj3T9i9nhtvfRXCQU+oQI2Hy+nwV+M4vPUg+k=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type; b=Q0HoZTFVg6RvjCDtxrfVp+40r/D8KUZNYEND1Nl2ttoyhEFWHvmUyZhKJRv2bS4LRkE9SQV0NCenuaBoZ+2ykdEnLqPNdFj1Evpe1LGSnJOSP51LjQ/JgAeYpd7bToWcvFzKw0NPZjO8OIYwYvyV8vYibO5ICXu0o+1WZ2LlgIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5iaxLfg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235d6de331fso66963905ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 03:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750155468; x=1750760268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:user-agent
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jeu8aHsj3T9i9nhtvfRXCQU+oQI2Hy+nwV+M4vPUg+k=;
        b=G5iaxLfgw+Q1OePA4pmcJ8z/NEiPmEnvDwIrJOlDsd2MdRV2uzvhnf1uLsihgGIkjc
         df8J2orGeQf7ibGlPHdIdgb+6sFmL9+sLpnirZUh3Tn7uyl+1nf1Tjf3RucHspsHzdOy
         AJ/arnKwWjYeCC877iXiy2IM+p+sDteZdihPHXKh9v5PAX6JcFAOPyB0jaXQIqtpZ27b
         yfONskHDT7XeWgKb8LqkxMiiI/BHr+f0TUQxUMEVeXqGFqcz2CJh5ITvf8UewyK3T7ao
         xRCiV6h5jJ9afIJpgVQCwNZwuyE2s/XzQAs51S0hJuBcgVcebk95lZdSEnEAABxqMKzp
         qXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750155468; x=1750760268;
        h=content-transfer-encoding:mime-version:message-id:user-agent
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeu8aHsj3T9i9nhtvfRXCQU+oQI2Hy+nwV+M4vPUg+k=;
        b=oMoqTVqMd7ph/NamacuMBMGUSA3bI2nQk1htyRhQnhyHRIGmRkmAufMW2SuTR7JhVj
         duHdqeboIvAM31CMYkgh3+ZU9XhmnizhigZMSlunV7ctd0ZLS9neh2svGHvyRNEdQHtd
         hu7NLaTMCBndljY4EJ7AwzK3YL59dDXIdvI+iWAHFjzS8wV5yZ6WL8OIYKXZGbCuKI7+
         bZZKpUBClqx53vvyg1LwkvkVoi9zywqtM8qQO3pt0zD0PkKvXEKvYc0yfrJi0A+6ng/n
         Vaohv/26vT4fw0ZDG5fMFXUqfWWLoe45SD8DI83zp/ZqBOfMl4xb32IpbosnwLGAipnM
         5nkw==
X-Gm-Message-State: AOJu0YyDz/4CvfNtLtkI5Y1HmonF2F5/3BcL6Sdl5MZxblVp3WEyKFFN
	lwddW/DaRSL0q3KCE8hMeYwSxQbq+ZcL0qEYO4e1dzHnsQ2bR7gbviGTz/c8/g==
X-Gm-Gg: ASbGncviXoc9u/upTaqQesWvbSLx0w6rNeKU+niYaOD38AV3kNvNGT0DhfZKwc07Oil
	hyqJCAein/swCN2TWg7hugF5V7Td7QFvcAEkRkggNBFyA+SYhdHNCWTu7zVycGEgueOGTpP170J
	Nd6MpeclC1zcg3MKbV2Y/1EN2K5UC3/sFYPyMr2xIFRfpVv7wPkaB2biylRh2UdbGkidSr3vEuZ
	aKHEEjYPEpYO5iTyuSvmYZw5Y0j0EwHNU+LXBiff7P7uqIGzNMvRAoQMgugiH2MJmPsgjxOhAt+
	KUG0SYh1GXhEphZPJzqIhbnUdPAVLfLjt8FYs3oKDwC0zKHzYmU/dQHPtIfER8f/+a6ZRGY=
X-Google-Smtp-Source: AGHT+IGtOb3GenpTJro7CIF7/EQdI1tRj7aFlLGdbxN568Jr1PRHRMMaZ4mMH1Hxh720GdEFS2geQw==
X-Received: by 2002:a17:902:c946:b0:234:d292:be95 with SMTP id d9443c01a7336-2366b149f20mr169857685ad.42.1750155468074;
        Tue, 17 Jun 2025 03:17:48 -0700 (PDT)
Received: from ?IPv6:::1? ([2405:201:900e:b1b1:7db9:b6b5:b232:fcae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dfdb9a0sm76601925ad.239.2025.06.17.03.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 03:17:47 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:47:45 +0530
From: Abhigyan ghosh <zscript.team.zs@gmail.com>
To: linux-arm-msm@vger.kernel.org
CC: mitltlatltl@gmail.com, vanyang@smail.nju.edu.cn
Subject: Question: PMIC GLINK role in USB-C support on SC8280XP
User-Agent: K-9 Mail for Android
Message-ID: <B2F16AC9-19D3-49D5-8A85-A6E5071638B1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

I'm exploring Linux kernel support for SC8280XP-based devices=2E I came ac=
ross the DTS patch for the Ntmer TW220 and noticed the use of pmic-glink an=
d how USB-C ports are handled via connector nodes=2E

As I'm new to this, could someone clarify what exactly pmic-glink does in =
this context and how it interacts with the USB role switching?

Thanks in advance=2E

Best regards, =20
Abhigyan Ghosh
aghosh

