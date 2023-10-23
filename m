Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC0F87D395B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Oct 2023 16:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbjJWOcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Oct 2023 10:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbjJWOcB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Oct 2023 10:32:01 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99F2D7D
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 07:31:56 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c16757987fso48962151fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698071515; x=1698676315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RjxD/ZzePqPKNEmDNpLekYR5zJD70yVgVvS6NTSkRk=;
        b=w9QwT6kc+ODiJxmlFSQ3kUqh0W7WEeN+0P54AkZvQd6oJCDa6YkaX3zlvbuWI0pBDM
         91sZ29n/QubjP2WSYXV3z2fM9ezvsbMmuWCqwbILRhrMwtL/AXlhdu2ZiXUFS5oZKZz5
         2xC5hlxat6lXjdChL3M0P8u8/X8vn8PVCCHlzvEFUgdaz3j3yQq4cafzrNK9ox0ofduL
         1lYrXJqpdsdX68Um5GF69l92ZoyJUs+1MdTLcgwlqw0FrwRmsGJolWEkzYNCMY0sQ1Vd
         ffPkMdCULZXzJ9JMzfkDGN5ylFcQvCH4ETP8ciF1gaGV+Jg411/NZ5PDDdU5WMKx3rtH
         zH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698071515; x=1698676315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RjxD/ZzePqPKNEmDNpLekYR5zJD70yVgVvS6NTSkRk=;
        b=TI0Mxz5GCPwVgs2m6wwdbL1RrLmjgGuPOTCUDl8NyUiYQGqjwuM0DkCZZk9NrcRUlZ
         dwUixBrnqWftID4dZSoAtDjab3DpUF932d9KQtJqisLfPdnBQRpCixLdUL7DjElcHxs0
         SpRwwdthkPtZ6l44HOjpDbcfgkQIF5of/TBFW78pSmpcXkajPEzFh/2uXip83yikfz6x
         15w6vBBFmBYG5hvGKLRtl+1BpXtG7KiB+DvxkwymX8k3cmRrUUypOSBrlcLKXvaWt/ex
         YqlyHn1047Sat7zqigPU++6kVKEddgZAQPMI0gRNmmY0TPlMl4qSO3Alu/QER48n7vb8
         uORQ==
X-Gm-Message-State: AOJu0YyYzHQsFdPhdokZAxHtEOJcy4W3DQga9GsUVDSFuVr5Ho3EI5un
        dHfITwMnWyyJUM9P/A6Hlkj/UA==
X-Google-Smtp-Source: AGHT+IGfNrDwf679B5UXwo443NxrFh3RP9MjjdQRlIg+Tr8Nwxxd30MzRmF8vBtnZ/17N3NNI1/JSw==
X-Received: by 2002:a2e:9210:0:b0:2bf:f7ea:884a with SMTP id k16-20020a2e9210000000b002bff7ea884amr6754875ljg.30.1698071514822;
        Mon, 23 Oct 2023 07:31:54 -0700 (PDT)
Received: from [192.168.1.15] (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id o30-20020a05600c511e00b004063cd8105csm14461859wms.22.2023.10.23.07.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 07:31:54 -0700 (PDT)
Message-ID: <092c7a54-edb9-4ff5-8c35-a936461111df@linaro.org>
Date:   Mon, 23 Oct 2023 15:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] soc/arm64: qcom: add initial version of memory
 dump
Content-Language: en-US
To:     Zhenhua Huang <quic_zhenhuah@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        quic_tingweiz@quicinc.com
References: <1698052857-6918-1-git-send-email-quic_zhenhuah@quicinc.com>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <1698052857-6918-1-git-send-email-quic_zhenhuah@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23/10/2023 10:20, Zhenhua Huang wrote:
> Qualcomm memory dump driver is to cooperate with firmware, providing the
> hints(id and size) of storing useful debugging information into pre-allocated
> memory. Firmware then does the real data capture. The debugging information
> includes cache contents, internal memory, registers. 
> 
> The driver dynamically reserves memory and provides the hints(dump id and size)
> following specified protocols with firmware. After crash and warm reboot,
> firmware scans these information and stores contents into reserved memory
> accordingly. Firmware then enters into full dump mode which dumps whole DDR
> to host through USB.
> 
> User then get full dump using PCAT and can parse out these informations.

PCAT is a proprietary tool that requires signing up to qualcomm.com and
installing the Qualcomm Package Manager to access. It also relies on
another tool (QUTS) to actually interact with the board.

Shouldn't we have a FOSS (or at the very least OSS) tool that can be
used to interact with these memory dumps?
> 
> Dump id and size are provided by bootconfig. The expected format of a
> bootconfig file is as follows:-
> memory_dump_config {
> 	<node name> {
> 		id = <id of HW component>
> 		size = <dump size of HW component>
> 	}
> }
> 
> for example:
> memory_dump_config {
>         c0_context_dump {
> 		id = 0
> 		size = 0x800
>         }
> }
> 
> Test based on 6.6-rc1.
> 
> Zhenhua Huang (5):
>   dt-bindings: soc: qcom: Add memory_dump driver bindings
>   dt-bindings: sram: qcom,imem: document sm8250
>   soc: qcom: memory_dump: Add memory dump driver
>   arm64: defconfig: enable Qcom Memory Dump driver
>   arm64: dts: qcom: sm8250: Add memory dump node
> 
>  .../bindings/soc/qcom/qcom,mem-dump.yaml           |  42 ++
>  .../devicetree/bindings/sram/qcom,imem.yaml        |  45 ++
>  MAINTAINERS                                        |   7 +
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               |  31 ++
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/soc/qcom/Kconfig                           |  11 +
>  drivers/soc/qcom/Makefile                          |   1 +
>  drivers/soc/qcom/memory_dump.c                     | 540 +++++++++++++++++++++
>  8 files changed, 678 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,mem-dump.yaml
>  create mode 100644 drivers/soc/qcom/memory_dump.c
> 

-- 
// Caleb (they/them)
