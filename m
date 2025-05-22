Return-Path: <linux-arm-msm+bounces-59064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3031EAC0F68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87D29503530
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 15:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2239428C877;
	Thu, 22 May 2025 15:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVKgPZpF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3A335977
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926397; cv=none; b=GKorfE+qIfZ/pUYq14y1yHOk+DZdXQjzEOVZGzwIe/1r+2JjgHDLf5HWOax5y0S4EJ/F6svyFsyu/+OEcyW/77COQ0uAjFXq35LfFuhroGnt1W9DBDNHaJQFxWUFDut/u7Jl7biBMjeydiB7eCU8TWPMV99h/+HyfKWWHsB5Bw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926397; c=relaxed/simple;
	bh=mEO+SQ66q9f9bw9yAxTeWTvOGdYchecNjKdNFoT1k9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWe239irz78br0nq1gzmNhjRltnGMxtRA8/OAozQSOfJf+eOzoMx6DuwHc2dD5m9Sv5Vl5QNn7XYBYO3D9ZKkn/Vhx+ycnakCSVlpqtSTGdn0JBJvCD26AcABWGOcjRoZn+SG0OW0iVDofKMY6wHWQrGv4lX/OOhxheRJcsUbF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVKgPZpF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7V8xY016599
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 15:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2ZZQlG8j86gUKyQclX6XprA53hnoYhy4zTXw2h1Huk=; b=YVKgPZpFDoHcUBTW
	yUth7s0dP4bliKVMvq7S4C2lsJ/fh+dB1JR/Cnn4Z+cpr9HoPL+t3Hq1DIXKe24t
	EKbT+Pmn4gBq29RZ+ON/vLl/StcUqeAFp2sCFqy0R3nBohP1/A17z0yq7rmF9myG
	Uo2yvC3Jy1GmsSCENPVvI0eF/Amm0tll5Mv0zoubMA0Z29IIJISk8l0OnSEi5EI5
	1PN9DZwacvrFN5gAK3DsKP1h0Qx2iFMyi83YrdU/su1F5qaixZQz3HHYy+gV5jKj
	NMxUiRlToGQtl/iTto7kZrQk/+Zn1TXUYAxdlii6Ik8gg1HT6if21j4exlzQNso8
	xJCHzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9xrnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 15:06:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso221579785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 08:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926392; x=1748531192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2ZZQlG8j86gUKyQclX6XprA53hnoYhy4zTXw2h1Huk=;
        b=Z3bs8+RUrMIROicE56TLI6jFxnAHy8nEpvHzqe/XNKyfQBrr42/ASou5O5i1ERMIbH
         qBg/TVr/J4uhRwggnUyEVeCmgGTLPpEVd4WKiGCeBmrxivMNkV5wDlQUhtlsJPaZhk2k
         TU5mbXIYvpMrH72HQzem1n0lnH+mAyhnIK1ten1ROUNC0Wx36Szh8i8frYChqiQi4ZQ6
         +mFlLMY78eCp01AmZqSQlRnVD8Pey/C3Q+4EmPY9snGbCFBhdgSU0OSeRMgLhuq/OTiO
         V3Awn2/RjFA0o4NMaxNLx313zz9x7tFq4FC8JPK89XKnU4P40PgzbRQaU77nwNzC0BSw
         B2eA==
X-Gm-Message-State: AOJu0YzL9DWdX6rYYZA3wbpr5TnGSvqBhZflNjOpzLqdw+joiuCVp1ov
	7zwLnMuWAQqGbV4xUk9lYuUgNxOK3lgLQblmxywDtYc+YurVRdxyq6DuxKWTrALEdi7/g3T3L/t
	lNwqvrs3+tVrvtVhAD7TiTsBZ7tAkW0p2BEtKnRCENo6ryKs9+LMWM9c2V4u2gAc3wttE
X-Gm-Gg: ASbGncurKZX5IE1lBbkC88wt7H+7BRkXTQyYkdJY2Y6YNq8QHCv2s8YQyE2JIahS6h9
	/2UcdJt3FmolQ8fAFz74sOJdogc7yqhg+5gyHzeguZwYqk8wll4M2p6ezky3+BSkJppPJxP2Exz
	ShjQn2lqlznjZMiXr4WYcHWoQr1GtPRX2NGN+8HuizxBxJgPBg3Q31fmNuE+PG00jydxtdjCJXs
	kB5JVFjEOeEP8Ci6/+COXr18Q6gi9c5iJccO0IJAsYUeij0KIrXMTbNGXEN/iTicYcW9TW7+2Sf
	N5F8DdJXg5OD8sLqESXdtQHyBqEDs/ZY1CI4iZ/MJCQjE8B6Gx4yd4gRYkfX3UNh4A==
X-Received: by 2002:a05:620a:6406:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7cd467be344mr1502752685a.12.1747926392039;
        Thu, 22 May 2025 08:06:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSNzVT9npK6d+E8iUfm1J/u2+h3suqYhR++9LiAPyNlwVIEX5ZkOLp61BNj2fsTa3dIHMB0Q==
X-Received: by 2002:a05:620a:6406:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7cd467be344mr1502750085a.12.1747926391604;
        Thu, 22 May 2025 08:06:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06ded7sm1099929966b.61.2025.05.22.08.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:06:31 -0700 (PDT)
Message-ID: <757925b7-3795-409a-9419-b33767c49e2e@oss.qualcomm.com>
Date: Thu, 22 May 2025 17:06:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: fix a crash issue caused by
 infinite loop for Coresight
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose
 <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250522005016.2148-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522005016.2148-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f3d78 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=zEdONPlssZfnCtCruvAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XpCW6XCIiOLZuL4FpjDAhe3JRZPWuQuP
X-Proofpoint-GUID: XpCW6XCIiOLZuL4FpjDAhe3JRZPWuQuP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MyBTYWx0ZWRfX74VW+EiX5JMX
 XZ8xGPJCYw9Uy3lMZ18OhxuRB3cZaGHb7oNCDMXyW1ks3pxpn7YZObvDDcnXauPqVGo/rnVhwyi
 r6TPR4HopklD8/dTzBiNkTLH2/wgq/FsymYiBG7Vt+/ill6Y42RO8O5DHA5u+OjdMiNUTWtmWV1
 NpL++2EmBY7Q7rXZqO2YBgTWa0R4MT6RMg78FJIzMwyDTs9dwpdd5SOtpJ1T9GN8WnKkJMPCLcS
 LCe4Lg1ZV13LG/eMmQaQvOT40Kmio/37pGqrQim8EGTdHbe2197q7W5dr0Vyzv4Rz+aAYqMRMe5
 yEaYjy2LdspnPsN8g6czwsnUVW50lCcvfHDfAxqjwYfHjRDxD36gMyqYOSuZ/iIAhuwdhQ4dWc2
 kfngVKHu+42DGG/Jch6TApFmqaOe0GcpdW6Hd3xiCnqwnX5krimYgBS7c4Kv2UPbHslzyaJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220153

On 5/22/25 2:50 AM, Jie Gan wrote:
> An infinite loop has been created by the Coresight devices. When only a
> source device is enabled, the coresight_find_activated_sysfs_sink function
> is recursively invoked in an attempt to locate an active sink device,
> ultimately leading to a stack overflow and system crash. Therefore, disable
> the replicator1 to break the infinite loop and prevent a potential stack
> overflow.

Is it something we can fix the driver not to do instead?

Konrad

> 
> replicator1_out   ->   funnel_swao_in6   ->   tmc_etf_swao_in   ->  tmc_etf_swao_out
>      |                                                                     |
> replicator1_in                                                     replicator_swao_in
>      |                                                                     |
> replicator0_out1                                                   replicator_swao_out0
>      |                                                                     |
> replicator0_in                                                     funnel_in1_in3
>      |                                                                     |
> tmc_etf_out <- tmc_etf_in <- funnel_merg_out <- funnel_merg_in1 <- funnel_in1_out
> 
> [call trace]
>    dump_backtrace+0x9c/0x128
>    show_stack+0x20/0x38
>    dump_stack_lvl+0x48/0x60
>    dump_stack+0x18/0x28
>    panic+0x340/0x3b0
>    nmi_panic+0x94/0xa0
>    panic_bad_stack+0x114/0x138
>    handle_bad_stack+0x34/0xb8
>    __bad_stack+0x78/0x80
>    coresight_find_activated_sysfs_sink+0x28/0xa0 [coresight]
>    coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>    coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>    coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>    coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>    ...
>    coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>    coresight_enable_sysfs+0x80/0x2a0 [coresight]
> 
> side effect after the change:
> Only trace data originating from AOSS can reach the ETF_SWAO and EUD sinks.
> 
> Fixes: bf469630552a ("arm64: dts: qcom: qcs615: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index f08ba09772f3..b67c1f8a1118 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -1902,6 +1902,7 @@ replicator@604a000 {
>  
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			status = "disabled";
>  
>  			in-ports {
>  				port {

