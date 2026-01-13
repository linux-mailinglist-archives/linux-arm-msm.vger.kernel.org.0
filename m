Return-Path: <linux-arm-msm+bounces-88697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F5DD1753C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8659330F602B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED013803C2;
	Tue, 13 Jan 2026 08:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPx1WEtF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W29Dvpzh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0F537FF69
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293045; cv=none; b=doa7dSj2SU+IBd+4Z0WbOiCgIUcIqkLif/N972y/0szkSQCxVt5YPtinlQa0siuVKTGcTA1W/KU+W3JR7CyV8spziNryVbVkFo+nUEoYzAAhbKoti5xjzN2S+T5r5YFR2bIehsnC4ZEui99nsqZT8HYwBittLIHoOwHdBYH12nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293045; c=relaxed/simple;
	bh=o+3hh92gUNXkXFzYmwxLukiu7xCIV41V8/oGkaeIgbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3XVjNJPxGYx4YZdGzA3+fYUBG8W/SzvILv/r0dScYBjgmbcejIvKWVSrj8w0pMYOfl8kO9GGYtdJgXhHqs9EFODVfbT2+HwTT2bXxLQmP6mVn11fnyb3l7S1LzxntNjseMAeoAfV5mcSXIJv7xl9xLtVCk7gJbPN4eBJ1CPyrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPx1WEtF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W29Dvpzh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7eQGX3299900
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Dkc3DGT5YgEDWgnx8G7r773Yo9JqPtmdnTR+Qu8ZBk=; b=iPx1WEtFouFzg4Bd
	1pAFM4HsUpYhr8JwfaDycboBbcnPV88YEX+hpKxd+1JGm0BaxZR3gcJJaH/DW92Z
	PtPaqdX/n5otsKx6tySVwUVPcSFiI0B+NGHxlpLoXhH8pVbRmHn4OMtiaIcGG4tp
	cMkb2FrFGSdzug+U75W9TwQgHNnLc05CSu9kwoB0cFGG6rYDum6ByljXYtdT6dx/
	Tait3K86pnCIti8aobbSkHeeW18o5JiYnf4kpcZQxWNWF4hKHRcVhjocT/Q3LTzm
	dzUyJ96uUo2ax0JuVHZmVCRkGqBaIpbSNP8qv6ipS5BepGeOrCGCx4hKwh8h9Hhu
	6yloPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jma0g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:30:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ede0bd2154so22837021cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768293042; x=1768897842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Dkc3DGT5YgEDWgnx8G7r773Yo9JqPtmdnTR+Qu8ZBk=;
        b=W29DvpzhQntv3xz65corIqZra2oOhNdus5hDu9LnzYv56VwiyD+lgnBF/OcQCzaOjX
         NMbKDxl4Wl7MJ39IsQVp0WmJYW0cV9nL4QJUJuSwRep/zG3AUDB4BP9duRbOIfyE5Te1
         oeAOgcNKU4MvgbnMhehezpbKFlplfcGyC+BSFGaJVajDVUdaStPRSekWpuzHjQ7m7TwS
         MCy8xUgUe2pUGSqpZrC04HcEFAwwCZfBeXjDY4U8pnDduPPtphJ4y1SDN/R1FY5XZagF
         mZPJ+g0QgXgjslKkGwn9JUsmLNv7XhSr5jdyiVYs0EJvsCfntZAojOQ53LQPa+vKq2qz
         /6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768293042; x=1768897842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Dkc3DGT5YgEDWgnx8G7r773Yo9JqPtmdnTR+Qu8ZBk=;
        b=GKrSIxOUqFoSopEsCyROzeCxtVL8u+Dk7VEEz3F6dXDfpiS0qn04gXF2wq+KpK9TbB
         U+HtE1lNdnrNIxD7IZK+BME8mx6Pzc/vI7M5FaboODnLPRxC27A8Nn+SnP2wzaDbPA3P
         qkLYlNni7JAVbM0OpeAmI8VpFdU0e12yrvWQbL0cQ4jFBnBgxUmt1cZp9RP4rBDtGvHs
         wsOT93QmI+ol8Jh++k3Z+l9slHXsMxSIM+8BojTRFFqnlAmRymQSg8Cjj5QH/qNXmbG7
         AaA7F5QgS+glFyl+2VxaA3N3DCLd5t0a71byQYg/jgBvNQzGiwRABJbb1XMGmMNhkhV3
         H1GQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1jCaXUArH4nz67YRBIAno8oMx++9EvKTukAGCSIGbg3nbGFKVfeYJ9UeoMQ7O7xz/84EAQA67diZpD7Z2@vger.kernel.org
X-Gm-Message-State: AOJu0YxMBt6xPeMHePieFBP6TLtIDSyjK61W7wi/09jiOlzhnLCKzqzZ
	m8ZD8rXcl6quy+YAEAoSKBfBTuJPtrlsE1700tP1DAzpqiR/KeOtZ2bd19EaC7pM9NXWwK3/zRu
	kREd1haft4s6lz7MF//JhaOdVV0uPu9yC+FF6sPsKnXxIlth8FyjXqUamqJytsC8rRf6A
X-Gm-Gg: AY/fxX7H5+3cMDt79tcaIRaObmLG5bB0Q1hlIMDra4MmE6KagHMuTSQqg2FERvlESV9
	CyMJfJwHiIRVLj1u+rwLHhs8XTVAqCtVYYgfPciQD1jzlkIq0aqST730Og6HO8isprS5Z2VoUvx
	QlexVcwwAORPEQ7KQXDVSAf08NefAlLbAtLDcTbMtlOZUVwsQOA07Iz6TEX/cPHwmF9+1+YY5j3
	kpKtQ57WudaJ56u/HrgOw0GzbCaWYrVffm2lK55byINadNrz94wj85Ult+6t5Kvq3/nzr4wm3X2
	bramR/l7s/7kf/aeiPNGBwD1iGjSumjcaG8BkQNT9zoIfeCq6Au0cIpx6ripvYZbSpV3Tcym7ti
	p/k0ye2uTSrzXa5oRNhqsX2bvb6G0pGFZeEPHZpo3QaBYItLrCqKESp6rLnLwHGYr7Tk=
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4ffb4a6d91cmr216409581cf.11.1768293042075;
        Tue, 13 Jan 2026 00:30:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTAdv4QgUXhZVd+H7TBbioed5otVPv+dklTfodvZY//62rOLcuJJ3Av/MMaTEINkc/2pz8ng==
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4ffb4a6d91cmr216409071cf.11.1768293041259;
        Tue, 13 Jan 2026 00:30:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b872542f94fsm422977966b.4.2026.01.13.00.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:30:40 -0800 (PST)
Message-ID: <fcc6544f-b0dd-4f23-ade7-4d6f8b6a612f@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:30:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for ECS LIVA QC710
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>, cros-qcom-dts-watchers@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-6-val@packett.cool>
 <wyqml5ywfzwh3uulp4gzlfzx24kb2545w36pkpnz5g27xtnqoi@yywysi37tdor>
 <3dd54179-7a22-4596-a6ef-224530c4b2c6@packett.cool>
 <2f0d6bd9-0786-4445-94d2-5189f6b44d01@oss.qualcomm.com>
 <e7j3hctjlly44pjwe3jvjtpjuj33bdvpyo6pzc6o3q5tjjlyib@7evgyweq2deg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e7j3hctjlly44pjwe3jvjtpjuj33bdvpyo6pzc6o3q5tjjlyib@7evgyweq2deg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TxrqazmzVemhAIZjrm9KkVSRxrIYyBWB
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=696602b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mDM17k1GwWedXxnFom8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: TxrqazmzVemhAIZjrm9KkVSRxrIYyBWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3MCBTYWx0ZWRfX0Dg9KfjWx24k
 Eec0A90C43VL0nvr3mP26xzpXafvQ8spfCjLoQOuT/SorT9xhsnw98N3VEZUBX35givQjHU11u2
 GRm0ct8Jao5U7SJ+TWeUI35SjrxWwOg+kfp5ff1bc/5E09ABlDtS6E8wRp+/cWo0f0KU9qNSflW
 TNdabIF1ZLrOfQKubaOd34WJvBAZplEN7EXMm/hmSx0UQDujMbvkxUp5svJ4cp+DyP+1aJ2x04d
 xlzY1bTt5iTDnIF0NakBfXyt7mWpks3hGZKHJu6L9RsYjEfXLlGmiT6R7bcf+mDm83CgxlaaGiW
 D6N1IVlSJlPSITGkOKmE3WfuRcyPIlcM1VLsrEN15CLh4tUaXMEE2toEwHXhNsAnK6qPN89Mc4L
 TEDVjsHkOVd4bsQAHzIUB59vNRGdvmFzoPK0J9xMHDBE6kAL9U36FH3LDKMz2pN+zX5OfcXslDD
 sqWyABUpy3I9nkh6O9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130070

On 1/13/26 2:31 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 11:50:25AM +0100, Konrad Dybcio wrote:
>> On 1/12/26 1:31 AM, Val Packett wrote:
>>> [resent for the lists as plaintext, oops]
>>>
>>> On 1/11/26 1:50 PM, Dmitry Baryshkov wrote:
>>>
>>>> On Sun, Jan 11, 2026 at 05:35:12AM -0300, Val Packett wrote:
>>>>> Add a device tree for the ECS LIVA QC710 (Snapdragon 7c) mini PC/devkit.
>>>>> [..]
>>>>> +&dpu_intf1_out {
>>>>> +    /delete-property/ remote-endpoint;
>>>> Why? It should not be necessary.
>>>
>>> It seemed to be implicated in annoying EPROBE_DEFER issues.. But you're right, it wasn't this after all.
>>>
>>>>> +
>>>>> +&pm6150_pon {
>>>>> +    status = "disabled";
>>>> Do you know, how is Power-On routed?
>>> I think it's handled by the EC. Keeping this enabled doesn't make power-off work, and doesn't make the power button deliver events either.
>>>>> +};
>>
>> FYI I don't think a modern QC SoC can turn on without PON
>>
>> What do you mean by "doesn't make power-off work"?
> 
> It is basically a laptop SoM in the embedded case, so it has EC and PoN
> generated via the EC.

I got that part, but this doesn't answer my question. Val mentioned that
separately from the power button not generating keypress events.

Konrad

