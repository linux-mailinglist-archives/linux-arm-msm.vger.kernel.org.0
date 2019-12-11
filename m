Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBB9711BC69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 20:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfLKTCS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 14:02:18 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:43082 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727854AbfLKTCO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 14:02:14 -0500
Received: by mail-io1-f67.google.com with SMTP id s2so23789493iog.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 11:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GwbAYQSBDv5Za0vCTAus/0vbiDud+PECBHWsA3f5N58=;
        b=m4SCZ81T05WMOj5zXCA1EeXNaycmm/je1x3e3/n+nJ5zkdeOt6Qw6Gcr+o738uc7Yp
         tlEYg26Gcr9+R0/w7V/6/8xOU0HGKbqKEcet2aXmPN/Ijth3iXw8rgpQOjzdySdroiFt
         nCKVa3XbP17RN8brOD8jKv+becFkZyUnPd4PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GwbAYQSBDv5Za0vCTAus/0vbiDud+PECBHWsA3f5N58=;
        b=bqxZoEzxpPGgTuA94FwXFgw9cQ2PxqZDhY39pCWT/RIsKTJNgSfp4RRiGDlS9EMCS8
         aq1jWhYrAmzGrvimxlmGYv5eVcpVykKZeISTzpCZud3XE1qrBvpA6LCnIGahe8nF+xAA
         TEua+23e/zgei0iEZGGPOkoh3qq18a8QYmeYp8K9Km4MnValDyzQ9hJpy4h1pZ63NWoj
         7v33Mz7opujIRFrlScD9zv0B+2T2DDNs5erzm6zkYZS/9fnqHxyeKsZztdujE9/tMrkj
         eQcotTRgOxvmdW22ip06bWaT9qk7dPXTko7l8r203rzYXW75yIxB6W1O0md4gueF1y2W
         I5ng==
X-Gm-Message-State: APjAAAUZxHRDyB8fr4WGTMOCMWDmBISr23/4xRWhXaIYNXfnvh01jyaV
        CpMJCjlCbQaVxozm3lhoXlzojziMqw0=
X-Google-Smtp-Source: APXvYqw8gb4FxbiG0FBwlxk5TliuBLHSi0ig1nMRCCzq8k3HmhqA7NCeF0e7+CDK2hMKSerS5qiyjQ==
X-Received: by 2002:a02:9203:: with SMTP id x3mr4445752jag.62.1576090933792;
        Wed, 11 Dec 2019 11:02:13 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id p21sm701206ioh.53.2019.12.11.11.02.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 11:02:11 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id c16so2526146ioo.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 11:02:11 -0800 (PST)
X-Received: by 2002:a6b:b941:: with SMTP id j62mr2661633iof.168.1576090931323;
 Wed, 11 Dec 2019 11:02:11 -0800 (PST)
MIME-Version: 1.0
References: <1574934847-30372-1-git-send-email-rkambl@codeaurora.org> <1574934847-30372-2-git-send-email-rkambl@codeaurora.org>
In-Reply-To: <1574934847-30372-2-git-send-email-rkambl@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 11:01:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UXC3UT78vGBr9rRuRxz=8iwH4tOkFx6NC-pSs+Z5+7Xw@mail.gmail.com>
Message-ID: <CAD=FV=UXC3UT78vGBr9rRuRxz=8iwH4tOkFx6NC-pSs+Z5+7Xw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: sc7180: Add device node support
 for TSENS in SC7180
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, sanm@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Nov 28, 2019 at 1:55 AM Rajeshwari <rkambl@codeaurora.org> wrote:
>
> Add TSENS node and user thermal zone for TSENS sensors in SC7180.
>
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 527 +++++++++++++++++++++++++++++++++++
>  1 file changed, 527 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b9..6656ffc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -911,6 +911,26 @@
>                         status = "disabled";
>                 };
>
> +               tsens0: thermal-sensor@c263000 {
> +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";

Can you please send a patch listing this configuration in
"Documentation/devicetree/bindings/thermal/qcom-tsens.yaml"?  You
shouldn't need to re-send the dts since it looks like it's already
landed, but it's good to get the bindings happy.

Thanks!

-Doug
