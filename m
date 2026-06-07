Return-Path: <linux-arm-msm+bounces-111622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Izg8EsPkJWodNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:38:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C429C651B63
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:38:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CK2Ugs+v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aEdYmcMV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111622-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111622-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E77C6300CCAC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44D033A9C4;
	Sun,  7 Jun 2026 21:37:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA453375C5
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:37:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868241; cv=none; b=XsxSl83HTqGAeCUXA1DKoiXRH6i55iW6MijoJQ07O3/PE07bnITFr5pI+0Ddhmx83iUum71B/GLMEgSATKVVrlVhtd6vyxmqRXtGThTl6Rz2k0OTs8zuRnJauNyekvcfS1NtI6NhZ4smrnCW9KJZnSPVuXSwe/enQtpL+IglLeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868241; c=relaxed/simple;
	bh=jU3bA+eAZGLVJqsTl9/Umf40rImHB8gU0T6rwYJ3vew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bt4wVS8ZJP3Ty47fGaxOcd10WpSyO9cQPHOEakE6tKZ0qXUsAuBTr+bsKw3ZYfmYYncEnEALKAMWAHFZGxxPcJfwppFjko1f45BgDaD2D4Cinb9AzJt02kR8ufsRL9VmEzDb2Ro3xDpvnbA7Q6kIr59MstEHes8unu6eaQJ64Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CK2Ugs+v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEdYmcMV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElCfh887536
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rHawpqdalUEcLHLejIvjMmWV
	w/BCWuC+v9oLpLTeFyU=; b=CK2Ugs+v7Dc1y0fT+FJtZMI4/kBNMnrMvLwcIod1
	1sP1YEgjsLX/vW8Sp1vs3w0JzXbtULDGPwYiz6/QieTs6yO6g/BnuN1UpCzpavx+
	C1YQdcMuN/QuBmaIRtF61yZq0ml3UJ8fBu7KOjz7A42/0TUIsIYd8NgdQc9P0e2Z
	PWu/HnOs09rbHskVWOqyQzTfFQ64H2v8mHQzAK1YLlcM91ruvv17jFsMrV7t5FpR
	iVXLHy6VqEkFTpHoUUP4XHp2Dlt/CZd1+gPS/7yB6shlKr5C8zD0kUKfkaZ6J3NT
	LGA/PtSdVlx3zLFVZw90GpQOjsfaSp/2hJWiVTCJY3ghyQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4w54q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:37:19 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59ed1788158so2160438e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868239; x=1781473039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rHawpqdalUEcLHLejIvjMmWVw/BCWuC+v9oLpLTeFyU=;
        b=aEdYmcMV+LkJaP1z8iVGaOXZMZFRZLpQEx0cU0lZWN/2kP77iqaoM/yILRsMCXAAct
         xhc65op6eq5OlvqIVNDAg5pmIFSGIoLPcRU0Yfc72VDnYP02WIiFR1CNF05ziQMVAgAW
         gAb5E6qhycsbrJOyE7XfEJvX+QVE80TBFCaxxEc9jylAYEtru1cIWeK4oSZpA+ni+Jbs
         m764crFVbLcnZywsTzB7gehbvsMJoMpDXP02QkjK4DUHJmx0h9t6Se+RScnXjXFdG9E9
         CaZ5wX+WyhbGFHLiER7iakopLVmngd+JVVD/BvwvaazWrkIlIcBzR7RqcUaYgmUsv7k1
         PcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868239; x=1781473039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHawpqdalUEcLHLejIvjMmWVw/BCWuC+v9oLpLTeFyU=;
        b=sE190rN6OLvn+uM0kJeEeUrNHNAYHO18DcRzCVhaE5LBioE2xGqao036Zi3lmcdCIz
         jqzdeFi88dKFRrkQHq+5iT5iWx+l90CSWt4izcykukZNx2EB9zPzhlCKoVdfEQOuEgaN
         dwDOcaQnwu44dwNlN4hrG86XWhl752Da+KAZA63cnHmSq6SPsMWGxGaIkwTK5NadWF44
         qsak+aUuWBUu8rIsmbnIuHx1ypf/rUzgBakSfEqCRUK1sBBP0A6XWZDMa+hAovTfRMyl
         mOSmuLzFt8vjKh3he2Zl3G0S7d7RhQicWJD8FBDuN32bIWlAXDse4ZDUEwb0RcGnycAh
         oP+g==
X-Forwarded-Encrypted: i=1; AFNElJ+/AceMR6ZUdxn+2eGTD68Do414qMu2JEC6Dw8NpvccFT8PC8r2cKBm3h1zAanE7mm6UgoHkopbZGw870+B@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgsq2Tn9kSWHerHIZMMJybBOT3UjIrE0t9m2+WBI+/bD6CsYBe
	LPGKQdKZdl1FDaaKxhe3MRKIm15p74cvYQSvn+h6pE5q3It7NN14bWIK+4FQjKCQqDW/OVMrzve
	8XwjaMfCVP0Qe4nx0tEffbLGcjgBlEG0jxLVmps4yMuSAMSOK4r5A6VqV2B7ce+O/js7W
X-Gm-Gg: Acq92OH+ZuOph1khmsT27khlaYKKESvkqtSv/wO+jZPrv6+vqDisXVKn3UQ9IOGcnFt
	D8qkQ5g1nSZuKI41ThKcZ2XvlHH6pg9PVhH6XLY6zgaKVbLnw+mpY2er9VQWvmkG2P5+k8E0pZn
	FJa8nzoMXdtEVa38HZH8zbrz59yGegSalfDZNMGtuMcsJXoKHBqrTH/C5h7bfBwwM4OobFj9grq
	xTskQnssQ6Z+SfDo/GQuUH3lzQT9B0ohQhCXIEV2Ar4iBJzTwugUbQ4WmwMM398TW19JEAo6C1D
	JPnL2ayF9e/wxvp/eBrq5vD1VJFNJaG9dD6OHlMzOgq0T4xK4vw2B0fU+Mtzev3kG/Dv1DKClnR
	AH8ZwnQDnmTQhOz0X/jhj8zPHyvXzhKW0BJVxuFSstQz1J2O7k/sj7hN9p2DHbuAfasJV89MFDs
	MLKbd899UMMWaPHfDAc50GxWnM+KG5K+xkksYvjOYTtPWmyg==
X-Received: by 2002:a05:6102:6447:b0:6f0:3c5c:76a with SMTP id ada2fe7eead31-6fede2771c1mr5563912137.0.1780868238652;
        Sun, 07 Jun 2026 14:37:18 -0700 (PDT)
X-Received: by 2002:a05:6102:6447:b0:6f0:3c5c:76a with SMTP id ada2fe7eead31-6fede2771c1mr5563901137.0.1780868238260;
        Sun, 07 Jun 2026 14:37:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fba4asm3293872e87.18.2026.06.07.14.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:37:15 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:37:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: iris: initialize managed OPP pointer
Message-ID: <gagvrg7gvmvlfhb4coivos6fh42tmosm7chkaevga3dylcfn6w@tqyag4ryz7cb>
References: <20260604000414.32530-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604000414.32530-1-dennylin0707@gmail.com>
X-Proofpoint-ORIG-GUID: 24lf0X-KjlVIbyC8Ma_XzU9pCM8oRWmE
X-Proofpoint-GUID: 24lf0X-KjlVIbyC8Ma_XzU9pCM8oRWmE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX88beTsF1r25f
 URveXJVHpEdFZKsbCsawizHOVKtDTa7ZCOnOeoAkAjhckIlQMyeFmq4hPYl6mPKL0YzhgdBJvPp
 fwhnXkmmnyVQtKrAr1UW68vLaA3Wc5BJqcJ8l6vs6i0WHHdV4BQUqQPV/pNFaGO7xPOKtw/JT5+
 s/knUYqWeHAEAac5fb7fZh1OvVfxscdAK6uLFumpOGJ40xlVfn0l+zuPzviY7+oJpEm3VRFQ6XT
 x1BD2KQ+YD/GF9viw0VSGvQgt9y1FmYoRGtjX4F0BIGvT86gPWaosxIYktjmlKvVctq+OPO6Nbd
 Q3vOUh/JK1ZbWfzpzfvf9d5a8+7CQPAkz0HNVQHRQ+fMLlo2yjI90GiZs9yWuL0awXbLsf4N6EC
 Bfh8/AAs3h8VdqG4VfTb0s1nFBEZTxbMGLsEGMMF6BND0HRsMz3PfYsDhi8RlnlJzTq8YAJ4cN9
 W8a5xhpA4KdTmxcOAnA==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a25e48f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=3bxjkcDNwcNOdMGgo0MA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111622-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,tqyag4ryz7cb:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C429C651B63

On Thu, Jun 04, 2026 at 12:04:14AM +0000, Hungyu Lin wrote:
> Initialize the __free(put_opp) managed OPP pointer to NULL.
> 
> This ensures the cleanup handler always sees a defined value and
> avoids leaving the managed pointer uninitialized before assignment.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_resources.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a..6b22f5cc88ca 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -61,7 +61,7 @@ int iris_unset_icc_bw(struct iris_core *core)
>  
>  int iris_opp_set_rate(struct device *dev, unsigned long freq)
>  {
> -	struct dev_pm_opp *opp __free(put_opp);
> +	struct dev_pm_opp *opp __free(put_opp) = NULL;
>  
>  	opp = devfreq_recommended_opp(dev, &freq, 0);

No. Rather squash these two lines.

>  	if (IS_ERR(opp))
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

