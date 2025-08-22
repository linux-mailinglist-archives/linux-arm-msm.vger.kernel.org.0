Return-Path: <linux-arm-msm+bounces-70231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 754ABB30AF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 03:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D34668631D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 01:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342E01A9F95;
	Fri, 22 Aug 2025 01:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvMD08bF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC52229A1
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 01:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755827621; cv=none; b=P7R/PXPCysxWRltz/yjW7q6NCiAGbv6ZDQdiWz0I0+tG3nsCepzP31+FfDPQcX+TRCKE4zVzcktgpq35wElp8nOlctrmNE6clXWbTpxd5mCQf3UO6FStTpv+Te9vXnL3cqMUhM4ve11OoOccqwM8ao6n/KjrAoiSx7N/E5jTG90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755827621; c=relaxed/simple;
	bh=lcRbF4s/PQ23VSgcKM0p1j1KRQGCkTB/i7Aw1lz8Rf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dK5Kd0JDpI3b0Wod9hOHhW37ywCIi3IEmq66ruo0vQNecH/4d2kIC1B7KSqAUceEu35lAYVya70THaRYR61Aep/L/57EZPNBJYCdiH/wHGMAr310ZsxYnkeuC1UeozvMtuS37VjSeS7XNVKayQEa6Yt4iWsHyMC/BNo51uFrg2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvMD08bF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9J1A022911
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 01:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fQ6jAh+MsWJrW0ys+uDSW5pSsMHNRIQOD8QB3d9ba7w=; b=gvMD08bFuD3rSToW
	SecdwBe6Lj5LswT69wQ/2Tf715JQYvBfIZncY3lXN3AVpABeqNlCmW0mMIrc2/ue
	8EMe+e0Zw+uGiSXhwNl0cEeV/uayB1EfB/kzaXMQoJFqLWiwoRtxeJ32nyPYnlye
	9D1HD4kpSRFh7nRVI/tpk3u3HY6RLPMtaP4SXFuyPaOpoACFeq18GxVD1/jtQPSX
	byYb84Dqsjn9FIEXITDzjxbfFvvj/HhyyZl41ihq6nRVFjyRUrfQtHHlOESst1oB
	2QPZBSZkp4KUNmmFQJtwTQ8YwYRexFbwRhS/cCYKAl1/ZuY5bUl6DbIhi95mBg3o
	VwAUmw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52affek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 01:53:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-324fbd47789so1055576a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 18:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755827618; x=1756432418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fQ6jAh+MsWJrW0ys+uDSW5pSsMHNRIQOD8QB3d9ba7w=;
        b=jJ471VvqjNftNNL416ya7l3fKCbuVZL05S1iiTcxvPa+BcAQtemCQJEcNumAg0ZvWT
         c/UxtdMwd4HKXNibT91yQgCSxhdLE0z4bzbegiicycvFadL7qJfQkBhl8u34kCoxPcCI
         VQ+CzjZBNdqIRQtAOuEuKhGJ5p/XrA82pgzHcA8NlX4IxFqP+on6vP33v+R47wWvbQcs
         AegGP5GGWle2IfJ4UQHpXF+gF2BvJRqQd4RBQ74FN12zb38yqtBIkW/aGcX0ajU5Ti9v
         tw75XUIQG/cSwdEt5MxsJQVi/4qS8jRfls4DZyJVmlHvb7GecNU+yKQkPfHySHv07rOm
         8vvA==
X-Forwarded-Encrypted: i=1; AJvYcCV48a4ad6n0OY2hnmjIyBuScRxPQ+GHE/RVkVMhEK6abC1gjAq54R/2pS/jx69P6rhi8lIb55N0HI6OuTbF@vger.kernel.org
X-Gm-Message-State: AOJu0YwLAIy4LaI58UnxZGoxENt5kdw+X79y8NVc/AfBvFm1DC6O7xVD
	OzEuhkrIvIaelYYTX6NdjnnLCZrRwGJ/2/DLtFcV0qnZui/h11aLijEwflCB3p3DNsF1T6c4h+X
	QvIY8144lrVVsaZxCbjEly3e4+vlVnwxtwBRCnbAKBc5tqTrUkUxvo67vSeuMH0iEMhgh
X-Gm-Gg: ASbGnctn/jPkx3WJSTy/yP5D6wpR9kiz1xd561FYRN9EfoqVipU0QBpuW/+x/ulGCB5
	FOns1RHXnxDI66fTofw4c2BesxHF/WuQFWphtQO5CJ9Z4dM99txCAdKjzwGaRaUYJcbKG7eFSmz
	LiRFMfCAYe5UqFXfL2iEN491JtDP8I0SnzJYJt9cCQm9IcyeYnIGEJF4d8zK7H6anmLqURFHVSk
	mMW4Km23GvfJINTPGu2OC1SOCrPDo2YqruiUBi+ojAQV7nYTuSM/T1undD7BSTIhyT3lW77QQbA
	2nivPrAO2LOvjc2hxtUjpnIeULjdzo9gionQJsJ/FlPT7XOfy822oFSktk6n84gHBoF1+r5S0/z
	A4A2JCyobxz6evWsCO0zaQompkZLU3w==
X-Received: by 2002:a17:90b:2ec7:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-32517b2f78dmr2092819a91.26.1755827617888;
        Thu, 21 Aug 2025 18:53:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9I9vJOh+MwLycDuGMJzFuq4TmcBJ+szXaNAIctyyZVVpI/P68vxK3Jv34spYw+h3HbRLGtw==
X-Received: by 2002:a17:90b:2ec7:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-32517b2f78dmr2092783a91.26.1755827617441;
        Thu, 21 Aug 2025 18:53:37 -0700 (PDT)
Received: from [10.249.96.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-325129aa68fsm1012282a91.7.2025.08.21.18.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 18:53:37 -0700 (PDT)
Message-ID: <74bbf915-23cf-46c3-b9f8-48bb43ce9c56@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 09:53:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen5x4 PHY
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
References: <20250821-glymur_pcie5-v2-0-cd516784ef20@oss.qualcomm.com>
 <20250821-glymur_pcie5-v2-4-cd516784ef20@oss.qualcomm.com>
 <bm3cp2vyw4rpllkwoxoxwrvsjxrtolcroqwx76bkpwmcdvx7ag@b6hvybyouq7m>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <wenbin.yao@oss.qualcomm.com>
In-Reply-To: <bm3cp2vyw4rpllkwoxoxwrvsjxrtolcroqwx76bkpwmcdvx7ag@b6hvybyouq7m>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0YfR6bq7b1A5dhDGK6_bs8qllhm8oQBM
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a7cda2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=AsWi3nSQ2um4y-UoW74A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0YfR6bq7b1A5dhDGK6_bs8qllhm8oQBM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+IFngys1i+je
 +h60v2glLdYpYprR6Eg0FG/LAsPi76fxzv+WwZR1gsoMZLExvW4cpZQrd2/lh0ZpTVqdnfeOdMr
 eFvl3yRf2obVvBQS4uW7KP/V9KFZZJk7/HVVngPbaldyQOzDkFwngExog2BQ0fmZ7KsAZio07gq
 8kMwrBIyuV0aZKE08OPLYKPJ61viMvDyBQG/1rIW3BMD/ZjacgXnYQGcl0cnute+RfCiLIrU33e
 Gk2sWOV5wd3xaSTVO4MR48UxDhjXTa5YDlEreIWcAHD+k6LMSmT5dz1Gc8M3mPRzItMrs7TYtGS
 DATQZgFOwNpsict+zR0KnyMUjLZtVCVPjH4ismK7VmAszBrOojhvgMO/g8UFcioAlKmToHWEK8R
 g8ksgaRhsMYUYBvFBb5ucVw7zaTteg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On 8/21/2025 5:57 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 21, 2025 at 02:44:31AM -0700, Wenbin Yao wrote:
>> From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
>>
>> Add support for Gen5 x4 PCIe QMP PHY found on Glymur platform.
>>
>> Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
>> Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>> @@ -5114,6 +5143,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
>>   	}, {
>>   		.compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy",
>>   		.data = &qmp_v6_gen4x4_pciephy_cfg,
>> +	}, {
>> +		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
>> +		.data = &glymur_qmp_gen5x4_pciephy_cfg,
> Please keep the array sorted. LGTM otherwise.

OK, will fix it.

>
>>   	},
>>   	{ },
>>   };
>>
>> -- 
>> 2.34.1
>>
-- 
With best wishes
Wenbin


