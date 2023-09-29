Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBD8B7B3A9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 21:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbjI2TWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 15:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233392AbjI2TWU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 15:22:20 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F771B4
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 12:22:18 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-49ab0641e77so1773939e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696015337; x=1696620137; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bKHr/R9x/1NqeTBuXlIluFo+yXauTlrOF4zuHxZuxHw=;
        b=zEDWHsNKNVPaDP/vTysjiJNmi41GZNg7aPBuBj/r+iZRwSKmASWlGybRzEUqsyIhde
         u7KnUpej0iluIaEI6hqMdcvdtKjFo8rMz4xZoDx/ZmWI+HQEN8tJO2/iMzaS3nyQb4dg
         BxLQ9ANnw9wa3DTCYJjnCG072TXQCEN30TzcKGE3oFOrdgV1EJDPYhx3WmY6hiHhqnoY
         mrmS2l8C2wSBqLbqkvBjkZorQC7V5mmUh6COuDJRpZ/dl339neHhz3tcpSI5Lx+SxYTd
         eoM2y37AdwvThz9s//f0VQH5Hr8LuuIMQaEerRBAm6vh7wGnEQAgYvlvmZVP4cZmD7Fs
         eKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015337; x=1696620137;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bKHr/R9x/1NqeTBuXlIluFo+yXauTlrOF4zuHxZuxHw=;
        b=m2TyegrrwoVq8BegTHhrVeCPT3keVlkzBdJdgO6xtQRff4804X7LHmBbBTHYYTn/t+
         urjiXSFK/BygHibQt2xQHBlQZT+bX18sYcuKvK8GgtsDSwT6mzQ02KwJddaks1XDaqnV
         zEKEJOs8OQjS21StJm7LD7ANCxxMKViNB4dup/Tp50MmZ/Abr493OD8sXXZMYy0FqaoZ
         qGOOoU5VpEgAtHq9B+pY4Px3RwjEla1ciSBxy3VF67Am/7Lh/w8TP8qocPmhnq0U9r24
         c8brTb2BDUNPS+Es8JvViLgq23qbREU14xntPY6CNC29TrvEX7UZLxf9qyDISScphbbG
         oFSQ==
X-Gm-Message-State: AOJu0Yz21wa0trVvnS9b/IutOO+WYFvCk2yPqBgGQjLwCKlBfsv7Dnt4
        qY9KQimmth91INFq6lgmtxVpd9ZlTpZb9RIN4Q3XrnKq/F8Bn27l
X-Google-Smtp-Source: AGHT+IHr/B2JKGg5ZI0AZNA6mEF2ZSibAXy4BcAnwvvXRpgXyDpXREKBArbK2MI+k5JyGCH/9qAwiWbMVTXeOy7/VZ0=
X-Received: by 2002:a1f:d6c4:0:b0:48f:8e3a:5b83 with SMTP id
 n187-20020a1fd6c4000000b0048f8e3a5b83mr5546267vkg.14.1696015337610; Fri, 29
 Sep 2023 12:22:17 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Sep 2023 12:22:16 -0700
From:   Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <gwflmag5pq7osprj25l7i4tgyln2nauuqcwdhth2eomareooag@4dw4lwk4vr36>
MIME-Version: 1.0
References: <20230928092040.9420-1-brgl@bgdev.pl> <20230928092040.9420-7-brgl@bgdev.pl>
 <gwflmag5pq7osprj25l7i4tgyln2nauuqcwdhth2eomareooag@4dw4lwk4vr36>
Date:   Fri, 29 Sep 2023 12:22:16 -0700
Message-ID: <CAMRc=Mfxt1DLinxMcKivQqqnHvFv5P8WXNnfAwnfrHgoz+q-5w@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] firmware: qcom: scm: make qcom_scm_pas_init_image()
 use the SCM allocator
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Sep 2023 21:16:51 +0200, Andrew Halaney <ahalaney@redhat.com> said:
> On Thu, Sep 28, 2023 at 11:20:35AM +0200, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> Let's use the new SCM memory allocator to obtain a buffer for this call
>> instead of using dma_alloc_coherent().
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c | 16 +++++-----------
>>  1 file changed, 5 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 02a773ba1383..c0eb81069847 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -532,7 +532,7 @@ static void qcom_scm_set_download_mode(bool enable)
>>  int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>>  			    struct qcom_scm_pas_metadata *ctx)
>>  {
>> -	dma_addr_t mdata_phys;
>> +	phys_addr_t mdata_phys;
>
>>  	void *mdata_buf;
>>  	int ret;
>>  	struct qcom_scm_desc desc = {
>> @@ -544,13 +544,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>>  	};
>>  	struct qcom_scm_res res;
>>
>> -	/*
>> -	 * During the scm call memory protection will be enabled for the meta
>> -	 * data blob, so make sure it's physically contiguous, 4K aligned and
>> -	 * non-cachable to avoid XPU violations.
>> -	 */
>> -	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
>> -				       GFP_KERNEL);
>> +	mdata_buf = qcom_scm_mem_alloc(size, GFP_KERNEL);
>
> mdata_phys is never initialized now, and its what's being shoved into
> desc.args[1] later, which I believe is what triggered the -EINVAL
> with qcom_scm_call() that I reported in my cover letter reply this
> morning.
>
> Prior with the DMA API that would have been the device view of the buffer.
>

Gah! Thanks for finding this.

Can you try the following diff?

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 794388c3212f..b0d4ea237034 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -556,6 +556,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const
void *metadata, size_t size,
 		dev_err(__scm->dev, "Allocation of metadata buffer failed.\n");
 		return -ENOMEM;
 	}
+	mdata_phys = qcom_scm_mem_to_phys(mdata_buf);
 	memcpy(mdata_buf, metadata, size);

 	ret = qcom_scm_clk_enable();
@@ -578,7 +579,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const
void *metadata, size_t size,
 		qcom_scm_mem_free(mdata_buf);
 	} else if (ctx) {
 		ctx->ptr = mdata_buf;
-		ctx->phys = qcom_scm_mem_to_phys(mdata_buf);
+		ctx->phys = mdata_phys;
 		ctx->size = size;
 	}

Bart

>>  	if (!mdata_buf) {
>>  		dev_err(__scm->dev, "Allocation of metadata buffer failed.\n");
>>  		return -ENOMEM;
>> @@ -574,10 +568,10 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>>
>>  out:
>>  	if (ret < 0 || !ctx) {
>> -		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
>> +		qcom_scm_mem_free(mdata_buf);
>>  	} else if (ctx) {
>>  		ctx->ptr = mdata_buf;
>> -		ctx->phys = mdata_phys;
>> +		ctx->phys = qcom_scm_mem_to_phys(mdata_buf);
>>  		ctx->size = size;
>>  	}
>>
>> @@ -594,7 +588,7 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
>>  	if (!ctx->ptr)
>>  		return;
>>
>> -	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
>> +	qcom_scm_mem_free(ctx->ptr);
>>
>>  	ctx->ptr = NULL;
>>  	ctx->phys = 0;
>> --
>> 2.39.2
>>
>
>
