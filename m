Return-Path: <linux-arm-msm+bounces-88238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C06D0838C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 595843065DCE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6173590DA;
	Fri,  9 Jan 2026 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+acctEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4DiElQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DBF3590D2
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950909; cv=none; b=nDeppZHNSop2qM7LCukSFRdVFdBx0YtPBhceUIz7k3Qiy00Ypru3I8j5TwyNsV76MXhVJBWjA0fxAM50PmmTnPu+K1y9aQQ+i+J9T0O9eoqE5EMc56IUCk0uRGV9S/DRvO6ZN7U6EK0f9CmSYfKWr8l1NsjhsNfjDDMml0tdL6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950909; c=relaxed/simple;
	bh=GlE8cDtRF/+zE/jd1X0Q5Rzf0lO09oMaQJAEC8FzyY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Az3s0UeCkOEHxHZkJKgy38N8cq/jJ9tzNOP2GaLGm/47VLyNRg2DfuDF7IeES0tNW/zZT2aAuS7Wc4ciltt5ttVQGQu8LbdI8AEFUOlMgWyvEe5y6eU+zKbpW+XJo4YtqFOwdKNHe/2uGJCblBydydu8968RwU2BFvSvqty8mfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+acctEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4DiElQc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098JaC42330318
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=STtnyGOg2NIu/uNJVJ06kY/m
	sqsNO5lW6rnuZrw8RZ0=; b=Z+acctEvSqrsylzavXwAgD8xBuuGiXuPioT3wsfm
	s7TgwpKK4HACcEsV45emmQ2u4jSPuKnz87HbeWNhCDWlwVlOUKXyx6pEdHFUSG8x
	YqejGUKnYAvksqwfHLQCzhC/VHGdMNjXsGht63jjc5pQvdPaM2braaZhIPlnuU+V
	BYrpzlhj0bTGIroDQL0yItHvWRdnkivVOowkEmLwM9UBoPhOZOxq8hxwTF5Y3ekz
	WnPxzY9j+6UYAaklhX2pJdzlVEfGzS5XwvTf7hAnFRBD3n1G/cGDNjW08iHmHo/O
	IRe4XdbzKpLwYeUGPy58NwOVv7Wd5Pb3MOmoF5+nHBLBqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdaasg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:28:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f183e4cc7bso77372981cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950904; x=1768555704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=STtnyGOg2NIu/uNJVJ06kY/msqsNO5lW6rnuZrw8RZ0=;
        b=Q4DiElQcvpdt5lr3wwNMOPD4nlkVZJCzTHpoXDj0Zb50cyP7+gNTcAvCXwviBAVeX/
         LlCPEYov8DwRdTU85IIymcN19/WNgMtgh9TKx+1EDIHem5nsszq7SluNxhtrDmMKMAmU
         SSe2uuRXfc5eU+4p921E5T9J9CuAM8J6vpUz2r7lBEhASZsk4oAmMPc3mNPjHMDaxJhi
         p9kSIM2zcP5g63fRi4ViHn5rIpe+fPMNDTI8O9Ti9XOAYFN+V4jQel76m+OCcB9UrKph
         385IPFxuruHZE/8awNBnXIHtlDUkCW8AyeVFT0B764KwH80MGfWSHHNl6VM86WaS60Do
         9syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950904; x=1768555704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STtnyGOg2NIu/uNJVJ06kY/msqsNO5lW6rnuZrw8RZ0=;
        b=egpnUmJ1fDlXpH/xtqip6OCTGeCfooBtV1e2YzEPylLutqkjkzWP1YjdXIaKG/z7ac
         EZuyQZKh3x9fqnqmIJlK5fCqD8aqIiUM52yiO0m8Ic1sdYAEJuql+H33Xct01Hkxui2d
         O67l0T6WNPD3a1x+JsqVrBSrShVmBytsdljecewaKcmEI+4CH4pYMKq/oN0JE88DBJvt
         h74plqc2M04QDuof2HsSfGKGdwCYC2483Yw8ox7SDhqTiUEaLBZbHzngXP31kpHjShFS
         agn89mFhMkHnEIpEu+GfsDHbzV37m74Xmhj/4UycgRr9B88VkDh7C0yr71O7IFC2mBdt
         g/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWcrylUhSoCR1CWzthMvBdPI9CO/KGHo5C0bva7/cMB8zycbWjHuH//RhaeS7fek1Tlx9s1KHzeRuiEixAW@vger.kernel.org
X-Gm-Message-State: AOJu0YyRpR3wHcqExX4j2wRjkHW3NTWybYo7yIPSBjEvC3RmhZGwuowp
	TxApOg396vb2siyvwpZN+oTJNBPGa/ib/tIYEMwxWivEr7THJ/1U6LTCKQ3UnioIwieebges625
	H/uidvaaEXkJf21dgzKrvtfridjjGcsfqWmnUjoaTE0gTD7UErRXwJw8X0I3LeaVxbnQC
X-Gm-Gg: AY/fxX7MtqyOpr0l2GcZhLG8qLaJGzjNXseSeoizRM4JNM91TpmRxkavyr7fqkLI1Hi
	mZoDRakszczdt5pvXEo5Nl/AM/o+zGOUOZMk+wsdE64CjoGY1hppGxXgECZKcbeeiVQwz4bevIx
	ZnjbLbzR4L5iS6eSD8Ss7x382xQJfxgZIMkZ0QEdtVk3U9sVocSrUW2l0sCUwbmsFahRdGBlESU
	PJDfLl8SF7nZZkEnCd5jgj1byoHj92xTGWnfzoCXE4gtjwuVmW+pkAz1oy0y0KL5m5q+ta4u6P9
	tWJj8+bhBuFHdgsh6tm5s3ZfdBQuCZyyanwILSkeFQNT6B2BtqQ8ZqOFTIjWI2rAfw4tbnKkpMk
	URKNRhGhk1q/MqvA9K/mA
X-Received: by 2002:ac8:5211:0:b0:501:1393:eb4b with SMTP id d75a77b69052e-50113943c7amr1458131cf.28.1767950904277;
        Fri, 09 Jan 2026 01:28:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGntynPokqJGsp7t5mjjfXgI6WdJO43V4JVRK5YM1au7l2C00V2hGNLCql0R8jMOF0a7oCf1w==
X-Received: by 2002:ac8:5211:0:b0:501:1393:eb4b with SMTP id d75a77b69052e-50113943c7amr1457921cf.28.1767950903815;
        Fri, 09 Jan 2026 01:28:23 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c3f89sm10012517a12.5.2026.01.09.01.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:28:23 -0800 (PST)
Date: Fri, 9 Jan 2026 11:28:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 14/27] clk: qcom: alpha-pll: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <mp4frljbgcdcqdidfdqsew2brj2kchlyvz263wsw2c6q7jkdbx@rlpoogwbzuqw>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-14-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-14-535a3ed73bf3@redhat.com>
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960ca39 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: DP5Z6BwmSUCziQu5YATIn5c7HE7BJK2J
X-Proofpoint-GUID: DP5Z6BwmSUCziQu5YATIn5c7HE7BJK2J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX+cvmvX+QXCor
 ODgK2rblkL7EBdKOQVG1BC/OkwhwiqkLdN1WwDsfjlME2vV/owqxmypDe8oawRc+v/Urit2Ps/5
 i93cEqKXpasZUne+AcKIogeDam/C+oAAqYcgM/aCeLnmpaZezf4DPL128p+38Lk1mrigJAyPIiB
 BpEHbTYD+cWvZ/sNhgk5TOjPaeaGNJHGCy+bPj0E0ni3P6Sh2C5UQ25nHxdh1eXEA0DrMWXR3vH
 kEAxXVng4y1AVHps/wpr1TFiqXNjqkcxQiJoco7Pw4/wl1rVS2raEFdoywulSWd8Fi2RALTyfn1
 whObTlVChYIq/kl6onry+FwOFRq+UGS1qVygXzugIuqDi+ljJxDoLhaTyDaQMh1JWac6uMobABq
 PUL3mE9waVfVfLvp6VtXbtg7en8RgOSuFg4XyMXDJpr2wBxhf85L3rRDN8CTu4RsqSvXmgwa/sp
 Oz7lhS+SzrpUYltlYWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090065

On 26-01-08 16:16:32, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: 0e56e3369b60 ("clk: qcom: alpha-pll: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

