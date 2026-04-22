Return-Path: <linux-arm-msm+bounces-104149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHGTJn7u6GkdRwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:51:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E204448220
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A530307C209
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B470365A0F;
	Wed, 22 Apr 2026 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+lkRC0y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCGZ8qxX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4474533EB1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872890; cv=none; b=tmm+07DVge3Hn4lC1HJgB3CSolwaN8d0pEYO3Zad8/+5zOoyQ/QuyAu4ya0WwMd92dKZgma62BOjJyakzMsTdLgI0NNpm+7ko8c53deKEBn1uyODUCbO+/knm25Qu81KAAhd10c1K4nQELLvVulNYugjpJ1mvPyeW4w33S4h8n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872890; c=relaxed/simple;
	bh=wEB5bdxdIqtpA41q5FTiHfJZfJUrU3OaqnvLXnnAXWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRDwQId6VnvuQRhLRjZO1jgBo4HiKXke5C6OLCyWoaB74JoeUU7XSkTXl8S+My+2D8IwdCWoIehczyGtgZKxIfypgRCMYndG7HeFEdbD+bMrbX7lyxAGN11vLuMO8UkogC8/sFgUgyspCM08fqk7UFr+fG2YajvwSpplnscGzVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+lkRC0y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCGZ8qxX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFewbH1443280
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ydzduTyV0eTG/hO7P3OkxNIA
	rGuTrVWNHOh3wXzqnOc=; b=e+lkRC0yRY4nVHKKvrNdGl71PO+9WzFPh1B8Pemx
	ZcweNBTX7zR4cw4oOIPvYRt26DVi8cqYS6abpxeeCK1e5ShGttHVAyFco9t+nmup
	ujLk1Rz1LbGqFtFiQw5sBp4/w8MS/QoemWhu/YjkkcCGakLdK3phJBivfcyoRUUh
	sEQhY6A9e9Ju3J0MAhZes4EP5vocWVFnxON1C3C6OWj+7S8RJ23Zl+sFe5x1jlwK
	yZC1jM+1pkJs7z/pybjM8c+jEQvw7Gq5B4Q9U7+ii1HH/0oFQSUv3uSNqG2QJYyd
	gytI/X1txDV/NlZ7Nt6Vvb7gaun4DtaDWLnvtTSp4WJt3g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfv0me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:48:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e2592ea3bso61893031cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776872886; x=1777477686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ydzduTyV0eTG/hO7P3OkxNIArGuTrVWNHOh3wXzqnOc=;
        b=NCGZ8qxXrXJDA/BPbSXxVBxNpENAOxV5RZqcF9fmKzcLcM8cGng0UeJNhWI16ysf/Y
         1Ojfi06vTe2BR8jTaqxQ2PtvdQUaLctBEg8qrxs2qpLgaKZylI1oK3fiZ0XwqS+DZv5F
         tVLc/QJY0BxhJmdHyoB8eUCw+wLtpJJgBN36+2DueTzpZbShGCyN9P/rez2/NmA4QDhA
         r7J1qLnufjZwKYJeuSYpXmWXElEtpMouYVfh9Srt7sli4ksw/yaO7MHJA31jLONusRGp
         Tt73oDhJfSs82XuWKzt7IXQe6Sb1DYWWQFLiLt1yRHdoxty3FmM68e74Vs/OrlwbJ9tn
         ZEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776872886; x=1777477686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydzduTyV0eTG/hO7P3OkxNIArGuTrVWNHOh3wXzqnOc=;
        b=jW+wdgjTsWKENLk41A5Y3Kzz82AQ9VVmyo5oNHQwqKAGnT/OLDweEP+7cbvA09Lswi
         aOWnRJcDCmn/eXo2NEdveqVJml6I/gdXG0qHZ6yTMehn+6daoiq408zvELuJh2+d1VDA
         RDAk+r0HGcvLfa9V/hL2hwjD4lEwHUoWhBClFILl/WQ+hd8PJHbS4+JnvAhfzGbVp6tT
         ILp2YE6x0esbbixHGFv2K3WS6WNLFo14exopUU3ys8LsJp1ov6JrJeqa5XBzZATBJC50
         feBXIqpikTHIxPpCO8GFYA3vEisBE8dZJdq+zFuhoEz+PN/KtQMalcNqVNvFFrgrlxTI
         DGkA==
X-Forwarded-Encrypted: i=1; AFNElJ9xYtDSLKt963Y21cK1AXpCFjUdVJbgESmMsVecjcowHdevxRVUdJeVliE9DwveGVdZU4xA6glaLCSPDAq8@vger.kernel.org
X-Gm-Message-State: AOJu0YyDH4fAMdD9Y2/QmhIOdxqF8xzZjO/L2bMb3p2DgnXKIh+1NSGF
	xeFPr/FStbWMrByDv9QlWFv/CIYXLckl/sAP8uznTpBDqKWSfOUvU+KwXyGaQtBR/hXGmMmaC2F
	PVy71AsWUhva2864RLQ0Tqr7TWZGdIJr7bikINWKUG+JCFIuolSdcIs40hzfT7sqXvaS/
X-Gm-Gg: AeBDies8EK/IiIwji+WDmMod/nSzS2l+SA6Hzu5wte3pSjMIHtVjVq6eKCLmomYQP6P
	6CVwgpMipjrJA9yszKUw73gHg5s+08LBKZN7qsxZJWFDQmNOHlsDAkQlenJ8+lFbf+KwJBf8Ojv
	KOsciMI9INj4N9j4AGOPjgT4ENsRf0+LE1JgrSRAHh5dpMQbKv6DDWcYWNHt8ee9G5uf90Q1ago
	QZ6IywSynEtslS1P/knX60rbHpJj3z+QrTWEATo64xa+tnH7HbXmwQFW+gPCeF9nU6GNML1V69Z
	o9nxzGh7T9fzrAgFRnooftdDZPNNcPuUCZo9p69nj1GbJyYvWgmcRYyQAJMYXURK/WRlHgxwVbX
	5RIzTUJ8M6NHWeqkWHqu5LmsF9k8uJ48BZd96M2ngnVx72KhrZJ4KvmAc12qro9il4rzjFAzFDf
	aN3Ptl/qTBlCbrHDRQiduQIUcfjTtiYIM2xI0yLZ7BW3cb8g==
X-Received: by 2002:ac8:5dd1:0:b0:50d:6baa:9e9c with SMTP id d75a77b69052e-50e367ffe43mr324747761cf.6.1776872885971;
        Wed, 22 Apr 2026 08:48:05 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:50d:6baa:9e9c with SMTP id d75a77b69052e-50e367ffe43mr324746971cf.6.1776872885335;
        Wed, 22 Apr 2026 08:48:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad12asm4598567e87.1.2026.04.22.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:48:04 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:48:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: Re: [PATCH v9 1/4] misc: fastrpc: Move fdlist to invoke context
 structure
Message-ID: <wlohwqmz6iflmxkkbv25z4xwa5jv4xgxjbwvckiyunnysea3hr@fwjl3ueblrw7>
References: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
 <20260422092409.4107093-2-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422092409.4107093-2-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: cFcLVOr6_xxsufUEVqJZugCt1kMb9Ter
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e8edb6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=P9wsaLPykV-ZOCfS800A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1MyBTYWx0ZWRfX6A0/AI++E8Xa
 EEyrxpoa0a125XXsoILP5ONccTiHcGyFow3W83t+DToJaF9MGR/FZyMMyNa5mH2dJEODvnCMqI3
 CagHVUEhdm1eBoIzk+RgkLzYLVc1yzPFo0ECffoHHn1Wrxlu8sLUZjYF3jaq35VfI/X+1OKoKh/
 ME3PIAf1HNtS6YGP6KKGEe6hPJcPCWTvRULKfREewNBiVlAyd94jBRT6+N/Hyp06NDD4If2Vl3R
 SVhGgpjnb0NAG9s5VhFMyf/t7MqZau8l+fB+1P7rij0jrY3mMOel82hgHkpECKU3M0U0oBId9Sw
 4QkDSgku2uxC16jiv8MM5e1BNhuUOYDyQMiUU0xDgPoJ8lXYEjViLbwpSM+NJDev9S4X/xLjFzF
 uZtcIw7iXIhQA/ttXel2W8WApn1a4hAmjCjtoeLt61lMMjP6ReCSTHbu6jhAk6D4ysvF2yUEfvC
 GGVCP04+4ctic0cE7Og==
X-Proofpoint-ORIG-GUID: cFcLVOr6_xxsufUEVqJZugCt1kMb9Ter
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220153
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104149-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linuxfoundation.org,quicinc.com,lists.freedesktop.org,arndb.de,gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E204448220
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 02:54:06PM +0530, Ekansh Gupta wrote:
> The fdlist is currently part of the meta buffer which is set during
> fastrpc_get_args(), this fdlist is getting recalculated during
> fastrpc_put_args().
> 
> Move fdlist to the invoke context structure to improve maintainability
> and reduce redundancy. This centralizes its handling and simplifies
> meta buffer preparation and reading logic.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

