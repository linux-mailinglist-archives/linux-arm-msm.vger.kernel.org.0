Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1467739065
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 21:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjFUTtR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 15:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjFUTtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 15:49:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2DE1733
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 12:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687376917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UUjTfOMiTDAfT6Cmu1/glc6GXab2oB6PFs6v1uS1dIE=;
        b=Yr9hSakSbWMS0NPCM2+hZKolDpQceYbmedypj9I9XPf8OjN9hbZ7AgWsfEWnnEHzPiXcpg
        TZP8VsNWBb/qfr3Gzd6qD0EacF/T/lh5HTraGvUhP+Y2Mt7t9VzvyNzdBUHTl7wt8ZV9x8
        cZjScwtheuzgUEpREXUujYjy7laJLCo=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-RowGS_JUMd6cbWslFNBRfg-1; Wed, 21 Jun 2023 15:48:36 -0400
X-MC-Unique: RowGS_JUMd6cbWslFNBRfg-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5706641dda9so85535847b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 12:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687376915; x=1689968915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUjTfOMiTDAfT6Cmu1/glc6GXab2oB6PFs6v1uS1dIE=;
        b=SYfJx+v2O4ZveSA3bqmmOsYsTqelJCIJ0/nqlC1/JYS156b13EsCG+aqfNtXJvJWIT
         Bk8kX7kHTUHroDhjEEihusxZBwuMzoCGxyB7Iz5xKPdK3iHLeb7u1dogqRPW8Javb30O
         zOu6lIfqisu9XEultU6iCMWILInJho4efttWyLsxWIWOYOsOs2saUy+vK290xjZktByO
         KBOz1s5w0cgBeTUCMbXuIrm19aj94kMj/qCQdWUjBvidJav9Jp9+OytCiyxgfbWaFLEc
         muT5dVGDzySO4pMeenm5/QbRrNEUcraKPEH9UH5xJZxbDFruC7wlnvXqv35j/rPQeICC
         hpGQ==
X-Gm-Message-State: AC+VfDxjqZhTiRip0CHmpVmiH/Cdulld1Ku+r7IX41yaPHhH9eBexR/D
        6EyIKvK2HsCbcU+ZyE1P+lkjfMOZuoasMJ/VLowQ6m45fgilis+/ogrZfSQnE0XIY8c8DDKVN63
        0sKPOt1nu23Nq0LFhc56JcqQQxQ==
X-Received: by 2002:a0d:d78c:0:b0:56f:ff75:abcc with SMTP id z134-20020a0dd78c000000b0056fff75abccmr15343905ywd.29.1687376915779;
        Wed, 21 Jun 2023 12:48:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6aRgDzpHAchzZwwGdJmkGC2tMVRjmjZQuw6bhlxfBLu3SQyZ40I9CNjGsElLG+CYm+0cCGdg==
X-Received: by 2002:a0d:d78c:0:b0:56f:ff75:abcc with SMTP id z134-20020a0dd78c000000b0056fff75abccmr15343885ywd.29.1687376915527;
        Wed, 21 Jun 2023 12:48:35 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::f])
        by smtp.gmail.com with ESMTPSA id i15-20020a0ddf0f000000b00555d2944284sm1322757ywe.67.2023.06.21.12.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 12:48:35 -0700 (PDT)
Date:   Wed, 21 Jun 2023 14:48:33 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Adrien Thierry <athierry@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Philipp Zabel <pza@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 1/2] phy: qcom-snps-femto-v2: properly enable ref clock
Message-ID: <20230621194833.iflhpjp3vtsdi3fc@halaney-x13s>
References: <20230605184455.34832-1-athierry@redhat.com>
 <20230605184455.34832-2-athierry@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605184455.34832-2-athierry@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 05, 2023 at 02:44:53PM -0400, Adrien Thierry wrote:
> The driver is not enabling the ref clock, which thus gets disabled by
> the clk_disable_unused initcall. This leads to the dwc3 controller
> failing to initialize if probed after clk_disable_unused is called, for
> instance when the driver is built as a module.
> 
> To fix this, switch to the clk_bulk API to handle both cfg_ahb and ref
> clocks at the proper places.
> 
> Note that the cfg_ahb clock is currently not used by any device tree
> instantiation of the PHY. Work needs to be done separately to fix this.
> 
> Link: https://lore.kernel.org/linux-arm-msm/ZEqvy+khHeTkC2hf@fedora/
> Fixes: 51e8114f80d0 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
> Signed-off-by: Adrien Thierry <athierry@redhat.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

