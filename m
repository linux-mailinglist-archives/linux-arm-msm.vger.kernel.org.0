Return-Path: <linux-arm-msm+bounces-84890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F33CB28F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 10:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37B503100A98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 09:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7432304BAB;
	Wed, 10 Dec 2025 09:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHXEQUX1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQrqDuR8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C03302755
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765358874; cv=none; b=AMq3l4lGJIyqA/I0nv+1Isfpyg8UXHdfnJ8DCwUwzPZOEffm3yVY2oNsOY9JZ0jf0xT5NCSMT0afI5utCrQssjaTigTi2xJT2TWr8/pcwVCcwLzhPQQatmIM1mWMIVGdY3tWYVxGZ97WamsRPRU0UV3TVxIknC6H0hnIKbx9ayA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765358874; c=relaxed/simple;
	bh=ZncHYmryPePCczJvv0foKWpEDe+N1au7Gi2Dbjsh42w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GsM3Jx6JWHIpC0/sXZwisJ7UF8bojY9QmC0VibW/9fWElHHb2H72YWs7txonCuFX/DnxvJEwwEqHLq0vNEDNDRg1hZr/SOr1pe39j95cpdUxNEBIgYccG4cdAi617HcjCjHpqfMLurwVTzQGaNbluvYpn3CX/3pcjR5NSB02eMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHXEQUX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQrqDuR8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA8e29P2432542
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d7YV5apk9L0waFuyr5a1Vu77m2o20ucLVea/0ka9hf4=; b=MHXEQUX1Bydm8kzx
	vAdx9hO1L6TQnFs88BdDPawz5ZqVX8Q3HOd7PlT/flR6zVN+grvRsIPTrPxOmG9t
	1X3wMPRfDl9DU46QbED5xg3P5+rn3O5OdnZkBm/SOOEYQy95Zo1GTiWaRVZhuXpI
	FLQ0GKEqF0GUYGDLoHGD2eFKqzIpqLByuKKmo4MAemyXFCL6SSpwjETXHUkXRC+l
	MbIyuGLG0UXQtJPYy0yZU/lAjRuT95wAul5g+qp/ME1DbkOTqfusWhcLKj0X6L3r
	CcnDbaWeEVRonQwAP507NDzSeeDMp1MLIXjBnsGHZmqGVZ5VnNUU6B9ntMRldLBT
	Skb4gg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axvm6a18d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:27:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f48e81b8so11355215ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765358871; x=1765963671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d7YV5apk9L0waFuyr5a1Vu77m2o20ucLVea/0ka9hf4=;
        b=GQrqDuR80yzswu7JrpkBu02Om3K/57RFO4mrXpCpFA7YU3y+9H4xtb65pyGY64YO1/
         zwddsS8gV86AF0gss8loucNpNzcuUGr/NWgnFi4A9xYggZlf/oRnYUvNsXivK6NSLTrt
         G9+EukFMwzSjAFEIhiYOsaev4OxkxbWPEpENLKu+IKPUTnH3R881yY/j1pOGS7mys/kx
         QwRr/JY2++f9g7e35WOh4XWWyaLp5FYOJ4jOIZMQbw0AGg35AkVYjr6IYE8yPRjuVfUQ
         Qi9xhrrsdsXzVNq6TVuv9asFoiNeK0HW7lcXhrLZQKcdi0SeUGJVhEo09vQi4Ff4vFM7
         TuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765358871; x=1765963671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7YV5apk9L0waFuyr5a1Vu77m2o20ucLVea/0ka9hf4=;
        b=EujVrr/ttZEpsYJYheTGRMvtQHIK6zmosAXRp3Ouc5r+4Sypp0PU79mN9R1aEwOg6r
         /Av5VuzxUQOEW/RNfOzDk/qRe73rdBnX2MDfhDe00X2qrTm3oWWtOHjYv9NuS2Of1FUz
         iiHSBEomK1IMz9j23OyCUWwyPVkTG4apHsrRJWOnBl6lMyS5zaRX9ptzNwH0ZihPBE8M
         oywIWZU5oWRlpT8fPSHTR+9fscWAkNHNIdjEtUxlAcCPN4MpNcpFKFHiYwihfYDpZBKr
         so+BhlsVY/Cj0SP4R9xnC+KHN7MqU9ni/i44KuUMaTdE4L2oNE7fqqBJyVK3MnI+sQ7z
         iUeg==
X-Gm-Message-State: AOJu0YxVlupOD0wltyBTlDKP5CGVS/7EeLtNJyFtYIthh99BrAPNq4Lu
	slg8aI2acLLAkUKbChndivAmIrMtcEeW+r31JFxPWv5E3WNIMYQq6zwjkPbbIA8zQf+03cfaE/Y
	VlVJxEiogEWbo3VjCp54G2UYq4sRI6pkoueDtWi5dG8R3xUDAp6UKqZBHVXApr5b08zR5
X-Gm-Gg: AY/fxX7lgfUl/OEfaU5W4ob0s1f5/YYQc+keBicolasHpMadkCgAnE/7YOVP4CLuuMm
	I7Hsb+aeATK0eKSa19WyYW4ZuuDUq2vczbvk0dH8+YTbMIvAuMBoTAgVXByqOGZPyjTLJSpRikV
	PeH0wzdPiRKvozJmNm4/X5l/hxrLVrt5qEwSRHlq+EKfuv5qNpUyVsW43h27ab5MaVWKeaHtFy0
	za9oiAKhliS696t/Kvp9FOmh6T402jXHI5BXt0m5zZ+Ub06bSJYKuDQJNKKI9/slXM3fOQ46gBr
	SoZ1woO3oXI3iuUTUlT8fC3gRLru7Pndnm9tWHGZwqsGMLiOXNi0fD+e4/vX9dXgvwsKT2B8D4S
	JulyeZJdd4yMe04ygmUZO9kd2kAM=
X-Received: by 2002:a17:903:189:b0:297:e1da:6fd6 with SMTP id d9443c01a7336-29ea03af6e3mr45488875ad.8.1765358870968;
        Wed, 10 Dec 2025 01:27:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLRkDSAmj0KFW1AhaONVqeN2xtUYqN76SVdEnUakrrP1MHG/QjQ7CSxPumuAYGWaBrEfu38Q==
X-Received: by 2002:a17:903:189:b0:297:e1da:6fd6 with SMTP id d9443c01a7336-29ea03af6e3mr45488705ad.8.1765358870493;
        Wed, 10 Dec 2025 01:27:50 -0800 (PST)
Received: from [10.147.240.173] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99fa59sm180082225ad.58.2025.12.10.01.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 01:27:49 -0800 (PST)
Message-ID: <86721b44-35ee-4a14-b38e-d40a10952496@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 14:56:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable TPM (ST33)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251114-enable-tpm-monaco-v1-1-4ed566838698@oss.qualcomm.com>
 <cf2dfdba-bb1d-4255-9db6-7aa6125265bb@oss.qualcomm.com>
Content-Language: en-US
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <cf2dfdba-bb1d-4255-9db6-7aa6125265bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RTVlqPjXmA86gZdyAzQRimpFXJPvflCQ
X-Proofpoint-ORIG-GUID: RTVlqPjXmA86gZdyAzQRimpFXJPvflCQ
X-Authority-Analysis: v=2.4 cv=Ztbg6t7G c=1 sm=1 tr=0 ts=69393d18 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=V94qMDdOdRTrBcetFLYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4MSBTYWx0ZWRfXzaT68PdmRn3k
 U/2xg+Xkmk6/QM0pVhDNLajstqwXzh74Fu770vA7JmcHMx8P1690XVBOO5RIrL5JbNF3os3xKhy
 Z5yDAcR2GYt2tcKTWF4s+kOWjGeENu9OeOgf4Vhhor5c3ma7GNkwMecveG09nm4C7O6GI8oK0Xw
 bAyVHlykYENjYdjPMnW8FXd6e+lhAl+PCcrIvwlCeLtNvADBifKur+GJkeDNqO9s8CPLFQNfMhk
 22xXeCCzjovv/Tl02e5GMG1cC5MUrzzF/koeP6sLFh40jFsjalO2Z/H/3rb6zjNnoozWCkDRJ9a
 eYkiC1zbGdR5pPI3bbkeHM7r+LgsviBagHcX7xk0NHSk0qlqs/cI/lyGLBCaxxC6nAjqKiGcrez
 MQ0Lb3a1+GOCPbV9J3Y3uw/BsE4LbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100081

Hi Kernel Reviewers,

I wanted to follow up regarding the patch. It was reviewed but hasn’t 
been applied yet. Please let me know if there’s anything pending on my 
side or any additional changes required.

Thanks

On 11/15/25 03:30, Konrad Dybcio wrote:
> On 11/14/25 11:17 AM, Khalid Faisal Ansari wrote:
>> Enable ST33HTPM TPM over SPI10 on the Monaco IoT EVK by adding the
>> required SPI and TPM nodes.
>>
>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

