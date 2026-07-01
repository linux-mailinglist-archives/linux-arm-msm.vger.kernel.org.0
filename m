Return-Path: <linux-arm-msm+bounces-115709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pVYZB9kbRWqT7AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:53:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5296EE62A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:53:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e3W7hWLe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q+T5oBtB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115709-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115709-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D24F3314F653
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A83481FB7;
	Wed,  1 Jul 2026 13:19:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA3192D8A
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:19:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911989; cv=none; b=WK9WCvxTpRkvoE5LnXqEIksk7WlnimCgjU+SL+SoGgiZuTsOEApajX1JS+/F8rYXZ0ltdLtNEllx2QBgwF65Rrzhg5l+JXHmKYLujvJwckyJGWV3xJaD/0hOWtq+cWeue+DC/YnzL087yc9T6vQ8bTztAgw18oCnPykF++bZ01s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911989; c=relaxed/simple;
	bh=yHg+jKMCeR3f+oFJayrpB7b0HiAdeVXxWg+otst6vwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQ+L0Idc894yn1oy2tb4FsVDYYd1IyHS7h3y1u5YQQMrSy7eTvlFMpUz0+uE7JsFnP94jHtJoN5gmKnljxK6/YAAJvb+zp9QN0inLHjJ5m+Uf9KqeB5jqDyB1vdZwoiMeW0LjXydOUcnekNHmmI/wW/lN6cBAd3dsfAoi6mHCdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3W7hWLe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+T5oBtB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A9Edj756540
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6dtAddVQ7SscvtqUq3m/yLlq
	WQ8xL0pYe25I93AGMlg=; b=e3W7hWLeEyWHu4rYdj/QtBIrtNAJMLoTnPpNn+QD
	sFEW9qg0Qa58r7E0ERYuvvqIu1B+nfFUcEr9eHxn8zVnHyEfzQRZrc/JhVAuH2K+
	0EJbYwUrz1lLWdb2ozYYeAwugvv1KH+JO4ppKh14WRllBICu0UXOOHvbot6MddT8
	spK13ai/8u9Cx+DQc4cfJFuu4a20x2ywcbBLqmiyeBNC2SxpOFU5OFPJBRxZmnYK
	90FPH3PWYyXm9Rk8Ql2W09LBbO6J5TDPX92e2njAYRCcvnjQRtbfc75FPesGNYlW
	Ju9uwTfcUmmQdub83Ad9isb8jIS4w95h9iX58dVzchtlng==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqrtxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:19:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c62861b3bso2230299eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782911984; x=1783516784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6dtAddVQ7SscvtqUq3m/yLlqWQ8xL0pYe25I93AGMlg=;
        b=Q+T5oBtBDDz5osPPQBF/WEnWTTZVeyWaMalS0Jvp7Mn8s6KIUK2mqcospOGevouANk
         qpogRyYSQQxsv964nb3G0x4Kqr+ltiAYmd9tBLCqMqi3BHkDzmGQi8JMwalZ4OAd6caw
         k3i7D7HhkVVYccEwk+HCHBAex79rYfg9ypxWo6U7vhT9WhmbwYn+9ofLsMmDq+GtWlmq
         AOORkdhhHMwbw78x64VadGCqpDXOwSnkRq7sHtrQk4wcq8Q8njWlZcsYs2zLq/3QcTTo
         iNTmH0yiI0XgyxuwPavWNlJMU1S3mPLLx/fsXXZJhK/mZ7FVQ8iDm+/nIvGPDMAftPS0
         GhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782911984; x=1783516784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dtAddVQ7SscvtqUq3m/yLlqWQ8xL0pYe25I93AGMlg=;
        b=lBK2H1xdNRFZu1AbJNY6ktQTiCPOaZbrQVcAA39r3qJc+EKXPSv67MNNu5EdnD+ZZ8
         /ZkyDVZdDbDvg4OHHzxSUdy7JBP129VT7A0VXEfOzQCZmRlQxreDr8R3cOn1HC2YytUI
         rszcAKpRcDls10aJOL3MdYezXQmh+61sTgIRZ3JLGhK1OgYlNVXWnxdoq0kbrzVybSMN
         wGM0svjUAZIFB9WXnKEQ7RQTCzGH6ykUcKuGbb6adsxaTkZOOIX4DzsEBgod6f5c+wyv
         cyoUtVIxogiYKVskcT46radDZ7dBQb6CR/QXpdRZqPboNCG/lC4M05mlQvh3a9tadeak
         h5Cw==
X-Forwarded-Encrypted: i=1; AHgh+RrrLWfSrsh8NK3wJIR0K93HuIJsVOMz61v6m8unPrnDJm1UXIx9H+YywROwCtdCkTAlURf4R+cbmxzSxkhN@vger.kernel.org
X-Gm-Message-State: AOJu0Yza93PFPLGI3r9F+PR+qUkfrvh8jeKC0PzYMSMsJXf5eHSltyMN
	rMpn5xkTufnAWtIzSDWk4fe7cX225bmht0Tk4F3kU7VI19Jai+uNh2dFRnjXOAn6E8TMAvEpHS3
	32uHqtpu64VCWsIWV4bw71dtvUazHFVm/bbTQlFLDtq7F9GaeG3LD1+ponpxigdv+M9xT
X-Gm-Gg: AfdE7clQj9eRTWlFP/y6VMpEEwLfMct5/raXwqNWyMuJA1u64+P+oT2JHNl8ZvDyB/1
	Ed7rkdfhtB/nCIDZ+ZXn7pmXW9zFhC5RfZpv+6OFbwmwRVK0IwA0H54Unqkot8VIWDPcLdLp1BC
	E4c56zhK5xuS+9EVV8A0lPoiuoafNph81p2OmdmyiBGby9k2LRvqm1XnW+87zLFHvTg1cOgXk+l
	UssK/kdEAWbLG1o1ZblCPFfxYl1tj6mhtSxajiAdaZNrDVqrySrmwxfIyloudZeeIzFWAWbBQeR
	iidMAoECr7wD+PwCc1odGDO1chhTRFtSzoQOsJteDZS+4ErER9o/Q2bSXkeeo6DFeArGoUnfawS
	Ccld9eJRsYk+dj5NABwBDCcpOp8K9zP8fjXNOVg==
X-Received: by 2002:a05:7300:4356:b0:30c:71d3:dc6d with SMTP id 5a478bee46e88-30eff2ee98cmr2166726eec.33.1782911984414;
        Wed, 01 Jul 2026 06:19:44 -0700 (PDT)
X-Received: by 2002:a05:7300:4356:b0:30c:71d3:dc6d with SMTP id 5a478bee46e88-30eff2ee98cmr2166664eec.33.1782911983601;
        Wed, 01 Jul 2026 06:19:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee31da9f3sm17525999eec.22.2026.07.01.06.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:19:43 -0700 (PDT)
Date: Wed, 1 Jul 2026 18:49:37 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] soc: qcom: llcc: Add configuration data for Shikra
 SoC
Message-ID: <20260701131937.ub4uzpixlmm72es4@hu-mojha-hyd.qualcomm.com>
References: <20260630-shikra-edac-v1-0-287b3233241a@oss.qualcomm.com>
 <20260630-shikra-edac-v1-1-287b3233241a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-shikra-edac-v1-1-287b3233241a@oss.qualcomm.com>
X-Proofpoint-GUID: 3zHyBtjMRwHk-qBI6ae91fo5kZ7ggVnX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfX7DOJdEgSJTB8
 dvDMzClFEp1Ea7aX5BSs7OBIA7Z7vXR13YWZac8X+TBi8dkvURMT71k8vVVjcgrOtIpEowD6umd
 slXWlU3LOLfsSKQk5nyqgorRSurnsNY=
X-Proofpoint-ORIG-GUID: 3zHyBtjMRwHk-qBI6ae91fo5kZ7ggVnX
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a4513f1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QrO17sWvono4c361zqQA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfX/c4QyhAt3xWz
 2BOg3sa882nGF00CHS/AKXXa9U288b0G3/OfAbuW6SQvb6TjFESDEggvSJ1YXjlNxSb+XCig+/K
 7a6GwI6UsUnupooYJlVkuFujOTTGbsSkcBKyFc5YISoVRcEpAXJdSCJvvmsU/RvsrJSQk7dr2v6
 QsV2qdGR1+PBXqt/CAB3dtzkNbXfQfW3Kvh3gZo1KdU1yM7KR0LZ6TPOjfsz8OueEddWzCxqiDQ
 UGfeZRNoNa7Jg4amco7hz7QDyZQpr0mFY7oC8hNB6yGyDO8vYdcg2FwDUlhTR45QBfNbfJZkMhW
 XTm67xzjgtJD476w4Amj7JBHfIEQAfr0QyQh6256NMSMMGzgI2cLjdDyp7r4Nrz2RAd3Nfc+JUN
 jWQer2JBmDmDuQqka5YfAe7FV+cjd0b4ImonBXGvbMjJ747DgZYxrSi27isf/I25TlUDeLT8b4E
 Vk6xQoKUvGs7pgdu79w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115709-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:faiyaz.mohammed@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,hu-mojha-hyd.qualcomm.com:mid];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF5296EE62A

On Tue, Jun 30, 2026 at 06:25:09PM +0530, Faiyaz Mohammed wrote:
> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Add Last Level Cache table and configs for the Shikra SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Sender of the patch should always have their sign-off at the end.

-- 
-Mukesh Ojha

