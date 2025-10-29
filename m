Return-Path: <linux-arm-msm+bounces-79442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 32736C1A177
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 88E0B35825F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7CB3321D3;
	Wed, 29 Oct 2025 11:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBPu1obG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5smWCxt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ECD30DD2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761738160; cv=none; b=Td2w9pfenfoazsL6K9zXTxLK8tqQZuxhB7PbbCoeFVjEorp2Eo0C//dJS3JPm2PqC6XJR1hDS/hXIHH7zOFGOtxLrkWug964stPzj3XNhtvTj2j/hPTmrhoQymwIGqEvZnxycwdlD+aeGCurhfuGVm9fRq3JrNo56EaK3P42Q3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761738160; c=relaxed/simple;
	bh=GK+h9CifNt1/N8ART1U9SkukAckkPwLv+RPCo//wacs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uoHC5qYHCIEJckUs7poBGgcpoDWXJIQKTsiqWweF62k8VG9cggFBs+1OPycsHEKswkLaExlaJcnXuI+usvjCMx2KziQFjo0qN4duxhmAf0Qb7mExygqRssjGQXYsAm7wJkmxJJe2cKsUKcjPAuQkPyvADyS4GZoH9AENXB/7g0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBPu1obG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5smWCxt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4vFqh3755299
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	82QGbvIm5tIICRw6Xgbk0nOud47sW9k/+sQlIS7mO38=; b=kBPu1obG6oBpAV/w
	rX6X70BPCMPWiaukpiTfJP+34elZvgCzHBot/M9AVAFwmeqqDGCwdp2IBOkKE5Ud
	+AI3X5yJlR8i+f1tJargKwLo8JBsMR7jgVr9kMZsR87LILmaV1GLpUf5vIyiCqs3
	fwr1I9PbworcjvrFg9aK7FSfI0tvRr73SuFCZUUN76gUvQ8Td8SiE+Z5OGhRbs+1
	GG3alG/4DMG7NhoI1S/dWUamLbesF9jlmwDrwvTbonXjn3zI0cbrUZt8jaMYA1FJ
	QtHDYgMe0WO2zqjvN97P2ydt1lgWAKjnvGJref17Uea6tGqBsCS0dJzlxOmSr45O
	vqQqHA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a02cj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:42:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a27ade1e73so5115473b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761738158; x=1762342958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=82QGbvIm5tIICRw6Xgbk0nOud47sW9k/+sQlIS7mO38=;
        b=b5smWCxteP81vgHgT3zGSnQjtevKViAfvvl/oAizWixhLPrFOEgeJrP0HyHLGQXfyC
         LukVoiGdsjZg9sPDbTcGpmyDJMCZSemMqwD4TrDTRLWT3GczHRV9U381ni3NPc5PQXL6
         7eCQeHoCNkX0KxRvvsSV/L5bUqmeNYUbuwHjVTicEbsawj4TONYNp4FKnJNlSnL4SnFu
         HA+Fco+lDlhkBk7dh0fSOPvsvWp4aG696Lrcicvfkw25wjafUN2o87+boocDbFjPf/Mv
         8uNc2akCIwCTexWh57UwJ4mfrOh9Ngh8loGEpMbiYrpvYHd6lRsBxIQNfyBgl55l6TzS
         nW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761738158; x=1762342958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82QGbvIm5tIICRw6Xgbk0nOud47sW9k/+sQlIS7mO38=;
        b=MsVkNOUSxShPawD4rKQmP2PssgzrHOuxp/SlBphKkQPb9Q+NCX4pX1cu5JzNuETZA8
         DwSj9TNFND18vrADe/9cIRgE/UDzgaJC0kXpt7LLEtLEMIxdWoQ7OEvoC9ir2b9A3EDO
         WVpt6SOficN9TsqUHs0aERI7mxTtavOOXu2O/KSA7EtU0LbOYM2/UdgrWEC7CZYQ73eH
         6/dCAwRT9/puGFwzAnOrjQZLQBvWBQ5skBxC6CvbYz/AlOeZPItbAiZbRK04H7O/+a5W
         TYEhV1dfpLZtOXwwF3SMTevTE6dBNTh7rM2xGzXPJvTc9NdjYVz48kT4JhHq49Al32QX
         f6wg==
X-Gm-Message-State: AOJu0YzZIrlTufp42QzLKVsKDTQ7C+3Ev/imHBCP1drBPshcbU04Efa2
	OVmc8bWY8Lp19WFSZ3VxySw657i3R55CwTKsSCu8MMjrpiYHs1UmOvzKcdePiGUB39GKkRNBehA
	mC8N1LsJ7EN8qXFyeSaYz4RZ6pWGnG7A0h9as9kXziWVR9s2gJOl5ASmlRtQGrPbVYiMI
X-Gm-Gg: ASbGnctF9PpxYgBLwZLZRSFf3f/J3MpgOwSYJdyK7gwX0uqIsXVmhLuTXOCoqP+Wgu3
	S2LRZRA/tfls4KLavSjDUxd9Mq3gpMefBaVf0LqnsXukb0InTC00CjiTmXLtF9Lv5KBJU3JAFO1
	pyJaQO5pY02J4n7yJVcXlyh9k1nFIqtTxyjwgPmCtP0As0rK+YCwvAmX+M1vkBXteLWCHUzwOz1
	05ozxc6z+N8o9Cb89tdAaGUbKhR5/xPhcG654zXjbs7hhMmkYbgd2vMcW3zROuEzdjMC8wqsJ+T
	HXKm5K1LRBwTuuvRsVwK0WWRHFjKmZmV6pc13ZHj4KW+1/48Wo0WvobQ87G+vMHcXG7AqvyhU6m
	QXQ+P23xoNznhZq9MqipGGnJPGGNBQEa5
X-Received: by 2002:a05:6a00:1742:b0:7a1:49f7:ad04 with SMTP id d2e1a72fcca58-7a4e2dfd22fmr3505502b3a.14.1761738157901;
        Wed, 29 Oct 2025 04:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE60h7iSnXrX8hGpp8tyqVaKcNJkQPbjBnD8dVqZHjYUw2lDZ67G334v4k3EVjp4iGr6sSeOA==
X-Received: by 2002:a05:6a00:1742:b0:7a1:49f7:ad04 with SMTP id d2e1a72fcca58-7a4e2dfd22fmr3505467b3a.14.1761738157365;
        Wed, 29 Oct 2025 04:42:37 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140699basm14858553b3a.50.2025.10.29.04.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 04:42:37 -0700 (PDT)
Message-ID: <6297468b-77d0-4202-8ec1-3e731acc43de@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 17:12:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 QRD platform
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
 <20251024151521.2365845-4-krishna.kurapati@oss.qualcomm.com>
 <a117b105-a734-4f67-9bb2-c06728e79083@kernel.org>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <a117b105-a734-4f67-9bb2-c06728e79083@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4OCBTYWx0ZWRfX3fwPabjqPuqd
 2hwZmCzajDUfP2H9uKuhYaHL/F/TdCSxJQk7KqjgGB7HHfz9W5M8IVeDTcBlcnAQ3znu6iPBzOY
 axEXMrpV8IqPpApLWFJLV01VvgU65ixlZuztYF7KEOvX+GFYLv86c77FM/vk9XeQF4KRrePPXCT
 eKr2jez/Sjc97c10+22dnECpiE8MDDJ4pZAijbtam067x5b1/l+phfBD8HuRzMq64KBAA5k44Ba
 AdOQ9PGYvBGYWeVyQjvdf2eYESW/0AVv6lI18A2s1/OFAcRpPbGClV2HH47sJ2Mif+FYmUVFQLo
 6cSHASifm9RfQVv2BO6c5jaA12CQj4CbPh598T1XhmvEpb7DZUsQmRnByI1RRPSoeIABl3ATqoG
 aE7tvRmTnuF5LGUjCuvl1zzyKcgg9w==
X-Proofpoint-GUID: 8Xu7Yofz0097d2Zjx3pPuQZCVAJ8_W_D
X-Proofpoint-ORIG-GUID: 8Xu7Yofz0097d2Zjx3pPuQZCVAJ8_W_D
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=6901fdae cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mnim3SVQaNIeGpcasOwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290088



On 10/29/2025 1:37 PM, Krzysztof Kozlowski wrote:
> On 24/10/2025 17:15, Krishna Kurapati wrote:
>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>
>> Enable USB support on SM8750 QRD variant.  The current definition
>> will start the USB controller in peripheral mode by default until
>> dependencies are added, such as USB role detection.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> [Krishna: Flattened usb node QRD DTS]
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> NAK.
> 
> You ignored every previous tag - multiple reviews and tests, and then...
> 
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>> index 13c7b9664c89..fc5d12bb41a5 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>> @@ -1054,3 +1054,25 @@ &ufs_mem_hc {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&usb_1 {
>> +	dr_mode = "peripheral";
> 
> You sent something different with issues.
> 
> Really, this was a correct patch. Was reviewed. Why you decided to drop
> all this, drop everything which was correct?
> 
> Your explanation:
> "- Removed obtained RB tags since the code has changed significantly."
> is just wrong. Almost NOTHING changed, except completely unimportant two
> node merging.
> 
> NAK
> 


Apologies Krzysztof,

On first patch that adds changes to base DTSI, there were changes moving 
to newer bindings and merging child node and parent node. I should've 
removed RB tags received on that patch only. But I was over cautious and 
misinterpreted the rules and removed them on the other patches as well. 
Will be careful the next time.

Also is there any issue with marking dr_mode as peripheral here in usb_1 
node ?

Regards,
Krishna,

