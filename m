Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 853A7440815
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Oct 2021 10:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbhJ3JAb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Oct 2021 05:00:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:51178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230427AbhJ3JAa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Oct 2021 05:00:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA6CB60F58;
        Sat, 30 Oct 2021 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1635584280;
        bh=ZLezgHFxQv+bwUymquKkOIMuuk0otT01ybewMqW1B2A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QXFLUqvE/pmjqynuplphgdRg+dhKgKBaUVlKY1fA1znsNcRlY1l8g19DwgeUe2GmZ
         r78p9D5WreqUhXfoCfa4B97gp+k5+yMLsKWR5bBPtI/Y8WMKs3/T0HmB+Uca9YEiF+
         Dlxf7155dziMwQIlEFhCp/RyJpqFSXZUnNJ8Oa1w=
Date:   Sat, 30 Oct 2021 10:57:58 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Subject: Re: [PATCH 3/3] usb: dwc: host: Set the property usb-skip-phy-init
Message-ID: <YX0JFnJPEbJIKSKf@kroah.com>
References: <1635272372-9982-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635272372-9982-4-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635272372-9982-4-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 26, 2021 at 11:49:32PM +0530, Sandeep Maheswaram wrote:
> dwc3 manages PHY by own DRD driver, so skip the management by
> HCD core.
> During runtime suspend phy was not getting suspend because
> runtime_usage value is 2.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>  drivers/usb/dwc3/host.c | 2 ++
>  1 file changed, 2 insertions(+)

Subject line should have "dwc3" not "dwc", right?

thanks,

greg k-h
