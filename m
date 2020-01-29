Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBD1514C6B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 07:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgA2G44 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 01:56:56 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40303 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgA2G4z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 01:56:55 -0500
Received: by mail-pg1-f195.google.com with SMTP id k25so8337801pgt.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 22:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=th9dM6ur5ptqhvYRUmVKLbFwuIqQif/Q5YDIPAzrV5o=;
        b=QKHwAWGmudqsth1f1OQRiW/3rvkqGwZ1HNrv5d4evNdvm+mVBIg6ZRLJZn0TU0GY83
         Ty7kIHovGvX9+DI41SS1B+LlVUXYcl2zf2rzYNjxGav/UC4aqquBdn6b5EbIM6Ssad7Y
         EYZdiNP32G+l0mdNbODgBiGCztFLAdrJA1X7mlrYoJECfgTeWazr+VUvY3UKmk4mZ8Ge
         LYrw+DF8mOL3jfuC8wXnmod9R36/DOL/yUeLYPh6Aiv8X43pufYZdQqTL9xCWXSqR+uD
         BORWJ9XYUzWZXjWtgX3UmwI5WSF67O8okv7um7KJ31JFCS6dtMAXT11TLVMeFDxkLPz8
         EynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=th9dM6ur5ptqhvYRUmVKLbFwuIqQif/Q5YDIPAzrV5o=;
        b=o1wwD/2W8lbfdubpUf1GE1bD9Ec+DXkFN0IzrV4vRR8X6lNarWj78AZmpr7y1+vzox
         6VUsSR5IkkI6xNi7FYNPvRmhLy+9mHcYmen0wv2QWeFwcA9HnrWsfo/KA3xp8+vHe+9H
         X8Zo1+11zWHIe/SWBC1NMGvH/J9kB/vWlK5G8xrway1SiCplBXBseX8zcKY+iKWPCIJg
         zjhzGHXXMlDuLflc0QgN6S67wxqn/vS1RRNQen0CUA7j6zUg+l+iSimtqak2WtovqVOk
         NIfMwkklaqDHtsnzZ3RhvXuP6h1bas9tI9dJyyqeHkMLnvlL712Bmj7esf0SoRN2r5Ai
         ezqQ==
X-Gm-Message-State: APjAAAVQFFP7pEh6CEcjgL2GkpFFmlvYa7LfReUCHBEw0If9Y/6/UfeO
        d9hDrZAz6+foYe+zlr9nRNKF
X-Google-Smtp-Source: APXvYqxTbs28lV9H8hzcG6YUV4yTJ5fYtYQmqEhRX+rPfB7YI+QbnE0U+nijaLZ5lWNBt+LwNcXuyA==
X-Received: by 2002:a63:6c09:: with SMTP id h9mr28290990pgc.34.1580281015090;
        Tue, 28 Jan 2020 22:56:55 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id m12sm1126551pjf.25.2020.01.28.22.56.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 22:56:53 -0800 (PST)
Date:   Wed, 29 Jan 2020 12:26:46 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, smohanad@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/16] bus: mhi: core: Add support for downloading
 firmware over BHIe
Message-ID: <20200129065645.GA25437@mani>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-9-manivannan.sadhasivam@linaro.org>
 <00e3d4f8-89ab-79f0-7094-90cc6d85fa41@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00e3d4f8-89ab-79f0-7094-90cc6d85fa41@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 28, 2020 at 12:36:04PM -0700, Jeffrey Hugo wrote:
> On 1/23/2020 4:18 AM, Manivannan Sadhasivam wrote:
> > MHI supports downloading the device firmware over BHI/BHIe (Boot Host
> > Interface) protocol. Hence, this commit adds necessary helpers, which
> > will be called during device power up stage.
> > 
> > This is based on the patch submitted by Sujeev Dias:
> > https://lkml.org/lkml/2018/7/9/989
> > 
> > Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
> > Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
> > [mani: splitted the data transfer patch and cleaned up for upstream]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/bus/mhi/core/boot.c     | 268 ++++++++++++++++++++++++++++++++
> >   drivers/bus/mhi/core/init.c     |   1 +
> >   drivers/bus/mhi/core/internal.h |   1 +
> >   3 files changed, 270 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> > index 0996f18c4281..36956fb6eff2 100644
> > --- a/drivers/bus/mhi/core/boot.c
> > +++ b/drivers/bus/mhi/core/boot.c
> > @@ -20,6 +20,121 @@
> >   #include <linux/wait.h>
> >   #include "internal.h"
> > +/* Download AMSS image to device */
> 
> Nit: I don't feel like this comment really adds any value.  I feel like it
> either should have more content, or be removed.  What do you think?

Okay, I think it can be removed.

> > +static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
> > +			    const struct mhi_buf *mhi_buf)
> > +{
> 
> 
> > +/* Download SBL image to device */
> 
> Same here.  Comment seems self evident from the function name.

Ack.

> > +static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
> > +			   dma_addr_t dma_addr,
> > +			   size_t size)
> > +{
> > +	u32 tx_status, val, session_id;
> > +	int i, ret;
> > +	void __iomem *base = mhi_cntrl->bhi;
> > +	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
> > +	struct {
> > +		char *name;
> > +		u32 offset;
> > +	} error_reg[] = {
> > +		{ "ERROR_CODE", BHI_ERRCODE },
> > +		{ "ERROR_DBG1", BHI_ERRDBG1 },
> > +		{ "ERROR_DBG2", BHI_ERRDBG2 },
> > +		{ "ERROR_DBG3", BHI_ERRDBG3 },
> > +		{ NULL },
> > +	};
> > +
> > +	read_lock_bh(pm_lock);
> > +	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> > +		read_unlock_bh(pm_lock);
> > +		goto invalid_pm_state;
> > +	}
> > +
> > +	/* Start SBL download via BHI protocol */
> 
> I'm wondering, what do you think about having a debug level message here
> that SBL is being loaded?  I think it would be handy for looking into the
> device state.
> 

Agree. will add.

> > +	mhi_write_reg(mhi_cntrl, base, BHI_STATUS, 0);
> > +	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH,
> > +		      upper_32_bits(dma_addr));
> > +	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_LOW,
> > +		      lower_32_bits(dma_addr));
> > +	mhi_write_reg(mhi_cntrl, base, BHI_IMGSIZE, size);
> > +	session_id = prandom_u32() & BHI_TXDB_SEQNUM_BMSK;
> > +	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
> > +	read_unlock_bh(pm_lock);
> > +
> > +
> > +static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
> > +			      const struct firmware *firmware,
> > +			      struct image_info *img_info)
> 
> Perhaps its just me, but the parameters on the second and third lines do not
> look aligned in the style used in the rest of the file.
> 

Yep, will fix it.

Thanks,
Mani

> 
> -- 
> Jeffrey Hugo
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
