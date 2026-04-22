Return-Path: <linux-arm-msm+bounces-104012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL4PJrlC6GmZHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 05:38:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4441A441D4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 05:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF2E5303534F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 03:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CE43A4F23;
	Wed, 22 Apr 2026 03:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyQNZ2jf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKZav+7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7567D3A3E8F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776829057; cv=none; b=Xpif96aEoqNCj5yYxxJOQY/+RBKOkUty5s1akU9PlmIvm5fXH+9dpUt4SeNtLBM6tluOzUqqcuIIn/pX77RhUHvN7gDTbufDaFQFxgiQKqhmtm1MhjLKOREs9GRswG2dT/ftQsu8OPpA8lJtFAHSBQj0O00lngGNZgEX4GYZnW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776829057; c=relaxed/simple;
	bh=xjbIueYA4Sgj1eHs2rezX0kTkzm3Ilu8mFeDltW+2tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYC0UTJZkyC0PbkhmEd7tmY0pRWclbbu5oi8HVALsidT7kxB0ywsF8YFJNq2ZsNa0ZhKNN6eqo6DuzxWjCGOTUAmmmRPWIIcSMwdinsUxRN5N6jufxz55PycPTxWR2R9+JohZ5YXpr40me2HbSSDpq1k7zGMC4X1NdyNRX6Ek5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyQNZ2jf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKZav+7o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZsKk4051175
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZgBxZbAMHMtUWTZdPqMVxZ9e
	C58y9vphw2NGsw5EX7k=; b=ZyQNZ2jf9C6uE6Sdowmi9xhIauWPyS+8udKlbP0q
	Z8pDHrNfBLzcyLyhaqF+ja5v4aDqK+AzuHewowJXi5FWMfzfeJ9HXxKALkGrNZ7k
	sp7m1RuQ0nMb26o7931vK4trXoxZxiNS2rN/uTa9K77jAe0RotbhfbRssk8QAW25
	lRATgDT4IsmKiYeXtQMcFsaBn2VT9UdfjsHK9bfcm3mQq7Rm9+g672TEbYf7OHBg
	N5QEVbImN6yOOfB3gJGqDAI1LK8kv0/UirUNbHmHO8N/eSkaX+edBTbAqHlYGA5F
	Wfft7nzvwJKlQGmvPmPHGeWzUrJY5ZCDdj54Pad1H2KSFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfhg9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:37:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d5b5d607d1so961071385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 20:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776829055; x=1777433855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgBxZbAMHMtUWTZdPqMVxZ9eC58y9vphw2NGsw5EX7k=;
        b=YKZav+7o4JKUP/J+rBHrz+NBcWVUWVx0+8iEqjGGhW45SsuVWVaqS6jnuuO68fN+K8
         5QZG05OzZE1SWS+OU+XiMH7LP//AruhhvqVpDSLu+dvmd00vdN1uDJrV4jMp8DQAPA1Q
         ldb/tK75FcSoz+W1PQcjVqgmdhiE+Ror2P2ll9U/CsuoEn3SV5C+CdO3mojVvmhTnLrh
         bu+1SLiCRHkcuEi0VQUm944cPB7++xZN2447I/hv8ubdOmy/3Cqkyo76Cc5JjkF4MU4Y
         zbr/Ljxyu/vkQWY6Kzfb0L0yApR/AkKHQVkOMBezfddktm5BnuH2RVfokOb5w0SX0oVg
         QOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776829055; x=1777433855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgBxZbAMHMtUWTZdPqMVxZ9eC58y9vphw2NGsw5EX7k=;
        b=I7x97l4pLvhrRm4UQvAFd7erI44WCUWq4ElTlruhKAeddtdedFtB6iKptYXi8DuwI3
         Xx6WOH2WJggVZ+n6mgtbOQMSkwzFMeYRzFN5pF4z5xXvtAQB+LhP3lvkyjqHn6WqUWV2
         eRxQIZXJAqy26rA0wKWzI0aZXDWw4seQYvei6TJ1yRbELVfrIa1nasER6O6r7f6xOd42
         7XV+NrIr32PRu8QGqTmwg/g154nyZmxE1a/P+aH3qb19JkqSOewMn16Q82qnrSoGS++A
         dSNhSAPWuQQUUc573UBbhmJPBGW4zDVBMyexr3dN9u/a+lnyXSZIfTkDrzqBQPxxCP5z
         vQ+w==
X-Forwarded-Encrypted: i=1; AFNElJ/0CYaCv5kQLlQr4ePO+3EbGTNBDqtdPE2kVBJJgq+khserT65TIIT3HT6A/NuVP2+QUFlP/7edDuzzDeFi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzq+PGUwywKMAlnUckA8Z9ed0Exfx2rb+oC5scgxLIUMeiPOuk
	4Kzamv9ISrCzgqIx5Kkqm29/oZJQZndg7kA81r5YdELs3Q1/Fm/fRm98KpN9qvy/LxKwC2FJx3s
	NfcTU7UtyGU6KigegiN0izw3ZAIZMp0kns0D5qCyXSiqWb2CxmNXZ29s3o4erzl9/PnMn
X-Gm-Gg: AeBDiesKGmqQ/Z1tecRgsSOKAJQAaOACXRK78/aBQzF24CigbF/shgBnu26dqy6vZux
	WzsuWUpfqQoTG+hswEGJkLLSxuXo6PeVZzmau4/q8qKYPpYOuIbAGIQKBB+aLiYRtISY8kJnaC3
	kCBjBb/Ij7sPTQKvKl5CQcw2m+G1ceLPNYf7ve1lbwiu8FisNSwxqY66YuHWi3M0K+vDhz1Yqwq
	JShbA1ySr+qHnWGEfQ3NKUowAm8IQFUom84K63Xr1N637ZllhYGJcO7w6xlWxl5w2ok/T8J2UET
	OCZpfIJbPraBYPeCoYbkbEr+QWEA0eB72rn4JvWx9Iw1YAx4UoHRuwRKfixtjGk55+++dxrt8Eh
	2zc0d9Hdl5K2ulW+3dCyqUwy6RmjnWfx+S2hva4BNlkvdUMLIba8hkDJgn9fdiW3oxMXU2Qy/ju
	52vqyFgynSyeNChG8UUJHCJ03BdCUQc/SGoTQUmCIl+/Jz7A==
X-Received: by 2002:a05:622a:1b1e:b0:50e:a1aa:2cd9 with SMTP id d75a77b69052e-50ea1aa2fafmr137315811cf.15.1776829054837;
        Tue, 21 Apr 2026 20:37:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1b1e:b0:50e:a1aa:2cd9 with SMTP id d75a77b69052e-50ea1aa2fafmr137315431cf.15.1776829054348;
        Tue, 21 Apr 2026 20:37:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebf9bsm4111620e87.81.2026.04.21.20.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 20:37:31 -0700 (PDT)
Date: Wed, 22 Apr 2026 06:37:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/13] drm/msm: Add per-context perfcntr state
Message-ID: <wfarxotu3lb64ncqmohysmyrdsneg7lgvq7kldcuntshtciob6@nej7bduzff4w>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-10-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420222621.417276-10-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAzNCBTYWx0ZWRfX2ru/JDhIYWPl
 IZInjoPEXA9Gx8oJoTdJ/DZThALIv297Bt9tx2MFcxmAa8UUpKxDvF14VnjbtsWQXi9oqyMqmXr
 HEVDoQ8X0A9Bf9+mt0Pb5QyZ9wEfI7UjYYsmPTvYvpP6u+TMpbMmbR2edBazTToaVxXKZ5p+ehA
 9+5mHVxuT0A7hL39J+m6FyhW/f3EgwfuXowfU762FkiotBVdJVvuq4vICFb8VYBd4sjhfOBu48h
 Rhx6xdGQuQfa9tZ0XKPT7nJNDy4tV6HuFxdR80YE1JeXu529vN6+19QtfmLMQpEdogQVLZhaG/C
 gaaYSNBdP+y2Yv0cQrqyV7fB7/wJTVAMR999/YaqGZWfcap5kKdIgKz0r4dOrtSJThCXS2YlnXl
 ya1Y2AV2T3jtMejHi5IJ9l6epYgpIxwLgkzYwSikKF9xg5Tt+R3F1xZq54rKRDDwQrJi3arRK59
 uy0N+l8M/hptbUJBXCw==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e8427f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=N42bA-zqoIAmhXTfU-YA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: p0ORYbtzPJ1BprWtvzJfBAwM1LchkZCs
X-Proofpoint-ORIG-GUID: p0ORYbtzPJ1BprWtvzJfBAwM1LchkZCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220034
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104012-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4441A441D4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:25:31PM -0700, Rob Clark wrote:
> The upcoming PERFCNTR_CONFIG ioctl will allow for both global counter
> collection, and per-context counter reservation for local (ie. within
> a single GEM_SUBMIT ioctl) counter collection.
> 
> Any number of contexts can reserve the same counters, but we will need
> to ensure that counters reserved for local counter collection do not
> conflict with counters used for global counter collection.
> 
> So add tracking for per-context local counter reservations.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

> 
> +struct msm_perfcntr_context_state {
> +	/**
> +	 * @reserved_counters:
> +	 *
> +	 * The number of reserved counters indexed by perfcntr group.
> +	 */
> +	unsigned reserved_counters[];
> +};

Fails here (Debian, trixie, gcc 14.2) with:

In file included from drivers/gpu/drm/msm/generated/a6xx_perfcntrs.json.c:7:
./drivers/gpu/drm/msm/msm_perfcntr.h:130:18: error: flexible array member in a struct with no named members
  130 |         unsigned reserved_counters[];
      |                  ^~~~~~~~~~~~~~~~~

> +
>  extern const struct msm_perfcntr_group a6xx_perfcntr_groups[];
>  extern const unsigned a6xx_num_perfcntr_groups;
>  

-- 
With best wishes
Dmitry

