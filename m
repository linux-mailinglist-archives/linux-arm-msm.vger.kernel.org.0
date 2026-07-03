Return-Path: <linux-arm-msm+bounces-116264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D6Q0FESJR2q/aQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:04:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B39F5700F43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:04:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HkSfgyDB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EbPqIA4z;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116264-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116264-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E097E301D4D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881DF37F8C3;
	Fri,  3 Jul 2026 09:58:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B19F3385A1
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 09:58:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072689; cv=none; b=bGsUywSX4gKaHesuCRtm0fX7b0a6XJ3I4ggsIHaXB1MlTOIpL96lriM+9EAfZ79IzuXlQbBR1PithedO2nHqmO0/hh9zAjA+TJ0Gx2GZ9ricemVyoYSGlG/+9w0VyKp6ov9sAwJi/ZI4fkaZgieok3wQmIfQJoyNtF41ApRK/Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072689; c=relaxed/simple;
	bh=dPkh1InzqabcTA5ZvuUUGhToK0ol/DS7YN924PwmzBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+2tXqDEQZzxABdpmxaClnaTWSrW3JKTe4b9E+S/e2g99Fya1Wn2Ry/3kZRaTeAAcgqMB42i6fsqg7im/GFIFZPyJ0pUX+tUsnGlRQSiSZTsA0bA3JNZt3naBV7/0OkeARukW6+I7c5FETY2DN9sR0IYJuEMp1Wyg9nnqXkanWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkSfgyDB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbPqIA4z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IT2U3195080
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 09:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoYKLuGi04jdgLbN3bsgI7YhayAL/qiodIEudy/FMaQ=; b=HkSfgyDBsG1CNfwT
	Krpw34sOilVr1bN21HdFhfBDJlzPAX7Yf785UrcifX6yRQZFv8Z5uYS9UsrZ5nL9
	GRz8BbwWXtwvhUOgAb/Yr6yDgGZw1AZeeTONNKkE5UH+v/Ippp8OJK9lvbuAyOp1
	gDvYHgC0NnvK0PiOXBPNeg2sYS/o53o7c/Mgmanx+uVeo1t+zSjvGq2R1e8THAEQ
	/D4t6ATZl2TuFpBm6gbwjORt7gFLdEWPXOL+ORXH87zX7Oi7kf2ZiWk3PbMF8i5N
	Ckp3jbAQVG2q1JZsBwBO3K4IqMbDFG3++wJeSvITQ3lkAb4ifxY3FJveHM0SkiEj
	JtiX8w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyrjws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 09:58:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4ecd1ae4so7958885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783072685; x=1783677485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoYKLuGi04jdgLbN3bsgI7YhayAL/qiodIEudy/FMaQ=;
        b=EbPqIA4zg+E5PYBAZaqEGXgEQ9mEkKhqmn3GFFWFtsb6vgNUGmx4rmpZ5jacCe5+lN
         xIXRyi8QnVS4vtsyU0ZnuUTopMD0Ne1qUBl2kDZGHIYQ72Ly4Y9VpHOdVYtX5dUWsgDL
         Q+2MU6w8qmUCT2ptAAXlUrmYqc9lBqH79aFBPqIeiuMj9wdrXoVAYQO3uhKGMHHnWUvs
         B3LoQ9tJAhH/ozE8wvndU+X//kxQMyGiZFyyp85qHVoB+TgO1z+cpioRuW1FSYkXLa7N
         P6nyQg3+5AB/K6PYjnFofSWW3WQAkMODQJGZbgBmpq4ur6yMcTcf8c43cpFJJphf/PMd
         i94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072685; x=1783677485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yoYKLuGi04jdgLbN3bsgI7YhayAL/qiodIEudy/FMaQ=;
        b=Spc+2cCVuJN6i3uODZSO0BxQE5q+5s9MBW/yeT/JCDvIwAvC7fV9x5Bo8wvScqUzkE
         EGkhZ27ELCX3e525vLnpkaGlhz9VBTcugB+ZACxbGwKhpaZqwsFPpiYG7SF/liN1J5kP
         EMgftZJ98vu+kTdIiGYWY7gJIWs5K+WobBShxHrXstgEEv7ww66UCPi1AMZDc9u1izUl
         8iCQv/qXQQvfIAVn3xK1e4+DNWcU+ZjqC7hBnJupWXbnEhOJtT1bbs8Xm/45gERDpW+o
         8YM9l1GMwFDIiy/7UMv7Ck9rbVLfeiqXlr3/tRayKUZ0AaQ9YKBEkNKfevGkHjIDb5pf
         /Nsg==
X-Gm-Message-State: AOJu0YxWkgk4WG2PMsjAD9EGE9OjDVaCBL7L9echo9REA4nKqOEOzrmc
	GC78wNZFkIa3w4tS+bXn1bksyf3hfyyWwxRqKU5B6FT7B30XmKkMbbecHZciMbWzdoTae5iffk1
	BTqhCB8vPYYFZfqAgDKQkQGYFrCFGRdMDp/H5UAC5HdpJwQNVoJ0gvJqutiWqzrgHB0Ju
X-Gm-Gg: AfdE7cmebVSoJ+iZbqgo/0Cqx1owH6o2+Xk046RNk9KB6yN0unSGAT1/26+DdbXmgme
	bfGvUW3/co0A96RX4gFhic20iXS9h4yu85WmqfAvRqfF3hVV0x/vuSr+KdxxAvJ6TAktjkFAM6u
	LFuL5ZTaL+hk4aOF7fp1wIZEGSVaRT7r3oKn8TF9NR4LTFZjroP2+g25hA1Z+sm5XajiDY79CSv
	K6Usv6Je6sUe7s0U8EHTEtDl4O1NsduccudWQdInRQJmBk/lYDSovs137pSKbSdtVcQcSxbsFg6
	idDzaqIQfH9pp69TDhczMoKSylZTevkRsk+MZ4zXcGeJZmBpAuFjEIXk/wRj/htw0fHADlTQL2Y
	6kBYUzhbwVU3DKhm6zuhly0NhUOCU4a+4eOo=
X-Received: by 2002:a05:6214:808e:b0:8e9:f62b:8f96 with SMTP id 6a1803df08f44-8f3c9ac0d57mr76961976d6.11.1783072684586;
        Fri, 03 Jul 2026 02:58:04 -0700 (PDT)
X-Received: by 2002:a05:6214:808e:b0:8e9:f62b:8f96 with SMTP id 6a1803df08f44-8f3c9ac0d57mr76961656d6.11.1783072684112;
        Fri, 03 Jul 2026 02:58:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad100004sm2200209a12.18.2026.07.03.02.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:58:03 -0700 (PDT)
Message-ID: <156897ce-8a09-4b80-972d-95cd3b651540@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 11:58:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: defconfig: Enable ILI7807S DSI panel driver
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-3-449a402673d0@oss.qualcomm.com>
 <cfb45d95-7bf1-47dc-96f2-2ea4e9be9e70@kernel.org>
 <580d67aa-9a5f-4fd0-ad15-f57865b79477@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <580d67aa-9a5f-4fd0-ad15-f57865b79477@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NiBTYWx0ZWRfX0lwqnMNtM1ig
 BjD9wHZzna/2Rajy+1znD7L+AhQlqxjybHRyGSfxp7EA+FVZQKQx409g72BqfGLe2KPkFKsYYJU
 UmgEQ5eiLMD6Kms5yvLm13rNsy55Bc1FCX7F5mCVm0QDN5b/QxleSAoSQQacVtE5QD96jGte+5m
 vZ9ESRXb9TIj0rb6jTyP/XBTgz5CV8m4MYY/7UPhdWQIWBrRfz9g6iMp46Xk/us4aaU6lTfPzM1
 NxxBg4M47ALcKNG+RtO7bNCTecduxST4XCI5Tw69Y82CRMfynlgjcXGCGB+n/MsTiGnAaxbB1+m
 x7bZLVnuc1dK7nK/zGbM1MeD+U7YCH0+mc0A2kcj4mtq9RlKrZMii3k2+Emu8dHO4xEdFgQRRIj
 2vfQKr2DxmN7ulkCNudsG5wWqxdkljUXsHy5rZLz84uMmBgLwgVjL9f7VNcSI2FY09LBQlyDJmD
 Ca/EG4xXsEB+QxJGySQ==
X-Proofpoint-GUID: OmQga-8g0QHtsrc61JuXTD_bkSlFN9R8
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a4787ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IlD_5Ku2DeKw3NJ58Z4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: OmQga-8g0QHtsrc61JuXTD_bkSlFN9R8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NiBTYWx0ZWRfX3/YVL4NO5SHN
 0bPeRrQ6bQwUY8cR7N6LoxxWJD8a3G7Ih+dTEpWAyYEz76+6XHc7Mky3LwJ+vjpI4AUu2sBUMQL
 IA90iPcIem/tSGV4Pnyoh14z5OD97FU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116264-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B39F5700F43

On 7/3/26 11:10 AM, Nabige Aala wrote:
> 
> On 6/28/2026 2:14 PM, Krzysztof Kozlowski wrote:
>> On 27/06/2026 12:01, Nabige Aala wrote:
>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>>
>>> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
>>> used on the Shikra board.
>> So that's a v4, no changelog, tags ignored, comments not responded and
>> also ignored.
>>
>> You got yourself one NAK, now second:
>>
>> NAK
>>
>> Address the comments before you send the next version.
>>
>> Best regards,
>> Krzysztof
> 
> Hi Krzysztof,
> 
> 
> Regarding your initial comment "Does Samsung Shikra CQM EVK have it? I guess no."
> I checked internally and found that there is no Samsung specific Shikra board. Shikra (CQS and CQM) boards have this panel and i am upstreaming for the same boards.
> 
> I hope this clarifies the concern. Please let me know if you have any further questions.

Krzysztof wants you to refer to the board by its full name - "Qualcomm
Shikra EVK" or something like that, because you're submitting a patch
to an external subsystem where no one knows what 'shikra' refers to

Konrad

