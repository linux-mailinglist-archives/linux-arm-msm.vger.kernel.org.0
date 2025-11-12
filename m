Return-Path: <linux-arm-msm+bounces-81401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D55EC52123
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 12:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 90D954F3A1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BE7312830;
	Wed, 12 Nov 2025 11:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XDHa+e9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hijW3UH2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3C62F39D4
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762947602; cv=none; b=vFVkkpCuSecLAbTXiFBYORpXadIbKFyWkesucx/4yRoCllGTk4+Lxwe+/H9UBj5/7XKgh0FfqER20jQztNcT2l+kHLp9Ntty8kJJNDJfopKm7/eBR6WcAbdp3yPbgqFwrrnAB9OtA6LUED+yiOdA5AWJ41xhRNZ5RQEswSOEG9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762947602; c=relaxed/simple;
	bh=3L85/oMCuqF+/EzJXAM9zXSxt4N4q9E5oV1hw6Vg3pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJ2GG76t9VEKRaJzm/LjKeMuulRabYBjzwM9mY7O6SHDBnhdvwbBf2KUGuQFwapvm0/jyLk1OVRzYD7Se+Wlga4KCD0jxSPmoaYBtU8xgd4zlFQ3XrCpy/g9hlYYuiGqgCNVxH85vafVSyLqnh8mFlPY95uyJa3WvomkHI/8nvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDHa+e9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hijW3UH2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC6SubC350404
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NSRf1wg9ZQmnz06DND1B4gmBm+AKQ6Xrvu5UXUezxQ=; b=XDHa+e9WF6h9NdrY
	641e7zF1UCiDTSJRhxXGY3MFmb0NdOhRiiumYra/EMGOmLcGcUKeZA40BOuYNUJ6
	CYJCTmGRmOYOaDU6tay6ALwahM1s5WoToyhmCk9w0vRNeVFBBCoLD4M8B8hPKTDJ
	CEUOtWPkkhvKJX6teMh0njmm0nMhZ9AblM0yRwsOfdWN+BGxBJWsdfSKCrsmNeyd
	gaxNYg8HRLXLLV76R4fOZ5dPR8JtXKT4rExyhk0lfSpA1e7FUaqWcZ/vWhc3Sg/p
	6zIA9N/Rv1Apb166hj/GwHp394a/wEEy21QJxN+kimfC07og5MG6Um7pkHNbAIEL
	3GlqIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acn0ns1rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:39:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1be0fdfe1so34032285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762947599; x=1763552399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/NSRf1wg9ZQmnz06DND1B4gmBm+AKQ6Xrvu5UXUezxQ=;
        b=hijW3UH21MqOB4hYXmokqo0gIF9DEYIDIT0KqIY/rcSH4z0w12wlB/pnz6N2ohfdlq
         2PAY2p/czOg1OoBqmP83E2ITpoYPPFCVnLzPF0DGV7/m424lLIKT/8awOs7b1/oV+IPs
         tlnI2X36FdHI3xD+uSUxT7g0b6LObBerYizBQnKVIBQuediycUD2lOcnG15owi4bLSjJ
         BoBkt/Bnt3sYjP1w0FGyQke9d2ir1SM0DBP3XgQQexW0trUg7UEHiqqEW4OvGCLl+IWn
         GhcyDZZazPJkVDlAEczEX2vcx9ueZbG/Bki3mLHosIKixQmKgmf4IuR2+DspIwF667a7
         THYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762947599; x=1763552399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NSRf1wg9ZQmnz06DND1B4gmBm+AKQ6Xrvu5UXUezxQ=;
        b=JjBW5WICxn7kH/t9kEhQjx8Pjjlz4+Kai61VTKyWbVmkBtKgKdBilgJKTm8HD91RMk
         9C/Jbhnj12Z7S9+p/9svIvLrEGrfOPf2k7HUdCUP1V3cVDJxS2clS1BPIimbmdsG/zr/
         mJKB82WvtJeD4LGBudQ/XDgtQuhqCvfOKIlvIVls9WQ0c2WvvdJxlJYH+0vGpzfLGkE0
         OuNn1JgX7CzMs5//7NOyMojxcBRfE2LlorEOxAGi6fn3aGxd2px6P/xqWqDN8c2LXuA5
         trlzs0xoLf4J6gf57CNFCobBTiAnK6nor5KOC3y6GJK1qliv7rTGjvunAC+F2HM5hIdQ
         7omg==
X-Gm-Message-State: AOJu0YyQYgCUeevagxTF2CNI2hEYn7XF9YXOvni1CRS4nXb5PTc6dhvr
	suhMHpCfvQ1daXoITpAFG1kEXpFv7FJ3+WywNb9PsFHbi5Cw3oo5X1W/jyEzonF8bzAHbhIY6F4
	W68k96G6EyRKykzs+ZHZy2VS8YYQDK5bRUNrpNU4CYKF1wCye5+vzuZ7BCZ6c7iu2B09R
X-Gm-Gg: ASbGncsm/96xmVsBfxhiWqBoIVYePa28swOZ90I1c25GSR6T/lXMiIAfvPbVav7gJxp
	B6ygWGX2nhXqqyhlZi73Dtu69myH1nRAspXx//A7j9byENQZSYLCSiur7fwDLfAz1SHspHnAmZK
	VL9DMkB+Xy3bqB5KoZ34nr8X3oDvD7xI8ydH1esxrc8eEF2yklDvsbU2ojmTUNVU3PoHxzjZ23m
	7h929aT7Sv/hrlM/pnjsm5+f0TSr+GNzodPg6I/sA/jj62pYYZYkL4j2KJeGGVyTjXqyKuk8IBs
	Rvs3lBWUlQF81RnOradSq+IlXzVebQN0LytkIWGkMh1eogubaN7PNvA39JtCutWXeJ71M3IJJG3
	ZflbzYxHFmkU1kXmKVY28VPCU6JAdrBf7f7H3V6PhXN5HYjkc4gZ25hPC
X-Received: by 2002:ac8:4817:0:b0:4ed:e2dc:dae2 with SMTP id d75a77b69052e-4ede2dceaf3mr3509931cf.0.1762947598564;
        Wed, 12 Nov 2025 03:39:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmVPhiEZGgXJznil6s2OoOPh+wSp2Lp3eALqOk8bHwKQeRv7sm+9a2avLNsIZD5Y5ZW7eULg==
X-Received: by 2002:ac8:4817:0:b0:4ed:e2dc:dae2 with SMTP id d75a77b69052e-4ede2dceaf3mr3509811cf.0.1762947598035;
        Wed, 12 Nov 2025 03:39:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72fcde0779sm930551066b.40.2025.11.12.03.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 03:39:57 -0800 (PST)
Message-ID: <31c391c7-3e44-43ec-82da-2c612cb5b087@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 12:39:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] interconnect: qcom: implement get_bw with
 rpmh_read
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251106-topic-sm8x50-icc-read-rpmh-v1-1-d03a2e5ca5f7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106-topic-sm8x50-icc-read-rpmh-v1-1-d03a2e5ca5f7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Zr2hUGV0l75dFDZfavN3o329L_6CA9qw
X-Proofpoint-ORIG-GUID: Zr2hUGV0l75dFDZfavN3o329L_6CA9qw
X-Authority-Analysis: v=2.4 cv=acRsXBot c=1 sm=1 tr=0 ts=6914720f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=EylLml8pCTcjifbIhvwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA5MyBTYWx0ZWRfXwashLwYWiNcG
 kRbyT74MAdNeNjz+7TZD074aEvmz9aeAxtfq840tiy3BVWaoROBi1Alsq2KvYjW6BRPXSxj6rBr
 f7QOdfZ3mV0NZNixPLy40d9jQG0XPKI4bo62mNaDgJ+O1J4jnUDSFE/EkCXa92Rr8xP8ZjfHK1O
 9zotVkRbVjiLQpEFKD6bFGNJ/uLTijRZ4gXZ1tUHyqjduZ1uoHiTsm1bGvEz+fF6ku7Wp7Gp2jH
 HKpUlJ7EEFdHaIVlUUtLY4CFNAeMr+mfllvec/7VrWxLkTdH1uSeB10bhHSvuIgj9Nw8/wemUxh
 fu8o3KM57rTaf0/xVxzaUlu/Ej8+FRsEk7FGCp5/jUQSrFU2Isb6dVUiB8yXah4X6OyQCzSbNTu
 7SEwZz8qMoZ4NYJEL6YgTKh+bkTOaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120093

On 11/6/25 5:46 PM, Neil Armstrong wrote:
> Since we can actually read back the APPS rpmh interconnect
> BCM votes we can actually implement the get_bw() callback
> and provide a coherent average and peak bandwidth at probe time.
> 
> The benefits of that are:
> - keep disabled BCMs disabled
> - avoid voting unused BCMs to INT_MAX
> 
> If the interconnects are correctly described for a platform,
> all the required BCMs would be voted to the maximum bandwidth
> until sync_state is reached.
> 
> Since we only get the BCM vote, we need to redistribute
> the vote values to the associated nodes. The initial BCM
> votes are read back at probe time in order to be ready when
> the get_bw() is called when a node is added.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Depends on:
> https://lore.kernel.org/all/20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com/
> ---
>  drivers/interconnect/qcom/bcm-voter.c | 36 +++++++++++++++++++++
>  drivers/interconnect/qcom/bcm-voter.h |  2 ++
>  drivers/interconnect/qcom/icc-rpmh.c  | 60 ++++++++++++++++++++++++++++++++++-
>  3 files changed, 97 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
> index a2d437a05a11..9014bf20adad 100644
> --- a/drivers/interconnect/qcom/bcm-voter.c
> +++ b/drivers/interconnect/qcom/bcm-voter.c
> @@ -261,6 +261,42 @@ void qcom_icc_bcm_voter_add(struct bcm_voter *voter, struct qcom_icc_bcm *bcm)
>  }
>  EXPORT_SYMBOL_GPL(qcom_icc_bcm_voter_add);
>  
> +/**
> + * qcom_icc_bcm_get_bw - get current bcm vote
> + * @voter: voter used to query bcm
> + * @bcm: bcm to get current vote from
> + */
> +void qcom_icc_bcm_get_bw(struct bcm_voter *voter,
> +			 struct qcom_icc_bcm *bcm)
> +{
> +	struct tcs_cmd cmd = { .addr = bcm->addr };
> +	int ret, i;
> +	u64 x, y;
> +
> +	mutex_lock(&voter->lock);

guard(mutex)(&voter->lock) will let you drop the goto

> +
> +	rpmh_invalidate(voter->dev);
> +
> +	ret = rpmh_read(voter->dev, &cmd);
> +	if (ret) {
> +		pr_err("Error sending AMC RPMH requests (%d)\n", ret);
> +		goto out;
> +	}
> +
> +	x = FIELD_GET(BCM_TCS_CMD_VOTE_X_MASK, cmd.data);
> +	y = FIELD_GET(BCM_TCS_CMD_VOTE_Y_MASK, cmd.data);
> +
> +	/* For boot-up, fill the AMC vote in all buckets */

This isn't a good idea, I think we should be able to get information
from all buckets separately. I asked on the thread that introduced this
API. I'm assuming it was hardcoded to ACTIVE_ONLY because of its use
with the current state of the upstream regulator driver

> +static int qcom_icc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
> +{
> +	struct qcom_icc_node *qn = node->data;
> +	u32 avg_max = 0;
> +	u32 peak_max = 0;
> +	u64 x, y;
> +	int i;
> +
> +	if (!qn->num_bcms) {
> +		*avg = INT_MAX;
> +		*peak = INT_MAX;

Since this function returns an int, maybe you could alter the core to
check for an error and if -EOPNOTSUPP, fall back to these values (as
it does currently if !provider->get_bw)
> +
> +		return 0;
> +	}
> +
> +	for (i = 0; i < qn->num_bcms; ++i) {

odd pre-increment

> +		struct qcom_icc_bcm *bcm = qn->bcms[i];
> +
> +		/* Use AMC vote for boot-up */
> +		x = bcm->vote_x[QCOM_ICC_BUCKET_AMC];
> +		y = bcm->vote_y[QCOM_ICC_BUCKET_AMC];
> +
> +		/* Consider enable mask and convert to INT_MAX */
> +		if (bcm->enable_mask) {
> +			if (x & bcm->enable_mask)
> +				avg_max = INT_MAX;
> +			if (y & bcm->enable_mask)
> +				peak_max = INT_MAX;
> +		} else {
> +			if (x) {
> +				x *= bcm->aux_data.unit;
> +				do_div(x, bcm->vote_scale);
> +				x *= qn->buswidth * qn->channels;
> +				do_div(x, bcm->aux_data.width);

mult_frac()

Konrad

