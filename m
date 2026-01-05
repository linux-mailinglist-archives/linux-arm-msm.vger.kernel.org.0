Return-Path: <linux-arm-msm+bounces-87356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9330CF1904
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 02:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 099D63005A88
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 01:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BC52C237E;
	Mon,  5 Jan 2026 01:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFTfOn3C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SN5QNP3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B036223D7D8
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 01:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767576853; cv=none; b=l1CoaqteVOyoCvCdLKltuOXsdSXTnum7BQu3dRu7rE8tPgUStM1vMz7uOn3tyJ4b5pqI8KN+J8DdmcJxy0Tp3z/1UNMGb4Zl4nu8IP8qnaHuFXThS3syjqsL5cvXkfvm6DsMOLRcPQ98nri7EKMkb4MfLo9PHAtZmQzddekwfGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767576853; c=relaxed/simple;
	bh=IGm6aXWiZZ/XZSfn0JNKIZmBWFFh8AnQnq2fovA5sWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bd64OJZsXY5Jz/D6y58uqHV3mjeUfXEeUomvlbLevGyOhiE9qVj229aEL0+jWUB1RohV6rnQ3Uj8KY5+pp/vtMaa3GGpNHZO1fJAK7xJt+mAgYDbhuMiEhvJu0N7giLerIl03Wtb9wAl+qtla3XtCu1dXF0qw3Ev/8OIFzubhQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WFTfOn3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SN5QNP3C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604MhVrC3622804
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 01:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6tuYxtSJ3jgyVa+7fnJ/tPQ8W2cf3H4jb98mjZUZblY=; b=WFTfOn3CEGwP6HQE
	xnDcP1KOSdE2XN2QhyrueO4EbYCLH9QGapZW3qdqsgpIt2+HdDatnb1mF5ArMkt0
	unZ8xXV1DnsXUoSQXFMSCA5djZLmJtIPpHqoa5FeLM62DdIl7cDqcOSmgp4aP0r9
	pL3VYdR7TRkUGhU4byyx6RtveC/Y7nD8WC2rCwttP+BS9V1Srv0HsuLftC7aSdk5
	W496pbgcC+pzz46H22DcN6qPRlhoKaLHIQxxzlsWc6WQyotiF8EgAdeU03txQ1In
	JC4kfgFZu2L6A1FTpTw4ucXyqZDbq3v6/6HBdVHVjtcoBE397wfZ7jbW34VQE3xZ
	IJI4Cw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qtw7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 01:34:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so30442783a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 17:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767576849; x=1768181649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6tuYxtSJ3jgyVa+7fnJ/tPQ8W2cf3H4jb98mjZUZblY=;
        b=SN5QNP3CBIss7xq9Cot+JLUdlONXMcTBJtd3oS4GHowpLUMnU6MfRQXvgybL+lZ2to
         D58kwUIEkIE1CacI928JPgEeqkGq2+0Fq+AzNdJnVFLZUAKKWhHMJQfBa6TLoE5uAtZh
         IicVDSm5htUh3xuHT31jn3BOqeEz+ah+5Gl1fuL8aS5m5ii6wlCn2n9IDDcp2/fRdnqz
         shLnt2w53Yf8jhMaTRGDFe7VnBPfYjv1W4r9l3t/b4853wayZFyJty9IKNRWaptW26yg
         JeAHqFFgZOXOz75kzR/Squ/ZFoloQUqkfgn9dpzp9Eg/CO5owGdjRXgiFxFunijDB4E5
         m5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767576849; x=1768181649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tuYxtSJ3jgyVa+7fnJ/tPQ8W2cf3H4jb98mjZUZblY=;
        b=kEXdM3LpurJwXwKnlU991i0jf+5Mld6DmX//8139JKZtby2kiZyt6Qfxat1dSunx+6
         n3IElXQyCeUNE/DapsQE4tTrdCqvL4m4cbyUccD4EMsHgLcupH6D95RLY/L5zcAmhRyo
         TkTrH/nNEKyxCGLXmXGoUKvwCJ2DqYzizxdf/8cI7WS6GXptMC+gkGx1H6RnuitXFGzy
         a8j/uL5FmnaGEHI9rgsYWhg732x2w+ChX6LQSzMtbk1sClaCcloCxhd6nt8zumB8wbEc
         E++yoB7Y8FhrdLe6+v0lfbuMdTuk2HT3IZG92NXzkjo2O6HR4Sfaq64IFsP0eeypS+tx
         X3LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd5d3g9hkmtRZOOHnEsJ1lMDFiS3fF+fM63jdR3xrTSYUqmprEkIthMw1d4dzHSkkKCtCg0zCf5iJiix/z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9k/r9Q4CY7bSwr0YHvuGHz9cSgFIsM1KbjNW0sV/DpVhFztw
	hNxMCjYKTfRmqSrgnuOBbmOPQblaIWgeESm1o0b1WAEodkP4wIHsbUAF0txlT+acTKpi+WLySod
	cDq37e1LO9E5IwC3f6FmAD406m9IOmZ+HQ9xlMXPGLWJhoNU6icN9tHAHPpKBdGZ1HmJszTbi85
	4R
X-Gm-Gg: AY/fxX4soQw+QuFzrDH35mHqDPEqJ3lTfmmlsUrn4f3ELkKJAW1X7441/2ZjNZGkqGg
	V9g6M6sLX8AaY2Rly/zsBaYb19+/WmmQF57FXvXMTCf9mE7wuOP6f2D2SHIitSZYKsoPVOR+F6+
	jSdzo2rHSaWgqyn0eOcuQkDykRwbjz6sSOIxhPEfobhVsJOheLUEscUPIYOkbugqn+JlymORdFn
	6L7bV0sJ5Ruh28m0HxZRI3WN9kj6Ni8lOMUyapvf6CGZPNNYR8PfvTBcaeNTzEeVYN7USWAJ6eq
	R3NrO+cIixjFAcyNL9I5AIHx+1FytCvPZwv1iTHk7On+YLyRaKiDcfonouXw5OCG+ezLDYajeWE
	EQ5+cHUvwyyZRzshIV5/Iq5m0zBflcWrwRw2kp+j9a34irYkqe6ePxlYKgLg0Rpa8qDk5Njy1r2
	0=
X-Received: by 2002:a05:6a20:394a:b0:35e:7605:56a4 with SMTP id adf61e73a8af0-376a9de58bfmr46505625637.51.1767576849039;
        Sun, 04 Jan 2026 17:34:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHB97Uz6BLRebEcWCQq6sn6vCRFtbpKIGtOpQyt/EzPp2umNX9MVpttk4y6nc1VCysgvb9pIg==
X-Received: by 2002:a05:6a20:394a:b0:35e:7605:56a4 with SMTP id adf61e73a8af0-376a9de58bfmr46505607637.51.1767576848553;
        Sun, 04 Jan 2026 17:34:08 -0800 (PST)
Received: from [10.133.33.149] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4776df4esm4428132a91.13.2026.01.04.17.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 17:34:08 -0800 (PST)
Message-ID: <ba4f1e15-789e-4838-9d44-8cbf2cbbd38a@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 09:34:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-binding: arm: add CTCU device for hamoa
To: Bjorn Andersson <andersson@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
 <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
 <076f6aff-4f9a-4630-8e5d-c11f0272de70@oss.qualcomm.com>
 <kvvagn7badh2q2y5pmcp3m2pvazmax7xwuumr36twekagvdvs6@odqinwynfvjm>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <kvvagn7badh2q2y5pmcp3m2pvazmax7xwuumr36twekagvdvs6@odqinwynfvjm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XiGOLJz3CH_r0ok4KrtO0ptUxNtY5MKy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDAxMiBTYWx0ZWRfX+TxtB7xhtABR
 M76lIMYsUDIqyHU1zd8PdI6wLp1NQeb2tyTreQQSMrW1HevpH6KvIB4RqgMp25/Xue7D4W2cE6R
 2PM8RCj2ABsixZnzB7lXtSdWwa5yZRsHaZKLTKWAANCNlK6pNLhrawdberj5ZGblNm5cSDLgI/j
 0zusZFz1OuJW0OAWCiKdy3iqeRbJLSqWB4KTattO27j1isktjDIoxwPQrtNzZYHa2lBv4bGyyX/
 Uil2HVEd3P103+aJoYDUAN4jllIoAbmgddzyqX/0NzyebrfB88VX2mWZoGayaCeGT0VoBF/Pdn2
 uk3gAA3WhLTQV6T9SPrM3AAPE3M3uCi70/BfOTt6eEpPaVoUKkO0a/V0SjpMP/OPK4Yj192d9Nz
 U1TtTmFfzlxh0Ag7qeJbu9EwD3NggVGHs9XvKhbeHC57GVkqVi1BF3OwlXvxg4XbzkSt1d5DF0d
 FpoFrNUUP3+IToAUXjA==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695b1511 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=ye0mpR1ifiLF_JCK0RUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: XiGOLJz3CH_r0ok4KrtO0ptUxNtY5MKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050012



On 1/4/2026 1:33 AM, Bjorn Andersson wrote:
> On Tue, Dec 23, 2025 at 05:14:11PM +0800, Jie Gan wrote:
>>
>>
>> On 11/6/2025 9:57 AM, Jie Gan wrote:
>>> Document the CTCU compatible for Hamoa, enabling support for the
>>> CTCU device on the Hamoa platform.
>>>
>>
>> Gentle reminder.
>>
>> The dependency[1] has applied and I have tested this series on
>> next-20251219, no conflict and work well.
>>
> 
> In your previous reply, you're stating that you will update the patch?
> Are you saying that whatever concern Krzysztof had is now resolved?

Yes. Krzysztof mentioned that the patch should include the info of its 
dependency, as this makes the review process much easier.

Currently, the dependency of the patch has been applied, that's why I 
sent "gentle reminder".

Thanks,
Jie

> 
> Regards,
> Bjorn
> 
>> [1]https://lore.kernel.org/all/176615287813.688536.723538049922655005.b4-ty@arm.com/
>>
>> Thanks,
>> Jie
>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>    Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>> index 460f38ddbd73..57dede7a90e9 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>> @@ -29,6 +29,7 @@ properties:
>>>        oneOf:
>>>          - items:
>>>              - enum:
>>> +              - qcom,hamoa-ctcu
>>>                  - qcom,qcs8300-ctcu
>>>              - const: qcom,sa8775p-ctcu
>>>          - enum:
>>>
>>


