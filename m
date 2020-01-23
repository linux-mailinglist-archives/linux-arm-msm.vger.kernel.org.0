Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE091468FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 14:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgAWNZM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 08:25:12 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:35401 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgAWNZM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 08:25:12 -0500
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mn2iP-1jMHj53AIx-00kBHr; Thu, 23 Jan 2020 14:20:08 +0100
Received: by mail-qk1-f176.google.com with SMTP id k6so3348095qki.5;
        Thu, 23 Jan 2020 05:20:08 -0800 (PST)
X-Gm-Message-State: APjAAAV+he4/YELK87zcK3qDC4gL1opJQhJ9ou7biac8+Hgl9gt7QT17
        JtOg9eK1GTi1Ojc8RoZaZcyeQ2eH8unV0xkEaKA=
X-Google-Smtp-Source: APXvYqwXq+DG32RN0wO1YrRms+3/K/FWivCk9LXncsUkH+wak60+fKaX9yKo9/wDoFA2a+wGHM6SlVs6Zvrtlwwp8iQ=
X-Received: by 2002:a05:620a:a5b:: with SMTP id j27mr15758197qka.286.1579785607406;
 Thu, 23 Jan 2020 05:20:07 -0800 (PST)
MIME-Version: 1.0
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-2-manivannan.sadhasivam@linaro.org> <CAK8P3a3Nxr3yqDjZDV1b0e0mdWEEsktwrmKXxZgsnq7Kv82mhw@mail.gmail.com>
 <20200123131015.GA11366@mani>
In-Reply-To: <20200123131015.GA11366@mani>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jan 2020 14:19:51 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1z7mVEpxbk47Q3A-tLDhqHUid2_S4tE3NQuf_2_UCOcg@mail.gmail.com>
Message-ID: <CAK8P3a1z7mVEpxbk47Q3A-tLDhqHUid2_S4tE3NQuf_2_UCOcg@mail.gmail.com>
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
X-Provags-ID: V03:K1:FsPfcXjctBLIl0UBnWJI/axGoELjFyVvQ6i8JJEgDPFI2tdlxeM
 5/YASmkVHUUUEGp5wNLo3TYnrWhqnQo1sEUgwtvGS1SAV6MWJ49Uv8X1sz5nNUbm5bDx17Y
 gRefQDoE0YI63JpufjN4tam/BPPjDOfPso5pcz9LyFu2TVMHynxKXycb/u5v7xCVLGPOg4d
 pVsxFrSXdgPVTV+LXQTzg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P3xBzKHLjv4=:crL5yWVDiooFTsRz2e7AkE
 uWhr71cxWy8I18TaME+GtvLxEyH0dTnToxxM4HJrj+7EKcqvS9VZ3u92wqlnCEg14GF5vuGts
 NkjTQcDuBwAQvLK2xMF5uZa8O4RIMtfX7/GpPcNou2JEb9DRA0jg8bvb+GK7/CUHhM/qa/54C
 +WSisnS0LEo+FsjdVBJ8eLZwYcPfCe0HJckylQvbG9vKqb12HKLmeYYC+Alx9UJkEabXhbXTi
 2RKtQhLVhEmOXtfgq3dw1B/xGLDATCoTWcxD8BmGsh7n766rYaBslQ3BzIN9Q4uprxmFD+nlF
 vynmOos3UG0Edbg56b3+mSiEy6ROQBMs6EeNYhyxB1scpVIvflp9mKD/h4cYnUsGXsc1kKf8z
 16zLrawvJ71v5A4FRz5NOot8KDCDUF1aCuxMX7USWAPzEZlR8u7tF+wPntxFu9ZbJC7OWfezC
 MzjDRphNLDbofl8PZ+7i7Hh+2TJ2A+sQTCBXADR7Z0JKwR0y6vlLJPTdjnhnIyBPTrXlsfDKm
 lb81xJmBZy2SzqrHTSgfQMNtdFbeM6EzfM6G/jqILbs+U5FjXz6BeaFbxXwMAH360fYqWtQrt
 PxNPW2NMSeOn0nRGq3vvW3BhukKgJWwJh7Fm0pYieExJaljf5B7St3zf12+JH0ENwsOOHgYun
 aEYkRUrk5b7p2sLFFC0TQVq/X0A/Sb9JwNiwUyNZcuLtiwFoWVkWiZyg347GQ4yeY16CYmmxp
 fdwHN7Sm4BS6Ipdrh1BnB0eAi3LxdonoTqIni/+G/iU5Ruu4Fdj71PLWXiCtDZwvjFiC3tdPJ
 zQTHkNL1AlIU8FD7uQ0W9vlAsNJRfpEOm82zNRgybmZnZOMojc=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 2:10 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Thu, Jan 23, 2020 at 01:58:22PM +0100, Arnd Bergmann wrote:
> > On Thu, Jan 23, 2020 at 12:18 PM Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> >
> > I don't see any callers of mhi_register_controller(). Did I just miss it or did
> > you not post one? I'm particularly interested in where the configuration comes
> > from, is this hardcoded in the driver, or parsed from firmware or from registers
> > in the hardware itself?
> >
>
> I have not included the controller driver in this patchset. But you can take a
> look at the ath11k controller driver here:
> https://git.linaro.org/people/manivannan.sadhasivam/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=ath11k-qca6390-mhi#n13
>
> So the configuration comes from the static structures defined in the controller
> driver. Earlier revision derived the configuration from devicetree but there are
> many cases where this MHI bus is being used in non DT environments like x86.
> So inorder to be platform agnostic, we chose static declaration method.
>
> In future we can add DT/ACPI support for the applicable parameters.

What determines the configuration? Is this always something that is fixed
in hardware, or can some of the properties be changed based on what
firmware runs the device?

If this is determined by the firmware, maybe the configuration would also
need to be loaded from the file that contains the firmware, which in turn
could be a blob in DT.

     Arnd
