Return-Path: <linux-arm-msm+bounces-77931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFAABEE9AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 18:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E763AABA1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35012EBB81;
	Sun, 19 Oct 2025 16:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGjOPPP3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E71F5435
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760890568; cv=none; b=DVwYXfUNtuoPNWkWaFB39jUV2KgilzKj8a+Juqyl29ZDkJFPfIzLTIOEPTKDecJN9JuxnlWIoqAniwpnQsCaOV0i1t5IkCpiRzv5xbLRn9nU4m3k+rrbEC9Cwo5UD6TJTjYVaKfNS2jaPaxoucf3YiuOyKGLRDxk8rGUKZ06eZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760890568; c=relaxed/simple;
	bh=w65OdgmpV8I1cxj2sfq4rK12q9mD/l6u6jCluPLlwTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMFd+3HvYrpEYgQr1FdsdXXsZ7rL9rl5UfA6aP1h2KWT8CI+rJToFcDxwvquntesunmfJoOwKCkPsOjpaGyMSIMbh7PIx818jkGpwup9BedBfuJfgKc6ljk0BlEygTTtYnnCw3pelDpA5zk4zNJ+HOZjr22OdQBuDmKFGXqJQcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGjOPPP3; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63e0fa0571fso3313077d50.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 09:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760890566; x=1761495366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w65OdgmpV8I1cxj2sfq4rK12q9mD/l6u6jCluPLlwTY=;
        b=kGjOPPP3AV4B15oNWUCh7zjCvw1lMZxc8GWcUcYppse9Tmq0p9m5dEEqeOh4hDgt+6
         /U8YQXEAb+Oh4B3Iwycd2esArczN3zTEW8zGLdmFUdIiFHxQnfm6mFIk/rsnQaSRxm9V
         XyKIBb1EpGzuMX0m+VYww5SehqGqwf2L1zToNiBNNp0IMY+YJALiPgoSRjiXVsgiIRQ4
         5V+LdS1AupKh1LVlChSCR/RN+xxWQpiVAwfAnJ8LbaknNmuf0jGfp1sxSqTKpKzll3MI
         HQutE1Wcnaa2JEdO64lPH3Q/e4F3UMhL1wq0cou3TetKULGj0YaMuGNahwZJwTEmXHS/
         EyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760890566; x=1761495366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w65OdgmpV8I1cxj2sfq4rK12q9mD/l6u6jCluPLlwTY=;
        b=LeqzCZEXrB1zPRYH9qAEeOH5VGtOehjEaxzOlI1WOB4DFFCZJ7HncLXYZS/cjyM+YK
         nNLmpUFAK+GlSd+P55sajIpTNZMjgjTwnkY0kUEVKeUF0+pl/NqTIha3ORxUt84XLNRp
         a2EL6pN0sbmJRkt/XN4kTctmToS0ZuO1Jj3bKdMusbHVDHn9IEnq4y+vEA4YPUfS6kHo
         5FlYANtWcaoE/sS4TCUtbPu/6u7VOfXvo8Vs1yfD1mXjrR7T2jyJb3K/IVBDirmU4t9+
         A3VSg6JLfPZw+oE0DEpGpzoSsy3Urifdqhj8qK0sl2BxSOY5TPiHzMTpfijL8gxF1yjw
         qqdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlUKVtw6ojNKZi8cs3b/l1kCzTwywnBbPlzQJAVsHuzXygYocEhHjBWAHDYNOBiI/Iab4Idi1qJ0MKoUHo@vger.kernel.org
X-Gm-Message-State: AOJu0YxXFEVoo+7pty6UQWnBtWQQ1YyN1wfHkRw51reJFlu5c7wM4RzB
	plLRUyXstuAVjQUtay2cZiPv9rAnwdJrtlkPpcawCIiDP/k3Vdn346e+
X-Gm-Gg: ASbGnctj1zgfsjnKcmdqpAla29Mmxij6jB6AFiZ4fJGvlqv5qLJMS2pm+KH9h7VaWNR
	aH68SBAlorYU+bLffFPsRucGf8LjJ/pdpdUu9lxv5gv3SLZlP2QJv7Fraj+Kxk84/Y7hT1CaOZL
	rvXckAmjt5nzZBbkQ5pS/xXNy5kNYXc+Jxmj/zYa5LBuHaFHH2Fx19ZuzEVhC3HLpz95b/H0VhW
	HIi0k4JZgKRF6d9q2LcAKyq0vQ7tm6tSo0bTn6uCmxTHye7VXpGK3DCM3yUcJ67/PmqmKY54KkO
	66M8xkUA2iY6faOj6osVYlf5+b0NoPkWFpquLTXWzWPz0kv4CHRqtIs+IJL2HyCDkD1dztYjWro
	X1vrfKBqIjpWP/RgHlMlMQ0/5hlM7CErm7lqEnQIf889yhly8o0uoqpu5beWYaF8sUUAFPcrtBv
	kx5FL7/IfYPnnZVNTFSUXfwo2PcZPng9yDxwHp8G40EfypCXhHk5viYl9SvIo=
X-Google-Smtp-Source: AGHT+IElWfzAepNqK3LlpQymTFB+dnzq6dId0s4n8cc9tbggmQJHdM08XYTf6C3f7CI5MrGaIVI7tg==
X-Received: by 2002:a05:690e:168c:b0:63c:f5a6:f30f with SMTP id 956f58d0204a3-63e1626157bmr8254979d50.57.1760890566174;
        Sun, 19 Oct 2025 09:16:06 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-63e266bc09csm1738354d50.11.2025.10.19.09.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 09:16:05 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: devnull+federico.izzo.pro@kernel.org
Cc: abhinav.kumar@linux.dev,
	agx@sigxcpu.org,
	airlied@gmail.com,
	david@ixit.cz,
	dri-devel@lists.freedesktop.org,
	federico@izzo.pro,
	freedreno@lists.freedesktop.org,
	jesszhan0024@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lumag@kernel.org,
	marijn.suijten@somainline.org,
	nicola@corna.info,
	phone-devel@vger.kernel.org,
	robin.clark@oss.qualcomm.com,
	sean@poorly.run,
	simona@ffwll.ch,
	~postmarketos/upstreaming@lists.sr.ht,
	Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property
Date: Sun, 19 Oct 2025 11:15:59 -0500
Message-ID: <20251019161559.6731-1-threeway@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
References: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Federico,

With this patch applied this also works on the Thinkpad X13s (SC8280XP), thank
you for this, I know a lot of end users have been asking about this for quite a
long time, so nice to see that we might finally get it.

Tested-by: Steev Klimaszewski <threeway@gmail.com>

-- steev

