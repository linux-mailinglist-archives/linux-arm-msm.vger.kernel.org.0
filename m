Return-Path: <linux-arm-msm+bounces-102815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGx3Om+a2mkC4QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 21:01:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DE93E163B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 21:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E62073003E90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 18:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886241A5B9E;
	Sat, 11 Apr 2026 18:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ng3Rfe2R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcqItvnY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F783B6BEB
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775933978; cv=none; b=KGxdY52GjIExhyVK7LTG5R8zKIINtmc1zXdf3DxEYKyJ7mgMs2ng5wR5RjLqZ7fYKmNeJ/yoREa3Jqg+F+dwMx9kbCfi/sbGNHyuXMCfAd2PEKTcfCt7b2BGr6P/CMEI0oMlDwKz3gtRusMwXWk52UBFnLfnzKkra51+rbph+WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775933978; c=relaxed/simple;
	bh=VqkXgCRbhgHq+YUHyR3oCC/H109NJsnzEcSJjZUW5SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCxtkA8jsu0I1kLMkSLO2W8XfBsuwCaqF1k1JCs/Hk7v9m+2Qzn6lqxgIUth5b9C+EzrqIoDmYwGYAnyjB2VRs6lQAPuk76mZi4JJSTVu4dOuIrkc7QP6/E1ZGMtPk+Vtb3I1hR0VzZqiHzVnTQjRPmtuJrdlC9H6hryqeLav/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ng3Rfe2R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcqItvnY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43ELX621067
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yMXwJeOoyMRoxOqiohaIY1c1
	Mu6lsh+DPObO7YT8FI4=; b=ng3Rfe2R9gVk+AzSX8qVwdlPap4D5Q8oPHAFZKzQ
	YIiVOFuVLgcu5SIG41FS7z16jnGyXeeafXzQ9Xgx+cHVbNpb3OG7jHRDTdD5+Fqb
	6qTW0p4o/XnLdDMtbQH53gVB+9NhUBaQm+w2Fw71+fl58yOARFcpN1ybEncP6XdV
	Hjm9NMpfP55A7HmGuDCcnTmOzjyCdnUR1I6cCxeqEa1KovVjns4pJHOL34FJbXey
	z4CkIVqfDb8D6mbsjCkbC62pMUHO70yhIG8DACN3aCMtnInumCsaxcjHoNEB6mJ+
	8ngbrEp1F/dC+nR0a5mjqSrcYdtijiJZQLAMS6zZvTdkVg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfs8fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:59:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8ed08aa4so5939191cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 11:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775933975; x=1776538775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yMXwJeOoyMRoxOqiohaIY1c1Mu6lsh+DPObO7YT8FI4=;
        b=gcqItvnYwQTp469zywArFBUYOMclVTrYW5GCvBiDbWoxplwFZLjpPF/ZhGneu7NR0i
         sCTpsAVNpEvPvDm9JmDk2hhowjX8IgZSj0nJJktN/eyPWpNo5nRbGDALgjUHQhpXRNwR
         nwGdi8C3o+xSt7xQ6dJtwg8Z5o6t0Y5I1cTd9S2NJfsFrdK9hGugz+cThCKFFo9PZiSw
         PdhC+sQEOulJpxYsvDhrsv1qLxxhP3O9taXAqq0ze/fyU2iQ9Fp1+JAr+ZrWtq0+yr5E
         bh/hhazWnBBjKxgs3c3kHC+2mOABNfHHFngdbSaF7nM8Y+oKrwMmT46uJmyn7UuaqmUr
         NSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775933975; x=1776538775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMXwJeOoyMRoxOqiohaIY1c1Mu6lsh+DPObO7YT8FI4=;
        b=hSi7nIHll4cbOzD/4UQ5rzV2wc/UFEUJcYMdWDWTJa6I6Zf0UMxSB2J4Iv8pr9tmbv
         EPKWv0k/Oae+EakpbZydBXorNagk9YbfEhMQ/vlrQP64EAPH8NCYwBFjcAX5mJi9z1i3
         OEH0yRwS2Rfnd1EaLKRTDQxCb/2XHSByYgmJMTFD92Ke5aiXOJ+pLN8RltX/f4K0+BMU
         4BnTEn5f3PdDy1NhcTu0qyk7oHwvHQYwNWEx32Fz2rinXL4pdIsNHj1AyG4MIXI5eW6H
         R3A8gYKk7ewTiG2A9L6u8asHBcme0h3sazLXccDlSHM52NAiOR+gV4VJe/4oq63d9rMJ
         /fNA==
X-Forwarded-Encrypted: i=1; AJvYcCU1aRLqKoa+hmAE1vdHsbyab0IUUM6qehjjMdONUIi4h6X4iSRHt4nEFtYQ/Bap+VArZNuTS+wLyRX0K7BS@vger.kernel.org
X-Gm-Message-State: AOJu0YxWlp6OB9SmlLmdMNL+z3tAMjQC7VG9+RfQ0UFwgEQ+6zB+DuVE
	W6A8Kmhf1vGQNAeD32Qf7CHBFg3a4WdKK942Z8Arhs2+NPM4Q/Wuj2wFIhwNSRuHnCY5oT6uikC
	GlFZDGjA8f5vanQxXIbEb0GYWQ8n+UeDRveWs+XKUzrWIuTo5DWPQKFraFYIAu6BTXy2u
X-Gm-Gg: AeBDievCWVoWvAJtsMsPHK47DEj8xd+EXzvAKrfV0Vfp1OzUrd0P4eEXbkrsknF0qpL
	jGEl2DPwlwnlG6FJN4DRXYv11fSHGto2eaScxC4J8G7O8a4K3ajb+FCX5lXMQ5uqeVjyIUT5WJJ
	/uwmug6E+FaRQB67V3zbRsshtDlPNcaYNPnysO7SQbFr4rByZnIC8UKg/+HqsRaRPbGGui23Tp0
	TmhEQXm6UcW5cJEp8P6EO2amrmZfRPJ88F8UEMZDX9t9AgUaNJgdtUYA/7QZRaMBBVPm5Af1PRp
	A+3/ID9pxYUDDdlqo+0XM99sjm0mPBCpp1HT+aFIbMldYBcPv6iOZuwOItKLDg5iXslDrFFKgUR
	pnmjzOCWlt0Ht5824pMBHviaYpNT1IEc/8trzHJLfcAyCgem6ABV0CavXl46V+3ri5awtDEwHwI
	fOqsc6DKxPnfnH/zYqTFGpDh9ZnTdV3X4KYsk=
X-Received: by 2002:a05:622a:7508:b0:50d:a8f5:d521 with SMTP id d75a77b69052e-50dd5ca7688mr75567291cf.57.1775933975602;
        Sat, 11 Apr 2026 11:59:35 -0700 (PDT)
X-Received: by 2002:a05:622a:7508:b0:50d:a8f5:d521 with SMTP id d75a77b69052e-50dd5ca7688mr75567111cf.57.1775933975205;
        Sat, 11 Apr 2026 11:59:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e492702f7sm14351681fa.9.2026.04.11.11.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:59:34 -0700 (PDT)
Date: Sat, 11 Apr 2026 21:59:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 19/39] drm/msm/dp: Add support to enable MST in
 mainlink control
Message-ID: <rovdbbjvreo4mreknmkxexiqemb32v22zbclshf7c55etrjd7d@iwtzfdmh2uyv>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-19-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-19-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-GUID: CzoZZffYBq_FKb5x8wjTIFD-aYReS-xa
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da9a18 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=HaRW5ahlYzQ4Xp6BNlIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CzoZZffYBq_FKb5x8wjTIFD-aYReS-xa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE2OSBTYWx0ZWRfXz7Yn3A2C+wOE
 fGGjHu0MTSYJKFFX6HwewS/CoojPekvYRRYBgQuKB5GKT1IeWNBEVjik4yhqCJTLTxq6mULsw2j
 70gQydoQAaHIVpkfta/SKWgONpd6+MsHhqMp8vwzfxicc/vSXpP36JKshuLgPHww8cXqO5ifzdr
 cWgF/Y1W9XQGGhJAu2dMK0KSuQYtwYC4PjDxVnxppbNGrgoiiroNeWtz9Chxq1ol+FrvJx860Mi
 7c2cZUfAwylGbvf4Ft3utiRZoaRpQRSjrwlDX8HTKi9gjyvwEYH54mwhIhcvqCpGDCUQRjmkvCu
 Yto6atQF5bzKQJr7SrlKUjmUTNxvXprs6LtzssdB//UaWofR3KUG7Ehct3KhRKY3Y3uVNg6VMHY
 RgpWLmAMhUX3F2LO4aAntBIcBlOfvDV+mJyuvp1QOOXJ5xkYr13V/H8d0PgzWX1Io8Czs16tmmy
 iLLha0K0nS8OlQ1T1ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110169
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102815-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E7DE93E163B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:54PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add support to program the MST enable bit in the mainlink control
> register when an MST session is active or being disabled.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_reg.h  |  4 ++++
>  2 files changed, 21 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

