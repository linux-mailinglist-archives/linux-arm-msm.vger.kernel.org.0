Return-Path: <linux-arm-msm+bounces-43877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B60A00934
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65A92163C3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAD51FA15A;
	Fri,  3 Jan 2025 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3bKE+H/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AEE1F9ED8
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907276; cv=none; b=LxoMAgsYm2VRNo67E7Qq3xZYLiIO171reFRsG++6ZY332yZDqfnvvQf9GYk6vYLcnbichBKY6Qih4c4lwI4P3VDmlu6en6hHhK3rCiAa9X1I4REKd8n3Fg0kSsrB8EcbdFrHz9GGUXq+85+0GyoSsbEe5fOR5yLUNVbtZMLySFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907276; c=relaxed/simple;
	bh=Pqwl7N6kCzQ/hrkxhcYrmAOFRMM56Ip/rYR6bmxRT3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsitDhmxA5wjzM5gwnBo1fMYFCn6s9ZqolLWgsYHLx1Yt84D1/fhC7iQmfuz10a0UhnT/mXCZ1pYd4b8bCYFpYq/HSl2VkgLxqzb2kkhEdkjInjdzAkS4OSadK3UTxWXTTxOUYXHaXuzCeTLKdnOy3fpjIQ+WqEDcnwituZMufg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3bKE+H/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503CEVxk013580
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jan 2025 12:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QdbJ1dOWvgh+OgR4NwZE+j5YlKJamHg+xsDrOvj8Qik=; b=N3bKE+H/u8PRNQb7
	C88AV19SPgf8adrEUgxVI0CN4QPjJXgH2zwKEINlA6GrU/WpuFleQyD+YMHgKGEt
	kBkuXz36JyDyvscC2WeVjZ5TJIfqerz5v4EifdhermbvhdJE6N0mSbmrvyUBcfmc
	OPu2dAb6vtAprnjO5aiE93jtBNdNHoVz/9vUrZsYkLZQ5s805ezeU71fBUCKsPmA
	+lfTsurWNJshXatDRTAkex16q0Odj+V2j7Nb9vU3G7VXYZkYqV2HwhY9/fyHukq2
	FCAGWqNwt+b+tSAo3cNEvLuP5CaKRxkwI9LP4aEB+mpxsBAfQ/sihfFTOOe/Iw/U
	azGUlg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xfjk81bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 12:27:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6ee03d7d9so83230385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 04:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735907273; x=1736512073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdbJ1dOWvgh+OgR4NwZE+j5YlKJamHg+xsDrOvj8Qik=;
        b=ElVOFoHH1xEhwt6Zr6IB6OQvnzIrFbBOinFM7kh4bEiyKJAbM3wG/yfADeqfPKGd9u
         8uZI4FNDoec5QZxp81jO5I7VuUmdJRFW/rdOd044AwBiX9qQwMrayeyaWqN8FdTeYB6Z
         wbJQObADMlf9IGC75+U6st1lozoxlreASf1vk5kNUn1ukKumHx+PbIVGy8psDKzgG9+f
         jpEdnKQdBW5Upd4ElHzkXomekAEE11v/tQvgjWJ7cfHy1OKSzsQ8K8L9PxuV/82OUsEZ
         Y52EFPdYaP5rQhtP/5CXgDTNDaaxfG2tge5WGDPyI2TYp4b+RuAWPpJFJCZvIgBAVJRL
         DZag==
X-Gm-Message-State: AOJu0Yyl8hH9x6df9j6JsQZj7TJwqfff2m8lQPVE5VQP5y/GIrgfmSAi
	NFsjrJCDejLm920c8YK678qIGojRx7m2gBXpRHJZpIFX+RwgNO32tbOtKghDHXnFRiyD6JTs33Q
	nbDgLsl6fNF6AWYNbzzmgx7WLuQwwupFIB6DKRUModviUZP5MtgVJ3PcfUnLA2ZbS
X-Gm-Gg: ASbGncscaOw31OpspPR3Zw60ziJKGgPt6HJjxO7d8OwfEFxU77qypS11Q6mRlpLN03F
	AnXiy2hWSHIyXGvMmp9eJmqJ/3NNeqDauEVCJUlPKBNXjx5orGEbpnHQjibFX3MabrWiTozT/ra
	97IX0RQ0ykwF+SbIc1veQbF6aWn7VlT8dnIjmWs6oAJNBxfggYKchxvs3flZylfKn4E11YEhwn7
	2nk9yc01oU+poxcKULesTsZ9kKYJtfRXCz9YqYW8t+sMrKT3QKH/7nFQMiSiNSXGvPOHm3bsmte
	Otu53zUpQxfDSaV1SFwllmyHiAs9laLtA4k=
X-Received: by 2002:a05:6214:4007:b0:6da:dbf0:9645 with SMTP id 6a1803df08f44-6dd23317478mr274820746d6.3.1735907273045;
        Fri, 03 Jan 2025 04:27:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH15Wpx7u9V/hOQ08GkSp0Y5O0301pekMRgSHOKCQeCdUs50MNnQM9AG6NcnIA0Lbk63M/OqQ==
X-Received: by 2002:a05:6214:4007:b0:6da:dbf0:9645 with SMTP id 6a1803df08f44-6dd23317478mr274820606d6.3.1735907272677;
        Fri, 03 Jan 2025 04:27:52 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e898689sm1875427466b.78.2025.01.03.04.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 04:27:52 -0800 (PST)
Message-ID: <c94ce3c4-5b8f-4d7c-8acd-afab63306018@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:27:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
 <20250103-qcom_ipq_cmnpll-v8-4-c89fb4d4849d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103-qcom_ipq_cmnpll-v8-4-c89fb4d4849d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NmhorxE2GYYcdbPJ9IrCAkV2QdVXMDa9
X-Proofpoint-GUID: NmhorxE2GYYcdbPJ9IrCAkV2QdVXMDa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=982 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030110

On 3.01.2025 8:31 AM, Luo Jie wrote:
> The CMN PLL clock controller allows selection of an input clock rate
> from a defined set of input clock rates. It in-turn supplies fixed
> rate output clocks to the hardware blocks that provide the ethernet
> functions such as PPE (Packet Process Engine) and connected switch or
> PHY, and to GCC.
> 
> The reference clock of CMN PLL is routed from XO to the CMN PLL through
> the internal WiFi block.
> .XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)-->48 MHZ to CMN PLL.
> 
> The reference input clock from WiFi to CMN PLL is fully controlled by
> the bootstrap pins which select the XO frequency (48 MHZ or 96 MHZ).
> Based on this frequency, the divider in the internal Wi-Fi block is
> automatically configured by hardware (1 for 48 MHZ, 2 for 96 MHZ), to
> ensure output clock to CMN PLL is 48 MHZ.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

