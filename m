Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5265377FC13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 18:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352707AbjHQQ1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 12:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353708AbjHQQ10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 12:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F2BD35A9
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692289575;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EZk7pCD0HPe+ABrfYsTMs6MpHKEmTin7ICiAaY/ju7w=;
        b=DHdejXLY1FyR6VJkT/Zk8rDhNpjV33xHb7d8Fu0baAhGZI5khBmKzUYkIPNLiEDlXIg9cB
        1tiss3vEq2ilxW0wtR5pZXO2VRfdBq10HFyLYcKooP17KbbmcIpwDT6IgvkzcXw668rWLW
        3quaN6rx8UCWSWKQxZBytNn35aClbf0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-MDuns7IcOo-oQD3CMerM_w-1; Thu, 17 Aug 2023 12:26:13 -0400
X-MC-Unique: MDuns7IcOo-oQD3CMerM_w-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-589f986ab8aso11537b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 09:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692289573; x=1692894373;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZk7pCD0HPe+ABrfYsTMs6MpHKEmTin7ICiAaY/ju7w=;
        b=VQ/BSfebXxsAva0qXvli+pc9WKcueCzKATL7Tkf5/qPMud+UEKBcpKxzN6ZMd82+Vo
         34UozURQiOIi4MYSIwmuwW8+Syn6gQBWh1pN8vBfn0pghMVbxd8sPing2Hu3aXNblfII
         10TRD4ecdX+feFbAE1w1PITCloqL6B1EMmrcmkaCKpXIGEXbMXDcAaxlv+Hk/88kg2X0
         1g9DcR1lAX7rVJ3wp+tUzKq1nbjqAaoU/hiTFWEie2uRIEf41g0goozBYqPKgKP0dKpA
         XtDxja0+QzMIc3pHUm5rUTwVXxapFp7ma1Fzvx7stySgcvgUGK80vvy6pcJ7Bioiww++
         Bk1Q==
X-Gm-Message-State: AOJu0YyGZwOaxeCoRWCTSa2n/MRe/Alkypmb7xG/fGqsQ6bLYfimUgh4
        GOAtXfyuwzOC6k1H9cGXOXuvvnwRrBdo00rUuE86AYYzaMNuBr78P/2skwkxwrv4eL5fLH5hsIg
        +pmmi6B6WhcuXZRg5F1GBwAYDaY9Bns0OiQ==
X-Received: by 2002:a81:9289:0:b0:581:7958:5bda with SMTP id j131-20020a819289000000b0058179585bdamr4117564ywg.1.1692289572680;
        Thu, 17 Aug 2023 09:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFDMsUg7Qvc0ShK/beubOLSc6c6/DQghAOnIqHeSrnHVzvTsNVwwDg01IycrQ1PQJjVGdmfg==
X-Received: by 2002:a81:9289:0:b0:581:7958:5bda with SMTP id j131-20020a819289000000b0058179585bdamr4117535ywg.1.1692289572426;
        Thu, 17 Aug 2023 09:26:12 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id y8-20020a0dd608000000b00589e84acafasm1079736ywd.48.2023.08.17.09.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 09:26:11 -0700 (PDT)
Date:   Thu, 17 Aug 2023 12:26:10 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     andersson@kernel.org, linus.walleij@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom-pmic-gpio: silence -EPROBE_DEFER message
 on probe
Message-ID: <ZN5KIlI+RDu92jsi@brian-x1>
References: <20230817145941.1091418-1-bmasney@redhat.com>
 <a3431eaf-053a-4e1c-b082-e87a3aaefbf3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3431eaf-053a-4e1c-b082-e87a3aaefbf3@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 17, 2023 at 05:01:19PM +0200, Konrad Dybcio wrote:
> On 17.08.2023 16:59, Brian Masney wrote:
> > The following message shows up one or more times when booting a Qualcomm
> > SA8775 Development board:
> > 
> >     qcom-spmi-gpio c440000.spmi:pmic@2:gpio@8800: can't add gpio chip
> > 
> > Convert this over to use dev_err_probe() to silence this message.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> That looks odd, why would it ever defer?
> 
> SPMI should be up by the time it gets a chance to probe.

You replied within the same minute of me posting that patch, which is
the fastest review I've had to date on an upstream kernel list. Before
we continue, please verify:

              [ ] I am not a robot

:)

So SPMI is up and probes normally the first time, and is up by time this
driver probes. I think the probe deferral is happening somewhere in
pinctrl, however I am not sure exactly where. I added some tracers to
the kernel command line and here's some relevant log messages:

    device: 'c440000.spmi:pmic@2:gpio@8800': device_add
    bus: 'platform': add device c440000.spmi:pmic@2:gpio@8800
    PM: Adding info for platform:c440000.spmi:pmic@2:gpio@8800
    bus: 'platform': __driver_probe_device: matched device c440000.spmi:pmic@2:gpio@8800 with driver qcom-spmi-gpio
    bus: 'platform': really_probe: probing driver qcom-spmi-gpio with device c440000.spmi:pmic@2:gpio@8800
    qcom-spmi-gpio c440000.spmi:pmic@2:gpio@8800: no pinctrl handle
    qcom-spmi-gpio c440000.spmi:pmic@2:gpio@8800: try to register 12 pins ...
    pinctrl core: registered pin 0 (gpio1) on c440000.spmi:pmic@2:gpio@8800
    pinctrl core: registered pin 1 (gpio2) on c440000.spmi:pmic@2:gpio@8800
    pinctrl core: registered pin 2 (gpio3) on c440000.spmi:pmic@2:gpio@8800
    pinctrl core: registered pin 3 (gpio4) on c440000.spmi:pmic@2:gpio@8800
    pinctrl core: registered pin 4 (gpio5) on c440000.spmi:pmic@2:gpio@8800
    pinctrl core: registered pin 5 (gpio6) on c440000.spmi:pmic@2:gpio@8800
    pinctrl core: registered pin 6 (gpio7) on c440000.spmi:pmic@2:gpio@8800
    pinctrl core: registered pin 7 (gpio8) on c440000.spmi:pmic@2:gpio@8800
    pinctrl core: registered pin 8 (gpio9) on c440000.spmi:pmic@2:gpio@8800
    pinctrl core: registered pin 9 (gpio10) on c440000.spmi:pmic@2:gpio@8800
    pinctrl core: registered pin 10 (gpio11) on c440000.spmi:pmic@2:gpio@8800
    pinctrl core: registered pin 11 (gpio12) on c440000.spmi:pmic@2:gpio@8800
    qcom-spmi-gpio c440000.spmi:pmic@2:gpio@8800: no hogs found
    qcom-spmi-gpio c440000.spmi:pmic@2:gpio@8800: error -EPROBE_DEFER: can't add gpio chip
    qcom-spmi-gpio c440000.spmi:pmic@2:gpio@8800: Driver qcom-spmi-gpio requests probe deferral
    platform c440000.spmi:pmic@2:gpio@8800: Added to deferred list

The second time it probes the device is successfully added.

Brian

