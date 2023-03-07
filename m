Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2566AE4E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 16:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjCGPgh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 10:36:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbjCGPgg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 10:36:36 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AFE74DDA
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 07:36:28 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id i20so13489463lja.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678203387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqpYKNHGUTB0UKZwxzPuC8he8a/ReX2G0IQ7F4IC6dA=;
        b=wtSND3GiI9s9Aj4awe/EjdAOTEUum4mywLU6k8y5sVLdyIuq9BH/rtAQ1AyuJ4A0IK
         6jioWeBKvoEm3WxVQpeu55huOB4RQ510bPZohBtZKiVjMaQd9imVxHzIVaJH8TyEzR6t
         q0GHIelur3TWYyjouM6198dw5nM3w99e43c6MYWTmc0ZwSomW3eTKaBXbQzBX7aEQ239
         6sSveqW9oQO54xKk383+dMHmfD/UAVizq5o5XBlqun2WVU9ZiCo21ojyQPYBpvlFE22P
         khlFYBBaBx1B+6dTadwMA+FSZGOFB3+D+ziMF77SHi8QR0uPB/0lTCjn67d4SF5SsQl0
         PM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqpYKNHGUTB0UKZwxzPuC8he8a/ReX2G0IQ7F4IC6dA=;
        b=6c9sfJjPz2OEY+/RYKAS7iG1tMvtk57cuAFxxpYtXXyrrOMcaRFZYR36QG8PlBzb9X
         TvjJE2lyCk+I6cApJcGVZKJDhM2SGzEg8as4jK/qSVZLmQ00BHZ5MaMNEipxExU3v0Fi
         8wZ2iLnVikfGF7aKjgRf6Zx2gTHc+MjVXNk3QGFkGGAPDD+E9/4Kn0W2mDsQDb8gMAhE
         h4WyCNtROz8C2Suzo3tei2AW+f6HY5dvuhKhahI4TL4Dmo2VW0EEOwPfB3YFjCSLA+dq
         Qde2JXP0UsS0I+RR3VUu4RuD7bd3mRTpMwr/Emp2c5j4sGvApX7h9FIwMJdryWMyFyHb
         3dVA==
X-Gm-Message-State: AO0yUKV4wMFwpUGcOwxBDPO3fdhm1XLsqCrCJrurQzHHIJp38imSRsQy
        NeXPnAI6D74y253rEgPgttyL3g==
X-Google-Smtp-Source: AK7set8Ava47BosD1E3t2AvbFdV1xVSP+/nZ4FQVmN8NXA0HKemW/SA1WLBxMPNYnsz1WGXE4gtV2g==
X-Received: by 2002:a2e:a16d:0:b0:295:a52a:5eb7 with SMTP id u13-20020a2ea16d000000b00295a52a5eb7mr4391230ljl.23.1678203387001;
        Tue, 07 Mar 2023 07:36:27 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m8-20020a2e8708000000b00295d62f0a0fsm2206054lji.122.2023.03.07.07.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 07:36:26 -0800 (PST)
Message-ID: <6ddeba6f-9816-730e-28ce-0f1efbc11367@linaro.org>
Date:   Tue, 7 Mar 2023 17:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/4] firmware: Add support for Qualcomm Secure
 Execution Environment SCM interface
Content-Language: en-GB
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230305022119.1331495-1-luzmaximilian@gmail.com>
 <20230305022119.1331495-3-luzmaximilian@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230305022119.1331495-3-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/03/2023 04:21, Maximilian Luz wrote:
> Add support for SCM calls to Secure OS and the Secure Execution
> Environment (SEE) residing in the TrustZone (TZ) via the QSEECOM
> interface. This allows communication with Secure/TZ applications, for
> example 'uefisecapp' managing access to UEFI variables.
> 
> The interface is managed by a platform device to ensure correct lifetime
> and establish a device link to the Qualcomm SCM device.
> 
> While this patch introduces only a very basic interface without the more
> advanced features (such as re-entrant and blocking SCM calls and
> listeners/callbacks), this is enough to talk to the aforementioned
> 'uefisecapp'.
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
> 
> Changes in v3:
>   - Rebase ontop of latest qcom_scm changes (qcom_scm.h moved).
>   - Move qcom_qseecom.h in accordance with qcom_scm.
> 
> Changes in v2:
>   - Bind the interface to a device.
>   - Establish a device link to the SCM device to ensure proper ordering.
>   - Register client apps as child devices instead of requiring them to be
>     specified in the device tree.
>   - Rename (qctree -> qseecom) to allow differentiation between old
>     (qseecom) and new (smcinvoke) interfaces to the trusted execution
>     environment.
> 
> ---
>   MAINTAINERS                                |   7 +
>   drivers/firmware/Kconfig                   |  15 +
>   drivers/firmware/Makefile                  |   1 +
>   drivers/firmware/qcom_qseecom.c            | 314 +++++++++++++++++++++
>   include/linux/firmware/qcom/qcom_qseecom.h | 190 +++++++++++++
>   5 files changed, 527 insertions(+)
>   create mode 100644 drivers/firmware/qcom_qseecom.c
>   create mode 100644 include/linux/firmware/qcom/qcom_qseecom.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9201967d198d..1545914a592c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17380,6 +17380,13 @@ F:	Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
>   F:	drivers/net/ethernet/qualcomm/rmnet/
>   F:	include/linux/if_rmnet.h
>   
> +QUALCOMM SECURE EXECUTION ENVIRONMENT COMMUNICATION DRIVER
> +M:	Maximilian Luz <luzmaximilian@gmail.com>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	drivers/firmware/qcom_qseecom.c
> +F:	include/linux/firmware/qcom/qcom_qseecom.h
> +
>   QUALCOMM TSENS THERMAL DRIVER
>   M:	Amit Kucheria <amitk@kernel.org>
>   M:	Thara Gopinath <thara.gopinath@gmail.com>



> +
> +
> +/* -- Platform specific data. ----------------------------------------------- */
> +
> +struct qseecom_data {
> +	const struct mfd_cell *cells;

The child qseecom devices are not platform devices, so MFD should not be 
used here. Please use aux devices instead.

> +	int num_cells;
> +};
> +
> +static const struct of_device_id qseecom_dt_match[] = {
> +	{ .compatible = "qcom,qseecom-sc8280xp", },

Forgot to mention, while doign review. There is no need for this compat 
until you provide the actual data. Please move it to the patch 4.

> +	{ .compatible = "qcom,qseecom", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qseecom_dt_match);


-- 
With best wishes
Dmitry

