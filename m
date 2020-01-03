Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAE1A12FA53
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 17:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgACQ1x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 11:27:53 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39549 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgACQ1x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 11:27:53 -0500
Received: by mail-pg1-f195.google.com with SMTP id b137so23637160pga.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2020 08:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=33dsCIgAR3kkrj/HyLA+MOtjELdYiGU1cvZNVffuQbs=;
        b=ZxWVKi/uIvIzb3s0YrlqjyFM0PmX1WICoZ9XdMQIbH9dAAkVNhoh36hpVoJXLmxnFu
         ws7AzSHV0GEHyg4eUvdee6Pqus3RyUCMDCpD5+Z/nxSYSkeYeXtgRthVxjelhPRQYc9f
         UEONG1vq0VHalAJJxdnyBxfZHIUdsunOMwNHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=33dsCIgAR3kkrj/HyLA+MOtjELdYiGU1cvZNVffuQbs=;
        b=q/KCypBTu+04yrWybnZCdacO7q3rk9DNa8j/U30LVaWGe+eXpPwJ6ksXhgFdd7qd97
         TMkqLCCW6KJ8zQiWibSjYyH3sMtZqmL+j637lQpX01Y0QKI61FLUZeNwaBOvbfyDF7yz
         uGfUftXV70YpWYv3yAlzW5wNLGUSYAdwaJPxsF0PnfMzGzww9iC1LM2Z/OizvnDkfaPE
         UIJHVjMyL8cUegZnTisSnGfePuVM+JkEOEOv4tfWhyY8lGIicXMPsWCMaNdO7rJEnLfZ
         2zLo7vZttXlxD7Hk+IlRFJovbvx8tqPpdYZmcEmH4P+FquZ/Da6GN3H/ERabF/1hh7Ea
         4AMQ==
X-Gm-Message-State: APjAAAV1Al5OPqORRPHq6IZC6gJ5TcEoOMZ1p9cXQJ1i8G5zO8Sy7ZDn
        E2HvAXO9oopHbjOzpX/Ue/Ewsw==
X-Google-Smtp-Source: APXvYqxRbZkLx4fQgVo+LYxq4qtEYmuXQe0im32uk0JrjuimlgEL0iSTdu5/k/HL47fPoblTKn9qCg==
X-Received: by 2002:a62:7683:: with SMTP id r125mr96926787pfc.132.1578068872366;
        Fri, 03 Jan 2020 08:27:52 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b1sm15102429pjw.4.2020.01.03.08.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2020 08:27:51 -0800 (PST)
Date:   Fri, 3 Jan 2020 08:27:50 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     rjliao@codeaurora.org
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH v3 2/4] Bluetooth: hci_qca: Retry btsoc initialize when
 it fails
Message-ID: <20200103162750.GC89495@google.com>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20191227072130.29431-1-rjliao@codeaurora.org>
 <20191227072130.29431-2-rjliao@codeaurora.org>
 <20200102184116.GA89495@google.com>
 <bfba08a185c81f82d3e05ec03b5ddd65@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bfba08a185c81f82d3e05ec03b5ddd65@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 03, 2020 at 02:31:46PM +0800, rjliao@codeaurora.org wrote:
> 在 2020-01-03 02:41，Matthias Kaehlcke 写道：
> 
> > Hi Rocky,
> > 
> > On Fri, Dec 27, 2019 at 03:21:28PM +0800, Rocky Liao wrote:
> > 
> > > This patch adds the retry of btsoc initialization when it fails.
> > > There are
> > > reports that the btsoc initialization may fail on some platforms but
> > > the
> > > repro ratio is very low. The failure may be caused by UART, platform
> > > HW or
> > > the btsoc itself but it's very difficlut to root cause, given the
> > > repro
> > > ratio is very low. Add a retry for the btsoc initialization will
> > > resolve
> > > most of the failures and make Bluetooth finally works.
> > 
> > Is this problem specific to a certain chipset?
> > 
> > What are the symptoms?
> 
> It's reported on Rome so far but I think the patch is potentially helpful
> for
> wcn399x as well.
> 
> The symptoms is the firmware downloading failed due to the UART write timed
> out.

Working around this with retries seems ok for now if the repro rate is
really low, but it shouldn't necessarily be interpreted as "the problem is
fixed". Please mention the symptoms in the commit message for documentation,
then the retries can potentially be removed in the futures when the root
cause is fixed.

> > > enum qca_btsoc_type soc_type = qca_soc_type(hu);
> > > const char *firmware_name = qca_get_firmware_name(hu);
> > > int ret;
> > > @@ -1275,6 +1280,7 @@ static int qca_setup(struct hci_uart *hu)
> > > */
> > > set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
> > > 
> > > +retry:
> > > if (qca_is_wcn399x(soc_type)) {
> > > bt_dev_info(hdev, "setting up wcn3990");
> > > 
> > > @@ -1293,6 +1299,12 @@ static int qca_setup(struct hci_uart *hu)
> > > return ret;
> > > } else {
> > > bt_dev_info(hdev, "ROME setup");
> > > +        if (hu->serdev) {
> > > +            qcadev = serdev_device_get_drvdata(hu->serdev);
> > > +            gpiod_set_value_cansleep(qcadev->bt_en, 1);
> > > +            /* Controller needs time to bootup. */
> > > +            msleep(150);
> > 
> > Shouldn't this be in qca_power_on(), analogous to the power off code
> > from
> > "[1/4]Bluetooth: hci_qca: Add QCA Rome power off support to the
> > qca_power_off()"?
> > 
> > qca_power_on() should then also be called for ROME. If you opt for this
> > it
> > should be done in a separate patch, or possibly merged into the one
> > mentioned above.
> > 
> 
> There is no qca_power_on() func and wcn399x is calling qca_wcn3990_init() to
> do power on, I prefer to not do this change this time.

I would say it's precisely the right time to add this function. Patch 1 of this
series adds handling of the BT_EN GPIO to qca_power_off(), now this patch
duplicates the code of the BT_EN handling in qca_open().

> If it's needed

'needed' is a relative term. It certainly isn't needed from a purely functional
POV. However it is desirable for encapsulation and to avoid code duplication.

> it should be a new patch to add qca_power_on() which supports both Rome and wcn399x.

Agreed

m.
