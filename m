Return-Path: <linux-arm-msm+bounces-47459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B274CA2F603
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 18:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3521B3A54CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 17:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E6F255E5B;
	Mon, 10 Feb 2025 17:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EW8jg51k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C8825B68B
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 17:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210119; cv=none; b=nr3j7R1oUJgA7j8u3nM6Z0n2CJ0Ijmh86nynvUTFPyuykRLtnMBNOj3eyHK5mBFRdALY6KHvGuXbFfPOXfrco8Q6gZsO4n2fxZFp7EtMhI1drMMbYeqdlcPcD51tjK2mKMWoKq2WiX0yOFowJbjkj03JuQvd1QFBJaummMYduOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210119; c=relaxed/simple;
	bh=Xtuj3LhBpTfDYY7N35r6nKZxVkwtKPfhFYvYKZx69zU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jkCBnR2x1lahnIzWJP+UmXPnWPgiolUPCrSBMqRn8NltYowOxCJDg7Xs/savkfLdMoyKGrDsk2Ia4oRkzHNY5Hz5jhyMX1Oby3zaWiKKTjAyate1bLEei9VskJVWZD44arsOkaxgdzWKKZmBIG0Etn8XWnyOK0pbp91qYZMbzOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EW8jg51k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ABgA1D031880
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 17:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwmP+K49vLFoWTm1+BQsLhgb4jcUsR7Wv1P0YiFY6zM=; b=EW8jg51kZCQm/06f
	g2LBdx7NdR7L7OV1GKmHFyEag4o2a0uTgf4ctuAWkB47fMZEtA9kJI/4iI9aRy28
	fiX45OqVlyeDrMWjGWtc43Z8u8+NxQddZ0iFWHoR1eV1POutocxhPg6Mg1/CpXYf
	HG1i8FtCaNhNG+KC8OROw3p7hxCC+Tc2BWtET/eHjXN/0y8G3R57xzDRuVD+ZAws
	ppvne2fkf+nitpFVGmQCePEs1oU5gWWOYy6uGBqPRRteh1M4hvE+WZ/E4/hkTZhf
	WdpOUudWlj4vGmU/qIh2/6N8HSytIBzaFDLLE2G3M/9yVX4fSNuLPtwzVxtJv9VB
	j/1TVg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk0yxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 17:55:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e456cecdddso1310516d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 09:55:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210115; x=1739814915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwmP+K49vLFoWTm1+BQsLhgb4jcUsR7Wv1P0YiFY6zM=;
        b=cqrUV1zFSjJ3rZOimnFQytS8x2DCaEt8IBmPflu45oovenfRf7KYbncs/u8O0rNMOb
         96aVYxO5aCf0eg7RNVUo3s6VkbiBM7YUptCxiqmgO4IVwGuIRQBiuN78oIQbT+MaAxZS
         LWKk/i3LDvW7Qvu0Ttt+DDaOZ8Pno2YScyBtcStZ5SKCcnFoWEYBdzpHDF1+i6g5+GC4
         EypS14PRAmAgLWUsT/jZZOcAczisELlfynBg2tMKG1v5lGyKU4p5cVNGWN8NvGm6uoex
         iq2Cv3WbwW2PPKJ/shxqqWyPD9Nwn3eYiMLcJ4Jlvfts/BTlp84sxD/FF6NoYfDesr1n
         v4kg==
X-Forwarded-Encrypted: i=1; AJvYcCXh4TBhS3WJvbGls/UZRkuYK849QqW5tLR1a01l6jdC2jwFBIs1PNk4VW3YMWANxOyYzc5N+8gpXLeaFiOd@vger.kernel.org
X-Gm-Message-State: AOJu0YyiBDqYnMj7fDi4YWdbccD0I4sdoIh/yz1+FuCpYfZPcs2m42Am
	x7Yuv/tirDmQosokbAEZvNQgCfnpub+mj7Vavatxgnn3gWkzj7bKPlySs8yroV5CGGlxXPrTYLC
	29y6lv2NpjVgIa5Q5iggR5Q1cuh5uA8BOLInfCnay10C2rIxy8rj+gsCw9o8Kf9h9
X-Gm-Gg: ASbGncv4MplgZXM5meUT/iGzjCaM1yM8G6Pc4DQtwXrZSnZegCLAPrC7Atq3hy4DPlR
	t0NetyfRnaLWxFM6EWTcp4g/gmxdUG2OskUg9DZfDwVTAxzmXFnZtq3ogdIwk3mwPNER5pgSeSB
	EjdGAwp+Zn6lBveSIizsoYje4KdjK4Z1sjL1mNDUBg8ARCKXo9ZDsYqHVfxkTRQVT0gZSsiL8nP
	LYhtOdLy5kkCBNSvFknGDe43dPim2YVlncuUKT8LwshYkyQLwSupcaJCSk0kc5A2e24P2rq4Go3
	UgIjCehgDAJunTouEmjUjoY9ur039ACS1KBtsJRzDPsCi1NZ5hcUfLT2DgU=
X-Received: by 2002:a05:6214:57c1:b0:6e4:45ab:4de8 with SMTP id 6a1803df08f44-6e445ab4e5amr71563636d6.6.1739210115227;
        Mon, 10 Feb 2025 09:55:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcQI77AtK3XAfbwGcc1HufxPK/2pOXxHvbUx2968NuCHJKTTrF1581V6eIEUMTwI2i68TdlQ==
X-Received: by 2002:a05:6214:57c1:b0:6e4:45ab:4de8 with SMTP id 6a1803df08f44-6e445ab4e5amr71563496d6.6.1739210114868;
        Mon, 10 Feb 2025 09:55:14 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b12d5f49sm415599866b.73.2025.02.10.09.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 09:55:14 -0800 (PST)
Message-ID: <8d23002b-64af-47a8-8b41-e533e3c13223@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 18:55:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add 'global' IRQ for PCIe
 controllers
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org
References: <20250209153940.3489-1-manivannan.sadhasivam@linaro.org>
 <173920411963.477096.6458317590653327676.robh@kernel.org>
 <20250210165802.tbvzx4qjygzdsk2f@thinkpad>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210165802.tbvzx4qjygzdsk2f@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7nrp9uldWthKvcBdpSGg7hnKCL13TFPe
X-Proofpoint-ORIG-GUID: 7nrp9uldWthKvcBdpSGg7hnKCL13TFPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=813 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100146

On 10.02.2025 5:58 PM, Manivannan Sadhasivam wrote:
> On Mon, Feb 10, 2025 at 10:22:43AM -0600, Rob Herring (Arm) wrote:
>>
>> On Sun, 09 Feb 2025 21:09:40 +0530, Manivannan Sadhasivam wrote:
>>> 'global' IRQ is used to receive vendor specific events from the PCIe
>>> controller.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 10 ++++++----
>>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>
>>
>> My bot found new DTB warnings on the .dts files added or changed in this
>> series.
>>
> 
> Ah. I didn't run dtbs check. Please ignore this one, I'll post along with
> bindings change.

I'd be grateful if you turned interrupt-names into a vertical list in the
next resend

Konrad

