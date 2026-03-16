Return-Path: <linux-arm-msm+bounces-97982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GyNOnEluGmNZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 16:44:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F98F29CABD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 16:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91F5830BCDB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA72F39FCC3;
	Mon, 16 Mar 2026 15:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOHij19A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFt6BlKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAD1313552
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675378; cv=none; b=fSgRmH13U3ZQJ5QsufRUjgV5YY6Z969GLC4muubqiWqy0Z2/rkLzO1e8gRGA/DWBvXLa4Yof2zj4E0XQXgnaL5o28SsjHQnR+/uXHirnki+5ukbV2qlmVujR0fN3Z64OaU+n91TzY6qka2Zms6JuBof9lPqWCJn9dcJxTSyENyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675378; c=relaxed/simple;
	bh=YBwGSs+7ZZ0K6mJgU+W25OaURZhQh89G134yJWvXDB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4M/zsrRWNkz16VTFLWH2ll0XDRqHHPbUqjH2CQ1JqahstvK9S5Z9tgvEYoLLdc7HW44F50Y7ux0ODrLFo0XiNZE41vZnAmNkNBH8Bsazd8Qq/X3LqOy/0HRb5zOOSz/7wZTloUXmXdeopUukxoCcjXkVewmswM8CcvWTeb4Ei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOHij19A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFt6BlKA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GFMqKj2314590
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GvC3fAmcmTm/zGXzFlh6tcG7
	0YP1CTrqTNniTWqO2ww=; b=IOHij19A/NMyGmo/XaqSaOUeNloZCRDYPOcwOpzN
	EbYhurv6qyxwsPt+ib2wmUgSEDiF3TOszI9QT8BPKZ3OYe+89rbS4Xt8VuQFpV9V
	FV5u1lrmRC4+O9bzA+a7R3CUxKXbhyvvu5IynDHXwpNzfDvKjmk2n9OL9XTtRccf
	Iv38S+qezSv40EV7H+V/8GjG+hSbUmGUONbGBdQh9VNsW4U8vx0TxByHwm43ypKL
	VKVhO3n8EeWNLaILXK9lSwoBN5oRI0PuPIwUvpuH8YxWAs/p85S68vmuv9qn7wdd
	3Wwh9tSiMZ1faQjFBA/uiD1RKLG5a8I1HxVPFvnDnrWNAQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf281bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:36:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35ba237d2e0so1300453a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773675375; x=1774280175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GvC3fAmcmTm/zGXzFlh6tcG70YP1CTrqTNniTWqO2ww=;
        b=iFt6BlKAlGvBMfKAvYdjY8EK+Uh2rCeU2spZM0wgWRWdI5eUC4DlYLCBO5eLNA0T20
         IX2ijm+NYrXM7cjRaLfi5ky6aQ0sEaUkVUi+h0vdA23PDRqvf8dXv2RW0ATakPgmCjwh
         xbQsvjHoPKOR2dPkkALR2h/tHQ/9KhspdKzG6h9HoI7m4QPkBg08MfO8QKsarqcz7Cq9
         8utaq21y2nd0Wg2Ky8T5GgzuIWqmow6z3kAFQxdca0rqHTRC2tvwnnGOSuhhHc9y/hlf
         Hx6314sS1gpUkIKMThMLdKo0mUe3muU6yDgCrvaQ8JKH5bcgzUCaZjH8If5FzMbojcRK
         Uimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675375; x=1774280175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvC3fAmcmTm/zGXzFlh6tcG70YP1CTrqTNniTWqO2ww=;
        b=bW40DvCkacscy2mkBRjGjHyNvTOJ+KXHs9UIyOrgImiRO33FGQ36KFtMnPiNuQS5O8
         CjEO9Tvl4NXCbeKqKMJXhNq38PmoNQpdeg1+gt9AQONZtg6/Rj4MOJG6Hp4IxMZsKb/X
         0DjJ7oTcXQGBXT88dxJtYXB1LqQNSqr0WLUedFvjSSU1nEOZ2CXteBCkbLHTtFxNugXM
         1qo9orbAyl9fzJ+m4bxVcxcf9pTT71126Kwhlgvv+ZR04eM08ByLLU11sWep76h0WAF2
         IMEwQeKAEiHUQRKKaJYT8+Iimg0tXsIgoiKcwvCO0F99IC2YYLjyUHF3GTqYofwX6ewc
         SPzw==
X-Forwarded-Encrypted: i=1; AJvYcCUjySimzczexq1yGKnjnHz13lzPlbK6RHyVnJZmft6K2ymvDuaDbl4PCo0HNcXzX/161D8LT0AF41zawSgz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1W63AG5G3fMjnnnjeXie3HuAVVIqNuop49UhIUPp3AORYbRNw
	eeB1MMx/47jywH2isZkXYI2sGw/SaSYxi/fayhHk3fcNLYK6eLWXqTBioyP/5SwAV56hKLVUqv/
	Z7HAmuYHdwRCY1HC+V2+4F81+at47y8Un2cn2Ie+gpQeKrhIZMD5rk97BejFQJx/Dv6b0
X-Gm-Gg: ATEYQzytYbwB84aUs0GqkfHVGx6ExFEss1mJEvjY+zD1wmxbc3GT+nnP4gQ2PBk++36
	iwJsyviVT+PZSRaYLlGfDW0w+Qorbp44qF5KNXgXTSvPs6MxBJEGidwv6eyOzBpwNU1UZC1eoMX
	QOKCewoWDBWLGbhFMjW+gA9zZTIKqayzLUorWYIvHnnESO0bs2CS6m9xLDzBfs7238wS0GvmQ9K
	E+HkZIBt4h/LuYPFRHSmsjnQSBNvboAT7VXnMpna1v3nnTkS/Pxc5u/h79m31Xgl7EZcTBWQImq
	my+6BmF6jSVPbMSBdW3WBmmsIcRSiqmdpANx/QRcmkOmTcv3BMgYTbLmzR+VXifAh3yx/k2Xqc4
	KHFJayN92QLyTpQhgg9Tl4iNz40fj3+qvu5N4G5BZtbxACLJw
X-Received: by 2002:a17:903:987:b0:2b0:531b:b3d7 with SMTP id d9443c01a7336-2b0531bb59amr48913255ad.51.1773675374692;
        Mon, 16 Mar 2026 08:36:14 -0700 (PDT)
X-Received: by 2002:a17:903:987:b0:2b0:531b:b3d7 with SMTP id d9443c01a7336-2b0531bb59amr48912945ad.51.1773675374052;
        Mon, 16 Mar 2026 08:36:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7edd1fsm144517635ad.47.2026.03.16.08.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:36:13 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:06:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>, kernel@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Fix leak when custom dump_segments
 addition fails
Message-ID: <20260316153607.sb6nuq5egaxr4hb5@hu-mojha-hyd.qualcomm.com>
References: <20260316-rproc-memleak-v1-1-96b1518a1a61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-rproc-memleak-v1-1-96b1518a1a61@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: iU6987WPon1VfUQfWdWvLOj8uUErPOX3
X-Proofpoint-GUID: iU6987WPon1VfUQfWdWvLOj8uUErPOX3
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b8236f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=h6w44uCbTxVKzR4zt9gA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDExOCBTYWx0ZWRfX8z9Q+RimWkSc
 wh0rA0OSNghyYdFF7nK4r9Zyg38X7KE4m1tIv+42Ey74+f69SZUHb4Q/dpYJKLt7RuntbVhYV0t
 TyqC3DPsRPUGn2RXOz7m2+qil2XfG49RXk7UgsCbkc+DFDAQdz4a7YpjN7ACvyAeyJyWVlXBHMK
 wS8AFuPJFBsjNtIpz24j14kVlCHhzRn46/n/792ZvR2Xjvi/ZMLzN/CHjHsfJ36EEqe2z4yNOT5
 ForwU4kAENoFwFy8L0yMxsjJ85gJ7YQrL4Yc6l6UgZpe8C1e71gHX4uWzQmU/qqG5mRzA6WPL8G
 QibL41YL3pwxoXv0DVgbZupIU/6ZxAeuneDat8iSALPMSRqbdfS7IzJ5g5GfholWbVRD7G+K2nK
 tztL1FKI6kEe3srKV74b9RfKasIZBDDNmEQg+JzJ1UVgJEOf48lGkda27xRWTqroc4WwXxaB4iE
 YPdiZ4LMuXwN3yQAXlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160118
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97982-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F98F29CABD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 05:57:54PM +0530, Wasim Nazir wrote:
> Free allocated minidump_region 'name' in qcom_add_minidump_segments()
> when failing before adding the region to 'dump_segments'. Otherwise,
> the 'name' is not tracked and is never freed by qcom_minidump_cleanup().
> 
> Return error when adding to 'dump_segments' fails.
> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>

This should have fixes tag and cc to stable mailing list.

With above changes

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> ---
>  drivers/remoteproc/qcom_common.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 6c31140268ac..aa93d3324561 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -110,6 +110,7 @@ static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsy
>  	struct minidump_region __iomem *ptr;
>  	struct minidump_region region;
>  	int seg_cnt, i;
> +	int ret = 0;
>  	dma_addr_t da;
>  	size_t size;
>  	char *name;
> @@ -130,17 +131,22 @@ static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsy
>  		if (le32_to_cpu(region.valid) == MINIDUMP_REGION_VALID) {
>  			name = kstrndup(region.name, MAX_REGION_NAME_LENGTH - 1, GFP_KERNEL);
>  			if (!name) {
> -				iounmap(ptr);
> -				return -ENOMEM;
> +				ret = -ENOMEM;
> +				break;
>  			}
>  			da = le64_to_cpu(region.address);
>  			size = le64_to_cpu(region.size);
> -			rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t, name);
> +			ret = rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t,
> +								name);
> +			if (ret) {
> +				kfree(name);
> +				break;
> +			}
>  		}
>  	}
>  
>  	iounmap(ptr);
> -	return 0;
> +	return ret;
>  }
>  
>  void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
> 
> ---
> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> change-id: 20260316-rproc-memleak-367ef8e1a64b
> 
> Best regards,
> -- 
> Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha

