Return-Path: <linux-arm-msm+bounces-62564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10281AE8FCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 23:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1FBC7A1725
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDC31E98E6;
	Wed, 25 Jun 2025 21:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jE5QY8OC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A311DF247
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 21:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750885414; cv=none; b=OY60aMSZSbqpKKJ59EvM7bfSUdII0RHLWS4O7guXFkXFcS+ljilstxuP5EFjSY8pXlQ7g0S5jgaFpo1fnvqPbM98UAKoi+V5dqszlHGwE3qbMPpuvwPlPbB4EvhusXjpygOZ1ltPjqwLYbx2IMljdgpdSbpzjVALX8ceb1GgLA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750885414; c=relaxed/simple;
	bh=BA1SJ7BB+xjW15IIb8AKZyMEAqBjcfpDeU4wKnF9SNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCLt70gZPxzXvRLBDSwm7rV9GnW6WYQckt1RLBfUUz1DkR0smeibfXKSGcRuRs1fwyOoWIC88jmyepxdfKwdivdC5UtQHKdR0rBOISj2C1zVMIc4cVif9S4p/tbI2rvci/ssKKyNO0P1fpcQqqqNvhtGTFBc6wejjBlm+qiR/8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jE5QY8OC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDhg95021903
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 21:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6G8NazoQCjyeRDRCOe2NN6H/
	BOfkB3FLygIjOlcUYwc=; b=jE5QY8OC95ET4xnGwB0hcpWGffIshWW7qDsJ7IbU
	ODJMc6E7WrvkXfdg6/UTmUu/+QwSdIij1tBuUMI5fuM9jU5adiawiAb5P8k/Q1VL
	oYggcBezPDsNBp/gx05kv/seoUZsbs0cbD8fdWYYbUe1ztlcvlI5FzXIQM8FE+Uv
	kFheIsCpk4cT70gNQXsj4NzCuZ4/H0AEnPEUiqy+iatYPWx6X1BvoCGWTUzMxKue
	9XcuZ8m1GnD7ovHobwgw649P3wOqRBYHoT4AjMf6JEIMi1VurFLHTznQdJlFqO2j
	3vkLesROGNrUcSCNVHFZaSmywIlOcis53kzvuZVBHWOOmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgh6ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 21:03:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3cbf784acso62980485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750885409; x=1751490209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6G8NazoQCjyeRDRCOe2NN6H/BOfkB3FLygIjOlcUYwc=;
        b=aLky1N78NUXWdQ5qrxKyZiz5vvyIV/pfssMuKGaRzyilFIRqsFqaYcUeW1oMs2uCXR
         qHxtLjyGxN47Elt84/eLWNmmibycR1mRpo4ImpYeGLoMwDGvpRt6Yzgb2YARfZAl4ufm
         bdPyY2+TCqX5uAs8moB0YeSdIFcq03Lwdtf1CybE/AyxMaLnBxub/x+wKCQyVL0lP693
         6f7b4SkZLAWb5/ofpzlpxOTuft8RH3zykTuhr0/s3mVb/xywvP/doRk5/ukAWIj80A/5
         9T3LMsyY8gs1OwvtoyYGcm1YjMgITkwOcg2wuidwuhnoFPdv/xZ0S9hgI00NSqsRek/u
         AIgw==
X-Forwarded-Encrypted: i=1; AJvYcCU82tu+eeblvjIY+qFO2jvbLaablDUIUMgG6062Fi54ucjAh50nGnwF32xcbiFBKyoHkql4F2JEUXWmuAF5@vger.kernel.org
X-Gm-Message-State: AOJu0YxHf8HusnB7ASZWUzs1Dd4pBfHkfmdgM9SrDIsVrsy8LYcRHl7V
	EfhYGM3uFHHQLt7oG8UA7jcRgdnOHZkHAeMhaqnBDZ8N+sSzLBSwHcopJ5glcTMn6VYiN4m7QSk
	Vamwith/oqFF5aYd+hu4JHp00ZkY7flm+pQvB5KpmFvInn0xjSTGOOdZl3c/mswfO5NKS
X-Gm-Gg: ASbGncvgeMFYzaQb5TIGpapoZcEZYJdZ7Y07Kwd3YLqGIxIx2aOorhzrwA4dVwlhOdD
	F/vg3h9eiZPKqgQrZr9IaolYXJH+A5GhDELNJOkmr5HLJ4TSyt/weZMEBfzpLsbG/N1ggqBsrh2
	7JBYrtNzpoGc2lWNGfaGBRBMMYH19s3jhPDWPo2e2CuSZEArOqj5AMetDBU2hOMc/TPjfzXW2p8
	cgwbMjTvrBZDHk+4a8ZQCQsgPGm7hDp8NOfD5W09JRy2lk3TgIbKpU0tBd6Aj9yrwYxdZd8KQgq
	8HjsQiz+jf1T4VXTIStuGtnvnG3sURi7j2lCjeI5bE4Rh5siz2uysUCu7oFY2z1MK/qktsW03Tz
	iLyej+JoqrqWGV3dm0evBLNFJ6klFb98+uD8=
X-Received: by 2002:a05:620a:6293:b0:7d3:8df8:cc04 with SMTP id af79cd13be357-7d429754e9cmr611510285a.35.1750885409409;
        Wed, 25 Jun 2025 14:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7oKjmuvEEF1WQFmTjT2Ttz48tRtbggO2WDZJ3rR8g4bzcxgd7OZWfwRoKuiaa2MrZBIv4BA==
X-Received: by 2002:a05:620a:6293:b0:7d3:8df8:cc04 with SMTP id af79cd13be357-7d429754e9cmr611504685a.35.1750885408782;
        Wed, 25 Jun 2025 14:03:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f594e0sm20999961fa.23.2025.06.25.14.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 14:03:27 -0700 (PDT)
Date: Thu, 26 Jun 2025 00:03:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
Message-ID: <6zut6hiwig4qanrmloqvibx4tmpb6iv23s3hp7bb4ja6jzzia3@wnre6i3mukbp>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
 <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
X-Proofpoint-ORIG-GUID: Dnl0nnKNsh3eQp1PhJxjU9I9xkSETmK3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE2MSBTYWx0ZWRfX5H7O5OEjRDm2
 JVt5nGqfnVNszCD5tZ6B2gBWebugrmIYLmpHp29QrCPWtKINKMI4yXzVhWLPd2L0joDsiCRr0Hd
 cfoQgMD9ef449s0Qf7lTwdeSine7/OjNCGDKGZQ5TWBtJVXGldz0rCcHyo2xbhHETyfIVu04G59
 IRCtYOMIlL6D9tmPpccvy78OqY7uvlyZOVQELWlWmvHC/byibKfEs2gcQFXJ51kwURvr7rz0ll7
 oVnk22S9ZSS77wZ3nKokJ50BxZVHavI7ZElPp1ogJN5HC98+bsLfNaBxAPl46IZNqXFc92yKJpI
 BalvapQCLMEpZ6PQ5dHHWe7zidkru9Vey2jg5WF7WuVXiGcvcavW2rbJGvsrrzfKCN0Tu5YtqC6
 C4rc8hoH85py4TWVZQwN/wKzk07P21TI1qvbG9iFEW8Ns9f1lWS7tPuxHlMyW7IaCMIlx3FD
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c6422 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=TnUiieDH8m5hmC2EXGUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Dnl0nnKNsh3eQp1PhJxjU9I9xkSETmK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_07,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250161

On Wed, Jun 25, 2025 at 05:01:29PM +0200, Luca Weiss wrote:
> On Wed Jun 25, 2025 at 4:25 PM CEST, Dmitry Baryshkov wrote:
> > On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
> >> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
> >> and the devicetree description for it.
> >
> >
> > Please use PM7550 instead.
> 
> I'm happy to not follow downstream naming conventions if being told, but
> do you have any details whether PMXR2230 == PM7550, or PM7550 is just
> another SW-compatible PMIC as PMXR2230.

It is PM7550.

> 
> Also we already have qcom,pmxr2230-gpio upstream, so that would need to
> get updated for the PM7550 name.

No, leave it be. We should not change existing compats for no reason.

> 
> Regards
> Luca
> 
> >
> >> 
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> >> Luca Weiss (3):
> >>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
> >>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
> >>       arm64: dts: qcom: Add PMXR2230 PMIC
> >> 
> >>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
> >>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
> >>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
> >>  3 files changed, 65 insertions(+)
> >> ---
> >> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> >> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
> >> 
> >> Best regards,
> >> -- 
> >> Luca Weiss <luca.weiss@fairphone.com>
> >> 
> 

-- 
With best wishes
Dmitry

