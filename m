Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD4B64F8862
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 22:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiDGUap (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 16:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbiDGUa3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 16:30:29 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695CE48AB3D
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 13:14:53 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d29so9443211wra.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 13:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=539tKapVnhTf+rr/UYXZW8Cq7Ffl8HHTv+MpMPMBGwU=;
        b=ffo6LfUuDcD6KO3JYi4Bph7AGnw9CfbScz/u0s/+boAFG7UTH2D4eV4A9G5S1n6Llp
         MyhQArAjnTTLRhZahWihXQWI+3bLYesLkmBOK1ffEgvcrrBsmi2zY/eNLm9eYG8HGfr0
         fVHMnwDXny2Kr09j7dKRgeIHQc9UWgqJlsrkbbpMdLGujwyCnH8JQaKTIpcZGRgMHPQX
         uhl55nyqi7NvGXWRAReZ879L1RbS25Y+QYZMBiQHFeKreSIOkqmg17F9gay/cwSOdVRB
         ptExR9O7EmEyFV5VenF12VqrgrprAmwEnA95kjwS4LQGqzgn/gcr2evW0L5OpWkgvg35
         Lm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=539tKapVnhTf+rr/UYXZW8Cq7Ffl8HHTv+MpMPMBGwU=;
        b=q6qXB7/sMEh3BX5zJkrKkLTY6ZiQiAMJhIJXXSj38/isCdUr8/dnokaW2wIFdih7Uf
         O8eUp6F6SR1Cx6rZkyyyenp/9wIwJgdAJnS30eCRKykD9xYbvpr3pGIDtp6hUEc+ux0b
         5ftm17qiipxYM839RB+rioOx9CZfzJVOvY4qAQ/Wm5UaXObKCqZ1DlglV+9g4qo3m4w+
         Xbv5nITUgEf00upgTSDSYjBi754R4DxEH8m2weQB082WJli52jbZeE8lFf+LnJh7mDjf
         hsAdzW0362Rv+lDiF6cq0R7kf7gQYgZVCU0jQsm3nxRBeB4/fETbUDi+/TgndC+U6aTa
         /RvQ==
X-Gm-Message-State: AOAM531jLCwN4GCTvHbkzjGK5uthXXd2Hg2T/7txEyhkFSa1KIPbv2Xh
        IqNkiHz4IRM/+cklvhv27dYleIkE6gpLbZ55
X-Google-Smtp-Source: ABdhPJwjCz/scWlPU6Kt2+e4Q1dq3Q08NUjCeAlPsLiSPT5fACZSj0YnzfNW6uP0kVDbmCFlTABcmw==
X-Received: by 2002:a2e:9092:0:b0:24b:4cd4:ca5a with SMTP id l18-20020a2e9092000000b0024b4cd4ca5amr667427ljg.260.1649360438002;
        Thu, 07 Apr 2022 12:40:38 -0700 (PDT)
Received: from [192.168.1.102] (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id f17-20020a2e1f11000000b00247f8eb86a7sm1968503ljf.108.2022.04.07.12.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 12:40:37 -0700 (PDT)
Message-ID: <e41c26c2-8aa4-cfd2-27b0-eb011f45eda0@linaro.org>
Date:   Thu, 7 Apr 2022 22:40:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: delete incorrect ufs
 interconnect fields
Content-Language: en-US
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20220407172145.31903-1-jonathan@marek.ca>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220407172145.31903-1-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/7/22 20:21, Jonathan Marek wrote:
> Upstream sm8450.dtsi has #interconnect-cells = <2>; so these are wrong.
> Ignored and undocumented with upstream UFS driver so delete for now.

Basically the description was added by a commit 462c5c0aa798 ("dt-bindings: ufs:
qcom,ufs: convert to dtschema").

It's questionable, if an example in the new yaml file is totally correct
in connection to the discussed issue.

> Fixes: aa2d0bf04a3c ("arm64: dts: qcom: sm8450: add interconnect nodes")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 2c18e1ef9e82d..90cdbec3cac99 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -1663,9 +1663,6 @@ ufs_mem_hc: ufshc@1d84000 {
>   
>   			iommus = <&apps_smmu 0xe0 0x0>;
>   
> -			interconnects = <&aggre1_noc MASTER_UFS_MEM &mc_virt SLAVE_EBI1>,
> -					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_UFS_MEM_CFG>;
> -			interconnect-names = "ufs-ddr", "cpu-ufs";
>   			clock-names =
>   				"core_clk",
>   				"bus_aggr_clk",

You may look at https://lore.kernel.org/linux-arm-msm/20220310221934.1560729-1-vladimir.zapolskiy@linaro.org/

--
Best wishes,
Vladimir
