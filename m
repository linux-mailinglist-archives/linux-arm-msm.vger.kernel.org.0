Return-Path: <linux-arm-msm+bounces-105658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMpXOjJT+GnSswIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:05:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8BC4B9DB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83D783003ECE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 08:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D7F2248A5;
	Mon,  4 May 2026 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5lw6c+V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVP0CuC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C002D8DB5
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 08:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881631; cv=none; b=K82HuNEnLEIUYb/sHLVMHE90DeJ/By57TTB++a0ToyG65QPnjSKXBWzU1YQIBRhniEm2YahiHMvMQOpEu/toYwGkSnbHEu9FpfPnYyUKb/55uRQ0t3I05rXW65fxxazEGMFEQJN+Fe+YoFQA6NcFYh/wSnkCnUL6YDq/NE9HI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881631; c=relaxed/simple;
	bh=XiDrAWYieOq20PsUIQWQPcsJrTUBHepknhKTiIUCdm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PHDgqGcOw2bhMkH9xCZkGbWW+TvZ8ZPiZViXml8EYX826jMvW3pmsDyvWYTMVZZ+viaNSD5Ztiy3fipfWDEekKDzrVNoRdAgmR8V/wPWZVbS0Opi7FDYsQRLHmH92xGZs9ODh01i9vfErr7JoO9/lce29+Hqci6QofBD9Vh0nok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5lw6c+V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVP0CuC+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DBrT483769
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 08:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIR7fDQi7e+NMiYwH12EeBP6IQkj7IAZDunBXH9Fy/U=; b=T5lw6c+VnKOSFHV8
	PEedQP+D2vjc7hhvFco6rOl5lSD9UkLxAd44+/Aw2LzR2/Fb8BlKE6K1TzX0Z5zm
	UYsUgiy3Q4Sx77OOWswhrV+KNnVjFLiwBGw3LbEHD+Nu6ATiilwaUGsFWqu47sMH
	2tKIF8wBlB5+fa2qgZYndJy4eF2i3CulqHECb2GTd9l9OFUi11WYwz0FkL5nVlXs
	eqn/SPiQyKar5Xh8aftRfvjQ3Zpyfhr6mTCzhNTUpyclC38qipHUUpb53FmLZGBV
	T9oI57s79DUNU937/2aheIKWZWHJF7Q4hoM7DJdJ+JGjz87CZP8FcIMyvWhd19cm
	AN63kA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw87scytk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 08:00:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d01ff3eecso25318241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 01:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881628; x=1778486428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XIR7fDQi7e+NMiYwH12EeBP6IQkj7IAZDunBXH9Fy/U=;
        b=fVP0CuC+C+yFLWHBEsp8DaiOiRGz1h/BWpops8dYAvm/ikMBbu3GoI63c8afF8+fra
         zDhKSMysH9Cwt3uuL82na7l4GPYZr9JU/9jcjyoLjgUYE7vrjgN5nuUfIS3gEYozKkj3
         iw1vcgYfHAYwuzDgt8WRlX/04gfeZIEPhXm1qv/BLtrnSQ43rWCBLjC2YC78e0ADzKhv
         2lX/WnJb4Fm25DAAnWNcAT1gSUo84CBEGqR67qRa+aTCmFm3dPrIHGFZZTPAEsGBdjeO
         6IbvpMxQAfJppF4CKeIv2b3p443tXRQ+JcMOmkc/dgtSLbninRF4Nlzn5SaxjDOXMv1D
         64wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881628; x=1778486428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIR7fDQi7e+NMiYwH12EeBP6IQkj7IAZDunBXH9Fy/U=;
        b=jyoerMyFXC056pr1niO3auhg2U8NX6NhcFGkE+onphdiuG8Ne+qxPl39Iaq3vaWG1n
         QHjIyPHnFCqzokDlyNm4jCNvuvpGQ30x07aJme2Bh/y6qblcxu1F//hzhi3kg9/UjhFj
         kRqvQoS5Sz0Aq2FlKL+fwlpjhzelcLW8WPibJlAG9ehQKA0fToZLawfyiZNsPijxdey+
         dNKlgcV0YMSp+0rRiJNBiginViE6hxwjuM77oM4iC6Qg0G7P/EXgzZpN0tmOHWV1j3Tc
         hkBSwpuaFfSJinnIfjY9/cOzuCYyjf2o26HsoZdsubExmI+Pc5U7K6C9mMaB5Lh4xyXj
         +pSw==
X-Forwarded-Encrypted: i=1; AFNElJ9qJtX/7BlGY06ZSuBirZOhok/ZbTMosZLsUuKkltJo+Bk5TXgeJQY1WAiAlUI8lAa04mbm/cMJHktYVCkZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzF2xMfxbeyntmINYS91JYULW7R7J2XPrt8gRzcFoGQw0zR2kH2
	PBEmQ+JRGWChwockKr7icgBDZWPW/L7j9doTUAxwU7x5B/xoqsxN8DQKl0VZx+YMvRqoE7SdKa1
	xb9yM38cbghXxV3taMAdg5feqEUUunVrz78VmY0bGsWd+Q/ocE0UzSckyHGMDX4n2pOvu
X-Gm-Gg: AeBDiet28XM7F1tGEqvystPCLSPGKCSwZpfnxMJFj4OrhFttkml45UJI46AVyysM4/U
	UATzqBnvy/vf+kDknL4/y1thMaB8+OxM7tVP0aXkd9FBHE86DM0MSpmgiiHfwe5vWVyEaZNW+HS
	3k/Vd9wOgEg6zdwBhX3cQEPVBgrCuJF7uw49Wx1Ij/6mfpieyQPrci/c5Vgs38cKCrb3mlNkYMC
	nINic9CawQfRT9E5CF2NEhYK4sRlz0afLyvl4hD0LGQxtXIQwQ7z7PzMEKDZKkKf97ACpT44ZCe
	I14p4GBpBe2QvHYtIOeT08BdGK0IEj8Bg0NAtCsuQeaSAfJoh8gwNz4m7Ly3Pumug1xhjASc08d
	38XRe2dUnicNDRe6JhRjlBJdjtzzysiRyo9kyNMcueioRP7FRz0eCYAySdmpvFy/gDPA3wnpTJD
	O4O+E0HJUGDjr55Q==
X-Received: by 2002:ac5:cca9:0:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-5750c63c2ecmr1241765e0c.2.1777881628568;
        Mon, 04 May 2026 01:00:28 -0700 (PDT)
X-Received: by 2002:ac5:cca9:0:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-5750c63c2ecmr1241761e0c.2.1777881628038;
        Mon, 04 May 2026 01:00:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc20825b337sm94736066b.23.2026.05.04.01.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:00:27 -0700 (PDT)
Message-ID: <e562ba79-3b97-4c4c-b3fe-56d950ede0e1@oss.qualcomm.com>
Date: Mon, 4 May 2026 10:00:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: interconnect: qcom,sm6115: Restrict
 children and clocks
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260503161653.60785-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503161653.60785-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AzctCmUNtpLjJbDLa8HPiLF93LzLyNba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NiBTYWx0ZWRfXxaX8hOFOiK3o
 sdKzQOT+Zj2UZNdo3ZFDrZYphqDFJJwxkbSZHpGCuaPw0xOvZ6qjrtl5KRdBXPMdJaELgyceyM0
 oPk/V+5w6abzhHNIeCGXOWOU8wll4XZNPUoALLTphkIzbUwTpY3xFTIaBJJzuqD1rmrZMADK+Hl
 fIg4mJ84ajwUF71qqL1//BKWeN6fHKmaFv8J2WBZI2OgKZvaRAqao/6EcyX69RJTvJH2svknf6z
 osZKi1T8lkTFWk4mx+ynVYL3acxKiaPq34Yy6V9qlualqBP+lMEd5v/KPyYuRD1nxyw33vvIeVZ
 pLGKZp0RWqfv5ix7qEZK8G284OGAe8HbFnvk57HdmR7GhmGREpVpS2Sp5qb1JrpJyOPYRHOGJXP
 tY8PI2q+pO1K1zOcd3qNjLe5QhHqrg==
X-Authority-Analysis: v=2.4 cv=O4IJeh9W c=1 sm=1 tr=0 ts=69f8521d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=om1VwnBSGygLgw2Sl-4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: AzctCmUNtpLjJbDLa8HPiLF93LzLyNba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040086
X-Rspamd-Queue-Id: 4D8BC4B9DB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105658-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/3/26 6:16 PM, Krzysztof Kozlowski wrote:
> Some interconnect devices described in the binding have children and
> some have clocks.  The devices which do not have them, should have this
> restricted (disallowed).
> 
> qcom,sm6115-cnoc has a clock, thus also extend the example to be
> complete for this device.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

