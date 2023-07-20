Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCCAE75AF68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 15:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbjGTNNv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 09:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbjGTNNq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 09:13:46 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A3D269A
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 06:13:43 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so6682585e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689858821; x=1690463621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=33+dIrV1g2li6K17tpdCbWThgnqyYELTLl4Ef0pYaFI=;
        b=ELEG4L2qZEKgbn/CUk4mr8V+GTaYcHKX+bqevSarlForkDjOhtzRVycgEg/LiXcDPj
         Kr96cq6sU0moXgJhufwG3kNiPbr+aZMgHMAUZw5xm16kFBHnpyyA9Fir6ZIyCfvED+44
         KvYbUXc/L9+teUmBwhpVYHBECYBVkf7Sye90VtT3bBzajxZculITif8pd4SYa6+VwudZ
         eEulGPDpT1jisJIjf31XmTcgugkQT91GY98ReaiMpFkXEKC3xBDMGuDyooYyPK4P5MoR
         TY6BJQnJh0s9yYwdiOp+/vPJ2kSTQGbUAw9yEkj4Uu2YZWGvpe6UYrLulUny8imF1NYX
         ZZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689858821; x=1690463621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33+dIrV1g2li6K17tpdCbWThgnqyYELTLl4Ef0pYaFI=;
        b=DiW2s2PvKuocfu1SDt4uBovPHGOoNqTfV70rbflOWe9pyPyIzNW/mM9cSpxm6ONX/r
         4DdlEdPUKHM681W058O7GvkFO1KXYWSYJhoJsSwcAllYdF9SHFmFKjCYMHJWJ7+V6Xj5
         9IooaZwesTcoicohOZxPaM73EZ8vvArBo02q/htlwo1eUDdazqj7e4qrhHTChUn9E5bp
         qkv25vEwtBkEVRzGWhkxkS61pc3PbNVFstT8IiG13xTsB2tCi2RUcdjZvHNPEM/PBHyi
         eszyS5dehJPgkIbAQ+C/zcInOm0pwI/7PE9LezxUKFGr2UteK55aDMqO66zlRLvkaYk4
         aLbA==
X-Gm-Message-State: ABy/qLYMEO+ektcBpX2SqILoqAeKx0sl4wccHWwnmOryefx5qqVeumq4
        4R3s3DzHV7aT4gMvdvSov+0aZQ==
X-Google-Smtp-Source: APBJJlGLbk/dGMS2u15ZxfXPZhUejqXraQAMnSt+pNwzRVCfjD/Iv62GXpdZvhsPa6mpU9rV1bHw0w==
X-Received: by 2002:a7b:c8cd:0:b0:3f9:b748:ff3f with SMTP id f13-20020a7bc8cd000000b003f9b748ff3fmr6553704wml.1.1689858821422;
        Thu, 20 Jul 2023 06:13:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id y15-20020a7bcd8f000000b003fbdd5d0758sm1166775wmj.22.2023.07.20.06.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 06:13:40 -0700 (PDT)
Message-ID: <c53c8fc5-a898-df1d-4626-696ffd990796@linaro.org>
Date:   Thu, 20 Jul 2023 15:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [V3,09/11] remoteproc: qcom: Add Hexagon based multipd rproc
 driver
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_eberman@quicinc.com, kvalo@kernel.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com
References: <20230718120501.3205661-1-quic_mmanikan@quicinc.com>
 <20230718120501.3205661-10-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718120501.3205661-10-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/07/2023 14:04, Manikanta Mylavarapu wrote:
> It adds support to bring up remoteproc's on multipd model.
> Pd means protection domain. It's similar to process in Linux.
> Here QDSP6 processor runs each wifi radio functionality on a
> separate process. One process can't access other process
> resources, so this is termed as PD i.e protection domain.

...

> + * User pd boot-info format mentioned below
> + * <Version> <No of elements passing over smem> <Header type> <Header Length>
> + * <Process Id> <Load address> <firmware mem Size>
> + *
> + * Returns 0 on success else negative value on failure.
> + */
> +static int share_upd_bootinfo_to_q6(struct rproc *rproc)
> +{
> +	int ret;
> +	size_t size;
> +	u16 cnt = 0, version;
> +	void *ptr;
> +	struct q6_wcss *wcss = rproc->priv, *upd_wcss;
> +	struct device_node *upd_np;
> +	struct platform_device *upd_pdev;
> +	struct rproc *upd_rproc;
> +	struct userpd_boot_info upd_bootinfo = {0};
> +	const struct firmware *fw;
> +
> +	ret = qcom_smem_alloc(REMOTE_PID, UPD_BOOT_INFO_SMEM_ID,
> +			      UPD_BOOT_INFO_SMEM_SIZE);
> +	if (ret && ret != -EEXIST) {
> +		dev_err(wcss->dev,
> +			"failed to allocate q6 bootinfo smem segment\n");
> +		return ret;
> +	}
> +
> +	ptr = qcom_smem_get(REMOTE_PID, UPD_BOOT_INFO_SMEM_ID, &size);
> +	if (IS_ERR(ptr) || size != UPD_BOOT_INFO_SMEM_SIZE) {
> +		dev_err(wcss->dev,
> +			"Unable to acquire smp2p item(%d) ret:%ld\n",
> +			UPD_BOOT_INFO_SMEM_ID, PTR_ERR(ptr));
> +		return PTR_ERR(ptr);
> +	}
> +
> +	/* print physical address */
> +	dev_info(wcss->dev,
> +		 "smem phyiscal address:0x%lX\n",
> +		 (uintptr_t)qcom_smem_virt_to_phys(ptr));

One more thought. Why do you need it? Even if this is not a kernel or
user-space address, why would like to disclose the memory layout? I
think this is contradictory to the kptr_restrict concept.

> +
> +	/*Version*/



Best regards,
Krzysztof

