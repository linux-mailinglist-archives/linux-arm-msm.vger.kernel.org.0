Return-Path: <linux-arm-msm+bounces-74898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB7B9D453
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 05:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 141981B2269C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 03:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535261D6194;
	Thu, 25 Sep 2025 03:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl4gbR8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3F31DFCB
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758769506; cv=none; b=X/d04NVj3DmStERxFT1Q8f/E29Qt1+Xrj3wSqvtQocoOeNozxkh5RkfL3ZOcVSr1CdP2qwQHwDAoMzwZ493PONuKfrq3MHhEUy60GFT4sw/HyrkP7E8rJu+71IMI5qirKFGXRgnGej90ZOiinixKLhieFt+j3VtcjVIeie7e0H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758769506; c=relaxed/simple;
	bh=PaLRh/1dlWNnI3yc3VLne5RGHqyR70HkiCBdoMES274=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7tU45ecrqDlLPvUtMQ/1XwT9ye0BaqLTY8wlUxnXnbrthK3tcZZOMPBt+qWV4b7Db88ohqcX6hZSjon0ZwTHf4FYCJEipOF0y+pjp3AEHhAHXQGUjfQuXP+hqg1Sbf1eqabKTSUybghW7PmIXu1CNLr6u65Lcs3T8Nhgvy7yfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zl4gbR8w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1XKcl017430
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XorEutCN1E3JLcc+x3clnoyZ
	eS8b7P4tdxzweAARs6M=; b=Zl4gbR8wuFLEgiy6KunmKP/iC6oPQ1llZ1Uqw9LH
	UT1+aPgeWE5zt5c3Phh3b6S3wpHPQfE6UqTky2GmGSywuXXHUyfbDHy2NMAXjjHL
	clgOTplfwCs/I9X7hIA/hR/j6fBCLjhO7eUoY2oo312yyY/OjfOlzrMeeeZU/Xv3
	uSaMT4HNhp8VZ6u8k8NnkfcfoGQ+4Nw3TrCTU8Q599bAhkeyphEGrs+cMasKjCjO
	fp72T5Q5hO++DVIWiqztV15wVXKmqCbokpbDKCRfoI4x7Oo4TreyRrWcBJgKtaEz
	TSuOfy/LELOhXrGwP86F+dN0XEpFH3mi9ETOd4yjM5kFyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjyv4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:05:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b78fb75a97so5176541cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 20:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758769502; x=1759374302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XorEutCN1E3JLcc+x3clnoyZeS8b7P4tdxzweAARs6M=;
        b=qg6is8NcfICnltMHNXbmfwlvcIXLNKzICCo05U6AlKlyFRlxnBt40OeOEzVk17J5mT
         wNDZV/W34qLZKul7SA3XkVqIYcMYbylkHMG/EkOY+DYCobykt4yyI7UFBIyq/ZdlXD0l
         //CjBWS7ZKe/tu3IVznVgUv2Ob4CqtHTdBwzvMvdwCslJKvF7pqBNh1Ha0M8GOltApXj
         RrAYXZR6ZC1e+Ewnv5WxW9o5FxrWS9l1hYxZGxur4PQwWaGH6KgagtzQDOmpHWwO0INi
         UeQTVDy+8iWiI9hGgbwGMgeoaHDxG3OPlZzeJoPfBVJdf3zBmHHdw1PqGfVfO6SC/Hlv
         Ywjw==
X-Forwarded-Encrypted: i=1; AJvYcCWEsDEhlC09K5tYxDW7C+81WnYK0lFkRfOEyWb0h/ZvDv9sTzKQW6jyjkxDyx+ztJ+vuo3BGAqPVeS0/7j1@vger.kernel.org
X-Gm-Message-State: AOJu0YxgoNO/HUTZ/3MOtHCQ5bFuLQY4YTc8GjVO7eaRtXL49PEASH3U
	pkoHd+zP68L+SP3bWrgvHSfFblPEvEisgGAlSXH8n1UUgEz9tti5uptoWTCuduLCeHfCS+g9s2Z
	mHqhZVvfDgWG0f0ZkzibRPen657diviY7qa2aoBONdYOgDHsDE1OBZSBlQ2OxZMAS8o3O
X-Gm-Gg: ASbGncv6qPMKId7tp0PRCFkKjjfaFgF7yd89aSeYEcy5tF5zu1tYBBCx1HhZmTvS640
	JYZsIcc6FgpDopr8z99IpaX2zkIQ4mvT2R74z7iB2Rq77Wjs+PPbOt/rkAPhCJAIHO/Rf/MbHpB
	sv109SkLLJongFjMHZLVh+WKGk+BizOz43ovUxhFmA7VizLTQTp11vytn1NOw2tFU+KFh2XM0iD
	gsgq9Exzx+/8hLr5HFGg0wkJH2uBRfbQGvVCjleX6aPYBQOPRKJ+9NMEt+aFfrabasz4PUFNsde
	qd2tV1jNnjJTHnII0wtBOn+/keCIeUYwF6NuxPLovfk/fKTQxTbtyJcDgPzpgT1Pmpb2cAbgQ99
	D6PVqi3gTjesKzP4M9U4m8o5Kf4xcppzr6pOLoxUrCJt1a2rfYamx
X-Received: by 2002:a05:622a:448:b0:4b2:ed82:29d5 with SMTP id d75a77b69052e-4da48a962c0mr28521191cf.33.1758769501962;
        Wed, 24 Sep 2025 20:05:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+XA7ILzrtovO7aTLwJrTU8mqUubNlLuItw7AJN0lRNaznJNbuDHEBVMiSQ5sfn9bPhvagoA==
X-Received: by 2002:a05:622a:448:b0:4b2:ed82:29d5 with SMTP id d75a77b69052e-4da48a962c0mr28520801cf.33.1758769501246;
        Wed, 24 Sep 2025 20:05:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb80ddbaesm2275791fa.68.2025.09.24.20.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 20:04:59 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:04:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
Subject: Re: [PATCH 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
Message-ID: <aprekcmyp4ttmjgu6nsvoqlvmazi4vvxmsyydjcdpmnhuvl5uk@dylpjrehmd5w>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-5-611bf7be8329@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-remoteproc-v1-5-611bf7be8329@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YzCJh_mYsmpsXWzUKAylZ9Ymzc7w_ehY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX5jaI9kAN7POg
 TYm2tGE4LUxMudG2f5rit35s1Khv1PAtW+2u1M9g22TsU0EBv7iHgSAtYze3zze0m/CdpdwK53f
 cQ/jhAS1asaRb4nDDmXnTQ3lgXOOEAzsYnQlC4Q8VaBHBh1WRRtfGDnvZ/wOa5MoCh32LNSH43R
 NopEeWa7n8SjSQSQoOrKE3N++odjB87TIaBOzZ7s86+PqabBZVz2tObGHs60TPChncnZSf9LRqS
 aWjkLtszSSF26KQq47BfxchGHiuhfGUm06epbOys/HDcBrhDD2Xm0lg1YQukWOwzCwZ4FC3J8vV
 wvjrVmy7zSvX5GcZ7HHpE+3AT43LRmRZFzOMl/EP4rY+15H8m9U5+lIoSOdxTMcwYIaR7hvVXUI
 gLlyYNtF
X-Proofpoint-GUID: YzCJh_mYsmpsXWzUKAylZ9Ymzc7w_ehY
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4b15f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_gumgasZWO8jnLefRzgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On Wed, Sep 24, 2025 at 04:37:26PM -0700, Jingyi Wang wrote:
> From: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
> 
> Subsystems can be brought out of reset by entities such as
> bootloaders. Before attaching such subsystems, it is important to
> check the state of the subsystem. This patch adds support to attach
> to a subsystem by ensuring that the subsystem is in a sane state by
> reading SMP2P bits and pinging the subsystem.
> 
> Signed-off-by: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c      | 89 ++++++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/qcom_q6v5.h      | 14 +++++-
>  drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c  | 61 ++++++++++++++++++++++++-
>  5 files changed, 163 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 4ee5e67a9f03..cba05e1d6d52 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -94,6 +94,9 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
>  	size_t len;
>  	char *msg;
>  
> +	if (q6v5->early_boot)
> +		complete(&q6v5->subsys_booted);

Where do we clean this flag? I think you current code breaks restarting
of ADSP. Once the ADSP is brought up, the flag should be cleared and
further handling of the ADSP should follow the normal flow.

> +
>  	/* Sometimes the stop triggers a watchdog rather than a stop-ack */
>  	if (!q6v5->running) {
>  		complete(&q6v5->stop_done);
> @@ -118,6 +121,9 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
>  	size_t len;
>  	char *msg;
>  
> +	if (q6v5->early_boot)
> +		complete(&q6v5->subsys_booted);
> +
>  	if (!q6v5->running)
>  		return IRQ_HANDLED;
>  
> @@ -139,6 +145,9 @@ static irqreturn_t q6v5_ready_interrupt(int irq, void *data)
>  
>  	complete(&q6v5->start_done);
>  
> +	if (q6v5->early_boot)
> +		complete(&q6v5->subsys_booted);
> +
>  	return IRQ_HANDLED;
>  }
>  
> @@ -170,6 +179,9 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
>  	if (q6v5->handover)
>  		q6v5->handover(q6v5);
>  
> +	if (q6v5->early_boot)
> +		complete(&q6v5->subsys_booted);
> +
>  	icc_set_bw(q6v5->path, 0, 0);
>  
>  	q6v5->handover_issued = true;
> @@ -232,6 +244,77 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
>  }
>  EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>  
> +static irqreturn_t q6v5_pong_interrupt(int irq, void *data)
> +{
> +	struct qcom_q6v5 *q6v5 = data;
> +
> +	complete(&q6v5->ping_done);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5)
> +{
> +	int ret;
> +	int ping_failed = 0;
> +
> +	reinit_completion(&q6v5->ping_done);
> +
> +	/* Set master kernel Ping bit */
> +	ret = qcom_smem_state_update_bits(q6v5->ping_state,
> +					  BIT(q6v5->ping_bit), BIT(q6v5->ping_bit));
> +	if (ret) {
> +		dev_err(q6v5->dev, "Failed to update ping bits\n");
> +		return ret;
> +	}
> +
> +	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(PING_TIMEOUT));
> +	if (!ret) {
> +		ping_failed = -ETIMEDOUT;
> +		dev_err(q6v5->dev, "Failed to get back pong\n");
> +	}
> +
> +	/* Clear ping bit master kernel */
> +	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
> +	if (ret) {
> +		pr_err("Failed to clear master kernel bits\n");
> +		return ret;
> +	}
> +
> +	if (ping_failed)
> +		return ping_failed;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
> +
> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
> +{
> +	int ret = -ENODEV;
> +
> +	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
> +	if (IS_ERR(q6v5->ping_state)) {
> +		dev_err(&pdev->dev, "failed to acquire smem state %ld\n",
> +			PTR_ERR(q6v5->ping_state));
> +		return ret;
> +	}
> +
> +	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
> +	if (q6v5->pong_irq < 0)
> +		return q6v5->pong_irq;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
> +					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					"q6v5 pong", q6v5);
> +	if (ret)
> +		dev_err(&pdev->dev, "failed to acquire pong IRQ\n");
> +
> +	init_completion(&q6v5->ping_done);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
> +
>  /**
>   * qcom_q6v5_init() - initializer of the q6v5 common struct
>   * @q6v5:	handle to be initialized
> @@ -245,7 +328,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>   */
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  		   struct rproc *rproc, int crash_reason, const char *load_state,
> -		   void (*handover)(struct qcom_q6v5 *q6v5))
> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))
>  {
>  	int ret;
>  
> @@ -253,10 +336,14 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  	q6v5->dev = &pdev->dev;
>  	q6v5->crash_reason = crash_reason;
>  	q6v5->handover = handover;
> +	q6v5->early_boot = early_boot;
>  
>  	init_completion(&q6v5->start_done);
>  	init_completion(&q6v5->stop_done);
>  
> +	if (early_boot)
> +		init_completion(&q6v5->subsys_booted);
> +
>  	q6v5->wdog_irq = platform_get_irq_byname(pdev, "wdog");
>  	if (q6v5->wdog_irq < 0)
>  		return q6v5->wdog_irq;
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 5a859c41896e..8a227bf70d7e 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -12,27 +12,35 @@ struct rproc;
>  struct qcom_smem_state;
>  struct qcom_sysmon;
>  
> +#define PING_TIMEOUT 500 /* in milliseconds */
> +#define PING_TEST_WAIT 500 /* in milliseconds */
> +
>  struct qcom_q6v5 {
>  	struct device *dev;
>  	struct rproc *rproc;
>  
>  	struct qcom_smem_state *state;
> +	struct qcom_smem_state *ping_state;
>  	struct qmp *qmp;
>  
>  	struct icc_path *path;
>  
>  	unsigned stop_bit;
> +	unsigned int ping_bit;
>  
>  	int wdog_irq;
>  	int fatal_irq;
>  	int ready_irq;
>  	int handover_irq;
>  	int stop_irq;
> +	int pong_irq;
>  
>  	bool handover_issued;
>  
>  	struct completion start_done;
>  	struct completion stop_done;
> +	struct completion subsys_booted;
> +	struct completion ping_done;
>  
>  	int crash_reason;
>  
> @@ -40,11 +48,13 @@ struct qcom_q6v5 {
>  
>  	const char *load_state;
>  	void (*handover)(struct qcom_q6v5 *q6v5);
> +
> +	bool early_boot;
>  };
>  
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  		   struct rproc *rproc, int crash_reason, const char *load_state,
> -		   void (*handover)(struct qcom_q6v5 *q6v5));
> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5));
>  void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
>  
>  int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
> @@ -52,5 +62,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
>  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>  unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
>  
>  #endif
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index e98b7e03162c..1576b435b921 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -717,7 +717,7 @@ static int adsp_probe(struct platform_device *pdev)
>  		goto disable_pm;
>  
>  	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
> -			     desc->load_state, qcom_adsp_pil_handover);
> +			     desc->load_state, false, qcom_adsp_pil_handover);
>  	if (ret)
>  		goto disable_pm;
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 0c0199fb0e68..04e577541c8f 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -2156,7 +2156,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	qproc->has_mba_logs = desc->has_mba_logs;
>  
>  	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
> -			     qcom_msa_handover);
> +			     false, qcom_msa_handover);
>  	if (ret)
>  		goto detach_proxy_pds;
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 55a7da801183..99163e48a76a 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -35,6 +35,8 @@
>  
>  #define MAX_ASSIGN_COUNT 3
>  
> +#define EARLY_BOOT_RETRY_INTERVAL_MS 5000
> +
>  struct qcom_pas_data {
>  	int crash_reason_smem;
>  	const char *firmware_name;
> @@ -58,6 +60,7 @@ struct qcom_pas_data {
>  	int region_assign_count;
>  	bool region_assign_shared;
>  	int region_assign_vmid;
> +	bool early_boot;
>  };
>  
>  struct qcom_pas {
> @@ -430,6 +433,51 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>  	return qcom_q6v5_panic(&pas->q6v5);
>  }
>  
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	int ret;
> +	struct qcom_pas *adsp = rproc->priv;
> +	bool ready_state;
> +	bool crash_state;
> +
> +	if (!adsp->q6v5.early_boot)
> +		return -EINVAL;
> +
> +	ret = irq_get_irqchip_state(adsp->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +
> +	if (crash_state) {
> +		dev_err(adsp->dev, "Sub system has crashed before driver probe\n");
> +		adsp->rproc->state = RPROC_CRASHED;
> +		return -EINVAL;
> +	}
> +
> +	ret = irq_get_irqchip_state(adsp->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +
> +	if (ready_state) {
> +		dev_info(adsp->dev, "Sub system has boot-up before driver probe\n");
> +		adsp->rproc->state = RPROC_DETACHED;
> +	} else {
> +		ret = wait_for_completion_timeout(&adsp->q6v5.subsys_booted,
> +						  msecs_to_jiffies(EARLY_BOOT_RETRY_INTERVAL_MS));
> +		if (!ret) {
> +			dev_err(adsp->dev, "Timeout on waiting for subsystem interrupt\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	ret = qcom_q6v5_ping_subsystem(&adsp->q6v5);
> +	if (ret) {
> +		dev_err(adsp->dev, "Failed to ping subsystem, assuming device crashed\n");
> +		rproc->state = RPROC_CRASHED;
> +		return ret;
> +	}
> +
> +	adsp->q6v5.running = true;
> +	return ret;
> +}
> +
>  static const struct rproc_ops qcom_pas_ops = {
>  	.unprepare = qcom_pas_unprepare,
>  	.start = qcom_pas_start,
> @@ -438,6 +486,7 @@ static const struct rproc_ops qcom_pas_ops = {
>  	.parse_fw = qcom_register_dump_segments,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
> +	.attach = qcom_pas_attach,
>  };
>  
>  static const struct rproc_ops qcom_pas_minidump_ops = {
> @@ -760,7 +809,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	pas->proxy_pd_count = ret;
>  
>  	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
> -			     desc->load_state, qcom_pas_handover);
> +			     desc->load_state, desc->early_boot, qcom_pas_handover);
>  	if (ret)
>  		goto detach_proxy_pds;
>  
> @@ -774,6 +823,16 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	}
>  
>  	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
> +
> +	if (pas->q6v5.early_boot) {
> +		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
> +		if (ret)
> +			dev_err(&pdev->dev,
> +				"Unable to find ping/pong bits, falling back to firmware load\n");
> +		else
> +			pas->rproc->state = RPROC_DETACHED;
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

