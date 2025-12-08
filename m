Return-Path: <linux-arm-msm+bounces-84690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED00FCADAFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 17:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B260130865F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 16:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DFA3161A5;
	Mon,  8 Dec 2025 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QuGYpO3s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cldhIJDR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E40331619B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765209415; cv=none; b=ioGkCAlLfJywoYnzrt+IWkJm6oecJCsJgdUWe+I6ZjOBqnAr5jVUGIiWL90xgNKl1iWrVFwhUvZGjkc3pbJ1Ba51M9zbbgfH9fpGvsvJGRyTKaq9CL5QNJRYiuoH8koV+x0HcM5jAm6+YNBCnFp9r9026ig12VJCK+tfOP3wpP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765209415; c=relaxed/simple;
	bh=B3ewkttHlUBU+PVS64xoM5O/gdT+zFTJecZrW6+HjH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oajz40zXwu8Y/FXr9mBMBjSKJtMDQso9/IANoTN3/5EJHWvJ4ALL8APutQTYLJ1NDV1f9XkdsE348dK7bVQDMZPkv09CwZcWbky1EMWtcWV9vMTKh7H/AV35/Pw2RFRGfV9pLQkaKKFeGjZsfpmaRbjBXbJYT8wE0ZTcjugh/8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QuGYpO3s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cldhIJDR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8ChZKn850713
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 15:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmNVqKn1yKV+cg/ifGZvWwc5eUpensOq3hRgfoublXM=; b=QuGYpO3ssDKxKemx
	QdxitZxHqNdHxMLsM7OVBURhdDKboFx17BG/ukgqIv3zLxo9PFjpItYS1MEvSp35
	tK+y+jUKubvQRu8TxJioHL3uSxZ8v8qpHOBGrPVApRqMNQAC6fAUzhvx01v5uR+Z
	YaJ3kvo1Vv2kSyITHC0CI4u2Q6A766DxaElkRO4s08/oqlpjr7DVJJCAq6Kb//k1
	rKO8iZ+uAalYPURo24ks+07sdi9GMRK/mjDabdXntt76znV8aut6bGGv1SLmMJE+
	7iwSgWa22TfjkJcwJTlfxz7TqrI9hryWNhHtTZtU03GqoPFl1D+dlyydvzstuHrD
	Pl8chw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awxxc0j3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 15:56:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee05927183so5033741cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 07:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765209412; x=1765814212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmNVqKn1yKV+cg/ifGZvWwc5eUpensOq3hRgfoublXM=;
        b=cldhIJDR9Ef1IvlgPv3zAiXGDV7gJsMAc568QDpkoeTukAEEtCFzy51CKl6wpv7pYT
         6UXgzW/WHsC8sguQXFZoIzwWqkst+K7+gkZfEdCOPYGK9oz4Bfj4jX/fu+Ez+JkSXTeh
         R1SKpy9YRB8RzZsNThStwVPUBSIUE349fNGip6Nl9SDrEPDhS8PaXjwAPtnEG+ZSYKHK
         3TyJ+wV6BNebMj+3p0x6/oc4XQE2ZbgUutvGEX0awET6onN67a9yfhFkDW9nscr1pglY
         HyS+R2NRqQ8M/USjzGVdEoEaPtzxCjHkmM7tcV0x1tYbnI7gVov3SrVA9RXd9lqHJ7f/
         jA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765209412; x=1765814212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmNVqKn1yKV+cg/ifGZvWwc5eUpensOq3hRgfoublXM=;
        b=IWLa2ONZPaKZuLoufcfWi1Pk73deD9wLbaxMLKTIDLZC6fYntNGvndARCo+hMZzCFN
         sEmCnFDvk8vTnVh4rD5RX359IWbbI0t2jWNfRTqlmxfHFEJHcJYmBswImi1EzDjLJSPx
         QU7zPrNScOqJZ6lKMWfjHqbUnYbZjdcqnqPnsQJ1p7A9kzGwOOPiRr9s55UY2x3z6hmT
         8r7TblKUkSWsKcWcQJEndUDfNCOeY/H7AA+UAa2qKyOmRT2o/o2aJHOYlFfil1zjHKzV
         5g5KD7a2NOBilUpnWD48TUbYgdHwqnV4gZyfOA4fDri8g8255MnNeoUj/9YfL/BgQ9GN
         G4XA==
X-Gm-Message-State: AOJu0YxRZX28QoFDzNZleMZeXgBkmkhaEChq1wEdINzS2+kbyzF675Ym
	tgvpFQBYf2YDA8adHy1vuR6p1GWJzA4vjTcQYlxpvaWaQDO+PwerbOFBWMaQKd8B+4RWr4OkVvM
	LjMoUlxAPi3viK41TcT9YsbwFCuQZPzeGDJEkqq5lE0yZM0+Q4D//Rqfmy32fBYpMn/OK
X-Gm-Gg: ASbGncvCeuOgCxoCvbGva9vWSMo1pSAL6cNWu0lECKKIv8PgZstdYzHkVN/GHRssK1U
	60FolZ+aV0OgyDwtqd0CINhHDSp5PW01iBWjKKV4uI1eECcORTpoCnLlCiQbMEclBqmTWftPIRE
	mQ6zb4CvyYISjsFQU+8u6Vg3sWyiQnYjuhPsL7Dkpur8elSIELNp/1Vc/p3LdIoFgXaNtoltz9M
	TWVPLS/i3yp7LdTQX/co2xRDCOL++525nTOFF1K2mdNyABwMUhkvpZKajdgrZGzmquH/PUh+GuB
	OR7wBjPLpKJrB0mJw7IJa2uIDD14Lngo3bfFiUcZBtcndEgGC5yFOag4kBVEkOdhEGlEhxgodW3
	T/ckHb9dMAdADnScnzwXvDCImsih/godYpJTUMS99Qk21O9Xm+rfq2MJ9nufouLm9vA==
X-Received: by 2002:a05:622a:188a:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4f03fea6010mr85159541cf.6.1765209412571;
        Mon, 08 Dec 2025 07:56:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/MhiREKtDNGvh9NmEtfBer4t1W4ElwFVJmK2dUCg/qDDPq12BZEpCpvof8t9/DxZAthncVA==
X-Received: by 2002:a05:622a:188a:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4f03fea6010mr85159131cf.6.1765209412012;
        Mon, 08 Dec 2025 07:56:52 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f44595ecsm1142187366b.2.2025.12.08.07.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 07:56:51 -0800 (PST)
Message-ID: <2cf32f08-99e9-48c2-ad0f-2e579d50f7a9@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 16:56:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e80100: Add crypto engine
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>
References: <20251208-crypto_dt_node_x1e80100-v4-1-f5d03bb2c501@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251208-crypto_dt_node_x1e80100-v4-1-f5d03bb2c501@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tX9dap28ON90ZnY5z624q4EI6FvmFKpb
X-Proofpoint-ORIG-GUID: tX9dap28ON90ZnY5z624q4EI6FvmFKpb
X-Authority-Analysis: v=2.4 cv=AKf9OaRj c=1 sm=1 tr=0 ts=6936f545 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=9v3PK4M2jcTnJOkuZv0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEzNSBTYWx0ZWRfX/5F2iPcB5kpe
 XiJHV1dvWXCZ5Al+a2lHiQxssZuQW9avF5lVHEFz00mVIpcjz1l0z+HuO4djrDX5OoSgLVDXTeL
 uu5ssXPqfoaQ2ZJ+4olr26gYrscOqklbWGYt25Zq6M0vZF8XYBldD+N4vgIeQ2ZxrgjHt06+e/9
 1UlYZROIzvFPq18i7ZfUl7tkX3sUBYt3mABqbkYrEYfIvmIvfqISrQL43qvdBAO/keWBpHIXHoX
 EFlMViTyOKo+iweSg9HMrTVcBWFBMK0+FdgoC1GP3ECF62xhmep9Y69yVpOa5moil8lJ/ch5O+O
 9BynoIQ78wifqmEvZk2UyA4iXyJA+e22DkToa/zF6MV1IJ8Lt3+Qj1F/53r4xRqhJne4H4qDvFv
 guz/hlNHFqXD/A5ZNC+KmoEQzmFDeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080135

On 12/8/25 1:32 PM, Harshal Dev wrote:
> On X Elite, there is a crypto engine IP block similar to ones found on
> SM8x50 platforms.
> 
> Describe the crypto engine and its BAM.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
> The dt-binding schema update for the x1e80100 compatible is here
> (already merged):
>     
> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
> ---


> +		cryptobam: dma-controller@1dc4000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			iommus = <&apps_smmu 0x480 0x0>,
> +				 <&apps_smmu 0x481 0x0>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			num-channels = <20>;
> +			qcom,num-ees = <4>;
> +		};
> +
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx",
> +				    "tx";
> +			iommus = <&apps_smmu 0x480 0x0>,
> +				 <&apps_smmu 0x481 0x0>;
> +			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "memory";
> +		};
> +
>  		cnoc_main: interconnect@1500000 {

Right as I hit enter for the rb message, I noticed the nodes you're
adding are not sorted - please sort them wrt the unit address (@foo)
and retain my tag then

Konrad

