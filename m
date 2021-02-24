Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C743242FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 18:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234654AbhBXRNC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 12:13:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbhBXRM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 12:12:57 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD993C061786
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 09:12:16 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id e6so1864796pgk.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 09:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=miL1G96DLlMS5QA+pTrA9NtlqcqBwLFfkCCcFZY5vqs=;
        b=nX12R12OGc/BV5IKrHJEZsqW/kYe3QDsGgyLcPHydyI/28eWbx3f0HGgTllZg36iAm
         XU5x4JI6XOghYs9UdNYT95rR0EfP+ehIyyOO5CiQzZbxbm+2rZlCGuYCCsC/VYFDXSS8
         zQaEh3fMLmILGFYGQk5iO2Rz0bfKWhcelMmew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=miL1G96DLlMS5QA+pTrA9NtlqcqBwLFfkCCcFZY5vqs=;
        b=hqihih3HPjC99t9bS+p//GhTxz3F7oJxoUgaWFDFcAEVBg99B8d5NY4yD/ysrHkT/V
         TorxY9aBMUGChcYz4iDWTCxXWnToZJa/zqAKinEgVm9jIPZm3/s1J+duHzuX+ZtPxJqw
         +QPYm25D95R4y8qWcLGLLDoSigV3t8VU6IjPhVz8mVA048au/kAx2SKShX526jYobQ99
         iA/B98a5n/npBfPRHk9cN8idagz2YY1bqKMRT3XxOqJGr+emzTPPAOLlw4ojMfTRLLGr
         3rFXLP03sthQLfO9FT/XAVlo0ax+oJbHHfN6Ojg0PnMXlOKqqUvC0mT2jdkO6QRhNNp0
         w2Yg==
X-Gm-Message-State: AOAM533b0UVdU2UWj1d+hxV7YFZU7vfwkG5gT549Eaof5O2pyXbX8Gmm
        WVoT+vlMrqNYQ80E/Av04MCaBA==
X-Google-Smtp-Source: ABdhPJy+EGZZ4NMW6hFKoCq/WX/IfEvWFWWiI5jbyNuO3QSZds8vyR4RYUNd8BKzNzfC5lT2w3OpTQ==
X-Received: by 2002:a63:1b1b:: with SMTP id b27mr28616898pgb.377.1614186736208;
        Wed, 24 Feb 2021 09:12:16 -0800 (PST)
Received: from localhost ([2620:15c:202:1:9f5:1448:883f:b01])
        by smtp.gmail.com with UTF8SMTPSA id d12sm2806501pgm.83.2021.02.24.09.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 09:12:15 -0800 (PST)
Date:   Wed, 24 Feb 2021 09:12:13 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7180: Delete charger thermal
 zone and ADC channel for lazor <= rev3
Message-ID: <YDaI7RZLb0r/MfwM@google.com>
References: <20210219181032.1.I23e12818c4a841ba9c37c60b3ba8cfeeb048285f@changeid>
 <20210219181032.3.Ia4c1022191d09fe8c56a16486b77796b83ffcae4@changeid>
 <161402520418.1254594.7435679604383921403@swboyd.mtv.corp.google.com>
 <YDQWVresOGZGLL6N@google.com>
 <161402672369.1254594.14091287979440332862@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <161402672369.1254594.14091287979440332862@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 22, 2021 at 12:45:23PM -0800, Stephen Boyd wrote:
> Quoting Matthias Kaehlcke (2021-02-22 12:38:46)
> > On Mon, Feb 22, 2021 at 12:20:04PM -0800, Stephen Boyd wrote:
> > > Quoting Matthias Kaehlcke (2021-02-19 18:10:59)
> > > > Lazor rev3 and older are stuffed with a 47k NTC as thermistor for
> > > > the charger temperature which currently isn't supported by the
> > > > PM6150 ADC driver. Delete the charger thermal zone and ADC channel
> > > > to avoid the use of bogus temperature values.
> > > > 
> > > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > > ---
> > > > 
> > > >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 9 +++++++++
> > > >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 9 +++++++++
> > > >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts | 9 +++++++++
> > > >  3 files changed, 27 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > > > index 30e3e769d2b4..0974dbd424e1 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > > > @@ -14,6 +14,15 @@ / {
> > > >         compatible = "google,lazor-rev0", "qcom,sc7180";
> > > >  };
> > > >  
> > > > +/*
> > > > + * rev <= 3 are stuffed with a 47k NTC as charger thermistor which is currently
> > > > + * not supported by the PM6150 ADC driver. Delete the thermal zone and ADC
> > > > + * channel to avoid the use of bogus temperature values.
> > > > + */
> > > > +/delete-node/ &charger_thermal;
> > > > +/delete-node/ &pm6150_adc_charger_thm;
> > > > +/delete-node/ &pm6150_adc_tm_charger_thm;
> > > 
> > > Can we disable pm6150_adc_tm instead on <= rev3 boards? It would be the
> > > same number of lines, but is simpler to reason about disabled nodes vs.
> > > deleted nodes usually.
> > 
> > For Lazor theoretically this could be done since it doesn't use other ADC
> > channels, however it won't work for other trogdor devices that will be
> > upstreamed eventually. Some of these boards have the same problem, however
> > they have other thermistors connected to the ADC. One could argue that it's
> > preferable to do things in a uniform way, but I'm open to do it either way
> > for Lazor.
> > 
> 
> I see. Can the thermal-zone be disabled then vs. deleting three nodes? I
> think the thermal driver uses for_each_available_child_of_node() so that
> would work?

Yes, that would work. I also deleted the ADC/TM nodes to remove the bogus
temperature completely from the system, but one could argue that it does
no harm to keep it as long as it isn't used.
