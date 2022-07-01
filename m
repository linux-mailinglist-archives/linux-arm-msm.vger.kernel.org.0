Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 833C556320D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 12:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235392AbiGAK7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 06:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235907AbiGAK7s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 06:59:48 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6559D7E033;
        Fri,  1 Jul 2022 03:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656673187; x=1688209187;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zwXiI7LNSRTMgOwPQ//yw+saai2jTHywEYViefmeQtg=;
  b=x/Sl6nlPVwlq/3EJDPeyasqTl94pBIl/bv4cTUksmADoZMNUZGjJMOAy
   oY8jPOu3FnH8gv3uvKX01erYHb3F45+0gjUdL0luz7r2P41yy62qXZk1+
   4li22eb6GJZqBfWenQNiNd5Jiqu0TtYGMLNbRymrpQI47U3QXPlYHrEAj
   A=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Jul 2022 03:59:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2022 03:59:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Jul 2022 03:59:46 -0700
Received: from [10.216.5.206] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 1 Jul 2022
 03:59:42 -0700
Message-ID: <aa754d43-ec58-97c7-e50b-0459a850e302@quicinc.com>
Date:   Fri, 1 Jul 2022 16:29:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 4/5] firmware: qcom: scm: Add wait-queue helper functions
Content-Language: en-US
To:     Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     David Heidelberg <david@ixit.cz>,
        Robert Marko <robimarko@gmail.com>,
        Elliot Berman <quic_eberman@quicinc.com>
References: <1656359076-13018-1-git-send-email-quic_gurus@quicinc.com>
 <1656359076-13018-5-git-send-email-quic_gurus@quicinc.com>
From:   Rajendra Nayak <quic_rjendra@quicinc.com>
In-Reply-To: <1656359076-13018-5-git-send-email-quic_gurus@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/28/2022 1:14 AM, Guru Das Srinagesh wrote:
> When the firmware (FW) supports multiple requests per VM, and the VM also
> supports it via the `enable-multi-call` device tree flag, the floodgates
> are thrown open for them to all reach the firmware at the same time.
> 
> Since the firmware currently being used has limited resources, it guards
> them with a resource lock and puts requests on a wait-queue internally
> and signals to HLOS that it is doing so. It does this by returning two
> new return values in addition to success or error: SCM_WAITQ_SLEEP and
> SCM_WAITQ_WAKE.
> 
>    1) SCM_WAITQ_SLEEP:
> 
>    	When an SCM call receives this return value instead of success
>    	or error, FW has placed this call on a wait-queue and
>    	has signalled HLOS to put it to non-interruptible sleep. (The
> 	mechanism to wake it back up will be described in detail in the
> 	next patch for the sake of simplicity.)
> 
> 	Along with this return value, FW also passes to HLOS `wq_ctx` -
> 	a unique number (UID) identifying the wait-queue that it has put
> 	the call on, internally. This is to help HLOS with its own
> 	bookkeeping to wake this sleeping call later.
> 
> 	Additionally, FW also passes to HLOS `smc_call_ctx` - a UID
> 	identifying the SCM call thus being put to sleep. This is also
> 	for HLOS' bookkeeping to wake this call up later.
> 
> 	These two additional values are passed via the a1 and a2
> 	registers.
> 
> 	N.B.: The "ctx" in the above UID names = "context".
> 
>    2) SCM_WAITQ_WAKE:
> 
>    	When an SCM call receives this return value instead of success
>    	or error, FW wishes to signal HLOS to wake up a (different)
>    	previously sleeping call.

What happens to this SCM call itself (The one which gets an SCM_WAITQ_WAKE returned
instead of a success or failure)?
is it processed? how does the firmware in that case return a success or error?

> 
>    	FW tells HLOS which call to wake up via the additional return
>    	values `wq_ctx`, `smc_call_ctx` and `flags`. The first two have
>    	already been explained above.
> 
>    	`flags` can be either WAKE_ONE or WAKE_ALL. Meaning, wake either
>    	one, or all, of the SCM calls that HLOS is associating with the
>    	given `wq_ctx`.
> 
> A sleeping SCM call can be woken up by either an interrupt that FW
> raises, or via a SCM_WAITQ_WAKE return value for a new SCM call.
> 
> The handshake mechanism that HLOS uses to talk to FW about wait-queue
> operations involves three new SMC calls. These are:
> 
>    1) get_wq_ctx():
> 
>      	Arguments: 	None
>      	Returns:	wq_ctx, flags, more_pending
> 
>      	Get the wait-queue context, and wake up either one or all of the
>      	sleeping SCM calls associated with that wait-queue.
> 
>      	Additionally, repeat this if there are more wait-queues that are
>      	ready to have their requests woken up (`more_pending`).
> 
>    2) wq_resume(smc_call_ctx):
> 
>    	Arguments:	smc_call_ctx
> 
>    	HLOS needs to issue this in response to receiving an
>    	IRQ, passing to FW the same smc_call_ctx that FW
>    	receives from HLOS via the get_wq_ctx() call.
> 
>    3) wq_wake_ack(smc_call_ctx):
> 
>    	Arguments:	smc_call_ctx
> 
>    	HLOS needs to issue this in response to receiving an
>    	SCM_WAITQ_WAKE, passing to FW the same smc_call_ctx that FW
>    	passed to HLOS via the SMC_WAITQ_WAKE call.
> 
> (Reminder that the full handshake mechanism will be detailed in the
> subsequent patch.)
> 
> Also add the interrupt handler that wakes up a sleeping SCM call.
> 
> Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>

[]...

> +
>   static int qcom_scm_probe(struct platform_device *pdev)
>   {
>   	struct qcom_scm *scm;
>   	unsigned long clks;
> -	int ret;
> +	int irq, ret;
>   
>   	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
>   	if (!scm)
> @@ -1333,12 +1432,28 @@ static int qcom_scm_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> +	platform_set_drvdata(pdev, scm);
> +
>   	__scm = scm;
>   	__scm->dev = &pdev->dev;
>   
> +	spin_lock_init(&__scm->waitq.idr_lock);
> +	idr_init(&__scm->waitq.idr);
>   	qcom_scm_allow_multicall = of_property_read_bool(__scm->dev->of_node,
>   							"allow-multi-call");
>   
> +	INIT_WORK(&__scm->waitq.scm_irq_work, scm_irq_work);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq) {
> +		ret = devm_request_threaded_irq(__scm->dev, irq, NULL,
> +			qcom_scm_irq_handler, IRQF_ONESHOT, "qcom-scm", __scm);
> +		if (ret < 0) {
> +			pr_err("Failed to request qcom-scm irq: %d\n", ret);

idr_destroy()?

> +			return ret;
> +		}
> +	}
> +
>   	__get_convention();
>   
>   	/*
> @@ -1354,6 +1469,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
>   
>   static void qcom_scm_shutdown(struct platform_device *pdev)
>   {
> +	idr_destroy(&__scm->waitq.idr);
>   	/* Clean shutdown, disable download mode to allow normal restart */
>   	if (download_mode)
>   		qcom_scm_set_download_mode(false);
