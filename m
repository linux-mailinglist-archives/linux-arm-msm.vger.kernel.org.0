Return-Path: <linux-arm-msm+bounces-76321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E942BC3C20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 10:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA5053AFEB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 08:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D462F291D;
	Wed,  8 Oct 2025 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+2oxcFl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C7434BA3C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759910889; cv=none; b=iKllgUa04wyOxSmgL0Mmuy2jGlKoJiqEodDUeu3frsH7+lz/LMeJY4LEL3D6HkQHrlP2VI6poGZquvFXU5ugbiDt7QbiPX3LHxB+mXuTtktMeyTtKZcLJ4AuDNbzKZwGLBNZgREMLH3k6zI+TCHYW7RaCSnMTcmkGPcifQFvG/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759910889; c=relaxed/simple;
	bh=VdZzByrGm9DNfUL78lrekrQ7xUzYKB0wMwu8ejZF1Zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLWZ9eYpk/x8qfSZMi7HVGLr5fLrDsIHDMFoQeh4dxRs9J2ZZHhH5bq/BDjkHAb9J6DIPR54IAGX3Q89r8CJyHUmX2QjJQpytXGDHCNRMDI8A6Qiqr1RffNKFIakKfeWv0fRfxul4hcavD1rU8G1VR12qZA8ub2xJeElQ+go2aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+2oxcFl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987aVGs012341
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 08:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnMEMnaUqNraMukID0i6yy+MPFFPKz7o4wOoLN4ozFI=; b=Q+2oxcFlWtwnvkJR
	YA9/+F3BkFJW0U0+VSERXQxFok8TL859aIPcz1V2YhogjTt8kCE9lwU2olbtuYOF
	erNZ7Rn/C8LqKH54HzAwDW90congUTHn/nHDTxkey4cfzfdmwXdUrth2VNwUhVfZ
	Pg0aeQId58XwfmDsuk7MXJLVoAMZEwpw/Q0cgo9fTAnDsANfP3GLDJWcEtEqyI6j
	l7pkklMDafRmrG3U+nmekkt0AX+RZQ/JPSQT2cMhEQ88z5I20tT9Zv4yttn/O4Yg
	jL/EY7/FL0vkGY1U7IxQoFGERTL06A1O4t1/S5iF73P9o1/WFo8nrQdd8g9bG45z
	C3aS6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgssmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 08:08:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8649a8dbff8so123793985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 01:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759910886; x=1760515686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnMEMnaUqNraMukID0i6yy+MPFFPKz7o4wOoLN4ozFI=;
        b=DLg//JDogec5Qvn0b2kJzqL3phjeVyz4idvxawG2fGH8X9ZatX/SgosyPeSrk3osWG
         JJQy+CQoA3oHEmUz7/Tj+8UE72H8TCthm1uF4PG8fqQk6Pltr8IvAeGv/VKv96syiHXU
         SBj+OfhluIR2FR5PtEAQJB0ZHjUBLtg24dpisX/JzwXwyF5FklQpa7HW3IRd+ZuwiYwp
         Qcz6xHOurR7wi6UCZMC4g+ITuliQD8nDf8myiDeFgLaVDYHKvJIdGS4VaIXq+GoVtEwE
         dDhCZGC7GcfOs3MgNmkLSYclHO++AK7gqjN75fihALsV6GPselEhNvMuQZfguCiP6x0i
         4vqg==
X-Forwarded-Encrypted: i=1; AJvYcCWkFa+szExfOemTEmGO9lBRhFZDSooaBccKFJiBxL6lqHXuNI2HwxJ/xozscsifYRGjija7vqP4jcaoQh5n@vger.kernel.org
X-Gm-Message-State: AOJu0YyT+1dPN+1Gogc2BM1PE3WpaptdW88oh1RRWS+Il12wsivzriDB
	q6Ida9zzJM+AfomIkjIUw2zqJQiT5zCLMlLilF5uobN7HtHcH729tpwvkcXgDObIzThanHDe5Pm
	I46/vWZmgLiMyTnjv6b403jaQDQzlW7N+DAJroCnbSKd4OmAgY8fT5RDzQQHjoFr8Ehy5
X-Gm-Gg: ASbGnctV3nLslxDvw9pq1Y7SxTkkSKiwjqh37SfZdAQQgGd29NdL/2qdim+Tqm6Wecm
	fBqu6759ZsSSLsARIxFbP8WWsL3uxmVZmpD9EuVWblvrAi9Rqp/LH7+ra/TuzCaJ10LDWVwOn6v
	kGutRWtPpC1hj5eFmy5RVDeXiTnk+qTOQJTE1O6wY5/zdey7ekC4niDe7DOQcsTzZiTbtGoTbz8
	o0rQYwVrSQYuoUTlOxoI9SLvvyF1E6+iJgWnnSLsDz7yuheZp8o3p8aSKs8ePEX70wmgBD+k4rD
	7sgFcEtentiWPoDM70TE4n4sC3l3im0WxsaXVXjq8ZMA8Q+q3ljN23ggkFxnNxnXYnUEMxfSBta
	zAaXetcJvQxHHQAhssjv3rz8Xox0=
X-Received: by 2002:a05:620a:199b:b0:85e:3ab2:960e with SMTP id af79cd13be357-88354ac50bcmr223784785a.11.1759910886377;
        Wed, 08 Oct 2025 01:08:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/zf47wSrjlqtPLG8ILcAawn5rD+RpQ+0R7AZyfqB1Y4zsUZzl2+3Yu9BwkSfmCvg9QGzqlA==
X-Received: by 2002:a05:620a:199b:b0:85e:3ab2:960e with SMTP id af79cd13be357-88354ac50bcmr223782685a.11.1759910885805;
        Wed, 08 Oct 2025 01:08:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a177c62sm1568922766b.91.2025.10.08.01.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:08:05 -0700 (PDT)
Message-ID: <9278d526-4759-41ba-8c06-da909479c3c0@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:08:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] media: iris: rename sm8250 platform file to gen1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-6-def050ba5e1f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-6-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX6rWafi/AYLU/
 9t+Igq5tsgcIGERQiGakZyILVsYl+7EW6SH7qHmNvVbKUIy6oL/o4iEtUV4iAOawpzFMX6W3maN
 YmyLQD+kOn+YCpHtRnHvvY865lOPH+BxO4dJn4PDOAg0yxtNNwdq2u+5zzYzKB38tqk7PzfdVzQ
 xs0GSnvxfgPQhy/2mXAznGYoSpsPWTy9w5HqWrRg2S++h1lzQNEd8q0QUhF6exVsM/E7QNWttm8
 AevZQfEZY2NeltfGvksZA3XRdX2wM04BjDnyJsSdQlrEL/p4Z53yKfHT0N4zVAbnrbgaC+v1+Ox
 6v+Cthkra2xFIVlp1/ZsfNlCjmIMtlKUcBTL6G2H2nyN8XOVb1Caz7oHBohzbnEqvFwyURRK08X
 iPdR1g/RkfF/zv1ZHZrnnvKiGU62Yw==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e61be7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=tkggsdbV04ru4vqEU2sA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 0yDyoGVTwltD4JSOIRAi-n3UnGbNs4iY
X-Proofpoint-ORIG-GUID: 0yDyoGVTwltD4JSOIRAi-n3UnGbNs4iY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> In preparation to adding more Gen1 platforms, which will share a
> significant amount of data, rename the SM8250 platform file to
> iris_platform_gen1.c.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

