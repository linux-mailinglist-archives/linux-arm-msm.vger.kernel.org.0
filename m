Return-Path: <linux-arm-msm+bounces-113936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sIzRNIDZOGonjAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:43:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DC6ACFC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:43:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MoJAIpGE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AYXrQjAu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113936-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113936-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DB37303AF31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 06:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF2535E95A;
	Mon, 22 Jun 2026 06:41:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2279A35E94E
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:41:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110511; cv=none; b=KRsA0nSg7foifQkInWYFrpU6Zi/pkmzTn7YUH6NAn+yFwh9u0xH5xKy/oVxQ2SbMJkFGiAuxkCTFTIFPooWktsz8gWSqEsEYizQsuRxUnJrZVbZ0uWBb2iFHmNSz0XByvTDqM6tazsJWPUwKKY7o4cDYDFGs4l0+9io2drsq9Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110511; c=relaxed/simple;
	bh=9cmkIXMJO7gMCtwVcDVLNwQ8XrpCbFPx2UXY1rvqCtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3lEOFKSXyvm0wozL4UqCxy8NMPeTLjSCpA1kshl42t/XZFJsopMk9Pte0oXfCfl9t8FDlVeiWjmV9GSXvXPLQ9aBPSHf6g6Rkfqqi+kH7Hh15C8fseT3XQ6BPQgEnJu4lyewzV1wsqL7sX0ir64pS0bdQFZMFYBXJ8Kf3a/cSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoJAIpGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYXrQjAu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5B7ob156591
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xHK9/MiEK/EN1OHCR+z7uafv
	ifIPKlxHaMTGSbKnKig=; b=MoJAIpGEKRnqtUKZmOWiRhkEJRLHszGo57aPA+eS
	3g1mISBjJxBOLQ7CQjYObztBfLTCTARtFch9AH4btjR9skDXPbRox9hCKBOSr2Ug
	8ilinPw00hcxtpcf8UYOBZ3J3vL0wUIVSfOIJ0s/P9VdskKA92+eU2OxHS4w7fT4
	OIlRPA3liYLn+f2SLQ4ghlyHu2KMQWhg6Amk5COYV4/5nzouAS2NrX4iwodv6+NO
	bo/yvY88cVMdMjpFWofX+DQHFR8ZGIT1PETHywL79g9vBMor4tXQVbOnXUHb+kh9
	+h1mhWv+YlQvG52EeUlY+eSQqCJuGgKzEsY5CCgWao+Pdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewg7mndf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:41:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6afd85980so40959385ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 23:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782110508; x=1782715308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xHK9/MiEK/EN1OHCR+z7uafvifIPKlxHaMTGSbKnKig=;
        b=AYXrQjAugVwYwGKhTkYB9wDk0P4zHSQdqp+w3kcp08J84NVCGe+iozMlpr/LlLOLkY
         JI6smTv2NpwY4rJQ/pcTYwzNI7CT6PzTxJP8gbl5TDmQToK5usMxD1mnFjYoOon78lZr
         Af4HpJIxzs3ZgWWz7sWVGQ2Ir6wc89Sj07CGjezHPYvKhTzujGyXDCFBaE7BaW79vW9X
         8LR49f/LD4N9wXncpJKY8lZjgTF6pjRGLKOvdbAQ2k58vMsSJv/MQxI++ilzzfNMreHp
         ESFRtHAeDP3BpK4AqYPDfKwykSkoY7pr9eZJSvLqOQsXLRbgNx4cHnqXZL7/s1lnhljk
         c3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110508; x=1782715308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHK9/MiEK/EN1OHCR+z7uafvifIPKlxHaMTGSbKnKig=;
        b=hFcCUVGovDerwWg9PQoVBXZw0LtrtDqjmI4uWKSTGsG4TIqL3kSdIUy41KE7QBB0jG
         4ZrAyLR6nRFCg5Qe/7BbjXjCejIAzSAzFRY4Ewh4qKy+rRRDVCZ2Swik7tLS/8Zik5Es
         uKKmjQ3QJ4zqKXcKlGw3v+lExCNI5RZ3R2hEa83oPAw0hCBFkf30EJ2kc6APhdnlKc3+
         C44xGcShRiAAXNR1nlG/fCCmgZWALzRMSzkrC4csrUEXQqVMXHq8uVpw6L3wnhtoHnmb
         n3MF8druINtjzc/2YJtWBD6POg8ShstEbnPwndWhtQi6mYVQvKHLypNvdqzGMRXWpHsA
         h+3A==
X-Forwarded-Encrypted: i=1; AHgh+Roq5RUHQf6tEwZuwztpL/Tbm+Psdr+C8Tsf/Xj5Z825tkpceuPXGtaaXVYsmSTjrnnv5iTb2Z+d6Vgs7JHI@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRq/fHafnhFAk7en8pIhPusYjiGKMtkznEAvlt2Ez3nAT6yid
	DDyllo27+EQv6EgSeEt6XN21HhLsAHaIm5VLoJ/h25Ed5/1ni/6cti4krdUkIVp4XWaa9HVNA+I
	i5tFvQNiYVLDJ1wTID+VqsBOpitushg65TmDmnR7smVQk8X5pvGnI6tfSIJS5qsCokOsS
X-Gm-Gg: AfdE7clAPZHCAWsLzoiQgvu9D/Xwapg8Evy/865pSvm8XxZsEsE5pS3RT9cAvhwUORp
	5tEsZMvmcY1Jp+7UHb92J+PfivX8mI5qZKQT6yPWpgz8cMCdatXscY/QV1NkM2JFr5ZG1rPc8ut
	6ldrU4XUNAeTjPvLn8QVu/0aCtdkv1tdgPa8fQcZzQqOWUTWa2gRiu5zNhxe0oTRaXlyEwQE8/0
	go39ubxHx279vX81CajxbfKHoYrIj7t8/sCkbumH1qtvX2q4vWQNHUakrCTJVoef2V0BebbTzZ+
	eUq5qZ644E4nNSG4ohISkTcIve6mWY0vxenOpDGy1wrzwwe8PYQcJAeQbQRBumAvA6dT5q5hX9W
	c52blD4HK9xQNz8dNWLYfV/dGHnjg2H4G6Jb2JA==
X-Received: by 2002:a17:903:1c9:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2c718ed6396mr144609255ad.14.1782110507853;
        Sun, 21 Jun 2026 23:41:47 -0700 (PDT)
X-Received: by 2002:a17:903:1c9:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2c718ed6396mr144609035ad.14.1782110507236;
        Sun, 21 Jun 2026 23:41:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe6c6sm63306685ad.58.2026.06.21.23.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:41:46 -0700 (PDT)
Date: Mon, 22 Jun 2026 12:11:41 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Release dtb_firmware on stop
Message-ID: <20260622064141.zfakbyenknx6vbm5@hu-mojha-hyd.qualcomm.com>
References: <20260622040114.17128-1-saileshnandanavanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622040114.17128-1-saileshnandanavanam@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfX1PduRo5rCTiJ
 DH5ohJWww9qOMowFuDGuc3icDxQ6YpRIPPVXiSLGjIWqmfiCN9bzj4/GPejIaTBJFa+k4uNkC2j
 c9fHUyfz+Yymwx9I/u8sLYtHp0CwJHfzrn/LJELehPx4PLpwQXQgTIhWz9hMxFL2t8Vcnvkyxq4
 1Ojo+nzy7yuqbcIIABmL2aXtfmMe4zEMwbs6EcgtEIiyUkAPHi1bK1o855GGPDtKG2QtbKAcPjB
 p2Ix4NIntRgqkmipSsohnuff6SQnLsoSm0teANv9ca+o5VmnVO/m7w4JaOhJCBRnh8YVSUngjhc
 DtGhTsQpVcE99U5lHjhJaE+8ajqq5L1cIMUYZiQaDCkIX2DwUYpnHk6hOF5v9ye/f9lcbmFc1qj
 LuZC5ydsqCkKM6Lz2NVI0zb4ONi3O9EEM/VLsEwkJsMFcM4vjZx8jLp8kyhuqNIcp1mgn3IhSeR
 mt+MThHFLjwqRHlNixA==
X-Authority-Analysis: v=2.4 cv=IOMyzAvG c=1 sm=1 tr=0 ts=6a38d92c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=ThCJF3AM6TL1KfZxvHMA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfX4aWY9VzsEp6Q
 ygWUrrIs6uVoK8cUfAEABk4KWwHvA9IV5JvHe7WEWHdzYOgpuAnHp4GF3L5AW8+MU4tcQll7Pol
 p0QLwsmZYp+mRwf0Fz5IsVezlLGqw5w=
X-Proofpoint-ORIG-GUID: _jhgmTNrO96z5Yw6CR1HVvwlB6JRYZwM
X-Proofpoint-GUID: _jhgmTNrO96z5Yw6CR1HVvwlB6JRYZwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113936-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:saileshnandanavanam@gmail.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 320DC6ACFC9

On Mon, Jun 22, 2026 at 09:31:14AM +0530, Sailesh Nandanavanam wrote:
> qcom_pas_load() acquires a reference to pas->dtb_firmware via
> request_firmware() whenever the platform defines dtb_pas_id. This
> reference is only released on the error path inside qcom_pas_load()
> itself, when qcom_mdt_pas_load() fails.
> 
> On the success path, pas->dtb_firmware is never released by
> qcom_pas_start(), qcom_pas_stop(), qcom_pas_unprepare(), or
> qcom_pas_remove(). Since qcom_pas_load() runs on every load/reload
> cycle, including subsystem-restart recovery, this leaks a firmware
> reference on every successful boot of remoteprocs that use a DTB
> co-firmware image (e.g. ADSP/CDSP/MPSS on SM8550, SM8650, SM8750,
> X1E80100).
> 
> A second, narrower leak window exists if qcom_pas_start() itself
> fails after the DTB carveout has been mapped: the remoteproc core
> does not invoke .stop for a remoteproc that failed to start, so
> qcom_pas_stop() never runs to release the reference in that case.

> 
> Release pas->dtb_firmware in both qcom_pas_stop() and at the
> unmap_dtb_carveout label in qcom_pas_start(), alongside the existing
> teardown of the DTB carveout mapping, and clear the pointer to avoid
> holding a stale reference into the next load cycle.
> 
> Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
>

Remove the line feed from here..

> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..040aabbe5860 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -360,8 +360,11 @@ static int qcom_pas_start(struct rproc *rproc)
>  		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>  
>  unmap_dtb_carveout:
> -	if (pas->dtb_pas_id)
> +	if (pas->dtb_pas_id) {
>  		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> +		release_firmware(pas->dtb_firmware);

This is still not solving the issue. What if you have failed just after
the first function qcom_q6v5_prepare() in qcom_pas_start()?

would it be better to move dtb_firmware loading to qcom_pas_start() ?


> +		pas->dtb_firmware = NULL;
> +	}
>  disable_px_supply:
>  	if (pas->px_supply)
>  		regulator_disable(pas->px_supply);
> @@ -419,6 +422,8 @@ static int qcom_pas_stop(struct rproc *rproc)
>  			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
>  
>  		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> +		release_firmware(pas->dtb_firmware);
> +		pas->dtb_firmware = NULL;
>  	}
>  
>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

