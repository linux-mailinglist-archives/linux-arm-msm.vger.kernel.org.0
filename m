Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291091A6BBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 19:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387499AbgDMR5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 13:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387436AbgDMR5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 13:57:33 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45738C0A3BE2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:57:33 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w11so4765257pga.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FBJb5sqjJ8vOREAZLQxqAw0hd2Q6mzHw1XH+BWE4S8E=;
        b=XLwbkay2J5oAJWs36C6cPK2HFxTO3KM3W/zQs6rCSmGQaK4xerLfeznksjryD1/MuP
         wQKKt0Rjsy+dZYJ1EiF+YWQdZppOPhJKa7lRlf42mRg38VxpAHCFT+Gu79yUpOKiULGR
         9+uCXLityF76wxykB9c6hkQSYjd7o4T9op2vPzpXDSD39N0nq1aFcbhQ/zBnkLEYscYr
         +neMn8NUo6vKgDYY7wNZUeDtQrBkwACnMyG01nirfJptwFBN/nyijS4oY1E941zr0cog
         uF3mNO4eQ/En21OOBWDu2AlVJUdqwvcrdkfujshC7QjGTD2MOHBD2/xBORppxlqigzw3
         q9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FBJb5sqjJ8vOREAZLQxqAw0hd2Q6mzHw1XH+BWE4S8E=;
        b=qeVocA4820rkpYyHds9AF6Le4Uz34OHcvrFMKl94Yq3V7dQ7TM7Lj7MsZijcKZY4UH
         mJ1v+j7ve+FBqPCHjDLMq/TjG9G+3OZMSA0CS0HH9qbfNWnOEd50IWIfz0pOgR1T2GBW
         0dwPk0d+zb4sc6UEOtTspIdL4LCosLpvI2ObpuUit1N8lMbs+DDYdqJBLLuAxLMm6r8+
         Ikbf2SLlOQHc7Y7caquAz14G5pzCcO4qLCyq+32gOMpfDcNIlXosvPl1ht2//bZ4U7H7
         R2pjOyO/KBtYIdnYJKGFLRP0DO2t/iw7tJgGHPjPedzVGqykX8tbSXt4siZ0XVk41aO4
         tobw==
X-Gm-Message-State: AGi0PuYHHjT2d6TxbW6lvuD4BPzj5YcZcmKbT8MGcULv70KsKYtfxJGw
        xeLmmXZBMfVYReO6WYIGmRjupA==
X-Google-Smtp-Source: APiQypK6cKhDRMHxFaHeoAg59jflJori9ZnZXsx30TY30ANqzFw43ayR1RkRqyTeoHnE0A26J4LGjQ==
X-Received: by 2002:a63:f50c:: with SMTP id w12mr17922741pgh.253.1586800652111;
        Mon, 13 Apr 2020 10:57:32 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id a2sm1281987pgk.90.2020.04.13.10.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 10:57:31 -0700 (PDT)
Date:   Mon, 13 Apr 2020 11:56:50 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>, mike.leach@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv2 0/3] Add coresight support for QCOM SC7180 SoC
Message-ID: <20200413175650.GD28804@xps15>
References: <cover.1586263250.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1586263250.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 09, 2020 at 05:13:35PM +0530, Sai Prakash Ranjan wrote:
> Patch 1 adds the ETM UCI IDs for Kryo 4XX CPU cores.
> Patch 2 adds the DT nodes for coresight components on SC7180.
> Patch 3 replaces ETM PIDs with UCI IDs for Kryo385 CPUs on SDM845.

I have picked up patches 1 and 3.

Thanks,
Mathieu

> 
> v2:
>  * Placed the DT properties for ports in one line as suggested by Stephen.
>  * Add UCI IDs for SC7180 and SDM845(Kryo385 CPUs) as suggested by Suzuki.
> 
> Sai Prakash Ranjan (3):
>   coresight: etm4x: Add support for Qualcomm SC7180 SoC
>   arm64: dts: qcom: sc7180: Add Coresight support
>   coresight: etm4x: Replace ETM PIDs with UCI IDs for Kryo385
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi          | 471 ++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-etm4x.c |   6 +-
>  2 files changed, 475 insertions(+), 2 deletions(-)
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
