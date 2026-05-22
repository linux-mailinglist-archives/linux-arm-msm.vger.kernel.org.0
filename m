Return-Path: <linux-arm-msm+bounces-109213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN08BVIlEGoYUQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:43:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 100495B1656
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05AF0303B388
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB01F3C09FC;
	Fri, 22 May 2026 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHicWvgI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="busEow4t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F6C3B9DA6
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442286; cv=none; b=mfi5siGkTEYiKagA9coCW1gVX+aoRJdqJ4brypO3CdQvxT4XiB1AyAXXirDGeNlnMCB/WQ7aAvZQV29gKQzaA9ei7sY2zEAKjhXyM+U+BedHk/9Vvrqjxul12Z2tmBoCHDWp9k1TDEDDZA4pI0MlvYiY2+L6QKhz+i08VDUuPY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442286; c=relaxed/simple;
	bh=ReQQM/7igDEjQztdU+albgNOdhmDe20jo44TvforNaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjRZwWiTu7VwXjtcri8xiHSixLbsnRfQXAhpu7082v6K4Srp1RTp1r70zd7ELVvBt1yAwu4K2TAEhjrE1TIqOy2YjlmTanFOLOGhDh0z3YTOQT7/T6+1NXtSoG96ogQUlZLK90RAErD/fjZ6/31HvRdzEgbYFMC+nTKMJT5UHrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHicWvgI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=busEow4t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8tQiM1816086
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CmuyIiSD8BrtuoCQP+CAPpqrC+rs5hG3BsCae1P/mCs=; b=YHicWvgIi1t1p7dy
	a53VKRNrD/g7G30Spr4USby0aatZy/IbRFe86lZr31rcihEBfAhGBsSRRmeQ4I/0
	SgHEuUunAOE+sXrQO2oH6dFz+vkG4JzXFDQQYihTv8m8EczHzOKkvXArQhrIWC/K
	5IBg/PzZy/m0W5HYfV3LcNk/CBwvUO2+3EJFMqq1elHuVY9dMmMp8vjqoKHtyx3B
	rIdTEeMCrcAcw0u9xWXsagl0W4xJ8O9hiX+Lk816HvLR1WVElA2+M7sppAZoj9U6
	JEKE0PUXNER/UnrSTAcI1+dOF9IUgJfB1bZXVEPUWoNlnZsyqsogdoPSFrUJvFQN
	6DOXYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm1ax0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:31:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so6827305a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442283; x=1780047083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CmuyIiSD8BrtuoCQP+CAPpqrC+rs5hG3BsCae1P/mCs=;
        b=busEow4too8KLMDLtIrekVpmW6IXdJMcI0BxOfmPL3EcDLj5zN6pYox11/fFP55Pq8
         FOtJ6p19sgRWARmuqCc6kU6lGpuQuRGxOLiIMyVqnu5HhMFqQOfGd/HkJtScF/Poahqg
         CO+etRpczQj0RAxCbQa9yuO1yIBdPQh0TaHo7lUWSEEVGHtBuf3UwuopIg1weBQzEJVk
         VCgEhzv05dMDg5nZGHHnE4tAIgMBVfVIX9hjAcWwaaRG8c26vx+/KZZtaS3CbEMMDSdf
         fq9L94MsAl8XDBSfZOGm0xbX77zdyOSqXnhw6EQ/umeok6w/84h90mtJH7Ub01CEoJ5q
         xV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442283; x=1780047083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmuyIiSD8BrtuoCQP+CAPpqrC+rs5hG3BsCae1P/mCs=;
        b=gebfkxsW2kzgpt2JhPMM8sFkV4n5h21vg/D6yTsOqAdN03FcQ15h1hHEqjv0abqCnU
         +y8fvIV6OUQbAlmXK5jBz1L2I/VM+hRG0tQJcRxRHZV6ogvhm+6RLDRaB4E90V413L+4
         qe551ITiMhvDB4OfvJtrADwno9qACJHBEiSoOszeVVig/v+zLULyqcF4D6DqQvyLyKIr
         e9AP1PLSkpyc49jppF6aV9xSL5Zf5lbI5XTdbC/r2FJV0vka8USLPHYitftQIfdDc/oZ
         1+APFsGsZY4iUmKJHpk6lszJPX89GNYLZVLtH8c5hGS1OKEb5+KQDryjZjeVy3K9NJjv
         y0HA==
X-Forwarded-Encrypted: i=1; AFNElJ8vbrXrARwTKpQd22gdeucFM8PBBDzgtDuz0FPZZl23/jVbRVv7EXIVSHqqQVfa7W8rMrbwA7ysSPQl4ZBR@vger.kernel.org
X-Gm-Message-State: AOJu0YxTIJHkoKxZi0YyMj1dJQIWfXKf4bXD9Y7XNeDRpXKOHxV+R2Ih
	3A1Lyszd43+vNAtZnPVcz3sCfgAY1yT80L6+uTknppSa1iwpPJZSi12QTC+pyFBOtaFMRgBj1e+
	LIMqGLr1J1oRGg5jyBdESz+7dWcXGzUwgjVQegT6qoECtevl3JUsqzi0uykVMzyeB2CdE
X-Gm-Gg: Acq92OFQTnFfGsA3W8SH8YU24V9SDHRowiUFPGdjoq/T+TZwDrf/UFywD6koKazjQGL
	6cLSy0aiwr0me0+Bg0rbq9J4eiRHuKlfSL9uW4DYCpDEpQKqSKGZ90NMQp/a9FZ0tCTkbCGTsDy
	X9ekc5C9wcuq1M+ELRZTUUZ9myJ17SmrOJysKksgVLyYPq8CNMDDHgVXhQ0shxdcb5qOKXl6EHp
	nuLk8msFMO7G+MMMOl9/VqL3fIdObOsRJtqMGplf5/Uff31/+y0S7TusSy1kWnoVYHonJoU/YXl
	y3r1oein9xbJhW2P+p/eZ2tI3KtedFvwO7k1zb1AYsdbTsFCKmmpBrKSMTaNvjRlw5+C+2Yec1U
	whv6OeyN1SkV6O+ZMdTHlsCl+P4ir/sF+yuy7pr1y6keCR3qgo11tHK2TN5r+CA46
X-Received: by 2002:a17:90b:2584:b0:368:6159:980c with SMTP id 98e67ed59e1d1-36a676276b9mr2733214a91.20.1779442283316;
        Fri, 22 May 2026 02:31:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2584:b0:368:6159:980c with SMTP id 98e67ed59e1d1-36a676276b9mr2733193a91.20.1779442282825;
        Fri, 22 May 2026 02:31:22 -0700 (PDT)
Received: from [10.92.193.94] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6772f486sm936162a91.2.2026.05.22.02.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:31:22 -0700 (PDT)
Message-ID: <5593d136-569e-4ba9-9a2f-e635125899aa@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:01:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] PCI: qcom: Add Support for Eliza
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
 <20260521-eliza-v1-3-97cdbe88389d@oss.qualcomm.com>
 <20260522-discerning-sympathetic-moth-daa9e7@quoll>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260522-discerning-sympathetic-moth-daa9e7@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1zcaZWZXAwI9j-Frs9rHH7oBul9ZRBtE
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a10226c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jbukJSVhv8iEu2CO0E0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NCBTYWx0ZWRfX7vq8ygDgEvg9
 vRzsU68NMzH/zfruP1OHmnI7hACy/WeN6NjLk7Cb3Qto3XE9C+4O7tDOBelz1R0IOHcSS6wo4kh
 EcTf5nmfk4GezZtJZ2s/TycpCi+EAVe1xQhnYmo42L8+wK85/uaqv7WPVxjXi2GhGJ6inN8Vk3Y
 sk2h4Z46QMAH2aOEqqgF/yiwnTaMiL+gd9eeGr7zaxHQtk8LkyBqwUZMkbMsP6LtqRmd9ZnDqRD
 PSBwfeHIh9U2D7wMCUGYBVrY35PuGl58LUEzDG5HrOqa0bkPulh1H4D/lP1bdffd7EtxV1LRn8z
 HXqmeme7QDGfrChEFqELr/pybI7UHI1fekOWBiZX0M110roNR6c51hdWgTKDYsXx0xbggbHj/Gu
 n/iiCwOENzmU0MW+VWTnZ6NwLcynoL8+Jb9lUDjxjRcKuPN6E8/B46LI6o7KMU4BWCPYy3Ptqkx
 Oyyi+x1UqhAsjdPfB4g==
X-Proofpoint-GUID: 1zcaZWZXAwI9j-Frs9rHH7oBul9ZRBtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220094
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109213-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 100495B1656
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/2026 12:21 PM, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 07:35:31PM +0530, Krishna Chaitanya Chundru wrote:
>> Add support for Eliza soc, which has two PCIe controllers capable
>> of 8GT/s X1 and 8GT/s X2, using the cfg_1_9_0 configuration.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/pci/controller/dwc/pcie-qcom.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index af6bf5cce65b..40f0a5f247eb 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -2123,6 +2123,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
>>  static const struct of_device_id qcom_pcie_match[] = {
>>  	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
>>  	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
>> +	{ .compatible = "qcom,pcie-eliza", .data = &cfg_1_9_0 },
> So compatible with sm8550. Why isn't this explained in commit msg of
> the binding?
No, PCIe controller is not compatible with sm8550, we are just re using the boot
sequence used by the sm8550.
> Anyway, drop the change, pointless. Look how other devices handle this -
> do you see kaanapali here? No.
As we are going to use different dts schema for this controller we can't
really re-use
like how we have done in kaanapali case.  kaanpali is reusing sm8550 schema, where
this controller can't use sm8550 schema, as some clocks are different.

- Krishna Chaitanya.
>
> Best regards,
> Krzysztof
>


