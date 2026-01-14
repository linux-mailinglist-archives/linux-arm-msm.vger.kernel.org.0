Return-Path: <linux-arm-msm+bounces-88999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 087CAD1DF9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 11:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EDB2304EF6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693D93876CF;
	Wed, 14 Jan 2026 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiksRxOS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="harLuZYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045B438A73F
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385995; cv=none; b=PclnsnCOybNJIu3H8s5bey+PtUt741M2GqbR4S/cKwQe6qXTPYFzgEmKP7P/UvuLx7Njffzcl5ILTFU2KXzaShEZEmQZkt9lTvvVIenyRtWSdqNKg9dKIMBtmG8zzlSmgRXsPBdCj8kDBFJONplS6B+FXMmxcmguHkFNDsUNY7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385995; c=relaxed/simple;
	bh=dmkX72+Xk8VqOBF7d/15vyTFIpcvj0gtwsE/mjCIme4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nc45eM0aMuN/zHjOzK9L71z/w29Gz0swhDIhcqNcrN3zmxz1Weovfw8jIDpQM0r6jLsQ9aURD8v/MzzqmLPI6GcwlGpsdX4RlazCWwfoqt97B8e2dPSZNGTlUPeYrLY9ZVOvAbUews78wAnWIP5XQoHPiSLMhQ9pnndIcHaVzkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiksRxOS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=harLuZYe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E9I9YO2552834
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WeYiMieQGRV55JsqetPUkF7GL2y5h1/hERPAKX2wqj4=; b=eiksRxOSfz5qUs2C
	TYqUSl9T9XZqGVo0z7s4ATHfkSs/EMGMbrjOgJFxW9P+PH5I0yt61MsIXOlX8XBh
	lMXxPWxcV6tJOCXY/R3oD2Fdv75bDVefiUwoR2nIL09wt0MARpeNTfYd43aLyXSf
	xkCfVI235KTDcls22inzhgfMRV+ctVT0pO/+SsMkigzqAuvBu0iXWAWDqBJcwoy/
	CdjiSSC/rTlzxzCvO156d2GuyP9eIOiEDNjnq0l+jERjGsovwvmGZpG3avbGPClt
	vOZPt2tkNYdEGJpb1btPSaaM6p346wxnLOC+vh35Vvh0LtSobh6n4ko6P3qLHoVZ
	dQSJww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d30883-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:19:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ede0bd2154so26386821cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 02:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768385988; x=1768990788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WeYiMieQGRV55JsqetPUkF7GL2y5h1/hERPAKX2wqj4=;
        b=harLuZYeIMAtIagW2EDk5XXC/49Ta25NfdDuG7UXn6153X3V9YFwMel93p3AOwQVxB
         ZnWZKlJPbCb/n88oXDMgo8rGtDaJhEjzLhq8L7eGYUwVtskEOCZJuYlUHunzEyV3kgRO
         EW/P1fTFgbkla8E58OA2ya9HVTqQrwYjxWXhy8OXyARgspjSk3QPQNT4z8oKxC2hifvw
         q8KnHIlEYUj6xYmzwBvqO/MLNxtCthBnt94WVuiASkaelJx3CgqlERmEMvnogjaapeRp
         Pwi0LJ7k2oD20sel/ywQhuTpj9DpKWanojxvo7XKmlB9R03qU74fB6yt4hAVKLpTBMVZ
         /NGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385988; x=1768990788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WeYiMieQGRV55JsqetPUkF7GL2y5h1/hERPAKX2wqj4=;
        b=iVdA7I5dwIOVCnR8/Zh7zuE5vkWJ4vmwILg+sJE/9ZWh7P2c8MWekoMlcBLuydXX7E
         cGYtWNGZ/gL1WT/LgiFB/xvn3/DDFewRCBC1JaXLF+e0dL9wu46DY1b45Bn5+TANB3pl
         a6EjCrIG1I1MUBUQwZmBG9B3lV0j7+Upt5VFbu6mSjpJShFwGgFhNwKGpCgaAXn8mWzR
         xitR0feUWSB1hybB7nADMAuP+6b7Q8JnFqyJm/K8wuzFnQJMyyJXja/cnmfZDATcsCCF
         M8scuhpYnluUGRHr1AHSQWn1W5kr/kEeSQwtXIgqAhUxEmoSwRnexRK8hZXXDCVSUz1m
         zJyw==
X-Forwarded-Encrypted: i=1; AJvYcCXtOZq2Fp9/Q/0C1CLkayQRsnACmVzTzhpXHTiZFBsVugMDKIliPQL4Rqz/xrXPx4MGRue3Eaka3CEvNCy9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgwwc3a3p+qGP07WZi+wHL/ZvmN2hAbQl+ZdCZh6rSEGdJa4w+
	O864XRXnarx+Te6Oh1GwUjNeWsTB6OpttCSPPgulFEGQvkUhcI5h5GzTc2B0xRJtRA+gC1g+cZi
	9h4znd0TVrIUDp9rMBcHkZDMz2H6EEsdqOLeYfCpT3ZxpkSUc42YLgMLa6bi5XHIIbVsu
X-Gm-Gg: AY/fxX77UP9o137sVIj7H5R/J7AnnAN8nqjSqpTiaKWThr9Sa1IHE1jb/kpw8kIfRXU
	rk/aOBWtX+WixchmXSyaYl1+3ptcjhbQWucR6ht65vebwQYprJH1es29WQKEFwckPXtQD3f58q4
	6lmZveY9mVqIWl+t1O6kSdamE1pVgsS5oWVwA3baiKDRfcEugF51cfN+Kem6w+KArriVPG3GRsL
	jd75k+nkeHeG3LkcndVdES5Aa2EtFmhHFJZbyl1QW+0pheK752jAz+0ZgqlzVRUFxSc6O+eLq3G
	a/DE+VFuILSqZgu+zftT5lGqz1hkA6c2cBJuD/Q5Gv3WUJyEKvP5rpFzw47VDfWIx4UfQi5HPWn
	Z8zXu0QnU2bwsjnD4JlpyZ9itUN0o6ec2O3HKVzZ5s6j+/h9iZOsHyQHQrTOVnzfIoug=
X-Received: by 2002:ac8:7d01:0:b0:4f1:d267:dd2b with SMTP id d75a77b69052e-501481d69bdmr22376881cf.1.1768385988247;
        Wed, 14 Jan 2026 02:19:48 -0800 (PST)
X-Received: by 2002:ac8:7d01:0:b0:4f1:d267:dd2b with SMTP id d75a77b69052e-501481d69bdmr22376681cf.1.1768385987873;
        Wed, 14 Jan 2026 02:19:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a563f0esm2519984666b.60.2026.01.14.02.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:19:47 -0800 (PST)
Message-ID: <444b2e30-5675-4a17-89dc-ca24ca3910d9@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:19:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/3] arm64: dts: qcom: talos/qcs615-ride: Fix
 inconsistent USB PHY node naming
To: Sudarshan Shetty <tessolveupstream@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260114100043.1310164-1-tessolveupstream@gmail.com>
 <20260114100043.1310164-3-tessolveupstream@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260114100043.1310164-3-tessolveupstream@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lKcKPU9x2X9Jou5cuMWxa85TXRVUQpZZ
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=69676dc4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mKMLXjToGYiuz-cdMPkA:9 a=QEXdDO2ut3YA:10
 a=QYH75iMubAgA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: lKcKPU9x2X9Jou5cuMWxa85TXRVUQpZZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NCBTYWx0ZWRfX9ZFQGNGubHgR
 903GZO7fyJzGR6AlreBaZ1783VG2q+vSeg4P23Rbr4gGO7C2eByQ8BqNpDq+rd1rW4/1EGbHzwF
 plAbWQNI+B5WTSQHSMj3XoyehBRPdAxz3DokYxfZGJB6HG0pBH4jCyHgYi2eKSVtQx8CLcWWPvg
 W7Ko+IYOoFLL5PQlTiZXA61RiGjLuLTWWvrE+QCQeFxwKGpsu/ynOeij7mAblUxYNtR0W8uPu9n
 Yc+Af3Qy6vLIctO5ue78350cRFOki2LKKD1na6ADr5c3dnTWX7tMwTYYkioEIIa1plj1ljzXcqB
 lNi2HWh540ExQc+a63bj2TkO57fpAGt7R8EnM4tekCZZO76uilHkqzsZIX42cxb5Srw4FeEUXS+
 3qYNgcG5T92CFmYUqgLinmIcYtHIL7nVqfVmEFptYP3L0TaCwRH6NmP06rrCkVF0O/OPVVP+nHk
 kBgC3rCxZq/PpTIaIDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140084

On 1/14/26 11:00 AM, Sudarshan Shetty wrote:
> The USB PHY nodes has inconsistent labels as 'usb_1_hspy'
> and 'usb_hsphy_2' across talos.dtsi and qcs615-ride.dts.
> This patch renames them to follow a consistent naming
> scheme.

Sorry for only noticing this now, but usb_hsphy_x is wrong..

*every* other dtsi uses usb_x_hsphy, please flip it around

$ rg 'usb_1_hsphy' arch -l | wc -l
93

$ rg 'usb_hsphy_1' arch -l |  wc -l
0

Konrad

