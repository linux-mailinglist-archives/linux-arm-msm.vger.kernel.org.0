Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 619EA6B96F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 14:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbjCNN4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 09:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbjCNNzm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 09:55:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE7C7A8F
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 06:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678801996;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=27KQYZgjkZx3cO9u5MRtjq+WwG0d0GtPOCjo6zjWpFI=;
        b=T+MkSe9kx3BlrRELLxiAlM2xiVqd/Stk1vTOqYJc2mMGeJtN8uNwtixYULjzRz/3rpH4lb
        wJwBxfiEN+V83eflgUOzjafrUCoTrvCdBmngJULK7oyMyl4cXkhY9SDUPODO3kW9EId25w
        LUiiWIl3+bOLDtv71X4cOqUMvabK/QI=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-DMPPS-rpPOSmwp-VAetFBg-1; Tue, 14 Mar 2023 09:53:15 -0400
X-MC-Unique: DMPPS-rpPOSmwp-VAetFBg-1
Received: by mail-oi1-f200.google.com with SMTP id q25-20020a056808201900b0037fcc209e73so7010437oiw.21
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 06:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678801993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27KQYZgjkZx3cO9u5MRtjq+WwG0d0GtPOCjo6zjWpFI=;
        b=GNS/A0PuCdfBYEJAkgr2BXaiaru9YnjRDl9/H1FN2kEPLAhxyG9ewaGFXKr88wQaJL
         sJ1evDnuMy2rHn33y75K7ipgGTl0pYSI6HYfdCLGCMe79HF9I3hDaBMQr2K6ACL32tG8
         CIqjpsxpnbJEgzbPh8KE8YaVfMY+5AWdQhCvCH6lcKHt9jI+QKZuXjBtDPDB6SLDUzBW
         C/gB733h+dIZfn46s2XgLsrSlfeNGY5Ri91sC46nfBLwKyhVun7FAOwWWCnjwzDfb2ei
         cS2w8lQQ3h5NfK44QnkfA6RPDPEJzFN6tQ4z5Dzxuqg+4zsTpkwZ9Xyni5V1Zs4zp+gh
         Ay5A==
X-Gm-Message-State: AO0yUKVOL7XdmW41Jhf7+NiUBHAYBnHCkHBRsOG68t4yb1QosewPEfOU
        w1mamTYhAnLFgQwJkS6jxtkaPsC08V4EMTxH5OmLfDKX6SN+oHhpgqMPvGy8xTrApuxxzqzHaak
        hafqoyrSY5p9a+nxR3guGDqYzCZeUB7xpFgJM
X-Received: by 2002:a05:6870:40c5:b0:177:9f48:6282 with SMTP id l5-20020a05687040c500b001779f486282mr5967637oal.53.1678801992952;
        Tue, 14 Mar 2023 06:53:12 -0700 (PDT)
X-Google-Smtp-Source: AK7set865OV+J0WHIBTC/561ECQlv4RbYP6x5QMO3SK6tB+6M0mPsz58Rsx3evTgj9Holgi7Z6/nvg==
X-Received: by 2002:a05:6870:40c5:b0:177:9f48:6282 with SMTP id l5-20020a05687040c500b001779f486282mr5967618oal.53.1678801992726;
        Tue, 14 Mar 2023 06:53:12 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id an36-20020a056871b1a400b00177c314a358sm1088290oac.22.2023.03.14.06.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 06:53:12 -0700 (PDT)
Date:   Tue, 14 Mar 2023 08:53:09 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Stephen Boyd <sboyd@kernel.org>, andersson@kernel.org
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
        joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
        richardcochran@gmail.com, linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com
Subject: Re: [PATCH net-next 05/11] clk: qcom: gcc-sc8280xp: Add EMAC GDSCs
Message-ID: <20230314135309.o7y2ofzdvpowu53j@halaney-x13s>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-6-ahalaney@redhat.com>
 <e5cb46e8874b12dbe438be12ee0cf949.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5cb46e8874b12dbe438be12ee0cf949.sboyd@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn,

On Mon, Mar 13, 2023 at 03:57:27PM -0700, Stephen Boyd wrote:
> Quoting Andrew Halaney (2023-03-13 09:56:14)
> > Add the EMAC GDSCs to allow the EMAC hardware to be enabled.
> > 
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 
> I'm not sure if Bjorn Andersson is planning on modifying this file too,
> so please confirm it can go through netdev tree.
> 

Can you please help respond to Stephen's comment above? I admittedly
don't have much experience sending patch series that span across
multiple subsystems, so if there's something I should be doing
differently (to indicate who takes what patches, etc) in submission
please do not hesitate to be overly verbose in instructing me!

Thanks,
Andrew

