Return-Path: <linux-arm-msm+bounces-100859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NjZCsqjymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:24:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEA335EB80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 384CD3164296
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D2838AC92;
	Mon, 30 Mar 2026 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ya3wF+X5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULev5Inj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD9D38AC83
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 16:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886843; cv=none; b=miJXK8fXEcTQZFLZvBjeeNp8rs+xpkTXK/NknODrVYY65kjyeem5MzGqBrW2H6oJ/QD6nSzQczScySat6K5zAnZ32tL0JijHSUNv3893kk7w0Sgv3qNZIDgHzVkiGCBIsaobmv6IaCJlh1sh2EL4nztPxiyCJLYkTX1v2wPWwXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886843; c=relaxed/simple;
	bh=4Qi6Dez0d0Stptw+ICUQbRD6+uNgWbYvm7ih6VrRmWc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WQN5c3smCgNwj+Twm6MBZCB0ItT+CKi2ZkLOU/XwbDqmUOpyl2ZZoxccyTcuAdX/tdcH+p8b/T0r5p+Hg1Sj/eUXCfCoAdUapxC9SCGkW6urzA4eAboMl2mdMBYRSUB5WtRWRtH8+3Wa2396EG6OFUxzmTnS5T1TQdoip7XFnYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ya3wF+X5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULev5Inj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UF20IG3722902
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 16:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vSsMvZxDEfUWgGfQAw6A9eOB04wnLEgGtY/bfuExLG8=; b=Ya3wF+X5bXN8P39d
	e/vJvPF6Ud0E4PqS/RfjA9//FnHoXvFzxeZfUSZ4mLg5eX2schHgVLqUByxIBYLo
	vtaodOMrfcpwzlhUjAMF5hIEe38zq317Bo7lgG3IlaDL6dT4HPRse3cWx1F9PsJg
	64nyQNfRHFURwdb9EFd01jLZbXEr2yzY9VG1VE6TavM/chC6tfH6o8h8zTiHXpOv
	mJ6dQVpc5Q3jWCGDlATpg1umB8+yx1MH8vZehNBSIBbRm5hu6WsFgIdpXj1wV5jK
	4WhuKqWvYJAlH0K670kH2h95TMVSGXQ02xEFqzTmKKHAEBvLRVCp36a/o/+BYTPf
	tbptvQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmsh1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 16:07:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630753cc38so10645082a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774886840; x=1775491640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vSsMvZxDEfUWgGfQAw6A9eOB04wnLEgGtY/bfuExLG8=;
        b=ULev5InjQMefYAsmUfevFWZtPyDuGsSCHC7rc+lH2klVLQul/zt6ioij+HtdkufkM4
         h79tQCurBcjETQ5hGWwy8yiUjeHbegErVKfcktz4dVmH3e3u3PXDbFMKe9lJbzX4eukT
         iysECpwhASkB1kJec+7jK4Egg5rk61K6QZuM/aTSMXlSROKQC87awnuvlg+XesPfcW/4
         b6pO/Vhe6tiAxgbVS4kw4NO3mfEi5rEVF+NgnpiRXBcO4LuVw3LPmp+Y0aSAXssCeY2g
         sFFjAFHLtPZW/QgaLJCztT/SlT123BcadPO66qIkBu0LHoZIIBEgWfWgeNtkiDnrZitd
         2DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774886840; x=1775491640;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSsMvZxDEfUWgGfQAw6A9eOB04wnLEgGtY/bfuExLG8=;
        b=SgPTs3fk8qmmCQphmZWMB/ziGlt1yPwTmikmdb/DKF1oQuEu2/YIknfvsih1PoBKT2
         xRtmL0HQjHR//IFHpter/MRDpVHG4qFf/bSZ0dGLkUEwQjyys9yIN2uG61tYMgb+Ikoy
         qt3JugmiTeCr6+pp3YM7PW570ls7hNO+DblctdsPjoQ7CbC4NlPS8/ZBgZ+1R+W6lhW0
         7vaMFpwk9zAJQaPNr6DOaXeh2HEzkrBjPsS3BqMjForer3tzkJZr1/xDUBGREU5eLkTm
         seipvYBlshGy1z/H+UxX9p2LW32XTsGFCbVUo2lCn/3FhGpWrezRSRyH4IQQJANzMGBD
         peMQ==
X-Gm-Message-State: AOJu0Yw0iWqaN25lqXBonAms9ymmsp4KVHvbkHm8J0h8K58k/PYBw+ST
	T9rpQ0kTd6Ysh3h1EUiuw6cxBSzWyGyRuSMGpFv+n/ggH5wOTd0zfy9SovsaLX9BVMbu8dACINw
	49HixpojCMJ4MyMPs/sbVkbMDdoFVHwcnlSioRqo3msDrjkWfeZN+yhLftHqLyfopuJIG
X-Gm-Gg: ATEYQzyTXxLlf/Y9+La/3AmnNEjYn1W3QBl4Nw2kvgXJeHZTO2xYOfHW9fnNaNHc5ES
	jo4azgAxOTy2JNlF1eAuO3ivUUoFCMxVkCQIzmSNyUA5mwCu7sitP6KCL2MavSlAmA86kWdTtmV
	3Cu/7PPLhK+YkwkVS9tyzHzaQH5pEWbZcGl4nkHkULzu3OSb5u3/NXp/8RNshkde+g4O06EHCvY
	iaRbSwVQlnbj1oSbYREwDV559Yn0JSKc2NwSVd9u4ZNuryaLgKbmNyAUhIltRV6iq5tboi3FaME
	QXVRQaq1YeFsSVORI6MiFxHrGYu0zQSd2RS9KirJM7ISt00OK7fBc6qdqsxyfMpySl9iCJb9kMt
	Dyi5OKUTngDIbxL8PFxhqxkX5gLnn2WE4UEXrEunP6UOFUDeiN2mnHiDIeRqe363k148=
X-Received: by 2002:aa7:9064:0:b0:82c:70a8:faee with SMTP id d2e1a72fcca58-82c95af18fdmr13035909b3a.6.1774886839546;
        Mon, 30 Mar 2026 09:07:19 -0700 (PDT)
X-Received: by 2002:aa7:9064:0:b0:82c:70a8:faee with SMTP id d2e1a72fcca58-82c95af18fdmr13035869b3a.6.1774886839060;
        Mon, 30 Mar 2026 09:07:19 -0700 (PDT)
Received: from [192.168.1.29] ([122.164.84.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d3a71sm9125804b3a.30.2026.03.30.09.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 09:07:18 -0700 (PDT)
Message-ID: <46643da6-3bb5-4c67-afd5-9a9d9027ab85@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 21:37:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/5] Add support to read the watchdog bootstatus from
 IMEM
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
 <7593d19b-c124-48fb-9c0f-af8177dab1ac@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7593d19b-c124-48fb-9c0f-af8177dab1ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OuaYkO5ufS8n1kJ529ceR-A9MgTeNeaL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEyOSBTYWx0ZWRfX2/w7vE9zvUyk
 eNkV6339MRhwTrxoALpRM6pSM5hv7af4U/K3qL1PC1gnNI358MFEWAGLOhDz7rA6GlnD69EA2Hk
 7m3UfqLWeKVBQN8HGVOguAcB99ff6o4hIXweF50RoRo4LtaHs4CpgkVkc5Qsej+9SNkRiaVhIVL
 +WdEUS0gv8rd3HJ+tLPDheSilra87En3eMGo/9+RFWX3zcMypXHPhkkQ2Se9Oa0feVSYK+T+HEH
 EgsZqBCG+SNte/PVl+U6Rl6OMedG4ByhaLtRMkRIllR3lSyxeWeA1XudvBInWlolqTYbf1/u8br
 /gX/MfPsqcvC3DDZSE05/dlrS6FGevdsJ0iIqV2KcqlkCyvE0HT4biTvr4BJBbfJw02bSS73sCg
 5NF6OgQVOjfy7w+XYMxDz8f0YJ/WPyT2aVQpCCAjCdAMAirdPnYxIfWkuX8FS2V4dtCX0sUqsXU
 lJuleCIciieltQuVXOw==
X-Proofpoint-ORIG-GUID: OuaYkO5ufS8n1kJ529ceR-A9MgTeNeaL
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69ca9fb8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=3XhhY/eKbwDBaJCND2NhFA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=g9OaShGYrvlb0wzR15YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300129
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100859-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CEA335EB80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/16/2026 2:36 PM, Kathiravan Thirumoorthy wrote:
>
> On 2/28/2026 5:58 PM, Kathiravan Thirumoorthy wrote:
>> In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
>> timeout, there is no way to identify it. Current approach of checking
>> the EXPIRED_STATUS in WDT_STS is not working.
>>
>> To achieve this, if the system is rebooted due to watchdog timeout, the
>> information is captured in the IMEM by the bootloader (along with other
>> reason codes as well).
>>
>> This series attempts to address this by adding the support to read the
>> IMEM and populate the information via bootstatus sysfs file.
>>
>> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
>> as below:
>>
>> cat
>> /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus 
>>
>> 32
>>
>> Signed-off-by: Kathiravan Thirumoorthy 
>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>
> Gentle Reminder on this series. If there are no further comments, can 
> this be picked up for v7.1? 

Bjorn, Guenter, Wim — gentle ping. FWIW, this series applies cleanly to 
the next-20260327 tag. Please let me know if any improvements are required.



