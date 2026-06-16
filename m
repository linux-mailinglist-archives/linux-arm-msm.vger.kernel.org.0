Return-Path: <linux-arm-msm+bounces-113391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C9QZMsI4MWpDeQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:51:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7340468EF16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:51:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iO7rqEvO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WXbFdp1X;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113391-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113391-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F6C3301C66E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DAC43DA35;
	Tue, 16 Jun 2026 11:51:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02D043D501
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:51:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610680; cv=none; b=rx3X2uyPGgLpEsY9wMZmcH6VOZR/xKzoWNfJ6MvE0gYeC6JCL0XP3Pc5qsWhMXXbi2CAHJEBfuNI6WOXsWLgsTg1xUCCqJIoi+Q/lCslN9ClUnhqNETrFwdOsNWitT0eFDxOKClvQqmNvrPSkbFxk8QEV3bwMHZLApemtt4nucM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610680; c=relaxed/simple;
	bh=S4Pr7OC0zUgcE+WVa02kJXmu3HUXXKm4UWEwo3FFliQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=li5covGFj/SDRIMrT0emhpEpncrIeD9JbxdqaImN0vLFsEIHaYCK2/0EHD3qZSFVSAZz2Jb49bUO+8GFqb4kOyuqAtQT8VWEdeEgb8cKWkk5K7I7PKZHa6tM6IrH4n03ffMujnf8cipff5gpv1uUAY6ZuFGV6WPADybLer6O4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iO7rqEvO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXbFdp1X; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9GcD1413950
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1zI67otVq+aJIZ3IRAwoCMpz4lJ4T9Rvgd77tzIR4h0=; b=iO7rqEvObgNKJwvp
	NwiNWmBkuePzRnGN65Aw5XfkbxnBRmDSdiQPgNokTbxzbigkSDq+k1NcqFLO30N+
	wBJhW2diRYdOEPpeoWHqN7wiJjR7pg0DANP8XuRWw9GSd/KckTUyFgELYjiNhBG3
	2vP8iu2sKGtgFOIrvoCd3pSp5p4rHNQqk45hbLu75XMwppJy9jJc5XardSuI9J7b
	SmLUPCbh1S3+4Jkc6rHQu1GtOb7VLEf3F2eu6yRg9fQGuvTrSC0TyF+6NsccemV6
	wxCmOQKJ87cSZ1bMMPrWE2WnF/DZiMuKW+akNnvCV+Z7LOlIOpuXsTzwtB3Hof/P
	cRBKMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct0pp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:51:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915a547f4b3so43124585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781610677; x=1782215477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zI67otVq+aJIZ3IRAwoCMpz4lJ4T9Rvgd77tzIR4h0=;
        b=WXbFdp1Xw9F7QA0ZFs1pirEMWywFnVT2Mujdb7w/H5zz9J7DQ0WeQ/ET5Dd5Huse/v
         jFa9b1iCE7qaNjsfuRaurJQFjEsXgwQMeTUie5AhVKf9ir2Z1kTNGUqT/d9zxlPPCEck
         2opQbrV9/wCprJg817JeTeIawisMc10ijJMrS0WsEM4rRjw7wNrcb4fnLxD1djVNIm0o
         d3lR1IqRsFIBcS24VBFtfKDEzsth6fkJZAVgxiE92Vwym/oxwwtnFCbCX7jIreTaHzih
         xRwwKr/+FrPayYmXgaYny24ncSspF50UIQcYWd527AmeG+S3PFmcsAzLrx0YxYN4Ln42
         0dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610677; x=1782215477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zI67otVq+aJIZ3IRAwoCMpz4lJ4T9Rvgd77tzIR4h0=;
        b=FZEDmHPG/Ggv//nmYYixLwJVErn49OiQBamYZZPdcf/NgpCrg00BtMLk1QrDf9zsn/
         pOjzl6+Vhq1Ly3+zePwuCYYoWEn5bbxzXBpVp0Ub6L2FEkw++HP1lu0oAooISfV4oAad
         +XKNbB9JGp8fTiPPz2IN89NZ+9OWNLDXTKJCWgVqrStZuXuSh9sk3YvjJvoi5Oe6lRIZ
         H8aDq9w8HCpCB1YEj0JMQ6G/bqhPGjUZxrag0keDtxJJS7h7tnKFk7rlD09yVrOdRMsn
         m7KFAWw3OqWInih/39A649Ms0zqCXbpibAi5f6gYZEMwBI6ZkMhnHBt1djDLe/iunqlQ
         LLfg==
X-Gm-Message-State: AOJu0YxwRM67VpIfgXfk+cEEdB9SkHlP9B3PD3iywB0ZSkeCGbX5fT7g
	EJLc29aFUerjvrlEnmymvnqY+5NzPHoOr+FRmqhIXRWmYn52roN2wt/QoGWHOLIpmEXCDmUCxe6
	sUbOi1ituYRY5qSrVT+JPJDSnzXGr2APrg6gCMorivL6CHCEaaCH2orn2ppi5JgjQtiZ2
X-Gm-Gg: Acq92OFK3p8Bjc867delwhZ7X5MQOmO0Rkc2DNA0P6wutYThj2bveglKP5HNbMDXPCV
	NWkvI2+sHmkatJTYkCJLM4KW7nyHxmRaUtX26AcJ+41pnO1ApArAAGcl9wUEeMTan74aZdEQ/8o
	gXdJZkvPf6Cy0NFJUCJ9FnomrHZlSa4R9Ppj9uqptK921IJgTdk8iZETeJExThUbPXq1orUfR+N
	vOb03pdHxKkt/P5L68AdpsnYTgdaY6wrKea1n6usQXJ5XplPqIEmofHdfb86cT/HNNG+RaV5rrb
	rWaQStp4ZwCQ8nRIoja5u5sExS9ucYVHdkgVK5mW01m7Axh4IosAFD7uydKeHWhSSx7bNXAI2BU
	51goCt12dHQ/3yH6GlSNuEKseJL0m8vhDzFIACbZvpP5Alg==
X-Received: by 2002:a05:620a:31a8:b0:916:1a60:ee05 with SMTP id af79cd13be357-9161b94f702mr1639850785a.0.1781610677152;
        Tue, 16 Jun 2026 04:51:17 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:916:1a60:ee05 with SMTP id af79cd13be357-9161b94f702mr1639848485a.0.1781610676676;
        Tue, 16 Jun 2026 04:51:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937938a0acsm5185937a12.19.2026.06.16.04.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:51:15 -0700 (PDT)
Message-ID: <d91431db-6f71-41a9-8912-42d74e19173b@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:51:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: glymur: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-add-coresight-nodes-for-glymur-v5-1-3dad99fe31e0@oss.qualcomm.com>
 <3c2fdcf8-957b-4b28-85b7-3a50ab8ee485@oss.qualcomm.com>
 <a8bb974f-4886-4adb-baf1-9e6c352bc6cc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a8bb974f-4886-4adb-baf1-9e6c352bc6cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a3138b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-p3cA0bc1xiosEUZoXEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: S1rtc4PZfwUStCBJoW6YuBC-lyosv5zB
X-Proofpoint-ORIG-GUID: S1rtc4PZfwUStCBJoW6YuBC-lyosv5zB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfX+PZI4y3+9r8G
 oygF1AygHsz4DfC//JdZnrkzZbU2zk4ECgi1l7CCiV6pWrOhaAVFN93kAetupyltAk/Ht+uBnZj
 1s3W3sc+tH9ITXddplyMSQm+mcCYLozZEvmqoVn4o+FDUcgGfqQo52U8ADdNEZCSyNzbt/d4gMM
 GzJys80FtQirmXjLRsQgDOl8z4KBBcsoeW1i+tZefzqMUrYVHySAt9Swp0chNOWo4b27DGuXjwb
 f7qC98FYE6t7jgtuw7tFePkYfA5+pP4rCwf9HSFNVFKA0ddrgRvUFpqiIuBWkVAOgmKFU5bKVJj
 BbTMKCXJSUW+2UwlSFhutiDe7yQn1GWBX9JsdDEqf0Sub7gdKHOwpMiVPYUQN6DSnhY3oVf0k7f
 xpCOJp5YvtCOuJxQRwfxBkdE70M9u5yFMuL4hOkdoMGoBNR4Mk8Mr5TSkPzslYXAm5OcadO6RPj
 tzL/rPDBolRKIhFcREw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfX2nkLGu3kgiez
 omxLUluu+8CrdjiHWG/tIlxDW4L0hJmZV7DGr16gpNfOPGlUqxMit+8ZuszvOEo3bDFy/NkkuT1
 VUBH7l2Z0+ZAB2NPp3pEhnU4M5qjRpI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113391-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7340468EF16

On 6/12/26 1:11 AM, Jie Gan wrote:
> 
> 
> On 6/11/2026 5:28 PM, Konrad Dybcio wrote:
>> On 5/19/26 3:14 PM, Jie Gan wrote:
>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>
>>> Delete cti_wpss DT node on Mahua since this device will cause NoC issue
>>> on Mahua device.
>>
>> Another good explanation is that it simply doesn't exist there!
>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>
>>> +    tpdm-cdsp-llm {
>>
>> Nodes without a unit address should be sorted alphabetically
>>
>>> +        compatible = "qcom,coresight-static-tpdm";
>>> +        qcom,cmb-element-bits = <32>;
>>
>> Do these other TPDMs not have the "DSB element" as the driver
>> calls it?
> 
> Depends on the design of the TPDM.
> 
> tpdm-cdsp-llm here only supports CMB mode.
> 
> There are three types of TPDM:
> CMB only
> DSB only
> support both

OK, thank you

Konrad

