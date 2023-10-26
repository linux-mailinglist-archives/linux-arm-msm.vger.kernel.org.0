Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7337D8898
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 20:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjJZS4O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 14:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjJZS4N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 14:56:13 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD68210A
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 11:56:11 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507c1936fd5so2732377e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 11:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698346570; x=1698951370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XX0o5SH/u4zUmUnFynVSLwt8JJsmyB5ifz1RY8kYi4I=;
        b=ct9/PgAjQEuZy7MIOoE85jeGpsgNwWdUBgLW3fRZ0CA8q8ygQJFc1YQPAK4HHKjhL5
         ttUqmqvA+DBpHQafSwzbvq4nJ2Sx4M6Vz9bgaVU+AtkworC4OuRIHmzJe5lCILuYdY5N
         TKggE6WGZBbRsqref8b6tQpXvFRMmPR9LcgfZXNUsL8CBS2fKOgUS6oxAw1FD/UTF2x8
         jvOdf0sQK0DxduUjdoBKRAz2zm14jyuwErDBwVfABhqtLyWPzK5gzKYAjxaB4TqTyuF+
         fzJ5k6NCsPkJOvPvELKUNHdR28JeHENwXHaxuF4axDu4Ommfcj47E0Pn6xWKBxKSlqlR
         lpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698346570; x=1698951370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XX0o5SH/u4zUmUnFynVSLwt8JJsmyB5ifz1RY8kYi4I=;
        b=W2xDgRcgz/LAKULGq49XTpqoll7RMSN0vRgouv7WylA9dlD6H6TKyt8LIOhrMG9oFZ
         b8WhPHJyL0Bvw5onX/WW6f0WaxSHPwnQ/RAo9jgLjO5PA+BtRe9NBY/EcW/KNLx85ZI3
         4OW6ZCZ62EricWk4GpOJd3vU+/ll9rr/fOTRDgTzDpWxaGODo8exrbRQ5wJxNcQgRJeb
         cxtd315vG6wbw4Zu6XpvLLWGfrcwxFO8Nvi0a8+P2YcPDDxl48NKWcxASK7/IMBqtorO
         GHx07SvkRgYP4ZXQywM77v6YGXtGm/D5h0WQdBtaAJlkdp60t4ny7Xf9GsKqeA8+P6zj
         v25Q==
X-Gm-Message-State: AOJu0YxNvU+yBAzGG6IwNwJkWSzdk//KBPpmHkOFwIbhDJZG5fKlFBoU
        dvC87UcyFO5DMQpCAr4vXyyh2A==
X-Google-Smtp-Source: AGHT+IFKNInBH0+wVI9usnvM3zIPeA2ufDrxdwj06joslGu94sQIaI+AGsW2hSgXOumEWzGSUSrg8Q==
X-Received: by 2002:a05:6512:2210:b0:507:cd54:e93e with SMTP id h16-20020a056512221000b00507cd54e93emr268710lfu.2.1698346569919;
        Thu, 26 Oct 2023 11:56:09 -0700 (PDT)
Received: from [172.30.205.8] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q18-20020a194312000000b0050797cbfa82sm3122255lfa.17.2023.10.26.11.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 11:56:09 -0700 (PDT)
Message-ID: <9439252a-4dbc-417f-99a8-fa7c5f11a3d8@linaro.org>
Date:   Thu, 26 Oct 2023 20:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-rb1: use USB host mode
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20231025-b4-rb1-usb-host-v1-1-522616c575ef@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025-b4-rb1-usb-host-v1-1-522616c575ef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/23 13:58, Caleb Connolly wrote:
> The default for the QCM2290 platform that this board is based on is OTG
> mode, however the role detection logic is not hooked up for this board
> and the dwc3 driver is configured to not allow role switching from
> userspace.
> 
> Force this board to host mode as this is the preferred usecase until we
> get role switching hooked up.
Does that not kill usb internet and similar?

Konrad
