Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D69421FA0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 09:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbhJEHtE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 03:49:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:36616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232809AbhJEHtD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 03:49:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FFF761251;
        Tue,  5 Oct 2021 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633420033;
        bh=PLKm3SW5pvzWVqjufcsaKBrj3v0KlToIF4EnLL+WrIg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rWjya8zaTaurPSb3ypmHrY7FnSzLtTFPupaL+GI16OjF5I1OpWNlg5UUouNxVn13S
         0Dd3ovDKeS/VJ6JUUAZ1yfimNl0tgraTSo5iwVgAtO2JyQFo0Xc6boCzALhfsIrA/Q
         ZwbvU/YQf8mh+lSjYv3aFPnswmiEV3OevubqmJz+OZ3QK4bEi5KhQGalbLcX7+/YWo
         1K/Am/XrbGlVUbGooaJrUYnkpYmUX0C/FmW1Lkk4NISJpm6jaqAt58mEIqOSYU3EEI
         yqlWApTnAgPqouQIltgnzXau9fXS5H9ta93HmpBdcFVmLL3WBduweDkbUllJzEWXyG
         aYkRXkBlbPUGg==
Date:   Tue, 5 Oct 2021 13:17:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jami Kettunen <jamipkettunen@gmail.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add missing vdd-supply for QUSB2 PHY
Message-ID: <YVwC/L25ss0QjUiF@matsya>
References: <20210928022002.26286-1-shawn.guo@linaro.org>
 <YVbD12kTfbGmRYId@matsya>
 <20211004030128.GC13320@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004030128.GC13320@dragon>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-10-21, 11:01, Shawn Guo wrote:
> Hi Vinod,
> 
> On Fri, Oct 01, 2021 at 01:46:23PM +0530, Vinod Koul wrote:
> > Hi Shawn,
> > 
> > On 28-09-21, 10:19, Shawn Guo wrote:
> > > The series adds missing vdd-supply for QUSB2 PHY which is required for
> > > digital circuit.  The driver works right now likely because firmware
> > > already sets it up.  Add it to bindings, driver and DTS that miss the
> > > supply.
> > > 
> > > It should not cause problem for existing DTBs:
> > > - SC7180, SDM630, SDM845 based platforms already specified vdd-supply
> > >   in the DTBs.
> > > - MSM8996 and MSM8998 platform DTBs miss vdd-supply, but dummy regulator
> > >   will ensure QUSB2 PHY driver works as before on these platforms.
> > 
> > What about the rest.. I checked SM8350 and SM8250 mtp ones are missing
> > this. With the property made mandatory, I guess it would cause these to
> > fail right..
> 
> >From what I can see, SM8350 and SM8250 use qcom-snps-femto-v2 PHY
> rather than qcom-qusb2.  So they should not be affected by this series.

Right, somehow I seem to have overlooked that part :(

I am applying this now, thanks

-- 
~Vinod
