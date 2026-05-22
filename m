Return-Path: <linux-arm-msm+bounces-109244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFfXMCQzEGqVUwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:42:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AF75B25CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4CE53013A79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958723CAA3C;
	Fri, 22 May 2026 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNG1RXc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0iXFsYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF7E3911CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446070; cv=none; b=YKSfVF8O6BLxN1fV0mjnsDDAiDkHjq+B2KnRVePdSAthnmxYKqLk0q/DZCX6vlp0TQcc/vGDWv0iYtM8fTCaS05SCLZ4vgWiz46xH7H7WBlRNHePSvdC5CYTg0LpXIhw+ukFaBGzc6FdMKoHqd3FkqMn3OYc8jgyxV4Ke1UsHu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446070; c=relaxed/simple;
	bh=y3IuxWVbfihwfZfgLeBcRjY1oAwsSCax75MFWUkmmRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RbksiuvQ9cqGu9iVvWlGrHqZZDw//B2nEvGQ1JthDO+MOCNSskZ7ayIDvHsLTPtfKKQx5ZOl8g23//C9+HrQH0EG3ugRnUq3zSXWz4rGqcBaDwmbTq3IPGxIPGf7X4IDRt1RAD1Wn65qe6Q9UN52PgQ8/cG4WYbQd0UFp1R6HL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNG1RXc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0iXFsYb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M76HhW1297965
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcQe+UoAJYQdJcK+S4fBmdCwye0gDdCM9Uba839eVo8=; b=HNG1RXc7UPwT3lBr
	AmuXsLp0+r3XGXmStneaEMKZN51GHZ3qtHIVMRceA3kuCDhPa4RuEKs+i5z5HT3G
	xEiBBt3dJVqG0C4+jAf4B8WcWXe1D/nelXrdUKBy/AeGfKdQ0qcFR47eY5tEiH3I
	dmd+p194BaTHo0Qw/jur/2sfPn5b45cgOnXkSWKM/fBxncHcYLVBBKHjUW/gdNwH
	2rk/6kZlmgMdVFay+SluAUn/nb0P6AaFIIm5W3XerGSnutShGDNigKbl8FAV3UYI
	AisJ/ZZxh9ahUmu9Z6MOWyw3EY7mwp0V84gZaKnCMlLCmNOLoJKvcMyIvT2hmKLz
	OxkThw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0ahu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:34:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91345d517bdso158720685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779446067; x=1780050867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcQe+UoAJYQdJcK+S4fBmdCwye0gDdCM9Uba839eVo8=;
        b=V0iXFsYbBndtYKPW5As9Ex3h0v3zlND09FwYeHIZYGKAYHQoDXzGzlPXB39VBx7WVD
         oLooDiur7nQGU8XXDwChviaLTTfSsPYzXuzLLOiUzxtBjwsBIRN23cOB1SOoSPuHPqjg
         Let9qhOhCaN4HXP9c1P05cjez8mEofNo4SiHQjSiXI711IHyscLWGZP/g5uEcfYD+dLa
         ZZXPEveBrnen97Q66LRmzrixBLg6QKKG+2ZLOz3J5n23x/cDfsPwJLR/sNOJd+v/y0fU
         GM6GUsYugx9tmWe7za6Gu8oWaCvFX205QFjuNdDv42iYL22EA4hGCKG717dEADBvfZP1
         BbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779446067; x=1780050867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcQe+UoAJYQdJcK+S4fBmdCwye0gDdCM9Uba839eVo8=;
        b=DUqhOajvkrs3OSh9TUEOe2AfS+N1O69vWGqgK6aCN++tfFJGtXwKy4yqsXPDbTVLcj
         TxcpYv4ifq/QVP3kcYUkGYlmod13jn+ErsBpD7c5G3DpVh2Ie8LOcI10IiXhihKHJ5Zh
         r8fzITXr2Qofnn3dBL/ZHCpzm5E0Ffa1kIubVQFexL9knI1Noc3XA2l4ZIS43RFAVr66
         ioo7zOHEZhherWhPR3mF9y4PiR9OT4Poa4onMDb2S7kvJEvPQ+ZXj+cDXv7A+gIj8UtW
         OvRp3nEVdmVTI1tqHnK3CjAZsyWgL2Jit7t8nU0GIkS3ov5EkgVQZ1Y+46Qukg/Hzzaz
         g6bQ==
X-Forwarded-Encrypted: i=1; AFNElJ/s9ua1lxbOR4t8Qu6fXKlWxa7RXwtPXntyeiRJMrOWefkAA+EsO9QMNAQ8PaSbF5kr/P7vQ1uq6ZntCrX9@vger.kernel.org
X-Gm-Message-State: AOJu0YyeX3AuElMfFuuJkeXBvywP14tLiC+bP3xP71iANgtVO2n6C43x
	eY65VWcd94AAHAQZAFdZ4NDY2dzwxT6ROIKtyVUIop4Cxg27pKwd7hAiAkQ6uAUGn23p55OlZc1
	cfIw1WtlhrNNJO4EwbsW3NXrxfugDKauXhUN1aVbjmM2ffqqpZave96i79GpoqF35Pstm
X-Gm-Gg: Acq92OHT4pM+Cs15AJg6PNixx58u366vZXjOCCYBU9vukbd6m0hcelI3uqM24ThK/Jw
	EwwVQVHaJN5T3ZHlgRfswP1AzQGbKDPAgvuOPSbnby2xhUWPH9gN6JZCxs6VuiUZIMJCkmd1/6h
	QJFKF3uItmOzHrvkE7Us/VNTrnr5FxXQfx3SbXMVlj/pSl93D0bEEW6rI7z6LCWEJO5ssDGIiZ/
	vmtKMQ5diXTTgYginHccmPo4JBk0CM2BsZmopTMg39R3saeom2YPyeECjkjcokcC4I5qzSuqBiv
	eJkeolmyZe2iAALWBlTWghu4K4idTHbYkof6qGRXoAQhr6NxRseynfwyCMnga6iMUUq7/PA84F+
	cUh2VgMVaZhyLc+omOz0PqIeVihk57FIC5H53IiNtexg1cg==
X-Received: by 2002:a05:620a:6603:b0:911:e556:c7c5 with SMTP id af79cd13be357-914b4a3db29mr300110885a.8.1779446067682;
        Fri, 22 May 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a05:620a:6603:b0:911:e556:c7c5 with SMTP id af79cd13be357-914b4a3db29mr300108085a.8.1779446067273;
        Fri, 22 May 2026 03:34:27 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d023sm525800a12.5.2026.05.22.03.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:34:25 -0700 (PDT)
Message-ID: <6129602e-6dfe-4194-9c44-b0e4fb4da1a1@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:34:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
 <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
 <86f76a81-832d-4ba5-81d5-38b46b7dc0a7@kernel.org>
 <6c595a5f-b979-4e8b-ae77-d28d24700588@oss.qualcomm.com>
 <e07085c5-0fe8-4ea7-8e51-ebe104e7aa2d@kernel.org>
 <82019c2e-6b6e-4edd-91b3-a28ef6eb09eb@oss.qualcomm.com>
 <df22ebcb-52d6-4a6f-852a-6d6ed376e313@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <df22ebcb-52d6-4a6f-852a-6d6ed376e313@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwNSBTYWx0ZWRfXxKCTOh02h3Rr
 Oh7KeFQqD2Gfjl9yz1pxERKGxO+2zNpwd2hsoN//EoI99r4xRgyQXIJNYjF0bFCTPUCp6HimHe8
 jQK/2G76fQwbGexRZyT7jCXrRnF/y9+ZoAmMtK5bMQt4xIPJ6G4o4GMXiYWIgzRBk7+iD2sqfYX
 zTKKU09Uv/xgvtx8n35NIglXmUQU9XNZ1NPVP4uw2fSwn1Ch6iOkw30Y1+VZjowdmNuDnh0mHdZ
 51ETmMqx1aWpJ4Km0zuZTJJfPkLyChHw8R25917qCqm1E0exseKoqJbpId1Pv9mL6OvZ99F5sYL
 Vfn7s7wkqHWDB3ckaXZPbKTFr/IJHGhZQ0RHQCUmXGdv2czTNWCBRGP3LXTbcwWjxnedPH2I96b
 kE2awOCiX948HvhBnmj8ThM7V52edfxtrCwRcl32bmB1Bmo/ZF5/A2CUBVyzE3ICkPtdw7j0nz4
 EeW6eIOUIQYlbRmrWOQ==
X-Proofpoint-GUID: khNaBLVh1lI0zmOMMV60eiik4iHq6c66
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a103134 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=YeHrj-Ycd-3U9Jybuc4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: khNaBLVh1lI0zmOMMV60eiik4iHq6c66
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109244-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 33AF75B25CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 12:32 PM, Krzysztof Kozlowski wrote:
> On 22/05/2026 11:24, Konrad Dybcio wrote:
>> On 5/21/26 11:58 AM, Krzysztof Kozlowski wrote:
>>> On 21/05/2026 10:46, Konrad Dybcio wrote:
>>>> On 5/21/26 9:20 AM, Krzysztof Kozlowski wrote:
>>>>>> Since firmware does not have a way to dynamically tell if it on a
>>>>>> debug-board powered device or a DCIN powered device, We are required to
>>>>>> add this new DT property.
>>>>>
>>>>> Neither debug-board powered device nor battery-less will have
>>>>> monitored-battery, thus again, why lack of that property cannot tell you
>>>>> what you need?
>>>>
>>>> A device with a battery will not have a monitored-battery either
>>> But why? If for such device property "no battery" is suitable, then for
>>> me "monitored-battery" is suitable as well. IOW, if you say that having
>>> a property describing batter is not a accurate hardware property here,
>>> then neither saying "no battery" is, because no batter is basically some
>>> sort of battery (just like empty set is still a set, empty array is
>>> still an array).
>>
>> The battmgr service running on one of the remoteprocs already has all
>> the information about the battery and it also handles all the type-c,
>> PD and charger configuration, only letting the OS know about the
>> results.
>>
>> Hence, unless there's some other hardware at play (e.g. for custom
>> 200 W charging), which wasn't fully implemented in the QC firmware,
>> there is no reason to describe a battery separately, since the OS
>> can't do anything useful with that information
> 
> That's a good explanation and it implies: "no-battery" is not suitable.

I agree the firmware should be fixed

Konrad

