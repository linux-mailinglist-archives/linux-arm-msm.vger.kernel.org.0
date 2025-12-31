Return-Path: <linux-arm-msm+bounces-87099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA75CEBE25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AC1A3029C74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4D1320A0B;
	Wed, 31 Dec 2025 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqDw7voi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WYnUqkVU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72BF31D36D
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 11:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767182146; cv=none; b=VX9X4GcPvVzOiJz0IvzVs5dc1RaJR4GmtTvsr2CDwsAAR4+033Oyvfmk/MQqXHquQAd7dirW6aClpmkGVhDtt7lquMyewzhNWN/SuhwdU7jvU9QJ3m3FAHloMZjQahjrI+edgPo6pWq1T04H02J93LcJZpK5FLHOxRlHNrPVNeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767182146; c=relaxed/simple;
	bh=26ZCebUf1Nu15xC7Mxv8B9cg4rTzsV8UwyCpMlmipM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y226NJYR1HsrSZ4po1xAWJEMkHBIVm6Lz7IFPvmvcG6F+TN4Gg7Jx/tp1hfA/GwqPsat7xXOWDy/3dUDFGayJA4zLq/SF9yjmSa7f/XASLrKCuIcy/gP9pUM5QQVjV7sKig2U8YUT+eIckLzfcvtRKTajm8W2Wkdoq9q/k1gmkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqDw7voi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WYnUqkVU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV4o6rr1429073
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 11:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mZtHDvv9a/Lx6wm1a7+DDrNkrtZyN0d2dr5ef8ynUaE=; b=dqDw7voieUyWUY1K
	cP+l7X811toMTHk3NGsD/p4B3Sj6KO03LpOFP3A+VE2n22PftpRUOM6Q6hBPTR3F
	VNI1k1oWs91qS+y5Tdmd0Q8ME55U2sHLKDYvOAWyvUVmvYpyPHo/fR+F5QT/Dx3n
	PTjbMv7q6d4jv4ndgNod3MdybK6aaTSYOjW8kgfHOhrafm2FSJFz1nJKhSjAfQBh
	GIsP+CWFMTGHm7gOibObuFV+Q9T9RgBucTm3EVcGG1X1d3hbcHl5kOuYizRbg1Bb
	E87miiS2F3nVYLFaLaFanwJv2p0NeeoTlxEVIG3ABRk7+1fHO/UBU7jBVA4V1aAu
	n5WK2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcw5e0pht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 11:55:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1e17aa706so62089401cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 03:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767182143; x=1767786943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZtHDvv9a/Lx6wm1a7+DDrNkrtZyN0d2dr5ef8ynUaE=;
        b=WYnUqkVUlIlqo39OD3ghwnrvbT2BJJqyL8d16HGTEbEY79PxB8HHeqA0wU0N/pKOj+
         N5G68rV1tc7uyi1yacM4N0c40kzRLPFXTwooTSO/pH8hnuCMmmtgXjuN3jkh/Z81nJgy
         Ts8JmiWzRXxJIC9XWaFcY2b1NvXwalxHR/H/8oRbPxsuwERlZ+NmgCJefGmywAoS94wF
         dJYmDQhah6Jb7NnGdjKJkbQCcg2+MqWvdngf75Z4lNQYG+qFchUZ08D4Pv866o+Fa46d
         Yhj/VhDI9lNdgIRWPNeKw0Ivx6S95rSSmcOICw2tsgoZ4W/mS9cqcyS+wd97aS+jS1Qc
         +A5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767182143; x=1767786943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZtHDvv9a/Lx6wm1a7+DDrNkrtZyN0d2dr5ef8ynUaE=;
        b=Cbl1fd7AZ5Sw9UptmxFKqpBalgE6Ru5nKdl7dKxBU33i8FYiSIOgjonnqvtam5vRUP
         QmEOCSO99+wGt8UVEr3nBrqCwDV2SqsHQknshgVRhFgG8PemZznuak2KPTm3G/rMQo7k
         WQsg4uWmG2Eut7cdwYn1e71g+rtgeij1O5b/X5u3qknrRiNxn8T6HT2L7PRaJIa6toAA
         KjmBMrqqEr3O1zqueDrHz00unRf1YJ5y9sj3/5LtJifuLz27zHiwVMFYkwMnQh5GrP0d
         QetoGPruhmakpbCt+KBbtcnL7r9ZRNxH8GaRHG54BQSoHc+JhO83hipzX2kAk9QLtX1j
         vcgw==
X-Gm-Message-State: AOJu0YzCIbYLJIk8FDS/qHJvZWAhUtVkZ836nTjgfXbwNzqtqQpKmBHq
	YhPhpraWthgcAMKy0DDfCdGY17NpH6FeppB2qRI6P/hgHMMa4Hm2Vi7FCQdna/a65w/oZDgqcku
	+NB/hKMMHk416AzycBgEjfmjIAZIbHscQ0MdWdsz0B/82538Ko6oMw77sIC+p+Ki9/pBb
X-Gm-Gg: AY/fxX7w8BvVD7J4L2Wg9TVMQeRpAOAbwn6Op6qrWF4TE+P6mD9Zh5VXH9/r/hyXd4t
	DK6G9XKU50CP6NQAkLQ7DFHASPSVSCJi+xq302G9fTYhezNR435gXAvWb2Rf9367sm5RrVzqNDT
	XIB22y0W5aH2LxJEYOw9zP2JdBUTahbVyZjwsrI32NEcaLD+0fDVmYkxIq09Te8qY/6kFiIP+Yg
	U99lrhDCGpgYhXekB+4evNLdSCz0Mz/HIY7pA+z+7jq+as4cCs90OB8iB0q2AELCA6kwx8Lu0sA
	XtWLg0J1Fr42RsCBmE0apMinDMKS4MMNhgVFWQgvuMh2N8FgiNDps06tmfRqgLWqvoyP6vVXnEc
	YKjQP/2xJI3zox7/zxb1iN0moO59Wa7qHkJYA/jMcgJZtA8ypJV3//8jwuYUcrr3d0w==
X-Received: by 2002:ac8:66c7:0:b0:4f4:b373:ebf with SMTP id d75a77b69052e-4f4b3730f72mr283982131cf.8.1767182142881;
        Wed, 31 Dec 2025 03:55:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOvZSDvJ5tWhebJaz+nD2zV9fr+3lvFxOjJPyUKgMXYAXQDj6ZhM1nsqD5NZ3p75eeUOyj/w==
X-Received: by 2002:ac8:66c7:0:b0:4f4:b373:ebf with SMTP id d75a77b69052e-4f4b3730f72mr283982021cf.8.1767182142516;
        Wed, 31 Dec 2025 03:55:42 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm37947767a12.12.2025.12.31.03.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 03:55:41 -0800 (PST)
Message-ID: <4e480e00-c112-4425-a5c3-bcae444846db@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 12:55:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] arm64: dts: qcom: hamoa: Add UFS nodes for
 x1e80100 SoC
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>, vkoul@kernel.org,
        neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, martin.petersen@oracle.com, andersson@kernel.org,
        konradybcio@kernel.org, taniya.das@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251231101951.1026163-4-pradeep.pragallapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231101951.1026163-4-pradeep.pragallapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNSBTYWx0ZWRfX1NRe2CY3tVae
 jqSWURVnItyk662wGHBghzajbXh6xJWizcZhODhzWzAth9zMXjxg5+ugYHeMHwdNg2hb4tAn1Pp
 Gm5D3udLIeyYIiciibHq4gA/RRwiZhOoRhnL9WxOSAJTUHHgyoY3PNismXwKFt5Upw1+rjRtTJY
 bPJihlfRwAAU1Kgyw18lh/tKnLKf+LrKFO2NRPg8Uzs1thLVHM+e3PCH+HdIha9Eal0MaVDNcyE
 EvmDwOy+yiZCFFHi7UBmgDxQJA0VgG3J5oFvaIlWyWKMMhHjDcPMbY4mNcj/kzex1nJXYESKi0F
 3JDfhnLHJGj0/btDgQrucFqwgA00j1hMQ5GLj+49ecBE36uGMgpzH1xIfcVO0aT+hD8M8qs/2rb
 l8HYXzg0df5QYw5jXajDGRIYEoN2g7El0p9JVr/xGeGlHOr+98mH9AVPmXQEWDR9lOjGqZqNpfU
 U2uShHoojI21EGCAWvw==
X-Proofpoint-GUID: NJUQhPTS2zBcXJm7NVn5jEbo9uszKt2-
X-Proofpoint-ORIG-GUID: NJUQhPTS2zBcXJm7NVn5jEbo9uszKt2-
X-Authority-Analysis: v=2.4 cv=Mdxhep/f c=1 sm=1 tr=0 ts=69550f40 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZKaqVTGohnnJfaf7M5wA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310105

On 12/31/25 11:19 AM, Pradeep P V K wrote:
> Add UFS host controller and PHY nodes for x1e80100 SoC.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

