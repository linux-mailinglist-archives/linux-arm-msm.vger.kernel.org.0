Return-Path: <linux-arm-msm+bounces-66230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A863B0EFE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 173D71889B8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E58242D6A;
	Wed, 23 Jul 2025 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juEiVFsh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD7282F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266769; cv=none; b=c04yhqitIIUeX5PxU3SaOfBqYPRIpq/GyKOhYikkOc2sN5ZF1t6/6U9gkYQ9yVhORQuUAudO0CQendrG5HspyH/t9zSwjdjHlZsm7Ib73aL7Re6XtIR1/++JSGjU76F6LR1dYzyWBOnidO1a4J4YOzD8mLU1AdIdO9rVfFo0GzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266769; c=relaxed/simple;
	bh=KEVvEIciVzyfDH3nnB3ARh5WWrs5PJ2Px3PB8wL8BgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/F+ca/5pAHRm4k0w6MBKwTmm+lJZ5GgoN3UHotcIe2nU6fuIU1tQ5YyGlE2zavMKQ8lnJLX8AXT7oMWjnImjV1yuRYr263AgtYqbVMnx1+hksDoRpQLwieIi/EJavyzQWgdTn4Ly21tk5Nbm6J/XRvNX1+qZv5nmINlZLTZNZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juEiVFsh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9DB57008077
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoxWGvrI/DM0finhf+96x7egX4yJi8CUjAClFYKbmTk=; b=juEiVFshXtr5alAh
	zEPAuqMhwz6Gx+8/Jp6UxcR7ECKkzgj0/RkRb+2vu9dVetupFS5goFH6k79/7h4K
	rOHHbOVQOU0g4w6NNzqzvOPB8hUqOXrAOo1vjpBGi+nr5//v85r687se7u59aCWn
	E5AP7tc98QrK/9Uem5hA0WIbbnsQergWSsAamRdQ8Y6rP1LaJ44oB00HQIgtgRcK
	JpWR3dIfBsrIMgNwMJmjJj1jjp54fQ3ZVjcN3A6Sh56hJp8aUwIek3apFEW4jeh3
	Tv9DE0YOyGeMFerDSUVeWqUEpFT9PwdGgxDzRO7hmWjK3K8gMp7NqIowiWDlwe0J
	AGUB5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3htu4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:32:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e2ced79f97so85471585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753266761; x=1753871561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yoxWGvrI/DM0finhf+96x7egX4yJi8CUjAClFYKbmTk=;
        b=BAJJ/0mLyTFzKHv+wdvUw4+QUkeyjSOK5V1x+4HRyKPTVQVYubMOnDyVdp2Z3FCjy4
         uuOTdp8rBTgiHrN/RmQ3XYCoc8QYyz5oqojpG9uGEA64/eHspLDbPoBAyGigJJx/9XD8
         Xo9bRxmk+A4WJgnu7V7GuqRu5cUsmvk13xp5cTwe8f70RGU3voOAzTNlov9vuXCHSLfj
         okH/QE5C+rzKYc76o6pKrGHon/jMqR5wFcuxBI6GKLn/4CIf8QgUQNo1mK2WkD6+uwqa
         yi7rrl2Pm65HQNpQcAF76LTJUoQUr9DAAC62qpqaZVkMOFSJkmIJeLWaE82ukyYjKdrh
         x0GQ==
X-Gm-Message-State: AOJu0YyeDCszQADSRZIX/AYA1avG7Mw11QpTpaQZmL1rTLwPThfH1omx
	V/eXzlWjN9nkct2b4iWI0hu8kKRgfqs+9xPceebb2m/jyTxZ9Swn7XqN+8X2CYc8Zn907OcITxn
	O8ukshf9YDq081UcGBljjE0cRQbERHe7Ur92xlePnDDqODC1QtJAJX00b+Y+UTJOWKWlo
X-Gm-Gg: ASbGncuUj9f1LyqXjQ6Eo+X14XWLMN9cWhxve4F4Zlll/Cwt/4qRSwekQM4OQdxDAPq
	hRcXiHdnfHEsusp4qmcGjqoKzsFqsDkaectllzya0kErGoQWaP9zpWKJ6cBSZynbSrdGv+OPYUX
	MhQjg3cnRw5kmoneETjzH3XI4JnnNKtphNcsF0sGaCnow49j6aBLPcNMhKfYMEUoKfukiN9mrRT
	DxbGs/fr3Pi2VLwDK2WR6qg1IQYCDUYx8+zGZFrbqbtW80UaOnbdv4Tr+RsoYQPrX4ASgEchSWl
	FxMCIkGdqT3TP8hhot80t+c048ajNzUD2DN/KCvYBw38CE7PGwYDkjzkgRC3dUQhJfKWqS35M8/
	LKn+HeDK6dxiRFzsxrg==
X-Received: by 2002:a05:620a:4107:b0:7e3:715f:8757 with SMTP id af79cd13be357-7e62a0c1597mr117641685a.5.1753266761465;
        Wed, 23 Jul 2025 03:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMGR1PY3KATLtDKkVwck4PFmLv2ujqFi2Asp89UsFHT9277js6Trob/xsUiROpYbvGow0BQA==
X-Received: by 2002:a05:620a:4107:b0:7e3:715f:8757 with SMTP id af79cd13be357-7e62a0c1597mr117639285a.5.1753266760933;
        Wed, 23 Jul 2025 03:32:40 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af3758ec76asm57350966b.121.2025.07.23.03.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:32:40 -0700 (PDT)
Message-ID: <d50f9a01-ba8f-44ec-9206-fcef641333aa@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:32:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] drm/msm/a6xx: Make crashstate capture IFPC safe
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-15-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-15-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880ba4f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=rrcyIi5yJUK-87isN-sA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OSBTYWx0ZWRfXzeoUnqVz7Ru9
 DnynCQQDwELLuTT5LMIXfzScM5PzzkoYtPOT4QyPZd5hNMxo+zKcTnUnpSbijIfOByK2uLSHzzx
 VN7nhNCVASU6+cogklcFa1C2PyPNN+c0ZTH1SIBI+Tj2lOExyyV1Yb6OzmRkxp0L7Cc7uOpWYtg
 x4sbftwmnJ3giSECqUmMrh+w4Yt0KlgN7lWBcLYMvmKALii9H6w2G83pfIoyep78d3Ic9f6mK8Z
 LYE2leVPGQpidlOb4itdWgAiLBgvXIgLbiTE3TkvBd3DxS2ba+IVRyuGKDaoJXM2A33HeBqjODW
 t6pJn0ZxpRZSEe2WSp/BLpuiCnkK1gQ9sE3lYWss7B4AMe/nCYft8yoSq0KCRqzjyAp7o/MAMli
 fMl89+BKl03CKt7V4Pq+T4tIZBq9deGk4GgIK3KUFFGIHaZlhAmPYVJ3SR0n8Wrv19Whabpi
X-Proofpoint-GUID: bk4-T6U1Iiqlm1s-CUzopSXp93lBVv-K
X-Proofpoint-ORIG-GUID: bk4-T6U1Iiqlm1s-CUzopSXp93lBVv-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=597 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230089

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Now with IFPC, GX domain can collapse as soon as GPU becomes IDLE. So
> add gx_is_on check before accessing any GX registers during crashstate
> capture and recovery.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +	/*
> +	 * This is true only on an A6XX_GEN1 with GMU, has IFPC enabled and a super old SQE firmware
> +	 * without 'whereami' support
> +	 */

Firmware that old won't even be accepted by the driver, see the slightly
confusing logic in a6xx_ucode_check_version()

Konrad

