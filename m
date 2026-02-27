Return-Path: <linux-arm-msm+bounces-94383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF2DNykxoWkorAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:52:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4151B2FAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AA82306B39A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B7D3B9613;
	Fri, 27 Feb 2026 05:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItmivUR2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hHMKPqnZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D0B362151
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772171556; cv=none; b=RRPrb/vEY9UXSUWT7FbLpdnBUpHezBteNRg7yrEcmT110IlOLWB5y5zhgnFC8U2ANTGi+XCmiYrnXKoKb2zKwxN01+DMZf5M3TVeDeIoHKyXlMsClMAh2p1PQV6zDgTbBDzZtxGRYiJsTwZxRBU1ivFERz7ULoskEPOzxNt17hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772171556; c=relaxed/simple;
	bh=yYeK0ZjLZHsr2znKHdIhNJBApxnwX2qEDu8dzQsco0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVpAtaZVmaP0ZjB6/X8KjaVCMcATTRIj4uaL08YxsBEGNgvATw8YkO0JvidnA1oKjscuhNh4kmGinIsuUvU3zJb2qHJ7wKJBXhgZwsJlc9xEXcciMGsmevAaXBYBAQ5MMWm3ReWNuYrgHNQm0FpHwPjZMlajd7jaKN6HIleetlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItmivUR2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hHMKPqnZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K6r32353533
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyMIJZ8Zx2zq/4xYD9pkY40RWJVVCKl3DKTScMyYyR4=; b=ItmivUR2PIICuypx
	APjSRxQsJdQpscf+oNbMredN0aUNN/rrnd8O+QZDoRpO5mwQeb1w3lysx/ECcmTo
	9G5fxFOGloUzzdnRo/qraqZPOOCOJfLd7c4UYYl4ekGK697ozuwsu1Czy9mVwvwi
	pl0J/aNHh+kthQbNXLUPWP+ZW6+eMUQaXFFgtb7UNA8fOu4QQ2Yv4ZhZYNJc1cUJ
	6EFUds431hsAwVNOP9Atiflkw4ASzGTm29+3rjHd7L+2ei1pJIuaA2T1tIcaBF4E
	uspu+eN/xe3G8peEI8EARVoY6W0boYWVFZu4jfjwWk0P7jeiQGoJXYQ/UZ7xEgay
	4BaLyg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u3gar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:52:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8273f4ed107so770497b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 21:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772171553; x=1772776353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyMIJZ8Zx2zq/4xYD9pkY40RWJVVCKl3DKTScMyYyR4=;
        b=hHMKPqnZTTbIKXj97dP+8w3edamaEviFeM2UfPij8rZOFYmqKIORn66/o2msQMgzyg
         DOZ5F4fzmbbnV23gfJoclghWYxvVrYZh8by75A582cC0TZB+DMJsXZ83yUqYoqJLBEo7
         k4UgLMfpYQsyOw8zcc+L0lN9629KT01fYk7wEas6tiO25Wv6JEn7VvqeS7Ks7Wisg2+H
         2cyQbAav45UYGv3E+eD+Bl3kuQPriI84AquqPH9rrF0sGJqggeMF2A2aFnabE+to1RgT
         Y3sGkznn+5RdBXYPdrAzBN9XmSj+LwyYjoVulR639WuFWopPipfc0vfEfssEwSz9jyeX
         UjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772171553; x=1772776353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyMIJZ8Zx2zq/4xYD9pkY40RWJVVCKl3DKTScMyYyR4=;
        b=UDsTfNjJotTD3qGsRS3y7QN/zKS1t1hKYhNxJTrZpeqEhHUfzDjRTUqRRUR/yzxRaV
         02FwTsV4jikM/gY58QipLrvhdfvFsgiJc/SzxRxwofqApCEMPSW994CEdzjBr0gHKhlf
         04wcOs6M3gvbN5mQ6ha5gom17/x3bIK+AeloH7CEVWaovkw1miJmwZeq6YEpGtM/FA1G
         PB7Pbtx7xRah9GUyj+cjwjlY3Z3Ie+P6ghOctfeVXunhZp2woTvsDtMrkIOP9uA9AgPE
         11+fGs+9NZt1NgvK/mo/j1IFzygOugPcEbV8nWZw/O+z8TMfr8M+CPKfDGt39tVvg6Vm
         ITxg==
X-Forwarded-Encrypted: i=1; AJvYcCXnd6hW3bpwhRxYOdTfVxhJfbxy3bLhBRsnnYk1fOmlYWRSexYynPILy9uz7sDAWt8GE6XQvbbKUIS+dwgm@vger.kernel.org
X-Gm-Message-State: AOJu0YwmFMNrpblbSGtBwt2DNqPl/4lLkYVtwkfOS487CNVqSR1djmbL
	MihoHiGd4HLMQQJuIjDZuzfyktLhdR1XD3DcHwi+b8oN/gna/i1b1ptap0WpaMehGjquBYJFyu1
	ZsW1g7tM9c6qRug3CQCUJGTOOKc2Tlq3PUxVlnvewCOc26VUnd+uV45TMfIZr7wWuBcaG
X-Gm-Gg: ATEYQzwoLH/1DcifzYZH0PqFaiafzp5BZGZ9ET4UTnjL9hQvpl2r8HXxJQbqK5vhKCt
	OuoR8+eHZqFPgZUEa97uyGEYgSTGuK8u4V5IlgSXzKzNkNgnRSnk7/vqmw0hXODkITnAcCBOkfY
	iDs5bJD+UW7qfhMWGlWMP/I1opuiCYuMQ/xbtfCmebgRTYhx5IkU09wbSlxMIiZkUEwP3N3yttP
	zj7hcV1xkT2dtvbrHXoJ9XkFm7SSn0XI/gYFSFw8ct3lg8skzfz3eRCQ6J0rZPmI7/UE4EuGLHp
	g22hn7emFt/L+5YeXC+OQ9WNFg29rtTukXQAH8UTbsvgVYA+2E6JuL/Ebd8Q6dFC9JTvvB+ZXSO
	fI7s6YnqrSv6/rN0PesvrrMOEOyxhEc5wbA6KcCsrcp9ieZOzNnhcCE5zw5F16YKkO84RlPNeCX
	E7YKHLs683xklpNx0Y
X-Received: by 2002:a05:6a00:a247:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-8274d99c2e2mr1585065b3a.20.1772171552370;
        Thu, 26 Feb 2026 21:52:32 -0800 (PST)
X-Received: by 2002:a05:6a00:a247:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-8274d99c2e2mr1585028b3a.20.1772171551773;
        Thu, 26 Feb 2026 21:52:31 -0800 (PST)
Received: from [10.133.33.121] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d544ffsm4085637b3a.12.2026.02.26.21.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 21:52:31 -0800 (PST)
Message-ID: <22273aee-73b5-4747-a2d4-6edce5102092@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 13:52:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: remoteproc: qcom,pas: Document pas
 for SoCCP on Kaanapali and Glymur platforms
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-3-5b09885c55a5@oss.qualcomm.com>
 <20251223-furry-mighty-agouti-a222f7@quoll>
 <ae532ff4-1a96-4dc1-9fa0-81305624c9c9@oss.qualcomm.com>
 <f4ef4a57-4192-4dbf-939c-46efa13c0391@kernel.org>
 <aY582M8dgOrKW39w@QCOM-aGQu4IUr3Y>
 <e3dcadb3-0239-4a49-a5ee-3c20ff97ea4e@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <e3dcadb3-0239-4a49-a5ee-3c20ff97ea4e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0NiBTYWx0ZWRfX/xD22Cd9mawr
 MP3GAUtjFkKo8gfIqlUZZXnneOHrkpoPEh09vYztvk0jxtqDB/f9EbM3OYyE888+i1wHgSK3oYw
 37BhRc2FKkI96M/Jn9bSB3fSutSo74RWdlQIXaRh+WDPH8uDkU0THDLTk8LPTjQOPYmGCD+Yq7E
 CyOoxwrZq5GLBblEzLIyHbZGm/KQA58v00ePZgV2MiFE1pHPgrQWy74JqiNrD5sKktGugwSZcYD
 gieNpipht5kfsd4oW1iRXAh89LdVBo1+8oP6wqucqO0Rn7IaKbMW6+DPTJF6Ffq83nohWPs1QbA
 klQDzZvJ6W87hunEvNhdRprSDimJ9miUINbRNvmTehrtDs8mPV5N7+J6926OjERe84EBMguOZ8D
 Mu29iZteJU7CiBZoUMvGKHqae2A36XkrwtOCSnoq38WTZdHXliC9Yf+Pe5A7MIZyQnOljAX6UJF
 xdQWH03iTJ+YzXsW/Sg==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a13121 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Tx65_vTwki0hZNA2rn4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: c8z3YHNeDUNanFoTYvd9LeSGoOwX4cPY
X-Proofpoint-GUID: c8z3YHNeDUNanFoTYvd9LeSGoOwX4cPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270046
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-94383-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C4151B2FAF
X-Rspamd-Action: no action



On 2/27/2026 1:12 AM, Krzysztof Kozlowski wrote:
> On 13/02/2026 02:22, Shawn Guo wrote:
>> On Wed, Dec 24, 2025 at 09:34:30AM +0100, Krzysztof Kozlowski wrote:
>>>> the interrupt for soccp is defined as
>>>> "wdog","fatal","ready","handover","stop-ack","pong","wake-ack"
>>>> while other pas could be:
>>>> "wdog","fatal","ready","handover","stop-ack","shutdown-ack"
>>>>
>>>> so grow existing list is not work for this,
>>>>
>>>> In the v1, got your comments to adjust pas-common.yaml for the interrupt:
>>>> https://lore.kernel.org/all/861b6ede-f168-44e6-85bd-10cf04dbcec7@kernel.org/
>>>>
>>>> and in v2, interrupt are moved as part to the "allOf" with if-else and
>>>> also got NAK:
>>>> https://lore.kernel.org/all/20251030-venomous-apricot-falcon-b3fd64@kuoka/
>>>>
>>>> Could you please share a example for us to understand how to maintain it in
>>>> pas-common.yaml, not define if-else and has strict order at the same time?
>>>> That will be very helpful.
>>
>> I guess something like this would work?
>>
>>    interrupt-names:
>>      minItems: 5
>>      maxItems: 7
>>      oneOf:
>>        - items:
>>            - const: wdog
>>            - const: fatal
>>            - const: ready
>>            - const: handover
>>            - const: stop-ack
>>            - const: shutdown-ack
>>        - items:
>>            - const: wdog
>>            - const: fatal
>>            - const: ready
>>            - const: handover
>>            - const: stop-ack
>>            - const: pong
>>            - const: wake-ack
> 
> This is good for pas-common, but you also need in the same commit update
> all schemas having $ref to pas-common to have explicit list. For example
> milos has six elements and your change would basically allow the sixth
> item to be pong.
> 
> Also several files need maxItems for interrupts, since the upper limit
> is now 7.
> 
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Here are our understanding for this, Shawn propose:
Option 1, use "oneof" in pas-common

we currently have following files having $ref to pas-common:
qcom,qcs404-pas.yaml
qcom,sdx55-pas.yaml
qcom,sc8280xp-pas.yaml
qcom,sm6115-pas.yaml
qcom,sm6350-pas.yaml
qcom,sm6375-pas.yaml
qcom,adsp.yaml
qcom,milos-pas.yaml
qcom,sa8775p-pas.yaml
qcom,sc7180-pas.yaml
qcom,sm8150-pas.yaml
qcom,sm8350-pas.yaml
modifying pas-common means we need to add explicit list in each file,
(also we need to add constraint for smem-state)

To avoid affecting the existing yaml bindings, we assume below
Option2: have a new common file for soccp yaml with "pong"
interrupt along with 4 corresponding "smem-state"

the example will be like:
kaanapali-soccp.yaml ref with soccp-common.yaml. and the common yaml
will be very much pas-common.yaml content, while the interrupt and
smem state will be updated.

Could you please help to have a suggestion for Option 1 or Option 2?

Thanks,
Jingyi





