Return-Path: <linux-arm-msm+bounces-91642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DxJHQXDgWmgJgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:42:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB89D6F9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C9A93111008
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3623128BE;
	Tue,  3 Feb 2026 09:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meyQE0oa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmhG/llE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E615C31282C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111408; cv=none; b=Bidzmodjgmgp/PUXjQqSw7IzyFmi/xlII7+fRoXAHodxYfcVf3jTLNpUvUWlYB2PLMl1LPs2D5UD7+WeC2W266ONI8zNrqNnr+ArmGIhkPTdAGTbCYYhoj0SPh4cMxLsl6laSX4K9kObN8pJOWkiG2SiSDDXClT0kVLuHSZ0gpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111408; c=relaxed/simple;
	bh=Kn6ZVggv33TTn/5SCh+Wj4unpFmhCWkYAtgKLwZ3cpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svlXTI1rvBfqVCqCx82mEn8L89NAAXYVQs0yvIHVIZC6qr9/+9UcGKtz57zdscjdrP3IF5kzmR/DFm5kW36ArLHB40JS0zjfz9o42q9+qUj0nAycnGXUWPfsqq6SZrwcBCUEfvGfkNNGt5qulSxQV4iiXipwb0eS3IsfQvLe6YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meyQE0oa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmhG/llE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136uOGa255929
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FEwRyRc+5T8fGGzh4rUpKLJe0ns6o5092hg1qa+GDBw=; b=meyQE0oaIWG/+sYD
	G/z8VqvDxxIGCb5echv2KYcaQIe0Ml3dygx1aYGm5yX2KVBsIRfpxH4NyLyqEgo4
	f4kVOs8hBy9mcB0Dxly4ETejWq7rL8m6ukNBhppImrnR8hvlqNspCBu2aLxqQCI4
	za90q0uZverfpQmidrU4E/Aa7YBZPwDXuk1ElFOs9WnPfcDbdn4AjYEm05YOlAjH
	GKLKfsPVcQwlNv6L//y3ZlH9RHV+vEsinMumZoGTfT+1In0LF+Sw4vrepTgmBv9J
	gUHlt/DZyZAor5b15Ri77QhgwUt/hnvNQoNUpJMEw4cgN9/g76P9OEjxhRVw4K40
	t/3bfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0kkhw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:36:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c536c9d2f7so156644085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111405; x=1770716205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FEwRyRc+5T8fGGzh4rUpKLJe0ns6o5092hg1qa+GDBw=;
        b=cmhG/llE9zkpnSEf9u6q+KM7SUGrRXTSG0ucvOIN9CBee2977UQWbcXJkC3DugAFKU
         VOdAFBGw6LchUIiE3mwpqK9wFJQ5jImHQUfn1r8EKvFl99LG+3zaMAkJw3nuIlT3xb3m
         YRqOPFCmBnj6tVywqiZhOTBayKEK2CAA+vc+dJfuibNgagZQYSgBO0YVu9PFxTh2uZvW
         h7+ExbLrpXNFCVPAudTy8FNQ600JqQ2c940LckK28bHAUio9vTT//QzuKkd8+D5VQylV
         /PjYiMrluGTc6gqiF45op16EVLcW5res+NbWWSatcZ3G6/G4WIbunm5dINlDbiZkj6sR
         lfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111405; x=1770716205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEwRyRc+5T8fGGzh4rUpKLJe0ns6o5092hg1qa+GDBw=;
        b=mVDUjj+AHmSIKN7BoSoRUFlbkrLMTHq5YS1QacyTQK+fELT9iarIdIcAcstZfqceEw
         ohwHgBmgWLzgoGzxFq/fb+nXZi2BvcWyIj9GKnaGcDwwTJEUbAa7weG0VADHH/GMC7Et
         WSiFzuhYbHwAcBmS361nX2cdkxh5X5B1WBuKkFiFsnxz7Xd/zmPhgRLUvkyiPQMVRbCq
         UOIWsZPq1KYFguuXzOK6Bw1GUhmbGVmiFZnoLv//nC3NKDH3y4yJulyhY0OiufqBzNce
         RtBmMGUChUT5fcoKWBvyrIqKVkifUQTr8uEvQv7cr4d3ekR0z0hbOoHZZtlZW9wl7J3g
         TUrw==
X-Forwarded-Encrypted: i=1; AJvYcCUtKwhd5Dag85Q4noM7QGi6XfUtfPtA5NQOm0w4l1QtIJwYai+1sE/55tKzPqeaa7+meakdKXwywLmGtih9@vger.kernel.org
X-Gm-Message-State: AOJu0YwFRU4FULrJmllLFIXLdgZCWIBsqWlTcA1RZqW8TOtyMnJM6GwO
	NoQwWDYsIoPMSteNxcUX3ooagZnmRg3g7VSc/NOuZeuO6tA2GbTjlWq8PsFpbhg4ADxMADGXJCQ
	NRS8SPBrUNIqOptxjUwQtxUogqqY21aloRuOX//jgN9sHqmWp1Hx1xaA6DGy5B0Pv6J7p
X-Gm-Gg: AZuq6aJG4rW+cHB2Bhle7EOgfB2xvnOuVoLBqFQ6qE//1oN09iPSDk1Pyn4aT4c6ham
	EY0LCm8h5zlrV3wt3NLZbNtGQqCcHQ8V6tk+f8pEtqmL1bXF1daWbkSnaIMvhUfTDdsagukQ+5W
	0C6tuQAISYym0knmzmk9zfNK6WTCSAwkJLbVZzZpS/ZzyS5ckHrN2RBRlvRmRYtWDVcg/uWtFhr
	9PO4jSbhkAxdizRGEJlA4w4q//bz9CoVLTkP7G1IHZ/xBjhfOeEmNMYIpnPutz11m+3vZ8DH2QT
	yRaDxrircBIj7Q9GGZDO+dfJU5DnCEBO0ALTwTpuKj2x1CMxQUv+jxY21KaZ4Qp6/kKjEus86lm
	W4Sjdu6LicsT4ERSUYdN+BOKh86sVoKaaW5jMjAxL3zMRP2LBVp3NwK4js1VbrdLPAwU=
X-Received: by 2002:a05:620a:29cc:b0:896:ead2:a657 with SMTP id af79cd13be357-8c9eb131963mr1402435685a.0.1770111405309;
        Tue, 03 Feb 2026 01:36:45 -0800 (PST)
X-Received: by 2002:a05:620a:29cc:b0:896:ead2:a657 with SMTP id af79cd13be357-8c9eb131963mr1402434085a.0.1770111404797;
        Tue, 03 Feb 2026 01:36:44 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ddcf8aa7csm881056566b.9.2026.02.03.01.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:36:44 -0800 (PST)
Message-ID: <a74b8e61-6e15-400a-a7aa-d589f3545421@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:36:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
 <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
 <6c823646-9085-409e-a692-ae3e77347742@oss.qualcomm.com>
 <5911fe77-fe2c-4321-96a9-a1b6b3b5d1e3@arm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5911fe77-fe2c-4321-96a9-a1b6b3b5d1e3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6981c1ae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JA-vdinaGFA0ZwrEKSsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NiBTYWx0ZWRfX2VlvPwUkkkIk
 mcAcrG0disKDlxMgVJQeV/HxrlcDjaWwVSfTAh7w9vrqNrhznui3e/EjQBiTNeDxBVBKGpHpOI/
 08kCjFOhb4eiiHTBTAvHfnKNzCQw9LUjCFJu3V5f0J1D4/IF2TnN/EVbfMrYGPobND+tWpZmvHj
 Sg3t6p0z1EjRnfQQJuoxBP9CBkI3LGQLQ8W5oi9jlmqNuh1yBrmMiS+Aj8hlt1W/qn+U/YwTJb4
 cv3eDooDavl2LuuPmGjouctFc/dKk5NbZkNp9h91DzPfFhQKLYa2U7t9TWndMDc8cxh0w3TNLTs
 uVUfjv4cON+y6BisKBQYsl/vm5C2mYtPgtd8N7p3KqxFRCvUbzsQmkajjvmOUb0UjwA313OoaT9
 ygwtdizkQJKmg2J7BMhcVrplzFpkejKyKAJfRQMHEmP2v2879X7yCdsO11lMqtNhUaXP4bpcgAG
 zMMmO3MT+NI6zcFcpOQ==
X-Proofpoint-GUID: oTwk9VISy2xXcFVw5r-vFW8ByJKTitKS
X-Proofpoint-ORIG-GUID: oTwk9VISy2xXcFVw5r-vFW8ByJKTitKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91642-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CEB89D6F9A
X-Rspamd-Action: no action

On 2/3/26 10:31 AM, Suzuki K Poulose wrote:
> On 03/02/2026 09:00, Jie Gan wrote:
>>
>>
>> On 2/3/2026 4:50 PM, Konrad Dybcio wrote:
>>> On 2/3/26 9:08 AM, Jie Gan wrote:
>>>> Document the platforms that fallback to using the qcom,sa8775p-ctcu
>>>> compatible for probing.
>>>>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- ctcu.yaml
>>>> index e002f87361ad..68853db52bef 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>> @@ -29,6 +29,10 @@ properties:
>>>>       oneOf:
>>>>         - items:
>>>>             - enum:
>>>> +              - qcom,glymur-ctcu
>>>> +              - qcom,hamoa-ctcu
>>>> +              - qcom,kaanapali-ctcu
>>>> +              - qcom,pakala-ctcu
>>>
>>> Platforms with existing numeric compatibles should continue to use them,
>>> so that the mess is somewhat containable
>>
>> Sure Konrad. So for Pakala, I will change it back to qcom,sm8750-ctcu
> 
> Why do we need different compatibles for the others ? Are they not all compliant to the CTCU programming model ? i.e., sa8775p-ctcu ? or even,
> a generic,
> 
> qcom,coresight-ctcu

It's a huge anti-pattern with the DT maintainers, since a compatible is
the only way to effectively differentiate different implementations (i.e.
instances on different SoCs) of an IP block

This is important for the case where a DTB is shipped as part of firmware
and can not be replaced - if some quirk needs to be applied retroactively,
we can look for "qcom,glymur-ctcu" without affecting all the 50 other'
users of the effectively-identical IP block

In this case, we're already reducing the impact on the driver, as that
only looks for the single fallback compatible (qcom,sa8775p-ctcu)

Konrad

