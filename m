Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D4F2944B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 23:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438730AbgJTVrH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 17:47:07 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:7397 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389617AbgJTVrG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 17:47:06 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Oct 2020 14:47:06 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 20 Oct 2020 14:47:05 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 735D21946; Tue, 20 Oct 2020 14:47:05 -0700 (PDT)
Date:   Tue, 20 Oct 2020 14:47:05 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        Lee Jones <lee.jones@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH RESEND v1 2/3] dt-bindings: mfd: Add QCOM PM8008 MFD
 bindings
Message-ID: <20201020214705.GA4555@codeaurora.org>
References: <cover.1603148363.git.gurus@codeaurora.org>
 <7a89811f36fe858756daa62f1162d18da7e79a73.1603148363.git.gurus@codeaurora.org>
 <CAL_Jsq+bfTxbgS0hBo4XeJfFFYK4mcaQ=LF7UE_S2W_Qbm3rtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+bfTxbgS0hBo4XeJfFFYK4mcaQ=LF7UE_S2W_Qbm3rtg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 20, 2020 at 08:05:01AM -0500, Rob Herring wrote:
> On Mon, Oct 19, 2020 at 6:17 PM Guru Das Srinagesh <gurus@codeaurora.org> wrote:
> >
> > Add device tree bindings for the driver for Qualcomm Technology Inc.'s
> > PM8008 MFD PMIC.
> >
> > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > ---
> >  .../bindings/mfd/qcom,pm8008-irqchip.yaml          | 103 +++++++++++++++++++++
> >  1 file changed, 103 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml
> 
> Please resend to DT list if you want this reviewed.

Thank you, will resend including the DT list.

Guru Das.
