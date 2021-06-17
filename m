Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791B23ABDBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 23:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbhFQVDe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 17:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbhFQVDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 17:03:33 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B07C061574;
        Thu, 17 Jun 2021 14:01:25 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id u24so5578484edy.11;
        Thu, 17 Jun 2021 14:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=a/HxmvHmA8pdAxkn7QGHdM4E0SGB9zC2KOoZB/Dka+Q=;
        b=NDsttNsgqKosDt2zu+U7chzZ4TPupH7juUCioq9S+cArgUvHnc7w41RijxnYDKYrdZ
         ObR2INLqt5JzdkLy/CA6M403tsi0AHuUKGcxKzisCiMiXaVfEIIgaAHO33Rqs1XKkjmC
         xxFz2Mk1kynDcTbL3dGgFQ7MfJSeiwlVLSQTiTHViUHKyF8vflNPRrc2ylvDN4y+WSCf
         Pomu59F7oTy/3CSK53EQUcTWZL3+us1QW6gwwnh1IxRgl+x8qPqR6DDQcoMiueHSEPbm
         OXx70YGToXEan9J9UGLCnsHm+5vJJ2KfCwtTAeOIGsbTdYrsVt+276XQEMQ0ZBFYKgLx
         aQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=a/HxmvHmA8pdAxkn7QGHdM4E0SGB9zC2KOoZB/Dka+Q=;
        b=fHnoxqYUTXji8fvmI4ci7hbLI1pOpbX8tk4E95ECwXfsIwgL63WP0KZ+43oGdmtX5b
         60hwfPK4jIbGRJ4M9P44ibLwJq1CsbAcmcovY/Mfibcyda7kmLxLSIxWO+6uNaHugZXj
         6HoQ4B+OkXpgLqdD/P3oWSJleWJI1U9gqEvgEOzk4QcbZOk4r1Ffqzzp4J69ZYeGC4nY
         vafbIR6SDZYePTy+y7RvDwv+o6Y2vGkNg8vgxAEI9MgWmivubMK/LuDjCGcEPoVxXBRO
         0RuguYN72OiKUpenYSVUWRRDtHVaeLbt2FgSUGnZMWFOa4ijWl+0QjatQzVYyuc73+dQ
         xHGw==
X-Gm-Message-State: AOAM533JZ6KpR1xdJt2qcLxLRE0MPAWw0WkcfG6I//jL8prBHZEkmwD+
        gRlJxdmK7uLk5cGDXzxYD/k=
X-Google-Smtp-Source: ABdhPJw2l+aJObd4TDEpmmy+FfbZpHcGDGDZuxuj/Gxf0ExoF6SCDAB3M5LGfzMBeI6ndukVLEv4qQ==
X-Received: by 2002:aa7:d3c2:: with SMTP id o2mr314991edr.358.1623963683004;
        Thu, 17 Jun 2021 14:01:23 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:b75a:eaf2:6a00:ff84? ([2001:981:6fec:1:b75a:eaf2:6a00:ff84])
        by smtp.gmail.com with ESMTPSA id de24sm68633ejc.78.2021.06.17.14.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 14:01:22 -0700 (PDT)
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
To:     Wesley Cheng <wcheng@codeaurora.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, heikki.krogerus@linux.intel.com,
        andy.shevchenko@gmail.com
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <cfb83fe4-369c-ec72-7887-3bcb0f20fe15@gmail.com>
Date:   Thu, 17 Jun 2021 23:01:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

Op 17-06-2021 om 11:58 schreef Wesley Cheng:
> Changes in V10:
>   - Fixed compilation errors in config where OF is not used (error due to
>     unknown symbol for of_add_property()).  Add of_add_property() stub.
>   - Fixed compilation warning for incorrect argument being passed to dwc3_mdwidth
This fixes the OOPS I had in V9. I do not see any change in performance 
on Merrifield though.
> Changes in V9:
>   - Fixed incorrect patch in series.  Removed changes in DTSI, as dwc3-qcom will
>     add the property by default from the kernel.
>
> Changes in V8:
>   - Rebased to usb-testing
>   - Using devm_kzalloc for adding txfifo property in dwc3-qcom
>   - Removed DWC3 QCOM ACPI property for enabling the txfifo resize
>
> Changes in V7:
>   - Added a new property tx-fifo-max-num for limiting how much fifo space the
>     resizing logic can allocate for endpoints with large burst values.  This
>     can differ across platforms, and tie in closely with overall system latency.
>   - Added recommended checks for DWC32.
>   - Added changes to set the tx-fifo-resize property from dwc3-qcom by default
>     instead of modifying the current DTSI files.
>   - Added comments on all APIs/variables introduced.
>   - Updated the DWC3 YAML to include a better description of the tx-fifo-resize
>     property and added an entry for tx-fifo-max-num.
>
> Changes in V6:
>   - Rebased patches to usb-testing.
>   - Renamed to PATCH series instead of RFC.
>   - Checking for fs_descriptors instead of ss_descriptors for determining the
>     endpoint count for a particular configuration.
>   - Re-ordered patch series to fix patch dependencies.
>
> Changes in V5:
>   - Added check_config() logic, which is used to communicate the number of EPs
>     used in a particular configuration.  Based on this, the DWC3 gadget driver
>     has the ability to know the maximum number of eps utilized in all configs.
>     This helps reduce unnecessary allocation to unused eps, and will catch fifo
>     allocation issues at bind() time.
>   - Fixed variable declaration to single line per variable, and reverse xmas.
>   - Created a helper for fifo clearing, which is used by ep0.c
>
> Changes in V4:
>   - Removed struct dwc3* as an argument for dwc3_gadget_resize_tx_fifos()
>   - Removed WARN_ON(1) in case we run out of fifo space
>   
> Changes in V3:
>   - Removed "Reviewed-by" tags
>   - Renamed series back to RFC
>   - Modified logic to ensure that fifo_size is reset if we pass the minimum
>     threshold.  Tested with binding multiple FDs requesting 6 FIFOs.
>
> Changes in V2:
>   - Modified TXFIFO resizing logic to ensure that each EP is reserved a
>     FIFO.
>   - Removed dev_dbg() prints and fixed typos from patches
>   - Added some more description on the dt-bindings commit message
>
> Currently, there is no functionality to allow for resizing the TXFIFOs, and
> relying on the HW default setting for the TXFIFO depth.  In most cases, the
> HW default is probably sufficient, but for USB compositions that contain
> multiple functions that require EP bursting, the default settings
> might not be enough.  Also to note, the current SW will assign an EP to a
> function driver w/o checking to see if the TXFIFO size for that particular
> EP is large enough. (this is a problem if there are multiple HW defined
> values for the TXFIFO size)
>
> It is mentioned in the SNPS databook that a minimum of TX FIFO depth = 3
> is required for an EP that supports bursting.  Otherwise, there may be
> frequent occurences of bursts ending.  For high bandwidth functions,
> such as data tethering (protocols that support data aggregation), mass
> storage, and media transfer protocol (over FFS), the bMaxBurst value can be
> large, and a bigger TXFIFO depth may prove to be beneficial in terms of USB
> throughput. (which can be associated to system access latency, etc...)  It
> allows for a more consistent burst of traffic, w/o any interruptions, as
> data is readily available in the FIFO.
>
> With testing done using the mass storage function driver, the results show
> that with a larger TXFIFO depth, the bandwidth increased significantly.
>
> Test Parameters:
>   - Platform: Qualcomm SM8150
>   - bMaxBurst = 6
>   - USB req size = 256kB
>   - Num of USB reqs = 16
>   - USB Speed = Super-Speed
>   - Function Driver: Mass Storage (w/ ramdisk)
>   - Test Application: CrystalDiskMark
>
> Results:
>
> TXFIFO Depth = 3 max packets
>
> Test Case | Data Size | AVG tput (in MB/s)
> -------------------------------------------
> Sequential|1 GB x     |
> Read      |9 loops    | 193.60
> 	  |           | 195.86
>            |           | 184.77
>            |           | 193.60
> -------------------------------------------
>
> TXFIFO Depth = 6 max packets
>
> Test Case | Data Size | AVG tput (in MB/s)
> -------------------------------------------
> Sequential|1 GB x     |
> Read      |9 loops    | 287.35
> 	  |           | 304.94
>            |           | 289.64
>            |           | 293.61
> -------------------------------------------
>
> Wesley Cheng (6):
>    usb: gadget: udc: core: Introduce check_config to verify USB
>      configuration
>    usb: gadget: configfs: Check USB configuration before adding
>    usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
>    of: Add stub for of_add_property()
>    usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default
>    dt-bindings: usb: dwc3: Update dwc3 TX fifo properties
>
>   .../devicetree/bindings/usb/snps,dwc3.yaml         |  15 +-
>   drivers/usb/dwc3/core.c                            |   9 +
>   drivers/usb/dwc3/core.h                            |  15 ++
>   drivers/usb/dwc3/dwc3-qcom.c                       |   9 +
>   drivers/usb/dwc3/ep0.c                             |   2 +
>   drivers/usb/dwc3/gadget.c                          | 212 +++++++++++++++++++++
>   drivers/usb/gadget/configfs.c                      |  22 +++
>   drivers/usb/gadget/udc/core.c                      |  25 +++
>   include/linux/of.h                                 |   5 +
>   include/linux/usb/gadget.h                         |   5 +
>   10 files changed, 317 insertions(+), 2 deletions(-)
>
