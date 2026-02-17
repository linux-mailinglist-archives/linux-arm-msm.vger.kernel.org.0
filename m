Return-Path: <linux-arm-msm+bounces-93197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qExNEwOGlGlBFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:15:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7437314D7EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD3823006225
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 15:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C868536CE06;
	Tue, 17 Feb 2026 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7NePWD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYNIekh0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8918A36C5AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 15:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771341308; cv=none; b=RGyJcEpBIiaY8S0nHGX2Uc53oiTZSbxQBcHaKNgA/K5q8RqYueid5KFLv7P+OMYenhspBx4ja29VhQXQkDDl3DYMbHhi/yoGB619JTqcfC2F+riI1ZysQKuWXWO/0jSv/fGV6jQsu5H/woUVcMraUmWTkqiTWnb6IH3BeqTB9Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771341308; c=relaxed/simple;
	bh=kcNcUy4KDN6XZRUlSsgBnzKJ3SZHSRQnwfvk8eAG8dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=knmdb1ra0/rLaMFKexkBsPUM6CZJSCPNRMpHTejYmLgUkzPEoGdvzzSyVYzuO+DYN/ux3Mss1ZGdBCJO+GntYL85Pkg6x5g7VZU9TVBEc+TbDF2auyERzt66UqKIRMWUamCgtnBr6qdAVo5r80cgj4wmPXHvWz7F1tKX2T2BTkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7NePWD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYNIekh0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBCSpH910827
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 15:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mXK3oxKcNFM2ZlGkPFhBH6AMncI8lxq3YTvH8s4Z/f4=; b=C7NePWD20GNUKV5L
	NkAQ2Ybbw56ndn5yE7wkujyaoXeDvehthv+NyI8nJXWxDQoQLo2GVP3ElAkK1lg8
	HQA196ir+zo8XKTh9U3MG2hDEYxvq11PxvvRWKMEgPDvlowm7+IIiw5/PDqSsZMx
	MB5Av7PiJzmapQiXUpMyQLg6kFHKze2rCtjklzzqxQ6lrnqIorJByIJ9f9/pxpbn
	Pd2Lcm5SBDGCdnSIK3vmk9DzQ8tLqDeoH1xWkcRVwHHwyWWQAEE/BX3tyKDW41Bj
	dNdYxUOhji8NtLpXbJZtkKB+gQw27r39dL9YdQI8MgE+y5UW0r2uyDrc3lg9HZNi
	7MkM4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9ttwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 15:15:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so332799285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771341305; x=1771946105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mXK3oxKcNFM2ZlGkPFhBH6AMncI8lxq3YTvH8s4Z/f4=;
        b=NYNIekh0JzcGU+hoFtl+MC3Y+v7Rn9l8wo8ECSZf+LYP+/8/vFxtuwJdJnlrIUp0jj
         lJhGAIIkwmKs18SdzjW9rtKLPIycvrP+2oXQQUkJdoCLqGboqC7Ir+7t49NXrg3ktoqn
         ieDMv+3EeUXng0omfsHO1ugE7Zb6trly1xxxz0xRFkq3BvCAuzXFfWhUrLxJ/7I82Zg4
         4pX97pxytK+aOMjImTfF6DlDban3HCpj8KP6+3fHFeva+3ZmgLE6sK05wdS70kWs4mg1
         uuxQhLP8I1PqED9bpoEFfPbtJPdprnVwbia4E9wqitBr4/LuWptRpnXiySZe1+rI3Hc2
         luBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771341305; x=1771946105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXK3oxKcNFM2ZlGkPFhBH6AMncI8lxq3YTvH8s4Z/f4=;
        b=cYyYNdWFU+P+GADCvCyU9TLaNvaLYs8ZAuO/eK7swsH/vYbOW8dC7Z9DjpxnyjZUQK
         YXlaIVV8pA3ILfemWj4Vj+vgqPDC7S3fxQcMCaEQ0aT1IlHonQyIU2/pLOAr1I/V+JNd
         tiv2FwGncGYhe4mMslO2Gh8LDjHk9rvMOoqWS4T0IlwrnEx84b0iCnf5fuSOX9yVV/Xy
         vKSejRU7Xr30nEsfXjbSAkG75W74/c9ECwA591aoPxWmiRJHoGJrWbrUynxD/D4e7KKt
         /rBmJLXH1O3eeh1I9U2DiIf8TTZUJDYtFZDvtjwdsOXvzddP9IE6MLdvF6nW2CUNdtEy
         OwwQ==
X-Forwarded-Encrypted: i=1; AJvYcCURDlyPpnyWDmDZ1/N/nVvqZ1msCP7lBJx0TLUKnevImLYqZzdSbHsGb9lkfOC3LNclXbsE+1DR9XsdOL2G@vger.kernel.org
X-Gm-Message-State: AOJu0Yztg/uFArVXyJi5xs1knprS/BA88E/4mqYypQdFxL6X/2dBk7pI
	3yWvrKx6+PWYtkzRJbx4Ht2nESzcALWzvQABtNf8ovlzzVMPBtbod4DmUoPaj2g4Jx21fF2hpuC
	jjsEAXqkLXbfRjYdk03KIOLaYcXvPDFu49AUp5qY6q+bgyxaAp06p5eFkMN7UxXKQyNY5
X-Gm-Gg: AZuq6aKrdIJE6L4m+vPW+HgpaSYDeOXfwaLG/Y4eTX/g+9FxC95FL8Jz28FMOsyBKSe
	zXNG6ngDNvppCra4VwkbvVLcz0mk8jxpy+tqCeZbeNurX20yCr2j25dFc235bAKtrQUDy05k/lN
	ZeZGOcZHSAXfDvpq63EkZCbFgnGljS8zIWtzrSC09A9jUKSuJzaobN8QmAxvSlrDyZRHjEVVCVD
	hNlajn3O9vCvPvqmD3M19ABSVoOkYZ5mj6o6HJjuvTAcydgpgvTaI1qmTfcw8RluBslii9ADVHc
	ELElupPfq12iS7l4Q1o+A1ejl2hXN8EAaxODlubkCuvSOjwA7qk9Sad/9Va9Z19OfhshaJ0oYNj
	3k03AVoEJSWZ0F7iqcIAaLsAQMXfX801+7cCq5BNPubDO2AygjBcP0nAK88TrjeL7Chu+7yz9yY
	ws0rI=
X-Received: by 2002:a05:620a:708e:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8cb4091adb2mr1368551285a.11.1771341305313;
        Tue, 17 Feb 2026 07:15:05 -0800 (PST)
X-Received: by 2002:a05:620a:708e:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8cb4091adb2mr1368545785a.11.1771341304638;
        Tue, 17 Feb 2026 07:15:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e872sm365465466b.10.2026.02.17.07.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 07:15:03 -0800 (PST)
Message-ID: <0bdc930f-de47-48f1-ae62-d9147aa71dc0@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 16:15:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: add Acer Swift SFA14-11 device
 tree
To: wwf <wwfu06@163.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, andersson@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260121112721.2981491-1-wwfu06@163.com>
 <20260121112721.2981491-3-wwfu06@163.com>
 <033aebad-b148-4cb9-9259-8f6e65dfc39d@oss.qualcomm.com>
 <a1e3fe8.91f5.19c04eca0a8.Coremail.wwfu06@163.com>
 <a13003ea-27be-43ea-b739-8d5d6ba69d0d@oss.qualcomm.com>
 <c44865c.82d3.19c2d4b22ab.Coremail.wwfu06@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c44865c.82d3.19c2d4b22ab.Coremail.wwfu06@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEyMyBTYWx0ZWRfXzH1r6ExzwCaL
 OFUOhe9oLqol53572iOfzTKXlEG3U+wBHvovB6IBTetXD5whQPU0jdVfveFC1OeSAvgANglj227
 3vpR0TkGQoxuxNXLEywMrmd38L3SO6ZbpMsvJpXl3ZJOokz1yNUIkPBqVsujp4Gl+7Z5uQFqlIK
 uDYRo6RdpLHGe3U/YrYWvGjQIIZ6V4C6M1Y/dL3eOdJdyNt+d9X9fzm52fzYhmB39mzyFYyLR88
 jeGrJWIjWwyhfBkJton6UNQTMFC1LeimXf+/K1yvu5X8x4+uzyXr02tOpTuf7EhVP92tJeoeF0s
 VCAw2RZwByMVfAbvBoYXHdIFmUAN4uhS1M7OAb5d6jm7iBj1ewXNV23Dc/fRynjZqqV+8sF+SyZ
 xwU8EPTRPW7eNCxzoXjUOVIwj/b9EI2NOZTugC+6PTrx2A/MHzYfYPtiI2619aZUXjqnCU+nKtb
 tEh6LvN5b7TUiVGjlug==
X-Proofpoint-GUID: d2LtZUpusdX2p3QDCFI3jKuWX05V04u-
X-Proofpoint-ORIG-GUID: d2LtZUpusdX2p3QDCFI3jKuWX05V04u-
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=699485fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=RowYqNY7AAAA:8 a=f4BakdQTq5wTYiJGoj8A:9 a=PRpDppDLrCsA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93197-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[163.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7437314D7EC
X-Rspamd-Action: no action

On 2/5/26 11:13 AM, wwf wrote:
> 
> 
> 
> 
> Here is the complete content of the email: My current capability only allows me to achieve this much. I have to temporarily give up on pushing for support for this model and hope that other professionals can continue this work.

I'm happy that you're experimenting with this laptop and seeing success
getting certain features to work.

You may find assistance with resolving the outstanding issues e.g. on
#aarch64-laptops on OFTC, some of these are low-hanging fruits, other
require some more insight, but there's helpful folks out there.

I'll be happy to give you another round of reviews once you feel like
you're ready.


> Additionally, the image in your reply is of the sf14-11, whereas the model I requested support for is the sfa14-11.https://gwcache.acer.com.cn/uploads/server/6e8f06d1d8884dd5136d82b91fdf284d.jpg   The differences between these two models are significant: the display, CPU, USB, and other peripherals are all different. Currently, it appears that the sfa14-11 is only sold in mainland China. 

You're right, I overlooked that.

Konrad

