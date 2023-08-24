Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC29787887
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 21:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243223AbjHXTdU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 15:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243279AbjHXTdL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 15:33:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94121BDF
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 12:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692905541;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aGc9cpVc07Jrpa4m+ZlC2Dqf1SWjc2bcrlw26RbiYEM=;
        b=Isi7ktw2fF9feVmLTrmSlkEzWYVqmgsrlqfHy6ynr1sMRQshZmgw5nZdlDboaDpuP/uKjM
        aibOUdem5n8cO50amhNS+J7Ajb+DVgoANLU+AG3xJNs4eFmW59jdZqHin8ki2Z9R53RGqZ
        s4l0cvSRLCIELE+SD5pARFhBM1R2S8o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-6W6C7sLBP0G4aemWRCtliA-1; Thu, 24 Aug 2023 15:32:19 -0400
X-MC-Unique: 6W6C7sLBP0G4aemWRCtliA-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4108b83c5d9so1365341cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 12:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692905539; x=1693510339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGc9cpVc07Jrpa4m+ZlC2Dqf1SWjc2bcrlw26RbiYEM=;
        b=TT31oW1j7cpAy9uFivz3/J5LHjat65wvf6fkszpqOvJYbAPP9/orSKtjT/jsiZLHTd
         E/ZElLZkm5wqugju+bDTGzh7hPM7FCAiSLFTM9ca+VwL0soc5LoA65mwdntHdn3Dlqyn
         +ZRlnRN6DJJ53eA0C2IGQisgQqbFplx/stSP9iaYdEqUMrG7hY5U4TovIlUHOPABUX74
         QomGgxOMOANFpYLOX42aIyhXut5rLA/LV57dvtQswWpoTg0j7wCeqTVEeFZG0x8wYUEZ
         p3D8xGovDHQz6B6wHeUwxEYCZOIh5jYKK8FNOrBd07BK/BU8libXZxPKiowh6HnvHM0i
         i+hQ==
X-Gm-Message-State: AOJu0YyFZPFBcYgPlr+JIeHVPS+NZrz7XxUClNyxJY6U+72l1kLoAIns
        lGRUKewDhFJ375gYe7oNi+2LzBw3eJUtqONObRi6aW6pu+Uoi91ATltTl84KPdrmPY6uzI0lLFj
        50b3Yyoz9rtj7C1NCEhYE5MzIDg==
X-Received: by 2002:a05:622a:1487:b0:40c:58a1:cb40 with SMTP id t7-20020a05622a148700b0040c58a1cb40mr20548255qtx.15.1692905539166;
        Thu, 24 Aug 2023 12:32:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdST5BuBuTrnazY9AWTggT5EsX33ppFmfU4jEDIDGm4YECxH/HVy+4/5VKL35ToB2UzdKC0g==
X-Received: by 2002:a05:622a:1487:b0:40c:58a1:cb40 with SMTP id t7-20020a05622a148700b0040c58a1cb40mr20548241qtx.15.1692905538934;
        Thu, 24 Aug 2023 12:32:18 -0700 (PDT)
Received: from fedora ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id w25-20020ac84d19000000b0040f200feb4fsm42063qtv.80.2023.08.24.12.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 12:32:18 -0700 (PDT)
Date:   Thu, 24 Aug 2023 15:32:16 -0400
From:   Adrien Thierry <athierry@redhat.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 0/2] phy: qcom-qmp-usb: fix initialization of PCS_USB
Message-ID: <ZOewQCtdAv8LYhww@fedora>
References: <20230823171208.18382-1-athierry@redhat.com>
 <bd0c9cba-41e2-b449-f383-9970d00cb723@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd0c9cba-41e2-b449-f383-9970d00cb723@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On Thu, Aug 24, 2023 at 10:15:32AM +0100, Bryan O'Donoghue wrote:
> On 23/08/2023 18:12, Adrien Thierry wrote:
> > This series attempts at making sure PCS_USB registers are properly
> > initialized. Please note I don't have access to the qmp phy datasheet and
> > only reasoned from the code, so I appreciate a double check to make sure
> > I'm not messing with the registers.
> > 
> > Adrien Thierry (2):
> >    phy: qcom-qmp-usb: initialize PCS_USB registers
> >    phy: qcom-qmp-usb: split PCS_USB init table for sc8280xp and sa8775p
> > 
> >   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 22 +++++++++++++++++-----
> >   1 file changed, 17 insertions(+), 5 deletions(-)
> > 
> 
> How is this series tested ? What are the before/after results/effects ?
> 

I tested this series on the sa8775p. AFAICT there's no noticeable change
before/after the patch series: lsusb and dmesg output are the same. USB is
still working properly. I don't know what those PCS_USB registers do
exactly on the qmp PHY and I don't have access to docs, so it's hard for
me to tell the impact of them being initialized vs not.

> ---
> bod

Best,
Adrien

