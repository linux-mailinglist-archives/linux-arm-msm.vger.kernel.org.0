Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 882E65A2876
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 15:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245496AbiHZNYl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 09:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiHZNYk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 09:24:40 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17D1D8B01
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 06:24:39 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id t11-20020a17090a510b00b001fac77e9d1fso8056153pjh.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 06:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=8uro9lCtd8NysvGK5k23aKGMiWT4gKBsxfPGfZl+NlA=;
        b=kjxwALsGfWTCbe2l1vkHQBL3j35YlKcw35ucXtgz0QMLFOjuSypqGHqNLINeThA57o
         qO7TP9d6neZQ3cqm9niRZ5bt7VzumI/G/PfFat4wEkdPfLGaSpMioVPpqQuYOCZdA5fH
         ZtCApZqPVjN7gaVRKA/vy0Yez0Psh0S1b0MvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=8uro9lCtd8NysvGK5k23aKGMiWT4gKBsxfPGfZl+NlA=;
        b=XkiFIq7BA2to6KuEPKxlvU5XBUpZeDAdIU2Z02ugHGFNS8CtJSOGFVkYXs87CBlkn+
         XU+PLQ+IvIWKzQmcypae+thsTLx1BW6mbMW7pAtvyXfJ+E8noLrY/hUjRH7szJE5LKkS
         009Vaa2rHUr1bGg8Wda7IXNMri2To39aWimVl9h0+f1xKyM+iAQvzowy/Cv38uQFfd3O
         fkXYtcVh2vVdD2qiD95g8MXB1294/+Bn9+EgZ9U2tK4TSJtm7WuRWjYWzMCFLWoV7eUF
         n9uqZgD5mLavfkhwGhel/OPiLC/IYE1X4nCiZV9K/eLIq8fzdn2XulQNW75IbgvBtXi6
         IMBg==
X-Gm-Message-State: ACgBeo2N6lzKQEuHgY8FsGz57kbUc4hdeNmhjHoazG6nztY6QYYz76Xn
        eHje2mCA6U9eAx9JHYrdqaQ84Q==
X-Google-Smtp-Source: AA6agR4sB1kkKQdyVoGlQybrFcgwDdq7voFZ0KhqW4H2B3UTW/x4fLxfd2zY6RFsZ4KdFacdB8Zwtg==
X-Received: by 2002:a17:903:230d:b0:174:45bb:f576 with SMTP id d13-20020a170903230d00b0017445bbf576mr1205200plh.86.1661520279211;
        Fri, 26 Aug 2022 06:24:39 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:2a3c:773f:ac25:a127])
        by smtp.gmail.com with UTF8SMTPSA id p22-20020a170902a41600b00172c8b5df10sm1534927plq.208.2022.08.26.06.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 06:24:38 -0700 (PDT)
Date:   Fri, 26 Aug 2022 06:24:37 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sc7280: Keep USB GDSC power domains
 on when USB wakeup is enabled
Message-ID: <YwjJlRE1qRskZi/y@google.com>
References: <20220822115246.1.I45235b7c40997bc2abf813e4722b4dcdd6aecf6b@changeid>
 <20220822115246.2.If09027f73daa6e1ed95f5eab02326b543c67132e@changeid>
 <YwS3FCOqIeajMEgz@hovoldconsulting.com>
 <YwUDjaG6n95Ddij2@google.com>
 <YwXlsK3pjK/q1xwO@hovoldconsulting.com>
 <Ywf02oIXEL8G/Heo@google.com>
 <YwjFD9uHnSxoZHvT@google.com>
 <YwjGpSXOscDwbvQH@hovoldconsulting.com>
 <YwjIadKu0Wv2+VDk@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YwjIadKu0Wv2+VDk@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 26, 2022 at 06:19:37AM -0700, Matthias Kaehlcke wrote:
> On Fri, Aug 26, 2022 at 03:12:05PM +0200, Johan Hovold wrote:
> > On Fri, Aug 26, 2022 at 06:05:19AM -0700, Matthias Kaehlcke wrote:
> > > On Thu, Aug 25, 2022 at 03:16:58PM -0700, Matthias Kaehlcke wrote:
> > > > On Wed, Aug 24, 2022 at 10:47:44AM +0200, Johan Hovold wrote:
> > 
> > > > > The wakeup setting doesn't seem to have anything to do with the genpd
> > > > > issues on sc8280xp and the controller doesn't resume properly regardless
> > > > > of whether the PHYs have been disabled or not during suspend unless the
> > > > > PD is left on.
> > > > 
> > > > I'm essentially seeing the same. USB is hosed after resume unless the PD
> > > > is left on.
> > > > 
> > > > On Chrome OS we currently work around that with a version of commit
> > > > d9be8d5c5b03 ("usb: dwc3: qcom: Keep power domain on to retain controller
> > > > status") which was reverted upstream. I'm not sure whether USB worked after
> > > > resume before we enabled wakeup support. I would have sworn it did, but we
> > > > landed an old version of the wakeup patches a long time ago, so my
> > > > memory might be failing me.
> > > 
> > > I need to remind myself that keeping the GDSC on is only needed when the PHYs
> > > are kept on. The PHYs were always off before wakeup support was added, which
> > > is why USB wasn't broken after suspend in the pre-wakeup days.
> > 
> > Ok, so to be clear: if you disable wakeup with my patches applied so
> > that the PD is actually turned off, USB still resumes with only
> > GENPD_FLAG_ACTIVE_WAKEUP set?

Actually without GENPD_FLAG_ACTIVE_WAKEUP

> > That is, you don't need to set ALWAYS_ON as I do with sc8280xp?
> 
> Correct
> 
> The USB controller isn't entirely happy:
> 
> [   23.062936] xhci-hcd xhci-hcd.13.auto: xHC error in resume, USBSTS 0x411, Reinit
> 
> but USB still works.
