Return-Path: <linux-arm-msm+bounces-80097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B16C2B851
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8F6C3A1322
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FA7303A2E;
	Mon,  3 Nov 2025 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcRhn2+D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M9Yy07oF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B9E1DE3A4
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762170468; cv=none; b=rbb9xnCvZ0wkBMeNoiRqwIc1un85C2xDv+sOV6BzLpjGA+gHohFnstR9uRqoPfuYFdO/oXdkhTY+sYwVwayDwKu3qnt4KGCMV+nuJIQJiq9Z+JvQJYtER/Cd4pDbyQMxDLV6VWr4bpBc3jU2N/KP72okxFZGDiaeZpjJG0Mc4N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762170468; c=relaxed/simple;
	bh=aEpby2eiGpem7ns2YN9Uq14HC9FVvm6FY/zVt7OK3rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjtnSxJKsYEoP1xLqPJ0Yr7PgYTklSiup+V5Vjz9tsTlzaxolzbpLk8wq2dpgBUUY2UFiy5hghq9q70SyupGB/oeLPbDHFgXPGj/YkQaY94JcDzDf7TDwfhQPH5h4IzSIwWd3/QdLwa+SuKoyqqjIYv4h7HeYm0eL3ft9WV4Obs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcRhn2+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M9Yy07oF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A36CFXd2270121
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 11:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5wY30x4NfefcWvhOPc3CV1izT2GGqlJ9mgDiAYiipII=; b=KcRhn2+D6sYMen36
	REjeEJizPd8x372/SYTQSrAZ0Yxb7ZmjJAK2Z3pGUUuNud40nQ/r+9WdO48otA0r
	3/sd7bRurrfB3jQNZdUBYGvuRe4zSCNkydwvMNJKTwGc37FPmGCKoLbYY9zbGEPK
	iAFL4dDZWgcFD/O1LvN8xd5Ahx/1KXW+E8IQWeU9sYCMKWNgi8FnLWHpGXeXzTM/
	RZXI67luMgNNF5ddZkQ4rVooE3KFQDOwJUFf2jMi31wrYlq8fy1u4kjp6/ieeu8M
	QBA6JDuLNprlaXIvp6NnnYgONh6c4h2aF3bBPVKqpyp6ojn1j4kqJK+Kz9+SxdW0
	jluZYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pwagyym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 11:47:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8a4f7e885c9so151159685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 03:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762170465; x=1762775265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5wY30x4NfefcWvhOPc3CV1izT2GGqlJ9mgDiAYiipII=;
        b=M9Yy07oF55uP2OljcUeeFunL5IM6mgbjK2a+OWJBQFKSe6usoYJ4cUPN6yqgTRkJtf
         u5tf5m4+Q6ValOkzgGp92L4yFe90QKcOO8DfkYIOLx7lI59i3glezCxHvJlEtBV+Jq30
         NKcUaD4HnSKRdx92f8KPAMv8Lcy/YpYV55VmK7vwfJpFoTfFPMOd9FiSG4zDdw6r8IrM
         re6lciyTBfiAgtSgC9W0Fz8LNQm94s4uSngSbxp9EE6ShFgQn5SE4h73+CXRK1w/NNQk
         V+ULJphhFCSZzXaPeryju6yybFYu4xv0W8io6VckdrvJTNe1aVHSF7MzuHkrXgQ+s5Z8
         /Vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762170465; x=1762775265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wY30x4NfefcWvhOPc3CV1izT2GGqlJ9mgDiAYiipII=;
        b=FAAP2Wzz2q2TXKhP2gxm81Tlpz1bL8+9bNqPSBUitxH0Yr0bNVImRXj6kgn3b+xv8K
         8W+y24FPfJFBM25EiJUjfdNBTF0XAKoRqYr2z0mHzO3DT9Dk+rnkCbJ6o9Z2yh/10BNz
         yFR8WCmr1B1yKVsyEiqA/bNbCAsIHwPlFF2JigzvX5HWgzWWyP8C10G+P+nU7Aipfx1q
         ivIjVlkYhGDt2JX0GQ5jUPdU45rvqfxW+oJz5LVIEUNkRGqTIe/m4kfPmNenAptxedOx
         xiB8Z/gnrwooqdjWYHE01tny1qOTAnYlAzRLRozL9p9RGB7TKXO0sgjhiL88YOxfmHkB
         nCdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVn+NngufBDLz1FJetAEiyIWTApcBlAP65q5XX46PcJYciIzXMi61E0FeQnAbNN6mcdnUl+zEf0YGkvM4k@vger.kernel.org
X-Gm-Message-State: AOJu0YwugqLc4OQZALcXpQAl8uEgxT+WHIKxyV/pZzQLK1v7hJJGYWSv
	XrmU4RFPPSOEOoH6oQDguwR5yUKUomYRbcG+ap3HOvL5jge4NPm/o10uDcR/kAMezobKZSLuMDb
	9UpCPCeiN/zUFkvVrH9EDYxuq1z6rbbrJVqD7kngKYmPwAsSMlHRtmvENBewOIAPQ00Z0
X-Gm-Gg: ASbGncv86CngefGSPMqq4mixAvYcnii/tw6eIopsFfREDe4M5OY1je2PfkrjEii30Hc
	cl+ryd0U1vwmw0jz8adT9Z6Otu4w57JiYnGDHSPTJ5RIWyVQOQbWekmZr57GKiDEE2YoHdnjYfo
	BH8P3u5AncrlkiiAA2BHLwL8X/pX/NVrTxevhIP7MoXhDm/s9U2t1se09KBqEddqVv3LcDOc7/H
	OY5BBj18uvAIOHFTzgZ6AzwAHKzzUUp5i+Wr7Oou8Nd0qT6n68/x/eesjJ7yX9UFKPUE3qOsZN+
	YAlzqXP/y+ZMzBY60W4ZwPT0W/jcnIx/xcBKzS9LtTtCuIlFeUl4YlA4yeUlSHdgYxKjEbaCqG+
	AxuS1/1kISN/bsEylZ/Z3BDC44w711Ve8k5+WQdsheP8BL2FFsXBzNHbb
X-Received: by 2002:ac8:5f48:0:b0:4ed:237:71a9 with SMTP id d75a77b69052e-4ed30dc6bb0mr108107731cf.6.1762170465217;
        Mon, 03 Nov 2025 03:47:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVueoCvMa+PNMpnHz+ud3b2RBUVSEQ8CIs/BxtYGSYKO/eJs8zetYAbGGhbszJbqMtgiKQoA==
X-Received: by 2002:ac8:5f48:0:b0:4ed:237:71a9 with SMTP id d75a77b69052e-4ed30dc6bb0mr108107601cf.6.1762170464750;
        Mon, 03 Nov 2025 03:47:44 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b392d5dsm9597540a12.15.2025.11.03.03.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 03:47:44 -0800 (PST)
Message-ID: <5d8e359f-0117-4df1-aa91-beb365adf7ce@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 12:47:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8650: Add description of MCLK
 pins
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251023025913.2421822-1-vladimir.zapolskiy@linaro.org>
 <20251023025913.2421822-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023025913.2421822-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OrdCCi/t c=1 sm=1 tr=0 ts=69089662 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=cCwkqNmnRgsrfKQMxVsA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5eRf_4LfjbwDD7Ld6Szz8YHOnXiRFDhA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNyBTYWx0ZWRfXzoB79P8cxizr
 LBXiD8FTyd7+BV1tVVKlvRdtFt5O0u5ScFtSXaAoE6fMwPORGhjo+v1mTtm1M2ZnCUBNmznXX1j
 QG/HUnWzxJr6rYVc6Ub+BoNtcSgsGt225FTngOrsxUJqx0ZdqPE0KiVAjpTAH+h3cbippZJNpyp
 ktYDIysc0BKgxG2wzaJA82MVLxmxe6UwoHLkw6vedk4ftF8cXyAQVtKWl5atqfLRj9dfLdLiH3E
 Ryf6myPPG1bqyNtZFVMtBeQLWlOEsROM5QXGYZot2DsHvVmrQ/psYLty/c/Gm8NfYDutblrwuzT
 3pnJH9M8zNMpuO9o1sTrbfk8ydOZa0QYchyKO88i5TH2+K955z2FjOB9qYP/S2G6A0QJL8/6SuY
 ut+6JpIBYLrYB7I9Jcc88DRp12m5iQ==
X-Proofpoint-GUID: 5eRf_4LfjbwDD7Ld6Szz8YHOnXiRFDhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030107

On 10/23/25 4:59 AM, Vladimir Zapolskiy wrote:
> Add fixed MCLK pin descriptions for all pins with such supported
> function.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 144 +++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 555305c1c70d..8f934d94d359 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -6065,6 +6065,150 @@ tlmm: pinctrl@f100000 {
>  
>  			wakeup-parent = <&pdc>;
>  
> +			cam0_default: cam0-default-state {
> +				mclk-pins {

Could you resend this with the additional -pins level dropped (i.e.
pinmux properties being direct children of the outer -state node)?

Konrad

