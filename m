Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB9F97D816E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 13:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbjJZLCN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 07:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbjJZLCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 07:02:12 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9099418A
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 04:02:09 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-507ad511315so1091184e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 04:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698318128; x=1698922928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFTiVkbcygW9fRAqDmMAspuZYfVMMqoc65jUqQ9G+ng=;
        b=slPCDwNaSxXQz/dxbRUiWHB8rhWsYd5HpioT1I8BDtDknECorurvfhHW1JVdUd39TI
         XkdYFcOuywgF1FMrBa0D/3f2lnhDJyAILb+fENADf97IeUfilxpfoEGpDbgAncMZKH40
         VxrhEzxK9XOLx5wX+Skv6hsEr24Ur3k3ZF+8kjFmwttk8a6HBEBTaA3f/DFljaYPXEIy
         FPDef0BwUQR5rmuD4gKKRWOoDFpJUtI9PITQexeKMyFyel88Urdv2pSz+oD5klB2NRgT
         RrskEoR8w4R5CVGxbyyVDKL7CgmJxNlTVUZqi3w/f6IlanLvbxiiWz9aA9RqrgjOIQh0
         D1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698318128; x=1698922928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFTiVkbcygW9fRAqDmMAspuZYfVMMqoc65jUqQ9G+ng=;
        b=UkTYbUK3KUGRfZxPDl6TXdsrTaCGrC6QbYgmWKdDhfeVnLvIYE44wtQbK4hrVIKyQt
         M3agsbbqt1CUjbcHuQRSRK6zTwxf5HQJNGXPc2D11gllIY65AvNLVvjBvL/28lfpbdpP
         /0XfwjjhqPS4mN6S1blvGPy9VHIePyMW41Al0NS6QxVDBReyLACmduL+p/szZrSJeB9N
         ai/Dd3IMoUkG14axNi++PMGZsC4MTc9QsL/GwI3UTTApHbVD/emwHSKt1Xp4LK98jD4m
         IX+HdjfgPuNK1Ou6PzK6kTy+9fmQ/zW4VqPCvVdRfgsi2HoFu3pHgtiBYp2BExogdMGR
         LaLQ==
X-Gm-Message-State: AOJu0YzGQtibeYA8OUF9cAvhebwfBPlb+J6UyzxG4RU0Prx2rAclQMCk
        ydppWiIjj3qj80KxnQGvpfp8Xw==
X-Google-Smtp-Source: AGHT+IHuKulB9emKJgqQ69HvVbewPB34ttNv0u9Y6mDJc7Y5W4nrW5hskThJPgFfTpuOkCKhANk+DQ==
X-Received: by 2002:a19:9155:0:b0:503:18c3:d874 with SMTP id y21-20020a199155000000b0050318c3d874mr11332085lfj.45.1698318127810;
        Thu, 26 Oct 2023 04:02:07 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id m7-20020ac24247000000b005079d34f330sm2956190lfl.282.2023.10.26.04.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 04:02:07 -0700 (PDT)
Message-ID: <147be4db-647f-43d6-a242-cb38a2c96295@linaro.org>
Date:   Thu, 26 Oct 2023 13:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add configuration data for SC8380XP
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     agross@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tsoni@quicinc.com, neil.armstrong@linaro.org
References: <20231025134632.10363-1-quic_sibis@quicinc.com>
 <20231025134632.10363-3-quic_sibis@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025134632.10363-3-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/23 15:46, Sibi Sankar wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add LLCC configuration data for SC8380XP SoC.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
Just double-checking, has this been updated for R2?

Konrad
