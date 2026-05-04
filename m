Return-Path: <linux-arm-msm+bounces-105679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFQVGA1u+GnPuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 11:59:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E83F4BB533
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 11:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 541BC3004406
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 09:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A4C38C2DB;
	Mon,  4 May 2026 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJUgw7m7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VRESxUIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5050738C2D4
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888774; cv=none; b=T9CxmV5NXiNziH6pj7f9xpMP45FRqmhe7oEFmQmS38Pq1kGnmzXn5zSSWG7CTbE4x12wS1SiwueXyYFtBbZA3czAKU6ihyDDMkAgN4HuWG58byDDOOPaGhFzUP4h3oKTNG2LmKTWE30uDjN1kk28FHZX8KZO82vkwGt8TEf6xSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888774; c=relaxed/simple;
	bh=S6XM/tTueF0luZTVGpxLRoxf3UTzcDP7I32kCO0rWns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=brLuoHNzQfLpgTFDruriqvtzTUX/oBe9i7pLh/2MftyYwBjn+9umAX2OdMFVe9GCkjhAYDhN1g+6c1/emlb/aWS2fOFnVw53n4TUbPHgoH55WMb3YSOfzJGbC2JOX37YOnMECGO4FVM2J8bDQvr/o/sLa1HMmWF1TYHQzyLgPvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJUgw7m7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VRESxUIf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fPG42539090
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 09:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mH/Zs0Wy0agigprn/34jYuT07jxCmlmcVLk1cbgZ5bE=; b=gJUgw7m79thqlmPt
	8jkpuOyXJlmvxguoq9GLOKc7rYN/LD8ZB5sEMwV8g2bGTErPNhmSpLWfLvwySDjq
	xpKFVLUejVVdm+N63Vm2SsvSYi5fq9l6XpNJ7gEbvyXHsqGnCnKfQA+P5bhtYVbI
	ZJOYO7JIQU/xAVYG1o/zU2VCavIDgv/LhXJIEiZd0yiyMgU07gtFEazBodnVd0Bt
	h9IYRqsN7SqvtTzNE9/qxkDe4D4/cyl7bwSPSPc3pzMHbj2sjD+BFYd0C0ZNgifd
	dLN0+D6QCofHDgpSYxN9wslwgA1r05q/IbEjcF5BOuV/JMwm1IJChdB33wF3LQ0S
	9Gp8Ow==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwxk1b1ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 09:59:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cd22ec862so231780241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 02:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777888771; x=1778493571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mH/Zs0Wy0agigprn/34jYuT07jxCmlmcVLk1cbgZ5bE=;
        b=VRESxUIfdZmPYIRMN1OCw1dEooMVdoHyZ9TIVHwWuZRPe63C2ydQ0JD+Dky6qA91oM
         IFlljrI79MvUbnrx45JelGX5RpJ4op1ILpTF0c/RF6ltB24XdJYo00vDZWO9Kw1MLpV8
         +APKXqIwZ0bLOHiWlktva1u7g21kW535tn0ZMd1UFvv7hw6hZEmtGC3coGGEGW/cdgp5
         8XuGTZPFs6XJNx7OMana9+PGD00XFyiHqeTQ9tcoc4/F6dvlv+51offZAlUPn6JI+omW
         BSEgLzEWMtwCj1OvLLOjS5HwVopfsMAaBqFyrgPL4Ow7W+B2tvMWK1CLY73bqT9To4Iw
         QNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777888771; x=1778493571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mH/Zs0Wy0agigprn/34jYuT07jxCmlmcVLk1cbgZ5bE=;
        b=EFCHjk7BTKC9obGU7oFUEfMTgD0fIAn/2ZKp84/Tscz9jLgu1VSwvsBEhNvZlKSyJk
         WYxi2gG4yAfdjFYSqmF/MKHANA3tfD9Y0ks0F/q6n1zv1h9uzDAb1Ycn278XyjJItB8s
         MCh75yQ+iEyb+sH0i4k4Ttv8vgic6YgYtkQkW5yDHTVVoKyje8+wAv0Zrr5sg5PY3RW5
         GXRKTBfjn6dIcpHIenEBBbrZONzab23BPpKBe/LdEsbIFl2HMr/+R8Iusq9THt/JLKFL
         SV+kh6wNrLzmw2/voga4qOOhRMB1r2s8C6ON6gYC5tcOWvfPy6xPv+GLrG2P0Yh7Y7Ev
         AYPw==
X-Forwarded-Encrypted: i=1; AFNElJ//raBgF/2LuCzVynnLMI6Zb8FnoPAvGLq/+o5+Ue/L8S2bqyejAqzvTssB5kLDt+/Y/nkxLp+nKOA+sLnn@vger.kernel.org
X-Gm-Message-State: AOJu0YzSR2lPDSpiSCFN6W6mpePMz96e89STuDSC5bC/FY6WpUpxjZo7
	H78TOJdhTKtrBzYJSC+JbMvJ47C+2rPbA9+VAoa8AeZUYEw2z2oG9PDC56k7RggqeHHeHckIFAs
	FcIir/EobCc2hIOhtpWcxPMtXvsbW9tol/XWxZIRjUNQQ02ZngJBDDJUpNpdCc6RMvKvL
X-Gm-Gg: AeBDievtCIYfh8b8pAjXgYGykl2osz7Q/i4sRb46W8EIEh2Uq0AG4tnwrlNy2qf4kmq
	lRuzAooDj9WJ4sE59ut92lDEr2Z+G0HCg3Ea98Kfcl8CttAhBuOku9X3vvGUACvHe0AqNovQcja
	WYpTTTtxvdUQQATOIwYCtGiXwxNYE0zu7VguO6yImgVV1b0JRsFDMvJje0HJ49kRvARAHwge1ti
	Xvrbg/DQ/kDLyxp9I0wHZH2p9ZC/Dxu0qOFvDb0QNRPA7mOCuWIJtMNSwFMLwX2G7/+O8JthOPu
	RwWYP6HjBONxF1oy61nN9Xi4Ti3D3Ykzw5tN3Mgk6Yzlk6In/k01dbKVJrMBbCswOLM453TLf1c
	p2CpZuQVycexx7fBgpDAorCdbW2tZPMbWvHCsenXAMiBGmTHyguhVn4wIMaEhsjyJyEOvpY4oz5
	V9Rc+l25COs9j7mg==
X-Received: by 2002:a05:6122:a5c7:10b0:56d:a70d:7f06 with SMTP id 71dfb90a1353d-5750c2f4acemr992708e0c.0.1777888771485;
        Mon, 04 May 2026 02:59:31 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c7:10b0:56d:a70d:7f06 with SMTP id 71dfb90a1353d-5750c2f4acemr992703e0c.0.1777888771051;
        Mon, 04 May 2026 02:59:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1e8b5e698sm117031966b.0.2026.05.04.02.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:59:30 -0700 (PDT)
Message-ID: <a90cc3e2-73ba-4ee2-a607-e73160cd3e9d@oss.qualcomm.com>
Date: Mon, 4 May 2026 11:59:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
 <20260430054422.2461150-2-priyansh.jain@oss.qualcomm.com>
 <c369dcd6-eca0-4d01-89f5-d19a41fd1477@oss.qualcomm.com>
 <10c07347-a0df-42d3-b216-5150817b9ed2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <10c07347-a0df-42d3-b216-5150817b9ed2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNSBTYWx0ZWRfX7goL8+TyKTNq
 b0gdKApOyZePBb5cSLNNtB4wKK19oUy+8iGFrcq37vb36qK464M0AH9sMwVKlyAA6NIctLA/MmJ
 8ml2qAHQm3IlaFxpmCUPNr62AAf475+gQ7Wl+goacXWxv4i5a18TyDZeY1/uNtLDUJxldK3tBuP
 srHr7nKbXQyRUCtRFD4MZZ+mw/m24HYxjA8wAMyPV362v8NzgyZlTybg8swEwr6KZLOsLvJyUCm
 ryL8ZvFTv3eNxiRwI+M7Q6bwfrgnM6mVTYLVX7GKGN0rXMqjBUHkmceyjQahq/U9AEr6E1w3EHp
 SWwnMj9/KB/Y00i4H7T3xGV23zQgfz+ENxAmloE/PBCCl7Ko3+3QK0rRDeRdwszWDPsrMXlYyyd
 lQjmXslypUYotSBexbnwoqlpQXsnV47UhGzr16a4EWU959nDrJqSSfJFdHLBHp/r3opd9kPqjCt
 vTUwHYbihMsDi6wVAHQ==
X-Proofpoint-GUID: ihBGbsVqmzy-KlAXC8L0MCw14y6botUN
X-Authority-Analysis: v=2.4 cv=bb5bluPB c=1 sm=1 tr=0 ts=69f86e04 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jjc_y6zsabJUVXo2qFUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: ihBGbsVqmzy-KlAXC8L0MCw14y6botUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040105
X-Rspamd-Queue-Id: 4E83F4BB533
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-105679-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/4/26 11:42 AM, Priyansh Jain wrote:
> 
> On 30-04-2026 09:21 pm, Konrad Dybcio wrote:
>> On 4/30/26 7:44 AM, Priyansh Jain wrote:
>>> The existing TSENS temperature read logic polls the valid bit and then
>>> reads the temperature register. When temperature reads are triggered
>>> at very short intervals, this can race with hardware updates and allow
>>> the temperature field to be read while it is still being updated.
>>>
>>> In this case, the valid bit may already be asserted even though the
>>> temperature value is transitioning, resulting in an incorrect reading.
>>>
>>> Hardware programming guidelines require the temperature value and the
>>> valid bit to be sampled atomically in the same read transaction. A
>>> reading is considered valid only if the valid bit is observed set in
>>> that same sample.
>>>
>>> The guidelines further specify that software should attempt the
>>> temperature read up to three times to account for transient update
>>> windows. If none of the attempts observe a valid sample, a stable
>>> fallback value must be returned: if the first and second samples match,
>>> the second value is returned; otherwise, if the second and third
>>> samples match, the third value is returned.
>>>
>>> Update the TSENS sensor read logic to implement atomic sampling along
>>> with the recommended retry-and-compare fallback behavior. This removes
>>> the race window and ensures deterministic temperature values in
>>> accordance with hardware requirements.
>>>
>>> Signed-off-by: Priyansh Jain<priyansh.jain@oss.qualcomm.com>
>>> ---

[...]

>>> @@ -125,8 +128,7 @@ static const struct reg_field tsens_v2_regfields[MAX_REGFIELDS] = {
>>>       [WDOG_BARK_COUNT]  = REG_FIELD(TM_WDOG_LOG_OFF,             0,  7),
>>>         /* Sn_STATUS */
>>> -    REG_FIELD_FOR_EACH_SENSOR16(LAST_TEMP,       TM_Sn_STATUS_OFF,  0,  11),
>>> -    REG_FIELD_FOR_EACH_SENSOR16(VALID,           TM_Sn_STATUS_OFF, 21,  21),
>>> +    REG_FIELD_FOR_EACH_SENSOR16(LAST_TEMP,       TM_Sn_STATUS_OFF,  0,  21),
>> ..this change feels rather odd - the existing regfields seem like a good
>> place to handle this register map difference
> This change is required to ensure that both the VALID bit and LAST_TEMP
> are read as part of a single transaction, in order to avoid a race condition where
> the VALID bit may already be asserted while the temperature value is still transitioning,
> potentially resulting in an incorrect reading. If needed, I can rename the field from
> LAST_TEMP to something that more clearly reflects a combined representation
> of the temperature value and the VALID bit.
> 
> Let me know you thoughts on this.

Hm, I somehow managed to skip the connection between the two..

I think we could retain the current (pretty good) containment of all
register differences between the versions as-is, with something like
this diff:

-	ret = regmap_field_read(priv->rf[field], &status);
+	/* Fields within the STATUS register are only valid if read atomically */
+	ret = regmap_read(priv->rf[field].reg, &status);
	if (ret)
		return ret;

and then falling back to the prior definitions of the VALID mask etc.

Konrad

