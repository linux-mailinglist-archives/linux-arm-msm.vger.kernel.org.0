Return-Path: <linux-arm-msm+bounces-22058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E4090029B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 911F228BC69
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7938D18F2C6;
	Fri,  7 Jun 2024 11:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIfOgY4O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0853187358
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717761034; cv=none; b=eZ+4n7QLmiaInubRO9mouOydaaTIpvktf5iJofRVV/OLMNmDbeBh82XqIgTXsdeUk/9nbdFHWHgeGESlNePY0gkZux7JXnuf9OCOc5aDUTNl4tI7MbE3x009C9tOiuJcwfJ2LF2LlcTM2hvpnox0TE6PZ/kDntVMbYKkWjkDQy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717761034; c=relaxed/simple;
	bh=wwGWvexxsp5XY5L70dQnxGHTPS4bWU8DrXd4gNmOcAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVjbiQ5U7bNSFe82eS1iR0HFYtQgexk4dF0d6ek5gIGpMB5p+zJa6+KFdJMLYBkB9I5SDWBTduWSbtUBIpFd65yelDrrRuM1xBzfUyijjnR4cmW2KlyVExRrzYtVbvlPJdFd+6nB+CDrQqZsyoG9PHpjAa9AD0D5bzXKenyNlHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIfOgY4O; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52bc274f438so278094e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 04:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717761031; x=1718365831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G8YSZ1xf3JS020wtDYuRSc4/MIriNLZ3fkqQQXeB5h0=;
        b=UIfOgY4OwsUBgYVsw0Cpe7LtJy9xXiLoTy9ULEH1KtPYaIsj1KSp2uJhimHGhLV98E
         PLRjZS1/oP9nQDvFLSkJj4oGvgtaIj6/t6QmWnU1he7xnf9KFLm79o5Gv2jY+eBYIAfW
         inVEcWoSdGurppGEvVD/4p8S5UUI6ixJbHXNfZCHoWBFSii6mUG7/SNwk8/BYS4vGtQL
         1bcThBCbo+tXFLkxIxTLaPOm6nkEhd8zO4uJOHGrn8OGJo05rUvMZCfzZrGhHoVlJhZN
         b0FkhbB1DwGdPYweIrgg7UBTJSGFj9+lqAYbBJ4vsfK9uDamd6UgXr37WhfUctjgxVDV
         lxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717761031; x=1718365831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8YSZ1xf3JS020wtDYuRSc4/MIriNLZ3fkqQQXeB5h0=;
        b=F1187yJjeVlrsuwi70ch22rxkofNaE+LJPKOB715C2juURl9ABDwUXhN+acnwQpubf
         bMNkxutqkFWbkxWhcGkshpLIOKr8JfbeyEs7Oy//+xfTWWXcp/uLabduTJASS1WDDGze
         rAHbmGiMrPfcI/duZc62q1HCgYDb5UXNwmlpiDIhI9Ka+kfZjo3uwBpfYdkkk7zd/8MD
         9txGlWc0Wuk31vkrN2W5CxTc5j9RqXZoQ9IkXnyobixLlQHu3wrjyPullkvPrKhXmOTY
         QadEhSpFW6TnLnUFt60N1u4wQ+gj9VABa2pQi0I98pn/spBZuLuxCd/UxPTQwOfp2X+j
         dEOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTxj3COTgrzjYaig4qAjkMUrDMigydo2SA8wn8RXy6rkrNyeau8bGwE/lo7sKG4NzkdqjVC/OB3g/hz/l14KxC7fGuav2BKUJtwqPHZg==
X-Gm-Message-State: AOJu0YwyISgC6aGfcTRSiM5275ErwtDqDhsK+PS1hPBiJ6/E6MjwRR0e
	JbY2yjpyAAxlHtWGrm+OX14lBtkxsj2wLPrIvfDcg2l8nJ67ZSeGBrcH36UmnJQ=
X-Google-Smtp-Source: AGHT+IH1fnzWJzSRWiOc9TKw1sMxf6+hh+r01uOIlWbPCeTM2eFUdTm3MFGz4e2qPlT0qozxajJK/g==
X-Received: by 2002:a05:6512:3e07:b0:52b:8435:8f22 with SMTP id 2adb3069b0e04-52bb9f84ca9mr1871221e87.36.1717761031014;
        Fri, 07 Jun 2024 04:50:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb433c4fdsm505724e87.264.2024.06.07.04.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:50:30 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:50:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v4 00/11] Add missing features to FastRPC driver
Message-ID: <fc3q4tp6sbmwgfpvi3eqavxnw74mc7czhf473dkbkvl2nzf4qe@i2lrfulyfaz4>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606165939.12950-1-quic_ekangupt@quicinc.com>

On Thu, Jun 06, 2024 at 10:29:20PM +0530, Ekansh Gupta wrote:
> This patch series adds the listed features that have been missing
> in upstream fastRPC driver.
> - Add missing bug fixes.
> - Add static PD restart support for audio and sensors PD using
>   PDR framework.
> - Redesign and improve remote heap management.
> - Add fixes for unsigned PD. Unsigned PD can be enabled
>   using userspace API:
>   https://git.codelinaro.org/linaro/qcomlt/fastrpc/-/blob/master/src/fastrpc_apps_user.c?ref_type=heads#L1173
> 
> Changes in v2:
> - Added separate patch to add newlines in dev_err.
> - Added a bug fix in fastrpc capability function.
> - Added a new patch to save and restore interrupted context.
> - Fixed config dependency for PDR support.
> 
> Changes in v3:
> - Dropped interrupted context patch.
> - Splitted few of the bug fix patches.
> - Added Fixes tag wherever applicable.
> - Updated proper commit message for few of the patches.
> 
> Changes in v4:
> - Dropped untrusted process and system unsigned PD patches.
> - Updated proper commit message for few of the patches.
> - Splitted patches in more meaningful way.
> - Added helped functions for fastrpc_req_mmap.
> 

I'd suggest to land patches 1-4, they seem to be fine.

The rest of the series needs more rework. Please start by reordering the
patches, so that fixes come first. Think about the people who will
backport them to earlier kernels.

-- 
With best wishes
Dmitry

