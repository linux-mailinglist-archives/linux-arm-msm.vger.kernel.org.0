Return-Path: <linux-arm-msm+bounces-110956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VQD8HdMaIGrPvwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:15:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 71849637656
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:15:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IjGuzTz9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MVq5xpmq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110956-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110956-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1AB0308A671
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F08472768;
	Wed,  3 Jun 2026 12:00:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9CA46AF0D
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:00:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488047; cv=none; b=bm57gc7oj/2uWcCg+7cZHRUZxNDyMu24OtWjsgE3DhHALie1GGxPK58G1LyFB7jDKPcymJU4UPIAsDOnudUdIbLqJcbMde6yt/tMaKUC4aTu0EqbDcj0FuTMsSqzscRBOjW6JUFEhlz94oDVdhIu2DKNbkPJXESumtH3ux0q6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488047; c=relaxed/simple;
	bh=NS0xWcLoVME5uOWD0bjjm8cQgFmCQDhMl/k6oEHHG+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hu6XeqRKo6KytemT79yCU405oKrgpW+QKBYdfPbyIcCdLo+1bhyBZ2IxbtWHhxE+xamlbf1VPmQmy/vaHipy5UH84wjJjJyWA0c6THgYxLpaZrD2isjnLCyvXirghg4lRB9NVPL6usg6ZhwSYELTdq2u+2oFgekDfkbXCd7JzGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjGuzTz9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVq5xpmq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536v61C1755365
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 12:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yUnCZYYs7mTlaoDmwmTKxBLP
	MujYgvgMbUGZZ8Nnqh0=; b=IjGuzTz9CC9yCNrZ1/tQWCmrwOXp8MFV2rCmFVg2
	qWVrgSFWq4NgQUvEt3D44OEm7jhyAfD7OQHuGq1KAbHZkAliQ3uW3vGR1Ev2BHsr
	Wkj0Z4aCgO5nS8YVYj9S/pQycVSEpqmDdzV6IYYFsbbPjoDgjUTXor2y9ITF55v5
	+tD2xq6yiKYFiRxVP5CCmzisLizyI4PCiV0KZ3fzCBuO5lHW/g3Q1AA/I9VC0grb
	Y5OdV4QPOQdbONvPCynG9CBtUQC4IukG1m5eJnHejZOqyddTj2WVDb2e/PCf6V9W
	So/tl5jr4oT2Q82CNkYiPrBACj1RCWKdHnJLetQxmAlhvA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff0186r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 12:00:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59ec1fd295eso2669962e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780488045; x=1781092845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yUnCZYYs7mTlaoDmwmTKxBLPMujYgvgMbUGZZ8Nnqh0=;
        b=MVq5xpmqyP77BI/jH32Z9gdY5BatRF9ngHBYo+oSM//sKVA2QLRyrdIe3jnPBYaicB
         KNzYldPsuKzi932755RCfu2zkD7bTYg8KjHMblNbTxNYL+8qJtaFsxRPKZ0WfsQh69zr
         K5QXsdANBnPDcxfVuJmwE+GjuEw+MoIaxfALoDrpHmebm5PUBxgpwoSY5U1zJWGg9qQa
         S6eL4d6xPneBZaIIA4WLHZN46O1YU8S/Mzib6cwZj7bJ7H/JvfNBcwqRDnsrlbiwsTmz
         31f7Gii79t/eK4lHMC16IDooKVp0Y5hDvBB9rNOwdo73Kaxhog8f1He7phybfL6eHwOZ
         LZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488045; x=1781092845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUnCZYYs7mTlaoDmwmTKxBLPMujYgvgMbUGZZ8Nnqh0=;
        b=cSkTie4JT8uy5dpamZoAhYweJyqaxGiDyPFpOR3U5xC0bWBYeBRfQ4w8HesgOgba1o
         FbfQrDb6rtxcbID3w8w1sgcOV7CwRRS5wK/rTeZU8L5edlwDpOJS8A23pHlbZn3bchKI
         wOuo84IXS3SXh6M7u4z5sgAUa7HZPj9mGBa7XwzAS7+cpNo7xNmXnu1QtVbR4+JkJD+m
         WN6f/V7HOxufybSPvCHk6htZmjkIUzIff7Pk4oCBzKkElRCCq2w1JqIF9OrN4LJUwcXv
         5f77gqOyfuarwqnIluqb9vJNWYGgxRChF5o7xBL4gMqmhJAQKhtVtcnWyXcT/2M6glcP
         a3WQ==
X-Forwarded-Encrypted: i=1; AFNElJ/26dXjvSbkwQSfsnRO8Xof2AhQ1aQ/hfPy5MyM2I9I5AeV7tT33DopstlSnxUIselFqigaONYxSLK/gY6b@vger.kernel.org
X-Gm-Message-State: AOJu0YyV3GxFH0+tCquakogw3KIsRAXp9gL4iQCk4g18gLvb4fhZcect
	c+JD9gsYPvjRtVGl7CMcgTUvPiVDR3/2RIchBhrF7aXiIczbEZ3I4tlEr4g6mLous2BtaMMJel0
	A4vGmlROho01JIYQ/Q5LeS/SSvNbOS9p15ab46sWstn3thSi0xPK8fOq1jGR+edYeE6Js7h5+SC
	MWMPU=
X-Gm-Gg: Acq92OFvZH8nHXnzHpNLXUUfm1p2OoWBmth3BpG3iyclFmXW8PkFosRN/zo+cqIOi2t
	s/It5rXvt3lHkz+d0HpykPxefStIhFCCyFvcRurcFTWNSuEI9huwbAlvSgR26wkgHUDHVhvwnK/
	iseq1crOnj+aQKsInHxJiwTWdhi+DZWvYSjQ/orzQ3iT4EG9DsWHuFAb1j9ri/gDI6/2KdDUEGD
	DdRYb3/iKti5Gif0CfjmZS+u4YXn+6XUS38+OjbFeVas7eiT693jP9YAGb8cMOE9ZgIn6aieQZ4
	Oa8ht65K6kIhedQNdic35AJzaJ68g6cD3uFNz7ikZ7c6lyqXtvjPSiw7Mc5nlrVQc/Q6szq3FPM
	IOp2Kq28DhEnm3OIIO6WbeZT31wJTVmC787rB7ETS9n4QK3ueRpL/aSaCaQNYID2RdCtyASgwJb
	wa9fbFOZX5V/Dj5Z+1YrvydNfbm5tMm2N6bsLSxAbFRIXrtg==
X-Received: by 2002:a05:6102:6a95:b0:650:a5d1:ee1d with SMTP id ada2fe7eead31-6ec2ddc838cmr1114945137.10.1780488044836;
        Wed, 03 Jun 2026 05:00:44 -0700 (PDT)
X-Received: by 2002:a05:6102:6a95:b0:650:a5d1:ee1d with SMTP id ada2fe7eead31-6ec2ddc838cmr1114905137.10.1780488044247;
        Wed, 03 Jun 2026 05:00:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b906a83sm612821e87.33.2026.06.03.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:43 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:00:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rpmsg: glink: smem: Add WARN_ON_ONCE for FIFO index
 invariants
Message-ID: <qqwenmnyheanpivhjseokvdljdkil6ff7o76bubq4spadmwos3@5chd62mt4ojr>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
 <20260603-rpmsg-improvements-v1-2-dcfc22ed69f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rpmsg-improvements-v1-2-dcfc22ed69f7@oss.qualcomm.com>
X-Proofpoint-GUID: OcLCPcWywAgeRNJ2LYq2t1ic0gR_TVKN
X-Proofpoint-ORIG-GUID: OcLCPcWywAgeRNJ2LYq2t1ic0gR_TVKN
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a20176d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=04xQU59iOt5VFKbn3XYA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExNCBTYWx0ZWRfX9SHkhaFcErJh
 +XeNK9wuc3RkX7uVVe6aDL56J6T4XKtkLPs1AgCbNAKt2iNKSgAIHd0S3VfX/eKWRofm9bFqSzm
 BNsBQp6TWYA9xl0Mlq5q84bVxgpwzu6LGQr+08LZf9rAQ49IOwEr9rnk8pRIPu84swbSQcsUHog
 Hy/ospUxl3Hzou5nAsKSPh5GqwvKrWDAg5Wf/jC8EKD29SuIHJSJVQbDPhVVSix7io9TnIWPKpf
 Qbh2SSSQyvLFXvI4EaNCOqhY2DVZdKJktvZAajekwn68RgTexC+kdkPHupm1UM0vh209knPoqxy
 5TYFtmxMy0JkTjU8Ro4NZp1MCKF1fpyz8WO8+El78+W9QeaQiURsFUTAF74kWpv1OB2V7vYb+im
 trl/EVvszKEEuxmwHdb+kV4T2nGO68wztfzFHIfQadb12McRvps/oNUXt6m5+lKx/WYpHBobpI8
 30xUVGh+daHGr6Qc2dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110956-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,5chd62mt4ojr:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chunkai.deng@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71849637656

On Wed, Jun 03, 2026 at 06:14:29PM +0800, Chunkai Deng wrote:
> The FIFO read/write helpers assume the head and tail indices stay within
> [0, pipe->native.length) and use them directly as offsets into the
> mapped FIFO region. If that invariant is ever broken, the subsequent
> memcpy or memcpy_fromio would access memory outside the FIFO.
> 
> Add WARN_ON_ONCE checks in these helpers so a broken invariant is
> caught and reported once, and the out-of-bounds access is skipped,

I think the comma should not be here. Instead please add the Fixes and
cc:stable tags.

> instead of proceeding silently.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index edab912557ac..42ad315d7910 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -86,9 +86,14 @@ static size_t glink_smem_rx_avail(struct qcom_glink_pipe *np)
>  	tail = le32_to_cpu(*pipe->tail);
>  
>  	if (head < tail)
> -		return pipe->native.length - tail + head;
> +		len = pipe->native.length - tail + head;
>  	else
> -		return head - tail;
> +		len = head - tail;
> +
> +	if (WARN_ON_ONCE(len > pipe->native.length))
> +		len = 0;
> +
> +	return len;
>  }
>  
>  static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
> @@ -103,6 +108,9 @@ static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
>  	if (tail >= pipe->native.length)
>  		tail -= pipe->native.length;
>  
> +	if (WARN_ON_ONCE(tail >= pipe->native.length))
> +		return;
> +
>  	len = min_t(size_t, count, pipe->native.length - tail);
>  	if (len)
>  		memcpy_fromio(data, pipe->fifo + tail, len);
> @@ -141,6 +149,9 @@ static size_t glink_smem_tx_avail(struct qcom_glink_pipe *np)
>  	else
>  		avail = tail - head;
>  
> +	if (WARN_ON_ONCE(avail > pipe->native.length))
> +		avail = 0;
> +
>  	if (avail < (FIFO_FULL_RESERVE + TX_BLOCKED_CMD_RESERVE))
>  		avail = 0;
>  	else
> @@ -155,6 +166,9 @@ static unsigned int glink_smem_tx_write_one(struct glink_smem_pipe *pipe,
>  {
>  	size_t len;
>  
> +	if (WARN_ON_ONCE(head >= pipe->native.length))
> +		return head;
> +
>  	len = min_t(size_t, count, pipe->native.length - head);
>  	if (len)
>  		memcpy(pipe->fifo + head, data, len);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

