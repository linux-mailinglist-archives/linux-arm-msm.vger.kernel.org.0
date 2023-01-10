Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79A8C6642A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 15:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238330AbjAJOBW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 09:01:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233194AbjAJOAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 09:00:55 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E86CD70
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 06:00:52 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so7118818wma.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 06:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CCLXjJDBA/yZy5Qm5n4xkawhrlKWWq87IS+X7t/wE4c=;
        b=h0+DYlL0hvt4o0qrTP2PPem00/rHncpdOTcyHrcNiwxFBkvex3AQwp+6jf/jxw8gND
         MUm6aOk1+5x7BlDbNZvS2g74ShAcmMSFAeJyO1gRoYNgf7jO9toL9VrFSVg88mNenkzB
         2oRZQ/LRp0EoAzsm1ThudPb/AzQuel+2CaN2gZP3j/tkkKx+I1br5nZB56ovh1aoyXYH
         b+cVRKeeXzWtCe6YboaJinc8KI2AJh49Ny3YQBpFjASNTeONRKLDhfI6LHxYd8ukUAUW
         Gc8lXMoCBjKMtgRsuKu6RCTlhr+rEfucOnvO4K1Q6NSHgaC+lg9AxJ2/MQ+MLMySR2Vt
         6A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CCLXjJDBA/yZy5Qm5n4xkawhrlKWWq87IS+X7t/wE4c=;
        b=bv4DW2H7WiYfpoWc4ko1flgQsmAF3gQVvzqzEY+feOgGeGB6nkHPtYgeq24BLubNBA
         qFV37QSud4pvAWRRYnqhxhzb8JjX8SN2coVU0dAPJizwKZkv0180G3NC97QXco9JZc5C
         WryFyZrapDmEvSm/BLUJBjJYcAMon5NxxY/lJyMsxDgBjq1oaxWmR4y2e9W0m9OG65od
         T+0xZJ4v/RUpQqrMO3ZKMYEJlXbukbqL65gZKziknYWGQt679B3RaCjBHjCBmR3Mf/kV
         tUdXN1HVPtX4r8VSL4kYVS8NLNApfFPIooybBKBpBdFeHbi3lJOVFFDkFcmUq2GEBGcA
         n7OA==
X-Gm-Message-State: AFqh2kq4YsNZy/q4gcNNUCUqP6dMP7KsSESKh17bu+r/nYJJc6qRrMks
        M0bwpebMWUVJoPU7PUfKRrWKOA==
X-Google-Smtp-Source: AMrXdXsbiKywPF473CvF1IBQ+bK5a5EhlEOeqR2xogfHTZsWs5E078h8X5YKuT5zvdsiV1tuFghF3A==
X-Received: by 2002:a05:600c:348b:b0:3d2:2a72:2577 with SMTP id a11-20020a05600c348b00b003d22a722577mr48383078wmq.27.1673359249302;
        Tue, 10 Jan 2023 06:00:49 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p21-20020a7bcc95000000b003c65c9a36dfsm14631018wma.48.2023.01.10.06.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 06:00:48 -0800 (PST)
Message-ID: <1039a507-c4cd-e92f-dc29-1e2169ce5078@linaro.org>
Date:   Tue, 10 Jan 2023 14:00:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 01/10] interconnect: qcom: rpm: Don't set QoS params
 before non-zero bw is requested
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Georgi Djakov <djakov@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230110132202.956619-1-konrad.dybcio@linaro.org>
 <20230110132202.956619-2-konrad.dybcio@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230110132202.956619-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 10/01/2023 13:21, Konrad Dybcio wrote:
> Until now, the icc-rpm driver unconditionally set QoS params, even on
> empty requests. This is superfluous and the downstream counterpart does
> not do it. Follow it by doing the same.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/interconnect/qcom/icc-rpm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
> index df3196f72536..361dcbf3386f 100644
> --- a/drivers/interconnect/qcom/icc-rpm.c
> +++ b/drivers/interconnect/qcom/icc-rpm.c
> @@ -191,6 +191,12 @@ static int qcom_icc_qos_set(struct icc_node *node, u64 sum_bw)
>   	struct qcom_icc_provider *qp = to_qcom_provider(node->provider);
>   	struct qcom_icc_node *qn = node->data;
>   
> +	/* Defer setting QoS until the first non-zero bandwidth request. */
> +	if (!(node->avg_bw || node->peak_bw)) {
> +		dev_dbg(node->provider->dev, "NOT Setting QoS for %s\n", qn->name);
> +		return 0;
> +	}
> +
>   	dev_dbg(node->provider->dev, "Setting QoS for %s\n", qn->name);
>   
>   	switch (qp->type) {

I still think you should include the original logic on the else, for the 
minimum case of silicon that predates the 5.4 kernel release.

/* Clear bandwidth registers */
set_qos_bw_regs(base, mas_index, 0, 0, 0, 0, 0);

Either that or get the relevant silicon engineers at qcom to say the 
host side port write is redundant.

---
bod
