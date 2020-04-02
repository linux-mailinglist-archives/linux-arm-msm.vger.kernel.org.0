Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1FF719CD3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 01:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389402AbgDBXBx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 19:01:53 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39500 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730837AbgDBXBx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 19:01:53 -0400
Received: by mail-pg1-f194.google.com with SMTP id g32so2561428pgb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 16:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ivgmu8ql9MIqzIoqCt0etuCnk5mWXFp3I+99jMUFazg=;
        b=xYUDuizcuBXOWSdOKLjj9RqEpCCOKjb80D/rN7bNyopVJuiPe+753NSU08D+7kv0aT
         orkf7W8QzVC3+uwOanfKaY/v6JsjQdQJlJKLcdr4tiWfe3c67uVXpOo6tv/Xz1+xlKn9
         qpbQpCfwSGYzxnG41vKWXuIMICmYeTdFezssHD1P4SL8ZrMGIhu9FySsuEjExWShREKB
         TTUDS6M5YX9wVMC/ioeHDa5O309e5GMwG0bLO0NxHKI1JnoHHKcjZ/8AWnbrMSxHv1Jc
         sw7F9kIx+McWywPynGRAWxurc/gMml0bGcDop3nhaCSrJfzIxC1n0dMHWrDGad18pqyC
         k2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ivgmu8ql9MIqzIoqCt0etuCnk5mWXFp3I+99jMUFazg=;
        b=jSYhmBoTY/GFd0jCCHIKLuyuWxpNsnH+u5UVHPDKTQfR7fGysuJTAXte3JHWOisjwW
         isFvhaMIjIyMyoEHDV2WzD7TIco9fYwsXUywkXnTBe45v7jdrNj7PIcsW4vN09bNs82d
         QxJ+xhmGJWu/ZYbMNMlHTGpzuup50E39MxKQeiHeYkTDbMjc5R6E4e8rj/DHPoX4vWwo
         KSWPAplWlIDTmbsN5Cpo+LYA+ou/MXTtdudQGOQtdJ3iBCp7VDXTFtnDVXluWGrIxC5t
         ihkBqLj/1vW6oPq0kLJBQYFSXMRdJgm/Mux3EX1KxcdAXgdIaEmsgIob/O1dip4hjMo/
         N+tA==
X-Gm-Message-State: AGi0PuaqCD+sbRHnvbz6vvTm6XNOpzlZgvVaTsxaPNJ4TPFrhvS2CWQ0
        wzRF52f0X1dZcAhMECttzQpboQ==
X-Google-Smtp-Source: APiQypL5/LfStOeab0OcKwThwxr24z7Cmxbk/ZFaXaeNwiyLIVT6DUr2htRho7DuNc+IhiT1ye7y/w==
X-Received: by 2002:a63:5050:: with SMTP id q16mr5368532pgl.118.1585868511671;
        Thu, 02 Apr 2020 16:01:51 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id nh14sm4492892pjb.17.2020.04.02.16.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 16:01:51 -0700 (PDT)
Date:   Thu, 2 Apr 2020 16:01:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy" compat
 string
Message-ID: <20200402230148.GA327013@minitux>
References: <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
 <20200402223723.7150-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402223723.7150-1-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 Apr 15:37 PDT 2020, John Stultz wrote:

> In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> as a generic compat string. However the change also removed
> the "qcom,sdm845-qusb2-phy" compat string, which is documented
> in the binding and already in use.
> 
> This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> which allows the driver to continue to work with existing dts
> entries such as found on the db845c.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
> Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 3708d43b7508..ab7941ce5d3a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -815,6 +815,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>  	}, {
>  		.compatible	= "qcom,msm8998-qusb2-phy",
>  		.data		= &msm8998_phy_cfg,
> +	}, {
> +		.compatible	= "qcom,sdm845-qusb2-phy",
> +		.data		= &qusb2_v2_phy_cfg,
>  	}, {
>  		.compatible	= "qcom,qusb2-v2-phy",
>  		.data		= &qusb2_v2_phy_cfg,
> -- 
> 2.17.1
> 
