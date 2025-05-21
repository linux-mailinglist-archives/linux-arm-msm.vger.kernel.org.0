Return-Path: <linux-arm-msm+bounces-58954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3760CABFD1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 21:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC84F4E6947
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 19:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDED289806;
	Wed, 21 May 2025 19:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxL19PIw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF762309B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747854183; cv=none; b=mI9IUxic4CgZeMJc/I/9gVVfK/ZfxHvnWRSiIxZX74/nTyMcPHQR71xYYE/P7QIDUpsCG/8efarGoqXjBMmfH3Adea7J0Jw6PVDp1ZYNOZSmGzZWlO1rDhEoXeVEIheX7i0VnKU6aiWjThLaWRyW6RA7jEGFZZLFEVrS1I+4gpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747854183; c=relaxed/simple;
	bh=8twrfZ+IWMuXm8fHTJgrikxj0BAx38DiOL17BbqoCBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aURXMJKtXKKQj50FF+f3EzHPAd4OEmCKf7JdyK0n72yvzYj69wT8XCjVYVZx7ZCtOvgu8PufcIixrh+Ylc9ubwsZ7t4RBatB5WZEJcBlfrvSHLmkcIWvzYZSKUIqzGHpFwQcT26IHmdqOlfpIdcGumfgvCpNbZ+1JYLKCk8BmOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxL19PIw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LI4Rdp021016
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 19:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hZvwU6rcn1pU3SuVgKIwUOa5mEmteb7nXnsZfgaC3Wk=; b=CxL19PIwSFTBU8oj
	l6VLwLrdcSv/c0377U3U+DmxCKS/7QWlBdDIZXNM576sGs1HLErBOb6zL/Qe/udJ
	PqsYaLiY2p4oNUclbqV10iQggH7XM8VnUxhV5KArprwx+EETwpRGXXHFSkSsy2w2
	m9LCYv3TPI7wPkZ8BQOQDEcDW1NE/QUyoK/NkD42hr1GN4BPGeoVMcDrd//h0hz2
	3kNSZMp5VkkTpnj7NnvnaqnmJennMCyEc7AWFgw370w9rI9VY3gmqTGJn8kMYj+Z
	A2wMz26elrq3/blKPd1u+hvrDXPwQtdYZxFCtDAQ9uZrwHvKZAcmmI9jEehrzHeS
	BB/ugw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0439f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 19:03:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54be4b03aso176706285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747854179; x=1748458979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZvwU6rcn1pU3SuVgKIwUOa5mEmteb7nXnsZfgaC3Wk=;
        b=VMXgs8cewmrxMK4lh5ruDWccUrO06HfuUCABB3Y/UIL2MF2pG+HkLSCniMzq5pQo6p
         soxEmcvvNzoPpnE44MpolGjMNOIg+gl5D5jGvzIhJOZR2G+/S/ioKGEK2jiuqIV5OVUj
         4gVUv6Fwdx91BFRq7DOogFDB2J96QX4LH0WL3woe9vIlyHJ6uBGdAXPL79OWUiRT2F+Q
         xuAMzaQ3/HqhSioSwLwxxiQHD9316y/NQo6A3gPqWk+tb5VPQrnSEVS1XWAJ2dRXEKEt
         klUtS2ajT8Sv2D15fbLN576pZaUWr+VcyruXiUIyKP9181Oc4Be20tChqFBun9SjEdxa
         79Og==
X-Gm-Message-State: AOJu0YycezePMF1ETKS2fqCFgnWwXU3YEIVgBrZEwmo831bKvkxFWYYD
	ND7/maxKXkUZCs5z4yMafquyNVoCoP9NwWX7aaSR6M77dJKUua7XoeVe0pVhSEkOwOwtSERDlrz
	7vGCwYnH/nQhDml1UwoPGjZlbyyEQjeFSo081Ol7PiHfVhRoBMp++vmOtdZJA/PYVVcxy
X-Gm-Gg: ASbGnctLvgOVkMXnRPhwxaux9q3AngXRc+L+DXz9MUcyUG21+UnUQqEZRvmMRxiLNHe
	ikYugCUoqjbPbe5BrSAdkPbZS4SvoRHDc8pGxCi/PjOJHAxvPMgAJsSR02d3t5Bo7onwYujPMit
	hVG3AFMzitnBX9ScrxDudmbQ1J46Je1dZf30BRHcnt/Qx9Cw5Kqk4qLDOPlTCHXXHgL25kKBPs/
	PGXRcnH9rCUp8SyBJTWg43OmQQaAogMIPRG5ZnqtNDR66BSjaEDh5oSsX+7LSnqf3w/oYMXdamU
	/MPTSaXhobbPzCOuc6OcwAG+Q9PFTYgMfJasQ7wzh/wV9s/46bh9u/7rBFywvlvC4g==
X-Received: by 2002:a05:620a:6504:b0:7ca:e39b:946f with SMTP id af79cd13be357-7cd467db69bmr1311536385a.13.1747854179433;
        Wed, 21 May 2025 12:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJthzcnQRjBSEzhEyNWSkKkY3ARkGqwf4+As8NUm1pnKzoZ9brBaKeWvyPRtoJC9YLjjiNQw==
X-Received: by 2002:a05:620a:6504:b0:7ca:e39b:946f with SMTP id af79cd13be357-7cd467db69bmr1311534285a.13.1747854178861;
        Wed, 21 May 2025 12:02:58 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047c30sm937346166b.6.2025.05.21.12.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 12:02:58 -0700 (PDT)
Message-ID: <575212e6-5f43-4e41-8bfe-8774f07d78df@oss.qualcomm.com>
Date: Wed, 21 May 2025 21:02:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
        bryan.odonoghue@linaro.org, todor.too@gmail.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ezM9pk7Ki7k588qDekNCMWVF43uAZYax
X-Proofpoint-ORIG-GUID: ezM9pk7Ki7k588qDekNCMWVF43uAZYax
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682e2364 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=lBa7_Vnelazs750aZ08A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE4OCBTYWx0ZWRfX3j6bItKn+e66
 jaalRDaBrkrhv5UZjgkxDFdddw5Go8YbmlLhddJXTdvnRX4lx/32IJn1DwIXZBNXz4nig4XrLWX
 izvIJHTEqqixKZPoizMP59XWfR9tTEgwUpexq5czptni4VVSsVjyTH6d31LYzifZKak44Cvy8BI
 bV0nPUtdF9f9JdCDO6lHO/K4eUUXU/Bj7TEafVlqwPeoma2QpCkhhexHxm/MJUYYcARcPE58nSS
 CCNNPhwPGz5kTTYukm7eveFqX013Siq8MB6X1MtntKlOfXLNtIW04GE4cE/MGht9bMTonxbL2y9
 vzqefdPdE/QIqEoAKkZtUJ1fWDjO6nknFm1FEd7xg1Jq2QFsFwcrb8vKGKlqOS4N+wSvNlofZhL
 VMvQnuQYewFeig63IDdefb9niP9Ca91eMMlm1l7KPcgvcqMCQueZ/gGddrKwn0q3zV833+Xw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=876 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210188

On 5/16/25 9:27 AM, Wenmeng Liu wrote:
> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> SM8550 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 8 x CSI PHY
> 
> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

