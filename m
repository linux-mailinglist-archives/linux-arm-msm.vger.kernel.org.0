Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEC84F4BEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1572976AbiDEXHW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573412AbiDETKF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 15:10:05 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC136DFFAF
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 12:08:05 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-deb9295679so404161fac.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 12:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rUVwI4C+0BLN4jpZ06jyReT//tlEeH3GmQTL0BUr9Y0=;
        b=XX9prqEAhd7lONfCklYdccoC5m+mhLQwLV4aEE3wT4PftJoxyRK0y2h/lNQvw7aaRf
         HVh8iGnXsohbHNoGgisYS6t9bNNwd7v79/EhkJsC5QlwQK5jtkjnaOACm4i1josYElH2
         oQ+4bP0IUhkLgBVswtT5h59GDB3e6kxgkY8lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rUVwI4C+0BLN4jpZ06jyReT//tlEeH3GmQTL0BUr9Y0=;
        b=cY9Xw2QmGD/7swOBMdFkDW9VkAWFM+K5EYqJTl2sBaM/BAEGMqW3xUnIKc02HbagYk
         epVZDWlOgIHJRpuUp3sLC9vBnlyTAY712dS84K5gMZOQ7UUy1NDNgf3rPurXahvYyslM
         H1h7UG8zSjV+F4peGCp609AjdZIYDduusdQUUHpKEmEJtYq7TS6Uu7MoBKX8+nCb/Ch+
         SgRdq2bY1VLAtzO2A67RdvHbn9xlKtPpHv9ANJX811Ynk+LxjH13g+yfUbOByNlW0Crh
         HeV8BxK241nzR/2yzzNBnbZ2sF10fUQivE2Xxfyx/YC/9iEf3nsfpESmFYBizPNXXP9g
         wWwQ==
X-Gm-Message-State: AOAM531SLsUmJ6ShrBgQVtVX+ygQoP5GpwymW7NAD8QdcRbEiY7qcIG4
        f7L42CYY9/iZIIugRnkLvF66of+TfIlMWH8uEiy49Q==
X-Google-Smtp-Source: ABdhPJxA4xmND5r477gAc3CXmY3jaPCswWCtkK+gOlPhHLJPE2rEZ3WFPS82QmjQAtQ6gvUtUaTol9iYJRdlrtcynzo=
X-Received: by 2002:a05:6870:e314:b0:e1:e5f0:d777 with SMTP id
 z20-20020a056870e31400b000e1e5f0d777mr2164673oad.193.1649185685309; Tue, 05
 Apr 2022 12:08:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 14:08:04 -0500
MIME-Version: 1.0
In-Reply-To: <1649166633-25872-4-git-send-email-quic_c_skakit@quicinc.com>
References: <1649166633-25872-1-git-send-email-quic_c_skakit@quicinc.com> <1649166633-25872-4-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Apr 2022 14:08:04 -0500
Message-ID: <CAE-0n52hZy6ia3i0yv9U_1TnqDf-NAW3587RSS_qG+GRNhh3yg@mail.gmail.com>
Subject: Re: [PATCH V9 3/6] mfd: pm8008: Add mfd cell struct to register LDOs
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-04-05 06:50:30)
> Add mfd cell struct to match with the "qcom,pm8008-regulator"
> driver and a separate probe to add pm8008_regulator_devs.
> This separate probe is required to ensure the regulators are
> registered only with the mfd device which contains regulators.

I don't get it. Shouldn't the pm8008-regulators compatible string be a
different i2c driver in drivers/regulator/ that matches the compatible
string for qcom,pm8008-regulators?

>
> Add the reset-gpio toggling in the pm8008_probe() to bring
> pm8008 chip out of reset instead of doing it in DT node using
> "output-high" property.

Please split this part off to a different patch.
