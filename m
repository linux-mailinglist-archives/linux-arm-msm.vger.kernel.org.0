Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBE2D5FB414
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 16:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiJKOFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 10:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiJKOFV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 10:05:21 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2131EC7D
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 07:05:20 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id f9so16931447ljk.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmJosukTcNXPq7QpHRkQ7HCuPYF8BwzQnDoh2vNnO6I=;
        b=gyS7VEpV9tQaMXim08Y4nduzhuIEz2ky+dX/U0PWXSvzQrjAS9tPCvFcoRIF8MjqE7
         rxevgYcUfAXY0b6ERYAiMXnPafQNlWh9sHkokv+d2s+rDI2O5SHez91xh+YejrZ1rzDC
         aNCkTBiuYG49DoYsXC8OItML2EYHP3RSTKH51siJiEOKeL/Q4TuKJbqDFYUZTZQUtiZE
         AbCWBGDel9qaxCS6qJKT1kifEeL/O/XUL7Zun5lk/EYhRe+/Fe1z3Wygp/VxHC46SBgU
         CN3X4IEu0/J0n98Kg0fbk+BpFTvMAjsG+E20jQnzA9HrSuHaYzPf3NEkxEMdDn2WZfUv
         bIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmJosukTcNXPq7QpHRkQ7HCuPYF8BwzQnDoh2vNnO6I=;
        b=ynMGDXqziSFLFER9n3MG5NwKc5t2luaQ70yBTpZLU0WtMir1q14e+kObFHMmN22iF2
         SiBLBuhH3YlmyOl8kywwPeMpeA4jviFyrKfMwKx1zJIfIO02sCfeWn6eNKVTNO0UawMB
         fOZ/EnsxBQ0ghaNpZdBL2/IoblKcLKnQc9DptuydLfzcRChsTrvaO/cvROjPHLyuhvJ+
         vFv1kaF1Jgqqv5H8g2PFPGIEW2pPoJj3G1pDt4ejOCHxJfre/ZI8muhatbNS5EAF0I2H
         YKjHZYBMC2UUnD0M/aWJe8jl1xCx0Bkdi0pb74u0sGdYcUw+IrAkUgp6C0PCibGTgLpy
         e41g==
X-Gm-Message-State: ACrzQf1IuM7yHjQ+e0SduXyLt6epUZqflEwsV0mWehxx771jEsQcI+rw
        vE0wz7+eBdsxtGD7kQG2JlnTvg==
X-Google-Smtp-Source: AMsMyM4/ghz+u0OuwIx9672vf3jqEPPcpS2RYAYfYGtZSIDWv7zQCEGyQK7EOwS5pgq8yfvg0ufRZg==
X-Received: by 2002:a05:651c:11c3:b0:26d:fb49:4b12 with SMTP id z3-20020a05651c11c300b0026dfb494b12mr8765815ljo.492.1665497118693;
        Tue, 11 Oct 2022 07:05:18 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512324900b004a054535826sm1886488lfr.24.2022.10.11.07.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 07:05:18 -0700 (PDT)
Message-ID: <2fed12b6-b3a5-a360-f040-fc8b1d3ced20@linaro.org>
Date:   Tue, 11 Oct 2022 17:05:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 11/13] phy: qcom-qmp-combo: drop power-down delay config
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221011131416.2478-1-johan+linaro@kernel.org>
 <20221011131416.2478-12-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221011131416.2478-12-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2022 16:14, Johan Hovold wrote:
> The power-down delay was included in the first version of the QMP driver
> as an optional delay after powering on the PHY (using
> POWER_DOWN_CONTROL) and just before starting it. Later changes modified
> this sequence by powering on before initialising the PHY, but the
> optional delay stayed where it was (i.e. before starting the PHY).
> 
> The vendor driver does not use a delay before starting the PHY and this
> is likely not needed on any platform unless there is a corresponding
> delay in the vendor kernel init sequence tables (i.e. in devicetree).
> 
> Let's keep the delay for now, but drop the redundant delay period
> configuration while increasing the unnecessarily low timer slack
> somewhat.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 16 +---------------
>   1 file changed, 1 insertion(+), 15 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

