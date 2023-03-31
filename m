Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1686B6D2856
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 20:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232330AbjCaS4s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 14:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233228AbjCaS4Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 14:56:25 -0400
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDA523FDF;
        Fri, 31 Mar 2023 11:56:14 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id bi31so17391330oib.9;
        Fri, 31 Mar 2023 11:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680288973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRYjfKN3eK3vnBIG5oj6mxdR/iFPW7kkC2GPzDxU+F0=;
        b=A8WlG5No6f5Frze7s5F2DMIxoVpK73x4ZzadCTmiFJwDsYBduHyGNL5lYcueK9bc72
         mgk5ajNxtd9EUT45+1DSphP4PE1LdxIxhCpilVFttJIzOf7YWiOmCbB8F5j4OYUKb7Ls
         ID33zWsUFPvtLpUb2a1Gaq/cyg/r7/zk8bTzX7sqm+Xswp0fYj3+/81UlgjheOl3Nbli
         Lp8rYMw0BLryhfLSbG8GxHHz9LeVtE48UeBzC4J0L9Bp55qH1Vy2xwZJ/3ux9/vwZ3Cl
         yYwyASdyN4gkXD5nrz2ktRpVTBQJGhn9dxd/prGGUcTGTQljfRZnGPWoaCT+6v1ZNhlH
         suDw==
X-Gm-Message-State: AAQBX9cbinOLBgmYfbd5cofKy+JLQz+Ag0vMPkgFt6YIVnq8z5b1xhiS
        5PJ3kVIon4jfX+xSGExLIQ==
X-Google-Smtp-Source: AKy350bIDeTcfXjKXMCdouCUmqZoQzF2jlr3OoSKVKdzBeGpGQzJ5XI0jorXx7xo1T9jDrsYb0ibDg==
X-Received: by 2002:a05:6808:13cb:b0:389:7d24:def5 with SMTP id d11-20020a05680813cb00b003897d24def5mr3621775oiw.10.1680288972707;
        Fri, 31 Mar 2023 11:56:12 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w8-20020a056808018800b003896b3269d3sm1263329oic.20.2023.03.31.11.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 11:56:12 -0700 (PDT)
Received: (nullmailer pid 1946699 invoked by uid 1000);
        Fri, 31 Mar 2023 18:56:11 -0000
Date:   Fri, 31 Mar 2023 13:56:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: add
 sm8150 USB+DP PHY
Message-ID: <168028897102.1946640.12125439806794137069.robh@kernel.org>
References: <20230324215550.1966809-1-dmitry.baryshkov@linaro.org>
 <20230324215550.1966809-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324215550.1966809-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sat, 25 Mar 2023 00:55:46 +0300, Dmitry Baryshkov wrote:
> Add bindings for sm8150 USB+DP PHY. These bindings follow the older
> style as this is a quick conversion to simplify further driver cleanup.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

