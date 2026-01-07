Return-Path: <linux-arm-msm+bounces-87849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6B3CFD5C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1C9E3012CEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89607302773;
	Wed,  7 Jan 2026 11:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QE/qySh+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjS1ZapB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB9622D781
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 11:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784650; cv=none; b=pTtgh7StFDkREBVAo877SCQ7VPUTt2ukh0gNIPeEmBNfsvkbm7aWGyzjUs9ZfxQQ+uQmqAe/mqBZsk9z7EV9g2WJvoe0B/iD3BnGyxScg2MhlrJs93wSuYC6oGcUHD+nnydRIQDvu3FJa2B4zi0UHNgUT3h9FzoPzcwY0bl8S0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784650; c=relaxed/simple;
	bh=9mAdNDIJgv+4rLdoypaDwamOB22A/39ZpQ9cwRkWH70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n9KpgvA6jqN2IkMW93KNAMvZj9+cMeOq/xpdbHR8dBFyGMAGxTXwJBPQdkbGd9tqJd+6nIXYQsOoJP1sf8zCnZ7tqPpcpQB8Sj1rE2k2aS4knEl5Xt0uT9wVdBCxsjttEd7Ju6oVNk8tuzHpCE/BPdOTFJCv52Yq2Q9C8qXwFds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QE/qySh+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjS1ZapB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tIbS2378928
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 11:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jNFexHMElP/eh64EfUaNsW/yrveC3iyG/o35GAb4Vw4=; b=QE/qySh+AhTqFYP/
	e4+xK92VJzltNtErCNNK0WNJThaQqbIs28X5R+ZZxT2Q2Rhyv51Mc8ZErneES8OA
	REoKgOqzYeB2S1bDbrF7HaL+7C3plFol8+tfs4TWvwso5ZmzL/Rrj8b/WGE1/IwS
	Xdqa5hF6x/WWrVQ51gQChrO0gNSfMwfXBsu3kfIKLFLoGwoodQGohHjXZ/FrHZpj
	7cpY4M+JW3dRCHmOeQtDGhUrCuDCRX6M41X0xIxO18ASU3/0D7/EgO9g4Wus1HL/
	oCJCqviMwJxn1bUCyfeodoNzFnw2iWx43tYhO32+Dh5CWPbypMZG1NSoFXj0OGNW
	zlXqXg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4ru4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 11:17:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1aba09639so5120391cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 03:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767784647; x=1768389447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jNFexHMElP/eh64EfUaNsW/yrveC3iyG/o35GAb4Vw4=;
        b=WjS1ZapBee1zSVZKMiqDVBnbKJh2t79YXBUK5cUnrILj2j4tFoDN8GVPNLO9bvZGuu
         HiozKkIcDrKscO2AtyTl98GlUG5dTxVRsQ3qDcJgQJKa5E2cbloYcfeExdAsNiKSB7Ex
         TcIS1p6VTK+USYQunnIlIZWAN8qrHzJ3CViBMaaFPRyVbxtBSaUMSU/s8l89Tqq0roB7
         ZpK+wi02XcsVDCscSAIm3UogR9lUFSA71mnoxr+utZULduphZJgNH4aJ4hEWmxgWx3PD
         lWr8WZ6t0Eh6gWEujP3aiU02zSyjX85F+E8nyExMSHpp2SZeRN2b+aU9r/VFAUUNJxbE
         2Iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784647; x=1768389447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNFexHMElP/eh64EfUaNsW/yrveC3iyG/o35GAb4Vw4=;
        b=huOLT1JHGZzytRWV2BgLgBQq+xgw7St7uJyaeF+xpnmj8R9eLUkjetMnsYyTfJFa6E
         2bwZEJ1AMJwMgCgwh1tfvJlRw0POlrTvtHajPz2tltp2UgAtjMkrUOx/N4K8pzG0zt8/
         qPK274NWQ/NqvJlBl+nY4NVwdA6+p0rZOUiXDpfoP4L2izJtpCM+FTL68ZLsflOpfvcj
         BTGhAS2pnntnoVu3JR+xi6OFqU67nXc+p3CVD6lWHyEIk5ns1eAZx5D24ce+mrx2JyyC
         B+gU/u2CRxOXMC20ScuT2qPTmsy9qFWZLzGfmsc0LotNTUlqufV13fTjpoGROoxXyzIc
         YeYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJkIca+WzKJ1+IEhd2rIQrgx5QwaIbLnTq+hhJ5fFhjPlBZR0n75d4fdHpNu6mecOpQBBXoxv/TTT4zStE@vger.kernel.org
X-Gm-Message-State: AOJu0Yytx6o4uCiAHHruElUGTemqpFJ8TSnZulSNlJygb812Fhova9fP
	YGjvjgXWXtz7rpfXfjH59bZaAqVrwzQ6xfn6lo8ACj+bvrd6dg0dzqIik5zpGCMma24BGS6YIsm
	GKXbHxKSFMAMYQRF4XuY319zAHRZMYikppoAlbvkS17/duTi8Ac0RDCHvR8iT7ptKTne2
X-Gm-Gg: AY/fxX6W5eJ3piyTSGx5lNJnj7jyiM9q+Hv245q2IyLDl/j7dTfbe4PRNqo/nfV37C4
	sn3YOstlZnwKA4xTG1IdVDt5Dum171iyklPOMYOo04d4smOUsVoxj1Gu9qlGdpEFwzqZS2HTn1g
	kfOeO8tK/WAb2HFoMJNVWJshfuC7BheREnsD3l0RVsDF/qjHu8AT8SESvWHXFl0DBFzzHNffiBt
	0hwidGLaPEvcov6mXFiqGSCwqM0X/t1XOrYTni4Q8MI92iRsNr8rsTf8SHg3Rtg6HizBpXJ6y72
	YAkEieSN9mcDeFlcEXxazYAOBUATyB8v1npoGpvfE6XcrC5HoSeo3wzLDCi+oZqhpJ6j7o4kLUl
	fLR7C2s3NuHOXoTJQUo8g0ha/pvvkBTIf3V+9Uau0oywuJQtRGungg3odEydtA475snI=
X-Received: by 2002:a05:622a:408:b0:4f1:d267:dd2b with SMTP id d75a77b69052e-4ffb47d22b1mr20927871cf.1.1767784647330;
        Wed, 07 Jan 2026 03:17:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNwkQHX0cG9X3z6KTIYOzAGSXI1HFdFOV6wQ4AsJ8H1AMcH2qgOZs2czsIMf/c6Oz1RrMwjQ==
X-Received: by 2002:a05:622a:408:b0:4f1:d267:dd2b with SMTP id d75a77b69052e-4ffb47d22b1mr20927631cf.1.1767784646904;
        Wed, 07 Jan 2026 03:17:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2ab77bsm506318966b.25.2026.01.07.03.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:17:26 -0800 (PST)
Message-ID: <49ce6fee-36dd-4e0d-b2e2-b516b16a8b25@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 12:17:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/5] dt-bindings: arm: qcom: talos-evk: Add QCS615
 Talos EVK SMARC platform
To: Krzysztof Kozlowski <krzk@kernel.org>, tessolveupstream@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-2-tessolveupstream@gmail.com>
 <2e533b51-399a-47e8-bc3e-ab61797d6762@kernel.org>
 <f6ff2086-19f2-46cc-ac89-d8ef3847b9f0@gmail.com>
 <d23e3693-0cf8-4b31-a3e4-e562621911d5@kernel.org>
 <dce7702f-e845-4940-8679-a8d80563988a@gmail.com>
 <d9267c08-4470-481c-b56b-390627e9e61e@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d9267c08-4470-481c-b56b-390627e9e61e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e40c8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=CTcOtzCkzeiXT-Q_KPgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MSBTYWx0ZWRfXwTGZJzxX0PzC
 cOHZdLcBYx04kyeJlT6mf0De8SIH7h6eltar9y2KfD7+gla4fgHS5CAiFBCCCNvFq9ofOls+ZOf
 NmI8xIbCZyHjsIakla0jrfg7pGXWbpqwNhT5OtNxpndRiTQrJVnbc2fZTfX6UdVblcqHOHqRiX2
 bfH8eMyFxBFGOiPfuKXKUtsb0nsIefBW8IGGNjqNm2chxpkEsPblG3deuD69JnyRteO2XRpZvV2
 OTDA0A8Nidj9iIJQdzcMPTJZWkI5bcsp7UA27fXAbPUwrD15Q32SwxPA9satfaAFfM1796YMTVS
 jCKUSAt8I2/x3ORzcfHkn5Wtjc8CZaEXqjlNogGIbkx1RF48+7BIhxNOQu5hrmyA74M008aGdUz
 KRkP3BA+ucRujW/JDBJ4sZR5Q8GyFOeDxAFSXWykZlmg9Z/yRw3p/VRiywIVCBEPtrUKT+jsEB+
 tMgitn0xrCnTUtt+3xA==
X-Proofpoint-GUID: NRTYAwzp-O1JpR92LCfmpWnGpM1rnVzV
X-Proofpoint-ORIG-GUID: NRTYAwzp-O1JpR92LCfmpWnGpM1rnVzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070091

On 1/7/26 8:20 AM, Krzysztof Kozlowski wrote:
> On 07/01/2026 07:58, tessolveupstream@gmail.com wrote:
>>>>
>>>> I apologize for missing the Acked-by tag in this version.
>>>
>>> How missing? It WAS THERE ALREADY!
>>>
>>> You had to explicitly remove it.
>>
>> While updating the linux-next kernel source and reapplying the 
>> changes, the Acked-by tag was inadvertently omitted. I’ll ensure 
>> that all previously received tags are retained in future revisions
>> in accordance with the submission guidelines. My apologies for
>> the oversight.
> 
> 
> That's not how you work with your own code. You rebase onto new next and
> then only update trailers with b4.

JFYI Sudarshan, there is a neat oneliner to do this:

git rebase --onto linux-next/master $(git describe --abbrev=0)

where linux-next/master is the target commit/branch to rebase onto, and the
second argument is the pointer to the start of the chunk you want to rebase

Konrad

