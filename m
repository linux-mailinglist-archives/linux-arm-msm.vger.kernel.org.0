Return-Path: <linux-arm-msm+bounces-88169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BDFD06F9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 04:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4B08303270E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 03:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACEC243951;
	Fri,  9 Jan 2026 03:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFQgQyQQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QiBgYH6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54C1D416C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 03:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767928878; cv=none; b=BcfDLC4/HW59EGQyoKdQlFQZH0fndFETjz/o1OBT8BT9K5G3b0NDfIPhC2dQlN9YyRgRPH2SVmZOd8T1ut5sI0sYi715OjebHhhv3kUp9X1RDoW+aMNAa/1L8p26rCQBsXwlS63mbkqw80LHLI2L+TRtftjywp9gvt1hEkxt6zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767928878; c=relaxed/simple;
	bh=j6Ov/jIMdNgGFmIFUkaffg950FgxqH7B2zkvQewFdz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sixFlf5cBksMpm58w7XABv0Fd+x65/oRiaCThxtGdfh2OMgyYf8MnBBUHweGK1VlBxpG51z8PL5vpthKF+oneLb4n3eNikKjCT7UGS5U5mah/2N/vSnZ7hMz/0JhF18x7itBAUKKu7FrjOMQfn4RuvTD1gF33FtpxBbXDrvg1z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFQgQyQQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QiBgYH6I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Hjxca2706813
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 03:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l0S9oVoW17ZH7EHn9m++kxRL
	IL6UaU+sg4ZdoxU8wC8=; b=jFQgQyQQCec7pV7N38Bwd7g6+2p6h2fEE+scdPJ8
	/RH7R7HnMag3gKilpUHxoUL+zcO2AgI2HPOflOVc1DbesViVs/jgPOMZ7szOHkz1
	Wa41X2JNfK4ikoTD4p3lbEKF8tMUQG2sTHRjzl/pXoasPrjWdZjjPFN/0Vu3oGZ/
	v4yk95aLoKCbWhQ6r6ugYSw2tdsk058R4TyX1iqbD5DsMrRnpjGK/z/YMgRx7VUk
	++q75AloMQPrr+lZ4KaWIKxfGqD2uyx5mKallexTQlKjRoSapmCRnxJEQN+MesvU
	pjavZRh2F3JWa4zSi9/G9NS1EfROa8aBQfhx+WfP0XSV1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj9hqu28h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 03:21:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2dbd36752so975241985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 19:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767928874; x=1768533674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l0S9oVoW17ZH7EHn9m++kxRLIL6UaU+sg4ZdoxU8wC8=;
        b=QiBgYH6I4PsyM4Xmelcvbi89s8pQlb7PLn6H6Bdeku9Y9WkofZ06WBlOuBzW1j8DOl
         wZJzXMoCqJ4KUeSsHCb4t1GAiEPliz7eWojcy9JA59MXSsjVg+w15zvbjvPsjpw72T5O
         W7uo7Cngl0doUSMUsulMjo/qpOHhae5+SIFZgMusW7BmSxfCv+WwvILJjqzn6D8D3euH
         zj6nWwk8rMLbYVzuaOkNLmLGPt7ogGrZkkiBcYYdGAd6ySXt/fZoGzJBrJcf3QOl/OJs
         4RvlyUT/NYdJJHcka8AYFYkF16ygjKhSKBY4qTMiDdYhUyvM2FrHuo55sNRw8JHjnS2A
         RT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767928874; x=1768533674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0S9oVoW17ZH7EHn9m++kxRLIL6UaU+sg4ZdoxU8wC8=;
        b=PHsU+VynH9bGgvqlD1uDIEXJptxZviis+AIeza7OO5dqlnR6iuzL6ituvqEcfVpXxv
         bY8A5VERa8PW+Il/w58hntqJVqr5X1rRvh8C/Qd/TZ9lsVdpFQ5gFcP8vJEt6OdUI74a
         Eyd39umv4KKuBtBA84/MCupDUOpCi+O3s2Pl/uWLaYEmCE5E1QQ+UjUQRyjR3lkv9wpt
         uYxmJZyOXE6eSJbsuslfCECxZCS/xd5qld1fF6d5GoT5v0WzrrNHUA2zs0/XjjLcP2z2
         rz8YptUFz2ZX86hydKkQhfez0eAZQTxllJIwd7lQkxkNTMnUHB5dovN0DYGgYm9eubRk
         Nh7A==
X-Forwarded-Encrypted: i=1; AJvYcCWOxahw02Hm33qVeDzjK0xA4je/W1644yO5CDmOFJrljzPNOsFyavMfFnijTAZ/0is9zo7em51g9wW81MJN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywawx1LkphKp36xVRySJWALVd2rk5S+8ElPhz8Peler7jqRVlUG
	9jXGtW9ztnpw3NNr4Su9kgpGSSpiQV3Wo3DHXlonZxTN+c//UGxckPuG9teH3ywv6J0kTuMWaUG
	ssN8XH5ad4Jp5QRJ3krC4k8JGyifTKPkRinsLr4jf40zxor4cNOQ6w3smrUrAehl1IuEn
X-Gm-Gg: AY/fxX610HnrOpIUWoxx8eqChrS2FjwMtqRvNA+kEE3eOi4C+5lGRFfRNyO/l1/Gz/8
	F2/76mYDB10JiprT8Hth6Et2OlyFi5EWxfKopfqd+wl0rqgfZkPzQV5+o4OYj0a+SUZxpJKkchC
	O+lBdq4+5pvc5PMtCAqyGCMHf3diiB124t5T+mF2hvYj8f8TAi8OBil7Iy/ZFwStIYtJDOes+pT
	A1tWidi/EgGXfP0pP3eLDGgS+W2VGhSbZDZyWEsZAb5JG+muMqSkeqrJGcyFf6nnZ2gnxp9ZDXt
	1FYbu0J/yGJbLxi75yxRc+xtFkO07cu5Az3o3qRdWzYyKo3H0mnw9sU8Uf6v3mblNGkXB/szCM5
	hdCkaZp9Q2WgipOiRQ4dRSWN51kh9cW4/RqiO/tdHcsRaLnrhG4qCZqu1O1ypWhZ8iFhz2tchYo
	jsGi5MLp5i/vLdZeBFHoCXzCc=
X-Received: by 2002:a05:620a:269a:b0:8a4:6ac1:aeb with SMTP id af79cd13be357-8c38940dd62mr1175659585a.74.1767928874411;
        Thu, 08 Jan 2026 19:21:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7544jDNijz3Oqai5ryzQM1LZ2uw6kV2IuP26zDDOOLBfIgypo+Dzcw8kzTONbK6QX+Jn/2w==
X-Received: by 2002:a05:620a:269a:b0:8a4:6ac1:aeb with SMTP id af79cd13be357-8c38940dd62mr1175657085a.74.1767928873942;
        Thu, 08 Jan 2026 19:21:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7a5c1dsm20225721fa.16.2026.01.08.19.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 19:21:13 -0800 (PST)
Date: Fri, 9 Jan 2026 05:21:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
X-Authority-Analysis: v=2.4 cv=GN8F0+NK c=1 sm=1 tr=0 ts=6960742b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZmktGZHw0soJo7N84tMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: xAaqTe2U_Yb8kcnVZ2zA6XP7HMg1Zmyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAyMSBTYWx0ZWRfX0fj+QQbSyPB3
 wISupCbJEIwXsoTHCFJ78TCTh/iJP7QD71ESOridFe2vXtKgWhoEtGbEOlfKbGeViKtYWHLtnRn
 caDdDcxChPSgqu+OtkwIOhy4/pXYV7gwrsKQssb+cngCrjfxIUpKxQz5kyXblxwwB7Kn8eAyVtS
 xOi5K5if6/eKX79V7nCo+RE9g/lr8wakLyakxJT6ePJ08nH7eFc0BOAveSJbmekDNzFDV5robQV
 MkHBuzowGC3Ffu8wjbgLRljR3dAszI/KIebOP58vrbL8w9D6dY4QBXWdgNT905LNOw3RM0J9HPO
 BEYxwuMczDTk4gUcsdSjt8ehztOGugNj4D4Yvqmm0AlMA18YGI9AAY+2Zt/LRdy9GVsXfjQmHPc
 jk0oVnUCUp20tB680463TlvlL/NYEmS/SCNtOTSsQ9xNT4/8xTRPfi1Sy+E/fh/ZYttEyQg08Tv
 ZOrz58o8tR5UABRullw==
X-Proofpoint-ORIG-GUID: xAaqTe2U_Yb8kcnVZ2zA6XP7HMg1Zmyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090021

On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> > > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > 
> > > To make sure the correct settings for a given DRAM configuration get
> > > applied, attempt to retrieve that data from SMEM (which happens to be
> > > what the BSP kernel does, albeit with through convoluted means of the
> > > bootloader altering the DT with this data).
> > > 
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > 
> > > ---
> > > I'm not sure about this approach - perhaps a global variable storing
> > > the selected config, which would then be non-const would be better?
> > 
> > I'd prefer if const data was const, split HBB to a separate API.
> > 
> 
> I agree, but I'd prefer to avoid a separate API for it.
> 
> Instead I'd like to either return the struct by value (after updating
> the hbb), but we then loose the ability to return errors, or by changing
> the signature to:
> 
> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> 
> This costs us an additional 16 bytes in each client (as the pointer is
> replaced with the data), but I think it's a cleaner API.

What about:

const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)

I really want to keep the data as const and, as important, use it as a
const pointer.

> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry

