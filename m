Return-Path: <linux-arm-msm+bounces-92201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2iACMF5riWkZ8wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 06:06:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4814C10BB3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 06:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D65753001FE7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 05:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8AA2773EC;
	Mon,  9 Feb 2026 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ig68K88K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYKgX9kf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F343248F6A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770613591; cv=none; b=ev2gvfMlEUOMfY4Xbldt2ZbLWeUubfAWv4rH4aHbjzvNCLdrn7dT0OryVCk2C7t4RlSOd5BasF55HtJxhK26tyRqDtPlOTSKJcUX1/B3UTws0X4dI7OCC4eqYvbwt+BjlcUl3G7TGcK7w1lSHWm+c3nlrBYnsgXHRi6gQQVFVes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770613591; c=relaxed/simple;
	bh=m6mtiPXFLsLf5e+10JiUf4tZFNL6MFDEnTDYOBrewCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNMHZ6OMR0F+9ML4PGCErfVSnQHMfX/InuXWsGZIPi4KcIM+7Az8Zk1fCOL4ltXb+whAVYTrjbhYhCL9yJSgs+duyeFebARnska6eC2UJ6kqBkEBfaMXK92Zo29V0c+Wfcy0bxOXGhr0Av/GgcZf7yVb/BFbZWQxYzK01GjvIRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ig68K88K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYKgX9kf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6194lH7d3593804
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 05:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3E7UICCtHoEft9ePbt/AmDo6Ki/Hkw8JTeF+RItunsE=; b=Ig68K88KIREo8V0x
	dFtUOuorUJBDlr7CknJlLDN22z5MBAGDCRxUgPxneoo6C0WfIeU/79xq4a961rXr
	7X2JO/d1rn4EM8oYkLhWfcWeUP8PGIHmDxicqKo3DvxhK/4gWDqn1siuHooixzrR
	prrTOwrnf/xRI3sNHrLIRz9FPUrDq2hf6+IPv3ZsOVZvxAjCqZvBAT6WQZ2Lz610
	Iiq9xa8sA7xlZ2RkuFaU2b4G8PCq6ckpuav1fQvUFz9YOvKzxqpaz+DCvWoW/H7J
	AW3pc78NKl0laXPDb4WQtDoCkGv+ClwbiA3C3qNCSgwTeSMi0nChROyr0AbVl8fV
	3NLhKw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdd3p2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:06:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6dcdc955a3so4725024a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 21:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770613589; x=1771218389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3E7UICCtHoEft9ePbt/AmDo6Ki/Hkw8JTeF+RItunsE=;
        b=XYKgX9kf0kiE3y/TNn5QYTY7t7RgpHqHl64JT28f934X/jRYvYl/QJwncEBquQNlW4
         VXb8bIWPOHSbIUptPz43qNDry9jiKTG++lel+avsYci7DcbULSZuzidWjvSiy7OKU7Uz
         e+sfMSQ82NODX8lk8Qm05YNVeuNqreJV3KyozDnQlifi6Q8Y46OiU7/dbrxDdhxbizIy
         RAZW4Gm7uf0EONSX4kPd0O6fTOvkvlcyASeTVi/UJI3wpcmDYyGzlwQKIqy6s52N8qGr
         YILmVAbs4nN9qtFQ4xxCZ9QnTBrfQJEwQHYXyHcRosbeekQXMOXu/6zZbCSUxf0+4SwK
         Rz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770613589; x=1771218389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3E7UICCtHoEft9ePbt/AmDo6Ki/Hkw8JTeF+RItunsE=;
        b=v/VfQJOclfPd9gqHOQzmgUdGTuJ36U2CjfSbkbOT4SaTqOg1z8lpNmPvL/wSh8+HHD
         pocq8logsYkYP8JAVawzeyqC54uhF+vwzqK+C6v+0fITdRV4G5Fk3bw2r18FqU3H25fO
         yGvT3jAgP0bV0a8ZzTXKeo6E6wjq7s4Ocp1oZyJ2b47ZwxZGO63Wmu7T4l0bCQS158iz
         lZhR+Pjf0iTOerQwLFyjjFuXbwDrtFUv181kdJDCjO1Jqp47gM0IPPDwqKo30MPfnQTs
         E0bU5y84RX1auvbangcDJcmv8VwQtMhxfhxQgjE5N96nFg3I/k9y21WaABg1Z359BfA8
         axHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOQ93Whs5GQu8W1Gh5jfDKyAdybc160o2dJ9U9yKmBi3SHsiVb1MA+ZMBye/RtI9iY9xVPRuG6OiFtwnGn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg7H28VxnjnAl2fdNbg+XPbVHYKh12BTz1wGilvRuNd89JlmDi
	R3JyI2Z73bFYHzBOPJLgJPvDkVYWKr25sUtDLsTl23jvdLnn79wV7aDYDQisVcVm0CTbgqrFQkv
	WFd4nQGzFgA5aQU18t3+nwD7cNvAQJ5XoBAcxMKKbNJ8kgDnsDH2nCLLmViCnbxR5PqNs
X-Gm-Gg: AZuq6aL+u4SAIBfE6btK5lzoASbuzsVIPRR9lxMvLDiWnXA9ZejhFpm68xwI3u22yY7
	wM8f4NVW5p5dtFL8TGBgH20sHACH2005rUnhDQuif+Cfy9IVaHFdwwBDBUoMYc+Zhj9y1/HEpch
	r0gFH4hg7/M8oYA9mPXzOUKHNng0RHgwicPv6huAJ1a6P2iddiZtrLKc1nMnlWnJDgRu1s6Y4Wa
	TCUuDCiGVj1fY0spLKZiCOTsPRFbMdKZyBBtMSKdtqtjr8o7FxoRH96mIULyN+/szW0zZNGhee+
	rYKblZKepq19Qni2scRru91/nVElAZJGFRNzYEDMsmRCOEIrssA+VsaQ/zHbmYG+1lOVfP9/bju
	wABbT3z9bPy8L95ZKUsZHgies6MYVIm7HCqxy5XJeAQ==
X-Received: by 2002:a05:6a00:3e02:b0:81f:fef:1fd3 with SMTP id d2e1a72fcca58-824416f8f09mr10733354b3a.41.1770613589483;
        Sun, 08 Feb 2026 21:06:29 -0800 (PST)
X-Received: by 2002:a05:6a00:3e02:b0:81f:fef:1fd3 with SMTP id d2e1a72fcca58-824416f8f09mr10733326b3a.41.1770613589010;
        Sun, 08 Feb 2026 21:06:29 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824416952e4sm8810443b3a.21.2026.02.08.21.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 21:06:28 -0800 (PST)
Message-ID: <7c44e9da-e7d6-4288-b000-939ffcdf7b39@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 10:36:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: epf-mhi: return 0 on success instead of positive
 jiffies
To: Daniel Hodges <git@danielhodges.dev>, mani@kernel.org,
        kwilczynski@kernel.org
Cc: kishon@kernel.org, bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260206200529.10784-1-git@danielhodges.dev>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260206200529.10784-1-git@danielhodges.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uPlVngDmyrvLcdvi8WaERurldapXSdOI
X-Proofpoint-ORIG-GUID: uPlVngDmyrvLcdvi8WaERurldapXSdOI
X-Authority-Analysis: v=2.4 cv=Rdadyltv c=1 sm=1 tr=0 ts=69896b56 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Gk_b0IoX-7N14tGkj8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA0MCBTYWx0ZWRfX4pj8jwvnQ4X2
 l2GMJL78/kaFgNEE4zDKhtoQXINsY+OEiOFTFclseGe7lu+NHF5UvlT16VjjLsz0ATuNoBj7aT1
 1Ww9NWH6NZgIWjAG3seK5obc1vLlRZjG9lRAI7CZ5A1jQ496X/aWPMwU/qlK0jK3Rx0sOWJerQo
 opS9cqEYmaFoK2N9xmACBM8Tr9/dS3oPuqNeqkPQdoQYSPbYqYUuL4l2abGEBF5goMMdWAnD/Oy
 OJguZEY95vY/zPnNmjnJKPTLJTNEkZt1vuPl6OorI+xpJlFwsbYHf1Y5PibdjU270VsTnYJpzyO
 k0+br/p2yC06BM80CLY3uT6vxbPakf822quFOoG9M+LKk0lzF9457rt0ZPJv9iV3zECyKJfqxGa
 sUWrPbsKSO+r8eka40uGA8Ob34dlgJl3lLekNrtf4bsORVlH0E8UjCf4EIZ4+8BSVpD+GeNT0as
 fHeVm1ixusiLFWzx/kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090040
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,danielhodges.dev:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92201-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4814C10BB3E
X-Rspamd-Action: no action



On 2/7/2026 1:35 AM, Daniel Hodges wrote:
> wait_for_completion_timeout() returns the number of jiffies remaining
> on success (positive value) or 0 on timeout. The pci_epf_mhi_edma_read()
> and pci_epf_mhi_edma_write() functions use the return value directly as
> their own return value, only converting timeout (0) to -ETIMEDOUT.
>
> On success, they return the positive jiffies value. The callers in
> drivers/bus/mhi/ep/ring.c check for errors with "if (ret < 0)" for
> read_sync and "if (ret)" for write_sync. This causes write_sync success
> cases to be incorrectly treated as errors since the positive jiffies
> value is non-zero.
>
> Fix by setting ret to 0 when wait_for_completion_timeout() succeeds.
>
> Fixes: 7b99aaaddabb ("PCI: epf-mhi: Add eDMA support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Hodges <git@danielhodges.dev>

Reviewed-by: Krishna Chaitanya Chundru<krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.

> ---
>   drivers/pci/endpoint/functions/pci-epf-mhi.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index 6643a88c7a0c..2f077d0b7957 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -367,6 +367,8 @@ static int pci_epf_mhi_edma_read(struct mhi_ep_cntrl *mhi_cntrl,
>   		dev_err(dev, "DMA transfer timeout\n");
>   		dmaengine_terminate_sync(chan);
>   		ret = -ETIMEDOUT;
> +	} else {
> +		ret = 0;
>   	}
>   
>   err_unmap:
> @@ -438,6 +440,8 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl,
>   		dev_err(dev, "DMA transfer timeout\n");
>   		dmaengine_terminate_sync(chan);
>   		ret = -ETIMEDOUT;
> +	} else {
> +		ret = 0;
>   	}
>   
>   err_unmap:


