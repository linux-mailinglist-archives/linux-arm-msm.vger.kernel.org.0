Return-Path: <linux-arm-msm+bounces-54282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 984CAA89028
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 01:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A4463AD7B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 23:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7A51FE474;
	Mon, 14 Apr 2025 23:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWf2svwW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55361FAC34
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744673186; cv=none; b=a/mcvMdVat+fo31KGXsdFp4YjZ0Kv2m9uWrtu0SvQzBUdkIGyNjjSC8A8mT9sTIIjUROLZkVDl/Xh6KhSX7nkK8rS8+hemzZyaW6Ydxl1tweM9Vdz+NLRblLy/uc45i9vyjaxT7qL2q/Tga+2rvk5fstBlr35jRo0MmNmjUqFek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744673186; c=relaxed/simple;
	bh=SLHM+qFQhiaejSEdjAVbakbcqR/tA3ps677UZ1ZoSgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qO8k1+HP1oJ6azfTQr73kalU6ARnk2RAG3MfueIqcrJ/Zheut89MCTXVvoTaGFy4PhVCA1rx2Nd1Dw9PcKQS6L9oXwMTTYs8Nbpo6vq/vyn1/PB1haZpE7y8thH3OlvTJbtX3lzxg/RGirDR5d21MvI7Umv/FzTCMog9LxFTuxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWf2svwW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKdmbM001634
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OPlEM68+nIEs6BBX1ux0tweX/ljTdD+JoVoNptF7DhA=; b=NWf2svwWr/NBxDGT
	FX5hbgIzswRY8ePYsWtV5Nvftr+AaklhN38GqjTllaK7la49vhkGFeHpgxqgcIyM
	a/6IThzQbrQS7voDolTx/3ZO4/ciSCcanEsAU8ehEpSwOTQxcpUjqYdPUhtgB/xt
	tGVmN5gGGUk/u4VRFB5/+pUQNp7Aqdq7wAiJ0xVWy+PVyDBtPscHiiwIiFWCqUqz
	uu+Nc11Ox6b9vSfH1wLxnfHg633UNyFEyVg6U/R0+Al/2/raqpRX/2/tpsRTsc71
	VCatmnvUh7OgMZNTSeUHVcOjOLNOwUUThhWEyWs4tKV5ZdMsI0JSmrfqwChy4mkz
	6vnvEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq69k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:26:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5530c2e01so54428185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 16:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744673183; x=1745277983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPlEM68+nIEs6BBX1ux0tweX/ljTdD+JoVoNptF7DhA=;
        b=ZXvijZZc3teYIoAg+1ceu5FNSTW1pVuonhe1x7DtPJf9GzfbnWeA52/9IUFPwVv5wt
         K2ZWKTmulOFBHvOj6P/UJCydChpC+KNQgvm+M9LLuturariUdRmFLBzRqyftmrhi90/4
         OFJZIA38sC+hjbiHcqycVlXc4prbB/jWoyyxd4olXWpiHB/Qh+3SC9kZxHwBRXEsgigL
         NPwgE2nn18Br0DrFC1A+kTQ35IoGD/nvve5Wnr5PdZGF/61aq5hSu0bevyt86qOjAHlN
         i5JQh7thdheBAQJnlVt4h2i1X9quJqm7iJcDDaoNPQFsjR4selJm7ZeZXhpYaUpJIS5P
         JPFw==
X-Gm-Message-State: AOJu0Yym2iQTAcMTWbA2TMdK2uSyVG8dIDBhIEdSjLWaP1gqurJYzlCE
	B9zNfuPjl8L3Pa2azGa8bleBE/SVrR9N8kLVga3WnAgyUGgNRQfyY/wA/p98Ra7avl3Pb0ew5wA
	rHQLChfICFz8CWOgCXWK+/VO49QIUhv9p9ejqCXkjgnTwk6b2qNFM+hiRE+ytORV9
X-Gm-Gg: ASbGncs10dL3cUJdoe9WvvgS9Nv3XWTFTJTRwi+VkUEiwpFeph/M5REAQe6P2hzxLqW
	11/qsjhdpTt8NRONNjq0cGPi2HtU/5v1eG0UZn2pShXGwOe/FRO89scCOw7YuLRDqRyUeLIoUZw
	DynTtXKUzwMLkVV9d06n6ANVAhkAmtFPbGS++nXxObjAKdeSbtABUt7GjJs6VwF7ZplaOOSoR9g
	THvRHq5rf/GCNRIaUC/hbh41ILfoHnGsBM36yb5D7XcqzIfVrPjN7MATxXJpzW2yfXw2B5etgUx
	v0JgwaSKqgrRsH2MOdmkSE8PH5LobGj3ub3ka++2y4gnWfvmjc/NONvQAJ1cqT7Hhg==
X-Received: by 2002:a05:620a:2893:b0:7c0:b018:5941 with SMTP id af79cd13be357-7c7af0e3286mr621244685a.7.1744673182787;
        Mon, 14 Apr 2025 16:26:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh9XeoL7I8zuSAv+U09Uft/hhTsa/ls8G9c2wqXqpOVKCw4PsUsOhSxyRY6bj5xowlYT66tg==
X-Received: by 2002:a05:620a:2893:b0:7c0:b018:5941 with SMTP id af79cd13be357-7c7af0e3286mr621243185a.7.1744673182403;
        Mon, 14 Apr 2025 16:26:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f506425sm5662071a12.53.2025.04.14.16.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 16:26:21 -0700 (PDT)
Message-ID: <a2a69953-647a-4bd5-8be0-e8edced53cd6@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 01:26:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
To: Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
 <20250414-sm8750_llcc_master-v4-2-e007f035380c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250414-sm8750_llcc_master-v4-2-e007f035380c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NlVBXUf9sUgvAbd4lfbUZN-TqVr7cNe_
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fd999f cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=DTz9NSAdtq1ik8-Tc7kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: NlVBXUf9sUgvAbd4lfbUZN-TqVr7cNe_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=651
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140169

On 4/15/25 1:21 AM, Melody Olvera wrote:
> Add support for LLCC V6. V6 adds several additional usecase IDs,
> rearrages several registers and offsets, and supports slice IDs
> over 31, so add a new function for programming LLCC V6.
> 
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

