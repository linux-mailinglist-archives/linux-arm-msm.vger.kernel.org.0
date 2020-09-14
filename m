Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76CD52683AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 06:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgINEbJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 00:31:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:54968 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726003AbgINEbG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 00:31:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600057865; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=88UihbQrOz0bvm/bZjwFSbpcpa8STz3Eo/uF7Jfs0XM=; b=J/bU0zaGLaj/whyiqqUf+UmtcmOsOV2hcPTxBvCszZkWwunhlCKkI6u/e1TxhJ6cYQZ21WrX
 w08Kuyt6R8JvGOEUVq99hy+HPmb6M+7KHm1zHHI72Izddp09T8Wbi8bZ1NXku0MFMIAQJms8
 fR2VfhetOxF0TDrEnse+xdvSzmI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f5ef200380a624e4dee7923 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 04:30:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7542FC433CA; Mon, 14 Sep 2020 04:30:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.4] (unknown [171.49.233.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gkohli)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 87E1FC433C6;
        Mon, 14 Sep 2020 04:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 87E1FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=gkohli@codeaurora.org
Subject: Re: [PATCH] trace: Fix race in trace_open and buffer resize call
To:     rostedt@goodmis.org, mingo@redhat.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1599199797-25978-1-git-send-email-gkohli@codeaurora.org>
From:   Gaurav Kohli <gkohli@codeaurora.org>
Message-ID: <d4691a90-9a47-b946-f2cd-bb1fce3981b0@codeaurora.org>
Date:   Mon, 14 Sep 2020 10:00:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599199797-25978-1-git-send-email-gkohli@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Steven,

Please let us know, if below change looks good.
Or let us know some other way to solve this.

Thanks,
Gaurav



On 9/4/2020 11:39 AM, Gaurav Kohli wrote:
> Below race can come, if trace_open and resize of
> cpu buffer is running parallely on different cpus
> CPUX                                CPUY
> 				    ring_buffer_resize
> 				    atomic_read(&buffer->resize_disabled)
> tracing_open
> tracing_reset_online_cpus
> ring_buffer_reset_cpu
> rb_reset_cpu
> 				    rb_update_pages
> 				    remove/insert pages
> resetting pointer
> This race can cause data abort or some times infinte loop in
> rb_remove_pages and rb_insert_pages while checking pages
> for sanity.
> Take ring buffer lock in trace_open to avoid resetting of cpu buffer.
> 
> Signed-off-by: Gaurav Kohli <gkohli@codeaurora.org>
> 
> diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
> index 136ea09..55f9115 100644
> --- a/include/linux/ring_buffer.h
> +++ b/include/linux/ring_buffer.h
> @@ -163,6 +163,8 @@ bool ring_buffer_empty_cpu(struct trace_buffer *buffer, int cpu);
>   
>   void ring_buffer_record_disable(struct trace_buffer *buffer);
>   void ring_buffer_record_enable(struct trace_buffer *buffer);
> +void ring_buffer_mutex_acquire(struct trace_buffer *buffer);
> +void ring_buffer_mutex_release(struct trace_buffer *buffer);
>   void ring_buffer_record_off(struct trace_buffer *buffer);
>   void ring_buffer_record_on(struct trace_buffer *buffer);
>   bool ring_buffer_record_is_on(struct trace_buffer *buffer);
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 93ef0ab..638ec8f 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -3632,6 +3632,25 @@ void ring_buffer_record_enable(struct trace_buffer *buffer)
>   EXPORT_SYMBOL_GPL(ring_buffer_record_enable);
>   
>   /**
> + * ring_buffer_mutex_acquire - prevent resetting of buffer
> + * during resize
> + */
> +void ring_buffer_mutex_acquire(struct trace_buffer *buffer)
> +{
> +	mutex_lock(&buffer->mutex);
> +}
> +EXPORT_SYMBOL_GPL(ring_buffer_mutex_acquire);
> +
> +/**
> + * ring_buffer_mutex_release - prevent resetting of buffer
> + * during resize
> + */
> +void ring_buffer_mutex_release(struct trace_buffer *buffer)
> +{
> +	mutex_unlock(&buffer->mutex);
> +}
> +EXPORT_SYMBOL_GPL(ring_buffer_mutex_release);
> +/**
>    * ring_buffer_record_off - stop all writes into the buffer
>    * @buffer: The ring buffer to stop writes to.
>    *
> @@ -4918,6 +4937,8 @@ void ring_buffer_reset(struct trace_buffer *buffer)
>   	struct ring_buffer_per_cpu *cpu_buffer;
>   	int cpu;
>   
> +	/* prevent another thread from changing buffer sizes */
> +	mutex_lock(&buffer->mutex);
>   	for_each_buffer_cpu(buffer, cpu) {
>   		cpu_buffer = buffer->buffers[cpu];
>   
> @@ -4936,6 +4957,7 @@ void ring_buffer_reset(struct trace_buffer *buffer)
>   		atomic_dec(&cpu_buffer->record_disabled);
>   		atomic_dec(&cpu_buffer->resize_disabled);
>   	}
> +	mutex_unlock(&buffer->mutex);
>   }
>   EXPORT_SYMBOL_GPL(ring_buffer_reset);
>   
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index f40d850..392e9aa 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -2006,6 +2006,8 @@ void tracing_reset_online_cpus(struct array_buffer *buf)
>   	if (!buffer)
>   		return;
>   
> +	ring_buffer_mutex_acquire(buffer);
> +
>   	ring_buffer_record_disable(buffer);
>   
>   	/* Make sure all commits have finished */
> @@ -2016,6 +2018,8 @@ void tracing_reset_online_cpus(struct array_buffer *buf)
>   	ring_buffer_reset_online_cpus(buffer);
>   
>   	ring_buffer_record_enable(buffer);
> +
> +	ring_buffer_mutex_release(buffer);
>   }
>   
>   /* Must have trace_types_lock held */
> 

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
