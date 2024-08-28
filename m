Return-Path: <linux-arm-msm+bounces-29819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F62963039
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 20:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3179428120D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 18:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3899B1AAE06;
	Wed, 28 Aug 2024 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQ6TKFLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C512A14EC47;
	Wed, 28 Aug 2024 18:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724870427; cv=none; b=Ov3lNg7W1hWN+kPTDAsYuzTbnsnefr6SSmbCGGaIfdB7b4H4pY9i26BpCno9ktz5uon+S/o4D7kvy0vBJVv68DTPwnaM80s973tEXOmLrdGYVGmgocK3oNi3ag10rIZu83g1bMtcc08AU2NFh6qhfV/1ndiatPQRow9xHD3Yvlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724870427; c=relaxed/simple;
	bh=0p4/r8/yzBwUZ+dwptQpesjoe0ome9DpiK7SlPrQpNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lMmGf8RprfuTR/RCBLQFf81TQnR94/hA8fX83xPimqDj6LYwB5fqYPTqdCn+rrG5ZIfbF8ARmfnqQcK7KtLUyLzhGJfETRWdld+m6dk8N7EP1kXvLe7yzFAJpEhTNM48sIeSYRIH0HHgzpG+Y59MlhMtxIn6BqwOAIPAPEzqp3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQ6TKFLR; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7143ae1b48fso4133870b3a.1;
        Wed, 28 Aug 2024 11:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724870425; x=1725475225; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/ZaVDyTwhjqU8Ji5DgGVdd9z0y2XgewwBZz8Absvl0=;
        b=NQ6TKFLRJBOzYzuUS7BGadPb0j+aAoApM3lNQd3pxU++UBFUp83g0OHC/cTcfTazbi
         akbC9RS+v8he7oL5i9gPlSLPlELRQ5K8LN0x3tZ9i/uXb2q6p7+JG+48eyefrZxglbTo
         sQtb1S/bUZzm8hcRORRLqGdj3yO1fxoVHtH2AhlQL5tHKxJZsUPKaZD50OFKPXU/XJoP
         psSs7Rr/EgFzzBcU/XML5SAWJlXY+dmu4MaYD36LzyYx1ZWOD0W0UuzmitQAaSrdFL++
         LZwkOmCfMefG5OrLDfd7vooPNfPvc41eQEAnxnC3sM+MWl5SLKy/cvm0vrrQT+wa/f/n
         9sCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724870425; x=1725475225;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b/ZaVDyTwhjqU8Ji5DgGVdd9z0y2XgewwBZz8Absvl0=;
        b=AECq0Os6SLfA8Gz5mlaNHNiHUmd39ObJdom3VhrPs2RAIo+FtjHhVA9h7NZZ17wnmS
         Urn715f5/3licCD8cyg1opS+bUC2h2L/R/Ls6hHY8HH5QxMMg1K6BkCPO3UqSTMqoA9p
         5xdNXwVLo5MEeNeryeqadL2FdbHaOIjDsWQb9E/Tn4xEDOFdJE7gnuBbJ7ulela5btY0
         byzb8qh7p14UFCOI2Y2TsQ4lV+6+ZG1w+Fs4HkfWqKGVHWYFvIMj36Dpql2nqJeDGsb7
         R+m17pY/UarC5YP6pUGAhz0FFm66UgEwH57hz7KdltKTDDL2x3ixCzM25biEgTxY2A1j
         27hQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0a2QnMzUcXefcCP9N5Az1eaKI3Qdrh2uQis0wqK2Acp6rAi1gQ0GS13fY+xMCCO6MyGWL30ARVNHHpNau@vger.kernel.org
X-Gm-Message-State: AOJu0YypqQiH9wz2S1ug0VIgYH91Z1Exl/m+M3HDMKCji9rhVnVnJ9c3
	zwN1YQrBGrm/tITDkmC6AVEtgAPOtdd0DtiXEquqT49c9114MONR6NDlAw==
X-Google-Smtp-Source: AGHT+IGu35YjbA8PyUlak5f93Cdpg9/Uyf7jVYgpD0Fu2M1v1Vyy6AnB4F7MGWjP290I59R2dCleng==
X-Received: by 2002:a05:6a20:2d14:b0:1c4:c879:b770 with SMTP id adf61e73a8af0-1cce101502dmr250972637.23.1724870424667;
        Wed, 28 Aug 2024 11:40:24 -0700 (PDT)
Received: from eaf ([2800:40:39:2b6:f705:4703:24a7:564])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143433046csm10469664b3a.191.2024.08.28.11.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 11:40:24 -0700 (PDT)
Date: Wed, 28 Aug 2024 15:40:19 -0300
From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
To: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-msm@vger.kernel.org
Cc: Om Prakash Singh <quic_omprsing@quicinc.com>
Subject: qcom-rng is broken for acpi
Message-ID: <20240828184019.GA21181@eaf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, I have a bug to report.

I'm getting a null pointer dereference inside qcom_rng_probe() when this
driver gets loaded. The problem comes from here:

  rng->of_data = (struct qcom_rng_of_data *)of_device_get_match_data(&pdev->dev);

because of_device_get_match_data() will just return null for acpi. It seems
that acpi was left behind by the changes in commit f29cd5bb64c2 ("crypto:
qcom-rng - Add hw_random interface support").

Thanks in advance, let me know if you need anything else.
Ernesto

