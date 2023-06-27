Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF0F9740300
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 20:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjF0SPD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 14:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbjF0SO3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 14:14:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CA83AA8
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 11:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687889570;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gLYfuVlAx6gHqUqwGmp9BqNE2UCUddYBeTQuctpCKSw=;
        b=KJWrxYHawDp5StncUyRgSYFPs4re3gn316V858zhvQ8Xmp0pdqhxpoAe0QFdKGgmlVk/Qo
        YJnoEdTpRIpnMfrl8X6/6j/+thER4Mg+0Gy2mIBPb9vho2rCT82a4uvGy47J6nwMi7aeX/
        o8/ufeFEOogtrsxyMSHobbCEQwgoQeA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-vxEyhHbrPXi-XDxlXWwB5w-1; Tue, 27 Jun 2023 14:12:48 -0400
X-MC-Unique: vxEyhHbrPXi-XDxlXWwB5w-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-76548fab0b2so549366185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 11:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687889568; x=1690481568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLYfuVlAx6gHqUqwGmp9BqNE2UCUddYBeTQuctpCKSw=;
        b=g8RHeZ+sML3qPwCa1B8gVB3HkkxHvilem3H+m6VoYOO9WtqJpJXMcmLAgM7PkfstT6
         2Dwr6Uz5fmy121MlQrnTr1z6u4NT7LbF5rieReTHxwjYi367bJqQmne6dakiIjg1RSai
         kq0LOhAFOzB3Vktljy/RloqMlyJ4K2xNtQCYluNODUyhfwF1loRW30SLXpgyUHsVSHQ/
         /ldLp3FlduEIcXsyLRC+coD9rTmwLlTGHfgCs3Z3jYGUbKZAjL7OCk+PTXIk8tRFGw7J
         Q2WoTZ5IzT82Q3zYWUmtglf48YXGytX+YADk16gxqoc6/Fo/WJna/tDwd5XOBjNKl8R3
         BOrw==
X-Gm-Message-State: AC+VfDycNPgsHTX/rLDk9puISJf3ULfJUDCqw8OOx60HJ+QrZ7AT+78I
        caxteIwEd0QFuWXEqlOZatKJZ+mROk3ABm1DO8n/Z9sB+A+VItSvNGAJQMvOmfyS5WtmbBaM97r
        NK8dcRVqmWItvxDARXEKw8dDHMw==
X-Received: by 2002:a05:620a:1923:b0:765:4f29:33e4 with SMTP id bj35-20020a05620a192300b007654f2933e4mr14462118qkb.30.1687889568390;
        Tue, 27 Jun 2023 11:12:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5omgM73cyuNOg3K2U+xkrX/vEYLoH9rMgYCcCBZ7gpeyA8WQyhkz9fJZfBmu2POAI/DSYWXw==
X-Received: by 2002:a05:620a:1923:b0:765:4f29:33e4 with SMTP id bj35-20020a05620a192300b007654f2933e4mr14462100qkb.30.1687889568179;
        Tue, 27 Jun 2023 11:12:48 -0700 (PDT)
Received: from fedora ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id h15-20020ae9ec0f000000b0075b053ab66bsm4138869qkg.50.2023.06.27.11.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 11:12:47 -0700 (PDT)
Date:   Tue, 27 Jun 2023 14:12:45 -0400
From:   Adrien Thierry <athierry@redhat.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 2/3] phy: qcom-snps-femto-v2: add system sleep PM ops
Message-ID: <ZJsmnTKFJMb4rBeR@fedora>
References: <20230622194021.80892-1-athierry@redhat.com>
 <20230622194021.80892-3-athierry@redhat.com>
 <52qapxj7sdearduro3iiqqpekrltc5zviwgq3gz4j4lne6cp5b@phikpenjras3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52qapxj7sdearduro3iiqqpekrltc5zviwgq3gz4j4lne6cp5b@phikpenjras3>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Writing another email to not muddy the waters in the previous email.

I discovered that the femto PHY PM count doesn't seem to be right. Even
when the dwc3 core runtime suspends and calls
phy_pm_runtime_put_sync(dwc->usb2_generic_phy) [1], the count equals 1
after that and the PHY is not runtime suspended.

This is because on boot, the count is incremented twice because
phy_power_on() is called twice:

First:
phy_power_on+0x120/0x184
dwc3_core_init+0x68c/0xda4
dwc3_probe+0xc84/0x1304

Second:
phy_power_on+0x120/0x184
usb_phy_roothub_power_on+0x48/0xa0
usb_add_hcd+0x94/0x604
xhci_plat_probe+0x4bc/0x6e4
xhci_generic_plat_probe+0xa0/0x104

That makes the femto PHY runtime PM impossible to test at the moment. I'm
not sure if this should be fixed on the dwc3 side or the xhci side, but
this should probably be a topic for another patch series.

Best,

Adrien

[1] https://elixir.bootlin.com/linux/latest/source/drivers/usb/dwc3/core.c#L2005

