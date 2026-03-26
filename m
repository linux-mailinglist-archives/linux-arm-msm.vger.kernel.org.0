Return-Path: <linux-arm-msm+bounces-100154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aELiBAqAxWkk+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:50:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7A433A676
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BE87300F78D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270FE33E36A;
	Thu, 26 Mar 2026 18:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nElMNEF0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sfk9pqEq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C370262FD0
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774551033; cv=none; b=jBgA/bGWLV05n/pukfp2H13PjOHNSUIN9XV6aW+b7bvyN7ZyCTn0VV7wYrYKipaqtKFJwtinWMaRAbPfc0RIMbTlBPTzPrPOXlwO0BSzLg8GW5YcVf69Hd0mqtrCPCmWuux6H1Z25RmUKyWFNBUzirnHyyfklPwSiYYnips5Xk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774551033; c=relaxed/simple;
	bh=UeXvESmWG0Z4wemNV2lt5hHzVTotDtjZdPIXvEIiMl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cs8PdBRUESnnFtnGxgEjYUi3DCeX5D6AfOq1S06fuY80xypQfVh/sxt+5Tl6W4auJLTltoeeb5Sclc7UB2us5X6DdU8QQ5W1OvbGGzIPlvPmnCTjNB4fY4YA69XFwZS9m46yX6C53zbj9MiBpFhazEbfrMKClGNUFvpWxzQDOXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nElMNEF0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sfk9pqEq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QI5E1U1476188
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 18:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlg0qOfDWIznEr8L5Qx8BIu5HfoNV4hPGsRzjrJFlDY=; b=nElMNEF0xjYIi5IT
	zQSEQPrj1BJm+2feQ/InvrkfdraiMRRD5/+frnMNrwF3wzktvi1CMapxA4bawCd/
	q6EkCQpqf2WLLbSb+pqwv1FUu/Aky7m5RPriffj7gKEnJ8qOLO1MR2YZPDMCyRDy
	hKseCJ8CH5UP95tFzdKX2JggxYqJnZ2mZQ0RysRaDSn0VXx9ApSIwYx+dEKQQECH
	80kViTS2lfpjmWQJxzt+6fl5itE20jW8exTGX+XGf+4grgK0TyrfbJbs1VG91art
	No2b47UXufqPrfDX7BsnFV3og/e9vRH6mCVXzquowIrutysuqjsAz926YvHdBR7t
	JpVsAQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s405fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 18:50:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c18175fc54so891789eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774551028; x=1775155828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlg0qOfDWIznEr8L5Qx8BIu5HfoNV4hPGsRzjrJFlDY=;
        b=Sfk9pqEqkV7oBUsykRCC3chK6BtGyAQvMz4lIU9zy3rfc5MY32hX8LG4irXkIlh1cn
         b+SWaOCDtU+w7FetnVkuCUyy1Rmq8Q3biUBE84QnvukfLSs+xXQh6KrTvAof4KF6ZxqY
         Yf9kPYsLOxEEct5ykUSECuicf50bs0oILvLSLTb824yyn3Ha2g8nQ06IzhQevi4+/8Ik
         /q5mMS+radm77skUVfZ1DzCmpZhtunAIAAppkNY2jbJBlikgsJWbgWd83x9gCnXBb+PE
         lOICi9qCxB2kX/D3YrMKwKdy1g5AB0IAd2d9d2YtjLwywL0heTYz1/3q5psDSt0MT4WU
         SsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774551028; x=1775155828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlg0qOfDWIznEr8L5Qx8BIu5HfoNV4hPGsRzjrJFlDY=;
        b=BdSI0r412mbwI6kfAkN8pQPqeOMQoc48CAOCCLyNPkbSMf+vEub44+AKc22RJxak37
         UZpEri4vFLA7YZHZX8htV/PtI4+Py7gQuNU8qUrUEuuccxFJ7q4ZtdnvH19c+aWK1DDd
         TVvWp5vIfOGnA5U/IXjE+uIb7sTpkfWyK5J+P0+s59ZbWijHfcOOcPtDDbJdY52oF+Pn
         HEVtngoOl4Km5jJsthSSybGT0RomSfbxJ6Vx85SOBcsBTyKkJhtRF1vW/JN+sRK/liRA
         4kP3jIqym1Ph/4q9N6Dxj3LLN0+i2aSZPIbwZptlS4qtjHiHe8XSKNbLLzKVtML/iG92
         JB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcE/z5pEtYH2ebms4+J5Zaf0RZQOqb9/0bLhHs9ZeMuBX5lDjqvweflptnJKxEzOygWJLer3FfAH9hS2Vp@vger.kernel.org
X-Gm-Message-State: AOJu0YwWY7gkrl0/zBs+gJeUStCg5MIxOMzyRL13QQq+dYhHjmamhuaj
	zsPjPQYE5tmqV0EVhgXtkUvJn6SZUXAUxfPsu4VbFCUSReWKwYtBEVub4aD/gfMWtoF36cnmfLe
	H5d8kKRpBMg15zdLlZdjM3rdRdZWzzFon3/PdsuIJEL4WLoKg2LH0AmJgDOlJeUrOLmpn
X-Gm-Gg: ATEYQzxMLm84evWXgj9cJrvK1K8tzT+sK74LP59l4E1quXdo1BwvSHA0qKJiZf4iRmY
	4JQXgLYRxnR2Xk86A3I9bwY2brFxXoHElvcXdmwAm0cYZvgJwLu7tqHUvJQnxOGJSmTQNADV4Bs
	XXmbij5XDu+p1Sz58chdqtmftpvxmHALSrxcCEczwdkUyCDRB/2P4UZpLSXbYdYtKgX87zEOtUv
	xYXbeZf8MBRNWD6dU6DUZoYqwzRPaW96fTzK4QfpLt8gHO0HESBoo5C/jRaqCRlAl5Wx7NOG38w
	vDYju1885xSRKLm4VWdvFpE3XKnFMAcIN5wSRKcx6m9q4Kj4XdHKc8ymLBfPYBO/VaLc9ymPaDT
	OoGBOdQp3+Fq2x8Q/l5axcNHsgqoU35Ke7kp5oSIAUl4bfhxjtPY=
X-Received: by 2002:a05:7301:60b:b0:2be:2f58:2ef5 with SMTP id 5a478bee46e88-2c15d2b54d1mr5059805eec.1.1774551028220;
        Thu, 26 Mar 2026 11:50:28 -0700 (PDT)
X-Received: by 2002:a05:7301:60b:b0:2be:2f58:2ef5 with SMTP id 5a478bee46e88-2c15d2b54d1mr5059785eec.1.1774551027587;
        Thu, 26 Mar 2026 11:50:27 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ee29ff9sm2896643eec.29.2026.03.26.11.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 11:50:27 -0700 (PDT)
Message-ID: <a25ecdb4-1140-41e7-8007-8aadbe5c207c@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:50:26 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_1/1=5D_dt-bindings=3A_connector=3A_Add_?=
 =?UTF-8?Q?role=E2=80=91switch_provider_phandle?=
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
 <20260324172916.804229-2-elson.serrao@oss.qualcomm.com>
 <CAO9ioeWxk_=HowH-FcEakL4EXFyAz=dyPwEpqSXPQfvmuvfPHg@mail.gmail.com>
 <fc406873-74bc-49f1-8be2-4b089d0c8010@oss.qualcomm.com>
 <CAO9ioeW7O+arR2VdAZboty_cAdtYm--ppMx9RT3nTQpJbTGccg@mail.gmail.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <CAO9ioeW7O+arR2VdAZboty_cAdtYm--ppMx9RT3nTQpJbTGccg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dPvoZdRJtvY0A3HqdleFhKxV-ijVCVsN
X-Proofpoint-GUID: dPvoZdRJtvY0A3HqdleFhKxV-ijVCVsN
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c57ff5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vKePEPP4CPQ2KtXhb4YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEzNCBTYWx0ZWRfXwa90N4EptJ2O
 zRk0qYcXuij7DCVK/KgfIXpIVYFv72Ytki07SQGtM95NabJJ9EcQkidJfcc8jTa02f2AJL5qbGF
 wf0ilz1F7lstbZ/uXPfdUTGDxj160nkXPBWtze2Z6k4BfdqQ5S3kqonD2utHCuHc4VTq0WGi2Xu
 ShsOK/TGrSzdZR6cmCPRPt01ePvBXEuqPOftNPP7OR36EnwG99SHUK9lPJo2iv6QUSMdvd3aZP/
 0c5Ixtq5sX4KdeL483gLy7qu2nMxBKscLwWYEU6l0JAbfxwtQw5UyRYtXNEId+J7uN2ePxfXAPd
 jqiDE7uUfowujkSzD2tlnjC0D6OAxPiG4OnsIpRqIkza9oFNL9Ry/P/+esSlJJ/qljkIaoUvPrO
 uA4HvBF6gCi+SzapndgDbL7ncoI8j27jDqX4vcDg0+tpRmmD2t8LCEX0HhykwzAV8mq8eu1PX0U
 Fbgqf+O9T22zBc+tDMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100154-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E7A433A676
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 6:57 PM, Dmitry Baryshkov wrote:
> On Thu, 26 Mar 2026 at 03:49, Elson Serrao
> <elson.serrao@oss.qualcomm.com> wrote:
>>

[...]

>>>
>>> Previously we didn't have such an issue for the usb-role-switch,
>>> because there always have been a direct link between the USB connector
>>> (be it gpio-usb-b-connector or usb-c-connector) and the USB controller
>>> (implementing usb-role-switch). As with the EUD this is no longer a
>>> case, my suggestion would be to follow prior art and let EUD receive,
>>> interpret and resend usb-role-switch events.
>>>
>>
>> In this topology, the EUD hardware spans more than one independent
>> role-switch relationship, as a single EUD node is the direct neighbor of
>> multiple connectors. This introduces additional considerations around
>> role-switch discovery.
>>
>> One practical consideration if the EUD registers multiple role-switch
>> instances is that fwnode_usb_role_switch_get() ( which relies on
>> class_find_device_by_fwnode API), assumes a unique firmware node per
>> role-switch instance. If multiple role-switch instances are registered
>> against the same firmware node (the EUD fwnode), the lookup will return
>> only the first registered instance, making it difficult for a connector to
>> reliably bind to its intended role-switch provider.
>>
>> Supporting multiple role-switch instances in this model would therefore
>> require extending the lookup mechanism to allow additional disambiguation
>> (for example, associating role-switch instances with connector context).
>>
>> I want to make sure I clearly understand the intended modeling and whether
>> these USB role-switch framework implications are considered acceptable.
> 
> As far as I can see, you can register two usb-role-switches, one per
> the EUD path. then the connector will still be able to discover
> correct switch by following the chain from the connector. On the other
> hand, the EUD driver can use fwnode_usb_role_switch_get() passing the
> path's fwnode and find the next role-switch connected to the each of
> the EUD ports / paths.
> 

My earlier questions were primarily around a flattened ports representation.
I agree that modeling each EUD path as a distinct child node with its own
firmware node addresses those concerns cleanly.

For context, the existing EUD binding [1] models a single controller ↔
connector relationship using a flat top-level ports block. An earlier
attempt [2] to reinterpret that top-level structure to represent
multiple paths ran into DT ABI concerns, as it changed the meaning of
existing bindings.

Based on your example, my understanding is that the intended direction is
to keep the existing top-level `ports` semantics unchanged for backward
compatibility, and model multi-path hardware using explicit child nodes,
each representing one controller ↔ connector relationship and registering
a separate usb-role-switch instance.

Please let me know if this matches the intended direction.

For the purposes of the usb‑role‑switch discussion, the other feedback in
[2] around PHY handling is orthogonal and will be addressed in a follow‑up
revision.

Thanks,
Elson

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml?h=v7.0-rc5
[2] https://lore.kernel.org/all/20260126233830.2193816-2-elson.serrao@oss.qualcomm.com/

> Here I am assuming that EUD device structured in a way like:
> 
> eud {
>   compatible = "qcom,eud";
> 
>   path@0 {
>     ports {
>       port@0 {
>         endpoint {
>           remote-endpoint = <&usb_con_0_hs>;
>         };
>       };
>       port@1 {
>         endpoint {
>           remote-endpoint = <&usb0_hs>;
>         };
>       };
>     };
>   };
> 
>   path@1 {
>     ports {
>       port@0 {
>         endpoint {
>           remote-endpoint = <&usb_con_1_hs>;
>         };
>       };
>       port@1 {
>         endpoint {
>           remote-endpoint = <&usb1_hs>;
>         };
>       };
>     };
>   };
> 
> };
> 

