Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20CE3D0D37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 13:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236551AbhGUKb0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 06:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239041AbhGUJlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 05:41:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417DDC061766
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 03:21:30 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1m69Lv-0004IC-NI; Wed, 21 Jul 2021 12:21:23 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1m69Lv-0005Dv-6W; Wed, 21 Jul 2021 12:21:23 +0200
Message-ID: <4a6a248080524a193a0b9fd7fef8156934f3a2cb.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/5] reset: qcom: Add PDC Global reset signals for
 WPSS
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>, robh+dt@kernel.org,
        sboyd@kernel.org, agross@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 21 Jul 2021 12:21:23 +0200
In-Reply-To: <YLVdhU3Zz/TWtwCX@builder.lan>
References: <1619508824-14413-1-git-send-email-sibis@codeaurora.org>
         <1619508824-14413-5-git-send-email-sibis@codeaurora.org>
         <0c5f747fe0a3f757a4160e4fd28cc2b56a57a39d.camel@pengutronix.de>
         <YLVdhU3Zz/TWtwCX@builder.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Mon, 2021-05-31 at 17:04 -0500, Bjorn Andersson wrote:
> On Tue 27 Apr 02:58 CDT 2021, Philipp Zabel wrote:
> 
> > Hi Sibi,
> > 
> > On Tue, 2021-04-27 at 13:03 +0530, Sibi Sankar wrote:
> [..]
> > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > 
> > for the whole series to go through the qcom tree, or let me know if you
> > want me to pick up patches 2-4 next round.
> > 
> 
> Philipp, please do take patch 2-4 through your tree, that way we avoid
> any potential conflicts in the driver - and things will come together
> nicely for validation in linux-next anyways.

FTR, Patches 2-4 of v3 are now applied to reset/next.

regards
Philipp
