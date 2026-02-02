Return-Path: <linux-arm-msm+bounces-91428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNZAFpVOgGlQ6AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:13:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A81C91B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDF353003637
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74F930E853;
	Mon,  2 Feb 2026 07:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyDiOQBG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PMSqEZlI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D0A30E0F5
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016400; cv=none; b=ZC3XgT2WV+LJLlJF/EXYdciS7l4pto3uDAezCK+6EDINgIF+psQuPdXoEwraWs3e3BXQ+X5zC2CddeHjg7ky5ANiyvcUt5/4mZzdfCazySq7JkpyUaz+MT7k79BSSp4TWHuktUstt5vuj4h5uvFxz5suKSgjxMGYnzG57LlXkBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016400; c=relaxed/simple;
	bh=MsWpOsGmt7a7s3594oaHh57A1NdI0v8AGDkRbX3mjrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=ZR8avalu8ft8sjyPsWRsrYlT7uHCeVIuKosN1a0XeiiMcfo9z+i5ApiIqX++ac9+RafZ6Jx45PKcyrbHEHcnrB7WWjRWzA2Pzd4AbRn+/QzyJw5NYo32q18Ff7YoKVaReNOA0kcRyinqQST5Gq+UlLlZ2M4ourhU96QzZuGqtZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyDiOQBG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PMSqEZlI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NxuWO1838953
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TOn8WxpAI+xLLi6hCoSt1O1PWlTIigMOrNKcnGiwBLM=; b=WyDiOQBGklyIBbfQ
	vckFi6VMSWQ/GrRlVpCivkJ0jub6gyYKNe+rhs7uSzcj8t5UaeZcuRygNSNcKpHR
	inVRxvT+HzRG13peJkvpFWrPgPxf47twqyKkfd1hFHdene1Jb6T+glhphwz/ORuy
	9FuOGmZRZ8MKo/oRrFbM5NrMEUh0axILn4C6M7RSP/DrsaaUUc+jepp2FPkCOutW
	+7nENTzL4kI9I7I81pHrJ+66Nv4hCJLs39lCJ09OAhe+8z1u+m6oG+b5oP4LbFDQ
	ES5RhFi+tm1x/5+Z4HbiiPNui/LXD0Z1pQb/4v/jDS3Mf+ySDTosswSQjmtelR3x
	0RcP2A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c23h1j28x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:13:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81ecb6279d9so3796505b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770016398; x=1770621198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOn8WxpAI+xLLi6hCoSt1O1PWlTIigMOrNKcnGiwBLM=;
        b=PMSqEZlImO7p6oBHixGj3D24VXaoNjL8srA9bXn8tlCzOpLzWjF1dTlYQrY5j7fSOi
         Jz4v5f1zmiZ02b9rjUxeZS4mC0ZyXYCt2ukL744rx3BPM3MB84wVBPMI9HKjkNaQ5yLV
         /NOA/GgXN/imc6wDy1nw9XPto9D6IoAYPE9pwX0zpSXWWSr5FgEkpV+I/Tt28PjjYa7J
         w72qv4PkH9lOHLMwTgxyU51cKF3YEZPwSo0q7vuLmfqgiy0yfbZpkwMsqiqbcUSFRDdV
         uawein/fFJ6hJfUKwX/K94wQX7GUrWDrzIPaK5ISbOxiL4fGI0kR9d9K+YTW4EgIbBSj
         MqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770016398; x=1770621198;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOn8WxpAI+xLLi6hCoSt1O1PWlTIigMOrNKcnGiwBLM=;
        b=l/A9k8ADdDdjiSX6FqpHIQRSijuxot+q7oLajehluc8ycQIoU3djObf/8PUvRxkQ3e
         FVJgBFvGmDALMDnx3h5UxHxCkM+d2716hf/XWrAq+KdnNZkhjjc3hxsAJrbfBQvgJY/T
         +8YafbRDUvU3Anust0qm8uCTu1YbYAjR7cpkmty2OkKJO/LmskIjJvfX0Ql9WXRUlQCu
         n8aGfdsc0u656OdWFOSRJQrbaGyEWGkdt6p+M2uX97ojQFvUFfMTHgQu9ib3fW0qE6mO
         UQI/1sdp7HV5YFMDF0W8PI5CZe5n9Eyc+cavijTqHS23+WCsIfgsdp7eZYLEgLb0k/5r
         4VAw==
X-Forwarded-Encrypted: i=1; AJvYcCVxP7p17BNwLOWB5KXwuKE+EGXB92RIpPT7q/mRaSUxIVQj3LoOTIXiE9pZ6R9NiQuxj0ZayImsD2sFWQ0w@vger.kernel.org
X-Gm-Message-State: AOJu0YzEOLLqSJk2rGOCMn9TBFmQHuPXQ8JhAUTfuZsJAGQdz4YqHwSv
	4ArFeQ8oSf1tKIyVW/IevFANYAlail7fupqYodjf8/D0ACLY7//OeRRJ+WXI/0hgbgotUh0+0XQ
	5KJonOsPJaYYPpGM3MZ6bwuU0fs3DBNkqrKaF3SjB8iZKn5KO9vqC5txK7NIpaQ5xwB1m
X-Gm-Gg: AZuq6aJ0BLV1EFIs7ItzAlJZwE+nZSPrTbharZroiwOHva7392qxbb5nBrhsb00QdY8
	9U21d6KKR5sR1r4LZyZUVWQJuX7Z59YQBvsswQC5QTmeUTYZu4CatnFC+y8UpUlxt7TGqeW4tuD
	pPaMDI/k9t6aTIbuHZIamHkEScAV1K3yiJw37yshP3a5yfevUAM+/og6Ts8KWADr9UZP4zNogwT
	ukAhArbG/1m7npSsOxz5Ws68jNlvU6LpHZACmh0nRi5UvuIVacVEtbqvWV8/2Yi6NuaZTxBSEHp
	sqeJ9lH8pftpDt9vakw83FqS6gg/gD64MkDlJueCHXQ69vDYLiOdc+pQK7hEmxhByopsF/B3hdW
	c0yXa+9HfIo9M/gqvvV6xkPWwGFF0MjYxkLMu7TueYToYah6xrQXfky6kbTIUADrjcK1H803Uab
	F4PNBS
X-Received: by 2002:a05:6a21:4cc5:b0:38d:ebdc:353f with SMTP id adf61e73a8af0-392e015cd70mr8972276637.68.1770016397812;
        Sun, 01 Feb 2026 23:13:17 -0800 (PST)
X-Received: by 2002:a05:6a21:4cc5:b0:38d:ebdc:353f with SMTP id adf61e73a8af0-392e015cd70mr8972255637.68.1770016397328;
        Sun, 01 Feb 2026 23:13:17 -0800 (PST)
Received: from [10.133.33.100] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642add5199sm12734854a12.31.2026.02.01.23.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 23:13:16 -0800 (PST)
Message-ID: <2255b500-f4fd-4d7a-a5d9-5b4fb55c78b2@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 15:13:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Greg KH <gregkh@linuxfoundation.org>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
 <2026011621-fang-moneywise-d6b2@gregkh>
Content-Language: en-US
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
From: Jianping <jianping.li@oss.qualcomm.com>
In-Reply-To: <2026011621-fang-moneywise-d6b2@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: H3J6UXqapOJY6UzoT42wZz1E06SNV7s8
X-Proofpoint-ORIG-GUID: H3J6UXqapOJY6UzoT42wZz1E06SNV7s8
X-Authority-Analysis: v=2.4 cv=Fu8IPmrq c=1 sm=1 tr=0 ts=69804e8e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=A4WIMml1adry92zxVK8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2MCBTYWx0ZWRfX08f/UYZo7z6F
 1xuoYloVQhM14wmdnCdo1k38xGPYflsegL+3gnuoJOrN4y1oEvPnHaB7xO0iD3XWGrfP7gZD0pM
 SPDIoCpa0Jto3ni3X5TqtLfNw09pjFZzaCRRF40Xr8Z8tA5UGB1qWxKRFWkOHZHKhhcHZ4wG0Qt
 aXt/F51F5GCdYrsheMIVZuHDQXfqfHD6aKXoJzEZ7riM9SGgP3Ev9Q2iykszxal2p8SJxFcXq5j
 KSHaPhbOaFFvIRDs+ZTQgQ+Hgo5Tb8hOnpilsJwU5pUEd5ezQLMR39Un/Jc9ii3bRbed4v5s9Da
 rXdsFF4YV44mxisljGiG/9nj/RFKeIPT75mlqoh/KeExaeH5qszN1WigrBYZ+qu9E9zwt4+mZAV
 ZYM9JIvC5gqWr1+a3m0vefsE4NAHTY5TgNlRuJif8uYG6/nXA8GywKCo/QsjjYnor6owLECeF++
 qyUhHOo7Nb/a4XdCvTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020060
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91428-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01A81C91B5
X-Rspamd-Action: no action



On 1/16/2026 10:49 PM, Greg KH wrote:
> On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> The fastrpc_buf_free function currently does not handle the case where
>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>> dereference, causing a crash or undefined behavior when the function
>> attempts to access members of the buf structure. Add a NULL check to
>> ensure safe handling of NULL pointers and prevent potential crashes.
> 
> What caller passes in NULL here?  I did a quick look, and see where the
> callers check this properly if it could be NULL, otherwise it all looks
> sane to me.  What in-kernel user is causing a crash here?  Why not fix
> the caller up instead?
> 
> thanks,
> 
> greg k-h

It's a saftety coding: to eliminate NULL checks on the caller side, as 
we do in a lot of other kernel API.

And it was pointed out in the v1 patch discussion that this change was 
needed:
https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/

Thanks,
Jianping.


