Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2906107AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 04:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbiJ1CLw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 22:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234938AbiJ1CLu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 22:11:50 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 927CEA598A
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 19:11:48 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id f22so2739345qto.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 19:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lqkEG8O3RdCF5eSvHKs0ga0ET4B9mitFOaFUTFXCGVs=;
        b=Os6Q0T1dUfoGYOL+6+RHujbdE1xr2+yaX9hBMWBZ66Q5Yje9NwiDTXLvy/Tc3e2i6J
         aCO869dpnTUdEGmRLapfQllkH8T/5hZ+uH4waY8sU4K379SDEaxA1Sd5LEX0wSVh9cS6
         Ehq6hJ1/EfTsvdOCzu2gpMLRf1AdaAzMYtm6PeQHODOtMHyxgC2q5n8MGtCR5Xo4HjCE
         gHnrHA8ZrzRqffjpo0DTUGQ3ZSSmGfBLKz5x1DyAlDnfYXLfi/nyoS89eKPogh8cjRgF
         N6YGOrtQkIQlTbCWPNU2C3cQyBnT4t1DbJqpeTg58oCraThO618HyM5QWCEbr90iIY/Z
         iZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lqkEG8O3RdCF5eSvHKs0ga0ET4B9mitFOaFUTFXCGVs=;
        b=D25bWdWy3kLaN0CWJFiKqRpR0Uf1R70+yVrsuSKwEmC3jSqpn5PJlsPCQiFtXlS/xM
         BWGz/GZevcKRMnUdgspcrEOZ0FcruYlUcaG1naCZlLfMZOKJKR/CxrPgm18qQmAfF+L6
         fhMpbdNhnBXE8QugdCRpgNFOkqt/5ioiTB1zHPGbXV9bAtGNErEd14CT/lbetqihHrLf
         vqccykR7KIlC/lQcPIv52+qi76uBaHad2XSvCfsn/Z471m95I11+svMes5qzAVFJrXx7
         3IZK9TuyiFVH/7nPMUFEYzCDhnrEuQ9GFJjUsxfcInF5IYJ7WfY0t7FEYuF5gxoWpOpG
         8uFg==
X-Gm-Message-State: ACrzQf3Flks42sCzeTQ8fsUdB/IVK88e6FY+a4i3FWr5qS/ZhGGPUTGt
        iAPPb4SQof2O4iZJGfPIztSuYQ==
X-Google-Smtp-Source: AMsMyM43BQ6Snvnq1Jm5XGjqmIIYgdUbbV/PbFBr7Z4M0tReDOXXdXfhlrYUPbuq0dweZtOuAkTDtA==
X-Received: by 2002:a05:622a:1b8e:b0:39c:ec9e:46c0 with SMTP id bp14-20020a05622a1b8e00b0039cec9e46c0mr43512951qtb.329.1666923107683;
        Thu, 27 Oct 2022 19:11:47 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id w187-20020a3794c4000000b006ee957439f2sm2033202qkd.133.2022.10.27.19.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 19:11:47 -0700 (PDT)
Message-ID: <02bf2278-a204-f258-48ff-18aeec4d2858@linaro.org>
Date:   Thu, 27 Oct 2022 22:11:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 08/10] dt-bindings: phy: qcom,qmp-ufs: fix sc8280xp
 binding
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024090041.19574-1-johan+linaro@kernel.org>
 <20221024090041.19574-9-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024090041.19574-9-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 05:00, Johan Hovold wrote:
> The current QMP UFS PHY bindings are based on the original MSM8996 PCIe
> PHY binding which provided multiple PHYs per IP block and these in turn
> were described by child nodes.
> 
> The QMP UFS PHY block only provide a single PHY and the remnant child
> node does not really reflect the hardware.
> 
> The original MSM8996 binding also ended up describing the individual
> register blocks as belonging to either the wrapper node or the PHY child
> nodes.
> 
> This is an unnecessary level of detail which has lead to problems when
> later IP blocks using different register layouts have been forced to fit
> the original mould rather than updating the binding. The bindings are
> arguable also incomplete as they only the describe register blocks used
> by the current Linux drivers.
> 
> Add a new binding for the UFS QMP PHYs found on SC8280XP which further
> bindings can be based on.
> 
> Note that the current binding is simply removed instead of being
> deprecated as it was only recently merged and support for SC8280XP is
> still under development.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

