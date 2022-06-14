Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B3F54BBE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jun 2022 22:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238908AbiFNUiq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jun 2022 16:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbiFNUip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jun 2022 16:38:45 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4EC942EDB
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 13:38:43 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id v4so2479900oiv.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=R9se4fkQIATOHeiM0V5pTwXbBCtBLskjJDXmy+aUXOg=;
        b=JyDOPWyTOJ/kfEgQJod7us/n3SDVipjiGbeeAOBgglFjHRLuM2AVFRnsoyoYtufeVk
         8+X0h8frxvUBw4RfCtMwFXC3l/LL6NXMv5RgRUspMriCjRuw93ypQGxXMynXBBtCblkj
         u62nJDv0L++Msf99HE29mSBQ/NTHJfPPuoJJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=R9se4fkQIATOHeiM0V5pTwXbBCtBLskjJDXmy+aUXOg=;
        b=P53TOJ0qr4gIR46WUad/OuIXzK/n0kZa3InAresa5zdM9PR5uOpVZJcPNiHqW3OO7+
         vPAGRx/4GBUuyBYS2StMSSNKOneBJNJlBzfSGQuydubHG7ny6R4u6Maw2AaXGNY7Q1yJ
         qq+bdZsY9i3W/tBZGF+ZD1YSbcMeePSFTS5f6rwhXmr4uaiOQ41Y7Q+XFgMWbfQmgDF+
         qX5twab2vBa/Hu3Owz1T4O+HqfU+k2g/ZseYjcH3/TkLNQC7KZswLDeoQwT46E4xdhMv
         vCMd0M6/o/RfZ31D+ncF0JS32tYzjnzkwOrFFn7KBgy/NnSiLEuHQ1DcjPzAl2pIo4+9
         EBPA==
X-Gm-Message-State: AOAM531ylY/NjOMsQgxCp2+PUGjl8hUkmlbK93+m7Hkv/dPlVtuVCBgK
        UZu2oUHAwiDLJsFrsIsoKIPL4zCwjj4b3qaUJdrCQw==
X-Google-Smtp-Source: ABdhPJxCGyS3k/Bo/8HxAWyu9tWMRxUxlI/vaTOGQN0TKsToLr+Hzob27sMTdOeJ07X0A/q+3V8lYjSwId7WYHOGuvg=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr3177251oib.63.1655239123282; Tue, 14
 Jun 2022 13:38:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jun 2022 13:38:42 -0700
MIME-Version: 1.0
In-Reply-To: <Yqi8rcs95CEEjGY4@google.com>
References: <20220614161118.12458-1-quic_tdas@quicinc.com> <Yqi8rcs95CEEjGY4@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 14 Jun 2022 13:38:42 -0700
Message-ID: <CAE-0n50cqBWpDKsiyDNMZ8GnNtj7xJn930S1hucdAGn7tGXewA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7280: Update lpassaudio clock
 controller for resets
To:     Matthias Kaehlcke <mka@chromium.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2022-06-14 09:51:57)
> On Tue, Jun 14, 2022 at 09:41:18PM +0530, Taniya Das wrote:
> > The lpass audio supports TX/RX/WSA block resets. The LPASS PIL clock
> > driver is not supported and mark it disabled. Also to keep consistency
> > update lpasscore to lpass_core.
>
> There is a driver for "qcom,sc7280-lpasscc", what does it mean that is
> isn't supported?
>
> IIUC one problem is that 'lpasscc@3000000' and 'lpass_aon / clock-controller@3380000'
> have overlapping register ranges, so they can't be used together.
>
> You could just say 'Disable the LPASS PIL clock by default, boards
> can enable it if needed'.

For the pinctrl driver we added a "qcom,adsp-bypass-mode" property[1] to
indicate that the ADSP was being bypassed or not. Can we do the same
here and combine the device nodes that have overlapping reg properties?

[1] https://lore.kernel.org/r/1654921357-16400-2-git-send-email-quic_srivasam@quicinc.com
