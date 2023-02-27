Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A22846A3943
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 04:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbjB0DJh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Feb 2023 22:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjB0DJf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Feb 2023 22:09:35 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7702D11EA6
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Feb 2023 19:09:30 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id f41so6661459lfv.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Feb 2023 19:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARwtmBoWPA0mYm8v1Q76EhykRCJejAkEWfpNQ6zu43c=;
        b=TSiVzoeyw3I3ld9ftyMRaMMb1P+iJlpgniIXLOlhM4aJCoO4yPR0BiBHXGPdsb2Bq8
         MXdnGEDPWbn/pFuqZ/vIx/+AX7lFGcSpv9MzkdW6A5xEWtUcxy/xcVc4tMUCNlO4pa0B
         BUtwUnzw6TShTWQrv5g4IW7ra1tlTbLoyYp6bTK1GvwF2Z3fNfiXHJiljWCibDUpQs9h
         GRs3zQRpeFT0IK5+LHTBygMdxEFOab1jv/PWWlIy88L2tIi/RuJqV4XFo/3hD64bv4Rh
         bUAMqTjdhDmEkEpd5v8XMOnqPgvEPnrwIoJMXgDlRPHyg2hFfVnMsXgKiVha5msRyrm6
         IncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARwtmBoWPA0mYm8v1Q76EhykRCJejAkEWfpNQ6zu43c=;
        b=X7Jf9hUfV4n3z6XiM8krmf5Mxz8CCVJS2O76N17t4d9s4IFFVtTQgqqtGqDEYUPnFo
         pHKnTTHGAVCtcQRQMO+FuR+q2QlftsW5N19gn7TLNueJQTiB7Iq3XrUQ4LJm4DVP5925
         TXBMWDAmbEEPR8rLzWlmXxrjUEgz33wIB8uLSJ0xsmFtVCNt+O4B6q+4fupfmOy7sR+j
         Co+B870D3t1PPcSii08/XkWAo4QJynt+CKXK51GEkDCHHexBiHE7GEJtVYoxJqqbuebq
         ALdeTISUi6FkmmFXFNs4C0UkesKq3oDs7ZdasyRj+C30L1UcCs+Tze8vS2hgwx/zHhs6
         VZpg==
X-Gm-Message-State: AO0yUKU9GAaTODPXfgpFwQyK6YYErWewNYsOgLF49LJTyr7v+yYVV6Aq
        YXat085UqZwgrVNvY0ufWxKF6w==
X-Google-Smtp-Source: AK7set+kOX9ZVq8UFIZXjwlJxsqmYLOD3l4OBOH0tMaLId1c201sit7u1DbbLAEzzUpkOVDe0gyiug==
X-Received: by 2002:a05:6512:4c5:b0:4e0:c8ef:42b5 with SMTP id w5-20020a05651204c500b004e0c8ef42b5mr283404lfq.6.1677467368454;
        Sun, 26 Feb 2023 19:09:28 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac25ff0000000b004cb3e97bff8sm757705lfg.284.2023.02.26.19.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 19:09:28 -0800 (PST)
Message-ID: <94c18cc3-4b1a-440b-3bd8-3c81ddffc148@linaro.org>
Date:   Mon, 27 Feb 2023 05:09:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v10 4/6] soc: qcom: cpr: Move common functions to new file
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <nks@flawful.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Robert Marko <robimarko@gmail.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
References: <20230217-topic-cpr3h-v10-0-67aed8fdfa61@linaro.org>
 <20230217-topic-cpr3h-v10-4-67aed8fdfa61@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230217-topic-cpr3h-v10-4-67aed8fdfa61@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/02/2023 13:08, Konrad Dybcio wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> In preparation for implementing a new driver that will be handling
> CPRv3, CPRv4 and CPR-Hardened, format out common functions to a new
> file.
> 
> Update cpr_get_fuses in preparation for CPR3 implementation, change
> parameters where necessary to not take cpr.c private data structures.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> [Konrad: rebase, apply review comments, don't break backwards compat, improve msg]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/soc/qcom/Makefile     |   2 +-
>   drivers/soc/qcom/cpr-common.c | 363 +++++++++++++++++++++++++++++++++++++++
>   drivers/soc/qcom/cpr-common.h | 108 ++++++++++++
>   drivers/soc/qcom/cpr.c        | 386 +++---------------------------------------
>   4 files changed, 494 insertions(+), 365 deletions(-)
> 

[skipped]

> diff --git a/drivers/soc/qcom/cpr-common.h b/drivers/soc/qcom/cpr-common.h
> new file mode 100644
> index 000000000000..2cd15f7eac90
> --- /dev/null
> +++ b/drivers/soc/qcom/cpr-common.h
> @@ -0,0 +1,108 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <linux/clk.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +#include <linux/regulator/consumer.h>
> +
> +enum voltage_change_dir {
> +	NO_CHANGE,
> +	DOWN,
> +	UP,
> +};
> +
> +struct fuse_corner_data {
> +	int ref_uV;
> +	int max_uV;
> +	int min_uV;
> +	int range_uV;
> +	/* fuse volt: closed/open loop */
> +	int volt_cloop_adjust;
> +	int volt_oloop_adjust;

For CPR3 these values are per-fusing-rev.
(for 8996 tables list per-fusing-rev values for min_uV, 
volt_cloop_adjust and volt_oloop_adjust)

Another option, of course, might be to have a per-SoC code that uses 
fusing_rev to update the fuse_corner_data, but it would mean making it 
non-const.

> +	int max_volt_scale;
> +	int max_quot_scale;

Any reason for these limitations?

> +	/* fuse quot */
> +	int quot_offset;
> +	int quot_scale;
> +	int quot_adjust;

I see that quot_offset/quot_scale/quot_adjust are set to 0/1/0 for all 
the platforms I can assess at this moment (8996/8998/sdm660). Can we 
drop them? If we need them later, we can readd them later.

> +	/* fuse quot_offset */
> +	int quot_offset_scale;
> +	int quot_offset_adjust;
> +};
> +
> +struct cpr_fuse {
> +	char *ring_osc;
> +	char *init_voltage;
> +	char *quotient;
> +	char *quotient_offset;
> +};
> +
> +struct fuse_corner {
> +	int min_uV;
> +	int max_uV;
> +	int uV;
> +	int quot;
> +	int step_quot;
> +	const struct reg_sequence *accs;
> +	int num_accs;
> +	unsigned long max_freq;
> +	u8 ring_osc_idx;
> +};
> +
> +struct corner {
> +	int min_uV;
> +	int max_uV;
> +	int uV;
> +	int last_uV;
> +	int quot_adjust;
> +	u32 save_ctl;
> +	u32 save_irq;
> +	unsigned long freq;
> +	bool is_open_loop;
> +	struct fuse_corner *fuse_corner;
> +};
> +
> +struct corner_data {
> +	unsigned int fuse_corner;
> +	unsigned long freq;
> +};
> +
> +struct acc_desc {
> +	unsigned int	enable_reg;
> +	u32		enable_mask;
> +
> +	struct reg_sequence	*config;
> +	struct reg_sequence	*settings;
> +	int			num_regs_per_fuse;
> +};
> +
> +struct cpr_acc_desc {
> +	const struct cpr_desc *cpr_desc;
> +	const struct acc_desc *acc_desc;
> +};
> +

[skipped the rest]

-- 
With best wishes
Dmitry

