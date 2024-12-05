Return-Path: <linux-arm-msm+bounces-40607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 255469E5D42
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D99DF281FF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D42F225772;
	Thu,  5 Dec 2024 17:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maNOdNK1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9088721A458
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733420120; cv=none; b=Xap6Kzk0is37HQKTqA/WEXDZ3fYJk4M/WoUk2jloAzsXoK3hsp9O3V2vnNnrlJ3v9Uk016PwzmdB+vh/gYC1YtiQliliEy0NUrIyg3qRkCkGrwGVt+nUa1gQrmeGSa/yx/NxTPKE0BDXhAUGpj7UIkafYy2QWvt0rQCrjAuSaTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733420120; c=relaxed/simple;
	bh=c2l5AZImwi0kJvk1E3IDHHPuiWUV/EiTKKgH2uIeSZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=leEysYebOtutN9+FOsmbBd4qS8v30DfSTTdSpkpwppdihdi3k8j3pkuP/WW2RNB+kxlYrMtapdZi+vPxKFQAhCtTjIOnUSjKbSUxcwN8fWxf6MNOWcPv811OEhiNvqUHi7rMSHEc7IVUYvMD/KnMDpeC6fuvAI9aVUv4ZuRnwQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maNOdNK1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HVjTf008335
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 17:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/hf1V9zdRIw6pH/APZ/I9hBl32oTaCEJ+E39AFJsx4c=; b=maNOdNK1ISfzg10e
	GMU17NkJFPRdYxgfGziOdLOpmrZT/m+WfBTONiOw7cB3lrE8EW1d5KyoIHDOGnw6
	jDE9ukkoFn+asRS+aumNTke9iAGFx3kY9Ei2RRPVBrJriYq8plbW45Ps871pgV5g
	5V233092Zv9jQgOlkOYB7kHl8J439L5MzcVSt+z7ZK6dEytLBU2/0uMCgaqzpLnA
	HZj5WqVheXENMhVmPAaHjGhq7Y3pjjFIOS3Fuu5XqoDpdoZioFUMUGqwUjrRtCH3
	k55/Prl5p81iMBsc4A/9QcJOK6a+Tui7QXPEZGiXIg2yfx3WsMSLGuwNVwS73SHM
	ULivmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj0yqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 17:35:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6846a9b6cso2614685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733420116; x=1734024916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hf1V9zdRIw6pH/APZ/I9hBl32oTaCEJ+E39AFJsx4c=;
        b=JoZE5T3k/pH4ELJeaLLdXaQ+lsbePTgRqWhm2YcgtTZzMi9qAaYF9rV/9wW+zLVLmP
         R6xEbmLOmAEp/iWcqwYSL3qYV74TvfLwHXzyMamhg5xzV9DpyQ3tJKb1a5Ac4sa2hpv7
         scHWtKLR6JsIKGQLr2ZmI06UznBcvn85zY048HgoSpNkTo2EBHePkCMHhf2IWXm4uzUz
         0NCZb/USPjVMC/EWIan0+NjmYyWwLyfZKF3YoLiGFA2Ec5AlV3NlkMdEuNOJ1p3uXxyy
         8o+UQ1HVagUmdOBtsp9GG253V8N/6hj8n10fWL3c+CNYUQHK1aPHvFKR7z8wNpZODNq8
         zG1w==
X-Gm-Message-State: AOJu0YzNmqhw/Flxv1eUcFJhc3T5cj6ziorQlH4W88SBpI2N0GlP9kZL
	1PBxcExyMkBk+Nf9Ty+Oh9/DmlRs2HKHswAsiyQc1Da6irmvrDwFaBbIsBO2B9fYmsBDDZGqpEI
	A/+KJA7UqMopEyaFscmw9CDZDPAnXX5ky+IfBgDz1/CNO9IsmikgGthlvnKh+5xRa
X-Gm-Gg: ASbGnct/gCJOzE+s4J8X7gjwk4sJYkySUQ+DOZB4Ik2oa8JfSqdHcPcOTfHboVjlNyK
	Ey3T+u6hgxEBRwi5v4Pey0wyOLh0fGMpZsZ0NtRfhR33euENGnE5BCrEnLRoNVlbCBq3tnCMhgN
	w6ssU0vNgkgAKnHL/EIz4FiRb1325oLOIhm2B27CxLKouC/XmxB3NtN09btZ+Yb0xKIi4yc3v//
	h/F99+MIU7PZ/8CUNP7Ki/TXHUSTqHtbYZtUdrsDLnu1nLys+RBQ7EaaULLbUXe1M1ni6IYVnpO
	mQaShdRRJmWNLQ6zdFRtXxEhXh9PvCw=
X-Received: by 2002:a05:620a:472b:b0:7b1:b216:f5a with SMTP id af79cd13be357-7b6bcaca6acmr3099485a.3.1733420116619;
        Thu, 05 Dec 2024 09:35:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpJItac86niVhaF/4cNgJUrecH7V+GglPqLR994cq+wXutGXaPED7cVUuFPk/R/mKQ7V9KVQ==
X-Received: by 2002:a05:620a:472b:b0:7b1:b216:f5a with SMTP id af79cd13be357-7b6bcaca6acmr3097285a.3.1733420116273;
        Thu, 05 Dec 2024 09:35:16 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e58dffsm119321166b.13.2024.12.05.09.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:35:15 -0800 (PST)
Message-ID: <b4173f94-1cec-49b6-a882-d07b10ebbddc@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:35:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8750-qrd: Enable CDSP and mention
 MPSS
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org>
 <20241122-b4-sm8750-cdsp-v1-4-9a69a889d1b7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241122-b4-sm8750-cdsp-v1-4-9a69a889d1b7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rb5740wtUbANnnKV8Ry_r18lD0bT6va5
X-Proofpoint-ORIG-GUID: rb5740wtUbANnnKV8Ry_r18lD0bT6va5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=608 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050128

On 22.11.2024 4:26 PM, Krzysztof Kozlowski wrote:
> Enable the CDSP and MPSS (modem) on QRD8750 board.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Not tested on QRD hardware.

Not great given the status = "fail" on MTP..

Konrad

