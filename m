Return-Path: <linux-arm-msm+bounces-117274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6manD3baTGrAqwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:52:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 306AC71AA70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:52:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="c17X/Qx1";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BH11C666;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117274-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117274-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4362B30D89D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6053EDAA3;
	Tue,  7 Jul 2026 10:29:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF53E5EE9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:29:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420161; cv=none; b=nAz7I+Ycr45JPHSci6QDdBobGSzfhotBiPmOoCwrs7kXt7wtw2Gd4utZSFHql2hL9OtuoptbbVHY21zYqNviY4Z5wuKTj/9+czpMqK7digJhk3Gf++LVmbFuIsrJaAKkm+Zmz3KdcOBBTUIThjEIX9o47+cEmHzT5WowR4ise5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420161; c=relaxed/simple;
	bh=NXVfq838yL1A6Lx1rXO1eCI8oNBl6eBKys0tt4+YCoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekna4K6ykUEbum5VpO7jX/ME3NJFOrk9cFL45rBIvfLY1ArfKAsO7jHGjMvnCM2FdkNX7SdlprQEA/SGK/xW0ZYP0yyJmf7FaCH3/IaW6a9ClKj1s2Ko9VYRxQAfKAXN3ko+a0y6Y1YLTGFZN7pFd1giSZWky3kNC2Kp8/qcCgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c17X/Qx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BH11C666; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dkwx3219411
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXVfq838yL1A6Lx1rXO1eCI8oNBl6eBKys0tt4+YCoU=; b=c17X/Qx1U1cRZUF3
	R174hRDHUmVK94ghmlzRRf59exRQqz7y9IJKuOfvrqUDzjXRBhhOR51q92Vh70QV
	+ajztTarFSdhydFANaoLatZoaCtaBCtYtP4/4nZ1FH3PeP8qlYXe3FAW+nAeD55p
	voaOpIzX3Kgd1wv0w2WqqH+2aMAJjQ3Bc25n53tBIdSmjunPPmUGZWQeYgdG9qFw
	0Sa/dxYYwNRREdFQQbMienJbXxN+cYvzE4XrO/EWt3HKDN9ixyAztx18zlhKOFL0
	KKADr7jtqAqH+/ixTyytD0R0DbPXM2Upx8vIFYt96iniCWuMY99DaUCmlJyzAbTf
	VBYSfw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep0mkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:29:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c354050c34so48902315ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783420155; x=1784024955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXVfq838yL1A6Lx1rXO1eCI8oNBl6eBKys0tt4+YCoU=;
        b=BH11C666EoqTuWQVs/FYSbEZxEt+5akabtVC0BnBn00wc9jBnTYq12dFsSpGJQLEbT
         9VImetqBvTEa2msSaRSot2BjCCU4SQY0j7AYwkRk0WEeuZU3yA5C03BTkB2R81uI2gBY
         jYMhi87uOtqzmV3GSZfIVP0/+vqkAwgwXUvF5tH/blIZEutItOJSHHgvpeL+Y5R2fnEM
         dYQCIJiZVCOWzudoDDU4SpdPDg0fMG/joXqU3pTnI7ygofqjs9q4bz4gP4fongiLuVs/
         AdBugPdEwL6XIRsiKDu6Ti096d7uw86xagjLe/WUwNP85DjYzZNstMZWH4R9EvEKGIw4
         ZJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420155; x=1784024955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXVfq838yL1A6Lx1rXO1eCI8oNBl6eBKys0tt4+YCoU=;
        b=aFL18Jd55mMbbV5WPQ60rsHbtW510jw9kZEu0hykWwuwvmS586SJBtbSfyGhS0Iih7
         prykR7tbsubQLJ4rEUoIgbaheQeYQZtUUKV3hPKLEuatPGfSH+lYNIc2ens+g7lkK7uo
         TQJc3scaCaDqZ2NTA6WODpUClKe5GgcI3eXCetrHamQi2o8x6MSPqh9q/9bnpmu7aSxT
         v+Fu/vu0lMA+0U+oxBc7/ilewIrYuexnwPjw+bhCKcgc7i2yhMuw//RRpcVxVKOjlOx7
         Y1NI5U1jNfXNWCSwnOqc5pr4RetLuPvcjxgyyUgN+z1jadLtnfAUL9v2DarARNjD4FqB
         cBbg==
X-Forwarded-Encrypted: i=1; AHgh+RoB6XyEA76PHN3wuY5TLrIBv6t8NLGr/Pt06Gky4FHXBPAUKjB/j+29kaX+f/esbeODdtfwKg9oFp+kBMip@vger.kernel.org
X-Gm-Message-State: AOJu0YyrsD2PRXADf0BPxT30vorEC5enWEpeRgAuudGNtyqq4X/inS06
	lILWv6NWbY5wD2nURm4JkctWNirz/ne11olhkh24WETPChoGj6jV8Asrn2BkDMAgxVe19lImZsU
	2UxvjSviSGRba/gTiyAYVsdldFoq9tuGuQGW2IkgarespCtmQVpmdohib2XgvyttJ3HJH
X-Gm-Gg: AfdE7ckWW7wbuLpK7hBTmN4e9ddyDi6eccH6iwUQRx68jjg6hqCnySzi1BJrlLvNbmC
	AJ8iSK+2Py1vMq0T4JEJy+cMaFRjK/AVG7nyHI/bNS+aPlnI761+mokuRkQO2Mn/hfKVf5BJvVr
	6Rg8RUO6FICm36eDIPAqhvxCR0tDgP4bT5gyU9MFz7Ix/Y8aMJyi/HLaoHr2MJYvDOD9m/MI+PB
	S3YGn5u0iU9I+srExRaWBVL8GvYs2Tj5mDt2PoL2okqmeEzTVgqXn4OAf4R2OU/6l7IZycdaSCm
	6z2WKyrzbD8lU6pwvDtXMyv65sE7A7WvPA2qkPiZgSJX54h8gqVUozEtzEjigVXBjkt7R+l+Z/I
	4KYjxrYwcnganya9rDBYmKQqpKnfyXPnIgDbN2Ox5qJJE
X-Received: by 2002:a17:902:d4cf:b0:2c9:b480:f5d0 with SMTP id d9443c01a7336-2ccbf053e65mr47341185ad.39.1783420155030;
        Tue, 07 Jul 2026 03:29:15 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2c9:b480:f5d0 with SMTP id d9443c01a7336-2ccbf053e65mr47340995ad.39.1783420154594;
        Tue, 07 Jul 2026 03:29:14 -0700 (PDT)
Received: from [10.92.203.183] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e28fsm9213955ad.43.2026.07.07.03.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:29:14 -0700 (PDT)
Message-ID: <95e256bd-191f-40df-96b4-6cff38473c5b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 15:59:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
 <rnwgxeuz6t6cpbcrmcggqtzsfjnur6kmkttgymp6cbglzjva5v@q4cyoq62p3yp>
 <a8a2c394-666c-4294-9eb1-911564a32fc7@oss.qualcomm.com>
 <toeqm5cizcnlevonbhpui6277fffqgnio3vjsfwjbl2v2pa4gh@63xby7l2zjzr>
 <9448e854-d64f-4316-8fdd-4e1e3dcc9ce0@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <9448e854-d64f-4316-8fdd-4e1e3dcc9ce0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iFR7PibFymj--yNF_8PWQvSELygVVqEl
X-Proofpoint-ORIG-GUID: iFR7PibFymj--yNF_8PWQvSELygVVqEl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwMSBTYWx0ZWRfXwP6DOhyt9IgB
 5OaLZ7mTuskjiqwy+Afs6kjYzNX3S1oYSFWvQmY4bh1dDoBgE6VCxXbdSTCrKsyI7RrYf1GLx2V
 lkc1xZs13YhLA80M5JCyFHbm7aSlsBLohsrhm0bUfb0cdiJxRCToogALBRHKeuGJFM6ceklXU3g
 Pz/exzjzajNPACEuUcnaUASngw+dDWk0fK5h+ATa9chwoSG+5lfAYhWeJKCrXw+q6maXxwYF+eo
 L6rqeuh3hZ41uktZWBF9slYJbeAdwcuRVT58CBq/YFccR6m+YND+EWeRHsTrOmaFhwTBnzvZyGo
 0Rq3Kpc1B2myq2uWlwlcGFbjp3fvR9uD5LL8WfhMY6tUSvafOx7//UZ7wjufTa/GxHxlbTBoCqA
 1N/rJZDqXbJgMSC4SFtItVUfeWeO/e8sJvBKRk9MCgaCq6yD2yLX3UD6yJhm9tF1AoPLGAcls1g
 Tw/FVo3+Na5+B6hrUaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwMSBTYWx0ZWRfX0gr9kMtQDry/
 tHURDPegkGbUww3RSvzRinY+Z5cKkf/hE+ol+QnVpRnB5VtUCEJ/veofOj7O+IwodknOvESEtfx
 RpbhloUmOBTI9V2YOE8T/77BnfcK3EU=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4cd4fb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qQ0QJl8GeCU3ww7rcdMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117274-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 306AC71AA70



On 7/7/2026 3:55 PM, Konrad Dybcio wrote:
> On 6/26/26 5:15 PM, Abel Vesa wrote:
>> On 26-06-26 09:46:03, Krishna Chaitanya Chundru wrote:
>>>
>>> On 6/25/2026 3:42 PM, Abel Vesa wrote:
>>>> On 26-06-10 17:40:09, Krishna Chaitanya Chundru wrote:
>>>>> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
>>>>> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
>>>>> the GCC clock references to use the newly added PHY nodes instead of
>>>>> placeholder zeros.
>>>>>
>>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>>> ---
> [...]
>
>>>> No pinctrl states?
>>> As we are adding perst & wake gpio's in board specific file, it is better to
>>> add the pincntrl also
>>> there only.
>> I'll let Bjorn and Konrad reply, but most of the sm8*50.dtsi have
>> them. Though some of the newer platforms moved them in the board dts.
> Some folks argue (I believe purely ideologically) that the pin states
> should be defined in the board DTSI, but I don't think we have a single
> example of non-default routing in the many many years of linux-arm-msm,
> so I think the reasonable decision is to keep them in the SoC DTSI.
ack. I will re-spin 

- Krishna Chaitanya.
>
> Konrad


