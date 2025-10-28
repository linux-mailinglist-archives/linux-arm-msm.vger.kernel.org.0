Return-Path: <linux-arm-msm+bounces-79159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51029C141AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 709924E53C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFC72D6603;
	Tue, 28 Oct 2025 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFcwfuy6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979029CB3C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761647266; cv=none; b=YPDNLFTjYdaaQ5YkZnySa+0XqXXqe5KicV0H7H5b0zHu6sM09Hw4PVvqXhNfEPpPV+dhwoAfZ5NQvIGipE05ML108E/0qssWA928umZQKjsbirTj2IfhezG0nqIhcqnaMJwQ84snIcE03HwMXsCB5YRnOgJaDGx2iUOApTFRtOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761647266; c=relaxed/simple;
	bh=JRIjRko0iU+3pC4lIHzKRFyzb1AsTuYmzInlVTjXafA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3p8GFYgbqyVlYTgPxJH/khG90+7ua5WT+MPdGSDSvKym07+R60FPdKhefbYPCeQ2IYf46dPDrOptaVo9uCVWI+zyDykyMRq3LKn+on6fX64khKiZTNgz+zz+B58004Tcafm6lO9TFVQ7VN733F7av9KxefqTwZJUPLxQXfySm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFcwfuy6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S3gri13165798
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jchqg3ozjDw/eWeqGxyZ6hjH+Z28PRs9xP9kxhdu6HY=; b=ZFcwfuy6vIKIFkxi
	imJGODU+en0pvk2iwTuHMBkiDpK+NbZNnIIUzv8VbZZJWQ2bh+y5M0Yr6xhcXHP1
	Zcc5gI3wLZ2blW9v5uWTnB3tiMiKDqdRHp10mVxmhCvWnfiiGCk1TU7jlFWkZ7ox
	Gq1c/uylZJKe8+Ipnh/P5HedI3GdVzehjj411CKRdBuOcdRsQh9CnJ/syKQ8EhZe
	XrOrSMhIc8oY/K3Cl3iKN6yVfb0jkezzbImfrI491DFBA/TdF+t38XNb2b1rbwEo
	8OPFO1Tkv5wsz+PoFcQ3vlN6j31GrwnbMt1EmNifhZTqJ1C83RCqr1TJ340zQrwu
	wGwOJw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2bwx2v4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:27:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so3911276a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761647263; x=1762252063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jchqg3ozjDw/eWeqGxyZ6hjH+Z28PRs9xP9kxhdu6HY=;
        b=klQxs6PhTGpac+LaXfbnZZBD84ArbWouIyeTj+ZySFOoAUlL8OIhc8jxd4xdbSIBwW
         28cPAKwbJTCSuWs1Adej1SJpKhNmB8SKlCnmwXGCp2AvBMxpo4HuLPrD32fbYJ4EWK7E
         Hsl6OaNgYLjs4lfuc3QQRoXShaeOg6VioIYCjtQdpLbh2ouiMUNHcPyD4J8WNwzO2QnA
         6mY46cSfrerfy1OAV0qifIYbqElTCKrtufnVrJMfwvuoGOeub0k6NvlxvLEMyE0raUq2
         sZ28kdB9Kj5AhdPMdNIq2WUrjyeYLnj5X09XnKyOK69AledJHomHmnWokngOkJwCx9ae
         rpiw==
X-Forwarded-Encrypted: i=1; AJvYcCXve2MXdk2BMOD2XJEEjiMj38qb1SN2hft2llCUGrRdrNWkfJoV1GgGsoT6ewMww05dVfJ1heLsuJVX0UXo@vger.kernel.org
X-Gm-Message-State: AOJu0YwzlnOUoIMzpZHTmaYynsAaJKnKTgWyG+nWJtrWQOBvgriXgT4E
	Z+c8zd+pV+vrRDXDt0Tfa19meGWNbYG9fn5Wy+fktRZGXSSsgRGhh6oGZZHFelcHDJvtFbtlNLH
	eP84m3Pu2DnKu3dj7iG+28BZV5JgtAWhfAvBD/IVUAuQwyxBhWBznKqkKrrStgljcRvuy
X-Gm-Gg: ASbGncsk47RB7F3IOz5h/+siFHqMueiBg8M95za4v5KJIeFUbsQdMotxczdSsp8gUDN
	Y5NPQdQ9GvHT6nqk8lYjlTtCYpXeD8ozvq4R+ZoO+k1JQBwe9siftrfwaXaF+0l1GIVBfS1l5Ck
	7/7HCwWc6rZ5APAKVip+O5qVo3u8ktrR1D2VlnEL7Zdke6I13dtY0HR1KTpyHfHa3GJ47o8lnqg
	GeS0GijbZNWSbqp+OV6qUJI8qdaPCoSHQVBFMANGG89ap1ERG+vVgU6UI0mTbd7EvoVR8TBcdfc
	9wYE1YYt7QfJntf3ySLsvvI2V2omdDOpXSaaQzG5drXzy/i19zJm/4qo94XNiAxaV1/FgZSBNxO
	GOdLjJsWykUTi6H+Hb3VTD2dEnDx8lrw=
X-Received: by 2002:a05:6a20:258c:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-344d4712b60mr3554323637.56.1761647263025;
        Tue, 28 Oct 2025 03:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbJCIhZnhAKWXJ8GYzHMDoc2KKe52AUezo9ceNq2KYJVkwO1Il0nxGryU4eVO50BD0ZWwktw==
X-Received: by 2002:a05:6a20:258c:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-344d4712b60mr3554301637.56.1761647262559;
        Tue, 28 Oct 2025 03:27:42 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed74028fsm11610806a91.8.2025.10.28.03.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:27:41 -0700 (PDT)
Message-ID: <32ecd9d4-15b1-46a4-a496-7619de771f39@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 15:57:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 3/6] media: iris: stop encoding PIPE value into fw_caps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
 <20251027-iris-sc7280-v5-3-5eeab5670e4b@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251027-iris-sc7280-v5-3-5eeab5670e4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4OCBTYWx0ZWRfXyIGhoemlXh12
 tmMitP57ORnFRMD5oVZXTi7Z8DPB8/xt5e94yYRr/EfyPTsYwij9CAy7Ey56W9FwMptdPnC4Fz0
 TCnW/pcPRCmO/fDfAn9hNYnNMiJg78oOQ9nrIFIIfaaeHrdmCFL/ZyBwgo85pLxWpShRLf0Yk0H
 hXljNh6xmGBux/EMYKjA6HHe/k0U6o5X4CaoFLac3P6qfRSsaoVG960u1EXA5IXs942UU0c1SIs
 KtY2bxCgq1npaXrsCdgR1sIk3u208J5njC9BtwDbgJGc1lyWGdf5Rv/3iXymoTGr5JUnXaKReQW
 8mELCvhsCMx/KBzSA/MEW0xt/UfmITmTUg7EQiCyJYIlMfaCH3SBuCUCFPTig7Kdm/vjMCb23aW
 KWZvSrV/AOagbVxMzmNGTyeLrz29JQ==
X-Proofpoint-ORIG-GUID: FSDYf4eG_I1nDKaydN_cqYmhtXvbtsj-
X-Authority-Analysis: v=2.4 cv=U9WfzOru c=1 sm=1 tr=0 ts=69009a9f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yKFMg8UGa7aLXV3ZWeEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: FSDYf4eG_I1nDKaydN_cqYmhtXvbtsj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280088


On 10/27/2025 5:57 PM, Dmitry Baryshkov wrote:
> The value of the PIPE property depends on the number of pipes available
> on the platform and is frequently the only difference between several
> fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> iris_platform_data rather than hardcoding the value into the fw_cap.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  4 +---
>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  4 +---
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  4 +---
>  4 files changed, 16 insertions(+), 12 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

