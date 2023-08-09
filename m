Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 372C8776A82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 22:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbjHIUrb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 16:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjHIUrb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 16:47:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D94A100
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 13:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691614006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=85iBUVX8eS0NmdKzdH/Axj5AnNYS26psyU6bLHIwJdo=;
        b=ACxudyZ4LhqPcXOoRch6+rOqvH8mkh0S5hoRtUMawcuQ8DPZw9UkHxf9RoOfqOZqbdzW9p
        QFGpZK6tw3PuQnl7RVT+/eVE3w6/rlynIdp+BGPvwr6MdR768FjMvshGKXW2JfSHp0c9X7
        ZQ1s8XcdM7w8drCEpD1HroQu2zASzaQ=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-H_AcwKLBNNSDJ1cOTgwPmA-1; Wed, 09 Aug 2023 16:46:45 -0400
X-MC-Unique: H_AcwKLBNNSDJ1cOTgwPmA-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1bf00c27c39so193214fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 13:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691614004; x=1692218804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85iBUVX8eS0NmdKzdH/Axj5AnNYS26psyU6bLHIwJdo=;
        b=YQNeBnrdDnva1O6ffeDWFq8lIZjI4yG+iRPutEa1zLi8HAWMDJWOf9j8nCKfKllDma
         GPHQ9hXROfIezM9s2VXTR5a0eddULE1Az/Nzc+MjlyXFBWZQfHXT5Td5Sn5eS3+MX5F6
         YPuHYtftawYtcMvmV+Px/0tOXtzWrthGph3xtyUMAJoKBySS2VIzm8xsSF6Er6yGfszN
         gwwQQM0zCuqEUwbPsAz/COkT1hpywfn792UnAEETbMippwvbv6ELcM8dN04DVmVxdcg0
         NUgWp5tFEGMUTiEK9j1vHVLsbmmeF2SWVANdzNyoiic5RgWF/S0GlDvAiIvKietXbiQ7
         4VMQ==
X-Gm-Message-State: AOJu0Yy9xT1PonipONe5hi013R6a1EiNHpgPIF/zvOK1aEVGGwOMPA0n
        N3yAuvkIH9gll+jPRsIJPx3LGhrDNiLyyXCdeKgAYjpnmtCaGerAZgW5wJWFncd47uAzRcbGzKw
        9daXVDm0jUl8pZQ3Q0N0ExZf8lmmG/z7nPg==
X-Received: by 2002:a05:6870:5582:b0:1bf:d05f:f77 with SMTP id n2-20020a056870558200b001bfd05f0f77mr409991oao.48.1691614004598;
        Wed, 09 Aug 2023 13:46:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTQI8VRZ5ZtLNFhgexiawYP5A6CmaRJ60ckOfjRSba4+LVLgx2G+xZX97LXEEFCJ6PqJ2IWA==
X-Received: by 2002:a05:6870:5582:b0:1bf:d05f:f77 with SMTP id n2-20020a056870558200b001bfd05f0f77mr409962oao.48.1691614004283;
        Wed, 09 Aug 2023 13:46:44 -0700 (PDT)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id d8-20020a0ce448000000b0063d26033b74sm4733922qvm.39.2023.08.09.13.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 13:46:43 -0700 (PDT)
Date:   Wed, 9 Aug 2023 16:46:43 -0400
From:   Eric Chanudet <echanude@redhat.com>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8540p-ride: enable rtc
Message-ID: <xraquthrzcadd7aucxym4e4x72barlq6dbmbsbxcn7pbr2yehv@amyzztu3xmcg>
References: <20230718145105.3464105-1-echanude@redhat.com>
 <dtussvqzf7x5p633pxt3julkffhzt5rxwp3aghs4ocj5odq4la@ed6jhcv76hbk>
 <20230808213646.GK1428172@hu-bjorande-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808213646.GK1428172@hu-bjorande-lv.qualcomm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 08, 2023 at 02:36:46PM -0700, Bjorn Andersson wrote:
> On Fri, Jul 21, 2023 at 08:59:30PM -0700, Bjorn Andersson wrote:
> > On Tue, Jul 18, 2023 at 10:46:10AM -0400, Eric Chanudet wrote:
> > > diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > [..]
> > > +&pmm8540a_sdam_7 {
> > > +	status = "okay";
> > > +
> > > +	rtc_offset: rtc-offset@ac {
> > > +		reg = <0xac 0x4>;
> > 
> > I'm still trying to get confirmation that this is a good choice.
> > 
> 
> I'm recommended that you use 0xa0 from SDAM2, "preferably in the second
> PMM8540", instead.
> 
> Can you please give this a try, Eric?

That worked, the offset was saved and read back upon rebooting from the
system. I did get a defer on some tests waiting for the second pmic,
which I presume is not surprising:
[    0.257064] spmi spmi-0: PMIC arbiter version v5 (0x50020000)
[    8.340386] platform c440000.spmi:pmic@0:rtc@6000: error -EPROBE_DEFER: wait for supplier /soc@0/spmi@c440000/pmic@4/nvram@b110/rtc-offset@a0
[    8.393201] platform c440000.spmi:pmic@0:rtc@6000: error -EPROBE_DEFER: wait for supplier /soc@0/spmi@c440000/pmic@4/nvram@b110/rtc-offset@a0
[    8.465407] rtc-pm8xxx c440000.spmi:pmic@0:rtc@6000: registered as rtc0
[    8.479612] rtc-pm8xxx c440000.spmi:pmic@0:rtc@6000: setting system clock to 2023-08-09T19:16:08 UTC (1691608568)

Here is the v3 with the changes:
    https://lore.kernel.org/linux-arm-msm/20230809203506.1833205-1-echanude@redhat.com

Thank you again for the feedback.

-- 
Eric Chanudet

