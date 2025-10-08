Return-Path: <linux-arm-msm+bounces-76378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E7BC497B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0797C4F05C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27ED32EBDF2;
	Wed,  8 Oct 2025 11:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bk1zzqJK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD119D082
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 11:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759923484; cv=none; b=G79buUDn3f4GDUKfd5Wla5BzIR6VhEcV5N4UnxysheOHDVhtLD9/Hb79ya5eJWCyCw4zirz9Qj0BIc5GgdDrxstqE15azexHhTGUpaKe5D1dJJJS1aY8I55AWlGSJNFOQMj5+YtnehOVLi+sP5S4WZkUbCJwEfwCCO1Bx+QkYeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759923484; c=relaxed/simple;
	bh=ezaGH/pycikWMfeGzluiwOekIc13FK5FGi0K1uMrFjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfbO9v9FzqKaK4/7OmdfwMGA1zrfMHlutZviVEqd1Ef2mGOADSXQMe7c0BVZjGmWzyu0NTwJoHQBuoOqn1OGVPOkzyaIxGr5q5/b4uMC/jdz8MrGPQydk2odFzkdmp1nVIzgx9RBfyQEGDmBtD+XYrOox87wA4ko+vipKyPNubc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bk1zzqJK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890O91011742
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 11:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ezaGH/pycikWMfeGzluiwOekIc13FK5FGi0K1uMrFjo=; b=Bk1zzqJK770M9jkF
	2ATfKZlHmhLxp91fuBVyfHABcofWS9zFJZtssQNJpDxiC+eE/sDLFnpi+eCUFIaJ
	7vamghPN1QoNoI5Vb4vziWbKQEOCtTGcXzjBH44jne9TkTBcMjj9GP1lR5CfU4z/
	hU8VisZcoIc+3PgQRH/H3WRR+/eoBQczYyfKi+/I+5yrhkw0878mDRXX1wCVTb+A
	o6u62TKuuN6qk4cLnhKROR6ck8sT4A3Nl7lhq+IsBH2glqdt0Az9KH3WxLhbhlD/
	0laJWeQhjIktD+w76LryOd5QuQHbJ021L2WEXnFWR+Qz8Hwu6ElPcmUrrwVOPPMQ
	GX8e0Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpw3sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:38:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f2466eeb5so7401221b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759923481; x=1760528281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezaGH/pycikWMfeGzluiwOekIc13FK5FGi0K1uMrFjo=;
        b=q6+oNG55+GRdA4uDZhyXp1qaJt/hWNosCSrnR1UTzTZS6lAKIL1mzTAMh8U/EBOPUv
         y/Z+q3WAGzX2WH97IH9Zl3taFPDTqXpeIUVD6FSOy3jOfupVMrqFPWa8V/8Wc3YZJWnO
         7zEUWeN32NGnqrC/qjThKYV8lSUEtt6v0Fngi/HJZYW0pVWEEvPaIjw/t/YVh6TEZYe0
         ansO0voaojjqmFyNyMnshyVKvF76vhOnyphGFI0wT+CtjNshOomrPOBwYVWi+MnQJgvS
         4ELWjM5iASFcaHNDx9atlznlLCniQbVDtR/v3dqBbqpupYvVbictwutJNnXGIFMy7POa
         kt1A==
X-Gm-Message-State: AOJu0YwS7CF3IU4Fkn4HWADeY+HmKME++LdHU1xIJM6Yr6GB7oAKQX5t
	yJ3BgE4n/VYO+j8nOwyQkslKM+5VPLYuBMIUED6qopDtHP+wB6PpT6heLIQqnl06ET8gQXWVv9P
	uN8Jw8Cvo6IRHdeqJZKSE2xzdU5ELwv9fDpPm6Ml31K8Paa1Ev+TyOmTKd5sT1oPWJP8s
X-Gm-Gg: ASbGncuo6coKC3ZhTmk4iocA5VdR46dSXBT7k7m2Os/DjCibODm6s+DQ177DrSHjTSX
	UgXplefCRhefwcv77LO9HMXhiujlraM2Bl9qtYtKoLX0yGzx9FUgYUu8gQ4LL83zxdlQ9TS2rNS
	Q61ekGG9fqiLJ3e33sRrZCp0nePtuCNHtrfRnwsi5Dlzf4T7cljIwTpg0O0CxY8ed4+MbvsbXJl
	xftxnAp5EnKNv2kumL+slaKqZ5s/CelxYaRS2oX0+L3OoDls0wjkJxTrySN6vyOhlf+NM4z3BAE
	V80q7M4lbgSemZvHDho8qC0yLd7PP+nlg8oIyn+gJTCfM/hm8akcCAgFTW6jF1ctRZ6wx6iAvuD
	tMuEFUFeDQRr2H0CF/MdGoJmFXAuM77JqUXNqxvrahIVaxaKmvMR7sBpqaQGvkbI=
X-Received: by 2002:a05:6a00:23c1:b0:781:18dd:31e7 with SMTP id d2e1a72fcca58-79387d0f59fmr2905864b3a.27.1759923481181;
        Wed, 08 Oct 2025 04:38:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF73KHt8IFMBclXeAyQRzint+ey8PeCCSrbWaDF7Iqjj9CiCF8ILNjUMuh0yFpufq6Q2b8e9A==
X-Received: by 2002:a05:6a00:23c1:b0:781:18dd:31e7 with SMTP id d2e1a72fcca58-79387d0f59fmr2905840b3a.27.1759923480561;
        Wed, 08 Oct 2025 04:38:00 -0700 (PDT)
Received: from [10.79.195.127] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb1bf4sm18571996b3a.25.2025.10.08.04.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:38:00 -0700 (PDT)
Message-ID: <c35f3888-113e-4906-b6a4-6183e245ef18@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 17:07:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/24] arm64: dts: qcom: glymur: Add cpu idle states
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-5-24b601bbecc0@oss.qualcomm.com>
 <d1de95e2-0665-4889-aaae-f8370b041826@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <d1de95e2-0665-4889-aaae-f8370b041826@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sB4D8ItY-e-sLBaEReiasZXYBZIk1aUR
X-Proofpoint-ORIG-GUID: sB4D8ItY-e-sLBaEReiasZXYBZIk1aUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX6SbzeHXK+69U
 hVNDPQvwt1BjB1pgIGyxef5DA+683Pt67eNqbz7McEFl4cDVC5EA0Uhc1dair38jjOHRUS8Pnye
 uXOBDnDs9k/HWlRWe0q18dvJ766M0Cb89JSrD/T81akCznLEdDdA3lu/yLZx1zarkkWzhASuvNZ
 vpvtBnFdwRbjuoj7sPWxnz5iDMoYb0mH6XoFcoAHNdfq6FlO3vnFTtmpp154s7eHNB4W9x6eJ8U
 4KAt/IHeLhynhBfbxxUh2QZXU17y45jATl4AdkFZrzJgMrFkEU/Xergk2HaLPYYYpw38QV242cU
 /dKTHuIPE7Y86iDxSddr3dk1u1+DOiD/trzQ6Z+1auRIQmZB7Heam0eSmyP9r98pdpBmrwDjkmo
 brWcbPAmfCI4sueokvgCLy+Ze6n6HA==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e64d1a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=NZGLDdUIzFi5uwaMtbcA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On 10/6/2025 7:56 PM, Krzysztof Kozlowski wrote:
> On 25/09/2025 15:32, Pankaj Patil wrote:
>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>
>> Add CPU power domains
> CPUs are part of base SoC. Splitting it makes no sense.
>
> Stop fake-splitting this patchset just to bump your LWN stats (as
> admitted in other email)
>
> Best regards,
> Krzysztof

Squashing commits 03-08 in next revision.


