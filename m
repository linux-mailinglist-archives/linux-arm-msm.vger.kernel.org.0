Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F285557A6BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 20:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbiGSSuC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 14:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbiGSSuB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 14:50:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A4624558DF
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 11:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658256599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Zpo29MvasfiTpO+hCJwTY/XSpk51yka6wjXW4TfwPs8=;
        b=bHR7qoOrAT2Dcwh8mewcuIZywJqMEioLpPDBBzjtpnOQaHW6WRqlJqUrpQTP/cn6GZWFVW
        C9j57b+8Cqtc3T6SJKB6YSlCZg6xoccjhZ0xDRp6JF49RGeruhzRXghMQu1ykXjCVNZj7B
        263bV1hUvl9SdNf5wz5UjRQfBfhFJIw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594--nEaPw8_N_2v4ghNh0aDgA-1; Tue, 19 Jul 2022 14:49:57 -0400
X-MC-Unique: -nEaPw8_N_2v4ghNh0aDgA-1
Received: by mail-qv1-f71.google.com with SMTP id p11-20020a0cfd8b000000b0047318870bdfso7950755qvr.14
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 11:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Zpo29MvasfiTpO+hCJwTY/XSpk51yka6wjXW4TfwPs8=;
        b=DsGJYOZGiNEHk9s/v2oQs5cLzykYR8Pflc0HUXiwG6HGWSXYhADqOgHXDpbcXf3PtW
         FXnMrOA6m7BQrKYJuHHcWX4cRR9Fu+kW5eOeKi12H8M0+aN9Dg0N5WYR9tILkDAlWf1H
         wfEx67782cKK7AVzpYW/htohiQBFc3dmHVQLa0Md7AhCjRjFBeMkuw0jwygJ5UMqM61W
         ZWOcH3OT23lntBsRvyECqpEpST3yQ/lg/s8xWqNTIrY2GWmxq3Zryl4ftS74f4US29Cz
         1Tr3OVXzKgLIPIaPGB+T+KtNOBScoWxx1FSS5T41i1vekgLGfLY4AqCrg5x36MohgcuL
         X8ZA==
X-Gm-Message-State: AJIora8kBLj4X+iSgQTx1VXzrGeIFN6pEhlq+crusU5i+P6R4c9lhqbn
        9oNB2HsZomBibBwt8DNSK1bvGz95boC0MxYldfQ388ilWwkXekkrAznhwxfFTsg50A/yo+hu/sy
        XmUxgIP5BHEkIovAYR9pIw0uu/g==
X-Received: by 2002:a05:622a:1a21:b0:2f1:f29e:40a with SMTP id f33-20020a05622a1a2100b002f1f29e040amr26798508qtb.235.1658256596432;
        Tue, 19 Jul 2022 11:49:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tUmvtT6aOxIhnL81/99ndgIpfUhoigGNkE5QKN0nk4V6C1/YeKG2G1/zIX5RwrWin+GY3hVw==
X-Received: by 2002:a05:622a:1a21:b0:2f1:f29e:40a with SMTP id f33-20020a05622a1a2100b002f1f29e040amr26798489qtb.235.1658256595987;
        Tue, 19 Jul 2022 11:49:55 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id ec5-20020a05620a484500b006b59eacba61sm14223524qkb.75.2022.07.19.11.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 11:49:55 -0700 (PDT)
Date:   Tue, 19 Jul 2022 14:49:52 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com
Subject: Re: [PATCH] clk: qcom: sc8280xp: add parent to gcc_ufs_phy_axi_clk
 for sa8540p
Message-ID: <Ytb80EEEweVWHtA+@xps13>
References: <20220623142837.3140680-1-bmasney@redhat.com>
 <YtLRM7vQhimGFimN@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtLRM7vQhimGFimN@builder.lan>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jul 16, 2022 at 09:54:43AM -0500, Bjorn Andersson wrote:
> gcc_ufs_ref_clkref_clk isn't the parent of gcc_ufs_phy_axi_clk.
> 
> But I presume that if this works, then you're just enabling the ufs
> clkref clock, indirectly. Seems reasonable that you should be specifying
> gcc_ufs_ref_clkref_clk as "ref_clk" instead.
> 
> Could you please give that a go?

Hey Bjorn,

I assume you mean ref_aux on the phy with this patch:

--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1464,7 +1464,7 @@ ufs_mem_phy: phy@1d87000 {
                        clock-names = "ref",
                                      "ref_aux";
                        clocks = <&rpmhcc RPMH_CXO_CLK>,
-                                <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+                                <&gcc GCC_UFS_REF_CLKREF_CLK>;
 
                        resets = <&ufs_mem_hc 0>;
                        reset-names = "ufsphy";

This works on the sa8540p.

I tried changing ref_clk on the ufs host controller from
<&rpmhcc RPMH_CXO_CLK> to the new value and the board resets.

Brian

