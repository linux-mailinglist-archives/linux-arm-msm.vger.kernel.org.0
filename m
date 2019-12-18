Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA54E12515F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 20:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbfLRTJp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 14:09:45 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:40204 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbfLRTJp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 14:09:45 -0500
Received: by mail-io1-f66.google.com with SMTP id x1so3124211iop.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 11:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MjSvp3Dx9u84GVaJpyyyeaGaP0H57BE7CyJr7SSOs5g=;
        b=XIcQqioy8tqWx8jv9ksRQ/fgieMfgKKKIp3ywAYh1a58vOSB2qEGoad6XCSce9DM6h
         EsI2IIF0ChjDxU/kKx/iDhsOw1cGnGjRLQYgj9YjFXigW2y1f4KshZQZ6ZfqF1Njpqcv
         lQfSIyPvo9TnNkabONpQoAmrkQZmQBPcm9K0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MjSvp3Dx9u84GVaJpyyyeaGaP0H57BE7CyJr7SSOs5g=;
        b=NldInrkJhxD/NUZWxi9acBuAr8glXmcuJZPuC5cNfWSDlwS7+tCvpRWLkgnkQrdmdo
         rZOAKFDXu5xGjsLoPOkUQQSwKTeY11RnkGmZnkr1uDIW1c9Bdnm6XVMtLnveclCvU3+n
         Yl2NmUAFkU2qfqiiGmxgIc1KYL5McNAgzckl/aLdD2H2/1yqrDbJxi8zfnxjs7giWYTL
         93NbLmeq9e8KfjA3yE4KVzqUstIW9Spj4i05ravB0cc9LSwpO9/NF7vxDyYgkVlck0FE
         G4qdutM69N+1KCYJnb65tTuWMp14bRM+8pGHs1Bv2ouTrkrcNSoR9ucScZBzSU98N2yn
         t1ZQ==
X-Gm-Message-State: APjAAAWAUN0tNvR1xXptvNrodzgILmm7Mpl9ikW5ObhcN8BrNRHokZT3
        O2ENMHE0RZPZpcHSvE/Yhkt1KeSESwQ=
X-Google-Smtp-Source: APXvYqxo9qMJyZSbEMW4xaXUG38HnlNNUwutGMVEneHz0/yAWDsZ0Mehpiu0uyYxpN1c4zvM6GeuaA==
X-Received: by 2002:a05:6638:a2c:: with SMTP id 12mr3778873jao.60.1576696184008;
        Wed, 18 Dec 2019 11:09:44 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id a82sm924672ill.38.2019.12.18.11.09.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 11:09:43 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id s15so2663166iln.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 11:09:42 -0800 (PST)
X-Received: by 2002:a92:1547:: with SMTP id v68mr3226767ilk.58.1576696182341;
 Wed, 18 Dec 2019 11:09:42 -0800 (PST)
MIME-Version: 1.0
References: <1575520881-31458-1-git-send-email-sanm@codeaurora.org> <1575520881-31458-4-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1575520881-31458-4-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 18 Dec 2019 11:09:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V7SEqLWQh29eHh=a5q6Q2_bWwhMViyhFvWwGQN1p7fjw@mail.gmail.com>
Message-ID: <CAD=FV=V7SEqLWQh29eHh=a5q6Q2_bWwhMViyhFvWwGQN1p7fjw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: phy: qcom-qusb2: Add SC7180 QUSB2 phy support
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Dec 4, 2019 at 8:43 PM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Add QUSB2 phy entries for SC7180 in device tree bindings.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml
> index 3ef94bc..5eff9016 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - qcom,msm8996-qusb2-phy
>        - qcom,msm8998-qusb2-phy
> +      - qcom,sc7180-qusb2-phy
>        - qcom,sdm845-qusb2-phy

I would propose that we add generic PHY v2 tagging here, like this:

properties:
  compatible:
    anyOf:
      - items:
        - const: qcom,msm8996-qusb2-phy
      - items:
        - const: qcom,msm8998-qusb2-phy
      - items:
        # Suggested to also add "qcom,qusb2-v2-phy" as below.
        - const: qcom,sdm845-qusb2-phy
      - items:
        - enum:
          - qcom,sc7180-qusb2-phy
          - qcom,sdm845-qusb2-phy
        - const: qcom,qusb2-v2-phy

Given that this PHY has a fairly linear versioning within Qualcomm
(right?) this should make sense and should make code / adding new
device trees easier.  This is probably better than what I suggested in
the driver review [1] where I suggested that the compatible for sc7180
should be:

  compatible: "qcom,sc7180-qusb2-phy", "qcom,sdm845-qusb2-phy"


>    reg:
> @@ -66,7 +67,7 @@ properties:
>          It is a 6 bit value that specifies offset to be
>          added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
>          tuning parameter that may vary for different boards of same SOC.
> -        This property is applicable to only QUSB2 v2 PHY (sdm845).
> +        This property is applicable to only QUSB2 v2 PHY (sc7180, sdm845).

If you add my tagging, change this and other similar to just remove sdm845.


[1] https://lore.kernel.org/r/CAD=FV=W_z=_j==DSFbtCmTihmSyRtH85VnKpw03E=gATcqJx2Q@mail.gmail.com

-Doug
