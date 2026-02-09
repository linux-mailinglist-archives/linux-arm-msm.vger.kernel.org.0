Return-Path: <linux-arm-msm+bounces-92345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GXxCCIWimlrGAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:15:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A676A112F8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9C3930304A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 17:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB2B385ECC;
	Mon,  9 Feb 2026 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nMuB6a2Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BnQoThoX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D53385EC5
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 17:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770657210; cv=none; b=AAVQq962AWMWCZK1U/YOqC8r3Lo1zLWt2k0Cx4CQJML4mzTjyJqWwQqQE22q49jmevuXsk5wt8bcoeKLKPAXP/FCMCNuchsxgjuVEhKMEuYEPKahySlAw96Mq49SHl8bltJJ3QXbh7jXioGSbgxtReU9u1n+1834kfBHyNoE5vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770657210; c=relaxed/simple;
	bh=n7hpksun+sUhuOIkLhXv4z2ZbjjDQy2Xu+fa3ClJMl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=raSwHP88DdbLHaBnYddo9ZkTt5MknyeLCHff1eOIr2SFO6B2PQhd10ZF5uETw2TEZr/smYpTTyhOWM5UPs95rBdM6xKUbQKERI4DeSh4NEZY8ptamWXTY4CbkpjWQlBVVYEcUdkt0dOKtB4FU4EBvzjL/DrRTSV/bryg6eKRj1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nMuB6a2Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BnQoThoX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619GVS7a4101766
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 17:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p4p4znKs4jHzzTxgxk4KKzMwSXnzkoNbEAF7z5NWCYw=; b=nMuB6a2ZKwiY03Uh
	thq/fV9Pz7OsNJnVPSKeGJ8i1UqnSFUYHIk+nDKMDThOJNPwrX36cFeMalam9ArZ
	3M+UJrZGstHoW6mcFxamPA8B7M7mqehhHDR019+bB2+GXfc1kQlpn31u1tf9gwAt
	QpySyFH7EXFIgTKCDUA84FQqJSITEsTV4YijOeXaVEW8q1O3EDQOeK8wqBY0vnsz
	hQHDXKoLGVQKql791YwoD1ihN2kYIo+bV/O2bK2ykGSBrwZLFBZWrTcUm5N8dWuE
	l4taO2gMkGs+zQJNzZTAscDE3xOkbkvFNMHn9LmkGTHSuwggMRH83JiLG7tm9GNF
	yY4bTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7k61g4wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 17:13:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a87029b6so1723360385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770657208; x=1771262008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p4p4znKs4jHzzTxgxk4KKzMwSXnzkoNbEAF7z5NWCYw=;
        b=BnQoThoXNYNwM093C/K8/LMnCNWZpDcLllRCV5i2PpetSS6qM0dwptIEUyps1hyDqZ
         JdwIbD+P1EPJPGbng/VaN/E045z9mvujUeCb/dLJXOI6vCIKGJRdBo0zhS93BXKtgLvs
         sZU/+bkAztD3a1kQfyjcxvEzdGXpqVy7vDtB9KIS3Ptq+ri/Oq+/o7a/aRtx3ww27mIq
         qyEIiXd0na1h+DE5IL+lVRFhTnvcWcJSlL6V8zqB8gddhN3rApffn/3Gp+McyG9rMaj9
         3GTVdvvR+oCjxua2gV/Y/lW7GyKSXB7XNObv6ytO61WEZJImlAfwR0kAed6Den2bG32E
         UtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770657208; x=1771262008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4p4znKs4jHzzTxgxk4KKzMwSXnzkoNbEAF7z5NWCYw=;
        b=sQWIKoYBTLiv9+qUvxacsxfyXUCau0B2N7GyPhjcHKifslc/WctH+sgFxt54DqUKxc
         pxr9kDBNV9CEjfy+k1NWkWiBVYdy62pVsWyHvMap9hWWtPaBOjPU6YtjOGWWKJE3DB4c
         18cYrHnImQPn+N9uID+Lf65OM4ii/aDFQNAzWvHIjNCrNmxlXIfvIvppoTxFlNKikCnM
         QU5PUfqWBxA9ytjHpsr1SnHPad1iewdmV+sa02MQTxwCoL4g4SmcM7rjxEc+k7/u34eX
         p0X7zQN9zF5y8uxNPT9Vl7NVtUdLtyWTxpNAas9QXNwXAZMwymTqA+Vbz6n5RuIyFYi7
         DVlA==
X-Forwarded-Encrypted: i=1; AJvYcCVOLj/8w6/eeY60SQeh/uPR+EJrjuMGDRnIvtgfjBcMUbzww6n67u5wFDsMEqx1BmGVqcrPGvt/7cHocLrm@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYdoJdN4lT7ihzn4jQams25dc+7o2K/BUnakipTfv23mYbZKq
	0KAlD1pely4/zbHsnbVUbUFgChYN0Q9pCiscvKSpaVjumyXyyuLleGSaBMT4gJvUZ0p0H5nC9rR
	S/YhiiWDT1pR4XeBtHHjWqda+zzfqXJfasrYMrYDEaeq4iJGUr2ev1cg5s0flPxGMpXSi
X-Gm-Gg: AZuq6aKhe//91us2TOG6UCiLl/Bax5F+1+qqj6/jm9J4qawQxishou1sGUUVsrz8CS5
	o4cRrGV3QG0TJtZfDhSWOyb5tlh7bXeTwctbZPw9Txs9r806IQg4YJCibmw7Eq9u3FBCHl8Q6Sn
	6ckntcANrrKiboSBm1ra0KeV4GWKkQv2YZuVbwbMSY+yBJyio0+5CLszQ2jeZ0odksA6d94pOKK
	+SoYhWgKyyx9eOK6n7Zj7keVYpH3p62+Z5pTz848YIT+Xqr4ICUqg5BpXKIvjiQ2rr/8c44PU6X
	GgbJQfwKf+h0YjY1HOQVateQ04BVd+1J5CxQM7UXwb9I9WKCvo8mvngTz6wqARbNWqWPEcxrexc
	VRYy/W3VXtgaJJEjql9iIOEQlSYJhC5ep5+lN
X-Received: by 2002:a05:620a:7086:b0:8c9:fb68:b942 with SMTP id af79cd13be357-8caef8dd097mr1435710385a.34.1770657208163;
        Mon, 09 Feb 2026 09:13:28 -0800 (PST)
X-Received: by 2002:a05:620a:7086:b0:8c9:fb68:b942 with SMTP id af79cd13be357-8caef8dd097mr1435695185a.34.1770657206109;
        Mon, 09 Feb 2026 09:13:26 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8ebfsm4495165e9.2.2026.02.09.09.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 09:13:25 -0800 (PST)
Message-ID: <7acdd7c2-5a6a-424c-86ae-de9ca497ab7e@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 17:13:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: defconfig: Enable Agatti audio drivers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260209142428.214428-5-srinivas.kandagatla@oss.qualcomm.com>
 <ddvxacge7zkez2zjyrxz2ux7zztc67rn2gtiizhuzhl6ggnl7k@2t2amskhk65j>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <ddvxacge7zkez2zjyrxz2ux7zztc67rn2gtiizhuzhl6ggnl7k@2t2amskhk65j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M8lA6iws c=1 sm=1 tr=0 ts=698a15b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ArRCDX7jnfVkd7jl0WsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE0NSBTYWx0ZWRfX1jGCW6fffndt
 ZWEfxFI5kztqum1lOFmnOrGWeE0qMBSv9wX+MQug6vxC8j/nF4s8db8Hzx6lFlWLoPwLxzaFh3t
 5FFER9azTt1wxN1PkM5qEgtP3Q3dK/3fu+oEAC+Rd+smO6R2OYl5qQ+bog9Vfg4kwuAFepWWuSl
 VRBPoQia4USvRX6hJzTn/J4FvccfIipMeFtS93Qeb8nB/8XE9QBEwo3iPh9qzMiZ3oy4W9NMZDe
 sS1lprsOxuM0nRSMlHkT2gHWdhU9zWXpfUZJVTVSRfW8/DqpdrZDz888BmHNknnwomfdJeI8O08
 1a8veiD6sob4Vnl882AHL219xS7gOItha3tUlkoOCEaT6sEcI4AFNUyT8dDx/S54nzqh0+f6gQd
 Hzu/pZYfh2VvfJAGVWsEIukhwa82GoItxANBdl80daiZ2r9C8uEqVs34D85YQnCYGNNWY+5IiVA
 9twXJH7ZpJRLCOZQQcA==
X-Proofpoint-GUID: jRsRXNyB3evB9_TPumrh9wWhY93Gfals
X-Proofpoint-ORIG-GUID: jRsRXNyB3evB9_TPumrh9wWhY93Gfals
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92345-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A676A112F8B
X-Rspamd-Action: no action

On 2/9/26 3:26 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 09, 2026 at 02:24:28PM +0000, Srinivas Kandagatla wrote:
>> Enable reset controller and pm4125 audio codec driver that are required
>> to enable audio support on Qualcomm Agatti SoC based platforms.
> 
> defconfig usually is described in terms of a board rather than
> platforms.
> 
Will reword this to imola in next spin

--srini
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index b67d5b1fc45b..6db35c1605a0 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1146,6 +1146,7 @@ CONFIG_SND_SOC_ES8328_I2C=m
>>  CONFIG_SND_SOC_GTM601=m
>>  CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
>>  CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
>> +CONFIG_SND_SOC_PM4125_SDW=m
>>  CONFIG_SND_SOC_PCM3168A_I2C=m
>>  CONFIG_SND_SOC_RK3308=m
>>  CONFIG_SND_SOC_RK817=m
>> @@ -1550,6 +1551,7 @@ CONFIG_SM_GPUCC_8350=m
>>  CONFIG_SM_GPUCC_8450=m
>>  CONFIG_SM_GPUCC_8550=m
>>  CONFIG_SM_GPUCC_8650=m
>> +CONFIG_SM_LPASSCC_6115=m
>>  CONFIG_SM_TCSRCC_8550=y
>>  CONFIG_SM_TCSRCC_8650=y
>>  CONFIG_SM_TCSRCC_8750=m
>> -- 
>> 2.47.3
>>
> 


