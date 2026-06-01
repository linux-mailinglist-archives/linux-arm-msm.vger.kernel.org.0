Return-Path: <linux-arm-msm+bounces-110567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH6/Bn5oHWrqaAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:09:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 171B461E1AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8832D300B8FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E97C39DBFD;
	Mon,  1 Jun 2026 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXtx2Dex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkzRKhJo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1AF38AC9A
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312162; cv=none; b=udBmUcY+J+n/FSBqWVWJHOIWKk/gvd3feTtGyaPgMoDABJqbQvnqloN+7WHdEhe507gwZv1sDae+c8vt4KwX38ECnOg/Um9FOnSIzR7D/h0kN7b83YjyZ+MRVXtMeRgLde92DhbdQZj5zlTWxzF5VBAu8wQPZIE4vNxTDNizPPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312162; c=relaxed/simple;
	bh=3alUzHGu1q1rZwyrAelJu/jmfwWJ8k4Cvig7EsHZoFw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xbov44FVtC+dcqveJuz9VyrHMKcl+GsKP3vFzWzdjW+6qzaDQvnIlTZHwxdH+Zi026u67kuB++682UFaMxKOVjFKEus6pk395FwiWrpE+897v4qC2m7/ti8LbgKgQ/ENK7lXJ88ckLQcCvTCEzw+uIgzyG8kZ4j25GfKUarXOmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXtx2Dex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkzRKhJo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518f9Z12740432
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9QEMurAKXE9J6ybxszdY5PU9AaBvmWmuoM7SgFN+a8=; b=iXtx2DexuH/iRCc9
	CdcMNyuvlKZO6CRDVnxcdqrrgBVrUSFfuZCo7NhPUadDNuKWBEQsvBgrFRfLiCp7
	5VgxULzkLrO+h56lSjBpZl1u1jIkmBURaafSWpPndyMEbQulcZIw0t2c0Uc/6i8W
	sPqDT6YztMuh9CN8M3s1C3kpZqu02Zsie0XhioKJ0R7XqWLWtyDQE6yMDtS9W+Ka
	CoWntX0X971J89iW0RuaOTdByUy54yqtEl/qBTeAaR0RDR9rbQFJQTVvVm5uBjqa
	DPbESJvokHE2kG3WgrftxkO++i9pt/aTfJaEPfWclqM0Ar42YnS7YMsX0M7CkOSv
	mSNNqA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqgk7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:09:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0532a6588so18339535ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780312159; x=1780916959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w9QEMurAKXE9J6ybxszdY5PU9AaBvmWmuoM7SgFN+a8=;
        b=bkzRKhJoTLKRPysn/l+Er7znAvuroReNbuVjbbxy/EkY6JQRkLdwGPsPoS8ktctajy
         VP7pp5AHh35ygzKIijZvYaOsl/s1ReA6IcmTN62vqNcC0c0PRm97IxmVj8JKa5rmH4TK
         KqE/VwsRPZI3bLCGuVb1eJK++n7AeEMZOBWD9ozEcXiPbpmxIPmuIwZyaljfnIhRTLRB
         Vz57/R8D2smy//yMxr+F1hCzYDUSGgrcGmcb5ppdEendGJ2nP1fF52T/fjCahBnqQSMM
         lGAMAvORlEu8orRoT/mzp0ADlYlf1f2qn3bT9Cm9ctWBFwykOoJx6Hsa7XjJYCn1DLF9
         pHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312159; x=1780916959;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9QEMurAKXE9J6ybxszdY5PU9AaBvmWmuoM7SgFN+a8=;
        b=jgADhbLifZbXTLjoLBCHsPr0TZvcuLqhrEElXs+R2m3pbW4uzwFnKGVH+65lEvdhjr
         I2Ltlm9m8FMZMLC1rxsF64Ez3KHTFqMylB1J72y8QTOQHXbt2RM2iJl3HsHYE1ncJ/sA
         vMDgOBqx/Hlr0Xutp2q0OyeaLr6eDfd6+r0SusJ+kJ7EhzI3UEFdsPJIu6Erl3dc5D/+
         5byyXUNSZMpTO+QEnGTz8fppq9IsNI5Zu9k2xGU6/0fFQSpIAgrTIgld815XiE6vhr8t
         oNeX5CUsuFkMbWH60ynRC8mP2Kkkhv7zyMlURlG9DDo354jbYoRjg8DTXg5ALmYFKvnu
         yEcw==
X-Gm-Message-State: AOJu0YzHXlvyqSvc9aSNQPyNwOFMr4C+x/h9+lDU+bqFgHo79W6LY4o4
	lUdKqjXbrFgxxzEWLOPttyAHoW70XqFrGu3iu588xxNj08YMabwNJJo/BiPI2rv04dWqWYOZQQ9
	OAz0YXUS7RKyZStMVI250Uj3SJWbEh4PCH8jgsjY2l08kM5qWiwb5O6bpcqqx2ihXT9E6
X-Gm-Gg: Acq92OESw4pR3LSqnT2YwhI96JRiEIeqUa/j4rjozeFbPueL0Cb8mlNBGv2QtUbpia8
	0cnwZxhqX8iVLh8fDxdDy+tpqmPL7a9sqH+CVBTaoPQWejsx9LA1EFgY5EzDnM2J0NkjR3fhCyA
	4E3rQJhE2IOudHcr0msxvEOKunTRsUlOkOP1d2jjgk7FAb7g60ZeYVEmi+Zo6QmgYAc/LX+kWc8
	r3dV1DK5U0akdYo0m1T+0gNoRzzRoQcUlDvrvfqn4q9ngxA0ia7te+ZLMd6vMYL0lbyrwXzzcui
	3Izr/CEEDuujSWNyw3116gUjQ98Sel/IPEEAUthUCDtRkriw5lrdGItJFIhJYvoYT+Nt/lKfT1t
	xrp/HSK1ur1gOsFIDH98IHlSSJS0Kh2TDHPR+e0KLXXdJrkUfVPts0wJjHe2h3A==
X-Received: by 2002:a17:903:41cb:b0:2c0:f807:56b2 with SMTP id d9443c01a7336-2c0f8075731mr14858585ad.34.1780312159491;
        Mon, 01 Jun 2026 04:09:19 -0700 (PDT)
X-Received: by 2002:a17:903:41cb:b0:2c0:f807:56b2 with SMTP id d9443c01a7336-2c0f8075731mr14858115ad.34.1780312158973;
        Mon, 01 Jun 2026 04:09:18 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a1e095sm107010925ad.32.2026.06.01.04.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 04:09:18 -0700 (PDT)
Message-ID: <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 16:39:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
Content-Language: en-US
In-Reply-To: <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gq0tix8cVVJIJyqSzJJOTWEUmgAS_5UG
X-Proofpoint-GUID: gq0tix8cVVJIJyqSzJJOTWEUmgAS_5UG
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1d6860 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Xj-fFaYqki_RdGdrlmAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExMiBTYWx0ZWRfX7jad5uIDVogg
 6q6zNaYt2Ge7KwsUo0g7DC7pgr3F1Lpc4mSaduTaEodWm2ZkVn6qM3R+vE8f993N9SEoqlEf2hO
 9eaIks58PtPB5/azl93Nij4JxmqXjcdgc8lpJoM3AKBrsjWJMnfWTafnaS1z/+3JWQRb0R7T28X
 q0qqmLMi8jp5C63fOIUGbFnbrcqV/X7hdr8BKDenkyfktF9flClaXqkQXu6eEFIwzsN5VA0Afgq
 Saxc3K/4WxZSR4FU0/7pL7zEA8/+3v1XqS9h9ikn6RTCjyqNTl2JNAaPXOBS9eznRM6N+rdmqsa
 4vsUPxubuHP1XGV9Z0w+pSBzf+ObKDQCH1t0oMn0dyGEcX8zrBBNkK8iWFSDcNRP7dT+UL4Rgao
 KgZ6vblxlFKzo44fyRG85TVsC/Aith2JfT7AdpPM8aKVtHEs7dJmxHxyAhXd6GYvX3JPwuSFXs2
 sJAv8hKu9TRJUWBcTtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-110567-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 171B461E1AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 29-05-2026 20:20, Bryan O'Donoghue wrote:
>>           ret = 16;
>>           break;
>>
> 
> This is a pointless enum add.
> 
> NAK.

You're right. Since Glymur reuses vfe_res_x1e80100 directly, CAMSS_X1E80100
already covers it. Will drop the redundant CAMSS_GLYMUR enum in v2.

---
Regards,
Nihal

