Return-Path: <linux-arm-msm+bounces-59249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15979AC2955
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 20:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27E9E3B06AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 18:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731F6299948;
	Fri, 23 May 2025 18:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Il3256cu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED62299929
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748023966; cv=none; b=sXJSK3TTqKKMG/tPSUA1xGgwHYzm0HfYRs89rly9d0rCAPEKf98vLjVh2V3RpfcGq4Z0lklRT0+C0xvbM0nsLDPx7R+rRAJxdDVV2EBThxAuzaoKDaU6gxTt9XoWETel1SfGEN8goFvOj0/1fbJqiE4WZTLWuWcXefxTFJcl1TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748023966; c=relaxed/simple;
	bh=H2g7jia2BsPqgUIovz9o4/PUhE0UFnjetOMYvTY/DNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sl3k0M3YZJGWnucdh0KzLKk/92LOf58Y4JjOUUMoude9+/KPZTp6cTC1Xw4hFhmKBL9tMkGffC68VdH3zIE395l0YVxVyo4HMckuKcRjzSqEkly96R1Pq+nNafMTuJhXh/KJathU5/nsD0rX+oGK1VNXZBLLEtj3qOStUx9UuF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Il3256cu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NC4fJW000731
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iz9ezLEquuwmNTXBvuDUybdRf3cIwWCcnKJopdL/8k0=; b=Il3256cuYOzyyh3g
	7M2t5+NKh77qhRNOvzJOcO0TZq1M+AaecW3mtzJMSZ1aFdqRZl21/u9zVUd1pChS
	nUp1SZYOfgK3BtF+qcfkeUcsmoyrOKWGBEH/N8XmUaB8cDh8ggU3Y4/kLksNvq00
	rsjcskDxpyk9HCf18QxcpMEMAvfInMrye+OUejGfna8R8/lfKik+1Tf2NdIt3K3X
	ehcsIgjItlWx5ROwbjzJPd6TGIrW2Cu8TxbeiLT49cuc1milLOFzifrSXiESvQ3q
	io1WNlzHSWxWIgIaH9EG/S2Sy10tVWMoYharxjdTkeBHpD1lsVye0ePdBKKO/upg
	oslAbw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95ts5v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:12:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8ca9286d9so218386d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 11:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023962; x=1748628762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iz9ezLEquuwmNTXBvuDUybdRf3cIwWCcnKJopdL/8k0=;
        b=xIt3LAsiqC7ykwcl0F6HpUadEGD9DU/WA256SAPVmhPwToXtYcGcjy5Z4nbXJ1abzg
         neOlQd+UN+MQCw8ilJnOkCtNNp4MpYHQXql0tlOMrTiVWh/s5OjQ5OgtIcPT2Q0cSca2
         62LJuMTz0DRw3sAI4vQ7NImeJrogQhPNdGNUB0oU3fHZzElnjnDCLJBLgMWG25VWIeXu
         FDcki2TPZzLoCcWoW/yLgrextef3u5RTV/XS3tDKLv4xHNvElMsMJOgI2cN8UTV46vbi
         ct9eoT9/bUh137hvmswfiQ6iA71ew4CsUxXFUB7W1H7fg2EbZV8WDzy76eoqhMKwRewv
         clew==
X-Forwarded-Encrypted: i=1; AJvYcCXHz/b9919wZhdae33Afrw96wL8Bk16O/hqRDqF/loLfRAoXqp0iWzUonFr5WNKsMXegKlhjHydspekWXWC@vger.kernel.org
X-Gm-Message-State: AOJu0YzRdSD4F+fWkua818hkKPXIVs5TctrGWe1dyb2z8KtAQ7/RNVnN
	pRH0V1GfejjAsmVfThSxmvM4ArBvI7xz70pWvsdZYAq7VQIDO1rjyhNx/LylfrP0Q8dAQjSBogS
	9ZV2ng6kvel1ZwmVnDhR0VZE2IXNilyhPm6eQXZyQg3LMQjBWSngXDjUA8p35kTg4TURO
X-Gm-Gg: ASbGncvN13zVAzi36aUmio8ekt2kryQ0FY5xM/SmM5XW874R/KmCCyIK0RtP8rUL0Oa
	OaP+/5D17XlfdiPs1+U4bD2klVP1aj1VR/IdWZ1gBZuRwa8rjkyB4GkVw2WTwLhNEu7baaOFjfg
	e+5k+wBZhlFIXm7eiJzszdkWzi39mn223evPUWsw2pZRNUnRxjAMre5EQ5yxbXqSm+HriHdmQEj
	CHeA2m9hLMfedH9l5p1h68qmfUUQ2bm5niFDngIO30s8/wCW3upce5YRSSA6U4cGtcGCg90iR9A
	BqETiVhb+2L//gkMHAV1frxnPr8srUaKufMKbDtyH9BOgALh0IbYy3FUiHOQAOUZoA==
X-Received: by 2002:a05:6214:234e:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6fa9d296bc1mr2479266d6.4.1748023961766;
        Fri, 23 May 2025 11:12:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9d00l5uK2xNvswJipm7yny311lQLmRM/DwcA8svnLDgmL/dpQgbz/qdnNPu7zG//PWDyHrQ==
X-Received: by 2002:a05:6214:234e:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6fa9d296bc1mr2479076d6.4.1748023961300;
        Fri, 23 May 2025 11:12:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af13sm1281034966b.18.2025.05.23.11.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:12:40 -0700 (PDT)
Message-ID: <2bce3b88-8810-412e-8115-bceb73d6e8d9@oss.qualcomm.com>
Date: Fri, 23 May 2025 20:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] arm64: dts: qcom: sdm845: Expand IMEM region
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-2-f7aa94fac1ab@oss.qualcomm.com>
 <fjx7p2ab6c3qvwakrpj3zsjnhvjzwbfszvuwp6edf4rlehxdih@ucovc3r4fdfl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fjx7p2ab6c3qvwakrpj3zsjnhvjzwbfszvuwp6edf4rlehxdih@ucovc3r4fdfl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=6830ba9a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JLKravJCZqfu2D88U94A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: sU4WdUw7tAmi_T7OAHjG9U6mnA_f6tUv
X-Proofpoint-GUID: sU4WdUw7tAmi_T7OAHjG9U6mnA_f6tUv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NSBTYWx0ZWRfXw5elqO6UOtm2
 n5vsgXLuerstP1Qbi4rv5axRSw725GckmCi9f/taG4tTIRIok8kIsrzIPGObA7QnuI32z4wrMJ/
 ehmCllX5nARJdYBgOEXlALlGhs7gZSIhT3gRL9kks3istL11LFKBKb98yhLjikU9TvFTk4xtUD1
 /bWT2SqlNZtC3yCG7X5JqMHnK0PNmc+xyFuxQdnuH0CeigTr0Bg/9VzD6gYjpL59PAXh/bcUXPs
 Z/97rZ8TDF6ynGBPkskLmShfuOHNr6GFzSdrmBwVmzwY/IA2S3QOgI8zaT/tvmq+KllbcYLftPv
 H3QV7mCxEeUVuSoP2f5k3sKPpf1HV0M8N0bWQrIo/wtV9xb1DwwjH5z9oxzkQ8H1lINKe73yIM9
 tOIMnuxPm4W1OtG1DUtVX59PA77eNgolNZ7ntxKQy9AFmNoRKNPeuq+jq/DVaGm97rAu+ZDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=731 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230165

On 5/23/25 12:40 PM, Dmitry Baryshkov wrote:
> On Fri, May 23, 2025 at 01:18:17AM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> We need more than what is currently described, expand the region to its
>> actual boundaries.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Fixes: 948f6161c6ab ("arm64: dts: qcom: sdm845: Add IMEM and PIL info region")
> 
> BTW, are you sure about the address? msm-4.9 agrees with the current
> one.

we talked offline, but for the record, it is intentional - parts of IMEM
are not accessible to the OS and were previously not described

Konrad

