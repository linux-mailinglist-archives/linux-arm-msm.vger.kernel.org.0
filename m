Return-Path: <linux-arm-msm+bounces-109570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL8vMoD3E2puHwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:17:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D3B5C703D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CBC6301E9B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 07:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466E23CF95C;
	Mon, 25 May 2026 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ty91wsRl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVomSAs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EE33CF68A
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693381; cv=none; b=Eck9cLBlxPlE+LSlOg978HooTWrB0EN5lOQ/gd55g5C11dXuxh+FzDgxSlIUGaAoMkFq3D5xsIUt1S/CzMpD1hZ3nfE9x2TKi0lOl1wFP3pmJDg2JxJAt9s49/FAbECKZKiytRK/9CiwNYTpX3aUTCjCJn3NuZ8CzcyWJbalCgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693381; c=relaxed/simple;
	bh=I2CWT5X/+wO3lGtzQ8XKY0hFFrg3LJ5WWF0j3IQr0r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwSorfquDIncaB9XDaOZ+e6vQCFKPzrd+bxZwlcqpycUcGSumWDhVulZgNgT3V3I08Ts9Fa+Ukb0AuKBTdMXfJgEU5sVajdr9ch48gX5MQjeo4IqUhXx8v3GTCazbh0+GDokABkZ5uAk8MIwWZ01kU7gU4AitcxW91Pm2382jdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ty91wsRl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVomSAs3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P5D3SF121317
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DfFX/9N/HJ+7ZdKXlPX+dckwA6rQWh6qJncjMyHbYV8=; b=Ty91wsRltsoE2oun
	2PO2cc/LxU2VicEvx+xhM0DT1g56wkfPJwiU1b/ZPAjxt1kDHLFBcBh/YLNrgNPe
	2W9NNSG+e90RgsV3NV3YOMOsADAg/1ZZbA3FI6DnlIZIIsxl1zP9tgsZhSepS9gN
	+1q41CXntP3uvObjVjkhXK3oAe8w41fKifJTv4MZ/c/7BXINH0cDtiY+ocxs4dIq
	cZ5aNAATzdtRuq3p+9UM+Cz3oav1yCd3FpQqRyh/hqi3cZWI2Fkni766b8EEFShR
	2/xPYY72UaBiMggSRrdiRdiiIoaxI4k6Oc/fubaDSHs3rTPW+XlD2Bf1iH+PeO7n
	IAbwbg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmnw4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:16:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso92018355ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 00:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779693378; x=1780298178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DfFX/9N/HJ+7ZdKXlPX+dckwA6rQWh6qJncjMyHbYV8=;
        b=aVomSAs3bxb63VmdX5Pa1GuIrA72a+ZzgxnDM5DfOjF/nv6IYCrhh9QhpftFswP8mR
         13zlF5PuRX6J7xmqFlzv3iadCMKPOlpBOedTDAJz0ym7hnnLBu+sCLd9XLE2JIQz8hQE
         xPw+dbCFSrgnrMdNLw5kSDqL3+VvqzvVa7X3Jpa7Mr0cWOSGaoRX/B03wysG4QDfNh0I
         JIef0SspXLGD4AOPl4thtd67vCFhJBduKRknmjz6wYLKweuDtr0BBvHMOz2MCeLVrYm3
         ZyMDF7DlNUlgnH8ZjoppjGE9kLC3C8ZZiPVHcxn9XR1HqBD4tKvmKavDAL3NOxboYdz1
         sAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779693378; x=1780298178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfFX/9N/HJ+7ZdKXlPX+dckwA6rQWh6qJncjMyHbYV8=;
        b=Psxr9WnT1Myyw4pBq8Ksdf5JrP1PSaW6DlMv5cvt4t0tKuYGm5k7nFVWa3lMnk9ewr
         NFZOTzK9zfjGoYJrKf6Mb2/pY4OmbON1DD6PbwQ27Be0UKNn+gaa4awxh14bE4DUVNND
         tcqKAwzpsLNnoLNeQF1sL2+7v261zY8v5NML4+5ZNbWbp5w+eQS0+B242WkK9KPVCFFE
         BC2ItQSmaGYeE14BFA5UMnlfZRKx3hmyd1q4mhkeGAqeHe26UXRuWRD4oheswNZ/A6+a
         1Niuld220nrK9cPPuunoy49/fn9pstkRu3FTvOBs6qlz3RkuTaTWbV7NntE3sZMKBuRf
         NM0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Itv8yggVmNrzgvt8yXr3hen4Iuir2UgIxLxlJ5UgYmJWDcN5cTCkqDzS75UJodH0UEyFr7ueJ2ps6zGdx@vger.kernel.org
X-Gm-Message-State: AOJu0YysrergV16mnXqug9/QHCvLtBVSm66FAPtpMRllexWK9SFWdO0q
	8QkMfyCSl8reQC2aXXT/VwGkS/wcbaZMdkNo2RN6V0VJ+ca/9p3nD+aV4kwDjJpu4jz1Y+t/qdT
	2tExD5x5c4TRIJAWlkVvtwTE05AqS5Y/bffV1zrOLlFquvMCGZ3Oe4FVO9ufyJlzV2auU
X-Gm-Gg: Acq92OHSw1EwfcFfh5jLbva/kT2vnP5VRfVNgCubBLCw9UKmJLpHmxDp1YS9GCb0Ccu
	M6y9tsphV0b1hJ8rb6TYBvbFI39Tl0189OLPP0jq3L743a7+1Iw37+MEpZc2BlZs2wWm8U/8hC2
	sZEYV39i7p37N12dsZBozKW22wEoRZmdmkTXRS0b+u+S2xU9Qj2GHd86AyZKvESrYSDAPJ9dEA9
	F5al5MpzcnolmvcVvpWffTmVMbVBVVtl06EACaTsO+me3oyYXFSr+P58mQY/yMBV42BbhhDpq0B
	wFdKGmTqdcwwgXTbskhYDOSjz6J1SFOS2DTaGYHHyA8AvuUFSNE7Fmpp/1YsGW46mqL8XuDZUaW
	8ybN36O0apkEQadbFSG+05tM7LEY/ieT/nTM+p/vn5uJgS5SIXwX9dw==
X-Received: by 2002:a17:902:cf4b:b0:2bc:dc0b:ab1a with SMTP id d9443c01a7336-2beb06fed74mr142504975ad.35.1779693378034;
        Mon, 25 May 2026 00:16:18 -0700 (PDT)
X-Received: by 2002:a17:902:cf4b:b0:2bc:dc0b:ab1a with SMTP id d9443c01a7336-2beb06fed74mr142504475ad.35.1779693377420;
        Mon, 25 May 2026 00:16:17 -0700 (PDT)
Received: from [10.92.183.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bed2061c59sm28566265ad.2.2026.05.25.00.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 00:16:16 -0700 (PDT)
Message-ID: <9a0a2ba2-4f1b-425d-979b-fe59192bb2cd@oss.qualcomm.com>
Date: Mon, 25 May 2026 12:46:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] soc: qcom: geni-se: Keep pinctrl active for
 multi-owner controllers
To: Bjorn Andersson <andersson@kernel.org>
Cc: viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
        Frank.Li@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linmq006@gmail.com,
        quic_jseerapu@quicinc.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
References: <20260423145705.545552-1-mukesh.savaliya@oss.qualcomm.com>
 <20260423145705.545552-4-mukesh.savaliya@oss.qualcomm.com>
 <ag_HGVQjIQuMoKO6@baldur>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <ag_HGVQjIQuMoKO6@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA3MSBTYWx0ZWRfX9qPm/kp9WPHR
 G8qHhnstqf/Qqrg+M0zF8caJCLHOEAyI7qeo+p21g6VCw8UFxfSdXkg6Eo4+C6UEoIFGbUY2wQI
 S7iNOZkCaZrSaWfLy17sQkjWeHgk/Ok1bfjUmrCv5xTVoctxHjtDEN03WKgHCTbWAUfRGusrVWN
 FpWuH3bzvi+cl6n24TFfYK89sW4Tw+ODjetAWU7Z9nL0jpJinHFYNxP5gURIY1Uxy992uc5FxBb
 0x/TO8smNTtFGESID8u3cZFZ2Q7R9MMAmcKUfRO+7qI6BoJgp5Q98zthF/GAOr9xfxdkFEzChL9
 XWP/QcfwRUMXmY8w3ognL+PIjpxRPDKWA/v3gFkdRJx70DQOhWDqSYykI4YHu24/6bIo5Llr9aL
 MlGPme5hwz/uJ/mbBkU2INCRbHqXoM12NUk8QT0kfMYmhFmapnfMwbv5xPl33ozDKN1+ukzj5V1
 pJpFfLsa0W7lQp6pq8A==
X-Proofpoint-ORIG-GUID: 62KX_L6Bg-6hXWBJbpWxVQ9tpJn_3sdT
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a13f743 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XeA8sPVIX9ygFgyEX44A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 62KX_L6Bg-6hXWBJbpWxVQ9tpJn_3sdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,quicinc.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-109570-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48D3B5C703D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bjorn, Thanks for the detailed review.

On 5/22/2026 8:36 AM, Bjorn Andersson wrote:
> On Thu, Apr 23, 2026 at 08:25:50PM +0530, Mukesh Kumar Savaliya wrote:
>> On platforms where a GENI Serial Engine is shared with another system
>> processor, selecting the "sleep" pinctrl state can disrupt ongoing
>> transfers initiated by the other processor.
>>
> 
> Isn't it strange that the DeviceTree will define a sleep state for the
> OS to select, but when this other property is set the OS should never
> select this state?
>

The intent here is that for multi-owner configurations the
“sleep” pinctrl state is not safe to use, since the pins may
still be actively driven by another execution environment.
Selecting the sleep state in such cases can disrupt transfers
initiated by the other owner.

You're right that this constraint is currently not described
in the binding, which makes the behavior non-obvious.

shall i update the DT binding to clarify that when
"qcom,qup-multi-owner" is present ? The OS must not transition
the pins to the "sleep" state, as the hardware is shared and
may be active outside of Linux control.

Alternatively, we can also consider relaxing the requirement
to define a sleep state for such nodes if that aligns better
with DT expectations.

>> Teach geni_se_resources_off() to skip selecting the pinctrl sleep state
>> when the Serial Engine is marked as shared, while still allowing the
>> rest of the resource shutdown sequence to proceed.
>>
>> This is required for multi-owner configurations (described via DeviceTree
>> with qcom,qup-multi-owner on the protocol controller node).
>>
> 
> The requirement as such is reasonable, but you don't define in the
> binding that when this property is set, the sleep state must not be
> selected by the OS...
> 

Please let me know if you prefer second approach over the first, i shall 
update accordingly.

> Regards,
> Bjorn
> 
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> ---
[...]

