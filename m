Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C340E146884
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 13:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgAWM6l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 07:58:41 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:37381 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgAWM6l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 07:58:41 -0500
Received: from mail-qv1-f45.google.com ([209.85.219.45]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N0G9p-1jr6dM0q8N-00xG8e; Thu, 23 Jan 2020 13:58:39 +0100
Received: by mail-qv1-f45.google.com with SMTP id t6so1412664qvs.5;
        Thu, 23 Jan 2020 04:58:38 -0800 (PST)
X-Gm-Message-State: APjAAAWhSrSmpmINUrzcXTkhCSOxhUmueZghXd1m+DLK9z0SDQXiLN1v
        Cl+1NEXhz9Ef79GfqOaFrf3xSLwwelHjY0RG9Qc=
X-Google-Smtp-Source: APXvYqyw9bBbo+89C/591emneKt1j9nV/QM4i5KSI1x7aVdilX1LpU2Q140elwjyzn14S9n89y46oPTcIBYeQFRiFtg=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr15794234qvg.197.1579784317864;
 Thu, 23 Jan 2020 04:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org> <20200123111836.7414-2-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20200123111836.7414-2-manivannan.sadhasivam@linaro.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jan 2020 13:58:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Nxr3yqDjZDV1b0e0mdWEEsktwrmKXxZgsnq7Kv82mhw@mail.gmail.com>
Message-ID: <CAK8P3a3Nxr3yqDjZDV1b0e0mdWEEsktwrmKXxZgsnq7Kv82mhw@mail.gmail.com>
Subject: Re: [PATCH 01/16] docs: Add documentation for MHI bus
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     gregkh <gregkh@linuxfoundation.org>, smohanad@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:LadYn9yPM9kSuNNXed3cD/yTDIZ1fpTY2bl3GiBYQQs5A1tzaeH
 qXmrW4zIjNo7lPDt5QuuIYk1KOVfewmETyTSPByRtGEag/JSInPthZaCCtpducSPjuqBC9t
 8NTRfryL1j5PRrR5mc0UERtyesBc0EG0qTihJJVXDtWwUgTxi8DEZUBC5Sw9jhJropaPdRp
 z/vLIcSEHACm+VBviYFAg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tFCkEN7Qgog=:1fNz5XBBuB2Iv6eB8g6pDF
 GGODdvzoj9mhuOSljWQ7uK2D/6Fw2kMXCPTga/r80N/TaqiqkdWZV8lGmBDSGXckpfzHcwZGc
 mrebIbRAr74zZCBipM4AZb/YMEMvlL8iYQA5zKyHMzpm3OvoJUB+i+jtRBCUV6b2amlcU0ohp
 TgEhGbSfCoVt+IDPCWfjqbn0X2JJj2U8aByxvEOIvbpzilyRXks56Ci4AbjiIkwjBGMhynN7z
 K+ZnQXMvGdXFKMhYc26fiHGcbN/VMNuKYzFQvf5/azkojXLPUASspiLSNuKsiiZi/AMw8aehP
 ex/+79IUHcoNOataPUp5NzaqPA8i8Ta7ilX/fA/9afmOy9FA4EtTnbR1H+afOgDlsm34+ax59
 rwiWCkmvSyXsI2kQivM66fcoUkwubXXSnyAZGNDS2fN7rMKLdmSD/4Hn+IWqt3xx4JpGe0C2c
 2zmld7Iom/MnGvdHTebASKuUEu2uH5XVNDZbXQxKMRmJJlRK+XpQLUepFs5ZV0FgJLNaDtVKB
 Kv1fg5xYU11EuFvepSun79Qs8T5b8NPZmryZLreWl0MpGWW6uAp3c0oUSVFF04LZmXxTVJhco
 ASTwU8bWhnNAjJYCm5sWBpwyiMoUdpRtiy3n2/EkIjg5i5bKHj0hLFtyvTmVbBeGz7A7izGIv
 oHzPm549BUmU9Tfn05i1gkYwLpVkBQzFHiDZ/7HDlYFVkXx6OPRv+VCbQ/Jemzpd/0rmKX8qb
 ONsPEnjUPlavKk1I/iJENJ2q8bftpg1kcD9ixNe0yAIzmObKWbYL4axFLP7n2B3HVq/qngIIO
 FusSBeL/ggH9/yWfSlXpWQ4TCLA0gKvjqvW6RydBfRuKcANdvs=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 12:18 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
> +============
> +MHI Topology
> +============
> +
> +This document provides information about the MHI topology modeling and
> +representation in the kernel.
> +
> +MHI Controller
> +--------------
> +
> +MHI controller driver manages the interaction with the MHI client devices
> +such as the external modems and WiFi chipsets. It is also the MHI bus master
> +which is in charge of managing the physical link between the host and device.
> +It is however not involved in the actual data transfer as the data transfer
> +is taken care by the physical bus such as PCIe. Each controller driver exposes
> +channels and events based on the client device type.
> +
> +Below are the roles of the MHI controller driver:
> +
> +* Turns on the physical bus and establishes the link to the device
> +* Configures IRQs, SMMU, and IOMEM
> +* Allocates struct mhi_controller and registers with the MHI bus framework
> +  with channel and event configurations using mhi_register_controller.
> +* Initiates power on and shutdown sequence
> +* Initiates suspend and resume power management operations of the device.

I don't see any callers of mhi_register_controller(). Did I just miss it or did
you not post one? I'm particularly interested in where the configuration comes
from, is this hardcoded in the driver, or parsed from firmware or from registers
in the hardware itself?

        Arnd
