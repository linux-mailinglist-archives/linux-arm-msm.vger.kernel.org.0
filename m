Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FFB334C84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 00:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbhCJX30 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 18:29:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbhCJX2u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 18:28:50 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECA6C061761
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 15:28:49 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id j8so18231399otc.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 15:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CcpjnFhs+hD8NIsHxenerG7IM+48zY0/1AwqAoJFhWQ=;
        b=bKne5DjbZE9XY5B/uBertZFJs2UrcfISuG2Z5FAP3+P4BEi8k0hijfCeLcQT4EOmM3
         hD0sukxdht/nOTSaCOmDUJ3aYZElo+UBaqA5JmmA76TDHs2O4fXRP5XaHNzYO2pocp8K
         cS2e4pHyf9tHqtF1OSQQTgBHvp/8UovsFmwXnK0Ob8+bO65/QhaII/fTFMK8e+SgeQPr
         hROoy/oKmFS/J6oFxe+Gu1CN8MaQdiKokHTgcw02pKhWGE4OK3hmvaVVPwhxBmQFodS9
         uoYu0OOKh4XiHQPMXAOgbrGaK7hfd6ybeVDXmOkuQE+fjIUyfZnz9ArTIUtilhjl+BFJ
         j/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CcpjnFhs+hD8NIsHxenerG7IM+48zY0/1AwqAoJFhWQ=;
        b=BjXrFGmM5MiOeILj7r9PwSDuUSN/zyL8yX9pEZKRLXtKbKD81SKQ60DcceP6y3l4zw
         XMBHn4CrDthk2OlCgc+DCR8QO/qtThjxL2JlSjJKGO6Y/oSqkLX4azYAK4Et1WgZLJl5
         l872kfqM6Wad8Ko6tTizfZc72Lt2NWE1ZpLa3n9+2m5Z7TVpYGZnr2dCwnYja5t1Swu+
         Levly7PATHjs0vxQGJiRNC2IHpl+tnpx1PzTdd99v6899vJl3IbugSyJIKck32sUgdp5
         YecVk/bcWHlWXRwkoLIOszv7JfElQmHVYA3yZxLWuLzMZNj/ujIX095uL9ndd/A40dqW
         FwoA==
X-Gm-Message-State: AOAM533I8rlx4RDfHQGwld+r6ZosAWcn7gY9Xiua8RhOYJ1Zsgt+4wT3
        wY9QUYRZC4FUsTjkq0IQjWwaNQ==
X-Google-Smtp-Source: ABdhPJz52c30YvfDi3Kw8yjoSTmqG5ij8W6ebHqwnKKKCm0AFJvEKyzkQvQrGgaK4stz861b2WS8KA==
X-Received: by 2002:a9d:6a50:: with SMTP id h16mr4504158otn.67.1615418929055;
        Wed, 10 Mar 2021 15:28:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g21sm183373ooa.15.2021.03.10.15.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 15:28:48 -0800 (PST)
Date:   Wed, 10 Mar 2021 17:28:46 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V1 4/6] DCC: Added the sysfs entries for DCC(Data Capture
 and Compare) driver
Message-ID: <YElWLqemavtXGlPd@builder.lan>
References: <cover.1615393454.git.schowdhu@codeaurora.org>
 <332477ea39088fca5879af1a5278c289e1602f6d.1615393454.git.schowdhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <332477ea39088fca5879af1a5278c289e1602f6d.1615393454.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Mar 10:46 CST 2021, Souradeep Chowdhury wrote:

> The DCC is a DMA engine designed to store register values either in
> case of a system crash or in case of software triggers manually done
> by the user. Using DCC hardware and the sysfs interface of the driver
> the user can exploit various functionalities of DCC. The user can specify
> the register addresses, the values of which is stored by DCC in it's
> dedicated SRAM. The register addresses can be used either to read from,
> write to, first read and store value and then write or to loop. All these
> options can be exploited using the sysfs interface given to the user.
> Following are the sysfs interfaces exposed in DCC driver which are
> documented
> 1)trigger
> 2)config
> 3)config_write
> 4)config_reset
> 5)enable
> 6)rd_mod_wr
> 7)loop
> 
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  Documentation/ABI/testing/sysfs-driver-dcc | 74 ++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-dcc
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-dcc b/Documentation/ABI/testing/sysfs-driver-dcc
> new file mode 100644
> index 0000000..7a855ca
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-dcc
> @@ -0,0 +1,74 @@
> +What:           /sys/bus/platform/devices/.../trigger
> +Date:           February 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +		This file allows the software trigger to be enabled
> +		by the user through the sysfs interface.Through this
> +		interface the user can manually start a software trigger
> +		in dcc where by the dcc driver stores the current status
> +		of the specified registers in dcc sram.
> +
> +What:           /sys/bus/platform/devices/.../enable
> +Date:           February 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +		This file allows the user to manually enable or
> +		disable dcc driver.The dcc hardware needs to be
> +		enabled before use.
> +
> +What:           /sys/bus/platform/devices/.../config
> +Date:           February 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +		This file allows user to configure the register values
> +		along with addresses to the dcc driver.This register
> +		addresses are used to read from,write or loop through.
> +		To enable all these options separate sysfs files have
> +		are created.

Please describe the expected content of this file.

> +
> +What:           /sys/bus/platform/devices/.../config_write
> +Date:           February 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +		This file allows user to write a value to the register
> +		address given as argument.The values are entered in the
> +		form of <register_address> <value>.

So it's just a generic 'write some user defined data to some user
defined register'? This doesn't sound like the typical way things are
exposed in sysfs.

> +
> +What:           /sys/bus/platform/devices/.../config_reset
> +Date:           February 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +		This file is used to reset the configuration of
> +		a dcc driver to the default configuration.
> +
> +What:           /sys/bus/platform/devices/.../loop
> +Date:           February 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +		This file is used to enter the loop count as dcc
> +		driver gives the option to loop multiple times on
> +		the same register and store the values for each
> +		loop.
> +
> +What:           /sys/bus/platform/devices/.../rd_mod_wr
> +Date:           February 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +		This file is used to read the value of the register
> +		and then write the value given as an argument to the
> +		register address in config.The address argument should
> +		be given of the form <mask> <value>.
> +
> +What:           /sys/bus/platform/devices/.../ready
> +Date:           February 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +		This file is used to check the status of the dcc
> +		hardware if it's ready to take the inputs.
> +
> +What:		/sys/bus/platform/devices/.../curr_list
> +Date:		February 2021
> +Contact:	Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +		This file is used to configure the linkedlist data
> +		to be used while configuring addresses.

Please describe the format of this attr. Is it read/write?

Regards,
Bjorn

> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
