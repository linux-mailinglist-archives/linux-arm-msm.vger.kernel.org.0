Return-Path: <linux-arm-msm+bounces-62032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC243AE3CF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8EE5189722A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D53E24887A;
	Mon, 23 Jun 2025 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9jigie2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533D323C4E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674969; cv=none; b=uzZ1Zrm4sfiDvmGxdPW/iF2IrbKyX8t1mdUQuBWDJ9RbBPnn+ug6Yjt7f09TSsf8EXrecO0fziw/bXH6T8jYXKfcmOEVX1PmKIKlXeUg9suN6J58NYhYm2W7yv3+Kqlvtou5bpD6xWw+fW5rjopYGFehei5SCwbffNohqeMKCu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674969; c=relaxed/simple;
	bh=ZGrdGD5S4Wy80BaqqmqkdCLyn23usLGumrbeUKa2VKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RN0UYC0xpz/dJ2JJVj6GdIIwN5g7jX5+4xb+4+YXm0yb8mPNpZHh5x2DXML6hLGaziIqJtnMkS/Q4LXjXAqr4Jv1G1WzP5mQ9dJPKvhWE8z2+nXq6jPdjRaWss3O0BAEBRgdsUt0p07W/gO6K1C4nlEbAtkgn0G0yALrmGmTT+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9jigie2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N990ad027754
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GfYaxSuIzxVoUOK/O4NdD4H65yMossNv7+zfK6HzMQ=; b=F9jigie28s2Lm4G0
	JUcBqyW1XK6nCWusgni/AvmZGoMX2uSm6ipLZ2DwBGahnf683l1+hrRQso0xQkFv
	I7hoXhosNdUfGFlxjJBQuz61y4f0HaZZwrblXx3zCpbCY75Q/UYtOD1OHXCK/ZlY
	TysXKwrXnytPf2Ziv/8I9gr+PGx0FDsD/5btgAMyzXmwMkLzxL+91JIW3sEiniCh
	Ut6CNb/J+YjXNRocVzqWfruYkIgOrTQG+Id78CFIMYl1EQgXqi1AYsFSAw/Mzed/
	vBgQXL7E0LycGw3VyjvHlmx0vIPzw2oiPe+RB4kBdgNy+zZ+6wNx7QVBZePoH37R
	lexKKA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec262gum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:36:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a517ff0ebdso12687991cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 03:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674965; x=1751279765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GfYaxSuIzxVoUOK/O4NdD4H65yMossNv7+zfK6HzMQ=;
        b=EmYb3J23f1d6kUG4L1pvcXIieVtsipGgrWVYZiSH2p3NafXBJ+2tMMPC3HtLhg9YBO
         Qnp2SNu80d7waPVHRnW3Rk6lkDoieqsse5tIHIFFKVTx2uL9XpVaziLD9t8iIIDzN0U3
         nJr5Xhd0bbg1Nk7XddUa2UJr0FHtYWRf4Or3bpnfLTkKsgGNW5+0d0mIqxtmPyqPSuwk
         ufsO0fRrK9yrjB6N/PQhkK8U46ZCt7CUZskJpW37FqA3tr+dkD47FiSqqOTss/cp/YPM
         Z+atk9nx0E1QBuGoJjdCgw9lWuJ2KviYF7nJcsaKdPN71A3VRrL5NJSmCA2XhFx8wfh6
         08Ag==
X-Gm-Message-State: AOJu0Yxp5dAvSFrmWwx9bikQDptcJSVQlxfTrEvJbpwmHhJtZpbC/cfy
	y7PPjNQNw2P9XxEK2nnO7fMvFGnF/dvjApBBLNMXifWqldejCAizdDNd9EkOHpAZRDVcppmf7VC
	WzRZeZGLnTx1w9XpaNYrnOLheMvWgwpasU91hquTqKBHzUa+UadAPQh5uXpNsLYigcWZK
X-Gm-Gg: ASbGncuGvnT/fO1VaPC3AkwEg0eR4VhtVc1aW46oGHw7dvL+VVdxyXb5Anxh5SXqZcv
	51SbHrexe5elLzyfVdwM3clrc8ILT90VCJQqmUpjbAi4/ollA1xoJCJI2JYDfFg5HOB2XpZz4mx
	2jXBZgykVmc3AjJetZI8XoxkKxlNgMRucBoXHP2ObaQ2utWltOieqDpQO0mg6vi/Ct5WUHurtlk
	AUVx0YVHReTWQV9H+tULe9uCs65MOwfqEvSxvIpEJwhbSeq+uE7spNKqKrBxS+z8VRvBGlXOF9o
	+Iq60OkuC3RwyptnQOfBKGbidSNU4q4CFYMzti261jImxYvV99nhmNTaGNF0cn9yoYb1Xzevnu1
	nKxQ=
X-Received: by 2002:ac8:5885:0:b0:494:5984:1022 with SMTP id d75a77b69052e-4a797ede8f2mr29221671cf.11.1750674965126;
        Mon, 23 Jun 2025 03:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUp42df1AyK7Fldxd7syMMacQxRLPJ73fL2nISVg9GUkcQPMWOuG2N96/HmW8znlbsAgOkLA==
X-Received: by 2002:ac8:5885:0:b0:494:5984:1022 with SMTP id d75a77b69052e-4a797ede8f2mr29221471cf.11.1750674964665;
        Mon, 23 Jun 2025 03:36:04 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c90sm698271566b.62.2025.06.23.03.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:36:04 -0700 (PDT)
Message-ID: <00e367e6-56bd-4ce6-8a1a-d74b90609a7f@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:36:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] firmware: qcom: enable QSEECOM on Lenovo Yoga C630
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-3-6e8f635640c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-more-qseecom-v2-3-6e8f635640c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MyBTYWx0ZWRfX/vvWc8i0AQfJ
 +j5Pssi51CkKSAnqyNLJZOhtnkT9Y4nmv3oHIa7g6T6vfn6+WPJ4CQjbjz9BMe2Aw1j2Wx+svKC
 u+3+Pt+mzsoSAZbsRXAczt+B4ix5RknR2pgg2RXRO0IKgWH/y/uFjoOJKOs5lcTOzTsmNh8vtIn
 p3PpZzSIgCmkEWdxdxbaXPlilNEFwArZvW/dZdMfmg0xtF4ufHlXZ1rp4bFobczcIfd5pvakjn7
 XDFHVKuvZFdNXLhStGQwUF3kk0lR9LQlPwkh5eEkkZ16H0HSdrl8GrehHRDWcmkB7/rgHQ2RY1/
 5Og8wqPdYX2nhahbmmFd7+j12J3Fcnf6AEqCAFpb5WbH6qwcqbUnnr71RgFcDCD+VNnsn3Y1g4V
 g8FGPxwUiDb0zDbaoJu4UQLEbJ6WjD3vP9fxnrrXyQzvkajiiCK31og3XhLrKFCRkHQk8CIs
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=68592e16 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_iSA65KrAhrjOTfTvEcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 0WGCCUPJS1tHSJE1Xig9qYeCf8suClGw
X-Proofpoint-ORIG-GUID: 0WGCCUPJS1tHSJE1Xig9qYeCf8suClGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=783 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230063

On 6/21/25 9:56 PM, Dmitry Baryshkov wrote:
> QSEECOM driver end UEFI vars access works on the Lenovo Yoga C630. This
> platform has only one storage (UFS) shared between Linux and SecureOS
> world, uefisecapp can not update variables directly. It requires some
> additional steps in order to update variables, which are not yet reverse
> engineered.
> 
> Enable the QSEECOM device on that laptop and set up a quirk, making UEFI
> vars read-only.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

