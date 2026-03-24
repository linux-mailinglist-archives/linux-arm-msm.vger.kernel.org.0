Return-Path: <linux-arm-msm+bounces-99584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBIqO2BbwmnQbwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:37:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA4305B40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE62A3214A43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944713DE43A;
	Tue, 24 Mar 2026 09:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSu0JCgA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RTbMzMZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B71363C49
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344243; cv=none; b=gBvCDOuBKffw/ZCBW7rmUrg/QB3W8/1SZW2yUtOVySkL5DA4YeQ8fiLA/g+tN7cm1IJNbnv0068TBRK8oeYH8vzBxjzb8UklTsXjq8EW5r8mlOzy4TG2zDtbWj//nz5LxfWWyT5ZYfER6t0RFo4IFzCcMtVWTZeBhzZN67uAGAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344243; c=relaxed/simple;
	bh=m/+iU9AxYGJL4LGf5A5k7jWuFpjgTw/8f+xNacKuJac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbDLv2O7G0ZL2z2uDuYYYvY8mxaYGZADNUgm7WUbs45/AUIIrZwSSowD5aPzl/pzg1sqhwUHZqBnCJdaJg2C23AzvjAu3mWlDBaOkMu4MS6JAn5atNnoDdHX9s4aHSwyVI3Aq4qsXsb0jw5CGk+qQPxIVM8PPUmpi3WY51VJYFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSu0JCgA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RTbMzMZ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xqW42323409
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3YK0/akJLM7CPIvSiwDnz+wZ1B/Z9qONHpxp5SmLtKI=; b=bSu0JCgABCKgkMYl
	0fSBF2ayYG16mbf5E/Ms8NB9PW3yyw1us/8IkABXacJQHfRdDPBvEnaJira35IyZ
	G0F44aOHshhbJefYWYeKq3fsLxd+bkxPaqj1c8HGbsdAd+uLw83QPV3JbsaH7s1O
	D5zof1thvlnNeI+mHENsc/ugIxxs7Ud87MfyHqhKCItm1c/XDeMkp70WHQgclnha
	OvEJ254+G3kqkfeCyGpFvi5DJk/UqqCiWMmhZ4sM6LX8n1Yljn4pTASIAikn95FA
	Q5KUQM3tlCKE541mK3buXLK1znYxfhjWrLyNuT8xSof6KWB2Fky+lBJoC7sta+xt
	W4f6BQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qker3aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:23:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-895375da74bso46066746d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774344230; x=1774949030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3YK0/akJLM7CPIvSiwDnz+wZ1B/Z9qONHpxp5SmLtKI=;
        b=RTbMzMZ8d7eDFBBmCrYfoXaAzDoCPrYZbFxggV5ynScO2H6H4tJjatn01MPJNBNq2p
         LbTi6g6VjvaPmBHq5brqD3uQV0/CEPC/nbROQ6U/676FejrHsBb9/yiH/6hn8Frzi3m0
         5zfrGEa2/81i6AMVmtSu4csmgdWiH/MY9sJM/Zmo7pKvP4ntiNlRi/JX6Ue6knZlG36x
         Cf6I3XD1iPUF/Lukh075TBFyIUTkzJrSmku7K5dRvbiHNu4V6+pOJ39AhAE44W9jcHfJ
         HCVSwFCiUviXp6zdCIgsLcuUsmpk15Uq8P8CAO+i7jLVtUL1l6M6WZjC0H+WAQZK0ofC
         eH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344230; x=1774949030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YK0/akJLM7CPIvSiwDnz+wZ1B/Z9qONHpxp5SmLtKI=;
        b=G5xFF9KCK9XOqS0lNBqUh333yVdVXa53exPqQPNxMO6w/FIQOBZ2ioSmsvpCYYLnmj
         bpt30Xf1QAB23UQSeAOPGbKfsyGXTgjNgEfiRsMGXdgZvkzcLlVmJ0FGVrki3ND0a8BY
         XShQobDesuhwd8NU1rrQW1edhw6iyte0PgYpySsK7+yJEPW+W7jHYg0N2eCmJDc/lB6l
         cCoFo0obru00ipJsU46lT2g/dIS5dy/rlnjyvuzseaXnwy0ZfxK16ovGs+B5mJev+g6g
         J7bAob0C2u+dXjYzA/yhiEnXO+n01UNyXoWysAqbi9e8NtZxMp01CuHoIWwgHKom8PS4
         2VeA==
X-Gm-Message-State: AOJu0YxkenGI6fR5vArJE/x4xDlJ6eF4dgkhx40P01Z6AEiKv+1CwDBM
	2PKikdoapGPZaYCnh41E9/tj1WSsQ3bHw7Ydziz/I4i6TOlQadQg+ixOhgAmFJ31+DkZlA8XiUU
	h32Qc3GWalg/MQePRCOfDC/M+3bWPEdpw8sEOlS3qtznzXjVHxWouhc9ATgB0DyrWSX6u
X-Gm-Gg: ATEYQzy90+6TkOtYacqENGvIIk8ubrMyffr1dghy8pI+UDP6hCEsyE87YCVPIC3jFdb
	F294V0mv55BxtkGZ9FblDOjeRNWRcg/EetAyYjovsaLctbfQhLTzJ6PCeMWjKXooMUWzZsj/iG4
	G87v36I+uqsZaKQh3UrI8tV+eU75w+1eBBpfujZamPnXONKBnYL8SeQ5eubDMA3MbIn7dydm7AP
	Sp6STBw6wFjjYCQwdmpWA5W09s0nvwqPmWdd935KVAKMu5PYM76t0C91feB4It6xg02k+OMhTzk
	jmpjuNyc47reYQsyLyCtWcuIqUXqaApK7AURovO3C91QPx9yv6sfYn05eJ63RJQ8dq7hRHWhyt/
	rvUxelKsmN5ZvvjeVBqqW686i3W0Xw401hAiupAQvqfIVLRTRijgm0pEnsrwoyfPrZ83iy8j7L2
	+1JD4=
X-Received: by 2002:a05:6214:d8a:b0:89a:51ad:ea14 with SMTP id 6a1803df08f44-89c85b1d077mr186848366d6.7.1774344230498;
        Tue, 24 Mar 2026 02:23:50 -0700 (PDT)
X-Received: by 2002:a05:6214:d8a:b0:89a:51ad:ea14 with SMTP id 6a1803df08f44-89c85b1d077mr186848196d6.7.1774344230006;
        Tue, 24 Mar 2026 02:23:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440f2sm612432666b.5.2026.03.24.02.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:23:49 -0700 (PDT)
Message-ID: <275cb08b-598b-43ca-a880-9681db077d16@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:23:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Add missing aperture_lock init
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20260323161603.1165108-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323161603.1165108-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: __jmZhAo3tz-p0JW_0-SHIiMit_jTjIt
X-Proofpoint-ORIG-GUID: __jmZhAo3tz-p0JW_0-SHIiMit_jTjIt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NCBTYWx0ZWRfX5r0wjH8ub5mk
 9yAitFN2wjEjQu9o5yVQ5Wqpjj0VALEv4iWM5kw2EaRIldrqhNvdFNo3tHNJKRNUB0/iK+vwgml
 cR8jFNBZSrrxF/kiy1YF0fj4aHpvUUBI9pyQzwtIDdB4TU8hiDsxXJ0LIMiN5MCxNdK8Fd3DEVh
 XfsZzb2Fpu5JWKn2LDld3ut2vNngZhoYj0TIr0hRrJCPNsch3lutJvnvyWlvc/5hGutBmR9HAuR
 XaP5YQGjDktUNiaIDpsGfhcD0t2RlDXPJPBrpHjQq42v9HkIRZpgynjJt2M7zVVRIDVpXqTCTsg
 EMmf1+mt55+y3M92Mqy1iOjLLYV191MNE42W99+zGpqaflmTrI0VQw9i+mHq/m9hoUECAo+p8ww
 huaVAg0Isx21wL4MkvT+yHw/g3qpgAQQT1w0EAxUq6/hrggtweCvPPM7ntpJhn5rjbs69czR6YP
 fXCIlessmgCuKEePQlQ==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c25827 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99584-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70AA4305B40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 5:16 PM, Rob Clark wrote:
> Looks like this was somehow missed when introducing gen8 support.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

