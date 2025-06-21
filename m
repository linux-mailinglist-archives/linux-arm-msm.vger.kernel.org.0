Return-Path: <linux-arm-msm+bounces-61952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F30A2AE2B5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 21:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AEAA1897D62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 19:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A845FB95;
	Sat, 21 Jun 2025 19:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFkJt8BA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9262586EC
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750532904; cv=none; b=R3cZ5wmsLDPUZ9AU8vjkmEIa58amuB+f2II9ZE/RqstjRMlNc0+SbC4RU2bn0LSVwU7U2QK5zCM9TJgCeBu1ohKXqxYmL5g/LwpAeCBEg5bw8j06wYAY+IncUQptU7vd8QSJTZnXF8l9HukLoVdcmj+Sy8Q1fnSxjmCpsJY/Qhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750532904; c=relaxed/simple;
	bh=zQ4h/2CUrdyVRUmQfOnPCsgvBxmz0Y5FpfeZM6wC5HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kHBUzxPIMUNGfep9Ous//XLK0AS21Ddc5Yy65XlfkhLFmSUXLgeLT1hR5UrdLYeWhOgIge2zz6NMT4Bf1p4cxD27UD8dZJ6+a2LdwO9fTKQVEaUBe6Lse1cvTIE9YB6QXJir2BWTQ0UNPqogSbncMS1WDWFBB38jj9VKPmrg52A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFkJt8BA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LJ17bq012773
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9s7v/LrcaoIdV8Tbqub5MaDn8owWZKJzdHit4BdNhz0=; b=oFkJt8BAiuuUjci7
	xHONVfFwTZfGkZ3lv+jjQKwDvYNmN210KKxA1HEMfreMM9wuykyuaWtmfgJ8Mk60
	HmTN1Y0MX9kyIRIhISRXIswkE/3/pm/TmR3Wceoz8J6ytE4fFCL5Hklfj6ifdOSq
	FL5+EEJn0PdJPXLCYWg4j9mFnNKOUIgtY/0Mks4oCJ8rRmGrOr2Bitd3cPc9hDam
	VkLwugYK3AohhgJDtpVs0k9Lyjcx/JDnMCaYbMMse9uJmxNCG/ApeASjv24MUYZA
	2H3SpPSzrvaAZL7j3NR0O/Tm2eIs2I81ddJLRoj2zZKtgUXb/0AbxckXliLBpuge
	uj/1Mg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dung8fhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:08:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabbaa1937so6042976d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 12:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750532901; x=1751137701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9s7v/LrcaoIdV8Tbqub5MaDn8owWZKJzdHit4BdNhz0=;
        b=obsv1JJC5DB6B2zt6s95OCIpZ/x0bbaK6YzAJBfw+thRkrze82JbGmNsTJ8xJT9a6/
         n4WGPwJHiQ0zsO4wTsn5+nReYSmx9tQOXN29ASuGQxSCBnnWckpqGympllPqPgPk8ulL
         0pRscqOLw16VeG7Sd9zuWANVnDSABf3p2eomrXz+zTorImVcwhNzh63Yr1oQuDVqK8k1
         fj4s/4x6GTZU/92OZL4z7uoKeike37wqJEmIJMZgwwwKVZdp+7YeWLanne8YBkoxQI6X
         wCntWu7Rl8k0nbDKE5Q8dheLOlpUJydLLgbBUvHPsMJADgm15sS3G7QyFLjoC7TDHkLF
         ZNGg==
X-Gm-Message-State: AOJu0Yy0FFwOgwgDOteAQJHwmjb2l3JthSTe8zN1K9B8/K67hm++lb3/
	iz1pEw3GnWPfWfXR1R0Sw2iT4b+IOHp1zf5uzPcdl3jvsNVuV+WnaiSWiVN65y0pPPe47w578n2
	zS2QBwUDxd9jRj3f087mLXPZEWQBLpJA4OSeJ8WBlV1O9XVJvpTS72X1POkaSxHFCWW3q
X-Gm-Gg: ASbGncv5D4+NWzP+CRwHtQr5V9EpnN9ckVyaYxqTgsfs1+2ZMyYD8Q8aJHSreYrVolQ
	a5qEpSaK6JRbCRtFOPMyqZ9ONiJP+hHdK3xe+0ZdZNVMuuhD61I/mRd7fiu9QyzBK5aquq+ytDw
	gQEQzyFGp1v3HLxkl9/76qKyjTHr2LygJ9arkzaUGhzbYJouZj/1mkSqp7jHZvJPD5jTqFFegNt
	sCZmC2gFZF+dUlug4BNvHzdFY1cv9fKaurpugHVHY1J9Ca1AfrKRbIMiEz6JM0Auus/yWUWj/kh
	rvnXpkhG/LXvVt0pFh8UhrCt1qOpF3BGCmlJ7uJQUKs3pDTGU4UYzNYkEsDZQnogpHy9mFt5DwZ
	npjo=
X-Received: by 2002:a05:620a:608a:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d3f98b45efmr425049285a.1.1750532901098;
        Sat, 21 Jun 2025 12:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1X0z6K87eoLcHUl7ueBVsPuL3jHZlly7fdeELxmtw/OkNiKa7Lq3QXyKe4d205IAWvseYuQ==
X-Received: by 2002:a05:620a:608a:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d3f98b45efmr425046985a.1.1750532900689;
        Sat, 21 Jun 2025 12:08:20 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cc09b5sm3538337a12.61.2025.06.21.12.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 12:08:20 -0700 (PDT)
Message-ID: <8583223b-0318-4857-85eb-8e464ae6711c@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:08:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: rename DisplayPort labels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250621-sdm845-dp-rename-v1-1-6f7f13443b43@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-sdm845-dp-rename-v1-1-6f7f13443b43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a-Fk9JJ7nxx4fJUsyAeRUNDllpadHbTU
X-Authority-Analysis: v=2.4 cv=N5kpF39B c=1 sm=1 tr=0 ts=68570326 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=2zXEEYr95b8OIz_QTQwA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEyMSBTYWx0ZWRfX5FS2aX1oIjzp
 wIR1/B4DCu8Hqjrnim9GTmuoX/Lq+Hdoi/Xhznu1fa+Yb+JenR7IEqszr3IsBt85xIgETzYaIbK
 j2ijgFEkrFLy8GN3d48nwVj4NoXqwwA5BfehvMiwghGkP5AjEFh1mtE2yW+MX/2NOvLxhi/8OjN
 nSn4gfaFpXqt4i1eAHOQg/hkY7zNQRA49+51ncgwGN4IDYYV4VZBdfNr/mYxivV7CrNrTgdufZ8
 7s1Ul6khsnnL33G/ISMxViBZMmbCZlTWvJAL3oRYsUrsuXBehvvUzZYdkECjXP6naArRJKBOZ6K
 fzHQRJZbTZMSGSXh+Hl4h0MXZ3idVdMp7Y5HC/qmDQamDQZwTLgDzM00+eOvTmicFhZkCEKgeBf
 ZMldDpw9asSrGXywj2n/qFJMd7vmp4phkVJIL08b+4pY8iKo1D5pf8CDOGb+qhZ897eDTd/D
X-Proofpoint-GUID: a-Fk9JJ7nxx4fJUsyAeRUNDllpadHbTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=745 mlxscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210121

On 6/21/25 8:20 PM, Dmitry Baryshkov wrote:
> Rename DP labels to have mdss_ prefix, so that corresponding device
> nodes are grouped together.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

