Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48FA05AEE97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 17:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239099AbiIFPWR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 11:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239070AbiIFPWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 11:22:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B8F98582
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662474756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UR3tpVQB87hjnz6CIQkDKO5srhiUjCJi4qcya16w4tU=;
        b=FU7QTswA6Wl737PupGEYNemqRU1EHCbc8ZClIwNgIvn4diEEIxShvxG6NEtZvIxgwFPInl
        nSnrQ4rYl7Te08iES1ZryEUwYZ46P50mAGKP8XlE++ojNHRnDXQSteBcs0teMBMJ00LEj5
        Ky0CXjCMZTUDt3J/B45EYWiu+yfv+Uw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-5AEZHigONRKyTAOkpqU4hA-1; Tue, 06 Sep 2022 10:32:34 -0400
X-MC-Unique: 5AEZHigONRKyTAOkpqU4hA-1
Received: by mail-qk1-f199.google.com with SMTP id bj2-20020a05620a190200b006bba055ab6eso9269536qkb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 07:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=UR3tpVQB87hjnz6CIQkDKO5srhiUjCJi4qcya16w4tU=;
        b=C9EE/ps0pgnimkZyptdYuJAti7f+01OU25TuYxixJbkelt8N7BE8ZRrYE6F/o1X4la
         JBH1zhTaceTg0HuAJdTNpcqESJlcomLUM11GIj78JJDthDGTsG2kpG0aj/3f8jYz/t0V
         K8LHvX/nt/xvHvc7gzmSjDiKAjsnTZNaW8yrczR7189ru0eEtfphHfO5NR6YhVAu+25i
         QKr0bqnUrk/JSVUOiEsmWlfsHPq6SHVzhDc/X47dMBHVakVLOmPK5XpTfgHih4I8TmTP
         l9sgjtr0uBujaUZ2UAfRe4NvsZp5RuKTXR0iN4pQ2qrf9xz/aVoq67Yt4fPxdSR+iV/w
         A56w==
X-Gm-Message-State: ACgBeo3BKWEYq7erzrVW1dTIcGBNO7thtFAN8nC14j+cC1Poas2nEppM
        3PEBXbivlzLTq16hFeetdSybypVsZd4+5u8HQ9OjalxcbUgYdMno44moe89jglQNGCOmMPg6u3k
        ppNgJEPGQwJZYm4lhs0yF1XCqzw==
X-Received: by 2002:a05:620a:1902:b0:6b8:d90e:cef7 with SMTP id bj2-20020a05620a190200b006b8d90ecef7mr35967908qkb.131.1662474753940;
        Tue, 06 Sep 2022 07:32:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4yqmWdCMcB91qR0ZPYtY1lNOGF4Baa+YL8OcijdvG/VE2V8+OrHjcjCVGoCtYu6aw/EYDGQw==
X-Received: by 2002:a05:620a:1902:b0:6b8:d90e:cef7 with SMTP id bj2-20020a05620a190200b006b8d90ecef7mr35967879qkb.131.1662474753663;
        Tue, 06 Sep 2022 07:32:33 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::a])
        by smtp.gmail.com with ESMTPSA id r3-20020ae9d603000000b006af0ce13499sm11260719qkk.115.2022.09.06.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 07:32:33 -0700 (PDT)
Date:   Tue, 6 Sep 2022 09:32:31 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dianders@chromium.org, johan@kernel.org
Subject: Re: [PATCH 1/3] regulator: dt-bindings: qcom,rpmh: Use
 additionalProperties
Message-ID: <20220906143231.4xqg43uz2emvbe72@halaneylaptop>
References: <20220902185148.635292-1-ahalaney@redhat.com>
 <20220902185148.635292-2-ahalaney@redhat.com>
 <33c19838-2e44-2164-11c7-b14be5908809@linaro.org>
 <a10fa048-2ccc-d946-986c-c00a02d6fd71@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a10fa048-2ccc-d946-986c-c00a02d6fd71@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 05, 2022 at 06:53:23PM +0200, Krzysztof Kozlowski wrote:
> On 05/09/2022 18:45, Krzysztof Kozlowski wrote:
> > On 02/09/2022 20:51, Andrew Halaney wrote:
> >> Right now, running make dt_binding_check results in this snippet:
> >>
> >>     /mnt/extrassd/git/linux-next/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml: 'additionalProperties' is a required property
> >>             hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
> >>             from schema $id: http://devicetree.org/meta-schemas/base.yaml#
> >>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> >>     <snip..>
> >>     /mnt/extrassd/git/linux-next/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml: ignoring, error in schema:
> >>
> >> Which results in the schema not being properly evaluated. Swap out
> >> unevaluatedProperties which doesn't seem to be doing anything for
> >> additionalProperties.
> > 
> > unevaluatedProperties were required due to usage of defs-allOf
> > (ba5d99609a5e ("regulator: dt-bindings: qcom,rpmh: document supplies per
> > variant")
> > ).
> > 
> > Are you sure that it works correctly with additionalProperties?
> > 
> > Judging by errors it doesn't....
> 
> What's more - I cannot reproduce that error (latest released dtschema)...
> 

Ugh, I thought maybe I had ran into something here that was only in
linux-next, but no. I've had my environment borked the whole time I was
working on this series. So sorry about that.

I'll send a v2 once I rework things with my environment working
properly. Your comments here make sense to me -- unevaluatedProperties
makes sense here based on what I see in the example binding... so this
patch and the next will get dropped entirely.

Thanks,
Andrew

