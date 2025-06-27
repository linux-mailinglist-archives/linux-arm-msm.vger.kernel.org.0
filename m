Return-Path: <linux-arm-msm+bounces-62756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8F0AEB71C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8986B17BCAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8DF29614D;
	Fri, 27 Jun 2025 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5YmCzrY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DBD20B1F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026075; cv=none; b=aNenNTTGsjSx4pITkCJFJHTvRb6souDVt+6Fz7+SutyPn+SYxomKlUImqCYyRoHbV8J0EKE5jJHSA4lQHgPpORyXs6yRtIe1kBzkzwxH73EjZVdVBGcYY6rUQ58GVUB8ctSif+r2Sj9NoHilMtVpg2wZ15H2aqv94Kt8plgFPn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026075; c=relaxed/simple;
	bh=/n2G8Yx3oIqTFv20NCOsVU0asgOTN34z0VyAQXVjk9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaK/o8Bg4qnQsIE09G32IHaN/RE9gFm9jnnZFYkoxH1fkA3R5mNakEpdHyo1iZjlzgFYUSZU4AGs+JjG3Dw1/wz8Y8mFChJrtbNHMaj21cbqvKjTpAThSFfzogGj/f5/NUWFvOabFjQl8UsvjzwYVXyUK3mp7Ok4+VkCORFeKJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5YmCzrY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DEXf009891
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2yWQ9J19kL/m2rbPpNvQn+2HXbMCNu1FXmidWthmd4=; b=B5YmCzrYNHAax83l
	om0Qnlc0arp5anrD3FvCm+j0fJsB40sVFi3eGUlD3/Z4aUvPRZ+3N8Njno2FONBh
	Ovl7nHV/RS4BMR1cHmeDHe39Y1pJGidiXVKEbJN8V1f/SZxkBFGyqSCE02nr8NnP
	ScUVFWGitOueSz6vpWzr3l7kqlWZNO194IjAITRWE1M2yn68JdWNKpAdiWm/Q25q
	6uzjj7F0fJKkbC1F055Swk2xxTlpmFRpUSIzugl3Af1BByazQJlk00/DqZgxC55b
	AtbRYSEINu6McMNCm7oCQX0k5dQFp8vVeGMm5HnukhEvQLHADR8RpJTvJ6ee+bnh
	p4Pzbg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fgfsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:07:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0979c176eso43582585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026072; x=1751630872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2yWQ9J19kL/m2rbPpNvQn+2HXbMCNu1FXmidWthmd4=;
        b=TZnMfi3JbPjQ1amAf27hdLt0d4pMEQ5fFmQAstUJerys6dhGJTnaHFhbwVLAmphFEJ
         s292FlgY7iv7iyZDtwNSiNmAzgmEUgzwH3HcIir8GoXv2rxQ38BJr5z6afi7SoiCfCb5
         dPRR23UJ9NAuI/QEMdB0LusKVoy8wJQY+N6HK1KGfRzGtlKDotsUgUPKaUTN2WBZCCDB
         dDTKFzG7eG2+DLHuHo9ZQJkEHIWK8fiE1LyfA5lvT7JBFYt812ycTesYGB7IrNYvon2A
         Kh7FSbGWyD9WR0OrseFmJKCQS93sF0xT1VWZqASNIkDKJKUGmI/a0xlJzwaVs6IQXWeb
         IAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWFSmMYm/9OAInny93TqwT5ypzqFIKCQG5fSY7NtIC6RtFQxpEJhi2n3RySH9FJqxxa7ZxNSzsfi0g8AN4@vger.kernel.org
X-Gm-Message-State: AOJu0YxleQx9uQFWbQ4qRurEVkgfetBct7Yof0Q9gr+u2rzJ5RtEk+8N
	zZWFTHTRcHBAwReelFHI3qpgcp2oB21ZhYIconF7sL0gGafprzgCH6fM9ocoKcAQrW/GWpevZiJ
	BO6CO8d44p19DJgM2A/BVrgeuhzoSMxi6PzCQeYcIBavKFOrEa91t5ptKM/Y8ELajHvwB
X-Gm-Gg: ASbGncvbdX2K30X7TQy2Aeqg0UxDEBBlVBS7BUUcsrTBBtsSOi56sHX8esFOngvivpP
	huZp+Dd4vqPRcUY3Y5ixTjKXAEcEdP6JWD3gJUAp3uSsx8fk8YLC2jxjLKkM9DqW+Fa0bUo0vK3
	3FGJSfEmW+J7GSiOWxCISsggnlE8B1vtepZ1AJ+K8eZWXgzm9uIKC3JEgEV7QkMWlOx5kW8/Fgd
	ddjmt1DqVBDpE7GHZB8t0uf8ouSBhZapeAmNNejSuJe7zo2siWvGfh82lJBIdhdbjlhQD6Q8eLY
	NNTZ4Rbw7LqRBpgmbau99vtDwVeXFcAAKVvArFKMW4hdJUrQSdQAntaZvFaoFbcep8AsN4Pr9RX
	XoaA=
X-Received: by 2002:a05:620a:171e:b0:7c3:c814:591d with SMTP id af79cd13be357-7d44390dcb6mr170407285a.1.1751026072248;
        Fri, 27 Jun 2025 05:07:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMLbX89yS7binC4ZEteCTwbRLHqglPFzMinVrITkQaw35tFAgbD6c9NqROZJoQZf/mf/bbSA==
X-Received: by 2002:a05:620a:171e:b0:7c3:c814:591d with SMTP id af79cd13be357-7d44390dcb6mr170404785a.1.1751026071627;
        Fri, 27 Jun 2025 05:07:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bea1sm114084166b.146.2025.06.27.05.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:07:50 -0700 (PDT)
Message-ID: <263139f2-f149-4615-82ff-584fe44ead2f@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:07:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
To: Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
 <20250625-qcs615-mm-cpu-dt-v4-v4-2-9ca880c53560@quicinc.com>
 <xkvn3r7yphlccurdqzncz5qegs7xc254xc2ou2dzuilatk5f5j@eq5ynce4aepg>
 <2b29ae78-e4a0-4d25-a694-abb10883086d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2b29ae78-e4a0-4d25-a694-abb10883086d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMCBTYWx0ZWRfXyV5QrthsmdXD
 LPt4eg804m1HY62tM/r/g+r8EMWIhymK7BLkSmx/nZQczouj58p+WM4oU20NJdLy1XlGnlvXckv
 3Ch6bEJDVc9o9LEgZ2ks2+lqE7oC0oJX7NtIOqjqe6Hp7sPpiXMApwjjdzaGRv7BO9N8dXZ82OL
 N+wsexn8Re0UJRrrDRbIZpl2DQpK5LwQmA1HQ8pYmuAAGEvKSsPHl5SeNzf2xgXdb/2Rmq1zTAw
 MwyDxFSNKXBmqWUngQQXYgCta7V7Ln5PYXgskgAa+vEkYFjIoMPufWYn01CiSoXzWPjXiTWgC7r
 A/qD7QsJcHq6+lqi8yZWiajKE2dZ2bsxGgHOq/QEiQfttG2xCfpAkJQGvz1UDI1966YeZpBXAiJ
 EbQ45NksGa/ail2EMmI7XZ5Lbe1AyWIoe02pq0+U6VCWA3ZsFu+/QkUo6n1gC1qYj2vMJvHZ
X-Proofpoint-ORIG-GUID: KR-SKRsEvDpoJWfA3zHrqMAvNOQGI6ij
X-Proofpoint-GUID: KR-SKRsEvDpoJWfA3zHrqMAvNOQGI6ij
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685e8999 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=Od_Csnso_M7n8_Iv6A0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=910
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270100

On 6/27/25 5:52 AM, Taniya Das wrote:
> 
> 
> On 6/25/2025 5:06 PM, Dmitry Baryshkov wrote:
>> On Wed, Jun 25, 2025 at 04:44:01PM +0530, Taniya Das wrote:
>>> Add cpufreq-hw node to support CPU frequency scaling.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>>>  1 file changed, 29 insertions(+)
>>>
>>> @@ -3891,6 +3907,19 @@ glink_edge: glink-edge {
>>>  				qcom,remote-pid = <2>;
>>>  			};
>>>  		};
>>> +
>>> +		cpufreq_hw: cpufreq@18323000 {
>>> +			compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";
>>
>> Why? Other platforms use a true SoC as the first entry.
>>
> Dmitry, from cpufreq-hw perspective SC7180 is a exact match for QCS615
> and that was the reason to use the same.

The only compatible consumed by the driver is the last one in this case,
meaning sc7180 is only there so that if we discover quirks very specific
to sc7180 down the line, we can add some exceptions in code

Reusing sc7180 would remove the ability to address any quirks that would
concern qcs615 specifically, which can happen due to hw design, fw
quirks etc.

Konrad

