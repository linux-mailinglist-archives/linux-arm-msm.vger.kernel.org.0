Return-Path: <linux-arm-msm+bounces-82730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 894F6C761A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 20:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 7867F28EB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 19:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F1F3009CA;
	Thu, 20 Nov 2025 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jj6IziUA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zn8DjKjZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059A42DCF70
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763667620; cv=none; b=YqWPO/RqOkcoHM+si/9cwJSk5ZyC9tebXG5hdvPIV8VbfazGhYzk7uDPpq8ScTWPHB8ap2Gfnc0GLxlmE1qmdpPCq2o9v/nAlr0tZk79VHUQMFHggj378MSO7kpTnkNuDgX3gRkDDJNLGO+OtHAPN7DNJJt7IZhs2aZSeP8nSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763667620; c=relaxed/simple;
	bh=D/2fBbq//OEjM3sFYK1sq/zmqf4pc3c8aMVIgT95bd0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oy9d10Pgp67lEpCcJaIFBQOP+vfHIGubIF2GQOQZWKYuhtNaZ2xIbBBIyrosQOaV3cY6Kp4SI17PEWjrEx9/pYKckLAJ760cmiKnIWE6We945nz9uwBgtpxfqdpdVmIBaMLsoUj0WL4f0Ri+H1/MB5gcy1ZUhbpp1+ps6PFz0Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jj6IziUA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zn8DjKjZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKImJLC1877459
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 19:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F1exaoz6QlOUo+1OEHJoiQzN
	3AYvxpF2mbi+/kJ0IK8=; b=jj6IziUActHQGSHJlBLYj42z6VrQUx/CMesgnoKY
	19kmV6Zj+kQI9n9La9QJEuMjQ0mlMEcBUYQhiQOg8rgExiaJwxnjxuSLkhu/c8uw
	F88isJisUKgyt04FAvw3cs2hn7QSNPaEl1Nhe+vj84v3iECu3WVQr1/+RP/QDFa8
	2mShxaOm4A8RtUBKeNxYssA/a3RNbmEamyzPusXZEeJHjkfPtWw6Qc9INMbuhSAW
	pAwVmTeWRxA3Bf3Wzetzy8T1uoiInnhswhRDsYZ/i5myFMs6aZt7DhYEPnnC2q4o
	OhJ+3RJhSa3OdXAjn8E7pJnJ+83iJCGF9R6DlQ9sJNNXeQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj0m9susy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 19:40:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b30b6abb7bso409330285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 11:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763667617; x=1764272417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1exaoz6QlOUo+1OEHJoiQzN3AYvxpF2mbi+/kJ0IK8=;
        b=Zn8DjKjZK0RKWLwjMqPoYtJQrXtFQGPrPoGCb8BJ7ijr6hYId9IwOw59o1KIKfqGwT
         cTxJnE/2UWadx+aXFbBNR++QlBWnu3QRfsXXJI+JE/1AKSqgjtKYgS99aLCu+NsdRWCM
         /nFyZ8S8L63ZyFlyd5LB+CsQSZeTJ1zvM4x00uF4TEjJU7rGGTBdx864f4ad0YEFwR0W
         KM0/hkYvRlwX3Xt6hduJOjK97q7LJe/RtV8XaYX0wbOxN0jaWa0jScJqH6hld0bh/9n4
         CSc9UhfjRQEk3RqQzKLQwfG2A8Gg8rE718FFr++qJ9JTpUDzsP3lTEblQiCf4yMnTfeT
         RKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763667617; x=1764272417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1exaoz6QlOUo+1OEHJoiQzN3AYvxpF2mbi+/kJ0IK8=;
        b=gUnEfjy5/w2YZcSOZEtWA26xjXrSCImuLA7IZ2Kjln6YbVJvJTWFd85tv8BveIJF5T
         tRCd9KpjAGylaUcsnWy6KfWgnlv12cYBhZE9kxxyd4pxuAd1EYfGIv3o/o0ABEArVN6J
         wFAs/Zl4xc1DDJwnMdS4NizkwNIZ8CVqGiVn7d+PYowHj4u+e84smRH3xru34ywBCviF
         rvX6adHZ0GWiYgOYov1UIAt4gj2ybTa9FzDnEmxdAK2FJ5E5vZx0GcAPzRFMyM0oZTwo
         TY6DNuOmBfAYM3eWq8czqJQIyX9EVTHqNaOeiZ9nQ+jXrLdrR9KTCgDDeWZlHoRRgBUX
         VGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9hvo+bUJChZlM5GKITPQJ9a7b3yitxBx6Rw87mGmVO3NMG4+qIaE+BdGZzfe3yltZcSGLWTN8On/GMLGw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+12pceEjEiN2LY8O2a0d7yNplNE0uJTJRakoGMBRo7FJHHw+h
	Fcd/fu2Smo8opl3GFPuERzuwGWk9YXPURwU7pj7r1BVa+j/G7OuQGwNA0dN+WySov1xEXLFCJog
	4+VkwFM+6fzHwweeirBoeEdo4obxP85Rls3qQyUJKJchNdi7Kcx8OoZIoANIZxfx8UE6R7nFaNP
	wB
X-Gm-Gg: ASbGncv7krIC6gAzqP144obcRVFhf07NJZtVFHzIpGiPRS/rydazvih4685UPJx8ytu
	ksWBokrcR3G3c7gdbHbGF8pnRn97qBM70IEttJSQ7UOV23azpE+sodLRw8JGzmqrSj0G1kXvPUg
	WjyfD9imo8jVY2ICmxrJeaKPQIwrCPO+6PCcn6zKA5tTkxnkvhRIBNVLIfH8CjvGcSRDIwcJjxF
	L4M55vgdiISFR810mt64baJ7IdzzsiStmQoYjC8ACkAp4ASARfhQhjRecTaoywQLKpueh+omZS9
	kmVmVCAJopRjnTo/y/ZVNijSHZ+mBnUj7OCcGpusdRP52mqsbydCvuFL6YkXPFvIyrFUVjKJtIO
	Nxe9VKF2DKTwRChOtzX+/FVGJeLxwsIKnY5jMRYa+e76y
X-Received: by 2002:a05:620a:44c7:b0:8b3:e4c:1bdc with SMTP id af79cd13be357-8b32749fdb7mr588825485a.65.1763667617120;
        Thu, 20 Nov 2025 11:40:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkRM42/QptloMRJcpBxWQcEzqaSf6oDeKZsg3rPMa5RzNGpdDes9A2HN+GPdgauPp5/mAaTQ==
X-Received: by 2002:a05:620a:44c7:b0:8b3:e4c:1bdc with SMTP id af79cd13be357-8b32749fdb7mr588821185a.65.1763667616564;
        Thu, 20 Nov 2025 11:40:16 -0800 (PST)
Received: from trux (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb919bsm7063149f8f.34.2025.11.20.11.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 11:40:15 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 20 Nov 2025 20:40:11 +0100
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: venus: flip the venus/iris switch
Message-ID: <aR9umzhuSLKB5G8E@trux>
References: <10Ud2nacNpGLxEZdFk2VE6I40JkFU8f1S0lGFZayvkwiPgffhyV-gY3p_-AnMAAMckWDMVO__50mkrCB6NnyVg==@protonmail.internalid>
 <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
 <9c1afc08-e584-48a5-808d-16711c4ecd4a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c1afc08-e584-48a5-808d-16711c4ecd4a@kernel.org>
X-Proofpoint-GUID: MccO1t6XodEwVEFagoh-P26lGLTAwLPE
X-Proofpoint-ORIG-GUID: MccO1t6XodEwVEFagoh-P26lGLTAwLPE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEzMyBTYWx0ZWRfX2Z1nJiWdkBAY
 NFgFwSdP2hGs0NfecA8fKOllfTvR380BVIIYFm+kvxzC00Foiu3qrwVyUWC70v17EQoAwF8a4Xn
 uf3rcw7SqEfYfI+XIBFssiLE6OtY8Fi64UjYHSTFkIW5VaV4BiwRJBiJqWWAdaASfRmx2W0sUC5
 YOpJfNXvr5+bGG0Dq1m6gmQ0ekeNvue5IaGeiI1xhh0lcdBtvtHedN/bE6ufVFWEOBNE+gvYS6c
 PgLQvhPDuKCIdCTzZ9ZTn+paVikuQRJjK8+Gt0gzE4ugNNRE6oIDdwVPQ/0WCEMTWgDcq5rKd5S
 LM6yPOciMvF3qQse6r9hilBLc0SxOyDqaylW1R3T5bKAh48SVzedlvTxreCAD8qrnWMFkGML2N8
 AuYWNlpyifZDvWzennyEkDSS1Y+sBw==
X-Authority-Analysis: v=2.4 cv=DtFbOW/+ c=1 sm=1 tr=0 ts=691f6ea1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=07d9gI8wAAAA:8 a=EUspDBNiAAAA:8
 a=4sqY022Cl0DG0oNkQDcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_08,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200133

On 20/11/25 09:58:18, Bryan O'Donoghue wrote:
> On 19/11/2025 15:18, Dmitry Baryshkov wrote:
> > With the Iris and Venus driver having more or less feature parity for
> > "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> > switch. Use Iris by default for SM8250 and SC7280, the platforms which
> > are supported by both drivers, and use Venus only if Iris is not
> > compiled at all. Use IS_ENABLED to strip out the code and data
> > structures which are used by the disabled platforms.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Note: then intention is to land this in 6.20, which might let us to
> > start dropping those platforms from the Venus driver in 6.21+.
> In principal this seems fine. I think we should have a metrics as opposed to
> vibes based criteria for the drop though i.e. an analysis of encoder/decoder
> features supported and test comparators to show either nop or benefit from
> the switch.

why not just revalidate using the same set of tests used for the particular
platform to be replaced ?

ie, when AR50_LITE support is moved to Iris, perhaps just re-run the tests
detailed in the commit:  https://lwn.net/Articles/1033022/

