Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D50007B5045
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 12:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236436AbjJBK2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 06:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236460AbjJBK2H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 06:28:07 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62ED2B0
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 03:28:04 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c15463ddd4so191983331fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696242482; x=1696847282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pp+ZIvIMLMw4v27XJDkBzhmsmKk3dHbrUt7WlWNwd/0=;
        b=un6ijBC836kTqFmvpgytUIbc2Vl4Nestkzc3DtQG77U7nWX7M02GhhndLMUTR5aOev
         itEGiZBBw7NSV7/xYMXer9DTSraAQIcWCSbsY6UO/prRNzPikCSTFrCOTW45lKC05G9T
         ES/+AoOM+s4dsg66gbPUMEMQlfsRd6MxEGpAzIEQ2z5Ygr9jV5kPL6p2s6Q0rUaBuOkA
         gKMnXRSpJ/0THQ/RLkFMcjG0HGEnn0V+Jbvde8FSpCuNi9ddKr9TTiPV5mijttux1qY4
         I40nfrYMF6AcPWnuglMcbE8iWvspvFRqqMCEdas7hDucTA3KblEioqyLNmCKXcDYYEK7
         Hl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696242482; x=1696847282;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pp+ZIvIMLMw4v27XJDkBzhmsmKk3dHbrUt7WlWNwd/0=;
        b=ICVIpGsHnPcN27h/HzqlEObnJ8GmpewrFf6xfon0pKddPkwcaT2es6hCu22hZhw7rk
         OEt+wkl3KP2FXZ7KiA501EBeBA/idYH3anFrm2f2HeYeY5qildHgBE4a8oC+WKUg6OqW
         3tS5ecDdAlS1LWFgOJkRnKLqcIzsryhiigYixuHW3i0rLxn6j3BPoC5tv3dsATwR+c7z
         pWm5jtyokekt69l6MfrECOPTGrPSL517utk3xrb13OzJxaxvffd5qd2DHvk40miEcm5o
         m6suGV64mnGuvPf8po5SdQI+PerrPDx/zMMcRlfs4rMjlaXDqJBhUbYiroZyMZdTUh7W
         dPkA==
X-Gm-Message-State: AOJu0Yw0v1ZRMaIiAY2ZULb4QjUGjqWSkGtoIA2VdUj1fLpmIhrKUKS2
        M+DM2CRT4jbQCP1UrIcJhh7v4+N7nUD4hhVucy0=
X-Google-Smtp-Source: AGHT+IE2mEvQKewTHBBOTc6pOoI6mntCTYg507WshCrAjU+y+Sf20HolGJuaMwF0jr2Mmc9mVaS1uw==
X-Received: by 2002:a2e:7c05:0:b0:2b6:bb21:8d74 with SMTP id x5-20020a2e7c05000000b002b6bb218d74mr10184296ljc.1.1696242482640;
        Mon, 02 Oct 2023 03:28:02 -0700 (PDT)
Received: from [172.30.204.164] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t12-20020a2e9d0c000000b002bfb71c076asm5228715lji.43.2023.10.02.03.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 03:28:02 -0700 (PDT)
Message-ID: <2fb61d6b-0947-5595-86c3-9e1d23a0e1f0@linaro.org>
Date:   Mon, 2 Oct 2023 12:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8550-mtp: add orientation gpio
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20231002-topic-sm8550-upstream-type-c-orientation-v2-0-125410d3ff95@linaro.org>
 <20231002-topic-sm8550-upstream-type-c-orientation-v2-3-125410d3ff95@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231002-topic-sm8550-upstream-type-c-orientation-v2-3-125410d3ff95@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/2/23 12:20, Neil Armstrong wrote:
> Specify orientation GPIO in the PMIC GLINK node.
You should answer "why", not "what"
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
With that fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
