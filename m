Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7E5F7D89D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 22:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjJZUt7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 16:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjJZUt7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 16:49:59 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF1F1A5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 13:49:56 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4083cd39188so9921215e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698353395; x=1698958195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+tTyISiZtMmzjPiRJNN0KqFKy1wko0l5JwAIuQLXRU=;
        b=d+1WaVgHydjKwWC09F2n10bNyoWNdz6Vg9BV656s0Y2OvMPiJqr19AjUvFQn5syKF4
         GCReN9NIMzMIAHoeTJJOBOM55p3rjmSuvD8KKYg7x3O6xTGqS3nLwl3uNTaPB8Qrg+iN
         zY8VoQ4wg5v7Ochytl8ii0BEXM4TbnTyZ6iRvG+F5Hp5nRypF0BamFKbk2Rf13ldNpfu
         H97PKBw3mdZz4nsgHXclQqZOy16wLw9qBn8SN3TYFJCEIT+UXR7a744A2yVNBGirHC5Q
         LRZaBMCuTHSimh5LtqW2aOq6r2eErHtsy9ECf6DSNVR76+6xAAqJ+ihF0AGuOsUQcxYJ
         Jwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698353395; x=1698958195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+tTyISiZtMmzjPiRJNN0KqFKy1wko0l5JwAIuQLXRU=;
        b=nNjzeqV3MES3yWUZ7hJ/u6/HVan+XhgaGXXfwxCd+0vHS45Drpx8TXRabkQIrsusU5
         C19gMyB0XjWwbFBMxeTeGTDmAm6mDf+75pofGq1FY3Xgm4sKYzXBa/bjHxrVO7jbyZgU
         Cy2BRmngrfiezMn9lKkmODipjXNe0RMq+3D1H51QlBOndnXF91UteqC4JkNVfAUXzyRI
         Zx3D+1wzKYyPu9y6CvgUk8pPVYWgp28C7NT7s2ozD4fjTde7g14e1WPVgJ3KZ5WJBPLk
         n/dqW7xGbtEKr0ZQeGw0sL2drcpwlosHDdO7pf091kv0B4acTKWEZCTWJfHQtmOo5Qvy
         Ibig==
X-Gm-Message-State: AOJu0YzR2ZFhVhvv0odeoK9UBS67H5e3v8i78QKsTI7RHYwH0T4TTCd1
        psZrp7crNc4JZM7D+7aB+wYLZQ==
X-Google-Smtp-Source: AGHT+IFQ0G93i4ai41OiX7KGzsO94OIBxSh7ikKpUJGDGbO/J0L3URazErYlBG90mddk6LGPqwdL6Q==
X-Received: by 2002:a05:600c:3b20:b0:407:612b:91fb with SMTP id m32-20020a05600c3b2000b00407612b91fbmr713606wms.30.1698353395286;
        Thu, 26 Oct 2023 13:49:55 -0700 (PDT)
Received: from [172.30.204.240] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id o1-20020a05600c510100b003fe1c332810sm3492503wms.33.2023.10.26.13.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 13:49:54 -0700 (PDT)
Message-ID: <ac995dde-b5b3-4dd8-b704-5081cf9f9162@linaro.org>
Date:   Thu, 26 Oct 2023 22:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <abc36c33-bfd9-4451-80ab-a631492044de@linaro.org>
 <ed18292b-efe8-48fc-8696-79e51acf8ab4@linaro.org>
 <CAA8EJpo_H3-Lk1GQXGQikXiCtaEQ4C+FBW-fz9D2TbuX2HDhRA@mail.gmail.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpo_H3-Lk1GQXGQikXiCtaEQ4C+FBW-fz9D2TbuX2HDhRA@mail.gmail.com>
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



On 10/26/23 22:47, Dmitry Baryshkov wrote:
> On Thu, 26 Oct 2023 at 21:57, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 10/7/23 01:43, Konrad Dybcio wrote:
>>> On 4.10.2023 02:31, Dmitry Baryshkov wrote:
>>>> clk_rcg2_shared_ops implements support for the case of the RCG which
>>>> must not be completely turned off. However its design has one major
>>>> drawback: it doesn't allow us to properly implement the is_enabled
>>>> callback, which causes different kinds of misbehaviour from the CCF.
>>>>
>>>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
>>>> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
>>>> switched off (and shared most of the implementation with
>>>> clk_rcg2_shared_ops). The major difference is that it requires that the
>>>> parent map doesn't conain the safe (parked) clock source. Instead if the
>>>> CFG_REG register points to the safe source, the clock is considered to
>>>> be disabled.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>> Would the intention here be to replace all usages of _shared_?
> 
> Yes
Then I suppose an immediate followup question would be: "why
introduce new ops instead of replacing the existing ones in the
patchset?".

Konrad
