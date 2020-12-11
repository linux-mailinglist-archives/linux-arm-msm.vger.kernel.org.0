Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1F12D6E5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 04:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405135AbgLKDLe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 22:11:34 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46630 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405134AbgLKDLb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 22:11:31 -0500
Received: by mail-oi1-f196.google.com with SMTP id k2so8274294oic.13;
        Thu, 10 Dec 2020 19:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tu067TpaB9PCMyvvrsvX5fcmi9Ir5wjw+1Sw+k4PlDM=;
        b=lwwqZ7MNcc+yCtTk4E5hsfVEtF/1BP8N+oacDDNtnsmO95cRGoddSXHpjDXKHuuaux
         7l2GDvUIstvqNmAVNT0QCurG4mSBFbTlm7LuaGVQaRrz/FEl8QOk1yHPl8uSiWdkI6UE
         kqqBfQtawY2dwiqA3bd+AyEDBf8mBla4puP339CN7ZR/u+sVxqq2PHs6RjGn3HdM2BWl
         iopEeAYtvd2eSTrpzQsNLgwizGlw8Oz5WsMmCJCVDcqRIHDPQGDOHEVOn+ZaBTpgB9/r
         iSLcQpHel+VwYmObNJ7fKo7358lpcQ5THIArLCIcyIxsgE7KYi8KTxuNYYtTyIahZYng
         +EUw==
X-Gm-Message-State: AOAM531NWlp8YE1i6ABieOxHX02+lfV/wUfNfTUMAwe6dzwR4M+Mug02
        xCCYrjuPlJCYOAE9ZSSr5w==
X-Google-Smtp-Source: ABdhPJz404yyWZCLnZ4Y4Y4ugQeU+Af7ANyg/ZU7p0kKnrLfiv+qFcECo4jhUAQPk7gqzbgT8JDXyA==
X-Received: by 2002:aca:470e:: with SMTP id u14mr7602980oia.172.1607656250804;
        Thu, 10 Dec 2020 19:10:50 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 109sm1565698otj.12.2020.12.10.19.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 19:10:49 -0800 (PST)
Received: (nullmailer pid 3553226 invoked by uid 1000);
        Fri, 11 Dec 2020 03:10:48 -0000
Date:   Thu, 10 Dec 2020 21:10:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        richard@nod.at, vigneshr@ti.com, bjorn.andersson@linaro.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add support for Qcom SMEM based NAND parser
Message-ID: <20201211031048.GA3552046@robh.at.kernel.org>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
 <20201210040942.GD6466@thinkpad>
 <20201210222447.63f5dbcf@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210222447.63f5dbcf@xps13>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 10, 2020 at 10:24:47PM +0100, Miquel Raynal wrote:
> Hi Manivannan,
> 
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Thu,
> 10 Dec 2020 09:39:42 +0530:
> 
> > Hi,
> > 
> > On Thu, Nov 19, 2020 at 12:43:04PM +0530, Manivannan Sadhasivam wrote:
> > > Hello,
> > > 
> > > This series adds support for parsing the partitions defined in Shared
> > > Memory (SMEM) of the Qualcomm platforms supporting NAND interface.
> > > Current parser only supports V3 and V4 of the partition tables.
> > > 
> > > This series has been tested on SDX55 MTP board which has an onboard NAND
> > > device.
> > >   
> > 
> > Any update on this series?
> 
> Patches lgtm, I think Rob's Ack is still missing, let's wait for his
> review.

Perhaps answer my reply on Dec 7.

Rob
