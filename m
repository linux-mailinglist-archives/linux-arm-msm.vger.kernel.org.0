Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12EA64B915
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 17:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235640AbiLMQAk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 11:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234624AbiLMQAi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 11:00:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D921F21B5
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 07:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670947192;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VKfcx7pkq8LkHwoqbOrspcVXGem6hw74j7W+b/DBJjE=;
        b=eHv9qLIo7xoVVUnfoPMZUONJdUxWNAwr+OTBMzr+ldlBSQkIfS3BAseZK+TviqjZ3UKOxZ
        bLRyVc0Snv6a4jZw/gZUylYNNtw81PhFtTzGnn5RaLkUPdOXwwYxKz2lvG6GNmk0MC8F97
        8tmGFziaa+TEb+d0k2YWjH3/7j/G2Bc=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-15-zlydAssmMxST-T3cSFGJbQ-1; Tue, 13 Dec 2022 10:59:50 -0500
X-MC-Unique: zlydAssmMxST-T3cSFGJbQ-1
Received: by mail-il1-f200.google.com with SMTP id a11-20020a92c54b000000b003034a80704fso7735259ilj.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 07:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKfcx7pkq8LkHwoqbOrspcVXGem6hw74j7W+b/DBJjE=;
        b=H9rZtiYfkU+Mx6uc96aEQzPOqvBb+n5Ju2ijldjmM8tHequ83opjiuF9pO/HRBw01f
         fwBrkUIygLxw0J3UQeNj/RU5UAT5hrKbjcv716pzfePHxJkEtfWybji5rVGcmK1M8tMF
         OODRwsj/O9q7cqbQzuyewWcKEsDoThME2HTBdRk6yaKpOyGaxq1jy0tK+JFG99z4l+dZ
         +RRflw6sGrd75KnMXufuj1XUWWOOazOCplFRkicZUyLI+gZ/zBYbylt8mbMbuKL0IIfq
         WtT5QflyPJnCJ6UVY2yks9vQdXd8VorADQMqwg8q+LhYZtzNoUQ7m7t+DgbL/kbgI+hK
         Y3eQ==
X-Gm-Message-State: ANoB5pnokj2+WJiYG11CF2IGI4f+rmdfQ1yN0IxXjLWLH90R1Hn4GUhQ
        B4Q+WCQhFmNx6RwUi9PwlwFTl6XFmfMzr6iaWdsgqOeupA8AnxND3J5D7NPZ3OhaDMEYVVgK64A
        2mQClhePpnhi4ydjHNaAEATpApA==
X-Received: by 2002:a5d:8ac8:0:b0:6bc:d712:8bcd with SMTP id e8-20020a5d8ac8000000b006bcd7128bcdmr10964573iot.21.1670947189884;
        Tue, 13 Dec 2022 07:59:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4RyM/tNgJp/BidYuSNp90JmxZFBwrBqK2Yha1hSQQq+15GZXjPHmkGKGhC7C6qWogwTcmFAA==
X-Received: by 2002:a5d:8ac8:0:b0:6bc:d712:8bcd with SMTP id e8-20020a5d8ac8000000b006bcd7128bcdmr10964554iot.21.1670947189666;
        Tue, 13 Dec 2022 07:59:49 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id q29-20020a02b05d000000b00389e1f5751asm966242jah.65.2022.12.13.07.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 07:59:49 -0800 (PST)
Date:   Tue, 13 Dec 2022 10:59:47 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc8280xp: rename i2c5 to i2c21
Message-ID: <Y5ihczgZs1RBJ0IN@x1>
References: <20221212182314.1902632-1-bmasney@redhat.com>
 <20221212182314.1902632-2-bmasney@redhat.com>
 <Y5iSDehp72mQPc+h@hovoldconsulting.com>
 <Y5iXjTQnEtMCZy7W@hovoldconsulting.com>
 <114e960f-3b63-8c8f-9d4a-87173049d730@linaro.org>
 <Y5ibG29yKQgD54Dn@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5ibG29yKQgD54Dn@hovoldconsulting.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 13, 2022 at 04:32:43PM +0100, Johan Hovold wrote:
> On Tue, Dec 13, 2022 at 04:29:04PM +0100, Konrad Dybcio wrote:
> > On 13.12.2022 16:17, Johan Hovold wrote:
> > > It appears sc8280xp is the only qcom platform using a qup prefix (even
> > > if some older platform use a blsp equivalent), and we're not even using
> > > it consistently as we, for example, have both
> > > 
> > > 	qup2_uart17, and
> > > 	qup2_i2c5
> > > 
> > > (where the former should have been qup2_uart1).
> > > 
> > > So either we fix up the current labels or just drop the qup prefixes and
> > > use a flat naming scheme (e.g. uart17 and i2c21).
> 
> > Oh, I didn't notice that! I suppose sticking with i2cN as we've been
> > doing ever since i2c-geni was introduced sounds like the best option..
> 
> Yeah, sounds good to me.

This makes sense and I'll fix up the existing geni nodes and my new
nodes in v2.

I noticed another inconsistency with sc8280xp.dtsi compared to other
platforms. I left off all of the pin mappings in sc8280xp.dtsi and
added them to the sa8540-ride.dts file since the existing sc8280xp.dtsi
file contains no pin mappings. Other platforms such as sm8450.dtsi,
sm8350.dtsi, and sm8250.dtsi contain the geni pin mappings. My
understanding is that these geni pins are fixed within the SoC and
don't change with the different boards. Should I also add the geni
pin mappings to sc8280xp.dtsi?

Brian

