Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF43D301D4C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 16:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbhAXPsj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 10:48:39 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:33345 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbhAXPsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 10:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611503146;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
        Subject:Sender;
        bh=Q2MdLvfwsiG+lKt8T3zLaAeD1eHKPTmssxmXCqgg1y4=;
        b=EYxlDtWUsPFpRuFTU7s4mebH6cqevoC4e/RnuMjsXSWjybHRyZa85rE4uQbM28/iyg
        F3uQ0qZPpI8Qs6eHMNm/HEHPVlfIeY2Juh48EflEJgB8gkRDJ73EC2/2ijQxvM2O8CFE
        BMU1bq+5TQOm/hwsxMWv8j+TUPrpZ4w2qSLP/hrmIhX62ypIvHLZT2EiaiOwhoJFKiYm
        kD12aoUINKZeCAa8PDdTRaGQF32QgcYMcP/oPpoy3L520vUDYidkB2gVX0O+Iuc4RGAt
        tkW6MMunhtWdSER4yVWb5t4OMWc531C32CpL3lPlb1UjhNLJ240GFHmghXxqrFL5CgZ9
        2M/A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IczBa4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id R0a218x0OFjegRr
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 24 Jan 2021 16:45:40 +0100 (CET)
Date:   Sun, 24 Jan 2021 16:45:35 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Add device tree for BQ Aquaris X5
 (Longcheer L8910)
Message-ID: <YA2WHwuKwaLZ9sVm@gerhold.net>
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
 <20210124135409.5473-2-jonathan.albrieux@gmail.com>
 <cb299b22-f00f-c8fd-648e-6f34c34b0967@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb299b22-f00f-c8fd-648e-6f34c34b0967@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 24, 2021 at 04:12:30PM +0100, Konrad Dybcio wrote:
> The sorting on smd_rpm_regulators & msmgpio seems off.. unless it's the new thing to put it at the end?
> 

It's consistent like this for all MSM8916 device trees at least.

Back when I converted them I thought that it's kind of annoying to have
this large list of regulators and pinctrl placed right inbetween all
other device definitions. And it's even worse for apq8016-sbc.dtsi which
has this large list of gpio-line-names. It just makes it harder to see
the actual interesting definitions (new devices etc) in my opinion.

I think I mentioned this in my patch description back then
and Bjorn did not complain. :-)

But I understand this may be somewhat inconsistent with other qcom
device trees at the moment, so I suppose I would be fine with a patch
to order them entirely alphabetically.
(As long as it's consistent for all MSM8916 device trees...)

Thanks,
Stephan
