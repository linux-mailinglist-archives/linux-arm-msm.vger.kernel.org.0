Return-Path: <linux-arm-msm+bounces-117639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N/FhKvtPTmpbKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:26:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 152CA726C91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:26:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a0y8Jf6S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kj1kKOa9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117639-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117639-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13EC930120FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12C730C16B;
	Wed,  8 Jul 2026 13:26:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B416523392A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:26:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517169; cv=none; b=je0ZAWShFS/Ozf9XuST8o2I27xIoUxlAVAAElKOAPwn9M6s9bJHvHK0zWQIeXBbtYaFu2N4usm/ee2rIdRYpPAUITZOPtg0Fl7N4fE2RYIeaTxuoGiuviFqnfJVhxjl1+vX9Mwnxhwm3tFvQy5tCBRWJkiZHDMBl+xHgaI8RRMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517169; c=relaxed/simple;
	bh=o9uqGovHhrlEqeaZdyL2OR0Evb+CE8u/OGNRBj0uDGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTHbmeJyXDYQAmKTrdg+lAcDHKnbFGt2OcAOvC6c4FLwoR/oGGytoHTV5h2Gx8WXMeDPjtZguB7+rX/iZGHnJb/vC71Tu8BKyW00MCu+TSNJw1plG2oPGYFzUOJNolMIv6PqQ4IDKoZ1N1frtvQ5DkD6HQbqds/Ua3lz7IavMVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0y8Jf6S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kj1kKOa9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3j4t2715617
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 13:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lmMP11JfIfdzuQv/xaCabcqR
	nVyTBMSAMXAc7fCTQk0=; b=a0y8Jf6StwKpJloQFA2jZmBUsRCnIFjkZzYeEdxl
	fmh7UuQ/Co/q7qxl+1oSXqWFPwxWJg1Rc98o+uD+rjUPBX8iIawNT/d2yO+0poyM
	7LTgGL8C1y3hSS2761QVPuoVlrYbhvzyxupfz1xgQB8heLWSKMKOHkARdHn5xPoO
	x/irooOxTaEXquZFnYLN2FzOGVaY6SxtAkHNeGWF0Ah046UqwjE7JEuSJEO5POaO
	jxMR5alTnOq/8fWbTJQsU/EgQmPu0ptGiFnM0ceOSkYzwi2GlQD+Dv48fs8CxSdV
	Hal9K8ueUwOHGHkyyogDctbNR+NUqm+egTjDwZc8K6g8hA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd4mhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:26:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e7890eceso80499137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783517166; x=1784121966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lmMP11JfIfdzuQv/xaCabcqRnVyTBMSAMXAc7fCTQk0=;
        b=kj1kKOa9dF2NYRS8WQWx6dnbH68w3GvRMKGAkRJ15exSCJ2qNIK1KDRMj5PF489vxi
         ipUns0ZDqffDfSJXJZAi/RKymmIKZ7CVEI6bQ3ZxbmI1nEOY3701zTgg9hHl3vxM1UEP
         jBRDgcVNVMi5pA5sIUvE36Uy98VeMMbeQXi8lzu7/Z5wtnbQOf7kFrT0SkahsPlhrdC7
         u2HAnssqpOz7JV130doFSS/3yAlWLWYPmjeYrc5nV6F+8eh7NsRiMRFOd9Iqn1pBmTxD
         zb3bI60AzwlKmOgROFznL0x/oD56X/uMiNAck22K4eS16a+TXdbbpmvwsQdC6F/q94nW
         nO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517166; x=1784121966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmMP11JfIfdzuQv/xaCabcqRnVyTBMSAMXAc7fCTQk0=;
        b=YhkWC/TCVqur93zO6DJGvjAy2V6nV3jd9Mz9u66ocWvIcLfbch366H7r5gst7gQAkq
         U+U2IY3rLBDzNVgh8l+QDfAv7p8+N/ehlDg3SCWM2pMt9nEOzTn09ZazqwJwaWYW+wqu
         BG3y91Sb1Plfi0hqyjwg1DJ8oyqlif3LCtMYuGpFRerobB5uQaGR2jkmoZO793IHTw3Z
         HKBwNcNgaEKnKNfqs4QvZMojsgCbMxNgZJMfUN/uujpHhXvoOv1/znGz4+A+qDE7YTIk
         zxEROprk3wUtAqIjfBuLlMIsQmRbj22IqnACLZxF1i0Xj/eFZ6XbutxFd0G0yep+XcZi
         EQsA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1ID4AhGt3CPYBhf8cStPa8UT1O+mQq7m+K7hdLJurey/c+c+Ez0gjsaSFZM7ys1z0DrLYTxEvogExyUal@vger.kernel.org
X-Gm-Message-State: AOJu0YzaAYka2qyD9TrBF9W6E05g35GVtBRsXdxQz+CBZ9zx87TpfJ5L
	wmTPSOdN0HqFjbdf+mXwwXiRXL4ZQz3DJktIEtca6eGEAy+AdUeR6+86uXsKyTUIWXKPJOJCwam
	bfcf1q7qV0p9Fvxebmpzb2U2rolbShvp/Nuv5bZU3svnLcN3rWF1ZSJj8WMFcG3E2lxZK
X-Gm-Gg: AfdE7cn9oRCUsJb+pvf3lOsWEZZpgO0k1kJvRJI/lvWg/LwffW+xPGUsaZW6sEXA/Ip
	lK8KKijomwXktK4iUauMq8dODlOWHPt1wEx3kH26ZOeE+sYXXMJsxHVb6YB/F4CLCKms3r8Xilo
	qTt07k6qbYL+83fwV0rNL+AWL4Kh8Iw6yB1EkU8DwWkgU6z7Q9KutOximrtaj0ZwIR80jd1kL2t
	+chFoph0sIyaaRYZSiY8yXmydkywrJl/FXB77zXJB8FSO4SlCW0lMGWE2u1ZoQp192n+Ru5/r+c
	LNZtoTy31fGEodweH7oiz5Vqc+X8Pr40gAFVOu1rLxzzhj3nYGtJmxiBA4DRAqMyEIbQ5JVi1o4
	u9XxFMJm1LFuYQ8ebTAIrQigtYebROILRlOPVV108eHyNK6PYXXRR6WnNB/k8Lf36y0S3wcVaAO
	D52oC++iWpGO5s/UzWj/dpweAA
X-Received: by 2002:a05:6102:370e:b0:737:d2e8:d640 with SMTP id ada2fe7eead31-744dfed04c3mr1144594137.5.1783517165867;
        Wed, 08 Jul 2026 06:26:05 -0700 (PDT)
X-Received: by 2002:a05:6102:370e:b0:737:d2e8:d640 with SMTP id ada2fe7eead31-744dfed04c3mr1144572137.5.1783517165338;
        Wed, 08 Jul 2026 06:26:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c1c4dsm4460901e87.66.2026.07.08.06.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:26:04 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:26:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: guard sequence change packet size
Message-ID: <5uu5k62pcweeomqnvna6b5rpfhfm3vcllhhkhkxk7bujj5av4u@yr76dhhmcbqq>
References: <20260708112333.751480-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708112333.751480-1-lgs201920130244@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMSBTYWx0ZWRfXxUOQzhKmmeL7
 3yzdDrpXFKNbJgcnyeHVQmJtXCnQ8p6HqoSHdtg4rQFYuTi55J5ZZqdg8r9/4W5lFCmRF8e/YpM
 5RdehijlQskfNd11KEe2OVpYaM+F3VJusXPMaCaLN5cKY9Wt8I9Iubyjd9bMAtTjJHKcdqjjfFk
 +KcKhdgC++CZyLbZxGHlGWX7epmUAyUztqZ2nUaBCoSR5H4QaQPb/Tnsiq1ZazdZzu9n39P/ENt
 gOjP4PNGVxV5/TVc9bghzLbSusNv3KhbjIEXxb70XKxfaPEqtabtbZ/9c+5StKgTWOLF3YLfhG4
 oKXyY8WW3XGDBbjkFh+g2s9fy7qmbxcc/eCGKOskUq65fnLev/vwY0Vi2Jf6pSHWqrjutRmiII4
 uyTOrw7MGwE+0J0W34Z7y2eOnAGC4PMZLMHWptSDRKwg27A9y4seL5GqLxQhDnTRJX06EjUV/oi
 QZUggDKkRgjdYzDWxvQ==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4e4fee cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=RkvSwIbE1DNZAbE4hAwA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: R7l_tUncebW7hya5DbKIPmJJWk6tavs1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMSBTYWx0ZWRfX+CE3BOA6twgs
 RFQd6xY9TrgtJA9bRyFAo/0SqiauB7fVD6gslUXPtNM1cAWG6veqq5lwyunkv2jMWNTHWWt8l5e
 lN6HPlTnOP+3rIQ0x/EKMIXo6dKEtm0=
X-Proofpoint-GUID: R7l_tUncebW7hya5DbKIPmJJWk6tavs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117639-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgs201920130244@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_vnagar@quicinc.com,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 152CA726C91

On Wed, Jul 08, 2026 at 07:23:32PM +0800, Guangshuo Li wrote:
> The change referenced by the Fixes tag added remaining-byte checks while
> parsing sequence-change event properties.
> 
> However, rem_bytes is initialized by subtracting the fixed event packet
> header size from the firmware-provided packet size. If the packet size is
> smaller than the fixed header, the unsigned subtraction underflows and
> rem_bytes becomes a large value. The per-property bounds checks then no
> longer protect the parser from walking past the received packet buffer.
> 
> Reject undersized sequence-change event packets before computing
> rem_bytes.
> 
> Fixes: 06d6770ff0d8 ("media: venus: Fix OOB read due to missing payload bound check")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

