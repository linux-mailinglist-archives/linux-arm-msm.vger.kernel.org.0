Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFD097D8890
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 20:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbjJZSxD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 14:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjJZSxC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 14:53:02 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9AB1A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 11:53:00 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507b18cf2e1so1754321e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 11:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698346378; x=1698951178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cGBbFnVPmOFrjTHoEzH5J6H2Hqy+10FpHLwr0vLtfI4=;
        b=ws76dRbcGrbVidpvwTMGfTv0Po8XM4dqUElpcxliVp67dzzMjAh34iXtxwN8MWm4hA
         Gb9r1OUzihI3fvCzmDxwQ58kt37b+8/6RSCQXXj34+aZKrIluy+1311MlSL0JizPnQgb
         pc0/KlbnQ8plP3G1yOpsWw+suqki/bicemffPMIkgDn8U9kLaZIRzppaRAmVnjtI8Sf5
         b7VZYfS/D90nhaqBiAWqZFyTuo4taTlA5hv/OExEXSzNlmGFo+1R4llSzzGX07Fe/iyq
         +49HgzA2ZMr6nPPT3fo1HGH2N49TQ3jDAII8MNrXAY9ZlT2dd4/TeQkUZ8rSvCYa3QF8
         fP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698346378; x=1698951178;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGBbFnVPmOFrjTHoEzH5J6H2Hqy+10FpHLwr0vLtfI4=;
        b=K4jU4hmojE5M9vC6ffSb4dacBgmvK5HvFkBlGYEnCN730fQ24LYHR9IYkvux2XcmJn
         NyUCQ1xztvi7Od5Ekcjp8f4KO5TWkxL4mz7FC0xoE7cdbQZFop4Zd50d3T0z26jc7EEK
         /cN3G5sKLxzfifsO3f9frpYop4U/eTqknU6e/FT/jCdWXas8Kb3Ll1mIcmAQga+eCFOm
         c7TxYivRsPNi1esdxaDSdoyEBOek3NE/E/pqeeO6D+UuABBaYdA0U9RwHGlQUB3CBQeW
         l5Ce5gZqfOcx2rCY26BvcJYkNUhJmFliPih2MMi52r7iMjBauCUW5AWo7rv3yqIH6hlG
         yJDw==
X-Gm-Message-State: AOJu0YyfRxn2bQnz+0Y7anbONdzVEyvKUZs+7BeGlX/3oDcGa9xWJWAd
        wl+46D3FIMqEX6VgA3ExqX1WdZjtO6bsOZ/6by1nog==
X-Google-Smtp-Source: AGHT+IEaensjbTbZ95CdUwbV/cQYQV+gNN+JsxWtfhZGK66ZooXahenjpHcQYV4syUFfh6gXkr//ig==
X-Received: by 2002:ac2:5a4d:0:b0:507:a6e9:fbba with SMTP id r13-20020ac25a4d000000b00507a6e9fbbamr159161lfn.63.1698346378301;
        Thu, 26 Oct 2023 11:52:58 -0700 (PDT)
Received: from [172.30.205.8] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id h28-20020a0565123c9c00b00507a96d17b3sm3057580lfv.237.2023.10.26.11.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 11:52:57 -0700 (PDT)
Message-ID: <0f4b901a-d907-4a10-aaa5-06eb9cb5eb32@linaro.org>
Date:   Thu, 26 Oct 2023 20:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: add few more reserved memory
 regions
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231025-ipq5018-misc-v1-1-7d14fde97fe7@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025-ipq5018-misc-v1-1-7d14fde97fe7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/23 18:42, Kathiravan Thirumoorthy wrote:
> Like all other IPQ SoCs, bootloader will collect the system RAM contents
> upon crash for the post morterm analysis. If we don't reserve the memory
> region used by bootloader, obviously linux will consume it and upon next
> boot on crash, bootloader will be loaded in the same region, which will
> lead to loose some of the data, sometimes we may miss out critical
> information. So lets reserve the region used by the bootloader.
> 
> Similarly SBL copies some data into the reserved region and it will be
> used in the crash scenario. So reserve 1MB for SBL as well.
> 
> While at it, enable the SMEM support along with TCSR mutex.
> 
> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> ---
Bit of a "many things at once" but okay

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
