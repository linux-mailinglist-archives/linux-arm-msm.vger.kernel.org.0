Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 418E118E66F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2020 05:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgCVEuC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Mar 2020 00:50:02 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36142 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgCVEuC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Mar 2020 00:50:02 -0400
Received: by mail-pf1-f195.google.com with SMTP id i13so5684212pfe.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2020 21:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fw7idJmuM/UMJ8Ze42mgQHANiFZYpnBY7OB3z1c8mkE=;
        b=ObkEALEuMPnaX+qZotFV5IEfFHzYpbijpfW7g7fuZDvwumlr0am4+8R93yFLcSc0tj
         m3jzdfuHuv2nwC6MWAFBhYhLh/ap6j8H4d0eV+svLawEAgjjNYzqTi/feNkNJ1TOeaWs
         T0rw8fyhed0hfaTnbcWnXfrN8wYjGLZ7pti96oCM9rFVW1jzFvM2cj/nzUPREaYFthk4
         w9Ffw2ipzoHf+MRHH8EOqEoowFrIobbagf+01JppCpZ2ckR+c83wr6mVA5/ZC7bLqNon
         MuOz2KMsVt9InFpkRVlv0fc96/GtcTBBqfmhBb2/2R9yVJ82XIfmJmp+8e3+a6pIYXJT
         XKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fw7idJmuM/UMJ8Ze42mgQHANiFZYpnBY7OB3z1c8mkE=;
        b=siNe3tiDPECppcDmzjnOLM2NShfHOM8D1v70tZWl7NBeqkrcraGzmi/LUXOtqZhCeD
         Ogv9pl/JYlY47rzm+q72QEMsv/XmQsWhW2an81DZ5daqoYU7KKnFeFy0PUlODr84bRhK
         YhCehHOye8O2g5RClNi6iUVkO70lWe9DjKs5O1bUNQ72mvD3YV4aNq5xU5JaxT1cetDE
         p108AzRBkenOwkhdkBjFQ0ixWMR2QvPksVPn7OfAYOQF04os94M1B2yUv8wWznI3fMyz
         06avrZ1TAH385T5PvKHS1kEPeA5sbTYoAe+NV7RgmGR30PH2HlPhXd+VDQ6Tzln8uzTE
         EKyA==
X-Gm-Message-State: ANhLgQ1uFL2rVjp1nVCyyAmMjdCpwlVdhqDabcbhMSHTM/ZE3d+5f/EC
        Ea5AyqisDkbzoux7u/LqrNN0
X-Google-Smtp-Source: ADFU+vvDVs2I/LbHWUJQ4k/S2KAgwBeDLUq4hu6QT+o0LyCmxlbOu7JWHBsV2Ob5MbbH15RERI/R8w==
X-Received: by 2002:a63:1e59:: with SMTP id p25mr867362pgm.219.1584852601080;
        Sat, 21 Mar 2020 21:50:01 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6183:f34d:9904:5c2b:1f14:a384])
        by smtp.gmail.com with ESMTPSA id k189sm8984584pgc.24.2020.03.21.21.49.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 21:50:00 -0700 (PDT)
Date:   Sun, 22 Mar 2020 10:19:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH -next/-mmotm] bus/mhi: fix printk format for size_t
Message-ID: <20200322044952.GA17141@Mani-XPS-13-9360>
References: <c4852a82-cdb9-6318-70a4-96ccb4ba5af2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4852a82-cdb9-6318-70a4-96ccb4ba5af2@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Mar 21, 2020 at 09:17:52PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix printk format warning by using %z for size_t modifier:
> 
> ../drivers/bus/mhi/core/boot.c: In function ‘mhi_rddm_prepare’:
> ../drivers/bus/mhi/core/boot.c:55:15: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 5 has type ‘size_t {aka unsigned int}’ [-Wformat=]
>   dev_dbg(dev, "Address: %p and len: 0x%lx sequence: %u\n",
> 
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Hemant Kumar <hemantk@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> ---
> Found in mmotm, but in its linux-next.patch file.
> 
>  drivers/bus/mhi/core/boot.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- mmotm-2020-0321-1517.orig/drivers/bus/mhi/core/boot.c
> +++ mmotm-2020-0321-1517/drivers/bus/mhi/core/boot.c
> @@ -52,7 +52,7 @@ void mhi_rddm_prepare(struct mhi_control
>  			    BHIE_RXVECDB_SEQNUM_BMSK, BHIE_RXVECDB_SEQNUM_SHFT,
>  			    sequence_id);
>  
> -	dev_dbg(dev, "Address: %p and len: 0x%lx sequence: %u\n",
> +	dev_dbg(dev, "Address: %p and len: 0x%zx sequence: %u\n",
>  		&mhi_buf->dma_addr, mhi_buf->len, sequence_id);
>  }
>  
> 
