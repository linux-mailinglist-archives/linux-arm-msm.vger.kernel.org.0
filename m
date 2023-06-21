Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFB5737849
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 02:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjFUAg4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 20:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFUAgz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 20:36:55 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F117173B
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 17:36:54 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b45b6adffbso71886101fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 17:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687307812; x=1689899812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/l7DYSagNPydqEO3Y80Jc2xodpGTTpoiDd+43jYnWw=;
        b=tW6n2kSf3gI8FKIk3Km9Zpn4rXaMG2IzfpmufmNYQ1R9ddCzgYP6TmIeXAiAv7d+Pq
         SgMFWhdVuHdXLnGj0aouJD3LETl8TSJht9iFhrx2qVhtcdrFWZl/P9zP9/WFpIrm40Hu
         ggOZ79cN052wstmXGcC1QG16a7asDvoR/tEgenk1daMI0ebBmRAar5hulV3ALaiq2FyE
         BoQSNEksKjs0Okr0Hu5Bttnbw/EURR+Ggxz4MUh7vgaUHWrBuRkmeei90rwSsIIIpdmT
         qAWnpWiFnvdWLttUdPMAK0Bli+P+b969CzFmTShuMrTCLyY6AILVzwxBUDOG58jNUbAl
         fCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687307812; x=1689899812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/l7DYSagNPydqEO3Y80Jc2xodpGTTpoiDd+43jYnWw=;
        b=kwCH6ETT2T6/o9vqv4DG1UW6UKHOKttxCqU/Z7uVPv6qCXCF8+xN1PWPOe49eqUb2t
         WSDCXb0TpDzptHlEqrfr2c9Wl+5Wx8wdBWmhNbknsX8tIopIparrYVTyVX4f4pT968HN
         N1IDZWu3KjjG4NgalHfsQniXZCrN37+vJe7aKctxyPw/PunSPEQwZ4wPsHTkgMmeLPHr
         thUwxfEctqHHIi6pKlHo/avXfEi7azKaDNCZUcqYNfih0GNdsw2AAmGk3xsW6lxwZqwM
         Odb2U2zx/DLi1s3DERd6NIOj6cTJh6a4i91Mjult8SGm701gW1rWRKXas6hCOeBWtj3p
         CHPQ==
X-Gm-Message-State: AC+VfDz48nYWI5+W6hpCy1VfLmKVrlWRBn10zbplDqgGXInfKXapyO2a
        14vmnMPC21Ly4zc3jdd4l5AALknfY0V+CjgVj9U=
X-Google-Smtp-Source: ACHHUZ6Peolx/ID1kFL/8Kzui3VX9WIcm1bAqVyya8pPMCeKgGhdEDxM0qipM97vg0EsdPjhHBz4FQ==
X-Received: by 2002:a2e:b603:0:b0:2b4:6d7e:4b03 with SMTP id r3-20020a2eb603000000b002b46d7e4b03mr6221163ljn.31.1687307812488;
        Tue, 20 Jun 2023 17:36:52 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id z6-20020a2e9646000000b002b481369062sm651279ljh.51.2023.06.20.17.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 17:36:52 -0700 (PDT)
Message-ID: <0fb28138-515a-d1d7-522f-0bb1d022f14f@linaro.org>
Date:   Wed, 21 Jun 2023 02:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Include state in trace event
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230620230058.428833-1-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620230058.428833-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21.06.2023 01:00, Bjorn Andersson wrote:
> When tracing messages written to the RSC it's very useful to know the
> type of TCS being targeted, in particular if/when the code borrows a
> WAKE TCS for ACTIVE votes.
> 
> Add the "state" of the message to the traced information.
> 
> While at it, drop the "send-msg:" substring, as this is already captured
> by the trace event itself.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/rpmh-rsc.c   |  2 +-
>  drivers/soc/qcom/trace-rpmh.h | 16 ++++++++++++----
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 0dd4363ebac8..a021dc71807b 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -516,7 +516,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>  		write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_MSGID], tcs_id, j, msgid);
>  		write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], tcs_id, j, cmd->addr);
>  		write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, j, cmd->data);
> -		trace_rpmh_send_msg(drv, tcs_id, j, msgid, cmd);
> +		trace_rpmh_send_msg(drv, tcs_id, msg->state, j, msgid, cmd);
>  	}
>  
>  	cmd_enable |= read_tcs_reg(drv, drv->regs[RSC_DRV_CMD_ENABLE], tcs_id);
> diff --git a/drivers/soc/qcom/trace-rpmh.h b/drivers/soc/qcom/trace-rpmh.h
> index 12b676b20cb2..be6b42ecc1f8 100644
> --- a/drivers/soc/qcom/trace-rpmh.h
> +++ b/drivers/soc/qcom/trace-rpmh.h
> @@ -38,14 +38,15 @@ TRACE_EVENT(rpmh_tx_done,
>  
>  TRACE_EVENT(rpmh_send_msg,
>  
> -	TP_PROTO(struct rsc_drv *d, int m, int n, u32 h,
> +	TP_PROTO(struct rsc_drv *d, int m, enum rpmh_state state, int n, u32 h,
>  		 const struct tcs_cmd *c),
>  
> -	TP_ARGS(d, m, n, h, c),
> +	TP_ARGS(d, m, state, n, h, c),
>  
>  	TP_STRUCT__entry(
>  			 __string(name, d->name)
>  			 __field(int, m)
> +			 __field(u32, state)
>  			 __field(int, n)
>  			 __field(u32, hdr)
>  			 __field(u32, addr)
> @@ -56,6 +57,7 @@ TRACE_EVENT(rpmh_send_msg,
>  	TP_fast_assign(
>  		       __assign_str(name, d->name);
>  		       __entry->m = m;
> +		       __entry->state = state;
>  		       __entry->n = n;
>  		       __entry->hdr = h;
>  		       __entry->addr = c->addr;
> @@ -63,8 +65,14 @@ TRACE_EVENT(rpmh_send_msg,
>  		       __entry->wait = c->wait;
>  	),
>  
> -	TP_printk("%s: send-msg: tcs(m): %d cmd(n): %d msgid: %#x addr: %#x data: %#x complete: %d",
> -		  __get_str(name), __entry->m, __entry->n, __entry->hdr,
> +	TP_printk("%s: tcs(m): %d [%s] cmd(n): %d msgid: %#x addr: %#x data: %#x complete: %d",
> +		  __get_str(name), __entry->m,
> +		  __print_symbolic(__entry->state,
> +				   { RPMH_SLEEP_STATE, "sleep" },
> +				   { RPMH_WAKE_ONLY_STATE, "wake" },
> +				   { RPMH_ACTIVE_ONLY_STATE, "active" }),
> +		  __entry->n,
> +		  __entry->hdr,
>  		  __entry->addr, __entry->data, __entry->wait)
>  );
>  
