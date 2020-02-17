Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3A21616F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2020 17:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729599AbgBQQFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 11:05:11 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:59565 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgBQQFL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 11:05:11 -0500
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mow06-1joHJD2KlS-00qT1W; Mon, 17 Feb 2020 17:05:09 +0100
Received: by mail-qt1-f178.google.com with SMTP id d9so12334823qte.12;
        Mon, 17 Feb 2020 08:05:09 -0800 (PST)
X-Gm-Message-State: APjAAAUoQQwJMf2dXaaZYP93Gx2Ancv6n/rct8kYpzn8ZcHu/7IvS++x
        tv3G4cxeX7TujOwecoAtRCGlxuo5Oh7uOMbN4XQ=
X-Google-Smtp-Source: APXvYqxR24d1UtkEhBOIjI9aHRGcs1xpyahscZCl+fB1o0U8N/KlSf87IhKTr7k/p9r//9AkSP/9yAzwmpTx4NajwIA=
X-Received: by 2002:ac8:3a27:: with SMTP id w36mr13631805qte.204.1581955508158;
 Mon, 17 Feb 2020 08:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20200206165755.GB3894455@kroah.com> <20200211184130.GA11908@Mani-XPS-13-9360>
 <20200211192055.GA1962867@kroah.com> <20200213152013.GB15010@mani>
 <20200213153418.GA3623121@kroah.com> <20200213154809.GA26953@mani>
 <20200213155302.GA3635465@kroah.com> <20200217052743.GA4809@Mani-XPS-13-9360>
 <20200217115930.GA218071@kroah.com> <20200217130419.GA13993@Mani-XPS-13-9360> <20200217141503.GA1110972@kroah.com>
In-Reply-To: <20200217141503.GA1110972@kroah.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 17 Feb 2020 17:04:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a28cZzOD7NfjBR=g6fADGgqwE7PFgOJrh6fph3QmDhKGQ@mail.gmail.com>
Message-ID: <CAK8P3a28cZzOD7NfjBR=g6fADGgqwE7PFgOJrh6fph3QmDhKGQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] bus: mhi: core: Add support for registering MHI controllers
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        smohanad@codeaurora.org, Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:GvetXQ1OAzDvj5SppjdPFV439MHs3fEPj9TeHxR24yoiKphxOX2
 uHGdyqyI5bLLcHmRqNGAxXX6RzeVtYJiMbT8YhKNpxrtMUlRyLL5OmM6vrzFcbNURakv59l
 9krdacVpdGMz/w1+Aixbvu1bRVk9ObqstejLWHqvfAgkZF6irhJLQIkzr8l1Mrv3hUYZt2P
 74X5aymaVfF8LGIWUgKgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n1DQm7201AY=:N5S/ucW8WbB14HphQWJRNn
 jvfBvMZbFdh4xbiOqjuvMVRAA//XwYwTO3l4uflqGdn4Q3ZSQD8bZcO2wTHPLdac2QRnYEXut
 k44OvEEjS3c6aq0eWAd8tiBVWFpMNyl1OY/shQVpWMG7mmz8nomTZ/XzItexzEArhpzuwAaWA
 n9oXoKYbRDP3KmkCDZ1R/jK3I/lhz+UXCtWKiMKELSoLurAm+qnd7TuUjyPKbeuhTaM0Zj2O8
 mi2Mv3u4GHTAIKulNBQjsHWhJ1rjgwyi7nVN5NOvQbYn15ruQVriMwGILqrOZwRPNBrkuaPaQ
 WpRxeEGBFGvZm44OJmJq7BTfsfIYv+pYYCe3uL14sIn3IRPW3TV6KdtM73M+Zj2dx6OfWrRWU
 fDmN0vKzYM41lxIHkJA6oXune3WR8HzuemmaBWTwS9uoVoTOCcPGy21nVveWJo/D8KG772Jc6
 39q8I7W2z30Da0i/EnACNGgt5GBeRu6RUODxXbV8+vQ7wVx6c+wwGw124rHZIj04Th+HxkfuE
 r2loZgHtofv5BQWWSs+z6+XqU/aYuan/98Wd9Z/zQeAc43cDzlcTY0okjbvtSgT0gHasV/2o2
 iAAWA26cYM38fKD3ew/6CYTLFhBOMrhoG6mUQdGilUE4Vgf93704/P1lXeE9SMRCm99rFB4w3
 imB7KKYpaclouM+xua1PLBYUZq9yc7j5DhiwnB9KSANffZkNOOlF+nAr8g0zUA1bxKbLw//1A
 5FtX4G8S0jaOKUXDKFrgqsZA0pQD//aGEs1Brl7vPSy/wUKP77dE+KqfHdHRyXPCVeeA/Gqma
 vG0Kbn6p3LOt3HlkusN22cpPjH7l7YqFY45fIW2k2X+a5hcZYE=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 17, 2020 at 3:15 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Mon, Feb 17, 2020 at 06:34:19PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 17, 2020 at 12:59:30PM +0100, Greg KH wrote:
> > ```
> > struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
> > {
> > ...
> > dev->parent = mhi_cntrl->dev;
> > ...
> > ```
> >
> > Hence, having the parent dev pointer really helps.
>
> Yes, saving the parent device is fine, but you should be doing your own
> dma calls using _your_ device, not the parents.  Only mess with the
> parent pointer if you need to do something "normal" for a parent.

The MHI device is not involved in DMA at all, as it is not a DMA master,
and has no knowledge of the memory management or whether there
is any DMA at all. I think it is the right abstraction for an MHI driver to
pass kernel pointers into the subsystem interfaces, which then get
mapped by the bus driver that owns the DMA master.

This is similar to how e.g. USB drivers pass data into the USB core
interfaces, which then get the HCI driver to map/unmap it into the
DMA masters.

      Arnd
