Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6723764CC05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 15:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238607AbiLNOUK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 09:20:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238573AbiLNOUB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 09:20:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E66A27917
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 06:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671027556;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VnHPF+rT+uxzFh2qnfDKhbS/mGO9WLcyE9+qRGeeSiU=;
        b=F8AqYnlSXItgbLCFduLWYUdMMKNz/nUkzTyTFyZGL2Z0q8RR41asMNjOxYl8cjQyAA8Efs
        pDr2sToNCu8PgDvbcM6yfGLPr1ABM8EROPmDZQcWooPhpdZPIoWsMdCxAkwsUgKv9Baxy4
        lpmuzxN9Y6UP8ubbGDrJNnNNelUl+sc=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-SQcGm9iDMNO4D45709PS6Q-1; Wed, 14 Dec 2022 09:19:15 -0500
X-MC-Unique: SQcGm9iDMNO4D45709PS6Q-1
Received: by mail-yb1-f198.google.com with SMTP id z17-20020a25e311000000b00719e04e59e1so17596777ybd.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 06:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnHPF+rT+uxzFh2qnfDKhbS/mGO9WLcyE9+qRGeeSiU=;
        b=TCPFnN/1RWG9xnUYwkkn1DAazI1vJyI23bqrklgLg0GPpog6da6nHqNL1PphMcXTE1
         ed8agMuHnaWNtQSRRln8Pk0Q/CKhpxLZZ9MmlZkYs/uLj61QSa4q3qIOtD+KT859nu42
         FUR6qVxw2nwF2o/85MGGRmnoS42hXVTrG+NJK1RZDRHtrl/Q6zd6t1b9uwZWu84F9+hq
         X/k10HfNLUgq4OhOHavbX1VNLtwdFDWpe2mrFtsvmW4wlbRr7Zn+mZuNCSuFnpoDuuxC
         0jXjJfVE68yYlxZ7kfjZVhsB7nHQCMhgclVp2uqJ2ancaA3qw0qtE+UECYVD+uJpd0x0
         UsMA==
X-Gm-Message-State: ANoB5plnAPstShUOq0KvkMOQC3aPrJlXqzq/DWGZ09ck5Bar3iPBjQ47
        zHG6zxbKGMP/5YO7/9pEaWnKj3BcNP+qB30muSoqj0ADLh36n9PwS2lR15hEJZ1D+ACbzjRv+34
        htZOu1u0lcYJQ4EQ7r+8GQTAbYg==
X-Received: by 2002:a05:7500:631a:b0:ea:e73c:c9d9 with SMTP id ib26-20020a057500631a00b000eae73cc9d9mr2084822gab.74.1671027554601;
        Wed, 14 Dec 2022 06:19:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4M8gk6ERWJLXB85lECMuXRMVYwywgQboEJDo1cIqnNM/1JlBJKJOyBlDeY+mBZzkUaJ+IFvw==
X-Received: by 2002:a05:7500:631a:b0:ea:e73c:c9d9 with SMTP id ib26-20020a057500631a00b000eae73cc9d9mr2084791gab.74.1671027554237;
        Wed, 14 Dec 2022 06:19:14 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id l24-20020ae9f018000000b006fc2b672950sm9894907qkg.37.2022.12.14.06.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 06:19:13 -0800 (PST)
Date:   Wed, 14 Dec 2022 09:19:12 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        quic_shazhuss@quicinc.com, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8540p-ride: add qup1_i2c15 and
 qup2_i2c18 nodes
Message-ID: <Y5nbYG4sJm97V2FS@x1>
References: <20221212182314.1902632-1-bmasney@redhat.com>
 <20221212182314.1902632-4-bmasney@redhat.com>
 <309b3fad-933c-6c45-5cd7-4e082da62c15@linaro.org>
 <Y5nB1epKN4nbk3ma@x1>
 <eca6f882-ad01-5b41-bb7e-552193e4a903@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eca6f882-ad01-5b41-bb7e-552193e4a903@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 14, 2022 at 01:52:17PM +0100, Krzysztof Kozlowski wrote:
> On 14/12/2022 13:30, Brian Masney wrote:
> > I triple checked that I have the QUP pins defined correctly for the 5
> > buses. I checked them against what's in the downstream kernel and I also
> > checked them against what's in upstream's
> > drivers/pinctrl/qcom/pinctrl-sc8280xp.c. This is the pin mapping that I
> 
> What's the base of this kernel? Are you sure you have d21f4b7ffc22?

I'm based on top of linux-next-20221208 with no other changes. I have
that commit.

   commit d21f4b7ffc22c009da925046b69b15af08de9d75
   Author: Douglas Anderson <dianders@chromium.org>
   Date:   Fri Oct 14 10:33:18 2022 -0700

      pinctrl: qcom: Avoid glitching lines when we first mux to output


On Wed, Dec 14, 2022 at 01:53:38PM +0100, Konrad Dybcio wrote:
> > This is the style where i2cdetect seems to be happy for all 5 buses and
> > is fast:
> > 
> >     i2c0_default: i2c0-default-state {
> >         mux-pins {
> >             pins = "gpio135", "gpio136";
> >             function = "qup0";
> >         };
> > 
> >         config-pins {
> >             pins = "gpio135", "gpio136";
> >             drive-strength = <2>;
> >             bias-pull-up;
> >         };
> >     };
> Unless you made a typo somewhere, I genuinely have no explanation for this..

I have my unpublished v2 patch set committed to my tree and a clean tree
according to git. I started with the state that I have quoted above. As I
did the various tests I described in my last email, I would do a
'git diff' just to be sure that I didn't have any typos.

I'll wait to hear from Shazad about whether or not the output that I got
from i2cdetect is supposed to be the same for those 5 buses.

Brian

