Return-Path: <linux-arm-msm+bounces-35922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D329B0A36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 18:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E01E28548F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 16:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7472003B4;
	Fri, 25 Oct 2024 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQUrxVW0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9ED1FF04A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 16:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729874712; cv=none; b=YK+GRIsqZ+0YIpxqsJGa6ecef1NA1bwasasikkQtkwpvndCHw5nRt8DEP5x6wKkOpGFHwuMwJ3HZ4e/uh8KatW2kYjFtUgJVjbn3zhst+H7UBwJTXzDPF9sD0DuGr8ie5jDB+9Cw/RlbA5VuMsUnfZbq9ucwS5I4gk2zDUhQMyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729874712; c=relaxed/simple;
	bh=y3jGx75Ma9tFzNhHFJU7+LtkeYM9g8+ty0cMjukmOs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l9iXGLWiL/OXH9dnJELkRs4KP4H/HYW0UY4Cn4Qqa8hIIQPTQL/ICKkAPFZj1E94YpX0+HTpcfWCy454hSF8v3wCESnYu80NN8/WQMKLlXy6qt9jPIlmP+LXfBqAV2//pnXDrvYH1xPySS7LO+e9P9VBG8RpO4788/edUBPNJqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQUrxVW0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PDA2uD028667
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 16:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jAZOsXr5fsDPQXW9p3QRY4SAZjYiB+yQ1LfwNbC6aOA=; b=JQUrxVW0z4d/cgp+
	fOxhZqUD+VuPzFdrgo6rmi2XA2oZnsnoHkXEguuovDI8Sf5ojJb9j+dKhWj1Ae2U
	tZHzXgOg9fJZ1qkTPf/6XABnQ3jTkEQNst5AqnQXUYobagsYrK/FZXFP7sll6fpo
	+VeailN5PvK5fZHrQz2RUTUn0QOH0vwKsPLVpr8JQVNlkClNplok5Qy1tqTeE/d+
	IX+I2SzkOcI1NcK31B4C7BX9NcXrl1itdJBMtODZ/vOd2gakMdZGIfIZe6DXVPZW
	6d1DlsEGEzT+q9jpsW5oNk3PZC+yhuI0vDLhOyUFi4CzThAOM8q4NmRUM3ngmmrf
	pVOdcg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fdtxnpbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 16:45:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbf2a4afcfso3703016d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 09:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729874705; x=1730479505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAZOsXr5fsDPQXW9p3QRY4SAZjYiB+yQ1LfwNbC6aOA=;
        b=pkepiVAYLESkvbLjIyECM4oyKB9IjOnwOOm/YqYbHN8hmnWm+FU3YHMQEikp2cH44X
         OvB1I25F/EAXIE9IX6v8a/ZcHmjDGPx1sRFIBBxU1G/lZCUGUp4N4B3a0mbEZ3kRGRdQ
         kPmGtrvuydertYlFVs+KgP4IWKtmGQ3qR7tye36KgjhVmXYVSoLWX2hkmhK9zlmUE8rv
         3wLc3VVzblyHqo0QeQEkkMLLYGF+JtvttmrFs7kTLXmgGYEMjBbJinmlZJpMTRfS1KEl
         KQw+b7ZCe4VmyjxGiqDVpJ/oPlZnLeFn9ZxwiH/sfV3UjUDMR4NpKJWYwb4h2n1nkZwF
         Vqkw==
X-Forwarded-Encrypted: i=1; AJvYcCUPWLGjZ6SOZBQzCfsKiHr61r/7x4nNro5kE5VOJl9Bselw5VJEA55CdXa0owBA+X2cHqpkm4YUQRDY2/Di@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0YbwqHzOtuH5R+kIN+LGwYq1phXgHZ/zYoV6FstvjRPxCIArW
	5KiPTXHgD4wslNM9popTy5+X4poILy31VNlT9MbZAVaTV2WjQnY8bheho87BkUl4TNWGqoCfQTi
	tgvfNYb2fD6XDUe1BhnggimuK0vDTLjzP5j4fEPfdn9u4RoRfvld5FIRqLep5M/pb
X-Received: by 2002:a05:6214:202b:b0:6cb:e6b4:2d36 with SMTP id 6a1803df08f44-6d18584a5e9mr260046d6.7.1729874705014;
        Fri, 25 Oct 2024 09:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1sduBzfyy1TRRjvLCCS7rO3oxcnITvZektef5yIhCEjrG5D3MB0/QFdQf572p6gAAmalixA==
X-Received: by 2002:a05:6214:202b:b0:6cb:e6b4:2d36 with SMTP id 6a1803df08f44-6d18584a5e9mr259776d6.7.1729874704539;
        Fri, 25 Oct 2024 09:45:04 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1e75ff3bsm87945466b.1.2024.10.25.09.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 09:45:04 -0700 (PDT)
Message-ID: <8c9804f2-ef4d-412b-97ea-f521dfd35ec2@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 18:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qcs615: add the APPS SMMU node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Qingqing Zhou <quic_qqzhou@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robimarko@gmail.com, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
 <20241025030732.29743-5-quic_qqzhou@quicinc.com>
 <8a60b729-b312-4afc-835b-a18060ad3f03@oss.qualcomm.com>
 <zsphor7rpbwx4km6uxpepky2h7atbgjn2435puygmpssfc36mc@wkquqxud2yij>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zsphor7rpbwx4km6uxpepky2h7atbgjn2435puygmpssfc36mc@wkquqxud2yij>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sjB638aG-YDEseahS1etIxxN23MRCzad
X-Proofpoint-ORIG-GUID: sjB638aG-YDEseahS1etIxxN23MRCzad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=742
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250129

On 25.10.2024 1:06 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 25, 2024 at 10:54:24AM +0200, Konrad Dybcio wrote:
>> On 25.10.2024 5:07 AM, Qingqing Zhou wrote:
>>> Add the APPS SMMU node for QCS615 platform. Add the dma-ranges
>>> to limit DMA address range to 36bit width to align with system
>>> architecture.
>>>
>>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
>>> ---
>>
>> You probably also want to mark it `dma-coherent` (see e.g.
>> x1e80100.dtsi)
> 
> Is it? I don't think SM6150 had dma-coherent SMMU, at least it wasn't
> marked as such.

I don't think I have any documentation on this, so.. one way to find out!

Konrad

