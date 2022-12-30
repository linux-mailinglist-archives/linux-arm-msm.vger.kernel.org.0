Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37B4E6596B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 10:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234795AbiL3JUY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 04:20:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234891AbiL3JUP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 04:20:15 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484CD1A201
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 01:20:14 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id n3so18656028wrc.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 01:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+lt3n3rG4Y9lEnTnt6F68qMx8dXRezJp1CS2q5yx68c=;
        b=EZmeAzqjxZoo5qSHNrVV/kUBc/pe0vnExRlFi4wZ32pNr0cAq2NpYgidG7pnNZQeLt
         H7+oxjbq9Jv1SFUVeTqc6CsUtblk9mLb8skbVQj+/b7YBdogxKwDMqGPSqFZtQAsigV5
         iNuiG91zs1zX6s19Kxk7nuR0ONv0YgO8iFHfHSdtvlQb3ApiCJqNTTEqr56Pl8Gs1/Oz
         mY38aIOL9BgxZix8GVCu8qoYM6Dl9+h07Qh5B/qDhWFctL/vsHHZ2xmufRkn93LzwxR8
         t0TE35s5o1cLgVm4WXAvzICNHBomgf99ko0SNmqKGb565KWAclbIekTLlSXF1fZV6iOq
         cA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lt3n3rG4Y9lEnTnt6F68qMx8dXRezJp1CS2q5yx68c=;
        b=fWSXPJwXCTIRYcf1UAOGg+sUl/6SQhipCYbq6G2KXuNjz6kZ4Od+4PhMNrcVrZaNXy
         8qByuynZuNRMCa3acl8ffEimG7e1K7C9v0UojdtLVSZ86foFcPWSMB/cAtoGbN4/u10X
         0pVCxuguE9W+Y45DruaPkMlmT8SG0bRfEuormBH1ge8I5RAkJHYIiqwEJMDR7tu0bI4u
         syUaKkaJIBoRzhFRjGiiis8XRRcurglrKW0VI/UQ11o/4TVlGafMgyPgFDw8Qm826+Y9
         ji4g8CkjPpIpX/gn0+TCoJCifyLSc3dwu1Hk+AwLmt6VBf6LsJXXc9C8titbwz2Nc2KS
         Fx3Q==
X-Gm-Message-State: AFqh2koI4EubhuG7touSsR3ayep0b0EeDl5JpdVoG9cy5d2qISTYIXUx
        5L/3ICXFl+x//81YHNl81fXtKbC7+gOJMV1Q
X-Google-Smtp-Source: AMrXdXsxRFqhUQkGFaEdxIUamk2HnFD7/ql/BysxaOE1KK/YBtvo8PfSmK8ryUb7nORcuIyJsfBjrQ==
X-Received: by 2002:a05:6000:234:b0:28f:62f:b4eb with SMTP id l20-20020a056000023400b0028f062fb4ebmr1101525wrz.44.1672392012795;
        Fri, 30 Dec 2022 01:20:12 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id j5-20020adfea45000000b0024206ed539fsm20126081wrn.66.2022.12.30.01.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 01:20:12 -0800 (PST)
Date:   Fri, 30 Dec 2022 11:20:11 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-x13s: Add RTC support
Message-ID: <Y66tSyDKOkH3T1BT@linaro.org>
References: <20221230085010.717423-1-abel.vesa@linaro.org>
 <Y66qkR+WWkopNzQ4@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y66qkR+WWkopNzQ4@hovoldconsulting.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-12-30 10:08:33, Johan Hovold wrote:
> Hi Abel,
> 
> On Fri, Dec 30, 2022 at 10:50:10AM +0200, Abel Vesa wrote:
> > The PMK8350 PMIC has an available RTC block. Describe it in
> > sc8280xp-pmics dtsi and enable it in Lenovo Thinkpad X13s specific dts.
> > Mark it as wakeup-source to allow waking the system from sleep.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> I'm currently working on proper RTC support which implies reading and
> storing the time offset from EFI.
> 
> This patch in itself is pretty much useless as the returned time is just
> some random time from the epoch (e.g. in the 1970's).
> 
> So I suggest waiting another week or so until I'm done.

Sure thing. Consider this dropped then.

Please CC me when you have something so I can try it out.

Thanks,
Abel

> 
> Johan
