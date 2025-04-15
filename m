Return-Path: <linux-arm-msm+bounces-54395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C4DA89A8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F12FF1891C9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A80928DEE6;
	Tue, 15 Apr 2025 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ai1mYMO6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6A1288C84
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713803; cv=none; b=d3eedqpicXPj41wCCHu3QzCff7Wc1gaj7NF3HLGuJYOiDp01PtYAMULmUeBThGR6PHyET2ztA73ritKYnmW9HkMWpMK4AXb24zZg/b+2DXPIzU+dHUPf4JFSR1yxAwq+Gfl7EIR+QIGGZ8k6O0DGcpCEPc+SO4Q8JVOIdCnKK+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713803; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZxGo13S/FllgQNSSK9C2HhB1RxUANYH4syBUzvZMaSxiss5DXD+fT/nAhkIZ/7pedBZBQQIt1bz1X/Wewfekjc3j/4Wh8P06IIsR9RxLf7SLAX+CcfBW0mDPvlpwDmjBoTVWe+lhJ5p82Olelx5pFGWiEUMx4jZ4eGlsCVNtqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ai1mYMO6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGnc012563
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=Ai1mYMO6lfpCeK3K
	4QNGSLLviuJdPDhCqZadVYkkuwmv5fBYJJbG1AaJKPPeB17UrzIr0cWUkwhhS2Ti
	PtvuiX1FmE7cwdrCnNwxDoCFRj9SEo/rK3bNF/Ru7JWSltEVtgAlgaJnBhbbdZfv
	n6kFn9KSqGNmhRR4QyX29RRtWksihwIhtS7ShEYZkH41YmMDydkE9MzbQlAcscUy
	W52c4+C6o/AihjKDwE3jxOS33wcM24KNzaOwgZxxmkWFmBlxd0qXU4YcGxMHjZUo
	F5l4CFVIyN7Y6coO/p7CYkLUYXatL39ReN3jfNcENofz6Q4bSeReOhmW9v+EBHmA
	McUgww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq7y50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:43:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54be4b03aso103492385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713800; x=1745318600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=qRvdhnSJ1z0JVr/IXQPvLOOxVqKNogbi3jg5Co61DNMdxsAS5qYOZBWbgeE/rYHeqJ
         7VtBbtfZZTEHf+NajGEr/6fr1mcSGRhwwvdxOr7Smko7UsAxB6PJuObyh8zyK2u0ish9
         VkDqIjUuNizyq7mHJn7PvIpGagOUnS6AQ0oezS0N770j/UJa3R0ze+fejngBayTtN4Nx
         JYfSc1eiCWmraSZHLqOix+awvXSGwVrV1k1ZToRqbfODUza9A0se/4Sx4fvEiSY+4KwZ
         wyzF1ek+NUwIoCzw3UA+lgRKli+gf2zahW1NLdh+41GJOnD9mOkffcqEXrnDrw4lgXvb
         14eQ==
X-Gm-Message-State: AOJu0YwfXb2TAHRPBDBOn0n160PGzJLOB0HGTUTXp4gr0ucMyeRjDmea
	6AhRH2PEHesSd1Aih/4enr/AU72Cim4t9l83aR3yKOo1SxDN6rd/UTpJ9DosiOZ/623rTUWsqHJ
	6Dc5xKJL2lkgMTJSWUS4CHEjW6QnqBLlV4B/60KnqlNf1VD9sf6zTaS8bLEy/KaxB
X-Gm-Gg: ASbGncs6u5jB+mC51U/FhpYxUOI9TemAKXjQ0a1OwERVXyVZH3fGmO0npG3BgQ0uTlw
	CUgAdDYMp2iQrfoQTm/B9yQEQcrybat/zqUAt5xekRMvhvxg5B9rb/Nbfwg/e8x2aqmIky3m3VE
	ARHkeYD1NKXeoH83VfpF5QXmpm7OCjdupNFmZr/Z6h+k2/UlcxRLUWq454dfK6j6cGJOPZtyNUB
	uPupJzNqeFTKKKAp0F19+0wf8QsQiG6+96NNK1VgrkNbXeGKRXV2sU3oJu/cXid02utWnDV6aqM
	gUvQLLanWcYpKTDZOeY1n4VMOtip1+zx9hX4jgNHEGSMW5efjBTtDpf055ZYDOYa9sg=
X-Received: by 2002:a05:620a:4091:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c7e5b6fee9mr172447685a.14.1744713799932;
        Tue, 15 Apr 2025 03:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo3z+W2e8RJIfNcxZyqjqhP2ExIKuOsn+xf7ywPuKxxwN7d0bufad0MSbmw9YNuFyssf4uPA==
X-Received: by 2002:a05:620a:4091:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c7e5b6fee9mr172446685a.14.1744713799676;
        Tue, 15 Apr 2025 03:43:19 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7fd1sm1059762466b.168.2025.04.15.03.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:43:19 -0700 (PDT)
Message-ID: <ae06a328-f830-4583-a314-b50331c7f56c@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:43:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] arm64: dts: qcom: sc8280xp: use correct size for
 VBIF regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-9-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-9-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Xigybz-9uo-pYS-BYG4_UTq_yVsgl8U7
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fe3848 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Xigybz-9uo-pYS-BYG4_UTq_yVsgl8U7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=630
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150075

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

