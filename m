Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04A5A65CA7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 00:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233869AbjACXn6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 18:43:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbjACXn4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 18:43:56 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C854BEE02
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 15:43:54 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id d4so23442105wrw.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 15:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A2JOPYi0jjku4H+J6VK7cLUS2La/C2OGqRrqxZXsH18=;
        b=aixxfQEgnpcv07RNvHtqum+C8tR/rcn7QcvrpqSYieSYiXg7hx6xbYZFzMKLFUWLsG
         cuqmWG9CCqm5fhmv7P/jc+J3ohjrQLpg+/6FAYr9JYHNE+gjqMg4C8E2g48QRGSuM0jT
         GGUFNemBScvBYx8KDXPVGtBi+zvhwMbJ+drTrnITBKZhguDWZgrXP6Qz4R7+1hBRC3DG
         rNIgYJ4Y1u1J+QYTUFr4k85wQ+vLQh10kNxwydzN6WObkBheBNZV9Hov9sWB5wVH7o+A
         i0DHEBj34z/TXSC2EfBSNoIbVvp9hTXFZP1btAwkZISrGkhYGYKJMSrcNm2E0zQQFK7H
         VIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2JOPYi0jjku4H+J6VK7cLUS2La/C2OGqRrqxZXsH18=;
        b=qm9H2WxnYx383QE9mj1V1J5PTPyaCKzWChQe+nNowQfZxwIy7oEcGaZS5TdwZIp0/1
         OBAdcNyqtFvZZu5RXaDhMB0AtqROnrMZfDnfjTQ4BQgwdXn9+B/ostlnhLd9Lvg5yf4/
         J5Rz/TlMgZ5Qm+1jOPD9MqRsUGBRWoohVI4xY2myRzUU+HwtDJhrE5sL6Rki3P07InDR
         Wg5QrIgcAUamzwlxv4f5F3VROicAnXx0qdcqpwPORaIn7Awi26Iwvl/JctKDBs6uD0wE
         dqIxnc+w2QTWpb5W2p/iOH9gCDj8ohWmUeLTzen3T/YK0dGGbhKq97H5GVcnF9CG650q
         kzbg==
X-Gm-Message-State: AFqh2koY8GdReGF9dQg6V3Wtzjf2hT18MO4hLt7qfia/8QB6kU1Dfr0O
        94rR1r8dWSt9q2uH4sH3LM4j8g==
X-Google-Smtp-Source: AMrXdXuDEo+Av6UbTTQVwhY+HYZgAe6SA2ufUxpn7AlZ/RKyFWlWlgeWaTT4Y35NpejvKK8UPiwHSw==
X-Received: by 2002:adf:da44:0:b0:28e:f7a:9ff2 with SMTP id r4-20020adfda44000000b0028e0f7a9ff2mr13534417wrl.69.1672789433316;
        Tue, 03 Jan 2023 15:43:53 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m16-20020adffe50000000b00241bd7a7165sm36129830wrs.82.2023.01.03.15.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 15:43:52 -0800 (PST)
Message-ID: <0e2bdaec-b7ba-0474-8b80-8901fcc87a0f@linaro.org>
Date:   Tue, 3 Jan 2023 23:43:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/4] interconnect: qcom: rpm: Set QoS parameters
 regardless of RPM bw setting
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Georgi Djakov <djakov@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
References: <20230103173059.265856-1-konrad.dybcio@linaro.org>
 <20230103173059.265856-2-konrad.dybcio@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230103173059.265856-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/01/2023 17:30, Konrad Dybcio wrote:
> QoS parameters and RPM bandwidth requests are wholly separate. Setting one
> should only depend on the description of the interconnect node and not
> whether the other is present. If we vote through RPM, QoS parameters
> should be set so that the bus controller can make better decisions.

Is that true ?

> If we don't vote through RPM, QoS parameters should be set regardless,
> as we're requesting additional bandwidth by setting the interconnect
> clock rates.
> 
> The Fixes tag references the commit in which this logic was added, it
> has since been shuffled around to a different file, but it's the one
> where it originates from.
> 
> Fixes: f80a1d414328 ("interconnect: qcom: Add SDM660 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/interconnect/qcom/icc-rpm.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
> index 06e0fee547ab..a190a0a839c8 100644
> --- a/drivers/interconnect/qcom/icc-rpm.c
> +++ b/drivers/interconnect/qcom/icc-rpm.c
> @@ -252,8 +252,10 @@ static int __qcom_icc_set(struct icc_node *n, struct qcom_icc_node *qn,
>   		ret = qcom_icc_rpm_set(qn->mas_rpm_id, qn->slv_rpm_id, sum_bw);
>   		if (ret)
>   			return ret;
> -	} else if (qn->qos.qos_mode != -1) {
> -		/* set bandwidth directly from the AP */
> +	}
> +
> +	if (qn->qos.qos_mode != NOC_QOS_MODE_INVALID) {
> +		/* Set QoS params from the AP */
>   		ret = qcom_icc_qos_set(n, sum_bw);
>   		if (ret)
>   			return ret;

Taking the example of

static struct qcom_icc_node bimc_snoc_slv = {
         .name = "bimc_snoc_slv",
         .id = MSM8939_BIMC_SNOC_SLV,
         .buswidth = 16,
         .mas_rpm_id = -1,
         .slv_rpm_id = 2,
         .num_links = ARRAY_SIZE(bimc_snoc_slv_links),
         .links = bimc_snoc_slv_links,
};

#define NOC_QOS_MODE_INVALID -1
ap_owned == false
qos_mode == NOC_QOS_MODE_FIXED


if (!qn->qos.ap_owned) {
	/* bod: this will run */
	/* send bandwidth request message to the RPM processor */
	ret = qcom_icc_rpm_set(qn->mas_rpm_id, qn->slv_rpm_id, sum_bw);
	if (ret)
		return ret;
} else if (qn->qos.qos_mode != -1) {
	/* bod: this will not run */
	/* set bandwidth directly from the AP */
	ret = qcom_icc_qos_set(n, sum_bw);
	if (ret)
		return ret;
}

and your proposed change

if (!qn->qos.ap_owned) {
	/* bod: this will run */
	/* send bandwidth request message to the RPM processor */
	ret = qcom_icc_rpm_set(qn->mas_rpm_id, qn->slv_rpm_id, sum_bw);
	if (ret)
		return ret;
}

if (qn->qos.qos_mode != NOC_QOS_MODE_INVALID) {
	/* bod: this will run */
	/* set bandwidth directly from the AP */
	ret = qcom_icc_qos_set(n, sum_bw);
	if (ret)
		return ret;
}

however if we look downstream we have the concept of ap_owned

https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.BR.1.2.9-00810-8x09.0/drivers/platform/msm/msm_bus/msm_bus_fabric_adhoc.c#L194

https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.BR.1.2.9-00810-8x09.0/drivers/platform/msm/msm_bus/msm_bus_fabric_adhoc.c#L208

In simple terms
if (node_info->ap_owned) {
	ret = fabdev->noc_ops.set_bw(node_info,
									} else {
	ret = send_rpm_msg(node_device);
}

I agree your code does what it says on the tin but, whats the overall 
justification to depart from the downstream logic ?

---
bod
