Return-Path: <linux-arm-msm+bounces-107158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJayDi91A2oV6AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:45:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CED175280E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B29C302A2C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45D92E2665;
	Tue, 12 May 2026 18:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzAw7VZL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7T4P+YX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08BD25B081
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778611499; cv=none; b=M6TfaZX9EXAOmXSKw8BH1z1N4g1GQMqaMO5DtX38gOdUcw1USqnnxE8llStGK1YNnqCGKLC+tBvsrHFCcW7zVI1PBezD4Db6nw2a5cu5QQImv5ueNXCbe/YQoS8vM8zWwG6cX3ShxmObAwgqw9qvjaUHgCLG5iYo2wu8boJVV9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778611499; c=relaxed/simple;
	bh=w9jfwK0+f/vZFhHRbGBmpO7A41zwTq2uOx0aQoq5UAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tmq13ZujwVYeVjkNrxwJ444CG5ish8NZj9oC5E/Hrb/9dAmpRMf3RdM+Y/wAq9WEUh8x+imJETG060za4M2Ita9MIQDqjiNwtTupMc+q8AjuY4K0kNzw32JDXM/XfGewmuQgWUJkknWzueR9xcw08bDtx05oBLhCDFIK1WImkdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzAw7VZL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7T4P+YX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CIbNAB3320938
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gPuOfWLF67cH+L+cXMufnwZj
	hUAG9rPE/F0J7fVYdQ0=; b=CzAw7VZLjROpoUiPcnhatVHTx7rkNKb7BG+17zRs
	EuBTJe7w8hqWE1uY1LuZAfRw7X5OJg4pqgKI9NapJB/jTOrbzqPTdaO5qJrUBabt
	2KPWXPqzp44FWdxvWAaQcjq7/ZuQRyaBryu5sZ2406JBfBVwg/iwldvLcrktiVml
	AEfHNM+LRe+ToDjFjUjDPDJQwSqNkFNRLKSs3EVMWEBOqxEu8o1C2n/i1GWyO22J
	8RnPGFKTGVd+osb9rrAbVHEE1gpDkJlcnCEUMqSjRtL1grqG6wWr5f0YuYleNlBW
	lQAu2Kv/0Zv33Meg5//hJiwyDxoKrtHsKRMAtHsGm1DCCA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1shv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 18:44:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6322654bb6eso3984987137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778611497; x=1779216297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gPuOfWLF67cH+L+cXMufnwZjhUAG9rPE/F0J7fVYdQ0=;
        b=B7T4P+YXY9kXtdlYzvaHvIdpgcqLpoaB4g8U01fh/pc7eYkOm1i5yewSYVbk8XE5n6
         NmKDJu1URdziHN+vpDz05X6HTo0qk2K5lLMhKm+xrnK9cNcVGg86GCB9/MRl2JIMoM54
         /kZahTI75bbiGWk+aIP3GWCTvBU96G+UvNXHn/0OwboHt/H71eX70grQI+8w/m0V1H5j
         Az7aVLHS+Z2DxAVeWcQmEQIjdBPRq7JcCPl227maGtpc56qVEjD2htNA2xWY8DTHxYJf
         mvGNfRDSE6YP8z+dQiPwg+FmhC9dUbmHHASRICQLUNttCph9IuRWnu0OPZ9Sk8hdkhTJ
         pAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778611497; x=1779216297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPuOfWLF67cH+L+cXMufnwZjhUAG9rPE/F0J7fVYdQ0=;
        b=CTgNDPQo0O9kH78JKgHNHtCkrmqX3ACoMSNEnnLnQgp3vLTQJc4ijwAhB+5cBh9981
         aVgJXtPd8p2WROiUDa1rEgMDIjLTqzqwYo+djqU4KECDK4RUE0GWTtadmoyTl2chPbVw
         WCR5Vju8xCsNBNyM07z97qCl1lJOmiQd7D0mbYEiadApz19piF8a0fxyOGvjc/KuCoWW
         /obpQ0w0Nsf9PZTC1442sWEUKUN8q2zk+MXkO2xeU7lflMolR6C2Lq6J0MkvcLk7AnOT
         ZAOF3rRKDtlAjzT+xz2JZRVxMcI2P8Pch/O9Gv3qMbDDGRqUPo9tEMqIFMIEYhR/gVWS
         Motg==
X-Gm-Message-State: AOJu0YxJyxVPtRPbBPWQa8ZnUSblw/hybG8IZhTm7aFJSjAUeHkBjX//
	63IoYzZzQ5SZIuplOeQHIWo92fmpNu+NO/2GpHhXNDjzZUmYiIGPb/PS3li+Ys/MnIIqp/V8fQZ
	A9cuT25vjwgXkN1TkNcsngUChXJlfIgmu2Sgz4HnKd+O9PJLNOPtIS7k7ngC+GBaXfO7A
X-Gm-Gg: Acq92OHoCmFi/AV2XevLDK2TCMslfg2oMvSKEBBbeHcfowbu+Ulte99jO+j+VEFlKM3
	HinY399ne21SvzWfX6jryy7Kvxj9SbqF7xwUz1kXi7geNsuBzSIqAx39BhNNIAzHMxujsH3nhrm
	xgfAFNahW1ww8qAXeE9qcL4arck9EdBkEzwHw8KDkCBYManiUkAV8L26S96jtp5aXU5uwmDON01
	B5RHHsUmjAFULrTxbtIUsa/kylbx9+NPxfg6t4QkCWlfrOJLnaGVAx+PbjEiVEpvJ0VpDNeF5PQ
	O9eRUMyJsHavwRN0qSD8k2drJfqpnsV8Y/6EuFtaJplBrkroKX7EVw7jOp8HmEH6DBykZKVbm4O
	I6d8Rg7MhSoxZ6s7OivYxDnRe3zUZ7YZz2MBTy+U93gpkagDh4/c+ln9D8fiTX6vwFnSYsIx1Ss
	ZzlfDlF89PAUMg7SpE4voygeogNwuXHNonwgc=
X-Received: by 2002:a05:6102:5806:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-6377445486dmr3792137.21.1778611497074;
        Tue, 12 May 2026 11:44:57 -0700 (PDT)
X-Received: by 2002:a05:6102:5806:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-6377445486dmr3778137.21.1778611496581;
        Tue, 12 May 2026 11:44:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95661e0sm3490972e87.67.2026.05.12.11.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:44:55 -0700 (PDT)
Date: Tue, 12 May 2026 21:44:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/8] firmware: qcom: scm: Allow QSEECOM on Surface Pro
 12in
Message-ID: <mqapa2jlne6jviomljpndtsrpiiove4ivyqhbnwiciih6njqs6@dzu7sd3wjswu>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
 <92171ad5e7851e6758dd205246b4289f32e12655.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92171ad5e7851e6758dd205246b4289f32e12655.1778498477.git.harrison.vanderbyl@gmail.com>
X-Proofpoint-GUID: 9vGDZxmUQIc4uDfAHu9EAcx8ozPuueRh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE5NCBTYWx0ZWRfX7s0MKmsJgOaU
 hJj4ITtYmAyyUch+Vhk2kx3T/7Zktz67OsXel4th2Mh0TvO6k7VpvXU4EXm4/pijie1mazlUgmy
 UjUqke2ik3XMbtVsDn+dyielSl4qa6C5p2tkIHU/xUGTSGevNHcPJsB5IZAqaVkD8pahZmFopev
 sBOIC8msn5AbC7kyZLESQR/O5Lb3Hnr/C9CxN72jC1cKir7DHqVbWPbDZ9fXK6BmsbXOE0RmeAj
 nCI0alEiqJScxBzAOTRedgVeAHAQy2RsvMQjkfpnG3adVQj6zhMbfwjFZN8/yfZjFXN8Km1npfD
 KwWXZekT5qDvs3umcJIyYNTcGaauTWdevFePSecAck5zrvetlj0aT/HEBtTbVH+MwCpa7iq2/gv
 wsyBLq77nMBEBZFl6w5jeNwLBSjjbw9nDZnSfpZZ1+YpZnhbsFhgG6YN3ovFbys8hAj0ccmBqwS
 6s/Hli9zQTz70voOt6A==
X-Proofpoint-ORIG-GUID: 9vGDZxmUQIc4uDfAHu9EAcx8ozPuueRh
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a03752a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=tyDl_690vJsCqHpIMKsA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120194
X-Rspamd-Queue-Id: CED175280E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107158-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 12:40:53AM +1000, Harrison Vanderbyl wrote:
> Add the Surface Pro 12in to the QSEECOM allowlist
> so that the Qualcomm Secure Execution Environment
> interface is available on this device.
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

