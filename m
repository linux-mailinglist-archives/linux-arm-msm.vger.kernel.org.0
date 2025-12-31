Return-Path: <linux-arm-msm+bounces-87121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1634CCEC24D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3524F305133E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 15:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEF8286425;
	Wed, 31 Dec 2025 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdIEmC6u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hS+X32VJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CB0284694
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767193638; cv=none; b=EMoZ8Jp+s1tZG/AnS5ouKd2cDtAf92ZerqvzFCPoUWn6aEpyPaihIdtsQBomwXzgv7XjQbqVnYna7DAeMNlZvPUqYPXmAG067AyQSVNtS1ZWxDCYkFawIyXnUYq2JWSSMwxoYBXDSOKdkb0py/DIu+8zW8A0Ua7v9aq4BC0EmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767193638; c=relaxed/simple;
	bh=ZGy0gXAgLAGzsAjfV45uexkvw3UL+4LlW4oY1gKD8d8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qulbKlG/bGqRy5HOvdS9AsZhPVB/8MqZ8q4DezYSNiZ69AHMGyF/G111tCglenINn7Zplnq+f8vAKSoyfEnZQh+qlFcj2Q2bX6D37i+q0reB70RpkEIvuX/aICucDdNrh0v6rz3d7tT80UaI7cTBcGusWQneUAi9tphgmY6dU0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdIEmC6u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hS+X32VJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAah1Z2284786
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 15:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a7FgAf5lIkjvaqH1drAYd/b3kMECc+GBVT4OsiiLG5I=; b=MdIEmC6uwF91DnVB
	AglVJnslCJHMgZ9Zy6qWchV4DlfY4SrYF0p57Zj7/DPKTVXtx+gP/CZbmK+g9Hpr
	wt1UsEh5U+yNo4zg2LYWQqKl1M84aIhIDir8ipZQDrvZl0bYYstzYMBaNbLnAD/q
	SbN3CRsqmeGuuQVyPUJmAgguSdw4rfAtRGD9/NsMHdEJTvv3I5y7O7VnFcjrVAV+
	UycsunOo++2+YptLhXR0XQX1kZhnWAzqapkkZRw77GHpLc4gHZk01vN1bJXtkDtB
	DIWWcWX9v3IE8Mzq930720wDbfVp+n4VxgSCgkCayJV0AYl2VlQPSFgMEZkfHVYH
	LBER5A==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gvnak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 15:07:16 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-78fa833269dso1125057b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 07:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767193635; x=1767798435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7FgAf5lIkjvaqH1drAYd/b3kMECc+GBVT4OsiiLG5I=;
        b=hS+X32VJMGAEwzup07zv+fblw5nurJdpKKAblOJSBU/4yS/cntckgL8VJw10uzKEj/
         5Qb4BL9O6aiXcrjc9cmcuHX9tZDLxxml3+5TVUwVSmLuqppTcfI2IleDWEvokzlJUFkC
         QMBSAhof5hMJm5AJyyINKOZOkqZlNr6aN7TO/fpr/RgXMFkCsu/RkgUn3cPPK1gbSXW/
         xKEmN5P0zKirL5xgX/o1jXkSTZJtEZz3w/fvRgRXeaXxhIq+VKl/ugXL5/uTdieZqeoo
         r+NZId51bogU78TUC4UlOIBkha1YtU3GSV3SmYqmANv0pQ3QmP+9vJ7BkE1lPmjkSmW4
         JXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767193635; x=1767798435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7FgAf5lIkjvaqH1drAYd/b3kMECc+GBVT4OsiiLG5I=;
        b=ERS/RT8U3OqZSpa9EnqBy6+uXmnLviHmUiqEUSzHT7LtD3psPFYoLpYCY5H7zVNhun
         zbzL8HEmSMpeddfOHxZhZe4ippgVx2ecIPlTXhnHX9p1YFPfGMOMvPaVG6jw5BfFMGpY
         ZVbwGHhBa3QEAj/cT83uiSxBAqKwsBWuHw0R/kGn+uJWPLinxWoGt5tkVB7/T+IHNXmF
         19+eRWwt08ZwekOSGf4j3UvnMo7iuDukPa516e1ukaGXTf9zXunCw72ob/s+zm6KYeyQ
         IoBACLkNG4HI9M1VLQsHQEr7IVwKWJY5ziE/sdWtPMEP2D0YnqtK0Gzawyf4/C5v18uV
         R/YA==
X-Forwarded-Encrypted: i=1; AJvYcCVoT+80b/jSxU6Wb7UJNkZly2TrCuVV8yJ4/KJLGrFULVIoX0AZ6tQw+QVugKJ8ep02DabGoic3rmp4BCZp@vger.kernel.org
X-Gm-Message-State: AOJu0YxcUODguatnLDeqXJ+uGLet99IF92wTCLoANaS0rDA7tfcpGyEK
	tbEwkCLqlQiMkR2HEGFrsw4CS2hJgkHRUiQqDWLHtjd14lJc041Icoo7rqEnqF7759J6nxM3ydC
	6s1qjrzdi1bQ81JeoeLrtjeW5sqWgveSp+ZJjBgpzTw0UhYC3+i03dsRd6aWU/LnOaNPV
X-Gm-Gg: AY/fxX4Y8gavf0E8vtNhgfFrq48b+PY+EjNxFnptTwoBhEV3UUg23M+QOnw6JCEedIr
	l52jnl7an47+OYdlxYbHZ5Wyl4l8AEStS6l85GX7e5Z8uMYa297HtqLK3QjK2He8NbGunvPi3Nh
	fIpjYmGVD9QkvvAbl+9NB5zwWjnUpaOqqIE9dZftO2qLcyq7n9P/BszmPWvP117MfXKlPqe1ZCp
	lozfMYloRju6dqjao0ohNWkXfJmjc0spaPR4Zq/PrhK9s9B75iu45IBYDcC0+paejYF/1LJROG1
	qa7difns8LEYG/IcZPzabFrlNw2qotRSbHHakPL0wpXcBgpqO4MngKtpcM65G1iHSHY/DopZcpu
	uU0M/20Y6Ma6Qc88KUjTWlnf6M10gxte+iy0Xdum2KMIpGaQEqIKq1mL7iKBAMqD35A==
X-Received: by 2002:a05:690c:c509:b0:78f:84dc:5631 with SMTP id 00721157ae682-78fb4079c4amr275437037b3.3.1767193635218;
        Wed, 31 Dec 2025 07:07:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkGREhmDidPwgNOLHvaU3b+gcfSf66tUqtMwq7Fis7u7w9JGyoeWyauB1ziPQraDgT4c7jCg==
X-Received: by 2002:a05:690c:c509:b0:78f:84dc:5631 with SMTP id 00721157ae682-78fb4079c4amr275436847b3.3.1767193634725;
        Wed, 31 Dec 2025 07:07:14 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b83926533b7sm610133766b.20.2025.12.31.07.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 07:07:14 -0800 (PST)
Message-ID: <e3425607-abdf-4db2-9adb-c609366e684c@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 16:07:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs8300: Enable TSENS support
 for QCS8300 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
 <20250822042316.1762153-3-quic_gkohli@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822042316.1762153-3-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: leL8SDic7TIMZMZABzohYE16O4SuUV97
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEzMiBTYWx0ZWRfXzRuNWoTx67Am
 dK3GFUzT07LaB3U3moKfT4XWprmxviVrmGFPINc18Slzu4Ts2UtuHxVCnp2kTjYH4crUxmf6XCb
 tO4tSBEnMJwaGwYKadr4IlJluvTrepoGYkLCPUjyR0s1U/E3hakKczT5nw0TstnDL+zVagKisaE
 I2s3ihTexkXY4m2p0GJHqOGOLQJR1WThmfZgPg7Jd34g1+2ErqJY4zwaGNthS2E9gbk9PW3EcMl
 hFauA1HHrS44BTaoSekR25h2oScLNSNWTd3ND6qKnL8Ei6f7LVnGSq1brGKGedZQKtjtS+xIS0X
 3QUyLwbMx1NiTq+30TXbCXsH3B2M4rvcapmaVpOJ1F9dAY3CFp8gbmit7XEPKh439TcCOSFSmzV
 i3wWxTK8PrP/JdMRJEtc1UVmW8BEete7y72ZpnrSUW8BeRWsvWFkry7rEibQI3DYs8v0taKvUeZ
 vAmw9mnObOrYQA68bSg==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=69553c24 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9Ko5LGA4_2QTng4crIMA:9 a=QEXdDO2ut3YA:10 a=ttxTGWTNN9wA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: leL8SDic7TIMZMZABzohYE16O4SuUV97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310132

On 8/22/25 6:23 AM, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS8300 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

