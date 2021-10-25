Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50BA8439022
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 09:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbhJYHPn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 03:15:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:32882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231331AbhJYHPn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 03:15:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FC236008E;
        Mon, 25 Oct 2021 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635146001;
        bh=ZwPIhP5Fum4SkSbAuDdcea+11cJeBGh0IzPYNZOWN2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lOBd/kIbQHtMM/lhGRgXb34HCMMWKHqZ8O3gcTZGLfZyZhIqBOH0LoqY29N3U9w8m
         sdxSnBu/xq85wp7NSIOtboRRyyDcWsaEDnhtFYQjfWy45BzicSkhzP5m5WKArR1Eki
         B1ttumMRqyc4rGUft0G1mlxdoRlCcqBPIdb+7f1XOZS03Adc1ccN0eijLShq1Dibre
         RZ3WRV+c7oYsL5SinoyLXzHLkhvWVEHoNMhNJ6Ze2mrbOdbs2zeO071v957dIlDTO5
         eEIiXf8W6UHeMdJfZVIkv8Z2mkbUvbYnwUYPGTmIpEUA7IzR21HGpOSUOtqZhCn1WU
         Aky5DoH++XHIg==
Date:   Mon, 25 Oct 2021 12:43:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Subject: Re: [PATCH v2] phy: qcom-snps: Correct the FSEL_MASK
Message-ID: <YXZZDVIbgkhXFfGi@matsya>
References: <1635135575-5668-1-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635135575-5668-1-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25-10-21, 09:49, Sandeep Maheswaram wrote:
> The FSEL_MASK which selects the refclock is defined incorrectly.
> It should be [4:6] not [5:7]. Due to this incorrect definition, the BIT(7)
> in USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0 is reset which keeps PHY analog
> blocks ON during suspend.
> Fix this issue by correctly defining the FSEL_MASK.

Applied, thanks

-- 
~Vinod
