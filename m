Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3477B337F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 15:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233239AbjI2NZD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 09:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbjI2NZD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 09:25:03 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DEA4139
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 06:25:00 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9ae75ece209so1724627166b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695993899; x=1696598699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qagqmXxFav4/9NIFK4762ByrJQt8UaYPm4niYdjtpZs=;
        b=UhyPKj/6Lfgzj8AUJbDbZ2uX39qMRQN+uf494SanraWUST+olUUTuKzoY4GQQQVA/t
         kECOgirNcm7aU/WTX1O1STdVdki380GnMO8waBrA3dmtjmQ2XAmD/1AfVaTZBw0Of5Dd
         g47v/qwSFGzvsBm0BC7dR/mm90l2xs/naFkH67YL0gR+KfGbXN3fqcHO6hSl8WtGgjCH
         d1TuUdGFfhpQVEhwZjWCtc+8RJXs6Z3x40g2i0eQ94z2a52zX0qLHNcmbNhwE1GDsl5B
         pzn8iDXs0yXjLEl1wBiXebDkMymH8g8NAs1SbxyFQW51dzYGzsSYhBaRJnhupk0keBtP
         1IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695993899; x=1696598699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qagqmXxFav4/9NIFK4762ByrJQt8UaYPm4niYdjtpZs=;
        b=HEYBn8PWNGQy4KrWamyLc2fos2scMBxu2v+d0RaBySkpKeXmIbXOS7oWWM4RkPhh4z
         Jr9+LY7jyehc5z4sxH8ox1r4glYiwEMa/xUoOwTtaDF94sr5KVoUXnQwnMLZcCR2pKWh
         MHixcd+BcwWkfpGhEIgx90/iH1/vfRsu6r1loULYcXn5GH1Ad4EEcARlOoyZ/sVHJoYN
         /ADGJPaI0CvNllCbdczlsYxzY2QLmV11/1+BCSJVnKo5LSUPBFbLdPHGWWvyMQaPGJuO
         WhKNY23jRfR9hmlXl+/ptGNrgZDJTKjaEybifwkv6yGHuuefwfviOztzU84paGzybELs
         XktQ==
X-Gm-Message-State: AOJu0YzxyKe2QIzaSHEf+5kxVzwePgxeVnbevnxY0MHR/8Qlq0C2mgPS
        JnZqRog5T2fuKwJsZp/fr4trMA==
X-Google-Smtp-Source: AGHT+IG85WjZj97kdYjVbN8tWOk2oDGOZdRoVaBMP7/YHT4SQd1vdx4B2NPE04FCujEA10aJrFrTYQ==
X-Received: by 2002:a17:907:8b8c:b0:9a1:bd33:4389 with SMTP id tb12-20020a1709078b8c00b009a1bd334389mr5309521ejc.74.1695993899056;
        Fri, 29 Sep 2023 06:24:59 -0700 (PDT)
Received: from [192.168.0.123] (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
        by smtp.gmail.com with ESMTPSA id h13-20020a170906584d00b00992b8d56f3asm12377832ejs.105.2023.09.29.06.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 06:24:58 -0700 (PDT)
Message-ID: <954ec977-f6a1-b8de-d267-74c86eca5161@linaro.org>
Date:   Fri, 29 Sep 2023 15:25:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V4 2/4] arm64: dts: qcom: sc7280: Add UFS nodes for sc7280
 soc
To:     Nitin Rawat <quic_nitirawa@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, mani@kernel.org, alim.akhtar@samsung.com,
        bvanassche@acm.org, avri.altman@wdc.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230929131936.29421-1-quic_nitirawa@quicinc.com>
 <20230929131936.29421-3-quic_nitirawa@quicinc.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230929131936.29421-3-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/29/23 15:19, Nitin Rawat wrote:
> Add UFS host controller and PHY nodes for sc7280 soc.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
Not sure if intentionally, but you didn't include my review tags from v3.

[...]

> +			interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_UFS_MEM_CFG 0>;
include dt-bindings/interconnect/qcom,icc.h

interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
		 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
		<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
		 &cnoc2 SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;

Konrad
