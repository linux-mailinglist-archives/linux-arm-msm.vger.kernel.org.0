Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24F8E6125B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 23:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiJ2Vzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 17:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiJ2Vzs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 17:55:48 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1551A205
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 14:55:46 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id u11so12494480ljk.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 14:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ebz8DsXHyuMRTypjp3FqQKi0fJVFR4oscki6XfcLec0=;
        b=YqaMaYH1R4LKhk9GVQ3J931j7/r1rJ67dJwly1lLUDCUIiIkjM2uSrXore5RHz8yxv
         c8ql2/Yuju0KKbHgzz871gz2EAV1QkG31q/TctGsLfvGmg0kdUL2mXo8+ul6Jph5jCuB
         Zoye5dBs4/Y1XOLOIwkaJvMRdgLfyCotcwIqk2xtIPJC7XRnMhKAFHVKtrm91C92MhjJ
         PtdG/9cewwy/7JQDmAz7J1AUlN2w3gosltqtJjNBSM1IIi4UvZnOYtpUtTQLPyo6nvkT
         2yEYiOVMjX45Q1B1bHiv8z5Rji346bck3ee9GIRRj4JFKxEJCQdcCNDAQRZwHeNW7joU
         kcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ebz8DsXHyuMRTypjp3FqQKi0fJVFR4oscki6XfcLec0=;
        b=DzMwFTLKNdkw9O4+wHW/D1lTImKKZ7k4eCfIihBZnv5cmEcQdDWeCERtSFxDpKW7MN
         QyquDlekTQTAgkg3m71/WUbql+l3EeFtjrECa2va6YCi4lljYT8nbwwtguLsH7JxJUs5
         CdUMcskk/80ZvX5cJtgMBK9k9UNwgV7F0LtMZ74RcI19nxC898tMT5y86qXnzes+dsMf
         N89VELWqFhfcqxbRtnmfGhoc/qyUg2zvWWu6VFLTepBWBvdt5cBYBbkuun2AQglb7UIC
         SyDVH2qAjDMRo2gMcnirEuzehv5KDXcazHFE9mGYQjG9MXfkR4vId7B0QCUKFMnFM+xX
         1U7Q==
X-Gm-Message-State: ACrzQf0kHzLP7Cjo+D5MY+swbETIPAsI/kMQpHBdolzOYoqEFRGrmRdW
        NO25PkDFovz3GsqY5Hnb3+3FqQ==
X-Google-Smtp-Source: AMsMyM4L6oUpTFI/a8+rVzmSsZFf2B3JCLO/0xWk74TyXBM09quMwSJgLXXMflt9QCzw0D48TG52/w==
X-Received: by 2002:a05:651c:907:b0:26e:9a6d:a55d with SMTP id e7-20020a05651c090700b0026e9a6da55dmr2402691ljq.192.1667080545216;
        Sat, 29 Oct 2022 14:55:45 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id r15-20020ac24d0f000000b00485caa0f5dfsm456469lfi.44.2022.10.29.14.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 14:55:44 -0700 (PDT)
Message-ID: <09f21c66-1673-fbf2-9626-aa7ed800ee74@linaro.org>
Date:   Sun, 30 Oct 2022 00:55:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 05/15] phy: qcom-qmp-ufs: Move HS Rate B register setting
 to tables_hs_b
Content-Language: en-GB
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org
References: <20221029141633.295650-1-manivannan.sadhasivam@linaro.org>
 <20221029141633.295650-6-manivannan.sadhasivam@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221029141633.295650-6-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/10/2022 17:16, Manivannan Sadhasivam wrote:
> Since now there is support for configuring the HS Rate B mode properly,
> let's move the register setting to tables_hs_b struct for all SoCs.
> 
> This allows the PHY to be configured in Rate A initially and then in
> Rate B if requested by the UFS driver.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

