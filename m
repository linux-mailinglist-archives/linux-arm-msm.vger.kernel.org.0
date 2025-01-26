Return-Path: <linux-arm-msm+bounces-46172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D01A1CEF5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 23:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 755BB1884FD4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 22:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDB7469D;
	Sun, 26 Jan 2025 22:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZ0aiknH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BD05684;
	Sun, 26 Jan 2025 22:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737928834; cv=none; b=u+uTekt4o7Cq1duF6VmrNBl0Cz1rh0u1L0jMEvPD1MJzuEvE8LuSAL0JDKbgO0v+IeyQlM1N4o+aycPZbEr5a8JbO865DZiZUy9vMLHA2akW5K05OUFvHlkaRyquDqgU35vwKEm7QOlWWzOvM6ym9b1Dbb/679q+J+qXH/vGjoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737928834; c=relaxed/simple;
	bh=4DdbTStKVkTb7WFrUrJoNlbv7lkdF9Cm9SPJk5oqJFw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hu3Sdx++XzJ9b/amtySmY6oMwMr5wkQFovVLH3IpNerklgYyyRXOVsvz34m8zVexZxHrj99CU0txE4i5tEwSjI7D4wIXPDWjXO07/XRlxagWKBtOaN7hZd1Wly+zGnqW9HvUWvOSoRcRpo7ImRRntZxiYbfhoHenFftJzAQHxNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZ0aiknH; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3863703258fso3023457f8f.1;
        Sun, 26 Jan 2025 14:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737928831; x=1738533631; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4DdbTStKVkTb7WFrUrJoNlbv7lkdF9Cm9SPJk5oqJFw=;
        b=TZ0aiknH8vc531izZlOS8WibXHPKNIcCWNvZSMiYXAXvHyJ031jtOKJ+1q6DqE4MHF
         QbxsJYaR+64Gwx+tBkxeGZmf5v85/DaMMyv0hA475WxfebxxcENYkEu8ou7EmS/Rp1+y
         HFuhV3A6Rmra9w1RuZKs+ZI0IV3nLCKSbjZV+pQbdVDSaKIxlst2hjDSDE/7Djxz3PKp
         vwqOIZBILN3tm0afn0wg/B2ZjalP6JOHHopX1mShsrXopVzJOp86WLWwML5c/oyLZGdu
         9Qa5F7PnJrYWp+Zk24JO5LkpxiLUYS9hwMwPg/Z3wUsZFpcJm0a4vTRX6dFxBWbHM1aG
         SrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737928831; x=1738533631;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4DdbTStKVkTb7WFrUrJoNlbv7lkdF9Cm9SPJk5oqJFw=;
        b=tf2GbDRotRwXJgB4lQaULAViZlm9COIah8qaDR+EeFw4rfIi5kMkvBaXIRfKr0QA0m
         sHwj3d7+Lu0wfUlLwQaMMl/WZhywsIsb/5jfOLBB5YoDVFQ4PhBnDWCUDc8EMDYqWe4/
         Vd+2kuGji2SEbOByJsyamTPQIjoExvY2MwIqEA/xikGjKtAa3T+R8IbI5ndjphpDX1iG
         8k3rzTE/3fXwudZIQaqAON55oLANm+3g6zKV73c/xHk6VQ/vCy3kYJTq3oJxdzhpF/h6
         Pye6UB4hMd0XiqVQ4cAS9ZDv6dH+m4ftcnaXnbX2UpXw8JDs96ENP89Xi+/YwMQQ0Iq0
         WOzA==
X-Forwarded-Encrypted: i=1; AJvYcCU2A+ns00IecNB2FwippvLBHmerjWUe2tyZk5nSc1QSv3V72mylXJNdlWBFm6oLxLsS+cBDf3MTj6tLxKVewSuHsVU=@vger.kernel.org, AJvYcCUj5UuAbBY35QWPCVabRyr/aBEzgqgL4cs1ZE0rfjRj39JVpkRNGXzsU1sryPgV3K61KgFIFH4YW72/ObM/@vger.kernel.org, AJvYcCVfVtJ77jpDXB97tjKnK1XIM/qOG6jquAiCpbu7qZ8aB8+GMEMz+BejciDW3yDLr59VsVz2WXbPW/jWpQ==@vger.kernel.org, AJvYcCW9niv/imvUY6PY4usn+Ll1ziPKfAgtzGIrWA+W82QXyLkS/dWne02tB8a+QRVnco6PVoPl+sJXcWtjmf8p@vger.kernel.org, AJvYcCX1CeTMJyWoVg0uvs/XUOyL2LWHj9EANU8wRn5gGlP0pprycrGB5ZE0LjFStbJ2G4IIMNKeMklm@vger.kernel.org
X-Gm-Message-State: AOJu0YyCax6s1OepPDjFSrrFjz3WzPbnelracm+BSFysFqAcXbpVs5Cd
	I2UygH2jpCbrIhKqpXha6GXjrLlLjlkrBjFuZkDTjcj07TtJSv23
X-Gm-Gg: ASbGncsqZkIJ47Tr+h8bxqOFwyDJITUfdUwAli1fPFat3Tr5WYv2a6Qzw2/MmZgHQog
	KCTn0iGu1mRhRwLEiwGyEXjN75/9ZeSHy2kdA9vQ7WlZ9FewqjztsMotE1pgZY20vNe/0q/ik4K
	EqYZMItpCRb+GHoQyj3/h04okgMEneZvJEzrVzjk6b3e0gmu6FGnX8H0oXiAXrbAFM/ikQwpqqK
	+2ixO8Smt1r0iPb3ExIHXH3ZRVo/KliDRDIixlzJCnMGGJ1RE8XUiauO4dvspRFKyKCbtN1DEFf
	YBXvRicxT8V81U64pDX7CrCArh9dgFqzEGCioswn/sjUdG5X1Hdbb6GKw0MEgXhfc2f1N7JRYHI
	6f6i8/TJKLFWRprQdrC/Gky/aZZs/ZCubThVlTcmE3F++
X-Google-Smtp-Source: AGHT+IGsZIr2STvVAqncSIrcbBNbIGfPo1HDsn0GMZTH13nRBH3HPa/wKJc6AIwOxi8bTdK3IydwYQ==
X-Received: by 2002:a05:6000:401f:b0:38a:8b34:76b0 with SMTP id ffacd0b85a97d-38c2b7d12a7mr8375865f8f.27.1737928831040;
        Sun, 26 Jan 2025 14:00:31 -0800 (PST)
Received: from p200300c5871e95f7cf8ec2b454ca4b5c.dip0.t-ipconnect.de (p200300c5871e95f7cf8ec2b454ca4b5c.dip0.t-ipconnect.de. [2003:c5:871e:95f7:cf8e:c2b4:54ca:4b5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1baf3esm9290068f8f.75.2025.01.26.14.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 14:00:29 -0800 (PST)
Message-ID: <76ddd6b18a35a19d284496345e41f5a22866f171.camel@gmail.com>
Subject: Re: [PATCH v4] scsi: ufs: fix use-after free in init error and
 remove paths
From: Bean Huo <huobean@gmail.com>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Bart Van
 Assche <bvanassche@acm.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Mike Snitzer <snitzer@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,  Satya
 Tangirala <satyat@google.com>, Eric Biggers <ebiggers@google.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, kernel-team@android.com,
 linux-scsi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  stable@vger.kernel.org
Date: Sun, 26 Jan 2025 23:00:28 +0100
In-Reply-To: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
References: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-01-24 at 15:09 +0000, Andr=C3=A9 Draszik wrote:
> Fixes: cb77cb5abe1f ("blk-crypto: rename blk_keyslot_manager to
> blk_crypto_profile")
> Fixes: d76d9d7d1009 ("scsi: ufs: use devm_blk_ksm_init()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Bean Huo <beanhuo@micron.com>

