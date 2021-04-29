Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42EF36EC20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 16:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237392AbhD2OKN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 10:10:13 -0400
Received: from cpanel8.indieserve.net ([199.212.143.3]:33678 "EHLO
        cpanel8.indieserve.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234473AbhD2OKL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 10:10:11 -0400
X-Greylist: delayed 1551 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Apr 2021 10:10:10 EDT
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:48964 helo=fedora)
        by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <rpjday@crashcourse.ca>)
        id 1lc6wx-0005dy-Lx; Thu, 29 Apr 2021 09:43:28 -0400
Date:   Thu, 29 Apr 2021 09:43:23 -0400 (EDT)
From:   "Robert P. J. Day" <rpjday@crashcourse.ca>
To:     Doug Anderson <dianders@chromium.org>
cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7280: Add "google,senor" to the
 compatible
In-Reply-To: <CAD=FV=UUowpvn_2uPrOQG9hOCdX6GYZDojBdW+w8hg5q6PfvAQ@mail.gmail.com>
Message-ID: <a26e7152-208e-3343-a9f8-8dfdeb222aeb@crashcourse.ca>
References: <1619674827-26650-1-git-send-email-rnayak@codeaurora.org> <1619674827-26650-2-git-send-email-rnayak@codeaurora.org> <CAD=FV=UUowpvn_2uPrOQG9hOCdX6GYZDojBdW+w8hg5q6PfvAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 29 Apr 2021, Doug Anderson wrote:

> Hi,
>
> On Wed, Apr 28, 2021 at 10:40 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> >
> > The sc7280 IDP board is also called senor in the Chrome OS builds.
> > Add the "google,senor" compatible so coreboot/depthcharge knows what
> > device tree blob to pick
> >
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

  subject line contains "google,senor"

rday
