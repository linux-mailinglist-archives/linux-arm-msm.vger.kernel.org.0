Return-Path: <linux-arm-msm+bounces-98617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOoEKb59u2k2kwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:38:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 450B02C5EED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A659F3063746
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1DE36CE03;
	Thu, 19 Mar 2026 04:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jv2LUteG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDblSzWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B26C351C1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773895097; cv=none; b=K/gQeAW/FpXxAgsQZjFyeetcHuVsivucX7kyo9ZaB8BLjOD7HdthkMWHD48K9CY44RzDOIklyr3HGgKs777oCtQ+bA1Zfe0nJaDekKCOK36xhqHAtJLEmBNkynuEG30KJ0zso68su5zF7xi0M6y/K13TkKGJDsR4Be/fkj8wUk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773895097; c=relaxed/simple;
	bh=zdItmlgsAf7WnXvqKf/o2M5O4UtcRKrRhA/lmoQMLok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qb2LQtzVth5nfEPLoeu4rBeBau5H4DiX74k5mkhYMHX9Y/GW9Vf2Y/mn4IR2uq/W8Re6ggpZDIOzXxFvwbIwLoLQR9MnQmT2Ts16Rtx+R/es6c36r3Is/GvqXomFhuClBKcHbVH7fWFh71XSSibULvKuSsmQ1tUvyjaGBiTTzPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jv2LUteG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDblSzWt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J0THqD3770351
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1K2TFZyjMf/NT2Pihlre0XPxbzUAwiHBTFp4fG3Ekeo=; b=jv2LUteGlqGPevSg
	tINZ+lobg+asG/tSeRf6PRVTCtKZG5Yqa+iiksK/L/TfUNKMDVOWaa+4I3atV5+K
	uLMl5DO0HuDJaxutqJIf8DY75rVvj+kNiLKSRaxuehNBq2sUdP2WyTmC1+oKq9n7
	BSk45ilJFAR2jjFYGF8I6/ILD3UzstyyZvQuo/duh4bTF0/uRaMNDabQ0pq3iLDS
	RqIhTYLo5WZ8/1SLPP6cf/rEAX2AEUtkoR+CJCEx4JhDbBTGw+EvWbf2Q6KMSubq
	XXRsZberZIna01UQXNnZZAfSvFRA+K4Crm5RfN3de4KHRBZ5oX0tiISRtxdtJu5x
	0209eA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyqcdv752-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:38:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829942cf9deso1128577b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 21:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773895094; x=1774499894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1K2TFZyjMf/NT2Pihlre0XPxbzUAwiHBTFp4fG3Ekeo=;
        b=EDblSzWt0vaJ4+9KJGAJ6HKaNdXmYkOZzgZJU5yxnkpTEeKAg4KB8ARJuf7AQ70xxx
         p/T/rEahzx/254ZhkE5WpdgjIhA3EDRZwsh3/UX7WAJ5X4u0kb0n10WODWtcQEU2SmJv
         GftS5+RVXJIeJW3tN4/Y/P5yfaHE1qOSGfa+0ab3NHXKnmTFsPK1CDxXtalKY8XacGgQ
         0ZX2Sa+XSckEL1JhFp3HPRs3By+IEx18peKDDA5NadlgdV3E2uMGj3iu4jJPAiomVo87
         w7PdkyFeGav9u3ZOqkOx9BF5inTq3Nx+Sg+8aBjY+6T82k0/OSZHtRp4MQVNmjPEUND9
         D03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773895094; x=1774499894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1K2TFZyjMf/NT2Pihlre0XPxbzUAwiHBTFp4fG3Ekeo=;
        b=fcvOkj7DBk7Blh0IfdJ08R3NuMneuLdBoHyKkK+76f92EN27lKFEcOvAHJOedH2+Qr
         3BD89ofUDwyPgZM7QrajqqoAvIyZ5FfuPenv6miWqUD0VEap0NCaIHitE0Axb+bA4s0U
         rD5qnQdz7ZCxOHHlGLNoxBZQehoURazzjw441ujbK2RvT/5JrrwMBQaeNfz7X9Dr2t/j
         Yii9Dy6tGyf+LgNgWs3OeBppwZRNMbyI4LUj/Q8jC0Dk3uNFBHHiFA3Ov20E5CW2AEk7
         ZSnX42qfFxt3KFK3HNz9oEhDZ16AKTkaE9s3HF7JG3rcFWWdnZyidxk8WsDcEkj0JYtN
         QynQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoo7Avf31/F+S2Gr8uJRUEKxebUJ9VaDgAOw7iZryPg43rKHebhItVehIRJFnJlR3JQ0EfG1M5ZyM32Ujm@vger.kernel.org
X-Gm-Message-State: AOJu0YxFjwyBS9iquk0SqJQP6xecM+T3ieBnBdIRGHt55OFrGN6gC6ND
	5kmyb7x630SLOEjsIgk4+/J86LU6rf3WoDPjKeKLv/jos5Nltz4qCBEJkuAW98Yl1ulEkJ+G2hW
	2K+L3wJ96yKCg8oBxNlPP0+aiprPDntE8+jERj/xLRFfik8DkBqypOVTCe9vrg5mCKCpa
X-Gm-Gg: ATEYQzyIn48u2IdQhqwLP5kJCi1ZfwVc3ZlxYzzBrK0W+jM2TBYXLGxKqmInVDW9DXp
	axOdjV7ouJ1/xELjfS5iE00q0i79eIXrDIoAdVDzPzh8liS8TEOU3nvwT1qfYGNVg7FvrOHM6U0
	FUfgWbIDsGHUA00sd4Iuh11mOEf83vw01HAGF4W5QKluHNhFJE1FuAKtNmoEOjiOukI6Wd2gzkY
	JIrfOWuA8JU3KZaQThoqe+SQnhJtBvPL3aEbDnB7RJdIKC8og9AnJEKCJo9wFjnibgU+J+WBKAF
	pV/IWYTLdN4+uEV7NwXTfZDOK1rJbwZQuhV5cKU4e8JQRvWOLHUB3Kpxp6rr16L45P72Tvb9Nma
	qie7W6P0iWzMzjjF08vKfPVZ0idMhy0KLiLsasDpASF7kgNIuRCBhoCZWYePCEz3OB2Si3+i/gp
	F0OSVBYj+S+QuNj2Zz
X-Received: by 2002:a05:6a00:180e:b0:82a:110b:e223 with SMTP id d2e1a72fcca58-82a6a925d06mr5279816b3a.0.1773895094087;
        Wed, 18 Mar 2026 21:38:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:180e:b0:82a:110b:e223 with SMTP id d2e1a72fcca58-82a6a925d06mr5279777b3a.0.1773895093643;
        Wed, 18 Mar 2026 21:38:13 -0700 (PDT)
Received: from [10.133.33.168] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbe200bsm5131282b3a.44.2026.03.18.21.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 21:38:13 -0700 (PDT)
Message-ID: <254bac80-dcc3-4c92-a0c3-40a1adcf4ecd@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:38:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] dt-bindings: remoteproc: qcom: Add smem properties
 in documents that reference to pas-common
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-3-0a91575e0e7e@oss.qualcomm.com>
 <20260311-meteoric-yellow-pogona-fe5cf2@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260311-meteoric-yellow-pogona-fe5cf2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzMyBTYWx0ZWRfX7JShVa9MTHNX
 T8fqamVN+DW4ree1oNpsZyvbN25W2zRzoXuztxBOLnZIhonB1+wcRP7Su6y2WEL3Qf3v2KEWCCW
 6DorhVcapen895PRg+cmQ2Ngy+OpCW+LGo1E5fmTngMe+JNXpHF9S7Zvm/4KJUoqNeFuUi1P41f
 9MHUp8zarvj9hE5A2ZdfKsU5irOwBFO4T43QjhMD7dWQkxW0cmEhPlCLwOxevtYv7+30lGZdYaW
 EFWl7x47JOYqjCGIQZ6Z+GcZtgPqP7X9LT5e//kiFAhWQXKjogwCNjuKdy/d2WlKA9zvZHB7lo7
 tkCM+61MtIdKtbLnvQNLHVd3/sq0Y2ksb1qGo8+C5yICG+BtU8oPVIG3a9/0cwN0mQ/0NYZsB0R
 Vl+pNsnBQu+mmKKeFdfT5FAp5YR/3FZIUjH5TS1aYzW92xWQcsiEGPzmndnvgxdQxsyCZxb3267
 j1ATe5ZqNzUfTAYXXqw==
X-Proofpoint-ORIG-GUID: jIflaJbYRuFdW2twaEhym3iA_JYf0T8R
X-Authority-Analysis: v=2.4 cv=H87WAuYi c=1 sm=1 tr=0 ts=69bb7db7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ogO5B-f0vwbiwaMq93oA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: jIflaJbYRuFdW2twaEhym3iA_JYf0T8R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190033
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98617-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 450B02C5EED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/11/2026 2:22 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 10, 2026 at 03:03:19AM -0700, Jingyi Wang wrote:
>> Kaanapali SoCCP will extend the list for smem properties, add SMEM
>> properties "qcom,smem-states" and "qcom,smem-state-names" to documents
>> that reference to pas-common and add maxItems constraints.
> 
> This change is no-op. pas-common already defines all this.
> 
> This should be squashed with the change changing pas-common.
> 
> Best regards,
> Krzysztof
> 

Well noted.

Thanks,
Jingyi

