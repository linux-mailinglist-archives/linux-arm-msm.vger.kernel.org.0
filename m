Return-Path: <linux-arm-msm+bounces-113210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yRrECW0cMGpcNwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:38:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6734C687C59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:38:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ACi9lPJz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DRT02+vN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113210-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113210-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 953EB30B7F6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3127405C5B;
	Mon, 15 Jun 2026 15:33:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B110404BE1
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:33:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781537601; cv=none; b=fkhQjpx+gB85CkVd70MJscQNzGJgDHhZBObsI0VE8UjkcP9w6t3loXWBxkMb3Z+ZKJbcggaIxlgICbQIFQ9ojKd/x0E3/1TQY6sN/IijyrBddYdhRMDEDmW3iLcJHScQtYkeXNu7WS3sxVNNwB/gPvhvt8otm0kGM4BVF1hvXlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781537601; c=relaxed/simple;
	bh=KwUenCCTGlmgA/VcqQxmvfMpJVnf0YViC+wBXBgr9oQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tos2f7PBjDGCmH4/b7aAlhczK+s2OSC5XyVMvVUUIL2ockvfd0zE6+mXroHFEZZ6E9goOuOhN0UyzcgTUelAdg+XgQo60T3kHPDMLSoRrMFZ/FqR9pWTWZQyuo8CL3DBRy8z8y00+XCgAZFXqLH7e97JMIXpVjfgFl4Kn7UuCTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACi9lPJz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRT02+vN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFKjPi904359
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OwMQO0LcqR49s8kdpKn9p05zdjYBTA9VDNonkRXI1Ww=; b=ACi9lPJzRqm6Ft+O
	dQs5XME/f76WWxRbnjH7GJ7yfRAJ2lHzskCTVl96VVuuwqmcqBRtVMUqPQwW3fwS
	5F9ZAoMx6bOYAxIPNQlAWCSXjLoJ4Um3P8BhymdqZ2s17XAFb4Kao6Of/JHgdHUE
	RRvkmeUAi1K/Hu99t6ZtQ7AJOh2FiEv3YyIrtJV7JS8h0jxdJV4ijb0mzl+w9tKL
	FUpM643/Y29wQJ3odnMZPs0FD3oeVVC6ozRBJ9OmCs5L15B0NNVkHRkkzAVhExJq
	RWspUUlJU1bFkheNdOxoMzD1T7sL4hrierQXWZ0N1FFreFhI9v/FL/0U6kwB81US
	d4yZwQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter21gw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:33:19 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59eba324559so2142364e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781537599; x=1782142399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OwMQO0LcqR49s8kdpKn9p05zdjYBTA9VDNonkRXI1Ww=;
        b=DRT02+vNNFqAME/zbKOYa2Pc7tzwL/MSYTUrtsMNAdLlM/OCbsByyxm0YEvMOrIlXl
         JJeYvJLEuAjZL06juLweVT2LDeb/7525CHV/eIttlHRhB1qtnjPOpXipoiLT76/u9uCA
         Afy7Dsa9sS1mATXK2EucuwZGFhSmlJIYgVfsWF6F7fPbPSDhxO9HS3TqSBDYW9xNt8pO
         Y1QQGdcxi9Zf8gBT7tHfogs5q2nyFCcCzfQb7ODkeOl30RsWDj4+d0ywjvPsUWohk0Bm
         KKSubp21jy1QK22rDkvVpDyxNu+0QNujV0bQl9GThJ5RzsYRI6rAg0yOHV4S0pjLSes+
         ridw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781537599; x=1782142399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwMQO0LcqR49s8kdpKn9p05zdjYBTA9VDNonkRXI1Ww=;
        b=iyJeKM5b4fAeHrDmqhKULIlLOzdNuzy2IPKvk0TTRr6P0LNa3J4Tug1Z5rDnkKzZtL
         BViDI8+Y7eRMroANPkabJApSZA1K1/CVuK61y9V1zg1lAwR/SwSjB3fKSQc5OAIZp0yb
         FIJr8BdcLkfzQ4esA9w1gL2nwahNCB7J9YzCz4dSkIk084QkZEn2hKvemlIpbrXeKYGv
         mgq35YgBKBrEoSt8kV+wiymC2j0Evx2eEfXSYV9mYY0qhr9HryUQxdjpQl3ITkKJBEth
         EKZx3wA1sTicKyKjWySwXOqB/rpv7q116sWaKjF6s/koTQU/0Nv5CQheEBQpaflQwZmt
         S9Ig==
X-Forwarded-Encrypted: i=1; AFNElJ/FBd9TiWWrwC62S/AWDF7s049EbzESfBW8tKWQJEZL20L5PV2LRkhHbsnJtyY3vq0ZmAVQhCei4LFSQ/tq@vger.kernel.org
X-Gm-Message-State: AOJu0YwBExi1JskpL0fyu5SIukJDfqJyuQEa4ijdseW2+weNQg/u0LN5
	XKMdqRVB6NsXdEC4gM2Fw1dXPWYz5rTxRWmIaJUyJiHCNYM8fM37bXTookhHoZkD2szjJMWY/ZN
	tEviD7S7VHmi5YXSO4N59/doahpWdMxasUilcCg5Hvd1My19q5faMWIGZz5V+ULGgFgv9
X-Gm-Gg: Acq92OGpABnYoA2POIGyO9nnueeU+MDME94rlcK4sqWur2dT/CaJLYvHnRFQMc3ULa0
	i1MSMcOa7TCVuYhcOphTNewnF8MPS8GmT/YQPiJrYXLy2cotEzVcKO0/1ZuwkQYVPPjxQ4+JHA9
	Dq7QOo0fLMrB9fCNUba4Q7OfaM80n9b2djiX8IXPWv2XUh710PRXreLiM83cewcyGjF1jmcIBek
	6c8BiJMLf4A+mfhLrTdNUFnxHmyowjPDBTUpItROD5ktN2lyU6Te0cvk3Lra841RxVWB5qkeCE1
	RxWAjI6vKtsgb/RJVKDiWGmrGfG4f5CSTATtXgSB8sRFZfzUpqnEJbQF+N5ppo+FajTjnFGHBKM
	MxE/3iDmfus6Fx9AodFsJLHzSXsATg9orjGdC/rAhViTVjb5GT2KY/vFGL74dOYiT4qeTbCTVLO
	AzdX71JFQga2TXRw==
X-Received: by 2002:a05:6122:907:b0:5a0:9ad4:7016 with SMTP id 71dfb90a1353d-5bb6c13290fmr6584840e0c.10.1781537598509;
        Mon, 15 Jun 2026 08:33:18 -0700 (PDT)
X-Received: by 2002:a05:6122:907:b0:5a0:9ad4:7016 with SMTP id 71dfb90a1353d-5bb6c13290fmr6584791e0c.10.1781537597998;
        Mon, 15 Jun 2026 08:33:17 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b0eb:75fa:2a81:cf30? ([2a05:6e02:1041:c10:b0eb:75fa:2a81:cf30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa51440sm739885e9.9.2026.06.15.08.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 08:33:16 -0700 (PDT)
Message-ID: <dcdfe9f4-aeec-4d85-92a1-a42592fe11c8@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:33:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <hebyboondtxyyetwuwggoiysurz335xzn7asf6yit3qrexap3x@kngk2m5xum3x>
 <93e7251c-c75d-4e43-9ae2-bf485af58de3@oss.qualcomm.com>
 <mp2hl67rupxrssa43dcy36m3dwatlxsu7n27l7qdqsguo5i3bp@bo6sdzxglxt2>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <mp2hl67rupxrssa43dcy36m3dwatlxsu7n27l7qdqsguo5i3bp@bo6sdzxglxt2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE2NCBTYWx0ZWRfX3AdNCbli5JH+
 ATaC5jfj+Avb/fkyf3hOTQme6RBx56TxabTdmDuG1FL7+f2cGusfScUck8+I0z+26m3zknJ3HmA
 bromC7zjn2tbkSXO5eywa6R3Ot/56s8=
X-Proofpoint-GUID: ZTn3EeTrM4jPSz_8P8dVzSbdBZWBDRV-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE2NCBTYWx0ZWRfXyh83JCYMaqSG
 9Qgg9kH6NF185j7T0+biDMo0Z7JH1xBCP07sfQcDsMpo8y7kvOUY37tjm0DKmLWXLY3pQRB4Usg
 w1Q9H8sxE+Zqk5c76nZnT5jJdm7+3qbFSDrlCi+RgVyvPVA39kt8Mba3mGvNumTovH342QpUjqh
 Agakq7MEck4BQ1vYf58oOdzIyxSq40qpsN9ff7EW2VjSWvJ/7YCCDETnrC7P1JahPMlJV6Pehm5
 iAJsB1lymtYUokAlp8J5KryxRbvBbhRh7pwo9FMhgYUuQN9VbhEWRuDixrl/ujfNiVxz4whqZlB
 3h/JJg9F885h8VBd69RyeceLmFZ+YM1i1z3ACx79tlLVGgC8yKpuWYC5MYXD8CH/3IbD4RirHyf
 AznU+dkU13C5E4kl5zoNh2oAn/DR6eaEkHxfBNEUT+xfCbtUmgW24XRYX81xLsePmuWmP0jtoEN
 eYKmuQSlD6DUsrlqdrA==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a301b3f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=UGbA0b5lBdDrEDKOv_UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: ZTn3EeTrM4jPSz_8P8dVzSbdBZWBDRV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150164
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113210-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6734C687C59



Le 15/06/2026 à 17:14, Dmitry Baryshkov a écrit :
> On Mon, Jun 15, 2026 at 04:33:38PM +0200, Daniel Lezcano wrote:
>>
>>
>> Le 15/06/2026 à 16:11, Dmitry Baryshkov a écrit :
>>> On Mon, Jun 15, 2026 at 02:30:49PM +0200, Daniel Lezcano wrote:
>>>> Hi Gaurav,
>>>>
>>>> Le 15/06/2026 à 14:12, Gaurav Kohli a écrit :
>>>>>
>>>>>
>>>>> On 6/15/2026 4:04 PM, Daniel Lezcano wrote:
>>>>>> On 6/13/26 13:05, Gaurav Kohli wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
>>>>>>>> On 12/06/2026 15:52, Gaurav Kohli wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>>>>>>>>>>> Why? And where is this generic property defined? You cannot just
>>>>>>>>>>>> sprinkle generic properties in random bindings.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Ack, will add why part.
>>>>>>>>>>> These names are matched with the thermal
>>>>>>>>>>> mitigation device identifiers
>>>>>>>>>>> populated by remote firmware over QMI and define
>>>>>>>>>>> mitigation devices are
>>>>>>>>>>> exposed as cooling devices.
>>>>>>>>>>
>>>>>>>>>> No, -names correspond to values passed via DT, not
>>>>>>>>>> some remote firmware.
>>>>>>>>>> The remote firmware should give you interface which
>>>>>>>>>> is explicit and does
>>>>>>>>>> not need such properties.
>>>>>>>>>
>>>>>>>>> thanks Krzysztof for review, We need tmd-names because
>>>>>>>>> of following reasons:
>>>>>>>>>
>>>>>>>>> Following Daniel's series [1], the thermal framework supports
>>>>>>>>> mapping multiple cooling devices per remoteproc/device via indexed
>>>>>>>>> cooling-cells.
>>>>>>>>>
>>>>>>>>> 1) The thermal framework's cooling-maps reference
>>>>>>>>> cooling devices by index (for #cooling-cells = <3>).
>>>>>>>>> Without tmd- names,
>>>>>>>>> there's no way to know which index corresponds to which
>>>>>>>>> TMD, as firmware
>>>>>>>>> may return tmd-names in any order.
>>>>>>>>>
>>>>>>>>> below are the changes post new thermal mapping changes:
>>>>>>>>> DT: tmd-names = "cdsp_sw", "xyz";
>>>>>>>>> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
>>>>>>>>> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
>>>>>>>>
>>>>>>>> names property are not to instruct drivers to register or not to
>>>>>>>> register something.
>>>>>>>>
>>>>>>>> I don't understand the problem and explanation in the binding is
>>>>>>>> basically non-existing.
>>>>>>>>
>>>>>>>> Remember that all lists and indices ARE FIXED, so driver knows exactly
>>>>>>>> which index means what.
>>>>>>>>
>>>>>>>
>>>>>>> thanks for review, shall i use driver data, which is basically
>>>>>>> pas data structure like below:
>>>>>>>
>>>>>>> static const struct qcom_pas_data {
>>>>>>>        .crash_reason_smem = 601,
>>>>>>>        .firmware_name = "cdsp.mdt",
>>>>>>>        .tmd_names = (const char *[]){"xyz", NULL},
>>>>>>>        .num_tmds = 1,
>>>>>>>
>>>>>>> Is something like above acceptable? and this will also help to
>>>>>>> filter tmd names as well?
>>>>>>
>>>>>>
>>>>>> How the thermal framework will bind the thermal zone with the TMD ?
>>>>>> (node pointer, id) ?
>>>>>>
>>>>>
>>>>> Hi Daniel,
>>>>>
>>>>> thanks for review.
>>>>>
>>>>> With id only, in this case instead of taking tmd names from device tree,
>>>>> qmi_tmd will take tmd name from pas_data(driver) and register with the
>>>>> cooling framework with id only. Please let us know if this looks fine.
>>>> May be I'm missing something but:
>>>>
>>>>    - The QMI TMD returns a list of names, not ids
>>>>    - The QMI TMD may return the list in different order than assumed
>>>>    - The cooling map index points to the name of the TMD in the DT
>>>>    - This name is used to match the name in the aformentionned list
>>>>    - The index in the list and the id in the DT can differ
>>>
>>> Would it be better if we define standard indices for the standard names?
>>> This way we decouple the actual firmware strings from the DT.
>>
>> I don't think so, it seems to me too fragile and prone to error.
>>
>> It is a remote proc, an external subsystem. The contract between the client
>> and the server is the protocol. The protocol specifies the identifier as
>> named strings, the TMD names, not numerical identifiers.
>>
>> When asking for the list of TMDs, we get a list of strings. But as it is an
>> external subsystems, may be tomorrow someone decide to send list ordered
>> alphabetically, or per number of states, or whatever.
>>
>> With hardcoded id the QMI TMD clients break
> 
> I was thinking about something like:
> 
> #define QCOM_TMD_DSP	0
> #define QCOM_TMD_PA	1

Ah ok, it is correct if:

tmd-names = "dsp", "pa"

Or

#define QCOM_TMD_PA	0
#define QCOM_TMD_DSP	1

tmd-names = "pa", "dsp"

> cooling-maps {
> 	map0 {
> 		cooling-device = <&remoteproc_cdsp QCOM_TMD_DSP 0 2>;
> 	};
> 	map1 {
> 		cooling-device = <&remoteproc_mpss QCOM_TMD_DSP 0 2>;
> 	};
> 	map2 {
> 		cooling-device = <&remoteproc_mpss QCOM_TMD_PA 0 2>;
> 	};
> };
> 
> 
>>
>>>> Krzysztof , I don't get why having the TMD names as properties is wrong,
>>>> they describes the existing TMDs on the system and the cooling maps index
>>>> points to the one to be connected with thermal zone.
>>>
>>
> 


