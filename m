Return-Path: <linux-arm-msm+bounces-22328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 285D29040D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 18:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B3311F22280
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 16:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439BD39FD0;
	Tue, 11 Jun 2024 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mCNKSnt2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87002383B2;
	Tue, 11 Jun 2024 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718122007; cv=none; b=tW11jfZdI49vSdx6krd2zl51AQ6mnCb1WMyAmx3+8q/xbL6V/mwokunTth4ldmtbsj7c1xl76rfKqFrazK0hqrhy/laCieacfQ+UwvCdmH+0XxJaZNKeH0G1UegcmVuqZtefPH6QkWAlZT3K2In6Lw9C0StvB9zSADPS86ilMUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718122007; c=relaxed/simple;
	bh=ScPhGOCO3bV0NanOK0AuSPnSG3scE/Ty0BObPsnla4Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g++Q1+NLeRJlpPapMy6FFyw2HImEEuq1Ih5dUlrH27eaXlz2EZlR0XBTFGfa+ybY6oBkCistMpqsFc9GlpyTngKODXgoY6RsOkcTFPImW6Y5gsbH+WFa00kIht90NQ+sEc4UyZb5Gh1U2uTFKO3HnKPtA0/njiEL7dgIyZOuM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mCNKSnt2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BF2Uaa006245;
	Tue, 11 Jun 2024 16:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vB9b8QKV3SVGrr7bVXaqXKJ2
	pGDDkhNCdZ1weSNZecg=; b=mCNKSnt2TFzL55c2N8JLz6ygtLTFTmGfeRDjsgA1
	gNx2cakRa4HVjVmgq0zmvh7jg0lX4MDyeIx6bfQxJC7Osgc1RU0w3aqlzL/zI9Fe
	l66A8gOuptaisXuEGKHVFQTWwEFA/wd2VMhBpHRPzDeypnmqM1HWuyY1mcqEeEEv
	rg/O9vXgKNrQtYlVD0aCFbw00ipdUbM3UdLM4E0UxX0yXnX8AJP8SmeqUe3gqtgb
	ud2TFJ9Mj4IUbStIGkao6jZbwunyUN2U6sRukYiopV9FGw/AxkjpFbhCKmn/J6wH
	XTQmZtyRkJIt13a+kf3w9UDSJy97PuqEPeHlL8Oq3FfNFQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymcnmxt9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 16:06:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BG6bu5021825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 16:06:37 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 09:06:37 -0700
Date: Tue, 11 Jun 2024 09:06:35 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
CC: <andersson@kernel.org>, <quic_clew@quicinc.com>,
        <mathieu.poirier@linaro.org>, <linux-kernel@vger.kernel.org>,
        <quic_deesin@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH V2 1/2] soc: qcom: smp2p: Add remote name into smp2p irq
 devname
Message-ID: <Zmh2CzGpJrmzs+6K@hu-bjorande-lv.qualcomm.com>
References: <20240611123351.3813190-1-quic_sudeepgo@quicinc.com>
 <20240611123351.3813190-2-quic_sudeepgo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240611123351.3813190-2-quic_sudeepgo@quicinc.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mawu2I00unrM5ytr6-6jesIUueA_YenB
X-Proofpoint-ORIG-GUID: mawu2I00unrM5ytr6-6jesIUueA_YenB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_09,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1011 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110115

On Tue, Jun 11, 2024 at 06:03:50PM +0530, Sudeepgoud Patil wrote:
> Add smp2p irq devname which fetches remote name from respective
> smp2p dtsi node, which makes the wakeup source distinguishable
> in irq wakeup prints.
> 
> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> ---
>  drivers/soc/qcom/smp2p.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index a21241cbeec7..a77fee048b38 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -122,6 +122,7 @@ struct smp2p_entry {
>   * @ssr_ack_enabled: SMP2P_FEATURE_SSR_ACK feature is supported and was enabled
>   * @ssr_ack: current cached state of the local ack bit
>   * @negotiation_done: whether negotiating finished
> + * @irq_devname: poniter to the smp2p irq devname
>   * @local_pid:	processor id of the inbound edge
>   * @remote_pid:	processor id of the outbound edge
>   * @ipc_regmap:	regmap for the outbound ipc
> @@ -146,6 +147,7 @@ struct qcom_smp2p {
>  	bool ssr_ack;
>  	bool negotiation_done;
>  
> +	char *irq_devname;
>  	unsigned local_pid;
>  	unsigned remote_pid;
>  
> @@ -614,10 +616,16 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>  	/* Kick the outgoing edge after allocating entries */
>  	qcom_smp2p_kick(smp2p);
>  
> +	smp2p->irq_devname = kasprintf(GFP_KERNEL, "%s", pdev->dev.of_node->name);

That's a lot of extra instructions for copying a string, which doesn't
need to be copied because of_node->name is const char and the argument
to devm_request_threaded_irq() is const char.

So, kstrdup_const() is what you're looking for.

You can then go devm_kstrdup_const() and avoid the kfree() (then
kfree_const()) below.


That said, looking at /proc/interrupts, I think it would make sense to
make this devm_kasprintf(..., "smp2p-%s", name);

Regards,
Bjorn

> +	if (!smp2p->irq_devname) {
> +		ret = -ENOMEM;
> +		goto unwind_interfaces;
> +	}
> +
>  	ret = devm_request_threaded_irq(&pdev->dev, irq,
>  					NULL, qcom_smp2p_intr,
>  					IRQF_ONESHOT,
> -					"smp2p", (void *)smp2p);
> +					smp2p->irq_devname, (void *)smp2p);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to request interrupt\n");
>  		goto unwind_interfaces;
> @@ -650,6 +658,8 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>  	list_for_each_entry(entry, &smp2p->outbound, node)
>  		qcom_smem_state_unregister(entry->state);
>  
> +	kfree(smp2p->irq_devname);
> +
>  	smp2p->out->valid_entries = 0;
>  
>  release_mbox:
> @@ -677,6 +687,8 @@ static void qcom_smp2p_remove(struct platform_device *pdev)
>  
>  	mbox_free_channel(smp2p->mbox_chan);
>  
> +	kfree(smp2p->irq_devname);
> +
>  	smp2p->out->valid_entries = 0;
>  }
>  
> -- 
> 

