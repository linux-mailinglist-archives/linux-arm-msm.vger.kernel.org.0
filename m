Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5399470C3A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 18:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233130AbjEVQln (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 12:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbjEVQlm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 12:41:42 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2EEC103
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 09:41:38 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2af278ca45eso39733551fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 09:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684773697; x=1687365697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMxUfcnhl5+rVsfMty+xZDBCMk0T6YUG7NIn7VgdGQY=;
        b=ARafq7tLHRKKyiz8ceWgtXe2lEd+SjhPaM9GJJB6oTiieYIWMpiCpE3HZ4MRbTUcES
         CO544sItX3nQhCA3quDSScmB6B4qxSMTp4ZXbM+rOwXxHkYy9ieg+bH6GauEJzE+oH7f
         3DYLzhEHuoqyrZCoiCJvzZt96ibKwfl1vQyYqzA7itWMLKUV/HTUBHk7/ybTWas3kKnB
         QOfCMOUxTNFC2PxKVwp6QSljw8oEstibiGDKHNVuwj5LjoRsj1VSWRB1YRulKujcoqF7
         C7EZqACeFxbGglf5I3Y1OH4ZvmtilIVR7MxLSrCqiar/hLapRYzAU4Bt8HDC9CyWAPpx
         U/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684773697; x=1687365697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BMxUfcnhl5+rVsfMty+xZDBCMk0T6YUG7NIn7VgdGQY=;
        b=JYnzyxRdKvZDHQDUrf7EWQuXMU9DeYykapyDwYGhwiPRr1jVlRjKD9o1BWxQSIyUew
         RWk3stZnRSo5mfZPj0hOIbfJjwq6adVsaB7EwjMj5rM77aqbw5nCNn4+FMrjsKXDWGhp
         +nfFTbbhLlKNqHHOUpjbjGTO50SCQy6szGRoEbt7XaD0qF3KAhsR5QlX6w1smiGDJbgk
         RFzAkDWeGnvcCEj7gD/ABXAkWfY4UMugLO8Wr+SNUGym3h5v15zoA686QszPZ+1FsLUQ
         Xgb08GKNkbsfGjE2cooNND9DFnktaWcAkM3nbIVmWlMn28TxOj9kx3PUIWuHSgMhAw9z
         s71g==
X-Gm-Message-State: AC+VfDy/p8OtMjpVsq6IfUgT8TrvpkHlXDTFGjUq/vSd7ouJ3K/Vy1JO
        gBgokUf4EdkTuHNxbKZGg5eIqw==
X-Google-Smtp-Source: ACHHUZ6qenbF5+rEJZ2oNQ0GXnLTDP1QxfT/33QDe1tt9n63eUkn5pHQ2hIK11lRp6MH05TQ+jFYuA==
X-Received: by 2002:a2e:8497:0:b0:2af:21d3:a4cb with SMTP id b23-20020a2e8497000000b002af21d3a4cbmr3687741ljh.49.1684773696758;
        Mon, 22 May 2023 09:41:36 -0700 (PDT)
Received: from [192.168.1.101] (abyk97.neoplus.adsl.tpnet.pl. [83.9.30.97])
        by smtp.gmail.com with ESMTPSA id z6-20020a2e3506000000b002adb6dd5a97sm1204062ljz.27.2023.05.22.09.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 09:41:36 -0700 (PDT)
Message-ID: <3b03be6a-c99a-227e-87aa-13122c703cd7@linaro.org>
Date:   Mon, 22 May 2023 18:41:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qdu1000: Add IMEM and PIL info
 region
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230522151206.22654-1-quic_kbajaj@quicinc.com>
 <20230522151206.22654-3-quic_kbajaj@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230522151206.22654-3-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.05.2023 17:12, Komal Bajaj wrote:
> Add a simple-mfd representing IMEM on QDU1000 and define the PIL
> relocation info region, so that post mortem tools will be able
> to locate the loaded remoteprocs.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> index 734438113bba..4b52bebdbeeb 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> @@ -1102,6 +1102,19 @@
>  			};
>  		};
> 
> +		sram@14680000 {
> +			compatible = "qcom,qdu1000-imem", "syscon", "simple-mfd";
> +			reg = <0 0x14680000 0 0x1000>;
> +			ranges = <0 0 0x14680000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pil-reloc@94c {
> +				compatible = "qcom,pil-reloc-info";
> +				reg = <0x94c 0xc8>;
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,qdu1000-smmu-500", "arm,mmu-500";
>  			reg = <0x0 0x15000000 0x0 0x100000>;
> --
> 2.17.1
> 
