Return-Path: <linux-arm-msm+bounces-62489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31368AE870E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 16:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B19943AA170
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1081BBBE5;
	Wed, 25 Jun 2025 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWLILeE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13722748D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862984; cv=none; b=YxJDvAnp6SEQyC+yrVglLrPtpz+ncK5BOmFbTpY/Is5Yqd0xnAWgmUfuKXqdGMpP5oVuCNS4SYb/wk9/IzK/wLbG6htul8P9AOrNd+LTnoUbD0EeMebvypE9RwhbEO8hllI+ygxAFpC7Ecbpfg/JG5fg8fOZoAKoA09qpIooDz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862984; c=relaxed/simple;
	bh=SydFmCluotLIw9NnYRQSRlGNVDDpbWd7dRM0t5Z6aZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bmi0kRHdoalYmPl0hW+p5KaAMzZxyR6wTCZ65it0SrA7GxwqUrEjcf96PiRxXwpG1FC9LifBnsG7kddG8PO1PizYE6KBsluVfbpQvVLcG5q5tzw+XhGUDPlWqamDhoYSdQMi5caNjU84jrTFWQqeBES5niTNDcO7BugW3tv+b7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWLILeE5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBrJ3T021010
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YtHGBFPnQcSTIMsJlbLHXvrcAPPKBzWjxwiK+zy8ZHs=; b=MWLILeE522ka2lmA
	VXfypJIT/XH7Ih6GykL5cILU8aGIwSPCBg99rLBhq17sBCneBgnZ0A6Kbnu4Nr/i
	5ebCPr/aHnkYWNYE/ALc/TKf30oiw7VjteQFbPKT8nSM+nqDUCv6lGpEXMTT0zlh
	XFCDMaHCnjOyRx3yL0Jq8muYN2KrDA6uiRvJMf8nq1S2otSyaktVaoUtCXnUhKaE
	E4WHErUWwSiHvzcf89DqTAUTTM1tnuBKTQJ2qweJC0D1BphBubCQj2h2tDeVL1h2
	9fx1rkypiMdZVPMBJNDXXcsVynmo36cy5+udi5hfXHlW2WzztFiISP6so1RvQ2gx
	TMBliw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwxjb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:49:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0976a24ceso208105885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862981; x=1751467781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YtHGBFPnQcSTIMsJlbLHXvrcAPPKBzWjxwiK+zy8ZHs=;
        b=h9WHMDuI/4w0DzhBK5WiwX9iyPmBb7cwqGN6JaeuBrhSQXLcJ6MNSJOy8z1tZt5baS
         +JjqEqCpRq4YXmOL3b9IVB3Nx/w8mGj/eWLJPmBBIAGZPekUImQe4/1JB2ljbFivXPxB
         lJiB0P93c9VCu0mq72abiCxCsAYV3Ysm97oO7Ylu9oE1R82DhFmpK+/gQq8qMDiGOfpC
         xWdzpGtacKHINd1BkIocmS1+SUDaqsB+WIa+BFnwYVYPczZVJVikvVGjs+hEKtNxyPtk
         EyJ12RK/Grte91l5EtOW6RH8qAgmKVUopgpXAlND6eFOLxagX3yrrGmOr3iv3nrnGGZ2
         gFUQ==
X-Gm-Message-State: AOJu0YyabN1Jm1xlrYJEQbPy56cTbEswcgy+NbdpDUDh1CTUt8Hldxuv
	xFYxMOfhN0RTGPCEA4n5DTyPJTVvRFl44/pTEwbrOjy/go8Iu7qrg+LIHZCck/ezF6lYikSR7T9
	b1atGTSMMODCiquq9bgwNde2QmdVIjyWzeKshR7dvWeBp98D/andQYQ/l7zs6gUbfvpDY
X-Gm-Gg: ASbGnctML/CwGmJNsVdYu5BqMo6c7BHyw920B0SnEDztDVb8F8BMwjpV90d+MNL0FmW
	f3hv8yjeqyBk4d/PbHO2/xG4JORoTzd3JjzEeKqcCXbyzOob/Ej1UX476uEnnqhloRRubHboYi3
	ikMBzVZd9aWZNozfJIDdUi8XgCJ1rHsOlJb9aWts4bPWHhprUCKNCWI1kP5gTbh4YhxX2g1SHYE
	Vz7in4oDjfD/LbSHZAeGYFqQ0eV0QpXOdE6PDUy6s0C4cA5/jX0CoofL5/Enr/8IauYRLqDjcvg
	dIpR2ddddILoA4jd8QiF/syU7bc8E2Zn4dbsMBw0ujseY1zlAK3Ngj2HVY1kH+Di5EQxu4rGZCp
	T/Sw=
X-Received: by 2002:a05:620a:170d:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d4296da2eamr157237185a.7.1750862981271;
        Wed, 25 Jun 2025 07:49:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCfs7blbnaI2Zj/4L6R7J4yAYp7djTR661EQDmxDWY8nDkTHOsowmqinswXsBFWVpq+u2QgA==
X-Received: by 2002:a05:620a:170d:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d4296da2eamr157235585a.7.1750862980908;
        Wed, 25 Jun 2025 07:49:40 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c403a4a2bsm1824376a12.32.2025.06.25.07.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:49:40 -0700 (PDT)
Message-ID: <c189e03f-a3a7-422e-a156-ecfae92a7443@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:49:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] firmware: qcom: scm: request the waitqueue irq
 *after* initializing SCM
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
 <20250625-qcom-scm-race-v1-4-45601e1f248b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-qcom-scm-race-v1-4-45601e1f248b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C7Qzo_6E3TCXd7zVwbeANqaftkVAQ9ab
X-Proofpoint-ORIG-GUID: C7Qzo_6E3TCXd7zVwbeANqaftkVAQ9ab
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c0c86 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=U-aTzihQr3N9RfWzTXsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNyBTYWx0ZWRfX7/2fV2EL+rpB
 KwYM+73/SAlC07FcpajDHY87k71ZyvOIhbSs5UJe9YHexebZ+tetBuI+nikYiovnnmj4vESGBKU
 MWVZ27M4oq7Db1z95ZhkwUVB+Y4xu77Q4xAn+Vw71+Akq8p0M22ObjvPN2nAnF7CkAvu9XBONc9
 Jk5uCRv+E7loCP1FwPQZAc9b2EDdmhX3FdP46MuG/GPjEVeMtuws7OlWv1vHKcAmuGUXMVGjy5q
 Vqe9fUuKgz22zcJyoCRaTg/2suN14/Dtbslrbh9CkTWx7vVvdxZOBmTFG4NRJKG56NYQsDS5BM4
 RhHLpdacHTAMLgg0JxLc4p9oNOCVPnb6aw/lCOTHuCavYi5X3F2svc1kc/AhZjNT64YFq/f6gj0
 R4phJb0FWE6r+UlMBmGhV1qtEqGuIycGCwxefLWR0BrwK2Bt58S6Thb0jIMjk4wv65WywA4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=673 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250107

On 6/25/25 10:14 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There's a subtle race in the SCM driver: we assign the __scm pointer
> before requesting the waitqueue interrupt. Assigning __scm marks the SCM
> API as ready to accept calls. It's possible that a user makes a call
> right after we set __scm and the firmware raises an interrupt before the
> driver's ready to service it. Move the __scm assignment after we request
> the interrupt.
> 
> This has the added benefit of allowing us to drop the goto label.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I don't think there's a suitable reference for a Fixes there,
so let's skip it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

