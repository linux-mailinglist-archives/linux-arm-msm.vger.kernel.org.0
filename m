Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1568B64B0B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 09:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbiLMIBa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 03:01:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234438AbiLMIBY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 03:01:24 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE8F18341
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 00:01:14 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id p8so3585751lfu.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 00:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=heWYQtv4xWf0HHku6hHfNqvO9iIIGMegbR7umcp7wts=;
        b=dj7ZfKZWJdBmk+40UtdHfa6ndmfdSkzLoIhgXUFDl3W7emMrMOAYJN4DwDSmDarzFe
         cZ+ohEyYGTefOTRk8/l//IKAOgy3OPnmiXx61yGjdQMrduQT1Ur+kkeQb8wupk9naJgK
         cuGtEgKZFUqFtw3gOOsR8n4cJKTMNRjHa9ExNlL3O5k4xSe9m8aWU0D0BS4MeiF48iVC
         Nr1WYiJrFjjb2l4yDBOte9C4UYQFdx36hKw/NN5f52eENn5e92a97/QPz7XyNlzZHmiQ
         g7YH9SxxhCqqVLPVMUW8i3bVihb56PM0ktxkGHSVi0yjpZDDCm2y/WbmoV3VUgcqZEwc
         gmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heWYQtv4xWf0HHku6hHfNqvO9iIIGMegbR7umcp7wts=;
        b=iAsWp8NLr5SQGRZvXZhVfEE03LWktm+9NOdEH65mjhHX131yc7Ifoz+69+ToKOeG5o
         vOxRK79cmlEZ9sxh1yNhMMRm4846ANAL94MkLRNfs+04FSoPD+1FUOgK6UJovR8EGHr4
         Hk4nvMxb8yEFSsTL1HZu4mvKKPZVUi5JzN3wE+Cw8S+AAw9MZIuBiOrhjzp2IJO03ZCE
         t+xaqVApRz4gx8vRCoZVsEhnnXxrvqzXo4QXtJq1Qy9/EvjyFsidVYOwvK+OyZYMW6oZ
         qteWqIm1/xZ75sWWbA6a95UUsysrqcPtKvmVnYdJAnoPwnIyhXYsDf0R2E/YQUeQurv1
         gjWw==
X-Gm-Message-State: ANoB5pmLTv3PdKs8gvUfyCkdI26Xz4F4Wr2YFRT+qnEG6VWaX4r8wJzQ
        FegqD65etUbE/JTU3KPRjtLUcw==
X-Google-Smtp-Source: AA0mqf5wCcypaptIGuX194nE3Cq/HugafgzPfOOMcrNMiFg8iTapPl0XUtQkIohQc4acGtF/A3Ocdw==
X-Received: by 2002:ac2:5226:0:b0:4b5:830d:12b7 with SMTP id i6-20020ac25226000000b004b5830d12b7mr4893805lfl.41.1670918472389;
        Tue, 13 Dec 2022 00:01:12 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d16-20020ac25450000000b004b6e9530900sm261751lfn.110.2022.12.13.00.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 00:01:11 -0800 (PST)
Message-ID: <f4102715-45b7-1196-878e-e0adce0d8c96@linaro.org>
Date:   Tue, 13 Dec 2022 09:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4] arm64: dts: qcom: sa8540p-ride: enable pcie2a node
Content-Language: en-US
To:     Shazad Hussain <quic_shazhuss@quicinc.com>, andersson@kernel.org,
        johan@kernel.org
Cc:     bmasney@redhat.com, kernel test robot <lkp@intel.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221213051109.8685-1-quic_shazhuss@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213051109.8685-1-quic_shazhuss@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/12/2022 06:11, Shazad Hussain wrote:
> Add the pcie2a, pcie2a_phy, and respective tlmm
> nodes that are needed to get pcie 2a controller
> enabled on Qdrive3.
> 
> This patch enables 4GB 64bit memory space for
> PCIE_2A to have BAR allocations of 64bit pref mem
> needed on this Qdrive3 platform with dual SoCs
> for root port and switch NT-EP. Hence this ranges
> property is overridden in sa8540p-ride.dts only.
> 
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Reported-by: kernel test robot <lkp@intel.com>

Drop, robot did not report this patch.

> ---
> Changes since v3:
> - Fix syntax error and add Reported-by (Kernel test robot)

So the previous patch was not even build... thus 100% not tested. Is
this one at least built?

Best regards,
Krzysztof

