Return-Path: <linux-arm-msm+bounces-47472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60927A2F6EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 19:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46E5E3A7346
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 18:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C2D255E5D;
	Mon, 10 Feb 2025 18:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci/61Q4M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77EC255E24;
	Mon, 10 Feb 2025 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211879; cv=none; b=ds2Us2K0ZkQr3tr14E3sMMtLDO57m2OfwvpfqgsJqzp9jMY8nBHNnz2QMJHXTzDA66IxOI6OP+PLnuLEHJd3wABNJQRHWhy1Mvr7n4+Lqz9fcRwfFkTfycy4vUY6AzHiuC55FxEdEEL5o4PyO/He3P3ukJJn0oV7xiOCokQxalE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211879; c=relaxed/simple;
	bh=CduHlKtkKWRoHzBFAVgq6ZPakOhX4xBA/Ald9NSrFKo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DCvR8VPbfRJ2o1pI7OSN2LlG45wQt/tAC+rivqDvGnFgxgHHZCGr9xxJm2uBl/EZK3PCZrB1Z/Gac6Dv8v0B2xp+tRa5Ykvo7OimUsVF1gBoDWOK40BjCIOAWXec653isY0KmzRWVc+AMNEQlOPQgrIgDpS476cC3QubjCapl+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ci/61Q4M; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43675b1155bso52599935e9.2;
        Mon, 10 Feb 2025 10:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739211876; x=1739816676; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CduHlKtkKWRoHzBFAVgq6ZPakOhX4xBA/Ald9NSrFKo=;
        b=ci/61Q4Mxe9dKiz/1UcdJlTIvnG15SRala5U2MoDl/IL3mmT91+1n6cmvcOKOoCC4d
         nz9xmxw4kmz6cBPRR4xZ/jTi3960R0XJZ6UFNT8N0YalcII8OfCfFJwjsXSaFRtoo+KU
         T1fBtuY2blCsiEC3G7KGGlXI+lG7G+1OpXDPOuuyexL9JazYVzZ2nlMw88oGPoMHYR1k
         NqF/C8rrunkMrdEtOzk05y1J0yGAIHhCpmR0Fd8gvyAR83lTlxWlJXo3Ql85MXAZ2FKH
         lWw2ayGb98uhC9tDf8AJhdNqUrt7Q1oinBVf/ss28o80iECU9XvbUyfMJbhFge/o5v0l
         wwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211876; x=1739816676;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CduHlKtkKWRoHzBFAVgq6ZPakOhX4xBA/Ald9NSrFKo=;
        b=VgipuxfchWSJt3XmVXRoc8LbUA6ntJdRWZguJX2Twr8GBPjyAXTTWSBhY0RqgQoqTl
         KLMxzQ4HhxO7eZ91C7VQV2uIr4oNpvm0RfZp6JXhCxuqVB4O+b78Nm9O8ejfpI5KpXKt
         IHDjYbRhIpiVEuJUWQLG2DHvoBenhMNWwwDKYRAU6EJgaXvnLYM6QVB1qQEbGbwARJsW
         62vbCcUgC6vkpaRmBaD5vJj5zhuWMylwIf4IKXsA3BcNJVKq5omL3MCS4Gt0anEOSwUG
         +WPAutpHVxZI4Damit3BiA79zJwgBGEjEDU+qPt43Rk2qEaqoPRwQ58N6b+j3PfQlNEB
         7fag==
X-Forwarded-Encrypted: i=1; AJvYcCVLZbTaY15qFO/QPHMNzlpMST5VTYnzg3uS3cjfXQHf62FUNWJnWCZZ6fUTP0Mv+schkr4JKlyG6PGMRA==@vger.kernel.org, AJvYcCWzyZT3PxKUS39l9cKAzqQYiGWRvu0eIo99WR99cF/3+nnya7j642wuWmeWrNrkEoEtbc2CANbLMqGIg5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyzxCC9aV9PuuCrWzQy0L2ofidROpVc0Du2gCt/pYryvUjSUm3
	pVsH6S2hBcP/0N2/ZRJrKoki1ujvpHPKrAZLwRxs+7VYw6Gv8vMb
X-Gm-Gg: ASbGncsNRoHxDBf8JMIzgjFNUANhYejCINSju8NjpW7nYUO++XiMWaXC6/SPj4GDR74
	QSYpes1xLnxvPEVGDeoklHgWPeDs/2L223Kv4MfkxCDqB8dhDci+l4Wn/hPf7OidUpzPSycboqV
	Y9xNH5OemMmfS9fTJQYsrLaETWCEkHEsXpDbsTUMnIrdiw4wOfCRGaQY/t0yVFCeDs7T1ZIF66L
	0BAfJuoFxxQIHZh/VCnNNMMLoAEUBholEbKE34D8fqJ8lId0BPe0KmiubroSfqOFAAnDAombFg4
	JWzAR+jNr/pbY4qtTA==
X-Google-Smtp-Source: AGHT+IHoumzg7YXv0ac0zsZWvDrbJ3pywJL7PTJOFF4bKdAiBTm8oYejNV+86hGjmKQvysNp7L9niA==
X-Received: by 2002:a05:600c:3556:b0:434:f586:753c with SMTP id 5b1f17b1804b1-43924988001mr123738545e9.7.1739211875841;
        Mon, 10 Feb 2025 10:24:35 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm12115283f8f.6.2025.02.10.10.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:24:35 -0800 (PST)
Message-ID: <619be8d99c88c9519634a3b116e71b22d2e25fd8.camel@gmail.com>
Subject: Re: [PATCH v4 8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs
 attributes
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Keoseong Park
	 <keosung.park@samsung.com>, open list <linux-kernel@vger.kernel.org>
Date: Mon, 10 Feb 2025 19:24:33 +0100
In-Reply-To: <20250210100212.855127-9-quic_ziqichen@quicinc.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
	 <20250210100212.855127-9-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-10 at 18:02 +0800, Ziqi Chen wrote:
> Add UFS driver sysfs attributes clkscale_enable, clkgate_enable and
> clkgate_delay_ms to this doucment.

"doucment" =E2=86=92 "document"

>=20
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>


Reviewed-by: Bean Huo <beanhuo@micron.com>


