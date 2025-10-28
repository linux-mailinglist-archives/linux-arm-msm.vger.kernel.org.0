Return-Path: <linux-arm-msm+bounces-79264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4E3C1647B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 18:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6DF925008B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89ACA34C142;
	Tue, 28 Oct 2025 17:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCsYtHLv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvMijUrP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6DD33031F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761673359; cv=none; b=s1R6nDVMIzcyKQWPYO1Ga0S7ECmakb3fFdbtHUmQfOXeA9HAa+FzRf1QsdMSNXiukmINZU9A9OkYfkWTj0Unc3IH1v+lcHEuHPdAgyO1dVVp5QrK9TV/uvJPeo3c6l9B+6ZJdnRXQWViZtc/g0N5U1WW12spRj4T6TXGqgjkIYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761673359; c=relaxed/simple;
	bh=sVgolvHBSJka8vC4OKuZhc6q69RPDNNdOJ+9cK7cy2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tkyudVjYb5FXqP/RWadG2cbrqELtgUBAgjFXIkORPoXw27ylh+cZwB7lqnFoxlcMD8kHNqQ2YIq0udcbXXpw+iB+pZpFogsZHT0rWSSl26FaLkcXdeMrF9gLcxKkVJ2UhlCpL/ONGRfhxLkANrMCPQjaSWltros7moLdMaopJZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCsYtHLv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvMijUrP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEndKD1865927
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Us00t4uVlHXxk31bFSR+oXPx+8hv46C7a9Rtr50Zi4U=; b=DCsYtHLvNZ/Xxgq4
	TiVHhZOW3reQBKx+JuS/Cuz+0OII3UG33Fk3Mj5ZRRNHGrvT/qRkNPEWfeCNlA0F
	T8grrCu7uACH8xX42mTCzkjk6f4sHEN31xRluyW8aJVCpDCT7MVV03sAlApH0GJB
	eEJHZ07JvuDcOe7i3vttTzCz+U6rcaJFFffwnBt5/yiqUwJiIVb8djEoeduCDjYJ
	j/KCn4L2/lZ6NGtirdtyztz2JSSKq8uD9/Q34b1W1iheP65gf2y4dajgR824M9UV
	uJOUwR4rR3zVQrv94WQKx4xkzHhH9u7p7vXCPo7wujSAdqUCjZmeUX7Ye4zqNKxz
	K0cj+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2wsps29g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:42:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2930e6e2c03so66210395ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761673356; x=1762278156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Us00t4uVlHXxk31bFSR+oXPx+8hv46C7a9Rtr50Zi4U=;
        b=MvMijUrPxK13KdSX5bWR+sVbiKJSQw4692hbV47CdQbY9OSNmQ4u0/jO9dcGlK0tBT
         QAuvR8egtqKNa7o/PXYLT/VJrAj/0N22AZrQMJLFUuthrPzK+nPUsQJwzruhyH8eYgj0
         Z//atSXM6UmBvBVmc4mo7dVbXcWTGDlI7tL3gBpMK8lRVw3WdgRy6kSGlkt8dQ+SzDts
         vowz2DrZuBLbO/ynfXoaGUhj6vtvJrwetmEiaqG81e624+B8FPhKkLMsyim4cIgA+MOA
         sM2r6suyOyP/4zew6KahTlQPbB8iLslTQdhjW4naTq4kQto0Ys10LPSTn5icKlFqojlG
         8GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761673356; x=1762278156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Us00t4uVlHXxk31bFSR+oXPx+8hv46C7a9Rtr50Zi4U=;
        b=F1wmC4ypFLihFLvim/9ZJdIdIwdh8q0aXzsRvXwqwWfSc38SrdvmFaFPqaeNcNxoXT
         h69yOqyjYp4stycrombLBui67iu6TKXuZn5q4Niih/bF2UbB02AFx71+9KHMxPrTsNv+
         mYQf7rh2gyIY59l9WvW+utLggXs+gkacrb4H0iopB1OM4fLR8POTHCiVzxdY1mW1qQIp
         0TLBRYhK36YsCaq2Pz/nzUUKGpJiXal9O0DiyJv7qcqLqOT0RY1AilD5weJ3wK/vRMZx
         4nBcRpw18W9D43Bb1JvFEN47TpQtaPpXkTX2ZnJn5lBGmAlIPvlqnApys6/IjRk55ub/
         U99w==
X-Gm-Message-State: AOJu0Yx13/j7KekD0ZrHk8G4U7oJqR+K58mCVXYyPeYBRIoQhWA7TXfh
	IspntvFdb3YoF8H3KeypcbOrlmfGfQm/1DUE5SYGwYkCtiq0rWvHWn2elFoJtiOzh4/T3s1mOr8
	2gK7TCFq65Tboz6yTYTwciuRm/AnrUBiwXAbjvIsG8AzoWNxjDUwKs+67vlIhVlNDBceW
X-Gm-Gg: ASbGncuBRoHVuT0tbFsekLuyzEQAcxhNjryb2Tzacj0DCJHSZ2HWzpJABBLky6f+zKG
	BoPTpywei9UnQ92xWYCXGlHCezLotiKpxnFbDArmqLDTTy+qCJ2prmEhqzt0XmXIzbcevYU+rPm
	uj/LDIFJUxeZyRywyqZBZvAcu1R+z+6Ukt1/8kypIg0xoyPI4jMMO16eSSJxVR+COFz4qVQwMjG
	C1uwyMpxgkRQJRYpnI8TCV/DVfdJY8M32Tqb1PIvyQyVpXZsoNuepHeTfb4HogQgZ7DvB58nM6N
	YW3dQS3QvZHUWE07mY4IxqBpdmd3uBPuPwiP5VPtZKxTFvUuToticlNNnUkgYhGGPj53VhJit9Q
	7+MX2DJiHXs96umbUkJANNjTmX4HhOr9otQ==
X-Received: by 2002:a17:902:e5c8:b0:275:81ca:2c5 with SMTP id d9443c01a7336-294cb5376c9mr68893695ad.59.1761673355789;
        Tue, 28 Oct 2025 10:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8YmrED6GOKiOwqc3GYd5ad4wsT16uGbVKCFKeOMcE0bVa3igKgSnhX7LKmDH5DOEt31TBtw==
X-Received: by 2002:a17:902:e5c8:b0:275:81ca:2c5 with SMTP id d9443c01a7336-294cb5376c9mr68893255ad.59.1761673355274;
        Tue, 28 Oct 2025 10:42:35 -0700 (PDT)
Received: from [192.168.29.63] ([49.43.225.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0c414sm123607725ad.44.2025.10.28.10.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 10:42:34 -0700 (PDT)
Message-ID: <e9306983-e2df-4235-a58b-e0b451380b52@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 23:12:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v8 0/5] PCI: dwc: Add ECAM support with iATU
 configuration
To: Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250828-ecam_v4-v8-0-92a30e0fa02d@oss.qualcomm.com>
 <176160465177.73268.9869510926279916233.b4-ty@kernel.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <176160465177.73268.9869510926279916233.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Pmhb3b2qGiK39qlabuAqff1MYmwAe3mY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE1MCBTYWx0ZWRfX/q2lho8WKxBg
 OcsGDYFPrl2Uank1rLPljPKdJbv7P7AtOPZgYQR387PGm07Qncdja35UFDPcgioMFlZ48qJ7P0f
 7tkbQp7/Q3mFrTS+sYfI3TrnKbdiAycMmupmxsC2qo3J/v4hMI8nwtp+zB35hY7vRqCvIFDPm7C
 NdMV4MgrPs4ZoABnuXxImt2BCAqKiDg7B9Lfq4053z3sODjTL1jlr/sZvojCABcZU6bk26bqPC0
 VM7TDpGn8tI/LiMbfMuQgDVM6A1ymd82gZnoww3avj9F57Ph3W2RosMhIFDiIuy0VcGArqBis8v
 GuJtfDaJM7pew3YqnI4oTZgjp6kVIPaAevD3I2XrQwcggQhEMwZpjQhAxAo6/mw981mTR40LV7Z
 Nwixep95j2+qefEtj/LmBlo+2uQ14A==
X-Authority-Analysis: v=2.4 cv=aIj9aL9m c=1 sm=1 tr=0 ts=6901008c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=jzToj74tLtS9RNrshGflUA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DjtaZYkIGepEHi-_gOIA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Pmhb3b2qGiK39qlabuAqff1MYmwAe3mY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280150


On 10/28/2025 4:07 AM, Bjorn Andersson wrote:
> On Thu, 28 Aug 2025 13:04:21 +0530, Krishna Chaitanya Chundru wrote:
>> The current implementation requires iATU for every configuration
>> space access which increases latency & cpu utilization.
>>
>> Designware databook 5.20a, section 3.10.10.3 says about CFG Shift Feature,
>> which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
>> would be matched against the Base and Limit addresses) of the incoming
>> CfgRd0/CfgWr0 down to bits[27:12]of the translated address.
>>
>> [...]
> Applied, thanks!
>
> [1/5] arm64: dts: qcom: sc7280: Increase config size to 256MB for ECAM feature
>        commit: 03e928442d469f7d8dafc549638730647202d9ce

Hi Bjorn,

Can you revert this change, this is regression due to this series due to 
that we have change the logic,
we need to update the dtsi accordingly, I will send a separate for all 
controllers to enable this ECAM feature.

- Krishna Chaitanya.


> Best regards,

