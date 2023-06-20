Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC4C7377EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 01:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjFTX1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 19:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFTX1a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 19:27:30 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71901704
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 16:27:28 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f86e1bdce5so4401395e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 16:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687303647; x=1689895647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vqBWxLJJaJ1q1UaOrctBt8PsQCamxn0xOOj4PYBN/lQ=;
        b=T/cvWIn8DTUMpnusme8zEVb8TWXIznEVvjPaUSEtNoFNlR+BnrrscN5r9CC8zk1Ogi
         +vS1nJ8FQNKge0SCRrZUfo/7l9CVDdCEbASpAxOCN2AehaRfFOcdj6pJj9OOFR1pjTrZ
         NO5MegG7AIY4RXYjIAHc9PdPTL83r77KZ+eTrkVjCTc+FJnJpn71i4lClZeHPAMX/gHe
         /Kgzb3Nt6h3QuQmtBHJALTmF50PROcG42y6O5K8sig4Z+5MDRfVgTLe5VWW/XUAXk/ff
         5eWZ/Ot6OzvXltNUHMH/HqKVb2Jr54Y8EdwCdI+NVJ0yPT+JzaoS+wwFotzRwpjINMbq
         p6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687303647; x=1689895647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqBWxLJJaJ1q1UaOrctBt8PsQCamxn0xOOj4PYBN/lQ=;
        b=eYRwHOzyKhz1cIw03keiljSIYnVs+4dcqD3KeLgwBG/o2s1qRT/5dYxbhfB0zpx9e0
         LNUOO5YFwJRAU5HJ3HCfsFKLcqVk5wNzK7RXs+PcJa0w3B7rDyg3bEAQGh8nTqBOisqz
         nLpYKmCVAtBkSVPRtvF5CFp4vA+Fz4fmfoemE7Nr5rwpR4O/ewnx2MNgnQhqB4n527U+
         mA1GwHpyc4dhLPcnlqtQ5BT48il1LnOPDqEQiV4BDeNl0XGPnTXfCabQsTESsvnIzW7O
         VXGsHYhdEOGB8o4F+8Dxq1dy7xFSX+ZMmfwqidNJFVTLVjmy5PXr4SnSZdyfGRxez/pL
         aCjA==
X-Gm-Message-State: AC+VfDzcbGmvzIqrUCwwseC+OF+7ANQxmDul0mgsC3lga2uJO+FXpw7x
        Wd2Yneey8LVA1P6QEtwiQO/VkA==
X-Google-Smtp-Source: ACHHUZ6eZy+L3YgQaDBd7s9jjqbiGJiZdM9j29myhoa4pO7PjcKYTHBgAf2F2gzH/zmdK6WhVnG8Zw==
X-Received: by 2002:a19:8c04:0:b0:4f8:587e:cbe0 with SMTP id o4-20020a198c04000000b004f8587ecbe0mr7142321lfd.52.1687303646744;
        Tue, 20 Jun 2023 16:27:26 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id j3-20020ac253a3000000b004f13c3cb9ffsm525686lfh.200.2023.06.20.16.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 16:27:26 -0700 (PDT)
Message-ID: <f68afd0e-d2a6-37df-e037-27248f9c5519@linaro.org>
Date:   Wed, 21 Jun 2023 01:27:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] soc: qcom: cmd-db: Drop NUL bytes from debugfs output
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230620213703.283583-1-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620213703.283583-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20.06.2023 23:37, Bjorn Andersson wrote:
> The debugfs dump of Command DB relies uses %*pEp to print the resource
> identifiers, with escaping of non-printable characters.
> But p (ESCAPE_NP) does not escape NUL characters, so for identifiers
> less than 8 bytes in length the output will retain these.
> 
> This does not cause an issue while looking at the dump in the terminal
> (no known complaints at least), but when programmatically consuming the
> debugfs output the extra characters are unwanted.
> 
> Change the fixed 8-byte sizeof() to a dynamic strnlen() to avoid
> printing these NUL characters.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/cmd-db.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> index 33856abd560c..34c40368d5b5 100644
> --- a/drivers/soc/qcom/cmd-db.c
> +++ b/drivers/soc/qcom/cmd-db.c
> @@ -284,7 +284,7 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
>  		ent = rsc_to_entry_header(rsc);
>  		for (j = 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
>  			seq_printf(seq, "0x%05x: %*pEp", le32_to_cpu(ent->addr),
> -				   (int)sizeof(ent->id), ent->id);
> +				   (int)strnlen(ent->id, sizeof(ent->id)), ent->id);
>  
>  			len = le16_to_cpu(ent->len);
>  			if (len) {
