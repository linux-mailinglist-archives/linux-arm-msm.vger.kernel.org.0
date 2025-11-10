Return-Path: <linux-arm-msm+bounces-80986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFCAC463F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E51AA4EBE21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27FA30FF10;
	Mon, 10 Nov 2025 11:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wl8ZOr/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YEjQOrvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE2B30FC2C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773888; cv=none; b=mcFhb8hqyYWvAWcMzCKQ4RJZKHZaVtchCpvH5E9HAdlZIXrMAihgW+EbAeEk+V5ZRN53/dctS6VS0PWes2iNEJghO5GAOSpb8HuUiuO9YgrxtUPylY1gJYGUnYMc1HTu+gX17XPWU1dxeam+sJ1eh1MyEQNZeg9il+7la3K07xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773888; c=relaxed/simple;
	bh=byzn9X/Erm5QdHiKKyfOLLghcHfQJrzA0yjBbWl3hBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=akjD5ouFnTHlolBef5/Vxj90T9w3P96Nc//xsorOBJqwcMI37EmqnnyEKUuicJr1abY4GrJ+SMNE/ZGvXlHzLQdssJnwOt8MH6hzFuzaaFEZraWMIP6wCBqO87ktm0BshWk+k6t2ypobiAWjZI68VgPfIsPaMjyQ5XJOyQHmJks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wl8ZOr/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEjQOrvm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAAwbpA2547013
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xFffn2en8LIBlqy60K9ezlTkm5f8sOjvCa40OlkxPdU=; b=Wl8ZOr/BdtzHDaX5
	/sTTA+kLfJYAa9NradnGjXaR6+fb8DjeCQrlMALloQEjiMkWRJ4tCwJuMHrJ7Iq2
	n9er1ovp46KGxh96ot/mYvq8O17gDRxdmvmT2hqwHSogovYNk+612L0BOcBp7tfb
	XeN49Mc/K5sOHYyZg/t3fxckLxIZhOI84Q7w43SGSmujveIFIezO1TkdLQEaHNAF
	yzCtbdlfp3Zw/a8LpEqyEtWEGDY7xecriCsamStbTbn6vq2fnof8TFyL5HKwcPJa
	IxfaQyShAAjs17JxlMfNexp6kmZ+ufVMhQut9nWPhJdDJOG4ikLWgqvbrFK5zKW7
	iatjyQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab8ea98nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:24:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed83a05863so10624191cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762773885; x=1763378685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xFffn2en8LIBlqy60K9ezlTkm5f8sOjvCa40OlkxPdU=;
        b=YEjQOrvmyiThORsSYUodYehgY2S0e1kNOUI4+/p/jmNip/Xvu+OlRt5VJEgpy+FtoZ
         kXmOKocLir9o7YV5jRWhLl3vd57+bxflgm5Jv9h4uXkB/W2bSvCKEbuVdvtLUwBkVZWk
         RfwWYndoQdMpE9W+ZmkVAz/3Gf1I4yVoZRXwXoUx9cwazAMuZblGxJveIHOecWGuvtAT
         Sf06qpoTiekhSoogwSkIEtsEJXHCU29Dg+GKRiAYdVm/lo0kTKd7i6118PoU5KE7WBCe
         wAnYnbwda0hjudDzCORnf+NYLFmdFNlvBMEW+I35AqGq0orxOwcQS1dNun6ivpw+KNfA
         xvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762773885; x=1763378685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFffn2en8LIBlqy60K9ezlTkm5f8sOjvCa40OlkxPdU=;
        b=p8Azyf9BERDW3zIhL148yzO5fNlNXGoXjL7rMs8TdEdFvO6WzFucKf/vBMRobdgRvb
         iROjjgzilrukJHpMWJMgPlTEbbNdl9pmsbnkImKQTXNCCVAHROsLcsv4YfFQ5Fp/gCUj
         su0M28QemeyBNFzCsDKueHHUZPlNFVY9eAQZ7y/vl5BvmUHyokWrlWE6hgdX28ferWDG
         JFU17Xygt/O2LE8x/r9iWj15NErK4whcolHcMXSEEi9g1dh1ScKqBqzz2bx9CEn4dQ9S
         RvuCQ4Z86qoewvQIPH5jy6dPTVmsj49Y2HK1ryT/kvD4w+QeGKCt8A1jCaQnt9ACYuTN
         0cow==
X-Gm-Message-State: AOJu0Yxu2EjNCu02USiHKGwfCxL8lszlvgVzZEGthpEwu+FsksC3s7F3
	k111tz/bnq4ofCWJ6Y2+537ZVcZbYyyCykkzizo4Co11/BzxON4K35zfWiLBNfp9iPgf0AMcV2Z
	JytkMkcznRx7N7QORBinZAHR/T/5A4xhiJ6mIaa71TMk1XlI5trNKMx4rCFpmJV75GImAd2DkVZ
	dN
X-Gm-Gg: ASbGnct2LvE7Wd4gCGrfrvaA3O1qxb5ASwP8bSrJ3qk7ELHe468Vk29mskOMtO6r5LD
	DOs9Jy8unyp1FfcPnCFwno1LKnfRzfLGyOd4AlXia/VAUqdIss/Dbdvk+scP2XbZbN0MZty0mK1
	HmvUDzZUTMgn3sQ0MGTe264AMNiHEKNsadyn7Kv4kQD87C1lW5tnNtGIBinJp3IwhWrT7w+FRvZ
	3iFkZotHyHBPuvL0O83yJBf9clLaYy+vlH2Vet2kFTHGjLV0v5977mPU9gSngTANZx9PcwRTq9N
	XLkslM2CzDgi/O0ZQlnTTC8uGXoSKGlKIH5E5uu+FuZnQvePvVUmQUjV9zsCB6zrkupemmqf3v3
	45SQbnZ6qZRGW5LMUQCusBNnix9dfKIxQ3UkISOiOvMpgI2FwQalYiAOH
X-Received: by 2002:ac8:58d4:0:b0:4ed:67c4:b7b9 with SMTP id d75a77b69052e-4eda4e9f4c5mr64158421cf.1.1762773884934;
        Mon, 10 Nov 2025 03:24:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRNx1skosrpDnJDbABdAT3OyOCJ7HmNfZ3gKfC3+oNLtV19GE2GTRJ9VnutOwFLB5/ZfI6nA==
X-Received: by 2002:ac8:58d4:0:b0:4ed:67c4:b7b9 with SMTP id d75a77b69052e-4eda4e9f4c5mr64158241cf.1.1762773884480;
        Mon, 10 Nov 2025 03:24:44 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bd72bsm1066649466b.49.2025.11.10.03.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:24:44 -0800 (PST)
Message-ID: <0e4ee0c2-26ec-4024-873a-43db236a94c6@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 12:24:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on
 SPI11
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v1-1-8ba83b58fca7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v1-1-8ba83b58fca7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ItIe7FAgwq-NQgS37kIdrXpiDDh0HG0g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5OSBTYWx0ZWRfX1zjrd6pJ5i0F
 p12kKY7/FDPPsney3C4lBL0G6onIZeRxsU7vx0iKYJwyA7uA8MHX7fZ5PxW2iK7OZubwciNw077
 DnlHyKX8CKu+Lybzcm1pVi74ygXasSOEmIL0sVoAe50mbWIAWv4rCYORd+BXpy2n8ggSavnkkrB
 hcZtSPF8b/GPkEm6TDkcYJfNTNlXLgi+LXJiQ2pUdly12BDh7LUb1AZEdYF+g7mRfYaCqrUJEVU
 SoBsdnYC2O32TGg4fGQ5ireO/vGsaKXNW/otDAH7pi48wLwnaKIYrTWQrXM3rc1EkE2YOKxX92Q
 w3hePyPx0prUIZgW047dJcM7YCk3jZrOtjKgJFFPad4xPXj/OeTyHt7hVDQb8VjwAZwZg9IBmoD
 cKceTBr+CS/l59AdM9UhiQNPwACPsA==
X-Proofpoint-ORIG-GUID: ItIe7FAgwq-NQgS37kIdrXpiDDh0HG0g
X-Authority-Analysis: v=2.4 cv=QLxlhwLL c=1 sm=1 tr=0 ts=6911cb7d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pkoaJ9_ZSZekED1SlcUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100099

On 11/7/25 3:32 PM, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI11 on the Hamoa IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---
> Testing:
> - TPM detected via tpm_tis_spi
> - Verified functionality using tpm2-tools (e.g. tpm2_getrandom, tpm2_rsadecrypt)
> 
> Thanks for reviewing.
> ---

Depends on <20251106102448.3585332-1-xueyao.an@oss.qualcomm.com>
which you should generally mention in the under-"---" section or
a cover letter if one exists

Sorry for not thinking about this earlier, but generally you want
to send such cross-dependent changes as a single series

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

