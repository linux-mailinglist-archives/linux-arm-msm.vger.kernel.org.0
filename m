Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC6FF10773B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 19:23:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfKVSXq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 13:23:46 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38934 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfKVSXq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 13:23:46 -0500
Received: by mail-pf1-f193.google.com with SMTP id x28so3851934pfo.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2019 10:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=Pn5jJxprXgy+eMJms58Z8Kvldo76KRPuED0UpzQINWQ=;
        b=MsZagEucv0b1WmIyy2pAgo6HNfHf96/ht0J3UUI+XUbJfLsvjYD5fAijLUvI3bkLNs
         Mu3pU9HGy8duWXhPQKCe5OzB+uIKrhQslC2xPiVLwtBC2lKZYr8aAQdvpmg5kgyvg5bv
         Mu5t4i+XKnuSxVpY8umE0wEFSqHRfj0G1Uyl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=Pn5jJxprXgy+eMJms58Z8Kvldo76KRPuED0UpzQINWQ=;
        b=LSki1tjf5QsgLfPxaNw6M22uTWSyct16f7IQ65YPYRitFVTLECRjcPlSgPVmYj6jvV
         IzeeLAmHNlXJMWRH53h6hB1NQn3TpuXrh4dpCKx79W84wlWvguqFEATPLaCrB0AX3Nlf
         Yzl2oRbV+XhgNxu03r2hpFDdVHr9HGZGrioQRNeeOt0RAc2gi/9efVVVbsmnO5lG40/F
         nMWWlaqMvnvIQ2Wrv/r4nZdOSQEFWw/Le94GbHZqSP9U9zq7Q7knfX9+Mrt0SnvLuKr5
         1nf7Us5vYhn123o4vXKeAefhuSrQZKN7RUiMAq44w/LHRNCls+0nA2r4LCKb2O/SEUNf
         DBfQ==
X-Gm-Message-State: APjAAAXD7/iFh2G2ru04agn7uqd3VlEHTYcRYS9br9xOExHROdPMrOxz
        c3fV8dQTNvkLohaU4YtaCwB8JfCGDYw=
X-Google-Smtp-Source: APXvYqxThAGBPYAmlS74a6k+TSUsn6Id1iZNQo5lX+fHhLjHbRfexunm0aWgT6XZhNHknylCzP8GBg==
X-Received: by 2002:a63:1624:: with SMTP id w36mr16201097pgl.404.1574447025927;
        Fri, 22 Nov 2019 10:23:45 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 186sm8726638pfb.99.2019.11.22.10.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 10:23:45 -0800 (PST)
Message-ID: <5dd827b1.1c69fb81.a7ff0.5ab4@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e937a0ef9-36754afa-105c-416f-b308-b5bed0cc0ccb-000000@us-west-2.amazonses.com>
References: <0101016e937a0ef9-36754afa-105c-416f-b308-b5bed0cc0ccb-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH v6 0/5] Add wakeup support and move loopback to TIOCM_LOOP
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
User-Agent: alot/0.8.1
Date:   Fri, 22 Nov 2019 10:23:44 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-11-22 06:18:00)
> This series adds wakeup support over UART RX line and moves loopback
> support to TIOCM_LOOP.
> Patch 1 & 2 reverts the V2 changes for wakeup support on tty-next tip.
> Patch 3 & 4 adds V6 changes for wakeup support.
>=20
> Akash Asthana (5):
>   Revert "tty: serial: qcom_geni_serial: Wakeup over UART RX"
>   Revert "tty: serial: qcom_geni_serial: IRQ cleanup"
>   tty: serial: qcom_geni_serial: IRQ cleanup
>   tty: serial: qcom_geni_serial: Wakeup over UART RX
>   tty: serial: qcom_geni_serial: Move loopback support to TIOCM_LOOP

Maybe the reverts aren't necessary? Is it possible to fix up the patches
that are already merged in Greg's tree?

