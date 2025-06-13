Return-Path: <linux-arm-msm+bounces-61248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6C2AD9061
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0B493A359F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DD719CD0B;
	Fri, 13 Jun 2025 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RBIYBh0M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F53215199A
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826665; cv=none; b=UE3tgEhVCmbgrXECG3KbyyWaP8J3s0QY5L62frQ2RSCLhI18L+c1WYHk5j2ZVmVYHvG0lqCLAENyDhsVbrVa1VrVR8QHdbSDhct781cg0DaLnyO3G065OxC7hA5zaWkFYWEVidaypD5lvjc1Rdb3Ly0ff56vjhpLSUm1+gT71vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826665; c=relaxed/simple;
	bh=EiQOOWFkzzeyj6/G+hsyo5qE25sCt/13o6+DhimKiOg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EULLGdHGmeSsykF23670baNui5iC8yCzP+I0HihzqlC679AUj25ZqGnnu4KcglSJxPzBbPITuPg4yUYMv9KsAJAgJC5a7GDeE0VP5Uiuu3a5dt4pb2xKntnKkYNAM1WvmlN64W9poqZnO+mKPvgtxnCFyBuZfQgOnhx2PGyHT5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RBIYBh0M; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso18264095e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749826661; x=1750431461; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CnpYz9K0mT/m/oiAcVJkvrvCJiX+sS/URqYCr0+onU=;
        b=RBIYBh0MOVLTOxaPIPDGDrkDLNKEOqdscG4ac6OpZ87Wv25gexHv8lI90GPPI3UAnY
         pyQskyMkBuOAieR3TscHAHep3VxJOPlI+MbIgjZELmj5JgY8+hgOSRBsshR1BxikrkWa
         de479Jjz/+iM87fcOZkwA4UCiQlCYsem1ITzNVUEgob75AOP+ODa0ITT/0uRzjrI4M2T
         14Sc5OJjkXclvURQ3e93J9K42ecwUILEMU3d5y+/+JPB+tZYE6+pVPkD5546EcPkxffd
         LdusvH4iLCNbj4hqFG4wrBgME1aolK+cZsIAtA760YhTPWkyh7unJFdFRYDkVrVwPUb/
         YOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826661; x=1750431461;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1CnpYz9K0mT/m/oiAcVJkvrvCJiX+sS/URqYCr0+onU=;
        b=c3V920AbcLhQBCyVEClg0GDfBjCCBxWxk+DVuJSfrCGwsnKgVsGFYdkSpz4B+HyBWW
         2eKl/OpI/cZ6GuZ0a2rv+RkIL4885bnbS7CurRn2AppOVznkMAn6l2lrEyDGcOwawj8d
         BM/8ghXz2cmkNue05daR5h/s7raWeu0l2+2R3Boco2ykpprEs7QVnftNrvwFhqwmA1WJ
         cft5YOBWL37Z48zumoUNnnEjNVqD7QrVL6IckPdQbq6SjjUKhWqANucYbzPI49JxhNl0
         WND0dQ8w0SyybkXhGVVls7rWUDvApvvjNPXLJkxBoDQ4j2W9tlzVaQwnwglMON2jKSVP
         uNkg==
X-Forwarded-Encrypted: i=1; AJvYcCXab4ZjNZ6WbIK808IgXJZTYzUJV2Cii9orig0pXYjYT0cN4BFjFehHyNLE9h2xOENWu8s7zqoa0JUqTu09@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Yoe0trfuYeVWoKamqPnYnYcRKZ6IBSQ1kx82Fi5ACVRLxXNo
	r1zVYbS1sFhm7eqantLdBUjHRLzWsPU36RhtN+zSi6cdulIcH4RyJYaTodVxuMr8rNg=
X-Gm-Gg: ASbGnctmq+Bb8yyaIGgKR8NbghTFp1ePbBnDPNDaaP8tp+I1aWs+VioyuBPbclQ+SjI
	oS1VcC84mBvJ9qAnahBWOc4Oibt+kqQFXqyuH6TWj+cZuhzMwARmh80UtwWVcloyDb38rJRIEqi
	r4UXtwzddT1t2mOEBIYCrbRtQoN2adsionJcpwkhNFavU2cja7pqFrdYz4upHE/kSXihN/YoWaF
	eq7V0h6QhT+IaO4KLmx9VR93cgfIS/hkOEE2LP2lZDd7zeiY7W8VsYChzaXbc+8+g43QVoNQubw
	kZMq4FNLt8aZ5iSM/Ll0VWCkUCwgi0MLEb8DQnBvr3y5YZwcdE/3VaRysGPQCkFqQ46tymIssec
	fjPM=
X-Google-Smtp-Source: AGHT+IHGukDkZVswTcj0Lp6moWGFAwYliY4cT6cRYlRm6eZSgyLpxqv52EshO7PcMNoDb7jfDD7ZSg==
X-Received: by 2002:a05:600c:a301:b0:442:f12f:bd9f with SMTP id 5b1f17b1804b1-45334b2aaadmr25496635e9.27.1749826661479;
        Fri, 13 Jun 2025 07:57:41 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:c8e2:ba7d:a1c6:463f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453305a0d9dsm48887925e9.21.2025.06.13.07.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 15:57:40 +0100
Message-Id: <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
Cc: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Sean Paul"
 <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.0
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>

On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
> We want to WARN_ON() if info is NULL.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bin=
d")
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-

Apart from tag problem it is usually a good idea to add relevant people in
c/c. Especially when you fix the reported bug.

Best regards,
Alexey

