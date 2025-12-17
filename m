Return-Path: <linux-arm-msm+bounces-85471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 40991CC739C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2F4F3019C57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA88733F38F;
	Wed, 17 Dec 2025 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUi7fpOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POKIeMiP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC433563C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967438; cv=none; b=kZpP19vjggy8Wh41IPOM4C9bc62h9oB03B3bqnvu6voMdgsI8nObZxAtT/O5eMpubL/WjhDWO9SAmjZFMKImfHUSBTur1g/+JgVqrUSWKVsGRNhQD+pQhlRBi9IjzyAZkiItz7+mxWObbX7dS0RApOqqMIvtvg4IIGnuuiOF9us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967438; c=relaxed/simple;
	bh=xnApGztY4VzE03KfVeNkQMGdXBk7CDgYf3T95fZJfiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wz7dopVCbcKm+A6AOFxblcGqEI3fh2KQl+7tiZk8nq7YQ0TUri/TFLMH+vWrjN9NDMksi03RoCuBdY+Lp9aGK/59XFm/gzgf9bcbg5V0z8Z7dbeCkIAsgIi1VIQ4JAltEwAOYB161fmT6UHtdjG8n5eMrB3pFPNmXnoVNv0scvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUi7fpOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POKIeMiP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAGwsw1591248
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XucAUpMLVF1OiLuwWX8dsfxjWqzHX7ufTd+6SkOaVkU=; b=PUi7fpOfMhkbQS3a
	AbLI4s4stlkUYZaSf9x7Sk4MrHpiaohnANRYdUE0eDe+CS/QJ8WwrPcjNrswC64Z
	1jWq88AK88KyBMLfhf+TVo+JVJnSus2DcVky+qV+g26H4KJzGavS3V1NniulTK3e
	UfxJihSlL9uRdKl368wnV8ygkED3H8t93qPn9tzygZACUTjmBivxMmudMAObzl0s
	U/6TZOItn4ZcfSMT+9zaRu1wI499c/v5jjk8M/jOEARppH7rj7HQv2m/NxBclLOD
	QHQR5Ldja1COHn1ITH9A4+2usRxm7t6zjCx0RPECPH27FDanDLFWUKL+RGf8Z2pn
	/QZR5A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefj24k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:30:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1e17aa706so17222441cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765967435; x=1766572235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XucAUpMLVF1OiLuwWX8dsfxjWqzHX7ufTd+6SkOaVkU=;
        b=POKIeMiPV8Vf/9NPV7dLYIj4pdcbmsAnHjkdf5ZE76pjrBBMyJGfRuUdXH8pN2BFA9
         5fy2+5jsU+4Pr00Jq3dmlQm6hl8LEU/2eE5ttfXm/lm+SHNuJ7fNz4ZwPkpeckorVV54
         mjLvUYZbWXWniUxyHpuKEuasG/mW6YVpAx5g2We7tqYoqYH+vmmbFwBnEXvgfxKv+508
         Hwi4Jzq0EcGbUGvI/htqyk2ofv0+a3xtqN+QQvsmkYGvbR+IceosuE5+ZEkuqxh7YLLR
         sEVoc4APl/KlukIRGHAuoTa68EUGtApU/L0EfznLHFpFA3XcCkwHlYgx+ikiUvx0CcdR
         xEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765967435; x=1766572235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XucAUpMLVF1OiLuwWX8dsfxjWqzHX7ufTd+6SkOaVkU=;
        b=Ny5saHrpo99zJthAdxw1L+KuE7wmiLqk2R8iXdKQyOJ63Vy4BDGr+aDGKqO5Bb/fx0
         f2flyM0zbQHzoiEnEKTAEUm7ckE453lx75DnQmxIVMTzqnFo4KvlOdH2ekpDdB4jdUwu
         Mk2J8pR1iaQn4vlmxf5CjUdFWoopVmgdkNktPVdtzYo+GBYTL+1SwGQrjVHgdxek2yEE
         /IWEUZ9qOAzKvn45ucShWWcCgClKw2PsxXl+k5bZ2rwrMutaRdCyPtY12eAFWNlA8qTG
         h7jlBMi2ZBNnZex0onLqE3T6xpjAuA637QHmjPcbkarSRYwndkEZHJIDAAjxj3vN5QNI
         ZQHw==
X-Gm-Message-State: AOJu0YxNAnwr7Ntt2nAJA/AgQ4q1gUSwMJx1M/TLaeUEPVi0MmXRcQL2
	ujzIZiyxuPBHh90KXMTxFa+AOs4iO/r1Ee9EEynTF7XKRdZHiFC/BDXgjTDXNJPMz22Yf9T2owN
	bYqUc5MOggajbZBX5FwmehHF0XKER/0/YNfU/0+E1y79RTjiPAZo6ilMDJo7Pofe7krtP
X-Gm-Gg: AY/fxX4ZQ1hV2m52lao2eUp3LGvGaz4Dpn+nq9HHdcQZJQkSU5BdsbsXeAAle8tTj4E
	LPEMIOn0EwDJTRkiQbe5gQ9Vva+nQ7io/eJ5AtGTpiJr4QpqZs/NHpgDcVXQou4CQYvc9iThsg1
	YT2+yo8cWUJu5woTN2haz1d8AR8WwLoCG9o9MR4LcXRRyhhUYu4KN5eYFA1VFpMKE4lKK1YiEWO
	nJQo06rCDJ6bx5X2/5yEHVuR/jFnDNUHqmb8JyswjJOK30S5abJ2q8QBmqopvY0WiLtpedPlobw
	tIboLSgvCkln10YxwtIez3tpN7GdpSWQjpt7VFqJ56qgOtrfTxcycGRIKih8ryFErl059TdBsnQ
	ZmFkpTmZJjb65B5NLNjh1KXDSerUN1/QVS1hm6WP5nK0n747o+k0/QAWSmVXpg7am7g==
X-Received: by 2002:ac8:5e09:0:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4f1d06772cemr180421681cf.9.1765967434947;
        Wed, 17 Dec 2025 02:30:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTbwO53ucpQ58I9B0cqpVXakTfZzbcNFCFzaHh34IQ4boXaHYcm3+nvD8+c4Onz9BhQueGTA==
X-Received: by 2002:ac8:5e09:0:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4f1d06772cemr180421311cf.9.1765967434458;
        Wed, 17 Dec 2025 02:30:34 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51b859sm1938398366b.43.2025.12.17.02.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:30:33 -0800 (PST)
Message-ID: <680d3b17-7983-4522-89b9-13ad67f4bfe4@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 11:30:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: qcom_smd: change MP5496 supply names
To: Gabor Juhos <j4g8y7@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216-qcom_smd-mp5496-supply-fix-v1-1-f9b5e70536de@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251216-qcom_smd-mp5496-supply-fix-v1-1-f9b5e70536de@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4MyBTYWx0ZWRfXwwiSJrlyVx1q
 D7bal2UMWhHC1l26wAlPE4aqq7P6Bt3M4xp7+M631B+3RyHJ+faOpAafGB6q6QpnH2QIfleg9HS
 3WlrE0HUligvnfYn0Y8uPpMy6B8ZDc67NFeKKfnjDBcd9bjgh3DwMXbXtppPdr9QV4Vhf5Ej1tH
 TRn5MDzpVXU4ta897nMS4js8vXJAhB0uM8VKmaw/iJGjhe8JMBlrqS/uRJSo8f1BZ6XUkb1FS4w
 sIlJ6+ZB3zLe9ULHTWLQCcJkMXubvI5NOiggH3LuM1FhafY6VgKDoqIyoxQ9+3xJunVAIv0uSis
 lwx5pWdrepOzVYzXsVa4d7O3G596K/F3UgmZC1SgMYcyKr0fqnY139zkqVvmbJaYj/ilTRkPbha
 PdOKvtosY0j6qmdbqc1HYMgegtDyxQ==
X-Proofpoint-ORIG-GUID: g2fXsXQn3Y2-sKZPUfX7QTcuzbh6lqru
X-Proofpoint-GUID: g2fXsXQn3Y2-sKZPUfX7QTcuzbh6lqru
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=6942864b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=4KVRF7KopP9KPnTJK18A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170083

On 12/16/25 7:38 PM, Gabor Juhos wrote:
> In case of the MP5496 regulators, the driver uses the same name both for
> the regulator and for its supply. Due to this, in some cases the supply
> gets resolved to the regulator itself, and the regulator core code throwns
> an error message.
> 
> For example, booting the kernel with the 'ipq9574-rdp433' device tree,
> results in the following message in the log:
> 
>   [    1.710392] qcom_rpm_smd_regulator remoteproc:glink-edge:rpm-requests:regulators: Supply for s1 (s1) resolved to itself
> 
> Additionally, the driver uses different supply names for the 's2' and for
> the 'l2' regulators which is incorrect. Here is the supply map based on the
> datasheet of the MP5496:
> 
>   VIN1 -> Buck1
>   VIN2 -> Buck2, LDO2, LDO3
>   VIN3 -> Buck3
>   VIN4 -> Buck4
>   VIN5 -> LDO4, LDO5

One thing this reveals is that there's an LDO3 and an LDO4 which
we don't describe today.. are they managed as power-domains, or
are there other other reasons?

Konrad

