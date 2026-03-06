Return-Path: <linux-arm-msm+bounces-95901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIb9HMAHq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:58:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB66225932
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0024F31E5ACE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A72C3F0775;
	Fri,  6 Mar 2026 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lol5ATvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4RXEDeP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360C13A6400
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815840; cv=none; b=RqshZhsEhFi8DSrCj0Lg3a16qrsJmW9EqgTEll4gsfeGoL9ENDP3Fw2qu29fpkzWbld410wxuV8zZIsIb2f0TKtwKgmeNEO+LWCBibmcPPVuWXGBPGX1Yp4AXz/eatWs4fdDTFbb2xk+8Hbx0XK2bGq139l/+Ghbc7jJ6Ap5VUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815840; c=relaxed/simple;
	bh=gt8cyp3oNntLrgF4lv0BfJzfpsu87mIlnS7YEdz8JjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anJo4nUcFFUiRRK20ZbSNwR7rrZop1/o6LTxCJkE+tSq4DLffTnVDflwwZlwoQPUdu2XBAr1T6ET6nNILq5gIaCqW54YA3OTX97b5i16CTCiSDwDPfWAZnaVdtfW499h3Nxg3STiC2cwbiWuDbiE6dtimBFftpM+Ucv/qeeDnPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lol5ATvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4RXEDeP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626GoLdp1554832
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8vR9O1h/aF8AA1o37Ha5hCLF
	r27P3n8CHO3krh2d4EY=; b=Lol5ATvQ8GJoIGBKZ2XL13njLQrn765VwtWjMKz5
	IaBEjqNHJ5OcE6JCJhYaodmAhBjNmKwNkoZH2NkUOuDkOKYCQZ3pbae68FeWLrCi
	RMQ4daXgM58X7NZOd+kTewKJfkMHjZlS1yq3HFXDHBHIytPMTjsJddPVQKi9N6oO
	erVJHZbclFsJkj+q9e7YfpAbTEKXXROiC6OTT6PZUXa+z/WxoEmOAcFR0tNYikey
	HgaxSPW0bQCAAdiWG4hTIgzBscizPsAE/ZCPg3BdvnFiWrsdLf/Yk10DmNkk3tS2
	DnVzk1EIpmrK3ijKzmVlmIxUV6FP/nQsxlvSot7mx6SK/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5t8af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:50:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4d191ef1so1259137785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815836; x=1773420636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8vR9O1h/aF8AA1o37Ha5hCLFr27P3n8CHO3krh2d4EY=;
        b=M4RXEDePeJJV0EY831cjDQYQsTQ4RN8VixiseI/W+EEGKaLINMuEDczAm8awuZMRjm
         GYC1sUfHtvvgC90inUWRoYsGy/1iCEQrJjveIlwYlrrAyQHsFlTbqvI8y7N2FSo7rejR
         HLGnw0ZyroF14plkrvhAU9BI8PlzbVUJfsZWChlyjPYqp9LRirjmdx2YGPLBcnq3B0gu
         XWJymrIrm7ROpJNMEuqmEohC/6jPbzlQSUEpN2AMMlSOM1O8gqZpHmjuKVOkRHBJUrjE
         YQXr/Ejy+AYN2OQ29o/YLqIwruVCZ5d3bDQG0jDFCC2K2cVeqG05nLBIYHUXbLx0odn9
         pJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815836; x=1773420636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vR9O1h/aF8AA1o37Ha5hCLFr27P3n8CHO3krh2d4EY=;
        b=DFmE3xKm3ORhYI4Fat5gsHGXwLEIn4tyFjfdZhCmdz+MIi4p+AIsrtn64N7TAMSTnD
         la+bF2O/I5NvoLKMwnmD/ZMV3EdbOgbXZ3wQtQbQl1HyYgFaXMO2i5aGb2kBKtoUOAu7
         UAhHdICaTY0YIaicdyOlA5Oaf9LxtgiNUbKMzizBl7u9GnaVRw+sXxX4cv/MBSttgvpM
         XtDMhbfNtVOTzcFPU9IjUhUQdNKkpDl0N+gSAhc7MhkYnEZ6pktcR6cA79d1fUmBoMkJ
         NEcAwohjkH0D/tdFC8/3DRcbEl1bA73XcHqQo47Me50r7LupCcLuzM49GqGzVbGfCNpV
         fdhg==
X-Forwarded-Encrypted: i=1; AJvYcCUOviKT25euI9ayZLQ8gVAdLPWzUQQbIPSwL+rjWotoKZ2462LBUk3pbvE0llwQB/y0NgvOQeOoIUIM8SDq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx427OP/pf/BiADWIoHajYdsRoLycVI+m/RZpQH49hvRCo1MRAe
	zPwGJ2cOZy8aHaVoVbC+jJGIO/HrdmOmMTqKy8ZdjI6hM+QFckzAzdAomE4bYc9xCvz155aOcXx
	At5X9QJ25phg5R2Sb/PgJfcQtIDWFUePlsZnvrw+JWE7MKwou5f2lZHsWSbQWtG+amva6
X-Gm-Gg: ATEYQzwWBvh8f1n2Qp/iWWqeJ4SVOXrnU9XAr9iFEDsIkIv2pgh9x5ktYU9Ksm+fdmy
	g72NnQ1DsgMnzFvhD6UNFekeIojVMMRMtvXqlYXKZmm0DeevJoQ8/gJT5OX0zV3cyPt/7r6VIxI
	Rmrj3161wdHULywujCwlIFyeUe71ep3khfjdZ2tYewEdu/Y/ExBwVJB2WdQ7iutzsUCiq757/W7
	/WY38ekQaZGzfyrCHaMcwjomdThX9kdyNnc9VdRMziZ78g6ltgrlC2y99KLsY1Uz0Mm6Uz5RU06
	20MQsSeB8+Xd1+4RWxw9+BLLr3POfpgejZKvNd+qzOYtq+sPvXUjxt5a/N2XdxDRQopFGL9WysO
	on5Z9X9fN2BlfaKfOWws1m0MZQe9sDQ/A5sQTHza8j3O386/zLkBVUmx0gUEOpVMciAYUSbLOU2
	XljUgdedTdg84PR2IX8zKEFXq6KRqdcEDF+hM=
X-Received: by 2002:a05:620a:4588:b0:8c6:a809:862a with SMTP id af79cd13be357-8cd6d42852amr337432385a.45.1772815836156;
        Fri, 06 Mar 2026 08:50:36 -0800 (PST)
X-Received: by 2002:a05:620a:4588:b0:8c6:a809:862a with SMTP id af79cd13be357-8cd6d42852amr337428785a.45.1772815835615;
        Fri, 06 Mar 2026 08:50:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d086079sm434104e87.69.2026.03.06.08.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:50:34 -0800 (PST)
Date: Fri, 6 Mar 2026 18:50:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: fix pclk rate calculation for bonded dsi
Message-ID: <6k4wgdu7x5z4b4erlgteljb4742brknbwnewoobwhv2qhqawde@wpkhreke3gsr>
References: <20260306163255.215456-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306163255.215456-1-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: qB5NqYwP40wtNWEo2OmogRMYXkAmQhUw
X-Proofpoint-GUID: qB5NqYwP40wtNWEo2OmogRMYXkAmQhUw
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69ab05de cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=X81lAphP1gkamZjTqCkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXw40Y19/qM44n
 WWnHmsrVoCjVQLVRAPZNJs/7tGMOXS20Km6z2e9brte4wBlpOxWMr0lR6weu7aG0bF2O0XfSu39
 VPb64/N1whXQDTGhWTZesnnaGYO0vIPk/pf4zoWo1/t2GKZcdXgKL6oWa9PT89HW2G8UuByVnHV
 akghRllmf+Mva2gNkW9ulpQCWyOHY1Pfzl35W+RanJQ7uRWl5sS8SPxnDszJky5YVvoke/5hlN5
 ujjhkLmEp1nDE3H0yl29oCvgIRCuKduqTR1vbfalHoWLx2RM3ZZ3ZqpcW/+yFwz3bvN3SV13Cqv
 1L/0FCfll3gkdPlaPqvOzLQGEloIgMokhC0pZZXMNo+O1mF4gJvZme0/D+Im1InxiwicNmV9SQK
 TA+a85+d1X1LsGvxVaR5zG6ZA2I5HhqvBudyvpMZkvrd1febizub2qsYn0bSvGUtL2SKejspj1h
 Cz6q0nKcKrrUntYr0KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: CCB66225932
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95901-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.972];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 12:32:38AM +0800, Pengyu Luo wrote:
> Recently, we round up new_hdisplay once at most, for bonded dsi, we
> may need twice, since they are independent links, we should round up
> each half separately. This also aligns with the hdisplay we program
> later in dsi_timing_setup()
> 
> Example:
> 	full_hdisplay = 1904, dsc_bpp = 8, bpc = 8
> 	new_full_hdisplay = DIV_ROUND_UP(1904 * 8, 8 * 3) = 635
> 
> if we use half display
> 	new_half_hdisplay = DIV_ROUND_UP(952 * 8, 8 * 3) = 318
> 	new_full_display = 636
> 
> Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

