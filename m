Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4915A6B71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 19:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbiH3R5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 13:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbiH3R4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 13:56:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBFB5FCA
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661882086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KyMZvr6hAWXwFXLqf6lBA2tiJ+OBR6yqQ8sBvG7FzcY=;
        b=aQE/jz6jG7F/0A3+zbcuHY9pRYdpgowLZ6zC6zbsgzUC7qL/b/O7+FTMRw3Xt6DqyLZWUF
        D0YGElyhzIdV3dvpz+KlVUHzdpQb7MqPJmyeqX2aRICtmm/A2gQ8pdd+TnnmfzsHdgp6Cb
        wJgC98Rw5hKkdqMnTE/sjQpvLXHLBEQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-XhGjbT2UMhiV0w4yD7J0_g-1; Tue, 30 Aug 2022 13:54:45 -0400
X-MC-Unique: XhGjbT2UMhiV0w4yD7J0_g-1
Received: by mail-qv1-f69.google.com with SMTP id o6-20020ad443c6000000b00495d04028a6so7598206qvs.18
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=KyMZvr6hAWXwFXLqf6lBA2tiJ+OBR6yqQ8sBvG7FzcY=;
        b=cGMOprC4uJ9DuwhTjqWevwTNXp7HCi1EqFGnp7JeakhKNupX7rZD7ENd/qkjR+vCRE
         mPvOziZ6e5bx3IbU0oX77OPeFw2Nytg9azCoB6J9951BRj1XJ9Vdf5GdgYj5iV/c1pNf
         8b8Nuh+lB50t02YXkq/cQVAjqkX/4BK6tz9HQTnfBUozgLvAWGLlp8ocqcIwGvDzoEbc
         sx+cBnQik5XjnFXrqCQuUggh5mh+x8WJ/qs4L1Z9fcl/zgOgVUElGviPliCD+yiGHTd2
         0Ds3BGnh3pbkei+ZJuKbnS9j5EP8M4ZT02HBZ/RBdv7kwOuQKVZL+jk/h5Zi8pgxspPT
         WicA==
X-Gm-Message-State: ACgBeo0Kwjlz7XorBWuxF8G4e+NEGWNaRdMkmo+YXMz/skvVVdC8nsuN
        pBKJxgSHmiBFZtr8Azu/7wAJXDv2LUiUo9BET8GNoGe4/Vws7Y2bFgaTi4oD41Zkh/9hXXNhBnb
        yDjN0cZT3UlNxLsE4ao0Lhqq0ow==
X-Received: by 2002:a05:6214:2688:b0:498:f68a:95ba with SMTP id gm8-20020a056214268800b00498f68a95bamr14179816qvb.111.1661882085159;
        Tue, 30 Aug 2022 10:54:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4qAeiQMuaFdflH8tw95Vsb1sWJJ+E2pL2XUc8mixCOYiKT+SeO0L8eikwDkJC3PjcRGTK5kQ==
X-Received: by 2002:a05:6214:2688:b0:498:f68a:95ba with SMTP id gm8-20020a056214268800b00498f68a95bamr14179793qvb.111.1661882084909;
        Tue, 30 Aug 2022 10:54:44 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id de14-20020a05620a370e00b006bba9575621sm8151252qkb.68.2022.08.30.10.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 10:54:44 -0700 (PDT)
Date:   Tue, 30 Aug 2022 13:54:43 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: correct ref_aux clock for
 ufs_mem_phy
Message-ID: <Yw5O44dxLE3+7tdF@xps13>
References: <20220825163755.683843-1-bmasney@redhat.com>
 <20220829222826.xlusmyfrdgzeo3wq@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829222826.xlusmyfrdgzeo3wq@builder.lan>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 29, 2022 at 05:28:26PM -0500, Bjorn Andersson wrote:
> On Thu, Aug 25, 2022 at 12:37:55PM -0400, Brian Masney wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > index 49ea8b5612fc..4117ec0ffefc 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > @@ -892,7 +892,7 @@ ufs_mem_phy: phy@1d87000 {
> >  			clock-names = "ref",
> >  				      "ref_aux";
> >  			clocks = <&rpmhcc RPMH_CXO_CLK>,
> > -				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> > +				 <&gcc GCC_UFS_REF_CLKREF_CLK>;
> 
> I would expect that "ref" was going to be GCC_UFS_REF_CLKREF_CLK and
> "ref_aux" would remain PHY_AUX. But the mapping here is not clear to me.
> 
> But does that work for you? (i.e. clocks = <CLKREF>, <PHY_AUX>)

Yes, that works for me. I'll send out a new revision shortly.

Brian

