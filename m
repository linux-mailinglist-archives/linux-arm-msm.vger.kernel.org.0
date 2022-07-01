Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FF3562992
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 05:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbiGADbs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 23:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbiGADbr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 23:31:47 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 862C164D68
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 20:31:45 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id t26-20020a9d775a000000b006168f7563daso937965otl.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 20:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZiaU89OVHm63V0UGROxSVJOO8la4NVk/3ha8tuzuKeQ=;
        b=OdlreLJfy0SXAtKiTq80dMGBsFyD8HfgB0Nlq9cBZMhcGdxxiuCSGNU3XZTNm568VH
         X/tt3M0T9yu6P29uBaldlvZGMWf4IRaM1aV70HeyQ5V0rQuqBQ6HelaQW+epEeFLm56X
         8DxG0DrvAwBYkpsXa6hVi0tYFAnE4Um2pkM9hlcZa2Zprid33dvQV/OEY9GIuM1RoMgW
         OFOMbAg4RWDdssNejwHW4p6CuWbuB9fXr6THlVIUQazDNA0LKmSq5G1OzLYRS0uw7IUh
         581M7moNdxDoNC5rnPT7dTUeHrJv0xGU6a/NTZ4F/qIoHfcXem3DVR8sGDc74YbvpzuL
         nf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZiaU89OVHm63V0UGROxSVJOO8la4NVk/3ha8tuzuKeQ=;
        b=tlIV8lK87h5nFXms5HPQPUeu2wBlCpaRuWbCMWiHEQ/dKXAXhLuWb3LKH2EhfQruZi
         M9Vk9H0YsJOFC6DdHP/psznByfQ1WPp9Py969zoT4e2NR/MsBlJPGSb85vz+fDVfdt2l
         1ddWXSQzJop7Um4BIJ9Jj/cpetoXjA6hT9MySWrWizWba9/947UhOIypf3Ghcyn6KRUw
         eK0yPG8QvmtxaWT3GHHIFUwsz/v5mqXSPSSYsymmMTXYS62kKme/Nr/DUXOnbraJnmOl
         rTc2u9Q5jLpr9cTJ1udggCLAdv+iBA+nZKB+Pohcx30MT9bWwEcnlyxanMyf3+jtIRVg
         qLuA==
X-Gm-Message-State: AJIora9Rdzci+icqM1t+v5aT8II8saanlSQhJOrYpDm7fj3QbV5y61Gl
        WeBi+k3IYpvwlDWfLCC1JJzpeA==
X-Google-Smtp-Source: AGRyM1tJmXBVVywte56R8p70kn2sBUpcXKOAEbilUCyluZ0/sf2PYVbaydM0czJ3V09xsv3gMhixfw==
X-Received: by 2002:a9d:4793:0:b0:616:e39f:50cb with SMTP id b19-20020a9d4793000000b00616e39f50cbmr5670171otf.375.1656646304897;
        Thu, 30 Jun 2022 20:31:44 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z1-20020a9d4681000000b0060bff068228sm11762428ote.66.2022.06.30.20.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 20:31:44 -0700 (PDT)
Date:   Thu, 30 Jun 2022 22:31:41 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8953: add MDSS
Message-ID: <Yr5qnRH0bCB+vfuX@builder.lan>
References: <20220610225304.267508-1-luca@z3ntu.xyz>
 <20220610225304.267508-2-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610225304.267508-2-luca@z3ntu.xyz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 10 Jun 17:53 CDT 2022, Luca Weiss wrote:
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index ffc3ec2cd3bc..a2aca3d05899 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -726,6 +726,208 @@ tcsr_phy_clk_scheme_sel: syscon@193f044 {
>  			reg = <0x193f044 0x4>;
>  		};
>  
> +		mdss: mdss@1a00000 {
[..]
> +			dsi0: dsi@1a94000 {

If you label these mdss_dsi0: etc, they group nicely in the board.dts
when you're enabling/configuring them.

Regards,
Bjorn

