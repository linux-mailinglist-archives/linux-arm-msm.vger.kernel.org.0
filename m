Return-Path: <linux-arm-msm+bounces-91149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KKFDgw5e2mGCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:40:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88723AEF04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D57AB30BDDF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 10:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F73A3816FF;
	Thu, 29 Jan 2026 10:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPf8U0Tq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5oxp5ZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1883816E5
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682853; cv=none; b=aPyHMJODP9c6BvBOUBlmAX53eiPAhphKgYF9r/zbhYVSt2f9+kUH0Q0LoJ42tgzY4TkCGfjti7uuQTPcUV4G9ASRh0gC7tf1NKnXbSLKk7kYV+sjKfvBzo6RjKfnQRId6vv8YFElrvjbnOIhITkERbyqTV6yKL762yuCTTq/h34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682853; c=relaxed/simple;
	bh=w44ZOIJsPmpOgos90Cy/aKrYmssdsVHy+CxXGHDHKCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdwGeh93Q4MwdIeRxfVQFwZOw4nOYOtaIfcYAkC0bkcaWldCeuS2fldreYHs+nfSvJFOSwUCseAkUG5xo08FyCJODtPsuxJl46MbfDF6fI6fw3lzxCNSCYiYpYNOu8Nwyk0OTxSWxoNdguR35sexR3RT0fXsaxR85Dq/K5qM/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPf8U0Tq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5oxp5ZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAQ8rV3643096
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/43B7at/Dk1ip77DPF6jNa20MsFqaIcdx7O2FLBl3tE=; b=UPf8U0TqvNIALVKX
	mVDMHdgRI8RDKWqrCp3wZ8ZDdRNKR7MaWqGNJTZQULHd/sSmSCWSUnLS1vvZmbx0
	VHaBTr2lJQzWlnIrnqzctQTSlg2l5jVJzgRvXmn7BFGApQlbKoEE8JjBxb02/7bV
	wEv3Ea5wDVSC/qEczMJZ2T8YV50eVS5a3iG8smB8QngDIaacRd3jRwttwLwJ/VBX
	0Q4Co3dvdGBzRgEGNKaa2W9zUKvqw2A+l5leWNCbQVO4o8ixdC1trWuTqI2KWR4E
	kOtFswL7BxpN6WPOqKS+7WHPzbX0J1kJMqJmEA4fbSq4AeDX8iBbFP/whknFTXJu
	RtYUGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05sr00sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:34:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2fdf3a190so13922085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 02:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769682851; x=1770287651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/43B7at/Dk1ip77DPF6jNa20MsFqaIcdx7O2FLBl3tE=;
        b=J5oxp5ZGFyszPa3BGLC1bTtZuKQ4djc6bCI43N4oTym3FQVRVFuX/yiGgaCdvWTkqL
         7uaOkhWcKVjB/kyHLpLAN/mX04XPeWmSymITcpU2PqyIXQB6fPTlno1k3sQiZrZfPbsg
         fjrISDJe+ulzQPeusNEh4MbKbhcd9kJUNsqeFBbFBTNrz6U6uSvjMncbRFRNj4cxyaDB
         0PEx33UGBykUUP+fZx1WFaIPtX2tqKtC+0diZLSuqCqy+yhmLiaFvl67DhIgQd4Rv2uO
         vfdt0d/Lnyl3Qkd3ZPkkUNL+tKnBY6oqDB/D0+5HBsCFVwmuWFJHJqu1/JliZkYDgPQE
         OGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769682851; x=1770287651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/43B7at/Dk1ip77DPF6jNa20MsFqaIcdx7O2FLBl3tE=;
        b=Rys5SJ17rctjq0tu/h+Tu61b7Memgol+7eZiI9k6Wn/9rhJsJs8+DQ2LnLzOyMXiY4
         L0MVJyjUT3jMbitQueYAJLxhlFn0A3ux69ByNUv2Q+k0CuWV+AUC+9TLd/C2/VDl9DgX
         ou2IaVbmMlNjYuHPKX/+utGzSjZouRcDyLTpKXucBJtt0JhJNMlx/ahY94TVFiH/pq3J
         XtJ2UB8PZgea6zrxXdPC7HV2ru0qjK7hijVtdyCMtOyMhHcHlVIpAfRYyHZzQiZE0UMB
         kc+dVNB03K09teOj/HNVP0RfkBQAXLd49utUtYnGlpmXZpjx/jz92ns+/o/pxE2Ffv4o
         4wOw==
X-Forwarded-Encrypted: i=1; AJvYcCVH6lIWPxL3glTbjm3M/r7aj7olQ0DN1ZGGBvtKapn7bdAZOUHcgPCsg45c8Y/snEDqsc4tyIocv7In1rxS@vger.kernel.org
X-Gm-Message-State: AOJu0YxALvb25HIJftjMTByc4erNDMW5aHAX27jRrmz1RehHRUwaNNS2
	EJxQCBnAOqGj7Of4VQOo3bKhP5P4AHgouGe6XIDg8rci4Pe55NqtMccNGlF1qEeJGFlsZu4wQIm
	5zDAfsYNe4LGtSol7c33GqxA6uzah9YpcP7iorfLqIdyPTqIF+5TYNzOTsO1+Cb2TMJrWDgoUgi
	sj
X-Gm-Gg: AZuq6aI2aY6HgZ66g7qoMD8Sjj4nupav04PdIeTtZtKumwSo+xu+psoqZn343WT46lc
	VGQ9QNMD3gAu1mrqF07TCN0IsOPpUZpJcBuHfbz1r+Oq2SAcPycP9QBIPTjbGATyI+5d+mgm6Md
	ULYs3S1NW/0qEinh7+bIzawDN5papfp4FVw1SyWPvFTSVm86hoNuM7xAtDIsQXD/QsqgNohK2Gh
	aHS4s0hzGYcLenjBLIZuhXA6N/vRCL09gJi+Dj7l5ZDjR5MjQ7n5fZ+jJnRMVEFXUIeAAOMMzH9
	mAiASVnwyrmfDrBKj71aRHWPgfs9NqzzJ91n339VtV0gokgVRAsyHzaMsjwyfbVXsSMHQcC4iBm
	s5uGbj03qlCx0W+FbeR2unyxxiStdz4p0jtwn8A8AQ5XPhc3D2hqh3vMee3o8O4UZZhg=
X-Received: by 2002:a05:620a:909:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8c71b40d0demr237888385a.9.1769682850785;
        Thu, 29 Jan 2026 02:34:10 -0800 (PST)
X-Received: by 2002:a05:620a:909:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8c71b40d0demr237887385a.9.1769682850334;
        Thu, 29 Jan 2026 02:34:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8df01b8d0fsm20843166b.39.2026.01.29.02.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 02:34:09 -0800 (PST)
Message-ID: <dc0b7245-de95-4db7-bf8f-815ba60d7adf@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 11:34:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top Level
 Mode Multiplexer
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <aizrc6xysfwzygdsfeuc2raccq7efmwg5bn6v33t2de6ugvzgi@z3ipf3i25ulf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aizrc6xysfwzygdsfeuc2raccq7efmwg5bn6v33t2de6ugvzgi@z3ipf3i25ulf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA2OCBTYWx0ZWRfX3h/YorU1Cezh
 kO7KKoQxM1Jw618nAxL1F07kICs0BeHMZGZsixd/hIi9oJUFC7bvKBL7f3zHPOWmQAv8BuIgUgh
 3Bi+2RShpsx+zeb3p934ieN5dCvmkFmaDeG0hH33lpicQ+ID6nocQyYptVFM765FcPH+hYGI+nb
 tdirj/KPGmiu5MBa5cxq5WWP12koFis9tDVXXEqdrUzGMH0l1TD9n9UWSI58Gn9D0cud7ILh4eY
 5V7ux+wHm6GgbrQtDcXYf5K2PgXLI/QDHVYey9JtIpfMN9Ryd2SkwtWAs+Fe0dNfP4ugAfTcBnP
 +uaHCgdMv02DTwV6TtN3JNQ0fEyxVQryUT22oLIOHx7l05DNgoWShoUlHkiuiCe8m9oaLuJjfyJ
 qTVrLBaAsf/U7+rIkZmSTlfKToLdbUcTiEvQ4X0S1sETYtLGqQbFzq1HnwKkvP4f/MXF6IST1Sj
 3BONzyuUY5fialg2l5g==
X-Proofpoint-ORIG-GUID: 7YjigPQjXnyj1w2zdAIhWH0rHuL4PzI_
X-Authority-Analysis: v=2.4 cv=UsJu9uwB c=1 sm=1 tr=0 ts=697b37a3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0R86I3TbNnukiGrDUXAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7YjigPQjXnyj1w2zdAIhWH0rHuL4PzI_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91149-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88723AEF04
X-Rspamd-Action: no action

On 1/28/26 6:22 PM, Abel Vesa wrote:
> On 26-01-28 12:38:32, Krzysztof Kozlowski wrote:
>> On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
>>> Document the Top Level Mode Multiplexer on the Eliza Platform.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---

[...]

>>> +
>>> +  gpio-line-names:
>>> +    maxItems: 185
>>
>> 186, your first GPIO is 0 and last is 185.
> 
> Actually it is 0 through 184. The 185 is ufs reset.

The UFS reset also happens to be a GPIO..

Konrad

