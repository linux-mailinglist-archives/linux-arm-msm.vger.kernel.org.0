Return-Path: <linux-arm-msm+bounces-74596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E730B9A5D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 16:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE6811727B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 14:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C0430E839;
	Wed, 24 Sep 2025 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fARj2G45"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BAC30E82D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725421; cv=none; b=Aiy4vD6OkYfAAoh8MXmTjpEHYq6QcXkZGd4F92o/BHrhF/gBghVy4BcVFoO9UAW8nhijmvpR1gB1jdOBdMGr0oqCQP4fjgWUnI1YnzEmdcFWTA8FHhOIfaZNM41vbsqJxdaLe5De+AUymQqAhuncbVZs0EQ28oZZsDc2Rq9wFfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725421; c=relaxed/simple;
	bh=2v58a2Ms4SzGlOmfnHzQTJ6OquVF8bjJ7gbAV/oLr/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vrv7QQMTuiBQ3uEjPq6v0Xd8osDUhdAKQItbiZE/lNB1B1gXEdj93nlML0c0IHKbj/fI7KxXy4y0K/b3M4rbP8xtraN3bCn85road6bPhTScxrMi4XNsd2l3HkpJMTBRp1rF35l9SQVoS4pE9W043DjREl5la9Lj8hoOvQHzDrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fARj2G45; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCnlhh017424
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOIwUpILHzWH2xAe7aoOnVRAWvWSgZKyb6P3XpLFlVw=; b=fARj2G45QTES3xF3
	dyIqhnpX2bS71VpsHfUetYxaCogmcz3MfySQjWE/ZAi9vp2NzOgULfu1DxXxGgwS
	hjI7e/YU2z5jQUPfBtxT2fK1wVuzKiAbiKtp2te1u2WaLzxmKJf+uz6YwpOSObr9
	xWJJekuXRUGl4dbyIt8ruaaltWCHbyylgQRTiulrnFxEKnqUZkOMt8/Yum66DVPV
	jlTZs85r4lmEMYVQ+MNtebRtnvztSoKbA/fG6Q60GfnfMYJaPzFufKYU3oK7Tky5
	mfly4svriCqsIxYG6s2i4ZOW7Ehi6zeHNMB4wM2qbuDOKIiyZNmGwA0hfYbIEBJU
	W9XsSg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjx1bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:50:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4c9764f3bc6so5942571cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725412; x=1759330212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOIwUpILHzWH2xAe7aoOnVRAWvWSgZKyb6P3XpLFlVw=;
        b=ZMvvEBXPfhLlj474tSnRBzmM59q3/mnmNH53URt/V91m8uBwrOsdhDwCbiSpOOkY3C
         E2eECOrFKysED5D6PQ9fV4SxgZhwXtQyI/ortqzpWRPmGmhYhY2Wc8A0QXkpaqMSPsFj
         /Oq1LvDvsa+QYRTK5WLfQ2Ri9Y3h669+6rgh9fPtlB6NPOlgLoDy6YKNSrp+lz/vsOhX
         acDNjQyofxYNgGtbMTgGtnxLgUCFaqiXsq6IaZ5+F3TxgycVPRhTApnL2O3YTqi9K3/P
         dHj2ArMZ0I2eRGoscy64EOcM8JHFXDqDdYKeAdsP57IU+W53RZJo8ovOENu5sFw0Xmf/
         CIhA==
X-Gm-Message-State: AOJu0YwQtgs/lC12Vh0lkQUlXyYGPMHvBP7+IOhcJuI3BYB8pio8i3Sj
	JuVWkqYMoj2umdYM23Nq/86icef2qyufj0VqvqAOLYThtbF7N2DAoDxd6t4OZRjrVzORh2XQffa
	YNM+USQ0Pavh0f+iyHFJ4FbEJHgXw+I1jf6bGEKiupTP/ppCfZQRK56wUbQqL5V1WZJzl
X-Gm-Gg: ASbGncudKmEWPd9DmkErPE9mDAFXSkxoQ7Jjlj6T0Fx2SEYIBy7V8hcbbBdrbfyGcPz
	hBSZVYFPOsfbsXUG7LXF/7IYTmERZyQeyRS3bUKntVLC94SzE1qTEBaQLQS3K89OUFimZbf+/2E
	qzE10KLBahRLjzWDO4BNjxE2sr7t06Yaiw+rlkY5CCRN1vQhbdicF/EC8AjlAj54YGkHU9J+jh7
	mJxFubzciWgtUC9zq83tO5YEZf85+zYAxZflb8chYQKiYk1ziYpbISc+P9TdaHbfT0564mTBKuc
	7RwrZzsJwdNBcJ/+CQUH9/yxcK5OeGERm5r8FIG074fD0yOp5uhlacjkSapri7uSXyIERv7nZTr
	YPGzez2daat5RcIJvgkNgXw==
X-Received: by 2002:ac8:5d92:0:b0:4b7:a9cf:91f with SMTP id d75a77b69052e-4da4b0490f1mr104621cf.8.1758725411616;
        Wed, 24 Sep 2025 07:50:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/m7Ig+ntA4VCysUPYjwN26MObXEox0OR1XdnFAJSB9eyhSHSgSZI0IYmixSGdsHwEOjXGBQ==
X-Received: by 2002:ac8:5d92:0:b0:4b7:a9cf:91f with SMTP id d75a77b69052e-4da4b0490f1mr104361cf.8.1758725410925;
        Wed, 24 Sep 2025 07:50:10 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd1102d7asm1582827266b.76.2025.09.24.07.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 07:50:10 -0700 (PDT)
Message-ID: <15c56c70-928a-4939-86a2-e7b81f1596a6@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:50:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: smp2p: Add irqchip state support
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
 <20250923-smp2p-v1-1-2c045af73dac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250923-smp2p-v1-1-2c045af73dac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gziH_7bR0IGoSZOF1KcvL0Ad2LIHZUfN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfXxp0KDf5aGMYQ
 fsp3RfowiYAZRzkA+7sH0AS1+Q64PQ0Etbjlb8pI96faN8niwutKbhgsWIVQS4bT69ML9TpC4Wg
 TxMNt88r+8akfSZH2ydpXJ4rNkHJeAztjib5AonqgQpIltfo/XeqY/I+HcVZdshFJaA5U1mnC6I
 Lr1htihK73sTnGo8Xp1Cc8JjPkoqJp0bJ5QIna9FFDUGZxlwNAcdgVgAccyx5M/Mxduyr4E2hye
 AEgVqL3Qd3bm8Hguty0Zj2CoiGt9T6NaKFKKRAZ6xXBlj+60Ul0drApKHLhgeWC8bEqw/9evbI4
 IYQLqqNMzHHaXglbVg6CvNQqk/6wtqSRFT//B4qRsC/Vm+hj/3XQuaiL4T+AOo9GHxWVvMx/lGM
 LFKBos+e
X-Proofpoint-GUID: gziH_7bR0IGoSZOF1KcvL0Ad2LIHZUfN
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d40525 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Ficpkn55UaSewbb4THMA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On 9/24/25 6:18 AM, Jingyi Wang wrote:
> From: Chris Lew <chris.lew@oss.qualcomm.com>
> 
> A remoteproc booted during earlier boot stages such as UEFI or the
> bootloader, may need to be attached to without restarting the remoteproc
> hardware. To do this the remoteproc will need to check the ready and
> handover states in smp2p without an interrupt notification.
> 
> Add support for the .irq_get_irqchip_state callback so remoteproc can
> read the current state of the fatal, ready and handover bits.
> 
> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index cb515c2340c1..e2cfd9ec8875 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>  	}
>  }
>  
> +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
> +{
> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
> +	unsigned int pid = smp2p->remote_pid;
> +	char buf[SMP2P_MAX_ENTRY_NAME];
> +	struct smp2p_smem_item *in;
> +	struct smp2p_entry *entry;
> +	size_t size;
> +	int i;
> +
> +	in = qcom_smem_get(pid, smem_id, &size);
> +	if (IS_ERR(in))
> +		return;
> +
> +	smp2p->in = in;
> +
> +	/* Check if version is initialized and set to v2 */
> +	if (in->version == 0)
> +		return;

This doesn't seem to be fully in line with the comment

Konrad

