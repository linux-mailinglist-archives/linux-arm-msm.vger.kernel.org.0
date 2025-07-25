Return-Path: <linux-arm-msm+bounces-66727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD6EB1213D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 17:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FDED1893AEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 15:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1D924677E;
	Fri, 25 Jul 2025 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDuXdink"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1663624418D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753458429; cv=none; b=Mcv34VD/rkqjqp4f70nm9oFUofvG7e4MKhr8J081UK1ydcEAv4aqWwwdAnY9NTG0/nrRqeyRmzFG+bcB7fhuurWgh94wi7Z/0Z8voOfUOjjr6JA4nhHyDVQwcvPRSGsZJR6D/497vaVoP+ckyfgOeQDPV2IPXCpSdYdNq4cnWEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753458429; c=relaxed/simple;
	bh=CgpahaBjLwCMFIXJPhPy7ticUfTP99e2tVM7QSYJZxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TV+Y6m4n2AlrrvsngDDRX7V1hi4J4yTAlqGhhUH1DgfaXcWUp3BA4d9bfUC7XvtpdNcOkRLFbRIL7HcwVFAFjYAt1kWIE5PE/Mm/m7OkYWKEgNpcq42hWI+qtBM15acFISQ4ZeoD3oMM18J+sH7hdAGApAMG2aosDD8o78/v4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDuXdink; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8rhKw004498
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 15:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xKWzN4RQnwx1/G1Ilo0cVo6obJ0M8bE9e3o300R0dhg=; b=FDuXdinkKfnA5KQv
	iYbkuz/m4hDQp9DeCCYo4lL608fd9nTsGL9Mwi7gohEoT95AVCBP26T7sIskoW15
	Ndt3yINBjGYjMYJXx/9Be4Ff9KGP3eh75IROltmOwC4AyYT+CK84+DI5LC9rN1nc
	Y2kNUiD8hATk7lw1vqT7k2kq53EFX6OWEpAri39a0FEVCtxWu8eA1+xl935PlpNz
	wwdT1dwG6dVd1mYSLxDXQ3spswD1tA1jTZs3sm9GCi8YZkYp/ul/Q2rCNAxoekEA
	oh4WJ0J709UdS33UKzB2yJRgfuWqKe/AMFOVWhQNsz/e7nscsUPq7y/bdZEMoCJW
	PRmuLw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w53aj04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 15:47:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369261224bso23961335ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458425; x=1754063225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xKWzN4RQnwx1/G1Ilo0cVo6obJ0M8bE9e3o300R0dhg=;
        b=fqrW8RN8xnbvw2Hwg1bgjNDLTR1QtCgqW8BZQI0+wx06JX+QpacM1poREhK2eQynI3
         /++FdXr42A2HtBiVOFPradTCdZY3GzCjK9HpvDuytsMH6pLZiQGYnuh8PjdVQf2CnrVE
         ykttR4/luz1zngAZQPDML0yWy7mFmybuYTEk5eywGLDobcgIDuEdr25Fn/5QieHgh4oy
         TCIdoY2+vw2/MWHldHhJeoCzKz5f3aYHzAXABX0211d1VO/vJMkeWIgD5iqicn9nhoZS
         s8zm4ZcK6S4/lXXyp0D/GQMeMyliF78LCe98XD6lHu4hRJ2kVpvWqBPK+EzSis9wCe9X
         nzLA==
X-Gm-Message-State: AOJu0Yxyz5+aWE/ELwD4C73fZcC5Yo32nZmoKdWKrzc+zeSDxzMxqIIp
	XllBzBa7pisD3yuFI2ZKRdubdqoEmFnnnxI3jWoFhlJXvCRuQmHPMSrYNWTH4uywMFg+1ECq3/W
	S+ANCGG8Gh1TMl3SZ+n66/t5+9tV35UleHsbUV99tOJc1qq4ch9NNa2uDQv08tfyXwA8g
X-Gm-Gg: ASbGncs1LhIHrxFToTlxmUCO64jJYvMrx/C52PXD4Mnn9+7sYJXW1tj+Nf7GDwfzbL6
	c1bkgf3CE7ZHVgobOnYsZkfsNPwFeEeP6tM80vEyTylIKeCXrbbh4JdbdELagUGFOfKYP0XSGWh
	wI8dzqjQ6tzVRHtCcU3SKjrULhcm7oX+5x9frX+LCaMJR6hMUoluRHbyKxF5Ir0KzVpleGzK//3
	lIdSTGTFa8FNv3zFS0iH4lKIpYvsXGYnFDa2kXWVFS1XyiG9zAdFVwrLr2xI850BE6iRTviZpjR
	zXK1q7pFb+RxSQS89FnprCBv/IdNY22KtlxYORFETTvsUkK6gDJIDBf5O84Q8ez5xgqdZjANMBR
	9ZKtqMKhu9onTHg==
X-Received: by 2002:a17:902:e5c5:b0:235:f078:473e with SMTP id d9443c01a7336-23fb31c5555mr39338955ad.43.1753458425361;
        Fri, 25 Jul 2025 08:47:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3u5wS5G/nO4TNexnUpgWTgxPvcTdxwD3jiwmhhsgJT4z3eYr32MID0faDDGi1QAU8EjdrQA==
X-Received: by 2002:a17:902:e5c5:b0:235:f078:473e with SMTP id d9443c01a7336-23fb31c5555mr39338605ad.43.1753458424984;
        Fri, 25 Jul 2025 08:47:04 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe563f1bsm203115ad.184.2025.07.25.08.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 08:47:04 -0700 (PDT)
Message-ID: <1a8a43b8-e9b1-40f1-ae16-ec7e0441324c@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 09:47:02 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update email address for Carl Vanderlip
To: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250721220811.962509-1-carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250721220811.962509-1-carl.vanderlip@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AfKxH2XG c=1 sm=1 tr=0 ts=6883a6fa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=XHUaY7U8O4OWe9Nk0CgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEzNSBTYWx0ZWRfX7cDEDGymU1CQ
 Twn7svPnBS3kNoL8Jx6T3OSeAT30mPbIpgEMYBH6oE2H0lOUAPVr13xbLriz4mV8gFAgORO2gnE
 pf5wm+YeIOuRXliB1g9j8lhLhc5tuwnf8VuQkCsEfzPH2FgOtGCDPRg/chbU2yYk4Ldq3VuRO1V
 2QVXq5Q2FpYy0krJ/lB09p9nGOCPYCVUd4LtNOh8c5bNJ3SjdV8Zy3JsnWX435lLFuOMg5/iS2X
 SVfqE5f8ckrnqTJJzb0d6qEJPY1e/SCy0utlHHLS2qAopWrdL21Z5aSI2xFurlFiT2RCR/MA4sO
 bavyL2NKQ5gVj4xrJ4b80TnICjgDIHjdRbDo7YeTKJdffCYowyf0EC+HR+GPWEE6N6OZmNIYlKI
 ySxHXrSA8VuIC4vJ48Mc0rM6L6k6wn1MouqeV2vB2QgVgPdrzVY3JvrfRa5SUunkM7yfpSJu
X-Proofpoint-GUID: 7WPKX84ni5FbyChCB4RFH5DSF73UjjcJ
X-Proofpoint-ORIG-GUID: 7WPKX84ni5FbyChCB4RFH5DSF73UjjcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 mlxlogscore=555 suspectscore=0 spamscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250135

On 7/21/2025 4:08 PM, Carl Vanderlip wrote:
> Qualcomm is changing open source email address policy.
> LKML and other busy mailing lists use the oss.qualcomm.com domain.
> 
> Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

Applied to drm-misc-next

-Jeff

