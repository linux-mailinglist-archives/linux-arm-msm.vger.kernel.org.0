Return-Path: <linux-arm-msm+bounces-76960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC33EBD258E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 11:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 135211899ED8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 09:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2892FE076;
	Mon, 13 Oct 2025 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4O6KkFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9412FE049
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760348591; cv=none; b=acVzhajayNwECSxe607UQh7VEiC4LFipeqh/EYaw92aGTuhWYxACFVIYzovI+BBULnO5SQixITOz3vvqps7n0AtRglzq5AhRcrfoaoRB520QwJhQ8JoogxF+3n8bpuo+Zo4I2wnC0IrlHWjYmCpo2SQrB0OI4fIF/sUFQoOGCj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760348591; c=relaxed/simple;
	bh=JAorbLSuZiT53x85S0dpzWaGHVqHdTXASc19XDvMYJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lR5Z1IixUtwZZqJzX9NbssS6Sw5PQpPW8aU8bGxI66Qy9xEak5nca9EQGP/H5ETck5DcHdQ+pd3T37Os0/5ZI32VTZKyIZDqIvMQ4o1iEQIBlGQFBMxcI99rtDENArn7VkFFKuDWKhhL6lZx7Z2CbR1rhfI9ez2XoJ4a7G3VMGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4O6KkFS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n7qU022233
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRoNub5jA9Gf7w1dXnkXsq7KXaxAcgcIuaL6MaCMdgk=; b=L4O6KkFSUN0UGwxg
	uwbjbdjSLlijcjeNnIYgyP5E5Rk//2L6Ag9bpTUMU5OQyUK8l3YyZjmiUqMIIuf6
	dx676QqUc45cBMCm4fXWd9CqSaiIl+59nvO0b+rFjWWSr1KrA7nSMmv3EkY6Fnh7
	mq64cK035a1tXA3RC1+CpxUPlak+0UJkqeOsAMnB+DN6HEDhKR/r+IhzKqG7UvEp
	XWdlGG/Jz5+DTEKjmN3LhKeQxzNkyNYR9y5yV2qEtNHeP5v0iv1+inSSFwGfbUOg
	4cfMZWbm+oYfG+mLGmhpjS/m+7qdUKp/cblKSoA1boZAWY7/UAfPSN1AeKwfFCIf
	Tb4dEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfv0e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:43:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8703ba5a635so220383085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760348586; x=1760953386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PRoNub5jA9Gf7w1dXnkXsq7KXaxAcgcIuaL6MaCMdgk=;
        b=lrlk32WlsdQa8SWPutmWAMB1/0qjh0boiiJNagqHEHM729bROSsHwIXZLu2we6teuI
         4XLnvAyGDvkgBNKE02rF87gg3aWXgjJgkTLQvQ1AquuSS6pPxIv+sGBVh1i8vLo3vHmv
         IV3Gtj32mOttfh5uy/Dzra5YWzJ5UWdXdTjfr3DKWWf+AGzJ4DWTVFQayqc/xXv5FlOX
         ZPhCqfGN+QOIN9oHZNIsBRDJAXqKoLDUoHiBcOK2aoBGYT/U6gn9vUZ0Sl6CBAXg5Bfo
         i1IqHrA6nLNsaIjiBxaXlGXrmDn3+wCdRwnN1gjsjmZNs8lL9XfTNg3wJggo3Z5vnS0n
         4LbA==
X-Forwarded-Encrypted: i=1; AJvYcCVg5XsGUk7lBJeIpZ9KyHj0V10GI8BkbDOGEff0ypjkwskF2oTAq8weDPLLIjxGOvfeglD4tT/Ws3FJbb7F@vger.kernel.org
X-Gm-Message-State: AOJu0YwctxyZaYn85u2YM7epg7KkOvjVM6RhN2sfvT/Z1Rca4I9g01Ma
	/Tqzsyjqgf906I2ycLhsXzycBJcGS0d+fmUslf6haXVnBfE9/2N9j3GHw1Je3MY2UbHWBGDRUxD
	/iWqKydJ5tMaunRfdqWIOIi/WNB9F92w0gvgohDGgobfWHgaTK4q+ACewMnmhRfK6SMOh
X-Gm-Gg: ASbGncvmCM8VgSAIpfsXgQ05lCdfLfhJBRXDc3baiYyRCD2vWXhl/dYfXfRIJJt7Oda
	5mVZ4B7m6W3Su5yLK5QphP9fpPbkrgc3kPJLmzpzFi9E9ctcjz6p4SsdavoY5E4CK7hanlCpiSs
	6uoE6hcO81Q7A8ZiKyLwxYVi3/t7LnrjXbWCmniHagBWvoyagh14ZSsXLBHuxHKAPqb+76TIzsU
	3Loe88pMpWVW7ZEDdwASeFW1HhNl5WKBJQ1WxlXMN13pJXse+DzC8zArPPB6AaJG6UoRno+3XiS
	NKD6UngTIvQ6C0pE+ckdx8aRoYHaYf1BiRfvO7E1bxSQKe6xj7vez6DCuOEYLm0wcmIiEQ0ED3F
	/8kgj3g0YvZVWeRHwIMh/rg==
X-Received: by 2002:a05:620a:40ce:b0:883:3c5c:9077 with SMTP id af79cd13be357-883543faa58mr1929903785a.13.1760348586409;
        Mon, 13 Oct 2025 02:43:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ37YIa8D275kZUNP9IUttcMgdGMHC6q8jTuYigjOj9p2rv1EtOiRJJX6OXhmRdZGU4PYwjQ==
X-Received: by 2002:a05:620a:40ce:b0:883:3c5c:9077 with SMTP id af79cd13be357-883543faa58mr1929902185a.13.1760348585981;
        Mon, 13 Oct 2025 02:43:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d66cc4b8sm894618366b.30.2025.10.13.02.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:43:05 -0700 (PDT)
Message-ID: <4b4ca560-d8e8-4d89-a02c-02d4245ccc37@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 11:43:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] power: supply: qcom_battmgr: clamp charge control
 thresholds
To: Val Packett <val@packett.cool>, Sebastian Reichel <sre@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012233333.19144-2-val@packett.cool>
 <20251012233333.19144-3-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251012233333.19144-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX9XPOphC2ccQ9
 62orip3l18Cb8Yqctbk3lNOIY4+p8Lnjj+sXA97ATNSsGDlsOrcmvzMbOqYIsVI5YrpFUWECweq
 A1rmY07UdvswjtdcYn++Fr/BMFmRkqKLqLGDCHAW73kkLII9oPy3pxTlMkqnYxs/SZ1/m4dKGNW
 CueDMIXmUTk8XuJvkIWXF77fMzTNjQ7mTp6dvzZ4/fctJsTPWxFZP+BKdONvf0A7DYrCCp3xRmE
 0OWWzlvOc9nbkhW2XnS2ZQcItG0HZnJ/Ld8exuri/zutF/5lbIBzoeoDk2DdcCH5LKDhBLxpgkC
 eH6wJaayaPHPOQn1qF4k5Yxf0ttL1nrUSyGUahW9yIy3A7BRCnYfGv+I5e9+ZWV1GP1/16WXJmG
 6YDJSOfR5AlJbsWnZlMwayizwx8qtw==
X-Proofpoint-GUID: tO2hHp5UqiewSbM4sPUcE72U6ynmskgf
X-Proofpoint-ORIG-GUID: tO2hHp5UqiewSbM4sPUcE72U6ynmskgf
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ecc9ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=Wbw6XCnMcsYJmrvhT80A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On 10/13/25 1:32 AM, Val Packett wrote:
> The sysfs API documentation says that drivers "round written values to
> the nearest supported value" for charge_control_end_threshold.
> 
> Let's do this for both thresholds, as userspace (e.g. upower) generally
> does not expect these writes to fail at all.

The documentation says so only for the upper bound. You should
probably submit a patch to amend the lower one as well

Konrad

