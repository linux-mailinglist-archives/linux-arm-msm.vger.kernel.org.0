Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96FBE5E6A30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 19:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbiIVR7y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 13:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbiIVR7p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 13:59:45 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67650106A34
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 10:59:07 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id b24so11921893ljk.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 10:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Dk/La6d+Fw7ngy8Z2bVHKAcTv0OWniRC3ZPnBeC5j/M=;
        b=vqnQ2/8hMgvJ8S2Eo6J2YBb0YqvTjfD8oHMY2l9VWJoGB6XS1bvhabne17nVKq8t4Y
         ELzQWfz5142+Ybifs0e3h4jcT2m8NVdLJ8zl+SGt51YhBwhUD00X/YckOFHCzOe+Js1a
         njnNLXStnLnEFLf/UtQzvRf9hMs/5f+2vPP4avY6QsO+kntMBnLl8DPGjwxO1ttL9iVQ
         OP0w+eGZHrXS7BWDJFzxlFsBXZwWtZbNx8fnS8FwQUap5HiZEha2wnK3ra2nesJ6oByN
         yDoyWI/ko8cc2hS6cvk6kh4GQs7ft3zZh0NFfpT14SbNDtrXfmGz9E5mioKIPbuNVufw
         6PdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Dk/La6d+Fw7ngy8Z2bVHKAcTv0OWniRC3ZPnBeC5j/M=;
        b=fVCR989Oxbt2sGrO6XAmALaLJpi9bP1yWZitjywuCWChC38kylrF5yUKhgonGv+g0n
         j9SwxEffkQ1idCrc5rw30Hkw2Z0qY4l5tIEQjiKd8InMWp8Mwh73UcTSCr9L88AvFtC9
         1Ukd+NaVMbOjk9H0hUAB9NWfO7oBKgJV42r8m257UocLqeULvH8/gsW7IMz19Iao7l00
         yNelmToPwEIe5AdX2HsSXJVIt6DjCFKqhmnK/Zj6FUU8mgBe5JxVMHu7HwayaeB7a6gN
         jBwpx5JZk7HQxlI6OG0NCkIXUrnTIDtoFJKY4mMOR0L9N4oPWDNbiP+0gw3tsj4UQ+DL
         FVGw==
X-Gm-Message-State: ACrzQf0pcEuLDk1PpXVyRRrsco5mjo9okXI2Y/X28mgkhzHE5QGFnXLh
        9TLljprR+Qsls09ndyW1opV3BA==
X-Google-Smtp-Source: AMsMyM4UC7f72eiLOYztldMh+D0gw1UqQjEStL+/Fm0tUvUhaiBX8aw1IzTtQcTID1wmwFieGnQ4Mg==
X-Received: by 2002:a2e:9d88:0:b0:26a:95c1:218f with SMTP id c8-20020a2e9d88000000b0026a95c1218fmr1514214ljj.223.1663869545092;
        Thu, 22 Sep 2022 10:59:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 8-20020a2eb948000000b00261e7244887sm986414ljs.60.2022.09.22.10.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 10:59:04 -0700 (PDT)
Message-ID: <a8dcb033-2da7-7946-68df-9ebbe229c858@linaro.org>
Date:   Thu, 22 Sep 2022 20:59:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 10/17] phy: qcom-qmp-pcie: drop unused config field
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220920073826.20811-1-johan+linaro@kernel.org>
 <20220920073826.20811-11-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220920073826.20811-11-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 10:38, Johan Hovold wrote:
> Drop the unused mask_com_pcs_ready field from struct qmp_phy_cfg.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

