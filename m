Return-Path: <linux-arm-msm+bounces-82311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CE850C6991D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A238A35ED54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC782F5480;
	Tue, 18 Nov 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6U/BYrB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJ/adGoz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182912737F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471926; cv=none; b=iPvRm+GRIJfIL8S+iicaBdWKW1x1RAPQmpyxZpG70CrU84lZwnuvnMPINletE6viF96MpacVzlthXgQjYAEPs8dQaKXn7ij/V81Amj4q6ZsNKdtWBceZNbUJkjiSmC3DnEkbkqwGGJjS4p6jT2hVh11MG0gLnAlu9At8uz6khN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471926; c=relaxed/simple;
	bh=u2vHa0N2GrM/Gfb7w7/BVAD+L7hu6GXEgmGEDsZWBK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ay2op8413Lq2+tEr4Fm8xGu4sQgcKTpp1Tbhaz0T2Yj8lf++1D6XSdpkiXShhCHbQdX+wknLiGqQJGWtJ+qGiI2m33Po3/oNHRqXadNgw78ze9kwW/EszB3En7f5JkGa7+D0VQxmHRnbHjiqvvbA/wQjvpKqEePqBtviz/PcbEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6U/BYrB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJ/adGoz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6fOji2272034
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aav7xLblBgNOadCerIxkavKUB+3nM4sCZ/1UyQhFsXc=; b=Y6U/BYrBqchGWx5W
	oT5goJ7zKfTrrXGH/yOyYp5MXRAn6bu+bryDlOIOIFx5hOceh9WYacCSAWu7IxYb
	cdwdVBY5YIXlYsN+bzuPlbZevA+XmvS2EOFk/F8MHo4xqsj/6p9AQWp2Xu1EpjlD
	ibhA6SMo8+Gcnl7TcDAGfrSBKXv6vo3zmmssAXOeaWVfAgPXKoAsWcu/nF6SduXn
	97FFmMnC7U/rKXkNbValsFhV5onpTsk4siSb9iWTjmkafS1NaLV6MrZV6a9AfD/H
	jg453ho8Y3TXps37xBDfmdow0p7wca00HyJHMS+TtgU0k6wFliymzFIZGWGq3Xv3
	rhNeiQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmh43m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:18:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8800460ca8dso22852396d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763471923; x=1764076723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aav7xLblBgNOadCerIxkavKUB+3nM4sCZ/1UyQhFsXc=;
        b=JJ/adGozZLN5ZbkQHk+Cf8GOdNLbAOQ/szHHpm7YeBs0lG0HoCCvWrjqWzrq28D0Dy
         wDZ+1YZKwq+vhH+HUP9TNbbHhHVVil4D3sIdF0m++RUT+1znx42g75ngeyiB5Rj6aqnh
         gcYxLzNT0V394Q3Cto1YYN5Ej131XXWLlItFVvFGshxvL8PtHJEN3WqTGz4w6asuKbrM
         rMvbHqzeKnpil5/wchKupLoLJ/yWF898bfb1Gs3BZGxIhDtNKVZFzn1fjeniw6izF78W
         m52CKSvqCHQKLq+Cd/GiA/X3Ow2ihx/b+7B1GcgtTlEKP+A/fcpiFX0JxsMfpn3wmK38
         L3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763471923; x=1764076723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aav7xLblBgNOadCerIxkavKUB+3nM4sCZ/1UyQhFsXc=;
        b=Ajr1PTGd5XAs9WiCQsvJV1D79ZHjxfWrwqO4OZzP67ibaLbdDS5xz2XmAwpHRitFuY
         u6H3SjBa+oNRyG42IR71rH/Q73Kz35+jouEs5G94QHg67ZR78ZqD4usI+QAL6GnQBXjk
         1bZx0xt2NuJqemG81+xoXbDLarapJMCoMeWvXEif8hXXUul7qOlig4Lem8NQ8CyX6IjV
         NZRyDVWquGjw5FcJEhuZlVgzguz7QGcNBLNDURdC46XdHVUyKNpmRysPsjEr1jC1JYEN
         gpjlfupxyK1C/bpXRNJxW7hUiBehiYdxw1ds6HoLvJGXAxyit4JbGnjbg87pVa1YlLB/
         HuWA==
X-Gm-Message-State: AOJu0YxSSti6hqi/UU0EZM5bv1eBbgc7EkPqK3V2GeJ6czkYgLTys1eB
	wW0KZ8NJvi50m7cfjfs3pM2QVJu9gGHEbUBx9YQMP1Gk+uGC3KiRpm3J22O4YFnW2s/zQr9BXg7
	c2xnCX0K6WZCjcDBW+PQoO0Xt4NNr98IFu3UFfRIR4T5y/BFNt2p6nYSdYoTML+28tjJQ
X-Gm-Gg: ASbGnct8CBxCbgbjeJK+43Eg6HyUUec/IOK07T1+aEvTpgDR+MeH4UDwDXE56wS6pCW
	deZS5gAOs56HGkL2jwolzlOPIyz8P4Qka1Fj2gJaD7gVG5OaGEoRuj9Xqx+BNH3WuyC0nNKWBW6
	ZDY0l41eL0o4laRBmun8YKS1K1kMQCGXoXoHyamrFy3+EbHDXRP0Q8T1aADRywq0Q1+T5javbO3
	oGX1tlKdvoAfjgELZnYuXkXB2lHxe0tqNSMPcfuLDbK6PTk9YHR9u0K3N25zNVyvgy4jUnI1zUN
	f+M4vxuRNocMRnK6Tfjg+NRERULi7vUao0J2HQUbe5dLNKoCoG5icN4ctIDmHuX5BepyiQAZWYK
	+pqcG+x0kps0Rt+SSG2GUu7QYtYBnZgKkW46WQzl5E1okMk6kceM0JvlYGS0oTpNi3ZhpnA==
X-Received: by 2002:a05:6214:5293:b0:880:4bab:466f with SMTP id 6a1803df08f44-88453a568fcmr25309776d6.0.1763471923370;
        Tue, 18 Nov 2025 05:18:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYqYNyYlpyKAS/uLzFkpcNv03+YatsNppSG0jkXgvsRgaloSBb8+VMXEFY8ZIBMcGEVBXgLA==
X-Received: by 2002:a05:6214:5293:b0:880:4bab:466f with SMTP id 6a1803df08f44-88453a568fcmr25308716d6.0.1763471921736;
        Tue, 18 Nov 2025 05:18:41 -0800 (PST)
Received: from [10.111.165.185] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828630e991sm114484716d6.15.2025.11.18.05.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:18:41 -0800 (PST)
Message-ID: <b47e6b6e-6cec-4470-9bfc-93008bd44a5f@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 21:18:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, quic_shuaz@quicinc.com
References: <20251113130942.2661069-1-wei.deng@oss.qualcomm.com>
 <8f22f268-988b-4504-a4c0-7cc9021dc8c9@kernel.org>
 <26841765-171b-475f-8019-2c349958af7d@kernel.org>
Content-Language: en-US
From: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <26841765-171b-475f-8019-2c349958af7d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwNiBTYWx0ZWRfXwljewGMNp9Fu
 KVi0ofE5o2nVOwEGHCbkPaAh+WcRpkydZ7YGslNe4DZFCx09gd9VRQ0oOa0hDwp5SmnoOyZzz93
 NOXyZw4B6QozaPyUQYwP3j+IkjQNhI6jU2auq4xAEoMHEwnjmN3s6BdHnG7ZO89W2sf2L5n5eBP
 MwWMPosYSK/csYQaZc811+E7e9gT+lgx3ICdEf7j/2vXhJEGJUaSZr2R+MSBKUfr3sK03EQ5izq
 EoB4j+aPTrqK4lRbUtb3UcFlcNqTXR9nRNRKylkO8cWVCn4mu/HUHHZ8/0SeA3E8gemrrNUMFnk
 TeAGyG35wA55L4V8KOSEGCm7wlwjF+O2r4KKtj7LtRTIvOWGP4ZL1BucXxLf/+CEOubqV+wSeqm
 xE8TU8odjdkw6zBoZhI6n0Z94/md7A==
X-Proofpoint-ORIG-GUID: k5ZZPlfkdUfGyMoHNTI0lI59G0gK61Yl
X-Proofpoint-GUID: k5ZZPlfkdUfGyMoHNTI0lI59G0gK61Yl
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c7234 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=5TMoWVwS_HVFom52XzQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180106

Hi Krzysztof,
Thanks for your comments.

On 11/13/2025 9:38 PM, Krzysztof Kozlowski wrote:
> On 13/11/2025 14:37, Krzysztof Kozlowski wrote:
>> On 13/11/2025 14:09, Wei Deng wrote:
>>> Enable BT on qcs8300-ride by adding a device tree node for BT.
>>>
>>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>>> ---
>>> This patch depends on:
>>> - WLAN
>>> https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/
>>
>> And that patch depends on something else.
>>
>> You make it very difficult to review and even more difficult to merge.
>>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 28 +++++++++++++++++++++++
>>>  1 file changed, 28 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>> index cd8800a59700..08b705fe4eea 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>> @@ -18,6 +18,7 @@ / {
>>>  	aliases {
>>>  		serial0 = &uart7;
>>>  		mmc0 = &sdhc_1;
>>
>> There is no such alias?
> 
> Ah there is, found now added by Sayali Lokhande <quic_sayalil@quicinc.com>.
> 
> Anyway, organize your work in reasonable patchsets not 3 or more
> one-patchers spread all over the mailing list.
> 

OK, will re-organize my work in reasonable patchsets. Will send new patch.

> Best regards,
> Krzysztof

-- 
Best Regards,
Wei Deng


