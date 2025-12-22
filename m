Return-Path: <linux-arm-msm+bounces-86173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D19CD5462
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A34E9300F15A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FE63101A7;
	Mon, 22 Dec 2025 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kL9F0oe2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsSpwweA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488FC30FF26
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394931; cv=none; b=JWQzVXA/ZSwvJ1mFk+q/8/296nSoOIEFCmFB9YHoobxWQxZ//piy5DwPOImcvYVtBaSX2Qvg5MPoXh00vUa0zDBB1aDCloISTTvHJ9DqOnagfvLRTdy3agE1o5Bnmv4VT1woWTq5cTev79H7JVJj0aoSwBdVXvlLdkLDEnH9giU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394931; c=relaxed/simple;
	bh=09SPlJS8w9z55KV9fRGuGfrJpZXnHXqZaP8GsPWBy9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfKoD8Ap+qxFfsLvv2VCnaS3IiXN2i/2mEPtoLzX+oo5ZBkyu+0hqpuFMNNL8FF3b5N91MglIQVqPfUYfB0KyH+oPy9dB+nlGoIDApviBE37QWNGtgZBELRAwlWyqyL7nmzyQGzUJMmSI5nwdHPBxu2gqwzZzXkaeWJfAI1xBkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kL9F0oe2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsSpwweA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8GKw33918051
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tXclW4aX46rZnRIVsSHqBVnw
	Bj3pv8YCsnr1Ohovb0I=; b=kL9F0oe2hqbeC+xizDU5G3NSG2MS/+zfoL4R9kb0
	rI271HGOxxb56+ca6cHU3iAF+/Pg3+pl2PgVRQ/FsXZWQDUTX6p0SDvqF5yq+pWy
	kyPjBJhtpzJz6ob1CJJf5bF4m5mIGkdplJ7Ibn/LEKLzAdQHgzHVuE+3XXOo0iHf
	Lfzp9mEYSNNM54SYeM9F4aoWYtlzs8wYpuqflpMCREnNCp4/dbnK+aUeaF7MJTEp
	5bZeJFvgDVX79iB1Ne6zbK2uEAbRDTNQ63M5FHoEZw80nXAjCTrBEmQzBKXbzTPy
	vy4A2KKOV6SU6pcGsVTm0x9fOi2BzX9d2oxgzdvf+yDKbA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mry4daw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:15:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee21a0d326so355821cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766394928; x=1766999728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tXclW4aX46rZnRIVsSHqBVnwBj3pv8YCsnr1Ohovb0I=;
        b=gsSpwweA4DTS5e+bD7Ylkq2joMb5tWTTQt/gcdEDwK5/SbSX9KiSm1HIIS8SP66ei1
         WjJDMJT/CTNF/voclW/c53nDTSQuV8YJtbgaUr983vSE4pS2xfkrMURGONabFh/Ho+Gt
         WqqMg/oIIQQUpzkr0ZZz0SE4MzX8aXPz36JL62xTDQeylHhutoTl7zAAvc/YW7g81glY
         OMUqJHDfdVNZHrpsh+Wf8M3KxMrvL7Frx0A0WbOPhyxdcLt0ODG/pkhn0gtovwsqzw5G
         Ok1A1WPouWVVwOxQiZqVj6VsgBzvBCS6zCFeUxGQnd+4NeaYTQBWVxyZn4F4tMAkhjeh
         2gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766394928; x=1766999728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXclW4aX46rZnRIVsSHqBVnwBj3pv8YCsnr1Ohovb0I=;
        b=Uw2CRsm17pcIAiniaZbGVSTcdMf2yePiNpmDfD7BXTBe+kZw2Fxo6/Hv/vVl07keE/
         oRRFAk5PewizrxoYfwrX3XdlBqr2KnhfJNUGz35QY7X0Xq6TwbBM8WEipBqVxUlipwMJ
         uJIWafoHVRaj21IEhp8/f3TgJyxQ6HzTjEtHxmhUF6dCKuzuCeYuvyeyx0t9f7lcfjxO
         NTT5zBc6hq+Vu2La4Gvxew51knH1kJCKXYwEBvWRLYFvrj4qXcnNOVMKpJHKtu63N3Ug
         4pghXsuhAueumGJeueXI8BDmHFcrWf7yebS7TECzqgQRRlR4CJbzp32FdP6q9GBt7o+8
         x8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXcgufjioWdD3U8P9fDLGnBmMXccnw2o937mJrSy2pboMSXHQQtTZFDE6qmnHoBmX3swnKgMf80YqlTGiMo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4c0aC9Dw7FBacahbefhIKcbKF2egi/aQ3agpurKBZAn/Upo7k
	KPJyawxCFZ8v/IO5txBidri/XKCJDyaaQcsuFSrVhVM2CYC3GqwL9RNBttlVHf2IERTZ26oqoS/
	vob8AL4jjryosZ2VecOqFQllPsb8Savmbmf/EbCApmAlNHDkk/WlFtMWfvO0XI7gzWQ9F
X-Gm-Gg: AY/fxX4Mj7obc3sx/GIW7d1ZfCennHM624MtGEkUw93/cN/Bwzqyke/SFdXRxjUyqzu
	bKzneYpmoA2sZ+BxR9dQaJR6tQUuJrKhBCQzT1/H6ko8i8hV/Q52qC0jkhZv4BBcvnJGW1hHSHl
	bZTTmLweB8fu2Yqa6IANTk5h9LL8cy8tUvdR2PEGJUmTQnz0ci0VEVxS7AbhjUvC0imJ1n1//Lp
	R4s/15DTT78/GucimthBWGlwyUmzPeWHdSAm35lkjC5m1W1UfHrxi7MR48G0Y9X2tluWRpXdp7O
	AOSSZpCAlrPs/bSCo/O0KXGE5pcoSd/v+vD4eBrq08saM/oJJO2Zu0diX6BIW8/rNvMZ02jar1m
	ceiEMaDZn/3GWs7MxzPFOjQ==
X-Received: by 2002:a05:622a:4a84:b0:4ee:2459:3d6c with SMTP id d75a77b69052e-4f4abdb5dadmr144189061cf.58.1766394928466;
        Mon, 22 Dec 2025 01:15:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI3mUaLRUI/hNRVJZgifamB6jpBWNmC9mZeJbuHbHKFqMDYETI58XYsek/jvDDSeq8cxoolQ==
X-Received: by 2002:a05:622a:4a84:b0:4ee:2459:3d6c with SMTP id d75a77b69052e-4f4abdb5dadmr144188691cf.58.1766394927938;
        Mon, 22 Dec 2025 01:15:27 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5c4dfsm1029081466b.14.2025.12.22.01.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 01:15:27 -0800 (PST)
Date: Mon, 22 Dec 2025 11:15:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] phy: qualcomm: phy-qcom-eusb2-repeater: Add
 squelch detect param update
Message-ID: <gtagaq7a74nolj5sebulkfeimbiqto5mim4wara7hlupstjk7k@jb74w2t4pesm>
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
 <20251219173108.2119296-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219173108.2119296-3-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cbbfb3DM c=1 sm=1 tr=0 ts=69490c31 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yu3_NAM81_lDL6LZg7cA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfX8hkgsn21WHa5
 rni643mKbVsAeO58MeuXX+2zaOfBoUdfxht6I/mH0jGzOM36KYRfhMiynN6i9yali+818/BzvnY
 6I08fOdKzxKbz82+64tUEug7d9SMjSrXVtsBYgsZqQqaDVv0wlA/658P8D5SbWNpUMSVKGRGApp
 IxkH6N1/e3VzDZVADsuww8Z22W36YEh3lckKF+gQvSCaohZJoi16y4neCAfi5e54zeUr1rZPxkO
 c068QIgbCYjo4q0gZ9TlGFvPgYVR0kNlUcqze0iUGgtCgCag/y2lEyQjYiTHHYN/bUMUXBXMyiq
 Eik8nBCz4F9HcCfHk11vIsci/uwIZUpDO04MsSUZYC68eHUjHD7a8ESnB74D0iM29qUqCdcqEfD
 hH6JBdmiZl77yIA/xMNRoNoNgmEYtJ4YIFHGs8OBU9BSw75NxQvMNgyTCLaH7X0Mppm49DUmdAq
 /dPvHTPoWB2ou71teHA==
X-Proofpoint-GUID: bHRhc6P284QQX1qANow8X77pcQjpKbBe
X-Proofpoint-ORIG-GUID: bHRhc6P284QQX1qANow8X77pcQjpKbBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220083

On 25-12-19 23:01:07, Krishna Kurapati wrote:
> Add support for overriding Squelch Detect parameter.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

