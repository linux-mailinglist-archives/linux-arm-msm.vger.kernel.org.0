Return-Path: <linux-arm-msm+bounces-61319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BC8ADA1B1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 13:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CEDC7A657A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 11:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D046B263F59;
	Sun, 15 Jun 2025 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIxCng89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7181520C476
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749987543; cv=none; b=R/92YsTbhSui2Q6x7BKZ35pDffRBM8174LoXHTFBnDv+9AzHHDTSI8Q/cg+siKkzSudMQRcyZDDwUcPY5ELV11kD0KI5fVER7AmKQKQTjv8cKaoLZxwVS2pwjT2x1hBD2B2aS8wT/sGlDjpdDgF6KRxXuI9gPfSp4DcdDsZI388=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749987543; c=relaxed/simple;
	bh=1NEF4CuZl6XkHdOPgpRvdy/DJwiozgv/UKWN5RSkn7I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayjqglMZM5naEW9K5L+DT79OEQU3rB92dYMeVSfMkVPFpDZ+vEaJ5Q6LCzVyGkilXvRnLGJSibKgoTVhuBppHGmeGTIBaZxh1sz768+LGjzT7oQdOwFmTc3LL7N1F6+e/OppKEToiU4lo8pLysryrEvPLV7PgIOi0cD7V4sExxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIxCng89; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FAUTfM001095
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 11:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UBoqX+3Hym0qFKqFeJ3z8WDW
	1r38LQFsqZKGNgNTNII=; b=nIxCng89HHNUp82AHFrMfHUofZpSIEatGzJIRGXg
	nFO/+HPocd/chbvjqDnUcYlen2HvDVF9FLU6q7fhhIajEDut4OI7jzAVN3MP5fjW
	aP6IHiEa9jjAP8ZRlqGKrPvqL4klvk0mUiAJzSyeiurs8Up02cMn5lSrjYOtO5R0
	41QWK7mCzL5vFyV3eaVDyMbxTqTeFv7+OO5OultjDw7U2dkFfFYYbYMRH71Y4Ahl
	uE9v9gYuJZ5SJdncJ9aHWOqTjDLOdfvFmmHgawZS5cwSZ/29NdUTe7XJ0xdeeCkB
	rOqNKa5KWeiCX058AXotW1Tlxne5NAdIWr5XmwI8UHc47g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcst8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 11:39:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fac45de153so52269346d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 04:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749987540; x=1750592340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBoqX+3Hym0qFKqFeJ3z8WDW1r38LQFsqZKGNgNTNII=;
        b=dEsWur822YNgSRNGw7sY0HrE1qa8fMwpmOrxjM7uigslzwzMHYi9/cAleUlcFeGGD1
         hXaB0A8kUMZWQWTjjdvp5ksCIMTrcbOemb5hmWdned+/10Pb91HqOPvC12F3pMrNU1lz
         B8VavT6hxOg7lltJYwPFmh75lMp08p0vpUT+QUOI/HGebxP56NQGJ9tAvV46IDV0//10
         fcTl/EkMgivLTQCLME/dvxkr9eHOkNKpQqvSzF2238KTetUHhRFjWE+lwXSsiXuFkN1j
         GL1sLAw8gvZUWA7n/PFggw+OrV0nCNDXOVW7wz7F3dzn3Ru6rrVfwcu10LpQ42p2A0+P
         ZGNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKqSXGil/uNubxnHCAJtKggEn3c0/j16YXVeYtPH8JBRrWPgQJuXjX7Z3fsFlTxfo2fNbovU7aMw4MYfrx@vger.kernel.org
X-Gm-Message-State: AOJu0YzVVjquTO9W8SVj1vwxRft7PB+Z/Oq7xGwZOJAP+QZAZsloLCh8
	kqsMWq7/7hFhgM2FEjYY4DVYoVGc/oD1zpF9Vn+RQmvBz2z8Nsb2ztkkko+1NR1pE96kTqqv2dE
	yecjc+0hsOfzCXI6tgqs0BSPb3ekvenv36oFtGmUyQ8Hid2i479B+zkR9ddIVUyuBR46p
X-Gm-Gg: ASbGncvXdB+E3O6KFz0I4INjS6W69RsWlviebzXpb7vWO7ON3EoIfzalBkEHSa8dLgq
	gUbyZVeUhDRg5c2yu52//YogJGH8bsuiduTekFpthspPXEUjVvSrO5uM5d4ZZrHu8/Zeo6eUdfn
	ZNW/1ajo7YqByUaS/NZqCD/zYydQFqQpVRw4BygN4z9kqHJcCkhM+o4XYRHCABrgp9qFIDS63sQ
	XlVXFrWFEVg/6YORdjrTQ2u281S9YsHIjIFidL02+CjvjKRLqyQgcTlj93tgkCNJk9+PAVZVkN6
	S+A940Q+4DkcdH44FQrzbIuqs1YaI0/0F/uNfHVMTY8uEDsfFCu9XgwKew==
X-Received: by 2002:a05:6214:5887:b0:6fb:25f:ac8c with SMTP id 6a1803df08f44-6fb47776ff0mr105472406d6.31.1749987540199;
        Sun, 15 Jun 2025 04:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnDnD2gFuBvFJWw1NO2xhhVjbSbBgo0uadoGraxhCPWnt0fyCvH3k9hDcI8uklWLjMXFdeTA==
X-Received: by 2002:a05:6214:5887:b0:6fb:25f:ac8c with SMTP id 6a1803df08f44-6fb47776ff0mr105472026d6.31.1749987539808;
        Sun, 15 Jun 2025 04:38:59 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4c969sm7401734f8f.85.2025.06.15.04.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 04:38:59 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Sun, 15 Jun 2025 13:38:57 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Message-ID: <aE6w0Ws9aoBYD5BB@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <98cee94a-c9c5-46c1-b6eb-f5141dfceaab@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98cee94a-c9c5-46c1-b6eb-f5141dfceaab@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDA4NiBTYWx0ZWRfX7VftyCP2uws1
 ePdQzKthne/X4tueK6zT9Z3vSVIpmyAe9kRXkBI1GQaYe/0lOjmSHn+FtRr2oDcbPug3Cg8qZkh
 yLq32uZVW1TnHwgL1C2i60DLiZfcfo7Z1DQ5eevzxL01zWaLknEhUGN4cUz9w6NRyv4mFlRJeWL
 LWQ1kB3/Yu7xsRy0YPu59Ty23jTT5keb/PzvzS8GCxvPjk10vJsLoyAkghE6u6dzISS9KYABHXt
 cd5AB1oR+SVHswD0L9Kd9pl785gt2FS9D0DBCcR6XTvBbuiKJg5JuG0VPNVEiEbj4aWvgNgIrFL
 KGeuPNZSKNijB4ho924E2tTrioTkAhZAtytunoQzR/L4VPpa20mMhiMiLt+uYoFMQNjfZ0AEInN
 9QstS5NhF1eTKuhfYA5h9aLtZrvxYtXnO5fpzOU8AfEd4IUuu3rWSzqG9WahuNthXnUe9oV5
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=684eb0d5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=Pi3DeBJX6SzEokaTFKoA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: P8vAnpyVM9GStYTyRj8YYmdgE_mTng1b
X-Proofpoint-GUID: P8vAnpyVM9GStYTyRj8YYmdgE_mTng1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=850 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506150086

On 13/06/25 15:20:57, Bryan O'Donoghue wrote:
> On 13/06/2025 15:03, Jorge Ramirez-Ortiz wrote:
> > +        video-decoder {
> > +            compatible = "venus-decoder";
> > +        };
> > +
> > +        video-encoder {
> > +            compatible = "venus-encoder";
> > +        };
> 
> Not necessary, drop.

ok

> 
> ---
> bod

