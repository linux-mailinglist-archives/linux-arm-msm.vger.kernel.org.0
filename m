Return-Path: <linux-arm-msm+bounces-44224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB02A04DDF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 00:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F3CE3A4963
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 23:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCC91F63D4;
	Tue,  7 Jan 2025 23:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fduCUKWc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7151F63ED
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 23:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736293854; cv=none; b=FXq2cQSBR8SREOIh2Y9M4Gb4KEPdIfwQfBP4LjdDOQe6G3I9pGHMasSRyibMCsL/oE6FpKHObX5oCl/VdYLnJEZWY2gNQiyEunr4N/EYVe/ZQzn46bbWndrRHXJkTnN0M3ZAZNdksGSWjsgffS/s1k1HYLyk5xwoFFMuDM6CaYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736293854; c=relaxed/simple;
	bh=AoKzduww5JTHtLHaYHEdrkvNKnvZ0IyAhMtg5W0q8Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gvTGBWAsqBl3OhLva7R60BIa6iRRd98zhck71UiLB9g78uKyUxyjwK7+MHp3AwDHEscVxSF1QVSwCWVuwFH6bUxZDbxscQm9RtCHshtY6j39AN/Yk+utADGFPZczyxSQgW9T1H02wthLYp2rjDlImxTWZMc7yXuuZVBWsyuoTag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fduCUKWc; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401c68b89eso353799e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 15:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736293850; x=1736898650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzA8ULDWK+L6lzlTxbv+SOWG/fbWpGETGTXU33lZ5cE=;
        b=fduCUKWcD9FYwQvFfAGEoBLBDlPXMLHQtJiODXcocHLLmiygXnncSyBVxvPyAk2bEB
         WHsLfi2kgjImIpUFb90jQ56R9NgOO6Oi5T1TAxYyOTncVoyZblXGbu8vlv5STx5b8q2t
         R3q47wQxX2BWPgUrbQ1O2hxiBgDIpE9ZvUv8nYdGqzVUib/Yjc2UMn3VpdUA/Nck5K+o
         mUmyLfioHBH74DmMhyZaPkQQ0Ii0hTfjtAgcYTrDVehSgBbwlOg1bU2hy5dwXS+KdAdl
         PJWjbNqCZmiSD6P6zcNZist6MnAGbg4AsmIW4fyJmabjcN3XrgssrPWmsHlnHXNxMKV2
         VoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736293850; x=1736898650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzA8ULDWK+L6lzlTxbv+SOWG/fbWpGETGTXU33lZ5cE=;
        b=wb/oExZUzQT2fWxc+neGS5BVLpA8sKoR/ySGYqvX8S9p6da2M7vQyaReC8dOzjkOyk
         HDcGEjMgpkmE3khZwlmkgaHYNG9IpGntjQoH0n8jiMlCqlPtueacxlNUYWUTfYnlx/xQ
         ECgrl9Dfuhqk7gstIXeDCzJ5UlMbWRTqH/4KK2sOdWFhmLpE7+DiZa6vjUqjFkl7Se/m
         lsVVYUim4k8hIOJ9ijCJuhD9UR/HQsqcmpOHYuDkCLqy8tWdl6eJ2zWtG8tKmHRet4cZ
         L4VvoJBB+VaSjENHbdT/CTXyV51alUGqWnuSlkSlQto4eNxQZIzXqWcHf7ZATGAvnZHn
         Z54w==
X-Forwarded-Encrypted: i=1; AJvYcCWYB69/ishLk5KEjWF6kq7vaSPBazaDJDJXQLqXryqR7J7Uh8kK867COp6MjPOxXngeubn1gZTVawkVmLyh@vger.kernel.org
X-Gm-Message-State: AOJu0YzhLDdtV739nP4eibh7+Wm6ILE+ig6fuSZFmumttb5hAXf6kWnO
	zENjI8aaTK5D7xnok7yaRMyXPdXuok5nBjFTSQWWsphxdXYxNM7sj7mYrufvlA4=
X-Gm-Gg: ASbGnctqTX5VUi7RECYqdxMCVoPqsLT+sSgNV7bRwVV01lpVEpnRjQ/hhfPNTAfehS3
	RoiOHyESQfcQK2/YT2qlBoSPME3/Yl6jTvi9cWpdTN3yv1l9S8ercS774EnbD1/YVoNGlJTnWKA
	ZWaY+yqU4MNjE3UWV54DowPtD8TI5NnvQyK9SEopZuka7tEPZj5cu+hzQg34cLHn9BNsL1QcFQ5
	2MhoTgbL7JETZ1VBxqu7zmGxTu19b8MEmkGeWwVSpHyBQ+KLEcoWtJMRsgM3PDqjmMyIOPCIz2c
	NY/n/V5cNLxck2tY2AqFzpU1
X-Google-Smtp-Source: AGHT+IEq/n/Tfq7aT4FpmCEZdmi1g3GO0mqtL7fWEuY6dUSLlQYwrreN3n6ytarFegj9TLUJkrf0bw==
X-Received: by 2002:a05:6512:334e:b0:542:7fb2:4098 with SMTP id 2adb3069b0e04-5427fb240dbmr964465e87.26.1736293850322;
        Tue, 07 Jan 2025 15:50:50 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f5d5asm5409976e87.45.2025.01.07.15.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:50:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	quic_abhinavk@quicinc.com,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_ebharadw@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: Re: (subset) [PATCH v4 00/25] drm/msm/dpu: Add Concurrent Writeback Support for DPU 10.x+
Date: Wed,  8 Jan 2025 01:50:46 +0200
Message-ID: <173629378661.1569938.10235663597211043453.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 16 Dec 2024 16:43:11 -0800, Jessica Zhang wrote:
> DPU supports a single writeback session running concurrently with primary
> display when the CWB mux is configured properly. This series enables
> clone mode for DPU driver and adds support for programming the CWB mux
> in cases where the hardware has dedicated CWB pingpong blocks. Currently,
> the CWB hardware blocks have only been added to the SM8650
> hardware catalog and only DSI has been exposed as a possible_clone of WB.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/25] drm: add clone mode check for CRTC
        commit: eee0912a7185d5dc0a700d48f7ff620bb7f5389b
[02/25] drm/tests: Add test for drm_crtc_in_clone_mode()
        commit: 5a6e8c369486a79493ab300a1987cc6aad16cf6a
[03/25] drm: Add valid clones check
        commit: 41b4b11da02157c7474caf41d56baae0e941d01a
[04/25] drm/tests: Add test for drm_atomic_helper_check_modeset()
        commit: 88849f24e2abba8a8951aa76ea60a72fba916afe

Best regards,
-- 
With best wishes
Dmitry


