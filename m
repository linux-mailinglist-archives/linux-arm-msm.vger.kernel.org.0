Return-Path: <linux-arm-msm+bounces-87691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D1BCF871B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 14:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9992C3040215
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 13:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B4432F74D;
	Tue,  6 Jan 2026 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4Fg/E0K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF21032F762
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767705304; cv=none; b=KpQEOckhbG07NKBQu3jbZcwzuhpyv+vaCAVaxpZPDhvVyRYE93mw/8BHvjLDdhjQ8QCuBf+mz3J2dilVQ61mdAvzSENXgAiVhAuwq4qVAw9HP+StM5BzS/cQI4gJdYYaMSP9h4iP71ej/x8qXrX+b+PvHGS3c5iLzaKjmlWLIIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767705304; c=relaxed/simple;
	bh=z2LSC62V6MGDRrsjdEoicaXYTIU11N3/xCa15vQpICQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agkhOsmUo0bt1nvmx9SwfFmlz27MKYFAJvuYKWA90ntmN+s/880tH7+8BY3xkhTMeQqmpev09fURFi4F6QrCHuR/z1K1RYlXFz6Hci8ljvW8AAcfEHnhGu4AcXrXi4RLuTUYryd7U5jVL/UDfk6/GJukvflyEauBQhs0XeYd9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4Fg/E0K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FCDC2BCB2
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767705304;
	bh=z2LSC62V6MGDRrsjdEoicaXYTIU11N3/xCa15vQpICQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=p4Fg/E0K6TPsogPYqCX81WtaKyOZY6OGbsWhiYUWC+0/MjNE087O4weCIe8OHpJvJ
	 wHYipON1gjDVDtz5C/xQQmkbe9kiPqxbVRwKldQ8/oZJV0ra0h3bVqxwp7zROQELPN
	 IJJtQeueyUPpQx6xPZmbjmrVOdLHwm8R79O2QCZ8gWYR4OFq1sOvJJOfNOkYkm/3hD
	 AoGQ27AHxPu/+LATVfpYrs1aZsNpLSUu1ak+WuFdi1gAWnwNrcQ0rCM6DvO2q9uGgT
	 nm7jrv71iwzTgB+hsekSY2VXOIk+NodAk+YMUKxAMlgcuuGWOekG6VN6lR8Xzpe151
	 UpAOXUinhUEgg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-598efcf3a89so943453e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:15:04 -0800 (PST)
X-Gm-Message-State: AOJu0YyQeld1VuZ9XQG401X6ODA2QtVSN3ysf3GDlFmd5lbxsjcphCW2
	7Dyx6trcOkzRAiuRWRyiJWjAHdkKISmfkFvpK8VQs7XztfU5cs2HuYCZHKBJEk0MF22ZPXl0qrD
	rGYZItu1/fXINS3PQh0iJ/EDPLEDfS4n5n2vejhIEMQ==
X-Google-Smtp-Source: AGHT+IEyhnUDm6ZGZbEyhMYx6n9+iJHIAdB9oa/2a0E4TpDOHEiVACujG1v3ArHNGNCKl8KikMfb40zuHw5rMGXSBL4=
X-Received: by 2002:a05:6512:220d:b0:598:8f91:a03e with SMTP id
 2adb3069b0e04-59b652ea90amr1173482e87.50.1767705303211; Tue, 06 Jan 2026
 05:15:03 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 07:15:01 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 07:15:01 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260106043503.534557-3-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106043503.534557-1-shuai.zhang@oss.qualcomm.com> <20260106043503.534557-3-shuai.zhang@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 07:15:01 -0600
X-Gmail-Original-Message-ID: <CAMRc=MeA_9LYiHWjFQZcS+od4N1wN_AxuVUP_TuB6L=92c1BZw@mail.gmail.com>
X-Gm-Features: AQt7F2p5s1TGQ3Zw_ArnoNVlFyqPB6Cg9iH96cTUHj3jYmG0shkq24wzSTW_4Os
Message-ID: <CAMRc=MeA_9LYiHWjFQZcS+od4N1wN_AxuVUP_TuB6L=92c1BZw@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com, 
	jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Jan 2026 05:35:03 +0100, Shuai Zhang
<shuai.zhang@oss.qualcomm.com> said:
> Historically, WCN685x and QCA2066 shared the same firmware files.
> Now, changes are planned for the firmware that will make it incompatible
> with QCA2066, so a new firmware name is required for WCN685x.
>
> Test Steps:
>  - Boot device
>  - Check the BTFW loading status via dmesg
>
> Sanity pass and Test Log:
> QCA Downloading qca/wcnhpbftfw21.tlv
> Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
> QCA Downloading qca/hpbftfw21.tlv
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

