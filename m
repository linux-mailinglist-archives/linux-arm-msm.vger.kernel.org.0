Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A9979A37F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Sep 2023 08:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbjIKG1m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 02:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjIKG1l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 02:27:41 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E328EA
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Sep 2023 23:27:37 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31dca134c83so4027929f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Sep 2023 23:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694413655; x=1695018455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RJTJsFK3T0/Rm5w8uJvF7R9ahpNsdXBenI0aBQZljWI=;
        b=rounOXkfgIZsC7NkU4+jT+m5JD86820sfpExxOV1KSiPKJlRzc7IwKUk/tBvbcw5EY
         giLs9dV67Bp6yj6m/WnrEmSZ9DDJc/HuTF7xVoqeUtcO2MyPnQfNuU/cusM7j1Kgc5PN
         g/DxBMED7De/96bncj7UkyTmDdEL5scsnFtDY94XLLdMuxMWJeraBiJOavs40I1XxSsl
         J124lf19yYH+9Q5/gI+6lNQu1bxJEzQ4YLeZFQaECakijfHi8+tMGAUWXn6HXOE5K0k1
         jImOeUDt+qlQyri5authxf6sx0/JoIp+lxVKKQRyAoYXY3VqhzUAb4oRx29dQAdc8Qzx
         U0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694413655; x=1695018455;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJTJsFK3T0/Rm5w8uJvF7R9ahpNsdXBenI0aBQZljWI=;
        b=bfVfuUp/kTFpLrKQUS4Ytp65hGdQYpvlppFxoJF0Nz8SRp8Lv98r2hXwgnYA8LPii7
         W/lZ71Z6jtMrrChl1Hx3lXRkzqzuF/0oxiQFytleGE285hql2qlzeXB4lEuhgaczQM9g
         HVl37ZUTN1CcTD3zUFpat8kY7G9FsWJTJnP05fNTc0rCrC4WcFSzImmRSPvyy2M+buG3
         sKZGbJCwum41dhSt4wDq5+mf0YJIKMAOItEHsHUyu8g4qfKNT+gRxSrMALdLfMo1tgwS
         dVkYnx5L68WkC/ySgM2RUG2Ar0Pm72HPWptTvWdB4kZtN9XMhLOxidZXpiovIf/oADpF
         RBRg==
X-Gm-Message-State: AOJu0YwnBq25/MPORNauO5E3XZvbeULxPRgun30zTLGuifVk4fnOLVap
        VRQmffXg4/B4ACfRa8VvS09kGg==
X-Google-Smtp-Source: AGHT+IHdUYdZOEzSeRxYewp5a8kC9KI+sz7pgbVDMTSbrYiymqBDmQF9SeR7P0v4wf06XCXdnmaRsA==
X-Received: by 2002:a5d:4e02:0:b0:317:5f04:bc00 with SMTP id p2-20020a5d4e02000000b003175f04bc00mr6273595wrt.27.1694413655449;
        Sun, 10 Sep 2023 23:27:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id a11-20020aa7d74b000000b0052a404e5929sm4095585eds.66.2023.09.10.23.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 23:27:34 -0700 (PDT)
Message-ID: <0231fa19-bc71-db11-ffd4-8c922d110447@linaro.org>
Date:   Mon, 11 Sep 2023 08:27:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] scsi: ufs: qcom: dt-bindings: Add MCQ ESI property
Content-Language: en-US
To:     Ziqi Chen <quic_ziqichen@quicinc.com>, quic_asutoshd@quicinc.com,
        quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com,
        junwoo80.lee@samsung.com, martin.petersen@oracle.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com
Cc:     linux-scsi@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <1694163203-39123-1-git-send-email-quic_ziqichen@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1694163203-39123-1-git-send-email-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2023 10:53, Ziqi Chen wrote:
> Document the description for the qcom,esi-affinity-mask.

This tells me nothing what is this feature for.

> 
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index bdfa86a..323595f 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -97,6 +97,10 @@ properties:
>      description:
>        GPIO connected to the RESET pin of the UFS memory device.
>  
> +  qcom,esi-affinity-mask:

Not tested. You also miss proper type.

> +    description:
> +       UFS MCQ ESI affinity mask. Affine ESI on registration according to this CPU mask.

And why is this a property of DT? Aren't you now describing driver?



Best regards,
Krzysztof

