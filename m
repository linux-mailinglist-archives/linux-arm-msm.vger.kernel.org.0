Return-Path: <linux-arm-msm+bounces-47961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF757A353AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 02:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A5077A44BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 01:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44EF24B26;
	Fri, 14 Feb 2025 01:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxKqnOdy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FD13BBC9;
	Fri, 14 Feb 2025 01:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739496397; cv=none; b=CR0kqteyU2ke8CseFBk/qf6jqiV4eVmq+hUcAXSLUp1GWUBMmHtYUbfPk2ZffB98Auwjm7E+h0s/lYq1ONfAzNqAHHK1ryx4KH9QohjYHBgpELvrYM2VxTkD3I6GEQAPi9Q+7BggQE5X/TDv/QFuQFGF4/JYvri0T+stIxeSNUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739496397; c=relaxed/simple;
	bh=G8hTgtv6xtDpJIkrBRZ4qjU+rHdUlOoYA5e5Wg78bgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gpP6MLPsYQIwPTGSAvZ9w63K5hkm4UzBFCKpiAvnt5xgvHlQHoNgL51P+tux0S6Mz6xuRbDwxdbnUau02FOWYxShq7r1PP8gpvRFmQsI3RD+pUe/lShRWlGNZVJz2gmX7m0RkOrsmkWUCbiqoHbPTe5ThA+kET/Emnj1Qv4A56s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxKqnOdy; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c07441f14cso139222785a.0;
        Thu, 13 Feb 2025 17:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739496395; x=1740101195; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G8hTgtv6xtDpJIkrBRZ4qjU+rHdUlOoYA5e5Wg78bgQ=;
        b=mxKqnOdygdA+2R/t3a+ewxlwkTZLodJBtjrKQo5OjLQP7FlUEVbcJj6X95p0IUFE5z
         j7wS3+2rNc59LIJv1/XFQuXLXpJtfcip4fE1sbo5Jx9EvQGdiDq/FyY517AQ8V9nqimC
         Kvy5UoQ1CEF8xcbWyhmmPJ3sPFD0Tau4rK7LI5EO9XTn9MBg9n0DS9Q/jRK9xW63PmdG
         x9H+odMji2ipzziVRW3F5NoKxVXZ0Mw4JJlBPtMHG1wKrsdFeQTeq3PenJn4PGmYbovU
         0MK45xg8beMefV15Ot7kHTmw8YCohPRlw9RiWgv7CzSvZhm6qBRLOYygW+4mDyJR5Omp
         Pocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739496395; x=1740101195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8hTgtv6xtDpJIkrBRZ4qjU+rHdUlOoYA5e5Wg78bgQ=;
        b=b9dBvhgFWt/WtAIb5mOyoAiCpVa/gRFs+lCYYjS4XDYhKuq1AOifaBMA1rfVjOJVBy
         dvlS1VqbZRzNNRR1a0B8CAqqgvQgLC4TLifMylQ1owEvdfFJ8XSk5ze5SFfRitl6yeEX
         YiCAdTePzypo6kJZDIU9StMMdb+dEgKX0uDsThlWZpDNgTtcAIW5t9hbmiyJ5kazncFn
         I2tbbSPVzFIoUaxGbYIlXEBn9xeVGcW+O4KzfewmFoCWeeu85JqYbytfRKTLzqkm3H9Q
         b2xawty5VQqZVDTGlFus6imPMFUB46qY6sI7zRwJatlm+6K1F+32OZw8o+J2CG9of3oc
         2c3w==
X-Forwarded-Encrypted: i=1; AJvYcCU9PjILJQFelCtzzBdVXMgcftgiaAlI6rQjswff29HkwdFH6FJtcGGiZzFpVjOGZ2GcqWsPvNgBXFcsU4NszQ==@vger.kernel.org, AJvYcCUqhpCRBEG+wpWLTyaM2yRLAhuQHn7zeIc2MuLbKWjsM8kKMNw1RRmoUhH0gACSpPNlHFYhhO1EBn6zoB5L@vger.kernel.org, AJvYcCVZgOJypde8KsC5l27LKNNuNV3sICfuhpX6XYOWFn29Hn2UTfXLC42gHEgRv/AdUjKE3Je0t97oK/BV@vger.kernel.org
X-Gm-Message-State: AOJu0YxFM7HqrzCGIX5yuQVF5MoPsmtjXtURW6oRYOc209GwRCMQPZOf
	g346rSz0r6xmoWW2Ee+Bs+G5U5lMtkjhbIMBsjxxhWRMPogTV/YwYA20qVP8AjYankQLVo/NBe2
	vMvJaCLW1CoXVtd6LJeCVqMT6O6k=
X-Gm-Gg: ASbGncuwiGayFk41/yXa3zF3+S8dRd6dg9LrhScLKdaiBldSxjx0AtYblfsg8K9Kfy8
	zcf2XU8wg0cExb6YqxJv4kmrpbe8Ysq3IivkxeJx5yx76NPggdJmmyVCjpVeblfvRvAh+7Y2xYA
	C5JVHhWVSAKH+tbBN45lPpO6lkJ/SFJQ==
X-Google-Smtp-Source: AGHT+IEBVKcOBVhM8OlM6KvmDZ2LHJ4t7YKg+z62/NHldWlFPcMoO6e/4QFFOml970Glnp/tgfdZiTPGYt4nfcVJwuU=
X-Received: by 2002:a05:620a:390d:b0:7b8:5520:1888 with SMTP id
 af79cd13be357-7c07a201f4dmr850156285a.57.1739496395134; Thu, 13 Feb 2025
 17:26:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-expressatt-bam-v2-1-e6c01c5d8292@gmail.com>
 <e0ef29dd-afe4-4ad7-95db-d21326744c92@oss.qualcomm.com> <CABhZbsXo69FL-xUfg3a20RybO_uRmsOKyMJ2w3qnpk+8pYyUqw@mail.gmail.com>
 <e2b31450-c428-43c3-b25c-3ec130171011@oss.qualcomm.com>
In-Reply-To: <e2b31450-c428-43c3-b25c-3ec130171011@oss.qualcomm.com>
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Thu, 13 Feb 2025 17:25:58 -0800
X-Gm-Features: AWEUYZlDekcFh2N9hGoaQ0GH2wo-ndBEZF4n-0ZfGdmF0-s_s9ADbmWRBST7cW8
Message-ID: <CABhZbsVUY5n3bL-vbzO-xdDH6amC7FYmZHuRTh3Cb3OiQSa-3Q@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8960: Add BAM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sam Day <me@samcday.com>
Content-Type: text/plain; charset="UTF-8"

> Did you keep your changes that shortened the sd controllers address space?

No, I changed sdcc3, sdcc3bam, sdcc1, sdcc1bam from 0x2000 to 0x4000
(2nd param of reg) as you requested, however, I got a splat.

Please let me know if I did anything wrong. Thanks.

>
> Konrad

