Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 914737C01D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 18:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbjJJQkB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 12:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233734AbjJJQkA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 12:40:00 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751EDB7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 09:39:58 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c124adf469so67660141fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 09:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696955996; x=1697560796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hBAWc80HIYF1UAoqOKYikAPW+Uj9N8HcMer/MGjoSq4=;
        b=O3dZx92wbkcZ/v+95ZVefI43nPdOoc0hZBmeq15+R+NYyNdzKdDcEhInkIhnVHwmKj
         uruCQXZ6P1Otknv7KcjmVFLP2Px0deynmmctID+sATPcpyp6GvbYpnCRQ2fcJgS6v3vL
         /Z9z6LJ+3XLUsiiowjDOvKXAXYzVqMBJ/7iDwRbNcEB157/h8GuxQyC/Gz6FqRhXqjUl
         GLOzLMgI3d+pBSavhmqy1zBQrgIsXlR9hGStVge4gm4uqkXU4v7lTIuy6G3Sqwp8T3uu
         7lVbl/4A1A25WuFWUUIKsYX6l56igC3wIN711RyY1r+s/Irhq11w3srUGfar47ea69DW
         Lw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696955996; x=1697560796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBAWc80HIYF1UAoqOKYikAPW+Uj9N8HcMer/MGjoSq4=;
        b=Xv62AyeReyjmXpnhhtpjMJdYWaUUAtvnNq2gnNJHewnf8Y2U6r4JnWmQuZe0AKLFSu
         NcvdCuYli0bpzmCuXOSJmE6orC2GQIip5DLn36qWKspIROa6sfbbCv483W6WHudXaTa1
         s/LRoSSls70EI/GgiLirwz5pneDE3+4BhAYgoEWowQ8LPk+RpdTzhpVDrCsMTAwHQ6Xl
         NGuLT6yhuWfg9RCKQzSK/5Zh9bLvCPkcsKY75z00SlpOf9zpf3k5atPsVRle5CXZUaPt
         vh9YkdhDfE4UNSh9aXtPEZx6++M8cWusJP/9xIG4GUYfCKV89a9J9AMjOMYY1IbsPjQ2
         CrCA==
X-Gm-Message-State: AOJu0YyRa6mDbBfcGyjluQv3X7RpsuP2y8mLI+cJFrbux4mfXgiFTJiM
        1OD0xFVRjTkXp42MUqvxLAexaO9IqOb4L4BYMlY=
X-Google-Smtp-Source: AGHT+IFVDTHjOPqqbq5QIlF4ISYN6N4U+VKelAKaTIDnpNQ0UzQcS+aDmvycqldIVjgvzih4drSCwA==
X-Received: by 2002:a2e:9d50:0:b0:2c0:18b8:9656 with SMTP id y16-20020a2e9d50000000b002c018b89656mr13708968ljj.24.1696955996606;
        Tue, 10 Oct 2023 09:39:56 -0700 (PDT)
Received: from [172.30.204.182] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id v6-20020a2e9f46000000b002b9358f5088sm2482543ljk.53.2023.10.10.09.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 09:39:56 -0700 (PDT)
Message-ID: <81e4c504-fad4-4cbf-b17e-a8b9f323f1c2@linaro.org>
Date:   Tue, 10 Oct 2023 18:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550: Add download mode support
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1696954157-16327-1-git-send-email-quic_mojha@quicinc.com>
 <1696954157-16327-3-git-send-email-quic_mojha@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1696954157-16327-3-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/10/23 18:09, Mukesh Ojha wrote:
> Refer TCSR phandle from scm node, so that it can be used by
> SCM driver for setting download mode.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
Please improve the commit message, like in 2/3

Konrad
