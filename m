Return-Path: <linux-arm-msm+bounces-94424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK3WG7JpoWkUsgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:53:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C41B5995
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DCFD30CF008
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3824833C53F;
	Fri, 27 Feb 2026 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cV/7bKGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOHqeHPn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161DD2D73AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772185850; cv=none; b=mVTh0xTnpdqOXjAPaqw+z9hsahYnAqAl8+hTbtClRoxqBayXIF7LAtUWnCTtW3Z12eQsTUf4oGxo75kbxVfhuFzDEDuroQqax+BiDhjIp9j6Bx/+X46UpphlQyb4Au6TZNlWHU2uP9PyWsQRlpWvsh5DJBL/CppUYxYa8GBiWMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772185850; c=relaxed/simple;
	bh=Dkl45KoqTHeS5zqO1ZGLV1xCurV93dwWOQw1uBuq2HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxfLEX+mN6x/Zw6XhlPq0e4XLtVGLDva5iFziYAOYs/RtEKoDIxB9uTG6avGGz0iaik0HF2Q38UsX1wbKQQQhNDzP7EA8GbRkHbJuGlpPMO94h0yNLlg6vz52xtS1LpCD/h1ZLhzLoLGhI7KROMaPu8+HvMvS0rqtR1LOYNr9bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cV/7bKGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOHqeHPn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9kB5p3945768
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dkl45KoqTHeS5zqO1ZGLV1xCurV93dwWOQw1uBuq2HI=; b=cV/7bKGszS5R/9hQ
	1FK4GnQAuNPgiSsd29RZTg3DMbRoQLj+dyqRSEcFhthLLwdn0rXp1XgzxAyL6KHU
	BbEV7CE/aZcEmCplIUzIvrqkiwumjJVtg4AV3O2vacoU4xF0lcCKalz549z6ns69
	WFV20Cy3x2b+POL5vKLKt9yEr2COdkMT4QzYgDqIN9twrAEWKtFxvl0oRIK7tIJZ
	DTkx74IevLmA4asNMu1SXcoK073gRugvuRlTTMVIv06QNQd0ZxacjiPGyviBenza
	XC7Xu6lNh1dOvi6XJz/cmKeO5bc/q8qPnUGyS3MFyGAhWtRtD4e5y6kzPTT1NcH1
	8rujRQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck8x880ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:50:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824afd103eeso698034b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 01:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772185848; x=1772790648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dkl45KoqTHeS5zqO1ZGLV1xCurV93dwWOQw1uBuq2HI=;
        b=HOHqeHPnxRDRPfCArlqW6lL/VyaIOqH/xkhixB9+IK+n+xkdqLO9KvRnKPxUFnJ+Sq
         NOsOAHBN233Jhw0su1Vs7FVDgh1qPK+drfUvkcgeCoDmHCYusIhFfTPcZYJHsRvarG7N
         eF0ZLAPLJHpsoeKe3gI3KJ/apsmBF26qGDb5lYZa71Co3K00u22EwUT5QcicdjwTjWx+
         ApnlX9JAluuUYA/lSFvUYd6+0STE7t3GEfoyEx6FcIvCg03bpiz8CFckOmHEkb8rFArK
         wx4gq2+uXJ5QuJcTLrMOKsxycZbkeEswF+pCqaXztqwsBjposHUsoKvaVt4xuFbtAZGe
         nRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772185848; x=1772790648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dkl45KoqTHeS5zqO1ZGLV1xCurV93dwWOQw1uBuq2HI=;
        b=oqw091MMsxwvK0dPMM1qS6GcZEAdSyEogWMqN8Xjahzu/bajYM9dAGFa2NyqYmnh6O
         6OuearRZcEeMXSiHKaKClKagC4yC0Zv9PYgIBTmEQnTVJfn2pInv3y2w1vUXOE38EfbY
         YhWUwTOpxmyK2G386v61b4niPg8NeOc6zo01PCqsZdM0KqM1rIwix2S1kzepGxMdnJuw
         NLKXld1ozu1dJeZK2TTcT3LhOTnZsYzWljxiT5yCvOMFaJdN8lkeML6/omXzrZoo71QS
         GTyB5tO1/5YrvyU9Dlp/I6wq7XbCiqYYPE7lyECvENNRr79tOU5F9dGg8gQjknWbvYqb
         JYHg==
X-Forwarded-Encrypted: i=1; AJvYcCW7R2clCHg9sMegazE7pkGdQEAZtwZbGWNdjKvyyqOGCJRYxR48A7Dm7KOIaJHTSjmIoNoUeQIjxd1zW4jN@vger.kernel.org
X-Gm-Message-State: AOJu0Yze4EinsNjWkeMFCveKBG6ECv+MpVxM9yfXNZeLLA5NDsrmqv1q
	u/YP05fsC+Tl3XDBtKO96rp2eyROHABIZCrBRYEY3MSI0qRLfWh5MzkAhIFUriIQWbVAeVF0aYW
	j3ygMNTRN39bwNmYLyJU+uAaXxAaUUekXOGNJ9FwZMuu/x288xTByIXb09Au6l+Mx9Kl5
X-Gm-Gg: ATEYQzy4uOMmwdhrggsk4x1HstWRHYNv8Ze6Yyl1wl20fG0Xz41Bo2a8D+69o1WLpsg
	Y3XirgaWbanslof+OI3ev1XXB9pfwJfK3n5fThyrkwRqjn5A4mPb2oEntl9XFZGLH8FGU+Zrp7B
	hbgcp6jBdrfvIKUR1WciV1SE74HGI/ETuYZetwZ43EnOu3/ilnph7KGUbiYxWrBkrc7FI4cisDs
	O/S06gND+DFr79STq3z2bumi9kN4RYiGlFh1FrUZ2MLtDTIiEW1ZlmyZu9dm6QINc1HaZorKx5e
	EGuHoq4ngIFX6+b4pl9MK23B8GblAw5bahF3xfG3EYbW1bHvepsCFk+n+S13kMlEv5ptmxOdBdP
	f17IPGjYLmsP798IO0cGM1AdQEJ0vEGZM7DTHz6FoDJ8gCju99g==
X-Received: by 2002:a05:6a00:3d48:b0:821:8145:6948 with SMTP id d2e1a72fcca58-8274da51b38mr1657311b3a.7.1772185847699;
        Fri, 27 Feb 2026 01:50:47 -0800 (PST)
X-Received: by 2002:a05:6a00:3d48:b0:821:8145:6948 with SMTP id d2e1a72fcca58-8274da51b38mr1657286b3a.7.1772185847252;
        Fri, 27 Feb 2026 01:50:47 -0800 (PST)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4dc6dsm4732240b3a.6.2026.02.27.01.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 01:50:46 -0800 (PST)
Message-ID: <1b34bdcf-79fa-45c1-8ca8-8610c15741af@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 15:20:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: monaco-evk: Add Interface Plus
 Mezzanine
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        richardcochran@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
References: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
 <20260222173545.3627478-2-umang.chheda@oss.qualcomm.com>
 <a7777e5d-f9be-43c5-9f3f-4d84e16f6e89@kernel.org>
 <jncbztn4xohzns734i4o2hsherdshjgxqtiglh7zf2oz7nkujs@an24wf3txymy>
 <87e3de23-cee9-4789-87ca-e85826af7760@kernel.org>
 <sf4jvwou4wtlxamwgkwb5c7adujz6dwoqwws2aq4z7jjvblbvm@fb5kqkt23ktm>
 <a3b01ad0-faf3-480e-9320-db7b7c426a3b@kernel.org>
 <2pcw4qrgxu2fwhssyf3plu6h4anwiofvdx3ppnfbngibfm5lxz@7ixcrh5jk4t3>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <2pcw4qrgxu2fwhssyf3plu6h4anwiofvdx3ppnfbngibfm5lxz@7ixcrh5jk4t3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WZwBqkhX c=1 sm=1 tr=0 ts=69a168f8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=40BG639Icp96ZrZOFxkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA4MyBTYWx0ZWRfX6wT2O184xvlG
 e5kzj0ECpLl4qpXc44goh3aRMMOXA8fXx2OEMQNWoJegzEOBwfk0FgoJsTeodgcxjZcVPHnIgYB
 XoRgM4u98BdMSeLSkT6f0J4LRzk5AfoeggIBh61T4W+6cZ7+p0h6muW/AuaABI3/6qtt6qVH7CZ
 kr6ikh+2+6Jjz6nX11IzmdWMtZ5AW8GOtMOIUN1sPqEkWmiJDIeZb/X39zD2rx9uVQSK+pC8+5O
 +bP58hJktuZKGu/2EiuNmfkF2IV1KSQub6W4OFSTQXMpN6jc5XaeaWKZ7xRSEzlmvcKOPrgE9Te
 QFNJGN3GeeP1cFCR+MqvxEjfw3tEKgjXPHZDBlUqGtrUdLATdn++aefQIeMxwonTKaittAibn1R
 cbGlzGxSE6sp8wuxhwcnPXWglVV0ioxsQQJW8rgEK9d/xAfobBElEqTF+pgXHqDXQo7etC/x0mL
 ZEamSkMgjYfCIUDad7Q==
X-Proofpoint-ORIG-GUID: rnKT-iN36Z0KVP4NQCg0bvdSUZ446APR
X-Proofpoint-GUID: rnKT-iN36Z0KVP4NQCg0bvdSUZ446APR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94424-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C23C41B5995
X-Rspamd-Action: no action

Hello Krzysztof,

On 2/24/2026 3:39 AM, Dmitry Baryshkov wrote:
> On Mon, Feb 23, 2026 at 09:37:53PM +0100, Krzysztof Kozlowski wrote:
>> On 23/02/2026 20:02, Dmitry Baryshkov wrote:
>>>>> So I presume what you're saying is that we should at most declare one
>>>>> level of non-controlled fixed regulators?
>>>> In general, non-controller fixed regulators should not be there at all,
>>>> except when they serve certain purpose, like fulfill the binding
>>>> requirement. It's their only point.
>>>>
>>>> And a chain of:
>>>>
>>>> A -> B -> C -> device
>>>>
>>>> is completely redundant if all A+B+C are non-controlled.
>>> I think that came from me. I don't consider that to be completely
>>> redundant. It helps in reviews and in some understanding of the board
>>> logic. I'm not asking to implement all the intermediate regulators, but
>>> to implement the meaningful relationship between end-user regulators.
>> These are not end-user regulators. These are fixed things which no one
>> touches and no one needs. There is no single purpose for user-space to
>> see them.
>>
>> Why do you not insist on defining all of such external oscilators, rest
>> of regulators, all possible little ICs?
> So, where is the boundary from you point of view? Do we define fixed
> regulators powering DRM bridges / USB hubs and other similar devices?
> Or do we do it only if the bindings require us to do it?

Can you help share your point of view on the above query from Dmitry ? In this case to adhere to  bindings requirements

Is it okay if we define fixed regulators like A - > B - > device ? Instead of defining all the intermediate regulators.

>

Thanks,
Umang


