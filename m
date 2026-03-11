Return-Path: <linux-arm-msm+bounces-96817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGDzM8bWsGnLngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:43:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C89C125B13D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA7593000B8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687172FD7C3;
	Wed, 11 Mar 2026 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAdj7bV2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HtEZXFPT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F76C286891
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196942; cv=none; b=Yi6yJ8eaLEUEKqOWLqwNdSWatIZacDXwToCt1jt1XQ04580g4mXfJDZNDWyAyNkWLmkyZWphCu/NlcG4D1eclI81IVlKnmD+9eM0afJ6kxSJ3NmCgS31OVDJYNno/h2XSFoUBJMRrTCuRM1ZvcOquXannel2PoU6hJiU14OW4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196942; c=relaxed/simple;
	bh=7YQJ4l9LhxXbSRJbo+HiYEbEObCaxdrA7wrKPFSrtdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlEms+GUtzPA9b/HshtZVwtX5kkfwA659WJ7Sdv0elsTxVd1a/LajCOoZH/nanbJ8pa+XADSmR2J1TvRQSEz+E9ESH4pYJMWVzkXDNm54410ij186gGVpd+cyK9A40WtjLfMM+u5xioBqJuR2Um7N8Z8aBbdANhkoW+sHU26YyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAdj7bV2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtEZXFPT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AInSD03760444
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ZkVIyDfyZN0L0oZXoaYOXNq
	4DiAmA8/BrWCFXukDTI=; b=iAdj7bV2D39zepNBiOrrrGsAZaS8GW9Qz6rD8fUS
	lcJwy3pk6SNwp3b/9ONqb2vnQQ9hlxlajtHh0wjXQHc1VBehg2Zq6CmyUeF4Ws1E
	s+AAQxPPb0OzpXDp5QJExiHH1QcEMF1CnNT9zkTxLQm4SvM79FoGL1tfPYLcH4yK
	ooT+/w46A6azynGE4vodc6+kWzuy3zDGBefi+gvqoW+roOPXV1jkvVDSYdClaLu3
	gRWoS2/Oq54MjzQKAJvEQ6m1ILS4MpqcoIxPfmnvH/f5wWzH0dziC1UmmIuZ2qLB
	Ys6dWddXYz00kdS5WYCy0/r24zvJiV6zwd3r3ZtCY8WN5g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ujvnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:42:20 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffaa85b95bso45675059137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 19:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773196939; x=1773801739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZkVIyDfyZN0L0oZXoaYOXNq4DiAmA8/BrWCFXukDTI=;
        b=HtEZXFPT4HN47wsyV6AcT3M2QU2cG6Ua+c9t6QSzRJvEE5eY4zzbmVOiLZg/Et2dfw
         buMpR04ew2ojix0E3Kr+fwTc5iuJyeu4XH4wMENhdvodGRSJFozRDHIV/hipgKckdwgY
         odvGD18K+cgBi8NUF5PU5pzmSylHTA1bP9Cl8ccC9G/fVskiTAJJbVmkPmFqCDZtJmVE
         z1eNZ+2XdzvX74qY67V6/1J4Z576C2FYE4MK9nQYLa6SN0dJxESLYAjYwrrWEMXLLEWJ
         hyesmc7yX38mL++xRrE773N0rj8pu735azi/Kg13VHLCW4kzetSVdP+0WMooii5vH9xX
         4hiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773196939; x=1773801739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZkVIyDfyZN0L0oZXoaYOXNq4DiAmA8/BrWCFXukDTI=;
        b=OF7oRmhUDfF7oGKs4PXNBflBfjnVO6DDakGzx/+sUwpV/NNtbmJw+fgzAYEC/dz+kh
         L3mbu/i7xNMilIoT4xeNBT8oA9BvHbTJBtvqelU3Xgwl/GkbwBnIeeCsqLKIkaLzNXzr
         ynmVy1ghzS75qof7C9pVrlclpuo2DiM90lDMyJpZwxZhiACOFC35BO9zFM2JIAaSX0+8
         kl+e255fshZ9wCbZPQQgErGxZLGC//q1acwmlGbYgccCwOkhYlvI8wgUPqnLl9yJmuDF
         Oa5jAIBow7NxPZTiI8PHZ+xcJwlMRKwOhAOPdQ8ZL/0lSAdUID9GdVJ3XIUK6bl9b5LO
         vOPg==
X-Forwarded-Encrypted: i=1; AJvYcCVYgShW4IXEb99HdJXx/tbd5Cv5o6Ma3OiHPru98ZDQah62n/E2qPS8uWyE8fEOD4orc60Xbd3pa/mhmA+0@vger.kernel.org
X-Gm-Message-State: AOJu0YzVp8cET91HpvJaPNW6RtiaqNUqx9JsURWMCxDkWuAUHaQlqCGD
	ZZBZrYxtZ4yUs2HVcSTLIdjj2U5WG4XkrmN5rjJ0mDS82zn7OjuHQVlKok/pysR+xkO31atmwi7
	NGGDSwzI3hWZpgbrbhOPb0f1pQTaeors3De5YUcVKgfiZLlEoGbp6sNwLr5MojShc46kS
X-Gm-Gg: ATEYQzwOEEm4QRVrkTcFoTtPi3hvMD1xb70MlNi0hg/Xns+cge/eCYiqp+49EpRLSIO
	xq9HKmrvuMoa6yho3vrPel1+baQamP0cnu5q3UrJQOuaTXGJzaw2D+PUlIMMXivpZuTTeRVUhkb
	/eFqpy1QZ9TMsXW7mh1RuHN7h1cdcNXTvCtNXtw+EmRP0d1+LC+l8Y70aGye1yS/SE92G2NAIBa
	wdgewMYuurCyNQ9FaJnRoBVHwpiAFUCLiFud34T8WguOY14zsCxbLuMn/GY/vDGN0c4Jzrc2llY
	5p5DprUYTtTYotc1JaBlPQy0m5GNpNOqn2PV9+6uGZWafr678jhaRbYsFtbeMsxbz0nb+3qIFBk
	uVVi6fc+JDghGniKmaO9bQxsBR0byozlRw7a6dRo/xaKTNfqDok68i5DnQiVBVTsg4YPM0GtZGN
	kY3Plqvg8iNDG6F7mxdhNUtbW7W7KNEb4NQrg=
X-Received: by 2002:a05:6102:3713:b0:5f1:606f:2a14 with SMTP id ada2fe7eead31-601deec17efmr439736137.23.1773196939555;
        Tue, 10 Mar 2026 19:42:19 -0700 (PDT)
X-Received: by 2002:a05:6102:3713:b0:5f1:606f:2a14 with SMTP id ada2fe7eead31-601deec17efmr439721137.23.1773196939141;
        Tue, 10 Mar 2026 19:42:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d6185csm1423131fa.3.2026.03.10.19.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:42:17 -0700 (PDT)
Date: Wed, 11 Mar 2026 04:42:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/24] soc: qcom: ubwc: drop ubwc_dec_version
Message-ID: <ewwlcot4gbb4w7dhejbkslcgfydtrjgjvoef77pdroa3dmz33r@3du2u3grnuan>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-19-9cfdff12f2bb@oss.qualcomm.com>
 <46e2c9de-913f-47cf-9d6e-d1f85eb7ab6c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46e2c9de-913f-47cf-9d6e-d1f85eb7ab6c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YbazrwEvnE1BvgZoi_X-kXtnMFfuPPOz
X-Proofpoint-GUID: YbazrwEvnE1BvgZoi_X-kXtnMFfuPPOz
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b0d68c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6cS06CvN4iNYg0Ph8owA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyMiBTYWx0ZWRfX3ARFlxEbmgnS
 8hkx3WTCK51xPSsHXJlz7ox7bUd/mWGIImnO8e+a3eGTG1ZgF8iSGfLTqKfhUb7oJpWFJSAKKL7
 Nz9c9liHJTCf/A1AA+KBHNUekzrMQK9/8yfiWRHUPD2FbRvnZldvt7GfbT3DJDJsrktgpMzI5ph
 WeyRBuQ1c8Wr8M0AJacAXrxcs8sez+2DhTbl3MpDr2av+ueiXfDesG5F+7ejv/FcN+s6ZRaGbRy
 lTXvragSNDOzLK4cS2CHssb8frLTDXrk5BB4ybMsEOjGHGYLjatjxY5ifT2J1790xD+TUBeMKKW
 XPRykaEJj2blbnw7rt0Q9XRvi1CIC0OFdMqak4xQ81HxvT0NXmlh7RWQKTHRVZAXumYv0K/P+by
 xFFNULSE0SeVoAMZq3XoUW7ETU9Rmvqg/1opxbj34TSZ206ChA1gdAPUzPAfZa0T6kwP12eWUvj
 s7WUadCyNm+Tc7txtqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110022
X-Rspamd-Queue-Id: C89C125B13D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96817-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 01:51:33PM +0100, Konrad Dybcio wrote:
> On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
> > The ubwc_dec_version field has been inherited from the MDSS driver and
> > it is equal to the version of the UBWC decoder in the display block
> > only. Other IP Cores can have different UBWC decoders and so the version
> > would vary between blocks.
> > 
> > As the value is no longer used as is not relevant to other UBWC database
> > consumers, drop it from the UBWC database.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> will we need a more complete list here (i.e. block-denominated) in the
> future?

I hope not, let's use a single UBWC data for all the devices on the
platform.

> 
> Konrad

-- 
With best wishes
Dmitry

