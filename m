Return-Path: <linux-arm-msm+bounces-99001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBe+NLNnvmkiOwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 10:41:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B712E4724
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 10:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36E2B302DE72
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 09:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8105030AD15;
	Sat, 21 Mar 2026 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2g+vSe7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmETAMwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB76284690
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774086060; cv=none; b=o5HKQD6tUHkOq6d1+kB8LaUNs1SBRM5moI+/I7ypFB/T41h3UbC/46pKBdcMcMBft5R4sXm0Jh3r9Fd4AjYdmFjmy9ddFurG77rhzkmQeqPmb07/UVh/WhIBWYWh7xD9rD8sJl990SxdZiBh5VNcxKkQPThqaQNgPgwhRc3hIes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774086060; c=relaxed/simple;
	bh=eh/2M8ss7jVx0r7akVgK+/XLYyUSmSMYse/1Hocd5u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drU7nbKOfgj2xG1D9y7RYCtWgCY+Y0BvND5vqgQ1AKjNQnnocv2GDqMDfHVvemg7LTtl4lZm6YiJAeyVVzk5768NBPPM1ifs+exmeqsQb/C2TwCjMj9OQ/N8IieFgGaDTRQWpnlz1ePT9DHAlIwGJDwJs1S3xjoDr2Tl5cN4caM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2g+vSe7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmETAMwJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L4nBGm3549642
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 09:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E8eyVsiy2jHKw2brNCiU2TLB
	Y9m4sV+wrIiTlH9UwN8=; b=Y2g+vSe7T79pCNdZaV1ssVdTTGxEeKkfNm3J5Mcj
	wrGuu3ZH6AB1Yt4fdtpXnK2ktonT0C9MIcFxICLxFQq5OsTx8IKCWkW5aB3MfG0Y
	QrzQ9PtrJzJ5CBJTQZ1ePoJku1iECPxVtuSIp7APVLM6ilHel15xMcZDdTmkh3U3
	GeRi7FuSFBZp7TlGDWxSm7d8LRfq8zZ1Re+Jxm0UMI62dIAVxGk8iOeOgOIy7/ew
	Zyf18wITZR5Zj9Km+QoGT5I6pL1cYw6ckHbhdibJp25fnGb6p1URwk7g9HcYLa14
	TNg8HKZJGbyMpkjwvKi/MZyM4Rjh58g/kZtWMpsMUta0IA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1gpk0p52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 09:40:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090e08dcfcso199002311cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774086057; x=1774690857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E8eyVsiy2jHKw2brNCiU2TLBY9m4sV+wrIiTlH9UwN8=;
        b=XmETAMwJjfZ7UXYefkFzfKHzebn9ak+V9OI1lQnZrHYU/W0ahPgNBXxgb/Txd60X/1
         8B1d8XhtCTm6EEkxKGTimbgZI4bVVplOZs2mskLtAD+JZpb1bR1a0Suz7R/VpO7aDIoG
         wtK99OH3U8IxdCJqTymMYqnS6pl/wHnTZXSaSLsjgaZY2Mmhf80ZS8VmnCW+eDX1YaWv
         Io4GS67TfZ5nRGlRBZnkOVTWhXvh7sAO2U3W0VGGIh8HC3MGyHnKjGKK5b2HI8xJxIG4
         GrM5dIkfshv8yQTAEa94+zFKq0q0L9q2adU9X7y2MjgiK6QI4QJmNJ0FJLHdWBtE2YEr
         i1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774086057; x=1774690857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8eyVsiy2jHKw2brNCiU2TLBY9m4sV+wrIiTlH9UwN8=;
        b=cSiDum3AdFJ2iOhaWG3LO4T9mnwzYSBdMI2/6e9TsboNCf9yZrJVwvud4HqNZSNDgn
         X2mwIrTHOn70rLLucy+nht01onqQDgr6QuP439f9/DacAUUfXKddOEgJnqkjLKHimDG7
         0bUC28VJQBYDxU2GPk6q7k4AuDn9JJoZHHGOhhs2yQyvu8Va7b3PvzXxcdEX25sJMRYq
         mUTUWJ9yY1vDgJJM7iFt7y1Muktc0vr5DmqiIHq0Ca2pacOJA5FcgbHTjjYHG8q0yFAI
         qdhGJpJyn9vTfDp6T8Jjx2zyUu+kMeDUwTbg82pUFP6FZRmdXXf1zyBExhI+aAvb8rNA
         0/gA==
X-Forwarded-Encrypted: i=1; AJvYcCUFyd6l4T4Y2FqI2x7e9FELXatdYZ0qTolai0hkut7x0HsSLacQN0FVhlOyPoE2cFlpLwDVL9QOITm1DRNf@vger.kernel.org
X-Gm-Message-State: AOJu0YxEAPRATLcT4cb2/Jq13NjH/z2JGeb8FP538IjwmKTBWfb7EUUz
	i129pO4slUJvRZ9rTrDVpuWAw+Cmd/isv7Up6XS7f1E366BtRPAuYepV+OchCv4c+6mh8ZS6zOx
	e010g71xQSmppE25twjIOp93L68kjZiTbJpZ7XeireXGAIKhWgfeXUbXFwL1WRRn0iliq
X-Gm-Gg: ATEYQzwhpyfSn10wMzpUjNQ2lJA1p8/hBK5HMm2fLGa2zEdwQmul8dSaEDeNkdohY4j
	kTMv81YJ4Mwp+9jfr7utn+J8UyPo0XtZHH3sazknR+8nnVDw6wq6ymeWD3DvQARI2kPpC7dUPec
	AfwgzuT/FigoDI9is+06NwIeCZY5ZPSyoUm20bbDdQvjUtCM/jdzDxvo5grDUz8Z5A7bbUC6MS3
	ZSdQKsPcL01nFApxGy5httn73ykmVMOF1PD4YYSCys8sDI+rjQDBwmLPznIfh4LNiZTgVDx6dri
	vFvdN3EgHtfFOaR6EbWO4RPcVyYrrvlwdGuwg1Jg35RSk62i4UgtN5AK0xeGbjkpR0+siunjCZW
	uCVeUX9vJvYYBB1C/3Bb56vXcBNiMWjqeJw==
X-Received: by 2002:a05:622a:1920:b0:509:3141:312c with SMTP id d75a77b69052e-50b37505585mr87976201cf.40.1774086056774;
        Sat, 21 Mar 2026 02:40:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1920:b0:509:3141:312c with SMTP id d75a77b69052e-50b37505585mr87975861cf.40.1774086056260;
        Sat, 21 Mar 2026 02:40:56 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644addfbsm13456033f8f.3.2026.03.21.02.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 02:40:55 -0700 (PDT)
Date: Sat, 21 Mar 2026 11:40:53 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: purwa: deduplicate thermal sensors
 with Hamoa
Message-ID: <45vlqcgpehvxiwj3djxc7ikblldsbxvcvbnr22vt6zpm4uhd7w@oenyyprgfish>
References: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8kuZ2_APEOvqnv__PTKXhVfdsju30N2_
X-Proofpoint-GUID: 8kuZ2_APEOvqnv__PTKXhVfdsju30N2_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA3OCBTYWx0ZWRfX8aMcFn5GZGmr
 Sio/za2Jjkyp5J2I0cehtutn2DCUbeEiN20NGRrg9okVUbV8IZ/bw3rW3jYyRQ+csf0mdX3ioaM
 wvvejuhD4AIWZ7Vq0jveW+9CnegCXpRz6c5dTvh8iy49UE2srUYneAc/I7vEelSJmnE2GOO+Y0z
 bVNL5Q91rmU8/nGstujCGt8CAWA6kVn+piWp2/J5SD1lm616Nb376gBd+Hp7TwoGtVXapAnJ38B
 6H40IHj6RMUeba/IOsGPZeDuJjNrKRzCGglfNOAORAUU+H/riFLgrDzKTdnGhqsEDAsjdKIeNZg
 1x2jQ35zSMT7lD75Od9f67LmENhy8oGqteHcx/hKcGr0jA1JWH4oT4in6FYKK0nd8ASb5Zj1ejs
 NUNW949+c5TO6JHgoFrsgBjkTWAELNSeSs/iyvTEwG1o2NKnLPR0tg18YduM44z1vfeLwFl9B94
 9Y0IweWN5u+kn5MahGw==
X-Authority-Analysis: v=2.4 cv=QKhlhwLL c=1 sm=1 tr=0 ts=69be67a9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Z6vw3kXG6mT7Y6y0E1IA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210078
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99001-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96B712E4724
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-20 04:33:15, Dmitry Baryshkov wrote:
> Hamoa and Purwa have pretty close thermal zones definitions. The major
> difference is that several zones are absent (because of the lack of the
> CPU cluster) and several zones use tsens2 instead of tsens3.
> 
> Instead of completely duplicating thermal zones for Purwa, reuse themal
> zones from Hamoa, patching them where required.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

