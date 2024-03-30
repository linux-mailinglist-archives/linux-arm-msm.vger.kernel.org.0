Return-Path: <linux-arm-msm+bounces-15808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1D3892968
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 05:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA6D8283109
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 04:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44C479C3;
	Sat, 30 Mar 2024 04:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n4jRuRhl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9EB1C0DEE
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 04:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711774128; cv=none; b=q81fnR5rGCmRNSEgxJy97kUP9uX3Zvpem/PASi6zHQrODkh4ArIHghWkvGJZBA0Ga4/NQrg4CDIBZK5a3Q0+8HrCBbXzWKQtrUAsW2/R+QHqKahXePEpUZgj7g0focfHBdTfsW0gmVGLqY0bhQkF3C0ji5F7ydjO51wpppzdrbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711774128; c=relaxed/simple;
	bh=o+nKkZe94VWx8t6q3SdvuRVkmQRBhP7zPZY3k1IAtk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVRk8cB8mLtizgovFrcV0GJabNPmfF/+wICwHQo1SmJCS5c2Zl/QHTLGNxas6pheUstftcrRF2hx/B6C4XVcdM47bqnhG/ICsAa9uEl40KyVFwk/kvTKcIU4H/5PdeEMlPQfeHTGmxq2ysYlTgSb8oTTRzlPuThMvJXauPHPuH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n4jRuRhl; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-ddaad2aeab1so2157585276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 21:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711774126; x=1712378926; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JqKtRTcCfUHDOcX0tKilt4xKnfEps6Hgq5SW6oavRVg=;
        b=n4jRuRhlhbzlg0jnOUyUtpQJkaBYJcBHxJICscOFXlB4D3gDdtgunZB1JsSdj1xeZO
         gbz/nBHhqhAXZzfEIHWADkro/x9kl1FXqqimgF4JNSkyTeif4pwUNfYdFNv7QytwI1As
         H4/n3MzHXfSgln5vbNwg9+zIZ+F/3yAbvxQEJdRVsTlG1mkU1hp3jSkKAfCK0mKE5yBB
         3cqRXCE/+BsaYGYAnoiqzmtSzhVSLCAnuLIzrRHmZwLC3xmCUlFSHChOyOn62m4jOr7+
         AnJMoYFHFTfjTxU1yn3JvkzTVCdtgRq776WsQV5Lxj8RVsS9OyWAgHKBHoxa1NmlotvI
         UGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711774126; x=1712378926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqKtRTcCfUHDOcX0tKilt4xKnfEps6Hgq5SW6oavRVg=;
        b=u+ZrwZ5I816kw68PbX1JFQTYCjocSKozoc0fdnv0cVu1Ye2mW9GvWbI6FQ83ptN6Lu
         FAHypYykldPNBKuNmcMQynCc3pNXxNadV+V2rMgFlaMkohjU9HNWoqJcKQyyQE+VLVwE
         wJWHX18QU3fN1N5HigqWkVMqnoQq/Znv4YLNfVxQ6tVHwsM8aV7pgBmTZMX9n2hAUNCK
         AMj6CMzyA7h7QBF3Mftl4opkcZJQrJX0fqS8KMzGqCnH6UsKU8VMKVgL+6vMhJvUfaO6
         gwfKFuAV2oInxcPmj3CdR3XV0QsDpoqakjXWR/W1JNdQSYAW0aMvM4hdgra8KqIUZGCo
         od7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEafaSS5anXsrO3H8UtqJ+BFRbHpQLs/7QAKi3agQuPtfO5eNhQgfWHuy4lCq2m+aNzUD+W8M2tBhV/WXb7jimby3tkrLPyZBXYagpqw==
X-Gm-Message-State: AOJu0Yxbey2twG25Aab47iQil0wMA3EMlud4RUg9fgzXQZJK+kf6J6LZ
	1wc7OPZrMlHNiRZYdaiPdaE1DJPIInARHiW+Yhqc/0CiqffcdmqATTkGUuf/F4kB1EqiYa8J9Fs
	RQqEQLV37BKVFJuJJfGeDZHSThlaUAz16c16GV9MqgSs/482xMYY=
X-Google-Smtp-Source: AGHT+IFWNUW2zHPnWC7CSZVJWYNfuXeyZlox9i9KNp7LapLl16BvX4i/tRfOuabu6Hn2towKb2gtcAyZRB8/FIQKbH4=
X-Received: by 2002:a25:bec1:0:b0:dcf:56c1:5a12 with SMTP id
 k1-20020a25bec1000000b00dcf56c15a12mr3656604ybm.38.1711774126160; Fri, 29 Mar
 2024 21:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
In-Reply-To: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 06:48:35 +0200
Message-ID: <CAA8EJprsjs8SWZmpTisyQcAZ9VC8g3_GEEc1hhp8bMZrm-hyaw@mail.gmail.com>
Subject: Re: [PATCH 0/3] wifi: ath10k: fix board file loading for wcn3990 devices
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jan 2024 at 08:47, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The ath10k driver fails to properly handle fallback from board-2.bin to
> board.bin for WCN3990 cards. This happens because the
> ath10k_hw_params_list doesn't include .fw.board* parameters for the
> WCN3990 platform.
>
> Add board data configuration for WCN3990. While we are at it, merge
> common pieces of BDF support: drop .board and .eboard names from struct
> ath10k_hw_params_fw and use the common name instead.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (3):
>       wifi: ath10k: populate board data for WCN3990
>       wifi: ath10k: drop chip-specific board data file name
>       wifi: ath10k: drop fw.eboard file name
>
>  drivers/net/wireless/ath/ath10k/core.c      | 32 ++++-------------------------
>  drivers/net/wireless/ath/ath10k/hw.h        | 14 ++-----------
>  drivers/net/wireless/ath/ath10k/pci.c       | 10 ++++-----
>  drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
>  4 files changed, 14 insertions(+), 45 deletions(-)
> ---
> base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
> change-id: 20240129-wcn3990-board-fw-a2d97507a712

Kalle, Jeff, is there anything pending on me on this series?

-- 
With best wishes
Dmitry

