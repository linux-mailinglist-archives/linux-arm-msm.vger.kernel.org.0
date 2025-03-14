Return-Path: <linux-arm-msm+bounces-51444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A171A616BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 624F51895C8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 16:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2743B202F8E;
	Fri, 14 Mar 2025 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6iOGLmj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C29D202C4A
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970910; cv=none; b=Qh2lqfAFZE4nCVPYgyra8BF1zAcWjzqop3bzJmo4UorkFwpno0Ia0pIC79R5Bs3fQsT8vqxYm4h+ZMrACSZjmuuXRuyVelcxTT4c9YNqa4TTxLe+ALLckGi6sfDQFkS3nkuEcmto1tlVG0/FlRAsO4H+gaavJgV0JhRi8ypgoHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970910; c=relaxed/simple;
	bh=BBphB9Ni9HCU6GQ/JeDL1EksZRG2kNJoG6TyDZDa97k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhRkQ4xXCNMUZm6v5sbjyMUTAuVx0AsSPwvp1604EBS/s9FAB+QuTUIxn7Z/6aL48h2zprHQuRwBKoiZH9ZH8KiFnXHd+4Jr3cSaW9/2AhfpLN/S/Ygl6HlH7R6jVAjJRqG15XgL2iHJUKXBbU+Sn976Z8Z2vlySnZ1VGo6cRtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6iOGLmj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EAPIag020001
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3Gd7H8Bv24SmM10/rMAVCiU7Nh71WaBCpKeMYYM7Qk=; b=l6iOGLmjMQ2zmro8
	GC+8PR3GoStWrvUfBkdmqlJgewPAKU1nMTb0XJT9eooxpUvaMWzqzqMRQhMEUMsW
	eoGiUfOHXoGNK2NGg0qDhEdUwhsxeisOAEtY4qrX7iNL9ZybQpgGhidrpqdZ+v1H
	exebn8Zud0X0BUDdArC0sSJw7FPOrt+qul5gKetTF5NJNxdN2UujzNzvC8Dj5lhz
	sbrlB6IcFOHCtYo3edCw0X7ZT3td3+CaF5IJxf2RjyuiNyTgFAsamhC5wLVN2j66
	+z65QrJdvO3l8p2j0Ieu5Ee+FMOSTGueRN8hde1Dn9coSbGBHmWbFq2ICMvvhvHP
	Kn+TnA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cjph0xe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:48:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-225974c6272so36286145ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970906; x=1742575706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3Gd7H8Bv24SmM10/rMAVCiU7Nh71WaBCpKeMYYM7Qk=;
        b=vFRRtcPrcbDHOK8R05tU/jvxI6DcbCuF4mWnoUDeMZ1TyfCiitIOlLFZRk/ErmOSX1
         x8+6IQaToCJP1lGIjOnDI0B1K3NxthO9dTvJTI4U6WOiR6X/xtyk7dGS0j3w6rg+FncI
         3Mg/uU8aUV7ivqmUZkfsay/DNLnUb2Sq2flv8M55ud3IfUmWnJaDZUUoG7IuEpM9f4B/
         tUgSolasTPfFThpklv1wPfyR4QcWWLvrTObmOPqY7KC2aXhJryTRns/R8uRujmROPB8u
         onQZsRSL0ua4tO9RIFp5LUSzmYMeQEjgkUmQcXz0oP6qDJ7ZBKuhHHQmnI7Xlw0l9nBd
         36rw==
X-Forwarded-Encrypted: i=1; AJvYcCUF3geKB0LL2UCg2ttmy6okfyE6QbFnuHQuGjjBlFkK4zo2Bn0wCWhw5/S5QWa7dAfokTESlPflbr3Z9VTq@vger.kernel.org
X-Gm-Message-State: AOJu0YwjLpOo3qSXsU32xFfQPg/zGD57/HbJQPmnuumz9mMGoEqCT/xU
	swY1GhVKl2Oq/F0FR5AYjkhwE+0301aQhNNU6M5UxZVmORmYTNrusYSK3W91RzWeegAK6mu1XEY
	WvgEB97cWxTuqVLms1GQVS/RhxOozA8etCz8F3z6mOqi9/Frks+LpJ+soUmaO3/gX
X-Gm-Gg: ASbGncuO6ctFZCFJru7BTm6NbAC6f4DNGQEH8POjpx8Vn0YeHYHreKoUNwViIUxvoLZ
	lXeQFjPEhbU2J6IidmcvJrfY+1vPxbAi2+KYsPa0s5nFOL8hsZU2bNO3fQiTM1UvtDROUupQqJS
	1KSNbI4yhU64ikrSjQP2LyNTDXM0jalRaWk3jNBNzBXelxE4eYF56Fb1ov+xy/0oH2GOs6TSeRD
	JZtbPQcqEY2exUojKN75ra0kfPA8otct8UX/zUUks5DFDknsFPz0STm1vBiQ2HLlyfb85iMwjHE
	VNJ8WnjO/ICjRt20qqfVYN9+n3+kDnCofNV+9kV7/Xt9unh/Nfx4P9Jaa9gIno9ZNA==
X-Received: by 2002:a17:902:e5c7:b0:216:4676:dfb5 with SMTP id d9443c01a7336-225e177d49amr44873745ad.21.1741970905939;
        Fri, 14 Mar 2025 09:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX2caCviEFQxG1FsGN2Jptlu0lqSidyR/Aam+mWuaIlY9mkeg1dHFRkglzhAKx+lkbrUfCZA==
X-Received: by 2002:a17:902:e5c7:b0:216:4676:dfb5 with SMTP id d9443c01a7336-225e177d49amr44873495ad.21.1741970905534;
        Fri, 14 Mar 2025 09:48:25 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68aa5ffsm30735845ad.82.2025.03.14.09.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 09:48:25 -0700 (PDT)
Message-ID: <96e4aed4-aa08-4bbd-baaf-99418b0aaf0d@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 10:48:23 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Fix integer overflow in
 qaic_validate_req()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay
 <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <176388fa-40fe-4cb4-9aeb-2c91c22130bd@stanley.mountain>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <176388fa-40fe-4cb4-9aeb-2c91c22130bd@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7sw9VSF c=1 sm=1 tr=0 ts=67d45ddb cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=LlO3PXAvtcZV46L7pkYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -j8QVQuMUAD6WAJPB9GfgfARJeqzmF1t
X-Proofpoint-ORIG-GUID: -j8QVQuMUAD6WAJPB9GfgfARJeqzmF1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 mlxlogscore=849 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140132

On 3/7/2025 1:41 AM, Dan Carpenter wrote:
> These are u64 variables that come from the user via
> qaic_attach_slice_bo_ioctl().  Use check_add_overflow() to ensure that
> the math doesn't have an integer wrapping bug.
> 
> Cc: stable@vger.kernel.org
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Pushed to drm-misc-fixes

-Jeff

