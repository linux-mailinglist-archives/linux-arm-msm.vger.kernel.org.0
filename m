Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCE624FE9C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 23:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiDLVCN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 17:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiDLVBy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 17:01:54 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC33146B7B
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 13:52:05 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id w17-20020a056830111100b005b22c584b93so14169522otq.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 13:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E/sfuAYENU6UCHVTWqjFkHV1/OSU1AIAFVjMvfNyJ5k=;
        b=wHUAnWUOVTPZ0YoLJMOSVtGGQZHYba4E5Nb/7yndemn1YzYnQDp9JX7Sla5M/2OShh
         JdHuMh9a0HG+wltK0D/G9iflV38ag2iC5fwzIEV6lYXZ6q8xNlDmQRf++iJpG4q8muyA
         Uj9eGVzjzNR6o+qx5utWqwZ/1XMP/GISj9MAkqTwtHnMLIjVoNtNHrhD4wRh3uLwVWbF
         EEpjn9NRHsbk1v5PFGsXFfXsZs3jIelQBHh+SFG5pXIppMvUeYTKBcVuNTtofrgKbI2P
         4tXBqNzsWur6OZt6If3nTcdsTaHpwlqRUSU6h8/P1x8EBYqwlyiuQbqvwfvKEE0uCDMI
         ncSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E/sfuAYENU6UCHVTWqjFkHV1/OSU1AIAFVjMvfNyJ5k=;
        b=L37b7NFTiKPxyb3d56zS0fNtlj4igehwLF+i0yUa3PqxiLvywRa/PFYD5ht0DqlaLP
         9qLcO0MQY7aHalwRSno24Nq6JktcIMekpPSr8wZMBOh+MImwsZ96/iFrwIB76kYs9Q4P
         CCytRYIcoT3xd/tnBg67unllIoxMPcmgX/G3UbAAjMyusn6VSmuJjR727PwiKO2Gj8nf
         R5XBs/KbZS9IoQpDf38rihfFTkAFqdHLIIIKfQiGsCSVcSRDOsn6TPgiszcJengLMoB8
         M4D43RceII0d9F+kTEOR+D4tBSU/6Xbh+QpbQ/2yFZ6TI3ehBuETKgSPRIsVYl6krIMp
         +1YQ==
X-Gm-Message-State: AOAM530yaFMaRw5oWmTNM3PeZuzLMs4OUPSzpQD/BBX2xHDhq28bsFvs
        U2P77qwcdD6S8PTmc1WHv2SaTQ==
X-Google-Smtp-Source: ABdhPJwjcIvzgdEJLnuijwZQ02tCKe+ogBaa/q1YYFlZAZ+Xy8RMe6e4X1zADMRvNMJtvgts4wtLqA==
X-Received: by 2002:a05:6830:4409:b0:5cd:ad47:5b47 with SMTP id q9-20020a056830440900b005cdad475b47mr14024722otv.49.1649796687913;
        Tue, 12 Apr 2022 13:51:27 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u20-20020a4a9e94000000b003291f6ac4b2sm12602878ook.28.2022.04.12.13.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 13:51:27 -0700 (PDT)
Date:   Tue, 12 Apr 2022 15:51:25 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: delete incorrect ufs
 interconnect fields
Message-ID: <YlXmTbKwYtvLSjgp@builder.lan>
References: <20220407172145.31903-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407172145.31903-1-jonathan@marek.ca>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 07 Apr 12:21 CDT 2022, Jonathan Marek wrote:

> Upstream sm8450.dtsi has #interconnect-cells = <2>; so these are wrong.
> Ignored and undocumented with upstream UFS driver so delete for now.
> 

Just to clarify, the binding do document interconnects and the property
should be there in the end. v1 (why isn't this marked v2?) was correct.

What I asked for was a statement on why it should be picked up for
v5.18-rc (as Dmitry requested).

Regards,
Bjorn

> Fixes: aa2d0bf04a3c ("arm64: dts: qcom: sm8450: add interconnect nodes")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 2c18e1ef9e82d..90cdbec3cac99 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -1663,9 +1663,6 @@ ufs_mem_hc: ufshc@1d84000 {
>  
>  			iommus = <&apps_smmu 0xe0 0x0>;
>  
> -			interconnects = <&aggre1_noc MASTER_UFS_MEM &mc_virt SLAVE_EBI1>,
> -					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_UFS_MEM_CFG>;
> -			interconnect-names = "ufs-ddr", "cpu-ufs";
>  			clock-names =
>  				"core_clk",
>  				"bus_aggr_clk",
> -- 
> 2.26.1
> 
