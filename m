Return-Path: <linux-arm-msm+bounces-50802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B5BA5901B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 10:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA864164BE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 09:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A071B0F32;
	Mon, 10 Mar 2025 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ur26tFll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34251223337
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741599977; cv=none; b=cbDHO3yF0BzTih42qJvMdDf4fzW/iIWUyr/ntRRiFQChmmVJXkjbX8FeSbinqkY1I526PGaSl692c0D9RMpbTtuuwBje6a5pqf5toLu9xZIQ2y1CrOL1miVS/43vBMa4jGavPKho5MHG/UNkJnmSzVw0sBGfF4em2Czaj+sKqkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741599977; c=relaxed/simple;
	bh=krYk4WbPLSa7xPokXjwiZrkpXfridSMHzxiI6uZ0eYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EfveYPtHnO2IjPU5+2I4yckeuihjscZQWF6rvUufg8F8KyS1eJbjDfRWTskXAQ9imabnl0ht97I/TAg0E9SKQliBlL8spr4jHIGSc94NchsU1/KyAQW+RsvBaMsE3giFBaOgwFM46OewzQ9YtA/VdeqRocI0gzRt94bPvMCsK/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ur26tFll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9IQPm018337
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 09:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ih4+jHDjFRiA69gnHwzJvT/5UWdEO8jOvDrfGXowHW8=; b=Ur26tFllRqWg3bp8
	zrTPDYoFq4wRonBIXz9aJTZx4kZLz+AGWI8lOIj26/WN0knnfyVT3JpAEJRAb32e
	6v62GwAn3rBZI0VT0PtsY/frrnlua1QrAK9ZCewEE1VEg0Y1qgaW8ms57o4o+PwE
	mNK88HHL+6jHFrISjByy+w9u6PWr6sm2+XhdgzrtxHD8G6NLYNvvU/DzMPJmF+8a
	cikikbdqkTX4XnxIOt+kwYsy69rgeco0u1e5/JHB7VC4bY868a7V8xpnIt/YdxLG
	mH22jH6KXLdm4uySxxn34xLLWFKTgtL8TRYkcQIPunhlWNDvklPZkjU39RHYolN1
	TzZ8bg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex0ve0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 09:46:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c55ac3a1d9so2351485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 02:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741599974; x=1742204774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ih4+jHDjFRiA69gnHwzJvT/5UWdEO8jOvDrfGXowHW8=;
        b=lw0Qtl1KKQML8p+T3Ffk31V5XzniI5Ue7k3nPVHExHqXbHK74eF7mWwzFZQloxMFJK
         fMedDPh6S31/Ea28WtABvZ2km/5AD1zVSAt30ZAP6/KX+mF2e9II6idqBtwyE5HGxXaJ
         QTRGMoJQ+VJulfxKoBPApt5ucBnOdeDyGbIWPknKaetFsOoJoH6EIfZBVvx374d9oW+9
         JOWBPFJ9B8XcaAX4qTCBBsaKQc5VOSuzFAjsUBAb7y3esNUVOEoPKpOPXQJedUAi8veI
         QqNO5K9to2onfqa8bm0Wnuz2Q0Dw3nvXAFSXHJxE4+Rahx0i/+2xGrrX2Dfr5e9yq7wQ
         KGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIkRhb+Lpd8sOpSOMdALYzwHv+3QtL5j9Z1dNj0p2zgYUdjN/42ekzF8tlf/DK+l8U3pPdVqm/j/3qAOfh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/vvME/rB7r+A0H+2w3lhBhiVfnfsbtEk/aK75PaIOE4k4kv9g
	Ntx4dpnSC6NVlmK4B0BsWYlZeOELi3788iDoOzK5E623TIwal5LChQ4MY5WEMuk6PXrt+vIKeHE
	8+MHihozpJHtW0NQnNIf4tux7wtmduc/S21MKG7smpgzbApZjjf/l3oxSrYuEsSkS
X-Gm-Gg: ASbGncsqc9Xc9Hdpu3VucTJUg306tql4mSl1bfKTus5Ee5LoQLRF30TKKEhb/xBEPpO
	aks6CzA5Q0cu/IOkbWdte5iD2iKJyuIp9xciLTUaCTGImUW3yNecQyE/3uyBi8wXzaFwNateoKR
	lT7Cu8670kxjQqOMhpT7O3Yk5EqG4wCrgv6l7Db4gLGU99DUUzgh+yxYEayHcDfFsdl/PZpkceb
	GRLBI62+87fdsnY5g1YA64+4TOmSdNdezbYbJFN6kBeqpds5Bs+zy4fibFhMT0bZ2zoCJXRXG+6
	fqcqKGppRQ8h1K4XTevIJZObk1BZbwpSJ2HFbFM8FaJWFOo/tZ3JyFc52TdNi4HfumLdbg==
X-Received: by 2002:a05:620a:2612:b0:7c5:18b7:4f25 with SMTP id af79cd13be357-7c53e1c4375mr521303385a.9.1741599974087;
        Mon, 10 Mar 2025 02:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7YuheYHS6PGU9dToJsmdjfNsj9OapzQsAAm6IkqoYz7wDIJ4He+ANVKbuM5AnL8AZiUxVHw==
X-Received: by 2002:a05:620a:2612:b0:7c5:18b7:4f25 with SMTP id af79cd13be357-7c53e1c4375mr521302185a.9.1741599973726;
        Mon, 10 Mar 2025 02:46:13 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394826absm747393566b.55.2025.03.10.02.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 02:46:13 -0700 (PDT)
Message-ID: <dcbdeb90-d274-4914-84d3-24bd1d6e826e@oss.qualcomm.com>
Date: Mon, 10 Mar 2025 10:46:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 10/10] arm64: dts: qcom: sa8775p: Add CTCU and ETR
 nodes
To: Jie Gan <quic_jiegan@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-11-quic_jiegan@quicinc.com>
 <0be31ecd-4386-4eb6-ad6f-a4409a3fc6ad@arm.com>
 <942d0b2f-c3c1-466d-b894-9dd32ec4e6a1@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <942d0b2f-c3c1-466d-b894-9dd32ec4e6a1@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IcJEX95hP2Lao3rQg8e0PEbaKEboK-ym
X-Authority-Analysis: v=2.4 cv=f/qyBPyM c=1 sm=1 tr=0 ts=67ceb4e6 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8 a=YlNZv3wqyhfgsvI1z0IA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: IcJEX95hP2Lao3rQg8e0PEbaKEboK-ym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=653 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100076

On 10.03.2025 3:57 AM, Jie Gan wrote:
> 
> 
> On 3/4/2025 8:28 PM, Suzuki K Poulose wrote:
>> On 03/03/2025 03:29, Jie Gan wrote:
>>> Add CTCU and ETR nodes in DT to enable related functionalities.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>
>> Assuming this goes via the soc tree,
>>
>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Hi Bjorn, Konrad
> 
> Gentle ping.
> 
> The driver part has applied. BTW, I found this patch has a conflict on tag next-20250307, do you need me to send a new rebased patch?

Yes, please resend this just this one, rebased on next/master

Konrad

