Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8C51A0F3C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 16:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729244AbgDGObb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 10:31:31 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:45873 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729233AbgDGObb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 10:31:31 -0400
Received: by mail-pg1-f177.google.com with SMTP id o26so1795299pgc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 07:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ObtKnGJjYoZHLBqwiwGrDa+oVtYXQeCpEq1Q63Vw3uI=;
        b=J61iobuOT3KxSXf2lVDP59Whdf2VZCzfFg8GzEownHBXohoUE8Oo3cCYXvvr+bpdCL
         HXUWc63iVsnCoKYc2hnhQB5Tumay+hNyILNC1pwn++B95+4BUzShOUaMiuPBTVLOUiJg
         RI6/OV1cfiQ/ZCR40IvBio1q8hJfE9/yc7wU/Iy36NjTDPSEII328RS7Eno4xCA9/bA/
         Tu+VihTpEhBrOfkHSui2PQMSbYC1bIBfgD3rtBJuFCzvVFe6UlHWhl9t9yIwMKH6ECiH
         c1k1bVjKvvkZ7W7TljaFEM7/7+EUL3oXM038R4gMsJAxSLeqiKaiuse6UHTr+OODHkk9
         FjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ObtKnGJjYoZHLBqwiwGrDa+oVtYXQeCpEq1Q63Vw3uI=;
        b=QUJaCfLpx1dvsH+v+swJMUMRMDGzMzgtBcYX5XeB+kib44SmrA9sbtakLp1zy1BPFA
         wfxH/Wr3uJfNqNWKH0hFSIjdqeyEBd+Py2+LndG2P/q1BTZ6cJ5HWooJ/trtl7OyJNRW
         hW98X+6s4K2YqCDKadNEuvMZwe8Quh6dwrt+JrxPMukb9QZdNisO3OErmCBYbxasfbk8
         /JaEDGmHdhk8ToASouAYq0jviCjweQLFyEbk9dkGZ2bsA0mHaqT89FD54M8lidCaFwi3
         yTOfBIZK3aF2FxxGf7vzTbhhAhfcIdlvbdMsBXYMFCIWJktCFUM4k91oqqeR76Uj01jt
         i/cA==
X-Gm-Message-State: AGi0Pua74WDlyOEiZzRsC6AaeSdWFcM2idKO9hJfuqCjZlyhR4qtsuIg
        esPRbbC9RVzBXK9eRliD3iDueqEN7A==
X-Google-Smtp-Source: APiQypId3Wv91Ue+ozaCDAqGgsYFNYotdlxOgISEAQAtSlE6CH4Md140oM0mnUS+KUDyLL56nKxaaQ==
X-Received: by 2002:aa7:9a8e:: with SMTP id w14mr2848652pfi.113.1586269889523;
        Tue, 07 Apr 2020 07:31:29 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e86:d03b:65ee:cb40:6d79:8376])
        by smtp.gmail.com with ESMTPSA id c4sm5506754pgg.17.2020.04.07.07.31.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 07:31:28 -0700 (PDT)
Date:   Tue, 7 Apr 2020 20:01:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
Message-ID: <20200407143123.GG2442@Mani-XPS-13-9360>
References: <20200407135608.GA109647@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407135608.GA109647@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dan,

On Tue, Apr 07, 2020 at 04:56:08PM +0300, Dan Carpenter wrote:
> Hello Manivannan Sadhasivam,
> 
> The patch 189ff97cca53: "bus: mhi: core: Add support for data
> transfer" from Feb 20, 2020, leads to the following static checker
> warning:
> 
> 	drivers/bus/mhi/core/main.c:1093 mhi_gen_tre()
> 	warn: bitwise AND condition is false here
> 
> drivers/bus/mhi/core/main.c
>   1088  
>   1089          ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
>   1090          if (ret)
>   1091                  return ret;
>   1092  
>   1093          eob = !!(flags & MHI_EOB);
>                                  ^^^^^^^
> This is zero.  Was BIT(0) intended?
>

Darn. The `enum mhi_flags` is supposed to start with 1. I'll fix it
with your Reported-by tag.

Btw, which static checker you are using? I did try sparse and W=2.

Thanks,
Mani
 
>   1094          eot = !!(flags & MHI_EOT);
>   1095          chain = !!(flags & MHI_CHAIN);
>   1096          bei = !!(mhi_chan->intmod);
>   1097  
>   1098          mhi_tre = tre_ring->wp;
>   1099          mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
> 
> regards,
> dan carpenter
