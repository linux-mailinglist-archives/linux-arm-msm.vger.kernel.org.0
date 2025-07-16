Return-Path: <linux-arm-msm+bounces-65196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D48B07253
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 11:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2362A4E4E74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 09:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B6D28DB78;
	Wed, 16 Jul 2025 09:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD7TaINl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AF52F0E5E
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752659913; cv=none; b=kc77HO3imJvP0QEbYEB8jM85WhD/1HtiU+d+U5jxNP0BCn+827jX1dKxK6QA9AJTiuz7ggDTjNZkXA8iLysBn8j6kJQKMtZJlOcfoWDLqDl1jBEPpPDHcQ24BC/qSd/oCcPVOR1pJUBqFLjHEgUtYANkeztCZXuF2RC4IiTCds8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752659913; c=relaxed/simple;
	bh=uCPi2EzrNB692xy9We9a/N/3HeKk+7QZjy0Feteaw+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJQYU4Y6KrkUjuqj0TByz2nu2VeKZ2AbjMWoyFGzN1PTcir5/JcmA51Vaw4BkYGr8PNMoOcNEv/9v9Lfc5mL6vHSsGrwCcD/gXG4MjhCYnpuM9KrErYWafVeg4/SggiCXzyfG2fGg9iDk+pFcwAd4YGmC0PDY7uCoMBPSBGLcE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD7TaINl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5pfXG031259
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uCPi2EzrNB692xy9We9a/N/3HeKk+7QZjy0Feteaw+Y=; b=TD7TaINlKPIASE36
	u/IbN+GDCE0I8aXSUbZMgWJU5NLyxC3OiBPrp/w94eJ2CIRTzCtvErpjFnPBsIKY
	dEoPnit2bh26v+QbjDsA08VXCjUStPFtRonIes9qDcEcSPf1Rckx0ks9IgGr0Ulp
	/ZFd1CGsPFstiDMvrOhiTJ+CgMKmcQIGvXWRag6QCDVN7AqIXuLa09ElQm2W61WD
	uKJ0GCCuX6oqQhJhFdSaFr/LcQGPVOUHdiQvg7iD+itE+anVeK9B1Pra+Nj5ePtF
	RlFj1INTotKb96Um/t3VD+YR/PYkYlsdtQMWFKJERhJXZMf9bOiynuOEB3PG8/no
	JoW32Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufutbaf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:58:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6facde431b2so16404056d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 02:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752659909; x=1753264709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCPi2EzrNB692xy9We9a/N/3HeKk+7QZjy0Feteaw+Y=;
        b=upC84S56mMrpykLvpkE6p4A3wHN0t6zERniZglMc8yPeiCGL9PVRdpSdlyTs9TjonP
         1nmJdU6NL0re9jNFefRiC4fCSuoWLScsqMj7C34B1bDoBNxEkxLgMpwyF8EfeHqOEf+w
         E2PHgN6H2a1OuWfWcQH1rlJKXTl3WBkJtidvPYfVZLJnwruNMfhD4BjmD+/qDlE8A8UM
         jCNIVX6rebLR5xR18luw2/TN74jalJPf4NmFrzkxvc+fIyAHdwZu87siPzxObB/jXDkg
         0+UFHzLisIoeuA7OwzJ9FHKHujFGeTlNJfpU0vfAn4TsasjKw9h4Ir7cGJZVQlAv6F5H
         8dVw==
X-Gm-Message-State: AOJu0Yz5rZTRUrH403NYMZBNdOEIM4mc4L4oLFvxOFYw1OENnHIVrhXR
	3hs+Bhk44bodPYDqSS/Zb0CQ5SlqZY6ANy1/qSZxH2bhfwB4JKr5RBeL1ByM8H8EGogwx9TZhqO
	+Jrwj9X7VIzbKgbEgk3hgpzQ0JaXK6Uu8WU70gt5B8QIFIX8gQENg6GGxGwgGAazwD3u8
X-Gm-Gg: ASbGnctMLM+kYrtIN/j+qv3ELdvhvmmbyhyOMscfDaRn4zR+fjyAeoQRNKD4PyVrmtA
	6gcRxVSMpIwSH8gkv8vhZKLonTVrPl3GCXT9An3kAbLA02WC7ysZ7sAxBJ3XDVj8DX8kG2YFi36
	ojrybNTz9Pcrtt4ev8vaon3DuoDaYelxLnRURD6o6q51EAxkNkxZqGvsy8iIxId7zd6aXblgLy9
	IZvGzPnu72nwz0JeasfXT2vgfnJgzemDbQN5VScyMHc6wtrDPsJq9GpaDFQRFrl3AK3v/ayuAkj
	VvLs6AlgJMf9rqKRvLS9G1/ynNnDdPQ3GI3mv3JRyZS+su3i02PF2OQRZDob0WvZ9mxIJFqdP4h
	leDwiSgtp4G4+IyeotFhz
X-Received: by 2002:a05:620a:28c1:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e342b37074mr137700585a.10.1752659909172;
        Wed, 16 Jul 2025 02:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpnCpN/dC4tnBcVCDR8doy3/WCq6HZeBLkingkmeSVXbTv0Ng7Hs+rCJV4fx9aFN6b/RA0hQ==
X-Received: by 2002:a05:620a:28c1:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e342b37074mr137699885a.10.1752659908851;
        Wed, 16 Jul 2025 02:58:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2efsm1166796766b.151.2025.07.16.02.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 02:58:28 -0700 (PDT)
Message-ID: <ad1afd1b-9cad-47d1-8dc9-0d62b25f502a@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:58:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/kms: move snapshot init earlier in KMS init
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250715-msm-move-snapshot-init-v1-1-f39c396192ab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250715-msm-move-snapshot-init-v1-1-f39c396192ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=687777c5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=qnTbvVf9oJKgxClKmkgA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: FoCFL6DsNCKsgP30sGJRCzzXtarOR75F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA4OSBTYWx0ZWRfXz3LF0FwnK6WG
 MG/BFvbAk8HjhTL61w6TJ+dtoVCAvx2BPPG6Anlu0dybhuUrU2em19dZYzVHXF255iRJXGO0loT
 CkgmFlkURRacr2dwH/iH986/+EaFKQskXkMcZb5Myo5qYQUAW1B/k7fuzH3UNFVVH5POF+ZTJTK
 a2H/cjJ9i7R/yHvm/Q/6yhTJWNAtxaCZrWQEDbeTKWbImsSPVfdGuwsnAZSvd5rY80QDUqDhv35
 ICe7qpjK2dhDnehW74mGJNqxQH1kBt+gI4otmXoJRhHZeiCeJlijU7Rm/ChrQ2zqUblcBoR5LEs
 GX3uO+zzkMtxMcE1ALqTqU2ymjtH4OCKZEW7ofjhmERT3bSq46Yn7HFjl4UBCRCj028AbeAq2dk
 XzuREQR3diDeQieect0t9VIB3niPMEINKmjKm/SISGr2oRbytgMFnNR6O3CkHyVB48XblDhW
X-Proofpoint-ORIG-GUID: FoCFL6DsNCKsgP30sGJRCzzXtarOR75F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=965 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160089

On 7/15/25 5:50 PM, Dmitry Baryshkov wrote:
> Various parts of the display driver can be triggering the display
> snapshot (including the IOMMU fault handlers). Move the call to
> msm_disp_snapshot_init() before KMS initialization, otherwise it is
> possible to ocassionally trigger the kernel fault during init:

[...]

> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

