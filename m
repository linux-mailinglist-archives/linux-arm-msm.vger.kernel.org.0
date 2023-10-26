Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5667D815E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 12:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344616AbjJZKzp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 06:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbjJZKzo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 06:55:44 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7C919D
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 03:55:41 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5079f9ec8d9so846015e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 03:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698317740; x=1698922540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUYZd0Ej097jAhIw6DNm96Y3LVWu6JPXMni62KgrIN8=;
        b=l0obdJTHYWptkiEEjz2dzvxoel7Vn33Ifsp0uR6RJJaQHnperervUJGswUpgcft8zR
         zfLaLpRy2FkoyMeZwAsAL2vUTzIsmxlde0SnlUyR7XL2059gJniXuPZEgyesZf/tK+0u
         fj8Vb9Ifpi1Epx5+wA5VtC2dTbeqBJh/H3n3XFQLao+R2e0R9c0g4UryoZRPh4S6aUns
         +JGauesxrgtBVNUHGi1eza04ke1cSQR55Ki3L8vaFX9ZDL9nYhsXz+Vv8jA3M69rqr1L
         jC2QVbR0qiDkgKfvyimjEgwKCnqN6D2tIyLgPcMf3lVaNzUXtoX9zNVp0TGraLCuXdxb
         O4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698317740; x=1698922540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUYZd0Ej097jAhIw6DNm96Y3LVWu6JPXMni62KgrIN8=;
        b=dJCCS6opH2jwi8P56OLBdOfx1OHRkkqKLw+dafy2Ecj75SACaThbctm6CQnZ3M6b7T
         5qgq+Ubwj7sr/tZHuhhSB1iiUsqyD+15GAHgOC4juRSe99PfDZuB2Sibf1Yld33h0CzV
         SF7tnjzTQ7dQRZchxYJxGoYC6sodAvDv4T1/v1gL2a8wMYNMaczA56WKFDKeuKPFSi69
         NaPlrwOGRUwmY313H09gIq8YuzuuigR/2+Rg4NGmOdoD6y1Njpyh8N7iYwdAkEI5Sw8z
         Dv/HFfEpOjmAQQ38gQTNF/IOkhgeY+uLjIwFiaoHVOPhKwmocAVDME/M9cEBMP8Nt7m2
         c4qg==
X-Gm-Message-State: AOJu0YwFQAGKyzMZxuPGsSw27HV7nVGRYFFrlI/fMNuV/65QJyx3b7cR
        DSK8CGJQhxvjr2+MAyrch27F9A==
X-Google-Smtp-Source: AGHT+IFJY2h+PhA5ZUnssDD4RsegMb7tOojibhbB7ctcpygg5CqvyoT4m7nEpbiCRLtXU5nM8L/JGg==
X-Received: by 2002:a05:6512:159c:b0:507:cc09:59ab with SMTP id bp28-20020a056512159c00b00507cc0959abmr854411lfb.9.1698317740057;
        Thu, 26 Oct 2023 03:55:40 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z8-20020a196508000000b0050420b0a642sm2993332lfb.91.2023.10.26.03.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 03:55:39 -0700 (PDT)
Message-ID: <3ec21dca-14c8-41ed-8295-bc0463826e00@linaro.org>
Date:   Thu, 26 Oct 2023 12:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: defconfig: Enable SC8380XP SoC base configs
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        catalin.marinas@arm.com, ulf.hansson@linaro.org
Cc:     agross@kernel.org, conor+dt@kernel.org, ayan.kumar.halder@amd.com,
        j@jannau.net, dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com,
        lpieralisi@kernel.org, quic_rjendra@quicinc.com,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_tsoni@quicinc.com,
        neil.armstrong@linaro.org
References: <20231025142427.2661-1-quic_sibis@quicinc.com>
 <20231025142427.2661-6-quic_sibis@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025142427.2661-6-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/23 16:24, Sibi Sankar wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Enable GCC, Pinctrl and Interconnect configs for SC8380XP needed to boot
> to a console shell.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
Please mention that =y is necessary to get console and =m would
cause issues there

Konrad
