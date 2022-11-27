Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5922639A78
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Nov 2022 13:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiK0M1J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Nov 2022 07:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiK0M1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Nov 2022 07:27:09 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34892D2ED
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 04:27:08 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id e15so2375262ljl.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 04:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRsBmhJgOiktxZ9hAbABKbiBkzI54IdKyOuZ84YupsA=;
        b=Gx6by0dHsgykNX4biM/yxpswE5R1N8WCzTw7JTn6BX+c0Kosgy18nR+TgPS2otyv3g
         Ea30viVWdk60NslLbHsxNylIvgdmQ5yh4SUOO/X6H56Ka/MfyH4F14EWih2GrhD+fFCa
         06NflOoD/nrOoCQ8l1jqbRN6NXe5VYgqxeDYCEeE2pzVzvcXwzRiKdAIdmRAcIDJlwK+
         d9q0zjM563BYtGGV+RMOHNynspJLsq6Vdx3j/Y9WK8FdzF6eWUKFNAcotdA67c0/y7ym
         xdLqutwLK9RqZUNiafEx41Mo+lDIfdPffU0Qf5B8uiwdYCMbV9rjuMROgpBvuB1cbLXN
         xOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oRsBmhJgOiktxZ9hAbABKbiBkzI54IdKyOuZ84YupsA=;
        b=5+D9DYvy4A2wXNO85n5RBZtedkdxMUkOvtnDiTwW20AbIyKD1rq/3yFNClhlw2Xdp5
         aGBHRJb6//hwJhuLXpusik2/PnvyBjMTNX27kve5FM4JRJE0zKqwL/UK2i5v2iAs0L06
         m763D66FXninnrHlizyiB5/+sTh/ntFaaQV61Kx2m19eK1NvBAeChSWj2uHw1alY4muW
         QgA9V3+IDeU7E2VkKGmVk/hpHzzAkjdJaecQcCvnPxzkrz01J87CNOcW8gG0p3lAjqrF
         IYm0CnDRVh1eBRpOFjypjQwmMHeAmhJuomXb2h4boe07j2WiZQBQmRgZLKiCTp3LlscK
         omTA==
X-Gm-Message-State: ANoB5pm5R4OrTbY8ZtynUfDqF4lTNkLg+VSCUW3SPLJWMSEWGE8Mb00p
        h6ZR6o3L0cno03zTw5OOOPmMpA==
X-Google-Smtp-Source: AA0mqf6d2iU7YNZjKcPm/9Y5uvPlIk030M+5XL1i0uu2X/FspJli+OJsUqrzuAMzquzmBo+UOCkO8w==
X-Received: by 2002:a2e:9457:0:b0:26e:6730:2da2 with SMTP id o23-20020a2e9457000000b0026e67302da2mr9384606ljh.245.1669552026517;
        Sun, 27 Nov 2022 04:27:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e5-20020ac25ca5000000b004a05837103csm1260558lfq.196.2022.11.27.04.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 04:27:05 -0800 (PST)
Message-ID: <234a38f2-68a2-2d85-b4ec-dab3e4e64025@linaro.org>
Date:   Sun, 27 Nov 2022 13:27:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: Add SM4250 support
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, agross@kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221127112204.1486337-1-bhupesh.sharma@linaro.org>
 <20221127112204.1486337-2-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127112204.1486337-2-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/11/2022 12:22, Bhupesh Sharma wrote:
> Add compatible and constants for the power domains exposed by the
> SM4250 RPM.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Konrad Dybcio <konrad.dybcio@somainline.org> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

