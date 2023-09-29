Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 914CA7B2E47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 10:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232978AbjI2IoQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 04:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232985AbjI2In4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 04:43:56 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A56810D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 01:43:49 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4054f790190so129182345e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 01:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695977027; x=1696581827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rp1s3Cc6q3I+T5FJVJHZiDlmNzAU9w/FLuJ7hihiwMM=;
        b=Kev7qdyDbfV0PuiAmVc4soJBmzZdk/mduOoXAzXHKnjHQQV1kTR6+jLlbC84ZtQdAo
         aHMxH513OEpTjgExCfa+XZb57lSxBIVEOpQbbdpDRmIIzKfAJemdmZPwamiaE+Lq853M
         cT2xQs336asEyk8EA+m6Ub82IYVl/F6Bpu/ZGqQo4cW4gP286zK5i4StpgRCI1d6yFY+
         N4VTfB3+P58ud8CmlvSDPAcRnmOcuErXtL+4rUn0tSk9RwSyIOCx3uKJGYwdtyGKQywD
         MJZz7ac8JFwW+O4GBVWJuNycuYt5046Mpvg2W9laFgPnP+CK6QGKfr4AqYsyWL5Tk7cc
         WNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695977027; x=1696581827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rp1s3Cc6q3I+T5FJVJHZiDlmNzAU9w/FLuJ7hihiwMM=;
        b=L0AnY5QxqHFezqXQLsDo6oVbj9tBYaOVNV1VxhRN20nVCP15BYMnxY9FIZeS9Aao8S
         8oEHRK3GEW6nbdRXyZiwiPFXtqyLdZ4wjdI4sXEZn990eHF7vtF6NLfMo0mjwpEvVP6f
         9WBarGWbiry0JUqa0xpzUjesZzo42A7421LS6fyuOete3RklZei0GcQhODtvg7lyY4HR
         nicVvB/5RdwphrTmyMG09YjsxuTNkLfVzzlQW87V/AWkNwBbYqWaBVGSqAo9WfVsVE38
         ZMpNDCHzMYrz+c6nXE2tUTO0hFEP/Nm9x1tGzyy7p3UkqGNSlaryn1+P1B+TK4yaagq5
         e3VQ==
X-Gm-Message-State: AOJu0YyEi8QVmjnBG2wUtN1/+VOw1lThksm9GiXUG/66PrxY2F5Sg/Ll
        36TSCxJRmAmgUQbUzZRCMh8FpA==
X-Google-Smtp-Source: AGHT+IGwhDUE56Q/LmypNp76kDCQmaKpYWqYnLhqhoVI2+et2l65D8wf54XUidmiN018A3eQsslWJQ==
X-Received: by 2002:a1c:7209:0:b0:403:cab3:b763 with SMTP id n9-20020a1c7209000000b00403cab3b763mr3252182wmc.33.1695977027437;
        Fri, 29 Sep 2023 01:43:47 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d4a8b000000b0031ffb51f6f9sm21113634wrq.30.2023.09.29.01.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 01:43:47 -0700 (PDT)
Message-ID: <91fa3315-b3da-430d-bc3c-7ec5ccbf419c@linaro.org>
Date:   Fri, 29 Sep 2023 09:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc7280: Move video-firmware to
 chrome-common
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230929-sc7280-venus-pas-v1-0-9c6738cf157a@fairphone.com>
 <20230929-sc7280-venus-pas-v1-2-9c6738cf157a@fairphone.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230929-sc7280-venus-pas-v1-2-9c6738cf157a@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2023 09:38, Luca Weiss wrote:
> If the video-firmware node is present, the venus driver assumes we're on
> a non-TZ system. Move the video-firmware node to chrome-common.dtsi so
> we can use venus on a TZ board.
> 
> At the same time let's disable the venus node by default as is custom on
> such nodes.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 8 ++++++++
>   arch/arm64/boot/dts/qcom/sc7280.dtsi               | 6 ++----
>   2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> index 5d462ae14ba1..cd491e46666d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> @@ -104,6 +104,14 @@ &scm {
>   	dma-coherent;
>   };
>   
> +&venus {
> +	status = "okay";
> +
> +	video-firmware {
> +		iommus = <&apps_smmu 0x21a2 0x0>;
> +	};
> +};
> +
>   &watchdog {
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 66f1eb83cca7..fa53f54d4675 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3740,6 +3740,8 @@ venus: video-codec@aa00000 {
>   				 <&apps_smmu 0x2184 0x20>;
>   			memory-region = <&video_mem>;
>   
> +			status = "disabled";
> +
>   			video-decoder {
>   				compatible = "venus-decoder";
>   			};
> @@ -3748,10 +3750,6 @@ video-encoder {
>   				compatible = "venus-encoder";
>   			};
>   
> -			video-firmware {
> -				iommus = <&apps_smmu 0x21a2 0x0>;
> -			};
> -
>   			venus_opp_table: opp-table {
>   				compatible = "operating-points-v2";
>   
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
