Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACA79589179
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 19:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238126AbiHCRdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 13:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236024AbiHCRdg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 13:33:36 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BD420BE1
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Aug 2022 10:33:32 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id w10so17062918plq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Aug 2022 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dy6IYhyMjLV91h2ReHssZ9zYJNgTd/qtSQuKQsaMXrc=;
        b=Nfb88RfP6LTCuL8dBDqDdh5UI6nFNU8KegwOL3F3TogolrjKRmHfAk7/BKpHwdDW5O
         K1GxOxMdZmzLEJXC82fmsI0F07sfzJrrrrl+50+7vp4n2xdF1yKh7sf1hL4udl/GKUrs
         r7wF/sNJAba2N0BzIvwwiQCmir5APDQxjGvxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dy6IYhyMjLV91h2ReHssZ9zYJNgTd/qtSQuKQsaMXrc=;
        b=XY+EIJtCY5o+28t8zZNOqbIJ5ggcNrMOSlGbZG2uBKWFTQqIZyRkzzzUNXGNMVLb2x
         U/7vsMUn6tALGNU341uVIW4aPEjh/FlJMS8sYhTd7xpjJ3KxYgOAgo7u5aD5gdabJUx8
         SObzYgATLYtsombIlX5+/MUtcN4FQ/mMthVJcOz/aDLKssQa6Qvp+jstLQz8lSjwTm0K
         xJdKI5Af1DpzbUXh/KJ04JP+tv2Wjtab4+pGAsE5aP12ACycEQNn+ajg5vYFv85QZVh5
         3OoUmv9o0zYZImTaJLEitPPaFZjOK854RXsBzBY3xUUiEGXSD8r6UXNerWjsoiawNEpu
         6d7w==
X-Gm-Message-State: ACgBeo0SNGW+1QPR5z/aMsEEOUBWSEB0s7wY4k706HM8jjY/qDQT7V5X
        FSwhfYEBZzutv/Hd41HKR/TPrA==
X-Google-Smtp-Source: AA6agR4OTofGOrxUeI0Yz5ovXwcIJgH+wgxqCKULul0vj1fASevyAdjtsOHPEKEqbnSejux4ft0vvA==
X-Received: by 2002:a17:90b:4b91:b0:1f4:e116:8f1 with SMTP id lr17-20020a17090b4b9100b001f4e11608f1mr6031640pjb.121.1659548012211;
        Wed, 03 Aug 2022 10:33:32 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:238b:c074:f5f8:56d0])
        by smtp.gmail.com with UTF8SMTPSA id e6-20020a17090a728600b001f31468f2f4sm1883181pjg.46.2022.08.03.10.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 10:33:31 -0700 (PDT)
Date:   Wed, 3 Aug 2022 10:33:29 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 1/8] usb: dwc3: fix PHY disable sequence
Message-ID: <Yuqxaf2nvegDyLtp@google.com>
References: <20220802151404.1797-1-johan+linaro@kernel.org>
 <20220802151404.1797-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220802151404.1797-2-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 02, 2022 at 05:13:57PM +0200, Johan Hovold wrote:
> Generic PHYs must be powered-off before they can be tore down.
> 
> Similarly, suspending legacy PHYs after having powered them off makes no
> sense.
> 
> Fix the dwc3_core_exit() (e.g. called during suspend) and open-coded
> dwc3_probe() error-path sequences that got this wrong.
> 
> Note that this makes dwc3_core_exit() match the dwc3_core_init() error
> path with respect to powering off the PHYs.
> 
> Fixes: 03c1fd622f72 ("usb: dwc3: core: add phy cleanup for probe error handling")
> Fixes: c499ff71ff2a ("usb: dwc3: core: re-factor init and exit paths")
> Cc: stable@vger.kernel.org      # 4.8
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

I also wondered about this earlier, but didn't take action.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
