Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D84737D665C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 11:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbjJYJL6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 05:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233522AbjJYJL6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 05:11:58 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A6E12A
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:11:55 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so72631311fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698225114; x=1698829914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ikf4RQnMQeyOLmmpbCxkqQ+qg4jdp+u0cU0mdI9Q5GY=;
        b=fCpfzy4kW/Eyf4lTODGerNUL+vXonfSnb1LMNoJbfFmLCZ2q5qozV1IjUZV93+A6px
         UhDUyaJ/9rImOA6xZgjoWLS6a73J2vyNCJc7K0tB9qsgcF98N3ze1Y4aoqhI3iyyon+e
         ruV3WPt7j4esZ0D+37if/utNoMe2OKmD8aWS3qKiqB1/1HCH1Kqs1EFeZFUZ8MuToqKL
         1CVAf6woJ2EV5BzSFJhrpohp8DREpUgfQySSTtTJfd7UDjY//FjFDkcoZnnadsORB1XE
         6OgpxjQUiKxPgPkVaOhac3sWgX9W3C5hY46kKgWGZCNDlHD1Kb5lyqNAfnC8SvGB/HQj
         xr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698225114; x=1698829914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ikf4RQnMQeyOLmmpbCxkqQ+qg4jdp+u0cU0mdI9Q5GY=;
        b=Lz2YyoPDs6lVWu4FiwIExnnKXihNhFGHipS+J9wXx1EeFWDBqd/GrFQh50nzsa6h5z
         aOu8sqCCwEMkyKlYMuYkurOnaHnkF+CzW3QcOv21eTHXLGk0TKi/BpNueJ4PkC6KLrxm
         rymVSsXjCzoYUqKIM2PGi0RL7YDJcy3ibt+LxXOLmFPGEUgVR9LuJr1qz2IDiOTYPa6T
         NIEpLZGlyucKRPV/75o2QDoYCu9Xdy95G9pfdOv/hJhFY+zHyhBESmgQa5gnYv0/Ij4R
         kptBMcsulqvIzoDld4e9NiI6cwCeIDZf6Pk+Ex7zoqvaBOk3+cNUpJ/R2kfByDriQ0yX
         sWQA==
X-Gm-Message-State: AOJu0YwJX67WfLbjsNWUFVNRHmvcyGfhv3y5Nii1bq9rrCm+rikcjnky
        AfjRc1rDQShbvDGa1V5+qovw3g==
X-Google-Smtp-Source: AGHT+IFmMAxM0VzBfFMXUEhAPjHjRESYsYMYV5NmTHnGJZBY2IMsiD04kM7hfC94gQgNmwdPFtnHcQ==
X-Received: by 2002:a2e:b88a:0:b0:2c5:fde:e457 with SMTP id r10-20020a2eb88a000000b002c50fdee457mr10943596ljp.3.1698225114271;
        Wed, 25 Oct 2023 02:11:54 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d24-20020a2e3318000000b002bce87faca9sm2354356ljc.57.2023.10.25.02.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 02:11:53 -0700 (PDT)
Message-ID: <e046b554-34e7-4c95-a42d-47338a5ba927@linaro.org>
Date:   Wed, 25 Oct 2023 11:11:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 8/8] arm64: dts: qcom: sm8650-qrd: add interconnect
 dependent device nodes
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231025-topic-sm8650-upstream-dt-v1-0-a821712af62f@linaro.org>
 <20231025-topic-sm8650-upstream-dt-v1-8-a821712af62f@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-dt-v1-8-a821712af62f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 10/25/23 09:47, Neil Armstrong wrote:
> Now interconnect dependent devices are added in sm8650 DTSI,
> now enable more devices for the Qualcomm SM8650 QRD board:
> - PCIe
> - Display
> - DSPs
> - SDCard
> - UFS
> - USB role switch with PMIC Glink
> - Bluetooth
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Same comments as patch 7

Konrad
