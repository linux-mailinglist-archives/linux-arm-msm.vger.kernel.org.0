Return-Path: <linux-arm-msm+bounces-95622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JhxBvx2qWl77wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 13:28:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 895F7211A46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 13:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2799B30036C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 12:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F7838423F;
	Thu,  5 Mar 2026 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRCppE/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGJGlYOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D9633A703
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713444; cv=none; b=cZxzG6xxeW8IuqFwCclH9hGMk/HmiEUQalFJyiITPNczidK/BcxUUsAyrk1GIhHGhpi90Vo3glzHUGoXXWIug9XKxADgElvVpe+RdtymvuOErCO9yGxYBwe6uEh7ds5+6s2WpOouvdIWc6PVnqDDFcMuC5b1dTTFzeO6sDNiSRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713444; c=relaxed/simple;
	bh=Mi/di9u/oE49SDz0n2llheT81KKh8sJE3C1SJjld07o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEidbkQ89YBvg5uQn2LBJYFl/LUPd27C1rsv5M82nDssvNHv3dnpHiWXNpKi7CbC8xZfQS72v0OmLguxvUhXvMC0NWHv458aw8w8sqrnfXrbRrO0AwlDRfiMOKbVGDH2nIU+98NGEyVMvvfM2zygo1TNzpn20BfjsW2X/EAZVug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRCppE/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGJGlYOD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFnGT4171060
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 12:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4X+oK0hBfEQ9a77QBjKKA6JUp6Tb001pf1lNXF0z5io=; b=ZRCppE/nPWBIE+A6
	RKBhh6CrfMo+XuEV3g2gqqjLqFjI50slmBf/Hh8EGFsdIIeek/9FOPb+laUn/wcd
	vjh9og/kbFrMiCZfMdTiL/+hhmgpzP517lwObkNldff1NJkx/1jFt4+UnmAx+qPj
	UCmWvuND3O+iXMiOgY7LRTJYrj4jEMM5ITdOZhcKHQrMhyAyzxYeyZxqjnXIri4W
	J5uVLRk9lv4taDmFWfHhgSX6R3IEC5MvgACC8EARfhEiPmNNV0S2Xw2KfGzBLJol
	CrksPK82CQt/WHCwyy25HUWqWbqHHEYTle5fsZLv3kpk4giK6jA+qbb4XJHFzxAE
	zLqcDQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb2qu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 12:24:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso36603638a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 04:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772713441; x=1773318241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4X+oK0hBfEQ9a77QBjKKA6JUp6Tb001pf1lNXF0z5io=;
        b=cGJGlYOD/L667M5mDCi35BdLH+sRuFNtzTwPfVF7BAJKpplRvh8RrcFN4DKx9/TYdM
         Oc294Jzd0FSptGjnqu9cHSMQgG+eZ5/m5ycL5MDe3V6tYheoQEXtEwCtRDRgAmksPbqm
         w4MFVMqWxrUog3e4nsA+FaV/c6kwFW/vl49vM02LFijeCtyzeZUmozw0lsGPaREKlTIe
         3X4E7qJlbeAwHt+4pwBXZeccsSA4aVgTeoWSFZD2bSaMkUb6Nc8lwEI3thbKRy+/W3n5
         ENqO7Un/xCFLrYAgROG1IwYwCITySY19I8xjV3tsLFvVh7Q7SFNmYcZoiaElDMVx4Gim
         VwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772713441; x=1773318241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4X+oK0hBfEQ9a77QBjKKA6JUp6Tb001pf1lNXF0z5io=;
        b=nF+ovac+RgdhKU+ezEISanrPw80iiGFnyZu30s1RpWko7UNql/3HLFffn06PhVOmkp
         fZPKeJNIKbLrf/Hy3KPwcmcigwJjeVRqd0cLPh3KRpwFt4FiVZxm8aQV9aXQkxw8WCgq
         6zbY61w016H+0CPivkq4oFkNElbKANBc8+mmTOSKu+jPVZKflECzdkQeTIrt/XozqOMT
         Y6YH+UH9ikzj4yD62pj61EWQdHw4/w8rPdfo1W+TJpIOrxtMcfCBBpbL389m5XHWOQnw
         kt+jsQZreEoPUS5wDlgmXXwdxzAmYzD4Lnt+Bh+BIUlTNle4T6qUi40MlMBz4if04964
         Zw5w==
X-Gm-Message-State: AOJu0YxKfscWAuwdDbNzayeyLE1iJoUJh7LiBR4wUZTW426BVKDI2K7f
	EKvaKGJk5+dniOQvi/tPDApcIlEXv80mVZXwyLgfOXi1ulnoLlF6O0TIBhx5QBCMx0KFlXE5jR2
	M9RBMl/BB7UnZsXCHVw4sX2672swisdgXQ/PumFEa8DEEfn/DQf6vNFr8F27hok/1HVxW
X-Gm-Gg: ATEYQzxYi+VUdn8/f1xe2iIDLudWWIxOM7IJehJRZ5aT0xJ45raTrKdlvmSbOZQ4cRI
	ZFrEoQuLwoYhaSLCX72g0q4npescA0zwlXQCWHqfBCOLxL4kOPpwtf3lipPgGRT0fzMZE+Piwnt
	+spGyKYBzNQSCO7BodxPqn3R7bLfp2rbq7jREPNO0YvPXpt+2bbY+n71vEncE9RLGCET1c8XN55
	mX9TpLNEJ0u0aEbkXLt4pwW2ajWs7wmeQim63+zb+nYePOMZOE+9w3RMJ5xj8hOIUbDcnSgOod8
	wZDyddkkpKBMkkfz+IVZpaSLDoU+JmyNi52zZGiXWyjxNlg5ziUA9H03+Laf5ZYc9v6ChRPscl1
	VtWVddZjXETRuET9Fu4Z/8cYsJ7cpPpD92Ip2Ws/GCKWBFvDj9H3AFdg=
X-Received: by 2002:a17:90b:1d47:b0:359:1821:b4e3 with SMTP id 98e67ed59e1d1-359a69e54acmr5140430a91.15.1772713441126;
        Thu, 05 Mar 2026 04:24:01 -0800 (PST)
X-Received: by 2002:a17:90b:1d47:b0:359:1821:b4e3 with SMTP id 98e67ed59e1d1-359a69e54acmr5140385a91.15.1772713440651;
        Thu, 05 Mar 2026 04:24:00 -0800 (PST)
Received: from [192.168.0.172] ([49.205.248.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359aa1ff04csm2456190a91.3.2026.03.05.04.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 04:24:00 -0800 (PST)
Message-ID: <78f874ab-14d6-4ecd-89f7-4be27720bc1a@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 17:53:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
 <4dcbbd06-18eb-46c6-a52c-07a4b17205cd@kernel.org>
 <68db6d61-640b-4eef-8ccd-ab2fbcb58427@oss.qualcomm.com>
 <6a610a7c-04f1-4023-82dc-e9cdf5673d55@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <6a610a7c-04f1-4023-82dc-e9cdf5673d55@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEwMCBTYWx0ZWRfX8Dv4Cw+kg43d
 ZsdUn52tFqP7RwFnD6jeJP/nkoThZ+YjnkItk5lY2G9gHGL9tQSzD6ydT8eTmmZsDIGRg2BheSS
 jrVsC76UxnKLJUwoOg8ry1xH/fDIgKAxMXtUQDBIHYnNjiVZ3zS5TFYDbnj9H2dmTnKiZKP6Uui
 pK9WrWNMORihZ2lWOO5t3B2A2aWtQzuM8ANuKUPv8Tl5ODyKCQZuYCussWGhiCk3IlCDGwl8Ku2
 WLNuF31AezRK4DoqQ3QrZWHSN5hBeArI/91GioSm41OEIV0UWOKEmOHlwyUwT2pEoSJkztv7BGa
 5oYoKxDHevxCT+TcKYvg4nxzvVr0AQihpMlw3KM+CFLk6NBYg8DMVdz8lgJLmhFHcB+c+yTz3UT
 afJo2iXJEYPzYxjjyht932c+rpiNeBcB70wCojKT2jeGjY0NnxIQev8x9QHJu+pPkerwuDy3vcs
 TFcSug6k1NeK99r4N/Q==
X-Proofpoint-GUID: 0U1jwKv61VXfbFSxFhjV_E1MLY7cTl56
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a975e1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=KPiuay1jFzAquJblYynD6w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Hr5Ahw7noa96dzT7ZQAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 0U1jwKv61VXfbFSxFhjV_E1MLY7cTl56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050100
X-Rspamd-Queue-Id: 895F7211A46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95622-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/4/2026 8:37 PM, Krzysztof Kozlowski wrote:
> On 03/03/2026 19:10, Vikash Garodia wrote:
>>
>>>
>>> ...
>>>
>>>> +    };
>>>> diff --git a/include/dt-bindings/media/qcom,iris.h b/include/dt-bindings/media/qcom,iris.h
>>>
>>> Filename must match binding/compatible. I asked for this multiple times.
>>>
>>
>> in this case, its applicable for other platforms as well. Naming it as
>> qcom,kaanapali-iris.h would make it look like kaanapali specific.
> 
> I repeated that feedback way too many times.

thanks for the feedback. I’ll fix this in next revision.

> 
> NAK
> 
> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com
> 
> Best regards,
> Krzysztof


