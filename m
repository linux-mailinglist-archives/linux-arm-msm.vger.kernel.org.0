Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D337A5B0EA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 22:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiIGUy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 16:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiIGUyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 16:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B09DDD
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 13:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662584062;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lupOQBDl9M+eSrYMhhygPunyzKVvpUXpQehMzs92JzM=;
        b=E/nw5opgR5c4+9Zsp0XxyLJQ4XSk+FG/wl3AirlHFXqpTLPMohGIjAseXDxtvX1wADAGSc
        khrC3sDwlBrBu2/OR2R8AZoKl7ckHEyrDd2xKgPEeSOibFWi4+lY6qX+GKsYHfxBtFSJK8
        6Se58iLvf8uxjo3gpIFhXSfVSo/I2Bc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-10XLWeEDNqmPye21SCWl8A-1; Wed, 07 Sep 2022 16:54:21 -0400
X-MC-Unique: 10XLWeEDNqmPye21SCWl8A-1
Received: by mail-qk1-f200.google.com with SMTP id bp11-20020a05620a458b00b006bbeffab91dso12793952qkb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 13:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=lupOQBDl9M+eSrYMhhygPunyzKVvpUXpQehMzs92JzM=;
        b=pH8nvk7GqnwxAxElHcehCeYKhMp4YETyESHdv7HANLVJzKI07q498AbRrK2h0xGXDo
         CTM3Ez1jXGUYvNWC++yLjMMsBG8uKVzlvxUsglyX4A1Qqnd+8yE1j3LJpTBBdpnVYKJU
         bx76vri32QIafa+NjswsBfnGGoJmuBeQuBlBkdGMtOi8QIWBodSMISpUNHNlUSBJzQFr
         neVHobWpQfo3cBR/F8y7D4nnA3HjOeSgkkRkz0dy2u2AZP53rsE8ct6zGtKdbKGNx3BZ
         LaBQgLL+Gq99Pp7oSIdxsukb2WlETDKFkYlazMrMLhj8qlK3ekRuhLaMgJGEsqYGdXFv
         0now==
X-Gm-Message-State: ACgBeo1pvGo9ZbUGZIcppA1fkqHL6JxG0lAvK40uy9pS0IjBOEdr8fci
        heHH3hHJA/Oo3E332moBmpqe+WuqOSWV3deSZp9Z1887OEzw+G1NXROHVV5zYPYs2Jqm3W3WhOv
        jihMglsktUig0eIhNPs/gk0VBhw==
X-Received: by 2002:a05:620a:4409:b0:6bb:58d6:9d3e with SMTP id v9-20020a05620a440900b006bb58d69d3emr4182725qkp.472.1662584060834;
        Wed, 07 Sep 2022 13:54:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7L4bEXDaQgMSdiQE5EAuc4myKBDtzzkSS9v/3Qub/TknkF3WOqYwNNW1Kuzl3D8ReYrShccg==
X-Received: by 2002:a05:620a:4409:b0:6bb:58d6:9d3e with SMTP id v9-20020a05620a440900b006bb58d69d3emr4182709qkp.472.1662584060629;
        Wed, 07 Sep 2022 13:54:20 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::a])
        by smtp.gmail.com with ESMTPSA id q34-20020a05620a2a6200b006cbbc3daaacsm224671qkp.113.2022.09.07.13.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:54:20 -0700 (PDT)
Date:   Wed, 7 Sep 2022 15:54:18 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dianders@chromium.org
Subject: Re: [PATCH v2] regulator: dt-bindings: qcom,rpmh: Indicate
 regulator-allow-set-load dependencies
Message-ID: <20220907205418.lqwxwyebqlt6lm7z@halaneylaptop>
References: <20220906201959.69920-1-ahalaney@redhat.com>
 <Yxg5+9lkHnNsI30j@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yxg5+9lkHnNsI30j@hovoldconsulting.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 07, 2022 at 08:28:11AM +0200, Johan Hovold wrote:
> On Tue, Sep 06, 2022 at 03:19:59PM -0500, Andrew Halaney wrote:
> > For RPMH regulators it doesn't make sense to indicate
> > regulator-allow-set-load without saying what modes you can switch to,
> > so be sure to indicate a dependency on regulator-allowed-modes.
> > 
> > With this in place devicetree validation can catch issues like this:
> > 
> >     /mnt/extrassd/git/linux-next/arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: pm8350-rpmh-regulators: ldo5: 'regulator-allowed-modes' is a dependency of 'regulator-allow-set-load'
> >             From schema: /mnt/extrassd/git/linux-next/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > 
> > Suggested-by: Johan Hovold <johan@kernel.org>
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> 
> Looks good to me.
> 
> Reviewed-by: Johan Hovold <johan+kernel@kernel.org>
> 
> > ---
> > 
> > v1: https://lore.kernel.org/linux-arm-msm/20220902185148.635292-1-ahalaney@redhat.com/
> > Changes since v1:
> >   - Dropped first two patches in the series as they were user error
> >     (thanks Krzysztof for highlighting this!)
> >   - No change in the remaining patch
> > 
> > Krzysztof also asked if this patch in particular should apply to other
> > regulators, which I think it should for those regulator's who implement
> > set_mode(). Unfortunately I don't know of a good way to get that
> > information in order to apply it at a broader scope for devicetree
> > regulator validation. At least with this in place RPMH users can get
> > better coverage... if someone has suggestions for how to broaden the
> > scope I'm all ears!
> 
> I guess the commit message could have tried to capture that is feature
> of the hardware (as Linux implementation details shouldn't impact the
> binding). And apparently there are regulators that do not need this
> (e.g. RPM).
> 
> Johan
> 

Thanks for the suggestion Johan. I've posted another spin with that
addition and your (and Douglas') R-B tags over here:

    https://lore.kernel.org/linux-arm-msm/20220907204924.173030-1-ahalaney@redhat.com/T/#u

Thanks,
Andrew

