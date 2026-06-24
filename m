Return-Path: <linux-arm-msm+bounces-114291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wPpiKOiIO2p9ZQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:36:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 149AA6BC34D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:36:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iIr1vla6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I1avWWk+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114291-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114291-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01065301C963
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9B418A6D4;
	Wed, 24 Jun 2026 07:36:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70A0254AFF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:36:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286566; cv=none; b=BHvP7QvZjIAB+/LPyCRlJqrc+EXtmuuQT+WjQD5aEiWDYtCxmVswMf/cSS8pCYGWmDat2+J1P9VNr3fjY4Bm7VZ3thkFhiybuWNiiDhPoWL/P4yIKdO022EMKq+cQaK2eBENTBxYvV3rYeT8JnRGLXIf5noSWy0IE6+hXy2cp6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286566; c=relaxed/simple;
	bh=zOZeDrcLdvch142MfHk5MS9B210apc38s7awcfMUppQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACw16buJDN6kg9FzSHL5e9mKxd44TWuSqDB6liYkTMGHvxOIAiJTbyzWwvf8CsE6NlL54/Xm5anT84EGUCk49C0VKD2r+P34H41FFQ6en1qnElPMZt3i95F7I7S1cJbOD00qWjtOPa3TcI53WG/CZep3gAlI6LhwPLABJ+ZkZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIr1vla6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1avWWk+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tsxi2522394
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m6RG6qHBDsBVG9WQlfv5QhkPRXQjiqbUmHJ4OHjs1uU=; b=iIr1vla6ptbh8LBu
	YchkggFB8ha4UMlPZS5dJjOtQtWI5NhA1MHPf3KVXWNb3p5AN7t8yu4MCfEh68rN
	+uHUTuU6DkuWQe2t4UJWaWkgYIjAhMEFkqyR1kpyRSpB5Dp4x6Pc5jaOOcvzl65z
	3h5blo0iux1UQuKDygbiNr89i6XGeSc+UnV5A2tHh4E4uoVS6A6p74P1gFfGKSDc
	eDwmRJ6nu9q3IrDmEMf9CJjXLn08rw06h0fBteO+YCoqspZ0MrShVZQ88Vn06Uv+
	1jAb2bdEVUrGXlMdTMKIiNIkaelTb06k2VdBPQbLndpyxQ74b5etk99RBHCpofuu
	7hKJtg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajh58x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:36:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dc4536d42cso2417086d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 00:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782286563; x=1782891363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6RG6qHBDsBVG9WQlfv5QhkPRXQjiqbUmHJ4OHjs1uU=;
        b=I1avWWk+GDcDpkdfL8gWCSEgW/aPKQ820oIb9G0TcXdy4J+oM+AZxzY40TFam+KgI7
         y8MUFoYhhh6fPPDYruwF3E8SYUVCrpFjKGE6NMMKVmZ6h0AFQTRdD1x48Pq2LiwEdFa6
         uj96QqiKHbh5t8K/Zb9jv5ztzMZuRIcFZiZHsmr4ZuOhEYnGJKSZcpL1n90rICSdtVqz
         i8b/xFALXAwI4veil5TIUGDwv+kjm14ZCtNapTwV/eRU4FOs7ZvMjETV1gs7UwMR2Y5R
         qT2wi77Iu0/yEKkTuJpxIgmvyg4gKtziWM5NQw8n8MygB++WZM94H2JYGy9yuavwXhhB
         x5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782286563; x=1782891363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6RG6qHBDsBVG9WQlfv5QhkPRXQjiqbUmHJ4OHjs1uU=;
        b=Q/OOitI7673DkuZZ9dylL/1iaKug6LoTKDng6nnuNmhDjdQS2bjfRIfXJyx4Jsa+B9
         e7+fX9hYmC4UU1JPJWeQqNMJAWzHK7PJQwQb11la45431aOHpq3XkNhIZZ7WB3jxSnco
         Ctd899Xag4kgVaweU2AqSrgYtraQ1iqLHfSHAUmxQGNltfbY65NZKt1GxXaFX5pqLGIS
         V6DniBJTSOlvEewT4XCYImYvT4pgsmYdc/ICLHyiMFYUvxuHYx/GuZlxLHVYntMx8b0f
         Ba/H22a9hXfHkZUhbVWtJfDHBzKVNzQdvQCnDFJL7IeJLIAexbbfjHxYAW91Ybn08m44
         yRgw==
X-Gm-Message-State: AOJu0YxwxSguX1QovH+/ZipeQ+Gx8naYe7oZEUSztfGEfKZR1ApvmerY
	yGC/xHPfCN7QSNGQ6DbeedS11qxUqxG4fMWH+721IxJ67RFPVspyU8JLf4/jCnJ3P27gYGs3s3L
	9HXxCQelXr3JllncYVsS0oq/BiADNaKcuSiYcSOHLYvNSnaNcMMw/7cihIhp2ASenI7re
X-Gm-Gg: AfdE7ckP4cmKRG3uOv+DBIqhCnew37Otnr520EBcIuUp9gsz9xVxaWHfNgzleTk9O0I
	wwbs6ngmOZA1wa8kML6QxWps9XIm1inculUJss5rSS9itK4dLpbmdpZVDmqRmGZ75O9qKjxKZWH
	nuchB2CEkL/7lEls7Lo/sPO6O18IZSux0XR4OSEDOhbEQfQs3X58XNaf97+I+IAIsEpGgYZLd/b
	U0Zw7YeBWkZuDPb4i8zlXm/hsm5z8dIK1OaKn1BEZHpdahwKhhNn8P5X2yvkxpDhTeNPy3zZ/ov
	iHWlInO41KCnXYnlV6OYSnd1mx4FXlG7hpPz1DF2YBkjxuBHJJJiDr7/n2x9+fLiqNWoJ7Pxyqi
	GlUZxu53YzZFDOt/KcDTTHLc5gDdJeVP2WPI=
X-Received: by 2002:a05:620a:46a5:b0:920:798b:e28e with SMTP id af79cd13be357-92185ddd071mr1940279585a.3.1782286563022;
        Wed, 24 Jun 2026 00:36:03 -0700 (PDT)
X-Received: by 2002:a05:620a:46a5:b0:920:798b:e28e with SMTP id af79cd13be357-92185ddd071mr1940277485a.3.1782286562587;
        Wed, 24 Jun 2026 00:36:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49a759sm620337966b.6.2026.06.24.00.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:36:01 -0700 (PDT)
Message-ID: <90f9f8a8-971d-4cb7-b2a0-248349b329d4@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:35:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDA
 850
To: Krzysztof Kozlowski <krzk@kernel.org>, david@ixit.cz,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623-sda850-v1-1-ddd8e62c85d8@ixit.cz>
 <6ddd0652-d18e-4e23-a230-5f5c8a9756f8@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ddd0652-d18e-4e23-a230-5f5c8a9756f8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MSBTYWx0ZWRfX4zI9QD+fmpXy
 ULcIWBDfbc0YRTVDIqC6eGwweA/e8urpwBDsrs8PPb5hcnGXE+5LicqP7sUfPUMTcN/c+7YE8f2
 m9fFfxmoE3J2siIMuvwraoPlSTow1I0=
X-Proofpoint-GUID: Rp4bJszzPfekEiRoaSgpK282U8jLKRMS
X-Proofpoint-ORIG-GUID: Rp4bJszzPfekEiRoaSgpK282U8jLKRMS
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3b88e3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=zeegRnXwAAAA:8 a=Cgdc60V6Jtu-LXmvHXoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=aYiELVVybkd6ZUoGVZ6h:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MSBTYWx0ZWRfX+vcxzzCsPJIo
 NnZsRMenv88COEA3FziLgUmobkX0mEY9W08RrGpTqdb6+yUVhSkLmX9bWVrb380rBSqAt6c0uFr
 9i2B3CQsWeVBlDWWlts3cOZid5nhdRXiqrbPpVazwUiZtmp+CKNhxJ/bgPuNFkLi9WRL6p+o1c8
 Br8w209yIU3YgGUvdOfg+l45OMkc5h7GIuLHZDC9U1nfF6GH+h1nakHv+lauVyRV+OhHe3ckf+w
 T8hLURptKB82fzgP4ELacEzsehD1JzORa6vw+7kHtvDRsfsm/Ac+ADV8ploUcP6359qbKN82h1Z
 s9vbOf3cK3SWaoTwDbnIDH6yHCQ/+UbAB/YfqE3Oflis2strs6OiGvjuTC5NPhhwMmo8BlYWUSx
 wbrBoWQ5uNZ8pMF1eWubi0sP7T7QEA86Jt36fUWbvJyAyumHmIvfOQ4YYR/b8fVbj9ofw86tAf5
 vskE+TriQ89BDOQDiSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114291-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:david@ixit.cz,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,comma.ai:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 149AA6BC34D

On 6/24/26 8:26 AM, Krzysztof Kozlowski wrote:
> On 23/06/2026 20:41, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Add SoC ID for Qualcomm Snapdragon SDA850.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> Will be used by Comma three.
> 
> Can you provide a link?

Previous gen of https://comma.ai/shop/comma-four, they don't seem
to have the old one listed on their website anymore

The other computer tells me SDA850 doesn't exist and 348 is SDM850
(for which we have a number of DTs in the kernel today), so let's
rename it and add a second patch to add it to socinfo

Konrad

