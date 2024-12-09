Return-Path: <linux-arm-msm+bounces-41154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B681A9EA03A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 21:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0018188857B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 20:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8CF198A11;
	Mon,  9 Dec 2024 20:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qt6NDQ19"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AE71957FC
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 20:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733775948; cv=none; b=u2AdrET+CUrk9LwyAiHRUGl3EikGSqIM0wuTNt3rTwYXoLiK+afgupOnRNUw25fMukmpU0T3fznT7DCkcubTiydEEuRptSzWkXUpXidSJlvICQi7datkFls0wRlxzB4OZV6bKpe3+CTu20wgowhBjPIadoxTUL8d1KDLyKii0FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733775948; c=relaxed/simple;
	bh=aeW1Qv2UPwpRAYlmvNgiB96ubvKWe8vR9mtKpaMWFh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCq2ZR5Cvd8jpH58L6gUpzIl/wckAXp5nyzDGzCbG+lSlK3kduwRCxOXB/0tGLl9yvzs+HyNYwI1bEvfG+nj0eXS89CRJ/+oyu6GnybT1taMv/Oq89amE9p/CRTSkNkub2VEGp/3FTh14VVLrlT4wa+DwN/A0QikDbI0Uyk9OfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qt6NDQ19; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6efc58fae20so44690497b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 12:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733775945; x=1734380745; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nwx5IHobGMlKVDDKEmFg8UZxcT8RAcxLlIlsPHAr7oo=;
        b=Qt6NDQ19TyzpxcedYchXsfTQaKNPnUZznjLok9seEXBxokd70yeR3R5uXWujj7T6gs
         G1CG5qHMBeNdmiZe1AdQeOzdEVQuyjIoKk2ZS7FMYyFSZ7o2etXd7QBclzSMRHvEv+tf
         mF6BGZLIJF3z6YP5CWNQFs7b5DN2JsjM1hs9HXYcWgl5KuW7L6OGBcGamyRE1ZcTSqYf
         Qt4p7gLOo/SJA9hpFwTwd7Q7cQISmzM5YLabL5ag/iod/JvcwSWAf4nI0XlWmBncH2V4
         0mmOxNYcTWiZA0JCBrmH6oTpY0D7TD1HJhiZlXlb3I4mbjfehq5CVpQ2mcRK59yXWu9K
         ELPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733775945; x=1734380745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nwx5IHobGMlKVDDKEmFg8UZxcT8RAcxLlIlsPHAr7oo=;
        b=L+l99Z5suqfaOe/yGqpu8m2q39aDEqZGK5S5nXDkgk+NG3S4mLA2gXqap6ZW7ZTfdL
         ESLp/EgBGxvXUT4MLnloCwO2z0BsPWf5Prdb5hEBN17C7L5dMBw1SHwcxby19vQ5k54c
         xOo5iEHF/v/l6hX5Z11zXesea9ucZ1/Mu0DDDaDmYfiCN0iYZLT+lVeaxscCOfu/Tc1h
         OnP3lYgqMtSDBkNkbEAibPhm2LwMQIwjfMRFNpWTSafYBUmOErRy+OEt/Y7aGFI2FSNX
         7jal/YOIOYeF416iXHWvzW/1AodfgSptxa8smq0z0PPkK/6eNk3sSI1rObgNVeIVkg3r
         L/0A==
X-Forwarded-Encrypted: i=1; AJvYcCXt1WMpzcgpMoa1pqf3xoBxtnEc8o8QNoZkmfPXZzo4A5AFA2U+6mwqK8/BFgRm/aSZgI7uay/vNx9I3R+1@vger.kernel.org
X-Gm-Message-State: AOJu0YzPhmcAgmyvsQvZwjITDPC3X+npzGVQ9ojbn8+1WsMRwLXMO62W
	p6ZsOrkehnRTLAfNub8uvIVJ7A861j+dpUzrVx9O+yjFX848mRb51ULRKYUDnLR/uIZ2O8WBvoP
	LsCs60KbaNs/eCPvWVcRuupAvShUp+Kel3Itk/A==
X-Gm-Gg: ASbGncuYng774L9IRe4l5IXAuD6YCty69LrCPC3n3gwrNvrdDC6zQAVt2h2YqvGr2L9
	Je57vEKLDOOYDglZwuQX41U1AvkGUegqnWAKepGjBjDsxDANVwZ6Bfc/fAvYEtI38bF8=
X-Google-Smtp-Source: AGHT+IE4eIG1CU8nTE/djGI7rWu/Aot88rWUk4lCyh2w34yi487HGQfCm9tQE98cxEW5ofI5zKH9RgP2gJmphFmD5Mg=
X-Received: by 2002:a05:690c:64c1:b0:6ef:c24e:5e2 with SMTP id
 00721157ae682-6efe3c0db31mr121637897b3.19.1733775945676; Mon, 09 Dec 2024
 12:25:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
 <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-3-9061013c8d92@linaro.org>
In-Reply-To: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-3-9061013c8d92@linaro.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 9 Dec 2024 21:25:34 +0100
Message-ID: <CACMJSesLKmNSQKzc=4er4-sUP=+1cMRFoHNgR_CjCg8f6+Vmhw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] firmware: qcom: scm: Handle various probe ordering
 for qcom_scm_assign_mem()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mukesh Ojha <quic_mojha@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Kuldeep Singh <quic_kuldsing@quicinc.com>, 
	Elliot Berman <quic_eberman@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, Andy Gross <andy.gross@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Dec 2024 at 15:28, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The SCM driver can defer or fail probe, or just load a bit later so
> callers of qcom_scm_assign_mem() should defer if the device is not ready.
>
> This fixes theoretical NULL pointer exception, triggered via introducing
> probe deferral in SCM driver with call trace:
>
>   qcom_tzmem_alloc+0x70/0x1ac (P)
>   qcom_tzmem_alloc+0x64/0x1ac (L)
>   qcom_scm_assign_mem+0x78/0x194
>   qcom_rmtfs_mem_probe+0x2d4/0x38c
>   platform_probe+0x68/0xc8
>
> Fixes: d82bd359972a ("firmware: scm: Add new SCM call API for switching memory ownership")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

