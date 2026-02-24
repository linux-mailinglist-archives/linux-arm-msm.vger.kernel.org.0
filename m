Return-Path: <linux-arm-msm+bounces-93978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBX1HRiVnWnKQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:10:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC65186BBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 304833003429
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5260538E5D3;
	Tue, 24 Feb 2026 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiwtkV2n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8VZZJQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5C38E5CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771934995; cv=none; b=YpNXjUTJt2gMa4Mk3uml1sxWr465tGSj0G0w77FLyH+1R3mja60lt9hrz5sei9XEWeEDYHXnMZ86HSNI8dsmQtiufe/KS+y8rvWTQL/U6eQ0OWEDxFiwMlZOQtKDji60W917JspT2Y9W1OmARNC8dRwKD+RBHaMo26J4FIQT5Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771934995; c=relaxed/simple;
	bh=AfOqYjknMePIFE+Z52QoCr/zw+xeW6yW1SGuBhqYl3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShnYpdXcQglcKm/NiQjcP4zF/NmV+p0Q3gd574qLXV17a+cQojkjiY8NphKc9pph+F7EwCXMebSJFbXwZwBKgFjj8xmgJpUKsy1HwXjdy/cVMagyhd2NTeWFrkzkrEWrA5sjJ26rDdNkO3QcHWJwfl+jW9RjAMEwjIyzoGp5w7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiwtkV2n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8VZZJQ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFQxn057209
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j4gCCgG0BuqngRyFLK+QoLhgoiqWJB1YBIfGO3afyig=; b=jiwtkV2n9IK1Y0oq
	zFbzRSXapEk33kD22328KqEVTOCTT6zL+ZAApJMP/LqlfOpdrjAQN4fdmfHB7bgJ
	KPFDt2I4eMsHTmzId9b/xTgpHo03FW4BfSjR4fHnPJyzQlwB59Hn3Mv/pGcu9qlu
	YIwcCAbKkESdSVJA1uCRAsZITmjitGc9IW6b6DcfbGMAxwXi5/U6Mm5TL88lUWkX
	VWd2W4S40JnQrtZN+Ob9neDG2M/RYguwgiLjT48pRuC0zG9YUz+Vm8yTaF6cSxeW
	dwHb4CBu819HP4rCX3BhuulEbTPJK01N0qRLVfCMBHCAYkC/l3XCjbDQ+0R0Ds7N
	9v3Uqg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch9sa8b1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:09:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a75ed2f89dso51441165ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771934990; x=1772539790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j4gCCgG0BuqngRyFLK+QoLhgoiqWJB1YBIfGO3afyig=;
        b=N8VZZJQ5H+5p1tb1mgXVHk1blsxWjJnbPgCaLRLpTtrvcF1E+3rJ9co3qggVNwa5BN
         SRFvu30Uw/Hgy8hxpWuouBftI1kKlBItqstVe5hGYODveenmQd7IgX94QEMVoR4ycuSA
         n9fNF2meUjwefLEt4GUd5QfbjGKyto8aBvwaFQdQOTkvqR5ShKXnJeVfavuT7/GscvNT
         AU0TuebY6ilQvQn8TpZ6WfjxdK+MdCGQF8BBgHU/TBJ5ucVQlWBZEU4ZYTlODSfaIv3f
         Xh4IrUUyCWrFbNRzFqx5k4AsxyZkOxWoZ0HInFuG0vY+/+9VCYfKxYkgUcl9osC/dhpO
         +dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771934990; x=1772539790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4gCCgG0BuqngRyFLK+QoLhgoiqWJB1YBIfGO3afyig=;
        b=bghjMNBRz9yWw2aZt93PwWOH3MX9FAiUjVoQRVWDMAuFqIKMe3o6CAQ+cE3pGyyivH
         jHFZhzyPa9qN4hoDGHC7iBljFiXFe/UIx6/QblaUDj5UgOsXMJ31lxYVMEDkF2Qiz5SW
         hPvZAF7w6ka/JdYhYoX7jDz3Or908y4Y89fFcsflELuQYcub/l/tsipERU9SOL3Z1SYk
         K8n+N9jNfgaf0PfFUU9jyAspbuWSlBuZj2JvYV7XGbWn7Hx0f86GOj3uX5z6RiwlU0Sp
         7tOPiVEb7qH5kDxlCZwz304lJylVnwdy6q1hphVo5/2tFzKtZfmC/0+luw4pi9cQPps6
         BmJw==
X-Forwarded-Encrypted: i=1; AJvYcCUC4ViJ7bUXj/qogh/MQdTGMCroH40HyWTPQeuMU+UYFhP9MYhwV8o6CQu6GT/dyB+JAhIlLlh+V+kUDGix@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj99x2ryJAIvHA2ZZnsnBI5QmyQlWlNDIBfIK4pN1tvPKaylOq
	bCTWGe2zYzBWgHxOUfHsOKfP33zdRvdW6Kr8RhfwwqU3fuhKYloyFm38mndVZbZWlor3hHkubWH
	c0wuv5HD3UaQqJgehbR2ha6nmyyfK9Q6Yv4jzTLNVQoNmXaqw/XEqVWonOt3BQpAmklQV
X-Gm-Gg: ATEYQzxtY1Rmr5uELoMEgJsN9+6i3FR9IJaENN6zoyzNHL9EyLgfsZIWPYECpLriAyG
	xvQBhCAWtgCJd2vB/mJOOv9pmmFujw2oTTKB++H/aqMup4g4CUGlYpKnVDYMOCY/r1NbrZcUQNN
	pwtJ903TTAzUanCml34WwCe/QFc1IBS/Z+5QdANnSqPtBkLTj/ocIODYzxsxEclbg6hodtsT9JS
	ViLgxKO63wmg+RcRNVjSK2EWN6rWrn8L/I2bkyjcm9c1GxoCfbRlzd+1/62YOpZgVcQEG349GHV
	3Tpr2QTrFkbODTkG6I3+LN5lLEjegxl3kq4xjwa2icWB3ErllOCplmv1aCVr0skdXCUIAUkd2du
	3Vl4FQ3WU/TAo6oXnu/mpglvpmcpEGB+peIoaWjfC4UDcyBzuIiM=
X-Received: by 2002:a17:902:ce81:b0:29e:c2dd:85ea with SMTP id d9443c01a7336-2ad74455891mr118333365ad.11.1771934990297;
        Tue, 24 Feb 2026 04:09:50 -0800 (PST)
X-Received: by 2002:a17:902:ce81:b0:29e:c2dd:85ea with SMTP id d9443c01a7336-2ad74455891mr118333105ad.11.1771934989785;
        Tue, 24 Feb 2026 04:09:49 -0800 (PST)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adb1bd6b05sm12153785ad.79.2026.02.24.04.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 04:09:49 -0800 (PST)
Message-ID: <4f815a0f-a815-4b77-a4cf-a4b18e776eab@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 17:39:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-3-gaurav.kohli@oss.qualcomm.com>
 <20260128-whispering-caracal-of-respect-a26638@quoll>
 <36706481-2549-4716-8e6d-0e4db42591a2@oss.qualcomm.com>
 <546faeda-d896-403c-a449-5c9b0cd7159e@kernel.org>
 <17474333-bb82-49d7-bc04-45ab21095c38@oss.qualcomm.com>
 <ae4c1f7e-8f4c-4ce0-a6b8-bab29984e693@kernel.org>
 <c6136314-5bdf-466b-b19e-43062fb11150@oss.qualcomm.com>
 <e6679f94-2648-4d35-80cf-d3f823f9dad3@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <e6679f94-2648-4d35-80cf-d3f823f9dad3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA5OCBTYWx0ZWRfX2idWCuep/gAs
 CuvpaU668CKb/dpgkAsIzlrErowRpzvszS7qXq7ZlHMtodXtWyOHdMLqPQEYKXQAvNodtWtvtFt
 I/M+gN4u7UGntwrSN/4JHkJXuIP0g876HRXCuizXhDLVgOz/s7ZDUNWTCjeFpkFk03Xy+sh3eDC
 TGc0BrRRBWNZ0cU70E8oyYvHvg4MfFn1IGx4+dguSdaPrhSfcMhzX5xToK2szJjKGDoyyK83/3a
 qf6lwmzAcrkhe1XMuSY9SxW8Mw7zhbM35vVav9/XFYrjKozN8eniQMy6RN5OLSaNn23k+PaQ9Ts
 trA48vYuVJaOxm4+g1MlLKjxunyqf7cw9Ii3/uVv/N2QvszeHxAlh2wt9eaRjsLdqJd24Swf06X
 FQofiwrQFVbUTGoH/uyjOICX6fV4PnlqRaDLBJXkdkz3amjprX8wtObg5r1Oaxs01TjJpjy3uj/
 w7kNTzbTg0Cwx5Nhgnw==
X-Proofpoint-ORIG-GUID: cnFPyT_aRbLFYXbH6fWU0e-7KchgYGF7
X-Authority-Analysis: v=2.4 cv=e7ELiKp/ c=1 sm=1 tr=0 ts=699d950e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cOZJgYAoufmXjLtfvsEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: cnFPyT_aRbLFYXbH6fWU0e-7KchgYGF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93978-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DDC65186BBC
X-Rspamd-Action: no action



On 2/20/2026 1:14 PM, Krzysztof Kozlowski wrote:
> On 20/02/2026 08:29, Gaurav Kohli wrote:
>>
>>
>> On 2/11/2026 1:43 PM, Krzysztof Kozlowski wrote:
>>> On 11/02/2026 08:37, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 2/8/2026 3:36 PM, Krzysztof Kozlowski wrote:
>>>>> On 29/01/2026 13:06, Gaurav Kohli wrote:
>>>>>>
>>>>>> On 1/28/2026 4:57 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Tue, Jan 27, 2026 at 09:27:16PM +0530, Gaurav Kohli wrote:
>>>>>>>> The cooling subnode of a remoteproc represents a client of the Thermal
>>>>>>>> Mitigation Device QMI service running on it. Each subnode of the cooling
>>>>>>>> node represents a single control exposed by the service.
>>>>>>>>
>>>>>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>      .../bindings/remoteproc/qcom,pas-common.yaml  |  6 ++
>>>>>>>>      .../bindings/thermal/qcom,qmi-cooling.yaml    | 72 +++++++++++++++++++
>>>>>>>>      2 files changed, 78 insertions(+)
>>>>>>>>      create mode 100644 Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>>>>>>>> index 68c17bf18987..6a736161d5ae 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>>>>>>>> @@ -80,6 +80,12 @@ properties:
>>>>>>>>            and devices related to the ADSP.
>>>>>>>>          unevaluatedProperties: false
>>>>>>>>      
>>>>>>>> +  cooling:
>>>>>>>> +    $ref: /schemas/thermal/qcom,qmi-cooling.yaml#
>>>>>>>> +    description:
>>>>>>>> +      Cooling subnode which represents the cooling devices exposed by the Modem.
>>>>>>> I do not see the reason why you need 3 (!!!) children here. Everything
>>>>>>> should be folded here.
>>>>>>
>>>>>>
>>>>>> Thanks Krzysztof for review.
>>>>>>
>>>>>> Each subsystem may support multiple thermal mitigation devices through
>>>>>> remote TMD service.
>>>>>>
>>>>>> Because of this multiplicity, introduced separate binding file.
>>>>>
>>>>> This explains nothing. Subsystem does not matter for the binding. My
>>>>> comment stays.
>>>>>
>>>>
>>>> thanks for this suggestion, we will use qcom,pas-common.yaml to define
>>>> bindings and avoid creating new file.
>>>
>>> I asked not to create any children nodes.
>>>
>>
>> We have multiple cores within a subsystem(cdsp) and each core has its
>> own independent DCVS. And also we have dedicated TSENS sensor placed on
>> each core within the subsystem.
> 
> Your own example in this patch had only one device, so how do you
> imagine to convince us with incomplete or half baked code?
> 

Target of this series supports one tmd per remoteproc, due to which we 
have not posted examples of multiple tmd. Can i use dt binding example 
sections to describe all tmd's per remoteproc?

>> As a result, each core requires its own cooling device, which must be
>> linked to its TSENS thermal zone. Because of this, we introduced
>> multiple child nodes—one for each cooling device.
> 
> So you have one device with cooling cells=1+2, no?
> 

This will be a bigger framework change which is not supported, i can see 
other drivers are also using something like this multiple cooling device 
under device node, below are few examples :

->Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
   In this multiple fan child nodes are present.

-> Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
   In this multiple child nodes are present, like heavy and light.

Please suggest if our current approach is fine or you want us to 
implement in some other way.

>>
> Best regards,
> Krzysztof


