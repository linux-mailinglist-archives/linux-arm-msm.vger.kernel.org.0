Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E95330F58
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 14:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhCHNfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 08:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbhCHNfA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 08:35:00 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2264C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Mar 2021 05:35:00 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id t29so7051793pfg.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Mar 2021 05:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nFq9IUrqTM3+0MdXot9pV1py85hqvVYW3bJyV6Rfqho=;
        b=PsJDgGkOaOjHNBPvMCcrJCuIHARyjccomzLz5rJzj36YbJgFBR8LX90ZU1gQcAZULC
         dUmPf9UDI2ZR0T1BxQy2aHqKHXA+2gJoG5FXg9tKYKYCFkP9506fAt6NYMuXiCdBNPaY
         Awu0WtBMNXhtNEmK+hq7XqZ3ij09532rixoxCtYvGrHe5vgASah7WAK5hBhntYauHiUN
         vMiIia1+xdW+/IDDi9XSUfTZATNcSd9HwxaFbRVBt+Uu6aM7/FhrDLx/UmFevrZ2IoOu
         +IDlYvr3dd0FIsZuc57YgWb/UFwNQ3h+bVBN+BDZnRrpD11x7DF38AX0UktkfeRei5RB
         jlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nFq9IUrqTM3+0MdXot9pV1py85hqvVYW3bJyV6Rfqho=;
        b=OdsZSTouEPj0/cA0naxt5P8sK3+EG9/giu0O6p0WK4qwvyX3s5zPQu1Ft0pzIrYEf5
         ZD/quircU48D0HxqeFud5SlZpvAqD7WV3BtJOSF52Jr7S0u898WPzRNR0lGHiGea88I4
         5yLG4iT/fouAL3vKkT18eQ4oo0sx7YxA6Xwjj9FodFccGjAVTUJMOhpJ0aw671h9sdDW
         wFLGSz1+jfBcNLNaWN+M9F2XNs9f2RrcwSo58RlcXOo4BlpnWYbph5eFBxVW1oiiqwda
         Q70gEiohNwVlDaxnnsZALXGswciRrS3N15YUo/RiI3V4QOO3AHjtok7SHC8OvN0oUlKn
         1aqQ==
X-Gm-Message-State: AOAM533N0Zcu+0kOK5DTBqbEhnNcUcm5d42WGDZhVBaaY4fGvvCRmPWG
        mqAQNk6hxip+KkWmqOjhV2uK
X-Google-Smtp-Source: ABdhPJzDVMzIThcvYLdQZZIGll9N0HceTj2bSkrfitIpzskFrFoRjjO+2S0+FEbJyMrq1KLFBMe7Zw==
X-Received: by 2002:a65:46cd:: with SMTP id n13mr20197023pgr.414.1615210500202;
        Mon, 08 Mar 2021 05:35:00 -0800 (PST)
Received: from thinkpad ([2409:4072:638a:aee8:50fe:f77:990e:395b])
        by smtp.gmail.com with ESMTPSA id c24sm7238618pfi.193.2021.03.08.05.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 05:34:59 -0800 (PST)
Date:   Mon, 8 Mar 2021 19:04:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v4 3/3] mtd: rawnand: qcom: Add support for secure
 regions in NAND memory
Message-ID: <20210308133452.GE5457@thinkpad>
References: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
 <20210308054447.28418-4-manivannan.sadhasivam@linaro.org>
 <20210308100247.4aba657c@collabora.com>
 <20210308133410.GD5457@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308133410.GD5457@thinkpad>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 08, 2021 at 07:04:17PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Mar 08, 2021 at 10:02:47AM +0100, Boris Brezillon wrote:
> > On Mon,  8 Mar 2021 11:14:47 +0530
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > 
> 
> [...]
> 
> > >  /* helper to configure address register values */
> > > -static void set_address(struct qcom_nand_host *host, u16 column, int page)
> > > +static int set_address(struct qcom_nand_host *host, u16 column, int page)
> > >  {
> > >  	struct nand_chip *chip = &host->chip;
> > >  	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
> > > +	u32 offs = page << chip->page_shift;
> > > +	int i, j;
> > > +
> > > +	/* Skip touching the secure regions if present */
> > > +	for (i = 0, j = 0; i < host->nr_sec_regions; i++, j += 2) {
> > > +		if (offs >= host->sec_regions[j] &&
> > > +		    (offs <= host->sec_regions[j] + host->sec_regions[j + 1]))
> > > +			return -EIO;
> > > +	}
> > 
> > Hm, not sure that's a good idea to make this check part of
> > set_address(). Looks like set_address() can be used for ONFI page
> > access too, and you definitely don't want to block those
> > requests. I'd recommend having a separate helper that you can call from
> > qcom_nandc_{read,write}_{oob,page,page_raw}().
> > 
> 
> Right but I went for the code simplicity :/ Anyway, since you're favoring
> towards moving this check into code, I'll incorporate your suggestion

s/code/core

> accordingly.
> 
> Thanks,
> Mani
