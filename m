Return-Path: <linux-arm-msm+bounces-88152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC471D069DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 01:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA6393010E5C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 00:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC4515A85A;
	Fri,  9 Jan 2026 00:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HsGcwS2P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05D7137923
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 00:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767918828; cv=none; b=eHFCABqy6pMPRaP5IAOzAOSsvCJi8DOarPUpP0UIEh0EOSOrVji0cyEnankWV9oaQxJdRK/mBvfB1SPW37176lM5Ld780ARy6xard0kXEk+NLY+am/rJLx1QpgduuC0hHCp5Wh6BjmhP6IXPjvzGJ4tqAuCZDuXT8PWCT5owZg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767918828; c=relaxed/simple;
	bh=/gl2lZSe7ypjXmyoEqrEc6u2WgAVx0lEoV6nBANnfFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ln5QEIlOiuntBUFTSuZ8sUT5vgLpWFmLTKTLOHfbHJzvQoKxTN5vqir/sBSWtxVCfq9jxlWbHUfwk2yxZ0KtwtDQgeF0xXKfVEeSdQPQF7eR2ANAqj8NJDdlysRyqMLkOU3nWt08jn0G+MpmBcPRRsyFrFzyW5ANsSU6v9wJzDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HsGcwS2P; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b1981ca515so660668eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 16:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767918826; x=1768523626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z79lWPAhPdzNz3dRg0r1dF0+n1ZwotnKFbAQUgcD10Q=;
        b=HsGcwS2PTV3SxUZ6eOw57uoFiG/1kObDcQ/7Xz0thegQKkJVwVdXFK366fpc3fg+Yv
         XCzffbG1ZjDBoHQA734efVbgsQ+u+rgOUiSRK7FsqtYmqGVtLjOs+n/WY6xHxARfK+YO
         Zxl/pInySLkFNrJmH/TeHNaFr4vE7kACWlEyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767918826; x=1768523626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z79lWPAhPdzNz3dRg0r1dF0+n1ZwotnKFbAQUgcD10Q=;
        b=Dao67Jw7SrOu1S2valk69QKTHPYsvQKAMpzE61s9txPLRstTbAfU0fDYFMowrg06Jj
         QXW4iqt20A4wZt9wF8Nc59UZMr2CqvtLQzEftY9jzclehSzAqTy1aeA0LGDHWzdpq6/K
         6GEY+/Pu0Mwm5C+7ZnwmAsr3UC8/yPFcoRY1cTa+wdnWUN6NbYPJgvo06MNy/Nhi3vLE
         tX1r7iQBAlJdew6ecQvvXHO9gVWjYKdNhlmI9k6vcNEPThLobJceoB7xuZJLlxG01mgI
         QTmRE8K9Pn+k3mQ/qdxtW6oZN0dPYD0ltVZLsXH8FVdnLR2glf/b8okF14KFShXKyg/T
         iFtA==
X-Forwarded-Encrypted: i=1; AJvYcCXxaahmushzfd3al/8DUr8TpnnL4ef2QDgFgfi7bcuF53IZKELDuXeyuua/M4rt/zpwI5ygePeyzlgvjTtj@vger.kernel.org
X-Gm-Message-State: AOJu0YzPNlt9U8ECi556K1v8HsRjAjuZGkVYSkSpqrqg3bV8Yc9s+DDD
	RXQIHF5ALVY9ukNlGyWDfgCbzoKLNBXpxvOXJJAqxyLa7SGU+UBaMmiLoGCxOgLWWw==
X-Gm-Gg: AY/fxX6G1Him8Q1AXnLHs9xJWktmMqvysAvaOHcjgaVQ9JL88tqDST1yBzbms18U1wK
	W/B1iLlZZoeCJR+TT4qrzIUxuLFlUDcvyyNGUsTHKtsFBlrxndHlieDPhzfXKO3ID+19APYvja3
	hQA5dRYSVN+dm3/h13QccH17wU+FaY7HsPC8myniMD3IfIpR1/H7N4wFRww0XMltLM9/RcBPHR9
	zEccMtMFjireNiDi0LUZVIkOvEpUwQrcg3JMWx5pQS/GE8o6pqr6rbqxR1jSayshOM3lqYuz86D
	hWtqkraPdPrqiUOnHLbaIIv+DxCCPaGYn100ua5ICbHGidiP0VWuONwEfxk8t0KTLeM571IAnXx
	wG+h4T4c4LIgULoZYXNIIdPLr+tMJr5Vb/0f8tJ0eo0QvJhWSS724CzN6Bzq6Fq7ZA1cpvH0nHg
	+pv2WaK/P3Xpclp6SigN5DIyK0bvzZIV9viRfbJzDmdUOw2Bt7Wg==
X-Google-Smtp-Source: AGHT+IF0GmKcOoUP4ftvhW3kQAeoOckhmMDqJsWDCkME/L9mDzTJ1nOrUp/GX1I2zgQEbCs11ZaBzg==
X-Received: by 2002:a05:7300:8622:b0:2ae:5b71:d226 with SMTP id 5a478bee46e88-2b17d1fa677mr7301825eec.3.1767918825949;
        Thu, 08 Jan 2026 16:33:45 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d9f4:70dd:b942:60f7])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2b1707d57aasm9377588eec.30.2026.01.08.16.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 16:33:45 -0800 (PST)
Date: Thu, 8 Jan 2026 16:33:43 -0800
From: Brian Norris <briannorris@chromium.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Odelu Kukatla <quic_okukatla@quicinc.com>,
	cros-qcom-dts-watchers@chromium.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7280: Drop aggre{1,2}_noc QOS
 clocks on Herobrine
Message-ID: <aWBM5zl1kgvCZdnV@google.com>
References: <20250825155557.v2.1.I018984907c1e6322cf4710bd1ce805580ed33261@changeid>
 <20250825155557.v2.2.Idebf1d8bd8ff507462fef9dc1ff47e84c01e9b60@changeid>
 <90b13660-1844-4701-8e63-7fde2f093db0@oss.qualcomm.com>
 <aMMcNn82AmSavJYf@google.com>
 <b51e1230-d366-4d0f-adc8-fac01b5de655@oss.qualcomm.com>
 <aMR2diG8zwvPRSXR@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMR2diG8zwvPRSXR@google.com>

Hi Konrad,

On Fri, Sep 12, 2025 at 12:37:29PM -0700, Brian Norris wrote:
> On Fri, Sep 12, 2025 at 03:10:16PM +0200, Konrad Dybcio wrote:
> > As I attempt to find a board that would boot with your sw stack,
> > could I ask you to check if commenting any of the three writes in
> > 
> > drivers/interconnect/qcom/icc-rpmh.c : qcom_icc_set_qos()
> > 
> > specifically causes the crash?
> > 
> > FWIW they're supposed to be independent so you don't have to test
> > all possible combinations
> 
> It seems as if any one of them will cause the crash. I had to comment
> out all 3 to avoid crashing.

I'm curious if you had any follow-up here. Are you still looking for an
alternative to this patch?

Brian

