Return-Path: <linux-arm-msm+bounces-114839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o6U8AAcDQmpSygkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:30:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 881576D609B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:30:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WcAw7rjB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kxNRmXJU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114839-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114839-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0ACF30090A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B13837F755;
	Mon, 29 Jun 2026 05:30:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3641246BD6
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:30:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711043; cv=none; b=Y3ujY/Kqtou4ZYohRFfn79n0mnpsVXjnafP7D0ddn5MPGujOyx7od5flGNTtiRLWvp2KylFewg4C70UoVzpcp5oFVLLXbU3yRj9HzIDuVkfGRCskLCIpZ5xLg3ZZ+P2dXzmNLhoIdbTFsTZuLFpBszAj9bcDqHbhjXRhQ8DR8f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711043; c=relaxed/simple;
	bh=BTcamW8GZ/hEv32U2vrDgn88rzWxa9uG7P/MYxGEJOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5AeW1T0q6kJ8OdflqYuk8JnnoKRHbBU1vBPcU6SUpSF3fPISSMqSEGrWBesktcMnuf/NoCTRQQMC/xovS0H3Wcu7mzl6cg6J36X2FLLgjROmZXSO/PvBvTfnpUV/4GOhYEA0aAXG3BkLyYVSRh3RAEQ50I27l/LB7c6iVkwSzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcAw7rjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxNRmXJU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHqt1771391
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iYaZQiVwCPWspFjX5KeDzhs18wLFh8Mq7dB7wCjTXs=; b=WcAw7rjBzEAhOcrk
	tHuMPqSApmwqRNWRuxLpQkzhOaqq7fAq2x1bLM3scJD+t1zfm53DCzSzrdq5VzWs
	IoSxs9C7mXZx0hjLYOb7OAf3eLTTOtoW31w9DOzm3hHrqjJ6eNfOMrFz+1qrVU2L
	9kwg4wc0SgJAiDBC66Ue88gQJs0a1k9uPw21NH9/BODXwOp3vWBz3oQMTCmDECXP
	6qhcDOJhxVEsJEbHDY0xEr2OAQVrIrsHE9lkTSSW5yy+7dcrlTrkJuuLH+4i++TH
	ZdXTnxs2ZLTuUclffiV0WYlRbuj9hl4TKnX7KoYVlAwfxDKgGftXMntZpEMDkQrj
	vBc+cw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tumkhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:30:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso3244275b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711041; x=1783315841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0iYaZQiVwCPWspFjX5KeDzhs18wLFh8Mq7dB7wCjTXs=;
        b=kxNRmXJUPPgOoG2EmO6Krl79/YvPDct2uf58bP533wkmLrD1uBzP+u7SqKx++PthXO
         IDr03FqQeJHXfdwSODcbORkijU/DnOQks6PI+ndB1BeTHIIrBwnBY/eVM5x7APmRkKkN
         lvyM5TrydGXs4R2u4pOkLorYOQsKtdkFWx8JQvM3pvRDxZwke58DxEzmTyjewQ5EJXIw
         xXRLjgb6I1iQyCDvbINH5+Pap1tCk7kJ+Y6RL92fR13GDqU0hZsuaCneJRYBr1TyMa0Z
         cHvt0wjpA2896zHKeVBQq8er8MvAJ146zihWWu3aEUP04gEIDTgPGdT4WqLTtbylkyDz
         mSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711041; x=1783315841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iYaZQiVwCPWspFjX5KeDzhs18wLFh8Mq7dB7wCjTXs=;
        b=dAGozp1sflOpURVBzkPcm5Sq6N+ol0cPuErObHFXdKMgOFaR8jcrFmMLcLxDBaSL98
         G+chYLJ5l8QnVuDa+JaktbWm1suDMJR3i0jo3aYoRHETddpD1JuQ27O1uxfpowUlVkiI
         vG2HpBShEq0nAc1jzR2RouieQjd95TIs4mCn1VDF6TJY8xqUqyL9pqoOlrXff3/ieD6y
         CBCFb2i3HP6Z7WKXhjIwSOQg0J2KfM1PbTokKEmE7Wl/ncwqd9wX/df74qgFXFY9Rc7Y
         SRykE9ke561U4sZY7Sz423a5UKHvHf+r4YV+jNcJa5ZvEp2rVBsIEh4BOu3iGhdlQLYH
         gmsQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJ3JcW8tK1pU6/yHahEAQVccbwlg6UB1FaZnNiMCBTpBlkCZ2aDSepFx++rHzHsqcrqesIWJUBLvu/K8VF@vger.kernel.org
X-Gm-Message-State: AOJu0YwrjhSy/cOVq/9XXVlXIFpE1BcMa8gekETjix6Kc9T0d+Ko1P/Z
	c8bvU1uEgCx/iCi+s6PWaBNqU/DlbaT1hfPIZN97JcpPnsnXi9JMzeK2zui7MXQS+remGSjPitc
	iCVi+x3Uxi52nOACJR1P7kera+Bay8zy1t1Hd/4xM2tAKgDGs71WzRr6L1DMye8FhJvEo
X-Gm-Gg: AfdE7cly3lHI/0TpqTTM7/fLLIe/XkwmzxJGbwPwEDTJR4xHo8IzoaDsvcx4vIsKDIa
	oiT0b33X5DetRopUPGwcJL6S9OiDk94WjRIg3LlqAgDk3nADu5dU41tPAEYrqHMzgENkt6NJd4Q
	sxfEQ6QQKvWj8yd2zVdc6yOQK2n9uuJPlgZMPQgwncqaNxq7Wvwf/WnaoViN0Odhx/J+KHaIQ7K
	RAp2i2MKWJguIYQdUpahDDJ5QTxgmOZ+Kk0cS6ZIkuLg1usnvLRq9vQIkxTIX/adZgap5NKMtkr
	NQY0Uf26xAenzetZgpV3z6p9/QstE+mqg5ziV1YLevBABlQ+R86Owjw4ADEclJDHIKHmHP8lvkg
	iU6it4dQNj2USbVoApMR0EhHLETDUvoWZv8Ik4NEoNZkg601zqg==
X-Received: by 2002:a05:6a00:988:b0:845:4d71:8d15 with SMTP id d2e1a72fcca58-845b3b88d14mr16313670b3a.37.1782711040402;
        Sun, 28 Jun 2026 22:30:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:988:b0:845:4d71:8d15 with SMTP id d2e1a72fcca58-845b3b88d14mr16313645b3a.37.1782711040031;
        Sun, 28 Jun 2026 22:30:40 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847864a5775sm1017254b3a.48.2026.06.28.22.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:30:39 -0700 (PDT)
Message-ID: <03f6c057-2d67-4292-84ab-566565ee4a20@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:00:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/8] arm64: dts: qcom: shikra-cqs-evk: Enable sound
 card support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-7-mohammad.rafi.shaik@oss.qualcomm.com>
 <f92e8c9a-1f70-4f94-874b-c247f47c5af5@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <f92e8c9a-1f70-4f94-874b-c247f47c5af5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GcfRYNXAyJu1qY3VT0csUZsHiinrKAFd
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a420301 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VUSdPHTc8rOmLbK7xEcA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: GcfRYNXAyJu1qY3VT0csUZsHiinrKAFd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX7sHk0D13lnkA
 /JWmtL5i9jXcLY2YwZ4CfhuLLyMkSWFUoueRnAvvyXNVpOVtXPfmHIaGqi3RdUgMH5hSgtW2HRH
 0WA3GQ4Hh0iYfe1oIG5WBCJiYuze2sMuCkxWAHmyQ8uJdJjwo+ngOJranrvhEcjK2/Z+8/Xv9mp
 Gyh3GWjaA+ekaLifuO9N/zx0Kssswj058PE/HJecnLl47u3hn52txC8nNG7c6ADtIImPPHPwqCm
 k9TLx1fVaocJuZW45fgMqtoeVoUeodfVloiTtktd9fsiFMFqzmkaC6yNMEq0Q3fZbS95rDyh58m
 uuANspLldacgjzd/WjHz1zwk69q8GDLhPNMkfk4DwensxKAqaNhRCHA5/zZuRIR5VqByyaZGPC6
 +WSMd6gLt6q3B8tRwQ170hbLVH8kUesDW4WBAaNARwJm1D41QINoSZzogNSc8ifPDMOqRw5PxxA
 2zm2IsAacnGuOtD0g1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX3EMNOhJTPj6o
 cCmXLbxX2J2CF9tJ5GLm9yLX5RIv9YCv3G47Dxwwz6FhwD1462oT68vB7XErRFcZhW1FenaqKgq
 gp4YAon69AObOXY9RK5EvixfrLp5OGs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114839-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mpratyus@qti.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 881576D609B



On 6/22/2026 7:17 PM, Krzysztof Kozlowski wrote:
> On 16/06/2026 22:13, Mohammad Rafi Shaik wrote:
>>   
>> +&i2c3 {
>> +	status = "okay";
>> +
>> +	wsa885x_i2c: speaker@c {
>> +		compatible = "qcom,wsa885x-i2c";
> 
> NAK.
> 
> There is no such compatible. And there will never be.
> 

Sorry about this. I will wait until the compatible gets proper approval 
and is aligned in the driver patchset before posting an update.

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof


