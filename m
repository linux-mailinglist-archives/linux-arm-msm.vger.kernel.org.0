Return-Path: <linux-arm-msm+bounces-51525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B6DA62D7D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 14:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1785D3A86C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 13:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AF611185;
	Sat, 15 Mar 2025 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4xQ4PdF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C20E567
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742045588; cv=none; b=GsMtv13OBmnqmpRS26W2vHrqGK4ngOcbAJ5P2h98hH+LuD9oAloQt5FAPEQ3BiqetkWqFHwGVRdgYZv2XYAEBUbmxcwBSM4edBecZy7iOUA9d6FYB9lnwnLMpauW2ozECGQ4tOpW7aO17ipucQwqMhgEszaiZgsu0KFqjIQespA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742045588; c=relaxed/simple;
	bh=F9tvZ+z7ro+B4el5lp9PN4cepCM1AEto19V21POa7HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxy0T9QyYEcuYhHxpdzDai9LTmlIyvtul5hlLWXuOjW8ulgfNEhNCeAWJ4Xh2kVywOuFXgZkA4f95zdGK/m2mUlX8QDeumVwCnLklooK7x0jlOUsEIXrkeN2fWesbjdpglNWBIzYT6wk3fcjgzlyb156OvdmCBhbHrJBjMfw7xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4xQ4PdF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FBMrsX032403
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 13:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aMN8Uq1GYhi0MWhxNGJTOrZKFhhzAgWGJY2B6jRE/A=; b=S4xQ4PdFWmqdwaYQ
	0cjEI6N+QdpVFvY1HGwSEtbHrZUc2Ao1C1Qi6fBVhRDeXaTZW7QTeqz9wpTEBL0p
	K+5fm664lVrn8Pq7f9aWEZ2bBTxVFeAdxnFYC2JBp2GMtEr9W5sR/ITOk0mRuw0E
	EHD+z25SWqUYd731sDyjjtzYXCj22GRhqqac8NdPB1nTuRKYLgrcIIlsNjPSZVE3
	qlcHr6yi4yhUacjNh+yEF4cp0OGPEdU0ZMN/qD7cGggKA8YA2v5sJWJb5gid5+aG
	PUKhI8/BuGTxHuVhMCeCeA66KRft+9Fp3vgxOVF0Z5QcXfLn+yXOkAXy3DeGruxP
	DvEurw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1r10qyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 13:33:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-474b6e87831so3772791cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 06:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742045579; x=1742650379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4aMN8Uq1GYhi0MWhxNGJTOrZKFhhzAgWGJY2B6jRE/A=;
        b=t3dLn+j/v1XL8vWMHm4HapR/YIlvf2xO6gd7wY1ItaOvhN5AMgEWwiA9RwAF2Bgy3t
         EJSjAx5jcFLFJMIvfpG5hWIUVLGCNzJdvSTx4X/iOfMecXYQc3taEKZYBmzdId1xQUwP
         f4FsCjZg7bNLlaKlUsmisYw/AnRYx6m0sbyQRe04+MvDDyaNfYp8ev1xJcGCVoSJuUaA
         tC3VS7nTpqJrpfQgBB4XWCCBDR9rpKabaEAh7eqfueHC6xqK5fuC13t1gKS/KecfcbcE
         F4M4ndJIOEBmbTgFDdT53PF7qTua+6nSyapftwKs05yANs3V0KWjNpOUQ63QaKfeQSGU
         wNXg==
X-Forwarded-Encrypted: i=1; AJvYcCV198uPpo94smDLl5oVhvLWgRtd6q6+VOFYY8t3YfgXHtGB8damHr0gFj4jUf4e7jVOUP5tWtTvcdGcyJvW@vger.kernel.org
X-Gm-Message-State: AOJu0YxYVRo6uXn8wKplrs0CXqOLKzeHtfN/QQ0oAZENfMiXaawyZLiG
	1tfRswNk9Dksd5HbapWYyTs93bx6BcMgw4dPFg4h8DcEGkhaRMr98ARgRV7UEYsf90hz6vJ3Rsd
	TRHofmP5Oc0DQfnQacnvyX612daAmxQU5nod1O1I0M6P2X2Rk8RCZnWerTM4UrrwP
X-Gm-Gg: ASbGncs3R53uBID0lv1/4pPY5twQPIg1sAq3ey/sHe0bgskpi4dk4BP9ZdPH4isSO3o
	AJC0yiMXUwi94vQkVychbIIr9xhDBuxnbEaj1jojQjkRsO29lpZvdPFWrcaGELEHrmDOeS236Ez
	t0z92Wje247rq1j5flcfLy79N2Y6SOUQ3rVuOHCjh38GhrwM/PiA4Ki4vX5BLDN15erZMEnJudD
	g1e6DAZ0qAPTYiqYvIyWgjg4eLsWt7cCYs2c9LVuPVeZ6ug8UMc3+PHPs/vwNH5PiLdtBHRVv3d
	5ulk2IkJyv9XoBVfKQFkGdGd7KjEI9o9GP6soU4ckYQmEC21u7jWPEoyFYjLOev655jwqA==
X-Received: by 2002:a05:622a:1a90:b0:474:fe6a:46d0 with SMTP id d75a77b69052e-476c819054cmr34238321cf.12.1742045579266;
        Sat, 15 Mar 2025 06:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVfUTkvWeCQ4/UUIZLmhPCQK1CPDkSud4qL2cK6ax5X+lJu0sDsynhqYUJIRMANdARg/z47w==
X-Received: by 2002:a05:622a:1a90:b0:474:fe6a:46d0 with SMTP id d75a77b69052e-476c819054cmr34238081cf.12.1742045578825;
        Sat, 15 Mar 2025 06:32:58 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147ed1e4sm375417466b.66.2025.03.15.06.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 06:32:58 -0700 (PDT)
Message-ID: <40f26e69-c3a3-4bc0-9207-9d51126a8a47@oss.qualcomm.com>
Date: Sat, 15 Mar 2025 14:32:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: ipq5424: Add PCIe PHYs and
 controller nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250306111610.3313495-1-quic_mmanikan@quicinc.com>
 <20250306111610.3313495-2-quic_mmanikan@quicinc.com>
 <vfwoxjrfhakkkunl4wktn4muzj46vunjzc75j7zeu4wvpwbkkg@sh6d7zlp52ea>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vfwoxjrfhakkkunl4wktn4muzj46vunjzc75j7zeu4wvpwbkkg@sh6d7zlp52ea>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=67d5818c cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=5Vq0D0HPjZJFN2B2GVAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HgEwZjFw69n9wiwxDHZg7rLehvHkCTKZ
X-Proofpoint-ORIG-GUID: HgEwZjFw69n9wiwxDHZg7rLehvHkCTKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150096

On 3/14/25 5:57 PM, Bjorn Andersson wrote:
> On Thu, Mar 06, 2025 at 04:46:09PM +0530, Manikanta Mylavarapu wrote:
>> Add PCIe0, PCIe1, PCIe2, PCIe3 (and corresponding PHY) devices
>> found on IPQ5424 platform. The PCIe0 & PCIe1 are 1-lane Gen3
>> host whereas PCIe2 & PCIe3 are 2-lane Gen3 host.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> When validating this against linux-next DT bindings I get:
> 
> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: pcie@f8000: reg: [[0, 1015808, 0, 12288], [0, 1073741824, 0, 3868], [0, 1073745696, 0, 168], [0, 1073745920, 0, 4096], [0, 1074790400, 0, 4096], [0, 1040384, 0, 4096]] is too long
> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: pcie@f8000: reg-names:0: 'dbi' was expected
> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: pcie@f8000: reg-names:1: 'elbi' was expected
> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: pcie@f8000: reg-names:2: 'atu' was expected
> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: pcie@f8000: reg-names:3: 'parf' was expected
> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: pcie@f8000: reg-names: ['parf', 'dbi', 'elbi', 'atu', 'config', 'mhi'] is too long
> 
> Are we still missing something?

Yes.

There's a dt-bindings mess regarding a number of similar ipq platforms
that has been impacted by a recent round of reviews that resulted in
reverts.

The merged bindings for this platform were created based on ipq9574,
which used some crazy order for reg entries (i.e. PARF not being first).

That went unnoticed for a couple of them and when one of the ipq
platforms patches were under review, the sender was asked to align with
the other qc platforms. Then, a series changing existing bindings with
users was submitted, which was partially merged (and then subsequently
reverted), so some patches are based on that, while others are based on
the state of -next.

Now this v4 puts parf as the first region, but the v1 bindings were
merged a couple months ago, before the discrepancy was discussed.

Konrad

