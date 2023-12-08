Return-Path: <linux-arm-msm+bounces-4003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221980A750
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1F70281550
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5667C225DE;
	Fri,  8 Dec 2023 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ke+UDI3k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71E910C0;
	Fri,  8 Dec 2023 07:27:19 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bffb64178so2592948e87.2;
        Fri, 08 Dec 2023 07:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702049238; x=1702654038; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CdkNdsOhaYehi74V9wqulXWMvo6EKX3oTCKCSVBFzBQ=;
        b=Ke+UDI3knKevgXSg7/xWc4uFapTZRmBHViPWuVQk827zxY/6HwtyBZzO3hqy34ICGv
         lqhjTTa7EHHpjaUF4NO/X/jtbUQB1QzoOFJw2SSj5nIz9VgVF/dP446A/xG6vuo+7m7t
         GJozMFf+mjNgohcoISXhPJyYYOfYcSW1MRqxbappXsMN5z4qvN7KeG8i++m5My0K4zU9
         AH3EnRabyYpMnxtyL/BL8wPiTR2q2Y9k4QzT2vW3dMfSj61ar860mv1Z2QYBpWN1ZMbF
         VEwehWQddjhpZkaD+3t0v1iUbKYK4ApR8ynHUzEG1Mj3jimuA6fSvKcDV+gvpJTU5fG6
         1Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702049238; x=1702654038;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CdkNdsOhaYehi74V9wqulXWMvo6EKX3oTCKCSVBFzBQ=;
        b=WkhBeB31OyUWQTWypFgdAAlfAhef+zhxB4ZHBda4Qibf9WE2xJhvSp3jpQHlLZM4fK
         yV4dP+NSwKL4vzZ4KWPV7UcmQfuCpxxeGMiEy3BvchyFfR/a5Kyaja9lEDp11WKKIXmR
         h8ZySOYLQKvhB4VnKtvMtL8/HtvOziEDO+nBXoYKIB8LxNgder/SPOyTJXz4B4ASEhmU
         hd0WCuK7upeRXOT7r7OlrotJ+vzNt1MgLzfuaWWAEC/ieJPi0VYMqX2pQtOfk1n7lHq5
         +IF264jF1xWFiaBgsva2//UdWu/m3kNyaBMh4BJn4fPUJ5yNWz4IgabOhiVW0eWuzXTH
         pzUQ==
X-Gm-Message-State: AOJu0YyrwRpX3cRr6LkbtBtFqe9mXIJvtyKthElff0AdNne49BmA42mU
	HZO3qjFdbevrKXxsBsY676eyNRgzUVEp6egAcQY=
X-Google-Smtp-Source: AGHT+IHNSLHEqiN1RJI+VhxwG6QQIKCnL3aaNEBEr0+cWB+5+KrXhSHM81/KmF8J9g9Y7ZdCMWPKol3bdlKdx0R4W+g=
X-Received: by 2002:a05:6512:238e:b0:50b:bca2:d1ee with SMTP id
 c14-20020a056512238e00b0050bbca2d1eemr56993lfv.42.1702049237605; Fri, 08 Dec
 2023 07:27:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Xilin Wu <wuxilin123@gmail.com>
Date: Fri, 8 Dec 2023 23:27:04 +0800
Message-ID: <CAEPPPKtEoiF-xiNm+LjCxb_Rt4c7rrUDRr7KkGE_8iJDuc+M1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, andersson@kernel.org, gregkh@linuxfoundation.org, 
	heikki.krogerus@linux.intel.com, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	neil.armstrong@linaro.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 25 Oct 2023 14:49, Dmitry Baryshkov wrote:
> On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
> UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
> easy way to recover from it. Since we have no easy way to determine
> whether the partner really has PD support, shortcut UCSI_GET_PDOS on
> such platforms. This allows us to enable UCSI support on such devices.

This issue actually also exists on an SM8550 platform, specifically AYN Odin 2.
I tested the patch on AYN Odin 2 and it also fixed the issue.

