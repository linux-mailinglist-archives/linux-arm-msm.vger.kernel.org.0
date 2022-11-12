Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8C8626763
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 07:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234116AbiKLGRf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 01:17:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbiKLGRe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 01:17:34 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3806BBE0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:17:32 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id u2so6724685ljl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pb0xzePKTvk1sIDJI6C17RlkL9caXSOtGAOsYmi0A4U=;
        b=P1JK8356e8F/P7MiYDq+M8azjFuPmn4c3oEkM6Xlr62VxdYhGebooK27xnGI0Q0/C0
         aW4huooHMAgUHqwCVzlCfwVycWigqVMIeRGK8f75TnHuNO0iU8O0da6zOpq6VGgaHRLD
         S0rxsnAMKVVpUkCF/7G+vsF2WHE5eIPjucdfdYFB2YyvHU/iZVFcLEXRjzTchQjiJEKR
         DK87WNrOjDGaaLFn8rSs8dHRrGQhyET+JVY43/AKG3Gh4+m/lZ8R7ct2v8iWJZhtDU2a
         VmQi9lnZbwj2FHA/bOX3bIesjZ6F0KBi5RGq315/bEaw3l4xXoRx947UJCRJrEodv/aB
         I8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pb0xzePKTvk1sIDJI6C17RlkL9caXSOtGAOsYmi0A4U=;
        b=CDg5BLvUR4HWJF6w5Rf2/wjTyIT8xLDKhy6pvLXcpQsyShYpU5IVHHxJFAPEmy3ugr
         N/mNNtxeOtI1o6++IVjj+60lWrcDlm9gigSElZhfo3xSQpp0WqO3Zs33rIL8sLwNFl7d
         lYClu4EjUxBIWd3tnCS/DpVCFa4KZavWsBkqSNwluERn5FGCA5t0N/m+hqYJ8bsY09DU
         y/Dmm7V5FKl6f6lgsO44glZCGwPY/In1hTiME8aYN1tncqVFg/Fe+9a1yXFoywbdag+E
         mKKtrV+Qi4gi3AO/F5zFd4Z7SYSdt0byWqk4C4cLVZIf+3J4m+VczIMuC68gInkiMyZ5
         C7wg==
X-Gm-Message-State: ANoB5plryD/A44mPNGlwOXC3aFn9cT0wQkILOdoZQ0MwdWeQhEewIj/B
        A1Cxz0YjQpQrLNfMdeVq1TtwjA==
X-Google-Smtp-Source: AA0mqf5J3YdRUe9n4OzmClvX4Xdm3vOmLCnK3EXmHB6pS6yT+quSrtsn/e9A0DVJG4BR6ODbVqmE0w==
X-Received: by 2002:a2e:9d85:0:b0:277:100c:db42 with SMTP id c5-20020a2e9d85000000b00277100cdb42mr1442858ljj.417.1668233850616;
        Fri, 11 Nov 2022 22:17:30 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u11-20020a2eb80b000000b0026dc7b59d8esm759476ljo.22.2022.11.11.22.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 22:17:30 -0800 (PST)
Message-ID: <c685cfc8-adec-31e6-c45a-f0e63d85cfcf@linaro.org>
Date:   Sat, 12 Nov 2022 09:17:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 5/6] phy: qcom-qmp-combo: fix runtime suspend
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111084255.8963-1-johan+linaro@kernel.org>
 <20221111084255.8963-6-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111084255.8963-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 11:42, Johan Hovold wrote:
> Drop the confused runtime-suspend type check which effectively broke
> runtime PM if the DP child node happens to be parsed before the USB
> child node during probe (e.g. due to order of child nodes in the
> devicetree).
> 
> Instead use the new driver data USB PHY pointer to access the USB
> configuration and resources.
> 
> Fixes: ac0d239936bd ("phy: qcom-qmp: Add support for runtime PM")

I belive the Fixes tag is incorrect. One can not easily backport this 
patch on top of the original ac0d239936bd. I'd suggest to point the 
Fixes tags to the addition of phy-qcom-qmp-combo.c

> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

