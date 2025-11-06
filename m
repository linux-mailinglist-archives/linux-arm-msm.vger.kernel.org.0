Return-Path: <linux-arm-msm+bounces-80570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E68C3A3BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 11:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C45B3A2E67
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 10:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB75E2309B9;
	Thu,  6 Nov 2025 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4PKp3VV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFrWSyr5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5678C1B78F3
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762424212; cv=none; b=W/ICIRGjmNud8AC8O4cFllAzqO+SnYVWaAI7Pnuhp1PMHhypjNQL0CygGyntGSn/1xUZ4281BnC2/L40hFx7WsA53vnyKbkS94yJvU/l6m93EHnxRkUczzH3uecz205EIYoEdMPEUfzvZ2pKbXRjl1Pf043GMM5JoqbnscFpCFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762424212; c=relaxed/simple;
	bh=DGWoqCzKmVs/0jZaz2EfOrEZl/PlMpk1s+c9/RziQu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdwCeUN0ULV3Sml8kHxhdOdbvjKSxb8Eb4Pmm8vZ2gGHQsFEpWs6yoc8ZVYVwl9nvrPofOVpgTmk8akHCAE6H4ANUo3mf2FZEaDk7tWVPhCOBoqBZf9awr8/ui7B1qhUHncZ9+nJAKiPdWKPvKsptwZFtu79pYxopA6F+VG55Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4PKp3VV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFrWSyr5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A66C8jv1688931
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 10:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ld70hxnphrhk4Kj9QGrjJNc8gxNktsdj/F6KF/k5xBc=; b=G4PKp3VV7uS3XdTy
	dsvqGawJORmig4RZ49jJ8EuwhGH6kLiJHpm91IYw7JNzhG61Y3JEMqh/XK4EdQSR
	rjiZwffD8TtenicOLftHqmaq48QoXgbOP9cLrgHrIbQB016267qcUh2lbeK5B7Bg
	ws+7DGCG+36jKfx/XJEQzAHVKqoCJTyw7XJbJDCMZrWgnoItI0HsKq537U/dXqcm
	+OpPiSkJnt6nc2l7TJMA+7Y7x72mvE6Mh5J5puF4CV7TM7MWJxkp41ECBwzejqKo
	XJJdbZOZC10TmY80+mNqfoagAnwUJfbBVNVGQdtaQVyw0NZKOs7BkR6v43NSPSCW
	bkRWbA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88pjb651-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 10:16:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-267f099ca68so1598085ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 02:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762424210; x=1763029010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ld70hxnphrhk4Kj9QGrjJNc8gxNktsdj/F6KF/k5xBc=;
        b=SFrWSyr5oMcRZbq2rTKvyc3C5DJ8uJ6gLdsfHO8drUIpb43mUKZK9Ce4AY7UODeHDj
         eKjTWeCgsdFv+KBja+GOcnKt5z4QleOZkrhF8MICdFgf/IM7TX9gIJDafwY4HQS8nd6T
         sYqoKCc8kLedOlP/eAF9g/3WFWUVdsaHNTiM/m7fwMSN3zm3pSl/RTm8X8Zw6PWmj+OY
         Mi7uW0J7KYaQp241rIJ+sDAA2ADWquaS3iZdpGepDBYu3YB06GjN6teg6IkE0IeeUB5z
         V8gPd9tO6cUwjo1R7RVTXHAKNE//gvuUxvDo4h/74XHWOWleKBKDRsAiXrEO4wq9dXdK
         JEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762424210; x=1763029010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ld70hxnphrhk4Kj9QGrjJNc8gxNktsdj/F6KF/k5xBc=;
        b=Q6atDBmQu9GfKX08Sw/fNYFaNU6WlZjuw7DhgoQrPrM16B3vrC5GDFd6KmxBRlCsCd
         pRrDiCZhm/OdsYJKdkNb8e/CnDclcXK7PSEb3yXC+0lDBX9bwuPptwJCmSgxjgcFHuVe
         5e9wyAShk/JJS9eFO2kAYNoHiBzwdWix5VcBTf6VbmyOTT2E9gfQ6wTQogzrsQIEN9sM
         KtvTe+WbIyydr/jT4LN9mVSbi+T0gJhmURlcqcDyvOHsSXXiX6bXr98H7beQ3koa59//
         aJ4ysHr04ZynAi2i02PFWyhX74RSvCogMtyXjrh2TPeNEUg/ndkYUf69gBeR091QkFPZ
         +vtg==
X-Forwarded-Encrypted: i=1; AJvYcCXar804IS1KHFzlJtSWPKFrfB2W/fzFj+BxJNNdNoeL+nTa2amtx6RZE8bERqkEyMWhjn8i9DlDUOXLdHWU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/T0fxXzH9Dy01tKYTBIi1nRAV9m9Id8YZyUL2qwdISKs8fXvN
	GPo1IYf1QsgljrN9v+Utuj7IxtooGNkwinuIrcWFlNk/VI5URMRbT8WwlvJ7GFzDYi56vL9lmbv
	Q+feb0ljGfP/Rvgzx0TTn8kNsugvQInTbyHJkF4XgtKqabn1zQMrUTsFRcKcAlYgfdxTJ
X-Gm-Gg: ASbGncvr++zXl0T44DMWQhRBzKace9sSDrGFNBxVjxp2QOD3OvP6lyGxDdj+DDaiibF
	4u6cHTYVlMBrHz0AMIB2WOmo/9yQnsmAvy70JkeNgYQGN9B6E+InhQZ6BGF3aGwv8lcaRMjL61D
	es/ved3B2Y+cBhJEunIfugn2eoeEz9fbFCgLTduCuLjdi7ij+1IODfmyRzkeTfY0b/IjgygY9q5
	PSLsZYHfG2m7D/T+6NUj+al+N5s0EWyIBF63dau893TLHymlQiqZdcM8KipwVmGqarDcW2uawBW
	quS4AT60TJtDYh3d3KHhLUJQ6J/MiKsnbolhB0vw7caH3y/sIP7Bbnqio382WJjh4/WzlMoUsQj
	VmASNIfsBiQKMbrJoasixzMHFZJt7dFiOVzj7bvgJXnGQdtFUwPtNj+58Jwe4TQB9fQ==
X-Received: by 2002:a17:902:d507:b0:296:4e0c:8013 with SMTP id d9443c01a7336-29655b1d5c2mr21368635ad.6.1762424209463;
        Thu, 06 Nov 2025 02:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxkveGzxOeBDZzm4RdgFR5ZBXc88H70L9ilN/dHlVAMe4qDjUOu4tDtQfp+FEslZh4bwV/SA==
X-Received: by 2002:a17:902:d507:b0:296:4e0c:8013 with SMTP id d9443c01a7336-29655b1d5c2mr21368395ad.6.1762424208558;
        Thu, 06 Nov 2025 02:16:48 -0800 (PST)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5fdb5sm23392665ad.44.2025.11.06.02.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 02:16:47 -0800 (PST)
Message-ID: <b5ecf5e7-4dc4-41ac-9b56-7c52afacb950@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 18:16:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Kaanapali
To: Bjorn Andersson <andersson@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com>
 <b623c7f6-f28f-49ba-b6f6-25084117a6b3@oss.qualcomm.com>
 <l4mb5pi7kz7uuq6o3eueoxl2ngt2sdd6dv3kyudw6i54co5v5h@w6ya2nuas322>
 <ad00835e-bc20-4f97-aba6-e1b4f5e97191@oss.qualcomm.com>
 <f2q7a7r7quq6pplcn3kklwrhdc6hxa5zvc7osygshtyurwyvi4@t5iyragt7irh>
Content-Language: en-US
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
In-Reply-To: <f2q7a7r7quq6pplcn3kklwrhdc6hxa5zvc7osygshtyurwyvi4@t5iyragt7irh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j6nMAci1wpcGqP9jxcnrVR_ua1Kb6qTC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA3OSBTYWx0ZWRfX5fW/ar0g/63c
 vdPS9UUfXNuaG98C/OJYKPBtUwT9uHklCzJXQjidpoKDEYPSy/VtGP3g7xjB+8+T74r4fS3Ut4/
 RK/GP69yFvzB5eirVmKGltWeLq7sC9YAzGZjBkhHGXhTgGLXUURGVv11TTYIdOFQGXKbIH+9kGi
 rJOR5flUA/8zJ+1Q6jak25cLc0rkm+la2BskIs+E+vfB5HDoxgJrBwnjILxqNbGn5Rj8aBfuQu7
 OwahLl9tQL7c06bdU8vdVydK9+0akOQla8KUbPZ/1LInURiBBGcZSypNuMojvEBl3E6+6TWzI/p
 s7pkNVTse+ynEiQZWtZoZavEV89/ejwpskomO8Pl0iF54qmSHxiwTntbeFYL6+tu07cjdmOJn2Z
 xqInXejdcw9p27SwnJNtR5HQDE/ing==
X-Proofpoint-ORIG-GUID: j6nMAci1wpcGqP9jxcnrVR_ua1Kb6qTC
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=690c7592 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ON1wIvcCeMpCzfIEu8AA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060079

On 11/6/2025 5:06 AM, Bjorn Andersson wrote:
> On Tue, Nov 04, 2025 at 01:35:01PM +0800, Jingyi Wang wrote:
>>
>>
>> On 11/4/2025 12:02 PM, Bjorn Andersson wrote:
>>> On Tue, Nov 04, 2025 at 11:34:25AM +0800, Aiqun(Maria) Yu wrote:
>>>> On 9/25/2025 7:23 AM, Jingyi Wang wrote:
>>>>> Document the qcom,tcsr-kaanapali compatible, tcsr will provide various
>>>>> control and status functions for their peripherals.
>>>>>
>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>> index 14ae3f00ef7e..ae55b0a70766 100644
>>>>> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>> @@ -48,6 +48,7 @@ properties:
>>>>>            - qcom,tcsr-ipq8064
>>>>>            - qcom,tcsr-ipq8074
>>>>>            - qcom,tcsr-ipq9574
>>>>> +          - qcom,tcsr-kaanapali
>>>>
>>>> It looks good to me. Glymur didn't have this functionality verified yet.
>>>
>>> You spelled Reviewed-by: Aiqun Yu <..> wrong.
>>>
>>>> Remind for review.
>>>
>>> No need for that, reviewers will review when they have time.
>>>
>>>>
>>
>> Hi Bjorn,
>>
>>>
>>> But that said, most modern additions to this binding follow the common
>>> format of qcom,<soc>-<block>.
>>>
>>> So I would prefer this to be qcom,kaanapali-tcsr.
>>>
>>> Regards,
>>> Bjorn
>>>
>>
>> qcom,tcsr-kaanapali is used to distinguish with binding for GCC:
>> https://lore.kernel.org/all/20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com/
>>
> 
> So, qcom,kaanapali-tcsr is the clock controller region of TCSR and
> qcom,tcsr-kaanapali is the non-clock controller region of TCSR?
> 
> Sorry for not understanding that earlier, but this doesn't work for me.
> 
> It's a bit of a lie that TCSR_MUTEX is a separate node in devicetree,
> but it's always an nice chunk of 256K in the beginning (or end in some
> cases?) of TCSR. But for the rest, there should be a single tcsr node in
> DeviceTree and that one node should be a syscon and a clock controller.

I've been dive deeply on this tcsr block. And actually the tcsr clock
controller part is a very small trunk size(0x1c) of the tcsr block. And
this block have contain other multiple purposed sys registers. So maybe
we can have a more discussion on how to have device tree node describe
this situation? It is not straight forward that to have a non-tcsrcc
related area being described in tcsrcc.

What about option 1 (tcsr_mutex + tcsr_dload_syscon + tcsrcc):
tcsr_mutex: hwlock@1f40000 {
	compatible = "qcom,tcsr-mutex";
	reg = <0x0 0x01f40000 0x0 0x20000>;
	#hwlock-cells = <1>;
};

tcsr_dload: syscon@1fc0000 {
	compatible = "qcom,tcsr-kaanapali", "syscon";
	reg = <0x0 0x1fc0000 0x0 0x30000>;
};

tcsrcc: clock-controller@1fd5044 {
	compatible = "qcom,kaanapali-tcsr", "syscon";
	reg = <0x0 0x01fd5044 0x0 0x1c>;
...
};

What about option 2 (tcsr whole block + tcsr_mutex  + tcsrcc):

tcsr: syscon@1f40000 {
	compatible = "qcom,tcsr-kaanapali", "syscon";
	reg = <0x0 0x1f40000 0x0 0xC0000>; //align with the whole hardware
block design.
};

tcsr_mutex: hwlock@1f40000 {
	compatible = "qcom,tcsr-mutex";
	reg = <0x0 0x01f40000 0x0 0x20000>;
	#hwlock-cells = <1>;
};

tcsrcc: clock-controller@1fd5044 {
	compatible = "qcom,kaanapali-tcsr", "syscon";
	reg = <0x0 0x01fd5044 0x0 0x1c>;
...
};

> 
> Regards,
> Bjorn
> 
>> Thanks,
>> Jingyi
>>
>>>>>            - qcom,tcsr-mdm9615
>>>>>            - qcom,tcsr-msm8226
>>>>>            - qcom,tcsr-msm8660
>>>>>
>>>>> ---
>>>>> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
>>>>> change-id: 20250917-knp-mfd-4dd3c81e6b9b
>>>>>
>>>>> Best regards,
>>>>
>>>>
>>>> -- 
>>>> Thx and BRs,
>>>> Aiqun(Maria) Yu
>>
-- 
Thx and BRs,
Aiqun(Maria) Yu

