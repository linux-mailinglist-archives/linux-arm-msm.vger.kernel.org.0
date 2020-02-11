Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 099F0158D18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 11:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgBKK6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 05:58:40 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:19836 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727558AbgBKK6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 05:58:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581418718; h=Content-Type: In-Reply-To: MIME-Version: Date:
 Message-ID: From: References: Cc: To: Subject: Sender;
 bh=GupoSGik5hGepfWFy8dZW1A3kwJZ38d+Crd1//sgpio=; b=pWLKdTh4hu0E/HiV1VLlIIg69L6xTiHoBfcPWXNvqlnWPxXM/8gGe+xIOpNGV4Wj08Dliv4G
 xLRNyaog5VFLzOBDL2cYt+pk41phrmc1p9mZ3htrpqF2ud1wq8YtrulOURDFA+dqD6xfYz7c
 Atj9isZBYMdBbHJj9RFun1wBBPY=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4288dd.7fb1f267cc00-smtp-out-n03;
 Tue, 11 Feb 2020 10:58:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 22439C4479D; Tue, 11 Feb 2020 10:58:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.25.140] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09444C447A6;
        Tue, 11 Feb 2020 10:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 09444C447A6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V1] mmc: mmc_test: Pass different sg lists for
 non-blocking requests
To:     ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Doug Anderson <dianders@google.com>,
        saiprakash.ranjan@codeaurora.org
References: <1581413771-18005-1-git-send-email-vbadigan@codeaurora.org>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <aaf9c135-3160-8903-2b0f-0e2490c25b2b@codeaurora.org>
Date:   Tue, 11 Feb 2020 16:28:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1581413771-18005-1-git-send-email-vbadigan@codeaurora.org>
Content-Type: multipart/mixed;
 boundary="------------E39CC8AF431D684C76CEC115"
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a multi-part message in MIME format.
--------------E39CC8AF431D684C76CEC115
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Attaching the full error log

On 2/11/2020 3:06 PM, Veerabhadrarao Badiganti wrote:
> Supply a separate sg list for each of the request in non-blocking
> IO test cases where two requests will be issued at same time.
>
> Otherwise, sg memory may get unmapped when a request is done while
> same memory is being accessed by controller from the other request,
> and it leads to iommu errors with below call stack:
>
> 	__arm_lpae_unmap+0x2e0/0x478
> 	arm_lpae_unmap+0x54/0x70
> 	arm_smmu_unmap+0x64/0xa4
> 	__iommu_unmap+0xb8/0x1f0
> 	iommu_unmap_fast+0x38/0x48
> 	__iommu_dma_unmap+0x88/0x108
> 	iommu_dma_unmap_sg+0x90/0xa4
> 	sdhci_post_req+0x5c/0x78
> 	mmc_test_start_areq+0x10c/0x120 [mmc_test]
> 	mmc_test_area_io_seq+0x150/0x264 [mmc_test]
> 	mmc_test_rw_multiple+0x174/0x1c0 [mmc_test]
> 	mmc_test_rw_multiple_sg_len+0x44/0x6c [mmc_test]
> 	mmc_test_profile_sglen_wr_nonblock_perf+0x6c/0x94 [mmc_test]
> 	mtf_test_write+0x238/0x3cc [mmc_test]
>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>   drivers/mmc/core/mmc_test.c | 38 ++++++++++++++++++++++++++++++++------
>   1 file changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
> index 492dd45..69bdf60 100644
> --- a/drivers/mmc/core/mmc_test.c
> +++ b/drivers/mmc/core/mmc_test.c
> @@ -71,6 +71,7 @@ struct mmc_test_mem {
>    * @sg_len: length of currently mapped scatterlist @sg
>    * @mem: allocated memory
>    * @sg: scatterlist
> + * @sg_areq: scatterlist for non blocking request
>    */
>   struct mmc_test_area {
>   	unsigned long max_sz;
> @@ -82,6 +83,7 @@ struct mmc_test_area {
>   	unsigned int sg_len;
>   	struct mmc_test_mem *mem;
>   	struct scatterlist *sg;
> +	struct scatterlist *sg_areq;
>   };
>   
>   /**
> @@ -836,7 +838,9 @@ static int mmc_test_start_areq(struct mmc_test_card *test,
>   }
>   
>   static int mmc_test_nonblock_transfer(struct mmc_test_card *test,
> -				      struct scatterlist *sg, unsigned sg_len,
> +				      struct scatterlist *sg,
> +				      struct scatterlist *sg_areq,
> +				      unsigned int sg_len,
>   				      unsigned dev_addr, unsigned blocks,
>   				      unsigned blksz, int write, int count)
>   {
> @@ -867,6 +871,7 @@ static int mmc_test_nonblock_transfer(struct mmc_test_card *test,
>   			prev_mrq = &rq2->mrq;
>   
>   		swap(mrq, prev_mrq);
> +		swap(sg, sg_areq);
>   		dev_addr += blocks;
>   	}
>   
> @@ -1396,7 +1401,7 @@ static int mmc_test_no_highmem(struct mmc_test_card *test)
>    * Map sz bytes so that it can be transferred.
>    */
>   static int mmc_test_area_map(struct mmc_test_card *test, unsigned long sz,
> -			     int max_scatter, int min_sg_len)
> +			     int max_scatter, int min_sg_len, bool nonblock)
>   {
>   	struct mmc_test_area *t = &test->area;
>   	int err;
> @@ -1411,6 +1416,20 @@ static int mmc_test_area_map(struct mmc_test_card *test, unsigned long sz,
>   		err = mmc_test_map_sg(t->mem, sz, t->sg, 1, t->max_segs,
>   				      t->max_seg_sz, &t->sg_len, min_sg_len);
>   	}
> +
> +	if (err || !nonblock)
> +		goto err;
> +
> +	if (max_scatter) {
> +		err = mmc_test_map_sg_max_scatter(t->mem, sz, t->sg_areq,
> +						  t->max_segs, t->max_seg_sz,
> +				       &t->sg_len);
> +	} else {
> +		err = mmc_test_map_sg(t->mem, sz, t->sg_areq, 1, t->max_segs,
> +				      t->max_seg_sz, &t->sg_len, min_sg_len);
> +	}
> +
> +err:
>   	if (err)
>   		pr_info("%s: Failed to map sg list\n",
>   		       mmc_hostname(test->card->host));
> @@ -1458,15 +1477,16 @@ static int mmc_test_area_io_seq(struct mmc_test_card *test, unsigned long sz,
>   			sz = max_tfr;
>   	}
>   
> -	ret = mmc_test_area_map(test, sz, max_scatter, min_sg_len);
> +	ret = mmc_test_area_map(test, sz, max_scatter, min_sg_len, nonblock);
>   	if (ret)
>   		return ret;
>   
>   	if (timed)
>   		ktime_get_ts64(&ts1);
>   	if (nonblock)
> -		ret = mmc_test_nonblock_transfer(test, t->sg, t->sg_len,
> -				 dev_addr, t->blocks, 512, write, count);
> +		ret = mmc_test_nonblock_transfer(test, t->sg, t->sg_areq,
> +				 t->sg_len, dev_addr, t->blocks, 512, write,
> +				 count);
>   	else
>   		for (i = 0; i < count && ret == 0; i++) {
>   			ret = mmc_test_area_transfer(test, dev_addr, write);
> @@ -1584,6 +1604,12 @@ static int mmc_test_area_init(struct mmc_test_card *test, int erase, int fill)
>   		goto out_free;
>   	}
>   
> +	t->sg_areq = kmalloc_array(t->max_segs, sizeof(*t->sg), GFP_KERNEL);
> +	if (!t->sg_areq) {
> +		ret = -ENOMEM;
> +		goto out_free;
> +	}
> +
>   	t->dev_addr = mmc_test_capacity(test->card) / 2;
>   	t->dev_addr -= t->dev_addr % (t->max_sz >> 9);
>   
> @@ -2468,7 +2494,7 @@ static int __mmc_test_cmds_during_tfr(struct mmc_test_card *test,
>   	if (!(test->card->host->caps & MMC_CAP_CMD_DURING_TFR))
>   		return RESULT_UNSUP_HOST;
>   
> -	ret = mmc_test_area_map(test, sz, 0, 0);
> +	ret = mmc_test_area_map(test, sz, 0, 0, use_areq);
>   	if (ret)
>   		return ret;
>   

--------------E39CC8AF431D684C76CEC115
Content-Type: text/plain; charset=UTF-8;
 name="mmc_test_areq_iommu_error.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="mmc_test_areq_iommu_error.txt"

WyAgIDU3LjMxNDUzOV0gbW1jMTogVGVzdCBjYXNlIDQyLiBXcml0ZSBwZXJmb3JtYW5jZSBu
b24tYmxvY2tpbmcgcmVxIDEgdG8gNTEyIHNnIGVsZW1zLi4uDQpbICAgNTcuMzQzMzQwXSBh
cm0tc21tdSAxNTAwMDAwMC5pb21tdTogVW5oYW5kbGVkIGNvbnRleHQgZmF1bHQ6IGZzcj0w
eDQwMiwgaW92YT0weGZmZmUwMDYwMCwgZnN5bnI9MHg3ZDAwMDMsIGNiZnJzeW5yYT0weDgw
LCBjYj0yDQpbICAgNTcuMzU1MjcwXSBtbWMxOiBBRE1BIGVycm9yOiAweDAyMDAwMDAwDQpb
ICAgNTcuMzU5MzM5XSBtbWMxOiBzZGhjaTogPT09PT09PT09PT09IFNESENJIFJFR0lTVEVS
IERVTVAgPT09PT09PT09PT0NClsgICA1Ny4zNjU5OTBdIG1tYzE6IHNkaGNpOiBTeXMgYWRk
cjogIDB4MDAwMDAwMDggfCBWZXJzaW9uOiAgMHgwMDAwNzIwMg0KWyAgIDU3LjM3MjYyOF0g
bW1jMTogc2RoY2k6IEJsayBzaXplOiAgMHgwMDAwMDIwMCB8IEJsayBjbnQ6ICAweDAwMDAw
MjgwDQpbICAgNTcuMzc5MjY4XSBtbWMxOiBzZGhjaTogQXJndW1lbnQ6ICAweDAzYjgwNDAw
IHwgVHJuIG1vZGU6IDB4MDAwMDAwMjMNClsgICA1Ny4zODU5MDRdIG1tYzE6IHNkaGNpOiBQ
cmVzZW50OiAgIDB4MDNmODAxZjYgfCBIb3N0IGN0bDogMHgwMDAwMDAxZg0KWyAgIDU3LjM5
MjU1MV0gbW1jMTogc2RoY2k6IFBvd2VyOiAgICAgMHgwMDAwMDAwMSB8IEJsayBnYXA6ICAw
eDAwMDAwMDAwDQpbICAgNTcuMzk5MTk4XSBtbWMxOiBzZGhjaTogV2FrZS11cDogICAweDAw
MDAwMDAwIHwgQ2xvY2s6ICAgIDB4MDAwMDAwMDcNClsgICA1Ny40MDU4NDldIG1tYzE6IHNk
aGNpOiBUaW1lb3V0OiAgIDB4MDAwMDAwMGUgfCBJbnQgc3RhdDogMHgwMDAwMDAwMA0KWyAg
IDU3LjQxMjUwMV0gbW1jMTogc2RoY2k6IEludCBlbmFiOiAgMHgwM2ZmMTAwYiB8IFNpZyBl
bmFiOiAweDAzZmYxMDBiDQpbICAgNTcuNDE5MTU0XSBtbWMxOiBzZGhjaTogQUNtZCBzdGF0
OiAweDAwMDAwMDAwIHwgU2xvdCBpbnQ6IDB4MDAwMDAwMDANClsgICA1Ny40MjU4MDFdIG1t
YzE6IHNkaGNpOiBDYXBzOiAgICAgIDB4MzIyZDMyYjIgfCBDYXBzXzE6ICAgMHgwMDAwODA4
Zg0KWyAgIDU3LjQzMjQ2M10gbW1jMTogc2RoY2k6IENtZDogICAgICAgMHgwMDAwMTkzYSB8
IE1heCBjdXJyOiAweDAwMDAwMDAwDQpbICAgNTcuNDM5MTE5XSBtbWMxOiBzZGhjaTogUmVz
cFswXTogICAweDAwMDAwOTAwIHwgUmVzcFsxXTogIDB4MDAwMDAwMDANClsgICA1Ny40NDU3
NjZdIG1tYzE6IHNkaGNpOiBSZXNwWzJdOiAgIDB4MDAwMDAwMDAgfCBSZXNwWzNdOiAgMHgw
MDAwMDkwMA0KWyAgIDU3LjQ1MjQyNl0gbW1jMTogc2RoY2k6IEhvc3QgY3RsMjogMHgwMDAw
MDAwYg0KWyAgIDU3LjQ1NzA1MF0gbW1jMTogc2RoY2k6IEFETUEgRXJyOiAgMHgwMDAwMDAw
MSB8IEFETUEgUHRyOiAweDAwMDAwMDBmZmZmZmYyNDgNClsgICA1Ny40NjQ0MjNdIG1tYzE6
IHNkaGNpOiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
WyAgIDU3LjQ3MTEwMV0gbW1jMTogc2RoY2k6IGZmZmZmZjIwMDogRE1BIDB4MDAwMDAwMGZm
ZmUwMDAwMCwgTEVOIDB4MDAwMCwgQXR0cj0weDIxDQpbICAgNTcuNDc4ODUzXSBtbWMxOiBz
ZGhjaTogZmZmZmZmMjBjOiBETUEgMHgwMDAwMDAwZmZmZTEwMDAwLCBMRU4gMHgwMDAwLCBB
dHRyPTB4MjENClsgICA1Ny40ODY1OTZdIG1tYzE6IHNkaGNpOiBmZmZmZmYyMTg6IERNQSAw
eDAwMDAwMDBmZmZlMjAwMDAsIExFTiAweDAwMDAsIEF0dHI9MHgyMQ0KWyAgIDU3LjQ5NDMz
OV0gbW1jMTogc2RoY2k6IGZmZmZmZjIyNDogRE1BIDB4MDAwMDAwMGZmZmUzMDAwMCwgTEVO
IDB4MDAwMCwgQXR0cj0weDIxDQpbICAgNTcuNTAyMDgyXSBtbWMxOiBzZGhjaTogZmZmZmZm
MjMwOiBETUEgMHgwMDAwMDAwZmZmZTQwMDAwLCBMRU4gMHgwMDAwLCBBdHRyPTB4MjENClsg
ICA1Ny41MDk4MjldIG1tYzE6IHNkaGNpOiBmZmZmZmYyM2M6IERNQSAweDAwMDAwMDBmZmZl
NTAwMDAsIExFTiAweDAwMDAsIEF0dHI9MHgyMQ0KWyAgIDU3LjUxNzU3M10gbW1jMTogc2Ro
Y2k6IGZmZmZmZjI0ODogRE1BIDB4MDAwMDAwMGZmZmU2MDAwMCwgTEVOIDB4MDAwMCwgQXR0
cj0weDIxDQpbICAgNTcuNTI1MzE0XSBtbWMxOiBzZGhjaTogZmZmZmZmMjU0OiBETUEgMHgw
MDAwMDAwZmZmZTcwMDAwLCBMRU4gMHgwMDAwLCBBdHRyPTB4MjENClsgICA1Ny41MzMwNjFd
IG1tYzE6IHNkaGNpOiBmZmZmZmYyNjA6IERNQSAweDAwMDAwMDAwMDAwMDAwMDAsIExFTiAw
eDAwMDAsIEF0dHI9MHgwMw0KPHNuaXA+Li4uDQpbICAgNTcuNjA3NzYxXSBIYXJkd2FyZSBu
YW1lOiBRdWFsY29tbSBUZWNobm9sb2dpZXMsIEluYy4gU0M3MTgwIElEUCAoRFQpDQpbICAg
NTcuNjE0NDkwXSBwc3RhdGU6IDgwNDAwMDA5IChOemN2IGRhaWYgK1BBTiAtVUFPKQ0KWyAg
IDU3LjYxOTQzOF0gcGMgOiBfX2FybV9scGFlX3VubWFwKzB4NDcwLzB4NDc4DQpbICAgNTcu
NjIzOTM3XSBsciA6IF9fYXJtX2xwYWVfdW5tYXArMHgyZTAvMHg0NzgNClsgICA1Ny42Mjg0
MjldIHNwIDogZmZmZmZmYzAxNGI0YjcxMA0KWyAgIDU3LjYzMTg2Ml0geDI5OiBmZmZmZmZj
MDE0YjRiNzQwIHgyODogZmZmZmZmYzAxNGI0YjljMA0KWyAgIDU3LjYzNzMzOV0geDI3OiAw
MDAwMDAwZmZmZTAwMDAwIHgyNjogZmZmZmZmODE3M2Y3MzAwMA0KWyAgIDU3LjY0MjgxOF0g
eDI1OiBmZmZmZmZjMDEwZTE4NGRiIHgyNDogMDAwMDAwMDAwMDAwMDAwMw0KWyAgIDU3LjY0
ODI5N10geDIzOiAwMDAwMDAwMDAwMDAwMDAwIHgyMjogMDAwMDAwMDAwMDAwMDAwMA0KWyAg
IDU3LjY1Mzc3M10geDIxOiAwMDAwMDAwZmZmZTAwMDAwIHgyMDogZmZmZmZmODE3NDE2MjQw
MA0KWyAgIDU3LjY1OTI0OF0geDE5OiAwMDAwMDAwMDAwMDAwMDAwIHgxODogMDAwMDAwMDAw
MDEyYWE0NA0KWyAgIDU3LjY2NDcyNV0geDE3OiAwMDAwMDAwMDAwMDAwMDIwIHgxNjogMDAw
MDAwMDAwMDAwMDAwMQ0KWyAgIDU3LjY3MDIwNl0geDE1OiAwMDAwMDAwMDAwMDAwMDEwIHgx
NDogMDAwMDAwMDAwMDAwMDAxMA0KWyAgIDU3LjY3NTY4NV0geDEzOiAwMDAwMDAwMDAwMDAw
MDNmIHgxMjogMDAwMDAwMDBmZmZmZmZmZg0KWyAgIDU3LjY4MTE2OF0geDExOiAwMDAwMDAw
MDAwMDAwMWZmIHgxMDogMDAwMDAwMDAwMDAwMDAwMA0KWyAgIDU3LjY4NjY0OV0geDkgOiAw
MDAwMDAwMDAwMDAwMDA5IHg4IDogMDAwMDAwMDAwMDAwMDAwYw0KWyAgIDU3LjY5MjEyMl0g
eDcgOiAwMDAwMDAwMDAwMDAwMDAwIHg2IDogMDAwMDAwMDAwMDAwMDAzZg0KWyAgIDU3LjY5
NzYxM10geDUgOiBmZmZmZmY4MTczZjczMDAwIHg0IDogMDAwMDAwMDAwMDAwMDAwMw0KWyAg
IDU3LjcwMzEwMF0geDMgOiAwMDAwMDAwMDAwMDAxMDAwIHgyIDogMDAwMDAwMGZmZmUwMDAw
MA0KWyAgIDU3LjcwODU4MV0geDEgOiBmZmZmZmZjMDE0YjRiOWMwIHgwIDogZmZmZmZmODE3
NDE2MjQwMA0KWyAgIDU3LjcxNDA2N10gQ2FsbCB0cmFjZToNClsgICA1Ny43MTY2MjBdICBf
X2FybV9scGFlX3VubWFwKzB4NDcwLzB4NDc4DQpbICAgNTcuNzIwNzcwXSAgX19hcm1fbHBh
ZV91bm1hcCsweDJlMC8weDQ3OA0KWyAgIDU3LjcyNDkxNl0gIF9fYXJtX2xwYWVfdW5tYXAr
MHgyZTAvMHg0NzgNClsgICA1Ny43MjkwNTldICBhcm1fbHBhZV91bm1hcCsweDU0LzB4NzAN
ClsgICA1Ny43MzI4NTddICBhcm1fc21tdV91bm1hcCsweDY0LzB4YTQNClsgICA1Ny43MzY2
NThdICBfX2lvbW11X3VubWFwKzB4YjgvMHgxZjANClsgICA1Ny43NDA0NDddICBpb21tdV91
bm1hcF9mYXN0KzB4MzgvMHg0OA0KWyAgIDU3Ljc0NDQxM10gIF9faW9tbXVfZG1hX3VubWFw
KzB4ODgvMHgxMDgNClsgICA1Ny43NDg1NjZdICBpb21tdV9kbWFfdW5tYXBfc2crMHg5MC8w
eGE0DQpbICAgNTcuNzUyNzMyXSAgc2RoY2lfcG9zdF9yZXErMHg1Yy8weDc4DQpbICAgNTcu
NzU2NTk4XSAgbW1jX3Rlc3Rfc3RhcnRfYXJlcSsweDEwYy8weDEyMCBbbW1jX3Rlc3RdDQpb
ICAgNTcuNzYxOTg5XSAgbW1jX3Rlc3RfYXJlYV9pb19zZXErMHgxNTAvMHgyNjQgW21tY190
ZXN0XQ0KWyAgIDU3Ljc2NzQ4NF0gIG1tY190ZXN0X3J3X211bHRpcGxlKzB4MTc0LzB4MWMw
IFttbWNfdGVzdF0NClsgICA1Ny43NzI5NzZdICBtbWNfdGVzdF9yd19tdWx0aXBsZV9zZ19s
ZW4rMHg0NC8weDZjIFttbWNfdGVzdF0NClsgICA1Ny43Nzg5MTNdICBtbWNfdGVzdF9wcm9m
aWxlX3NnbGVuX3dyX25vbmJsb2NrX3BlcmYrMHg2Yy8weDk0IFttbWNfdGVzdF0NClsgICA1
Ny43ODU5MjNdICBtdGZfdGVzdF93cml0ZSsweDIzOC8weDNjYyBbbW1jX3Rlc3RdDQpbICAg
NTcuNzkwODk5XSAgZnVsbF9wcm94eV93cml0ZSsweDZjLzB4YTgNClsgICA1Ny43OTQ4ODBd
ICBfX3Zmc193cml0ZSsweDU0LzB4MThjDQpbICAgNTcuNzk4NDk2XSAgdmZzX3dyaXRlKzB4
ZTQvMHgxYTQNClsgICA1Ny44MDE5MzRdICBrc3lzX3dyaXRlKzB4N2MvMHhlNA0KWyAgIDU3
LjgwNTM3Ml0gIF9fYXJtNjRfc3lzX3dyaXRlKzB4MjAvMHgyYw0KWyAgIDU3LjgwOTQ1Ml0g
IGVsMF9zdmNfY29tbW9uKzB4YTQvMHgxNTQNClsgICA1Ny44MTMzMjldICBlbDBfc3ZjX2Nv
bXBhdF9oYW5kbGVyKzB4MmMvMHgzOA0KWyAgIDU3LjgxNzg0NV0gIGVsMF9zdmNfY29tcGF0
KzB4OC8weDEwIA==
--------------E39CC8AF431D684C76CEC115--
