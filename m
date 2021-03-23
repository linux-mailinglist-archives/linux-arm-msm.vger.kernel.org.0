Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01EF9345656
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 04:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhCWDia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 23:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbhCWDiF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 23:38:05 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56F5C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 20:38:05 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id m7so10349071pgj.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 20:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=til1v4SH/TtmLKm35mHk+XE9IxkpsVFKSNvaMqYYu14=;
        b=Xdu7khG7OrvQmYH7UZEB2jC8kCjyE46zrTCWcHBHksw60fcJNDOkjzHT/Z5mAQ+gaY
         kpxRkgGVWjSFG3hdyO8h5ggyqiPSQeY8Lbef8ODvDVYBFGdLMTVreXtTGdwZqjf3TR3r
         PCCOfCT4ad07EKhXY4kFu4I9MznOA5xL/YkP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=til1v4SH/TtmLKm35mHk+XE9IxkpsVFKSNvaMqYYu14=;
        b=oL/LEQ/Q0/k9CBnZaJAMiOnfpZWJ94a0vl6chIwHHyT5GMmAdJddqTEX9zs+q617Ni
         trCaZOpGOirqbgmM84+NAQ74eCc4/JJcw/Mn1a80ezx8eEeDVyGW9qUB+nagYJ7Ek49u
         0R2UyQuMlu2YPuIMzqPdPheSRONyKAcNwqf3xKXmRzdNnI2hoKE+yHUFKRTwyXnOy2JW
         iXlf8+3hCMj6W5DBMXcgm83QTstE6bxf3E/RO/suLw0AaE+RYtIvx9/Gg8g+NQhSI0f8
         92zuHATRfKflqigWv8c6VeQ3uCxbBuUFIDOCAEBDtaCbMAvkz07vXp8N/RhXMPe6x8r3
         22lg==
X-Gm-Message-State: AOAM53091cNmSYUPq+hzy+eH3xzbSMB6EaTckrep2P2JMZ6qfqmusRbG
        fusfz0LD0PnVdMQQ0gOIxteUsXADbazmPA==
X-Google-Smtp-Source: ABdhPJz9TDRQtbtypmCWRo4JsjThyKds0XJ5xWAnkZjLZbvs6WxJKLo2fB78nRAtrAsldM+thjM+fA==
X-Received: by 2002:a65:5a0a:: with SMTP id y10mr2232648pgs.285.1616470685184;
        Mon, 22 Mar 2021 20:38:05 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id i20sm13156817pgg.65.2021.03.22.20.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 20:38:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d19fbcc91b4ef045014b225e7fdf9780@codeaurora.org>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org> <463a45f2c3e4a91430c006fa1637c7f4f124185e.1614244789.git.saiprakash.ranjan@codeaurora.org> <161428210272.1254594.16034240343090747878@swboyd.mtv.corp.google.com> <dc3be32a3f8197d3138fe1ef6c24316a@codeaurora.org> <161436520297.1254594.4348845199981053890@swboyd.mtv.corp.google.com> <5cf5692ef7d348ec361081d0341f1254@codeaurora.org> <d19fbcc91b4ef045014b225e7fdf9780@codeaurora.org>
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sc7280: Add AOSS QMP node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Date:   Mon, 22 Mar 2021 20:38:03 -0700
Message-ID: <161647068330.3012082.2910442813045392403@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-03-08 21:58:21)
> On 2021-02-27 19:26, Sai Prakash Ranjan wrote:
> > On 2021-02-27 00:16, Stephen Boyd wrote:
> >> Quoting Sai Prakash Ranjan (2021-02-25 23:51:00)
> >>> On 2021-02-26 01:11, Stephen Boyd wrote:
> >>> > Quoting Sai Prakash Ranjan (2021-02-25 01:30:24)
> >>> >> Add a DT node for the AOSS QMP on SC7280 SoC.
> >>> >>
> >>> >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.or=
g>
> >>> >> ---
> >>> >>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 14 ++++++++++++++
> >>> >>  1 file changed, 14 insertions(+)
> >>> >>
> >>> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>> >> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>> >> index 65c1e0f2fb56..cbd567ccc04e 100644
> >>> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>> >> @@ -9,6 +9,7 @@
> >>> >>  #include <dt-bindings/clock/qcom,rpmh.h>
> >>> >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> >>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> >>> >> +#include <dt-bindings/power/qcom-aoss-qmp.h>
> >>> >>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> >>> >>
> >>> >>  / {
> >>> >> @@ -368,6 +369,19 @@ pdc: interrupt-controller@b220000 {
> >>> >>                         interrupt-controller;
> >>> >>                 };
> >>> >>
> >>> >> +               aoss_qmp: qmp@c300000 {
> >>> >
> >>> > power-domain-controller@c300000? power-controller@c300000?
> >>> >
> >>>=20
> >>> Its an AOSS message RAM and all other SM* SoCs have as qmp@
> >>> and the dt binding as well, I see only SM8150 with power-controller,
> >>> that should probably be fixed?
> >>=20
> >> Node name should be generic while still being meaningful. Nobody knows
> >> what qmp is, but power-controller makes sense. Can you fix this and=20
> >> the
> >> others to be power-controller?
> >>=20
>=20
> we probably would be changing them back
> to qmp or something more generic soon
> since the consensus was qmp wasn't a
> power-controller. So not sure if its
> worth the effort here.
>=20

Hmm alright. Maybe mailbox? qmp is not generic. What does it stand for?
qualcomm messaging protocol?
