Return-Path: <linux-arm-msm+bounces-93898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBpCEgc9nWkGNwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:54:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 72065182392
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19D7A300443D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6707C2C375A;
	Tue, 24 Feb 2026 05:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZKP55mC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xp/bKiA+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A741D5170
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771912451; cv=none; b=KtODaSeg8j/1DkyWoQaTs6NmPMz49tgbyrYsA/evL7FWZGvhkQTSa9jQlilAhdGQGcrVWgjZLexGBGPAQyUqSazfY+WVEriJ0WM7HxrPMPwM9M4tV9H1TdT5S4lq1cDLE4Jd4RkZWKf2oBgAP3Lnt4qwAYmSmxNudho0wHw1WP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771912451; c=relaxed/simple;
	bh=Hz/eoSqvEAlFesws+qniwk1kpd6/W96nDauEJtPDivo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S+vDpmw+7+H26ReStepOCZU/P2EZ77a+OSlTpZtvtyP7MpwHZrg+zUUkTUNKg2k/j1Lw4M97DSqGpOYqIKGEzj3NmOyQWr/v+H67VhGiWUbRWoY54NsWaqDdRqqnhGtB5V36ebItWV/0pml+7E9DubGJayQGkaWRh2+rTHBP/RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mZKP55mC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xp/bKiA+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LdEF2317644
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WMavZ0sxm8QIKKToV78mwg8OO4gSQCi6g+RBk50huFE=; b=mZKP55mCJpfBCPU0
	aOsnJomEqa8hyRW9nun7l9Mi3xBWZwK0jjMPGAfH0yvyd+Q5DONZlwZEUvNzZJoA
	jetj4An5XYhUx24roebi6cO5PLaTJUQIFg/0K7sGUdui5F3PXSQ3ZfWwxngn514i
	kPiumspoZshO+KVyrvA2jSI/+ybVfl4NPyoEj3dfkeAuBgZG6dv0T2NQkZiX3QjQ
	xfMFzvifoCJfIQKcmePerd6Wf0k0HvRPycX28mki2/gUdCNRUu+Gs7GbggEVuMCr
	VfKqa0DR2Tw6bXv0EyIi0xcNQ3Gu2SGO+X3L7Eq35LE9iNpe5t7hD3whjgoZmpK1
	sW4BVQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj9wmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:54:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70dd30025fso620653a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 21:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771912448; x=1772517248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WMavZ0sxm8QIKKToV78mwg8OO4gSQCi6g+RBk50huFE=;
        b=Xp/bKiA+G6f7xEEZwlSgZX0pau27TeBREYedT1SnH51p/Z9fSEwogNMd76h+uOme3H
         lNT7ncGlRbywtIJfgLBEASH3XrMd0uBCu6CfARNMm9nG+95scW3Tp/iNyhY5O/lqZhQP
         ZmuaBiAmlwm608I2Lszgl8n0wCOLEmvIkLXDTVi1kKWH4mpu74slxBQcPaUR9hiFmq2i
         YHB3W1jfLqOg/CJNS8RDtvT5gf3zM0HluUziYD4qMkfKihNtOzDTWD4+JZomEIIdncME
         MEQId4bW3Srimc+CrbUPhvEgrJQXqrlGG3k9Zul//qFJnJlFLuyP5SMtCd/jR+f9ss6I
         jTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771912448; x=1772517248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMavZ0sxm8QIKKToV78mwg8OO4gSQCi6g+RBk50huFE=;
        b=mmVVzJA9MvUwU3ueLkc27Hpf/6DaSqwXFWj5U8+Fd4UjqeH+7OpzVavzR7smP5rVDy
         koldnPf3ZVi3entwbMvZ250F4ofsEplglm9lPs3pejv+fRo44XYjrW55bboetydGgJ7H
         /KjgGVcQRatFN/h7/qIKk0mvTvmAmpGMlNXCtNPDLGn5g3MXvpFTW/UxevlnnshnnK8S
         rQFjmv4LGhzEvJMl5M6i5orL1zf0YCX/lWJnwnmXjOcmK0t3rjNtOiBbMb7hJONZS94S
         gdAc23wfqaTHgMCttmFTXBT+s8HXJTmxCesEYItNRQnVT+alnpji4ynOvl4QQUnvmovx
         BWEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDPx6DalR5xadgiNce5UvL2GIi1jYL7ARbGzOO4Ce6VJBphW1yhVN+ygMyRq4BWDLadChQ8sCjy87kgfyB@vger.kernel.org
X-Gm-Message-State: AOJu0YyVmQvntqu7c+GfDMcS8XOJn9Egs744B9UtYOPZBAumuz6G+U6M
	mwlPpdee0qzKdsJxQwtGm+thz9dwEhFEsNRTIovrb2/HO2ZRQk0L1B1zy7Yj1KpARgQJcKBi8wz
	LydyHYGwG2cziGzAOoRaRN9Mw3b4lzJ2zpXSKIpq+M4Yeuzm//sKRSwe9QNxFryymdQDt
X-Gm-Gg: AZuq6aLusJHsRoD3shngToWH3Fde053SUAuejT9solRr6hxIicSFA9thlQgaBi5yZZi
	D9sM3L+sm5Yqs6LTAuHiOAkO5j7TU8oQ9sUnsae9PWVuqM62ZkD5OCbD5TSxC/QzDrS230uON2X
	YBl4/IH+lHoIjhI9n8ghbqcdUWtXroi5W6Ds09CShK39Z/1Jvw2iFPI899Letcs+H9TWsHQM7pb
	0wSB/FhytYBncfB0PDFeAFdS8+LmYEvFVwqVQYtNebCEmSTxhRfkEPfJNEYvFT/IDt49Ilphw9Q
	kkVi9LVcWTG0Km3Vmalny0svE0i2TU/60QJE05YShTEobnDd0uHY14lhJiGNIiyXTizebO8zCJZ
	wwBZqSP7JgdYni4zjWWUuzrPokXB+TvRvkaF0L6HGotDfXxmwz0K79mo3uP0/e81nfz4QwCu5WK
	AniVEqYzSqBZ7JN2jJqbKO+Q9SrebshvYFwVYPMSY=
X-Received: by 2002:a05:6a21:31c8:b0:395:1b4d:c683 with SMTP id adf61e73a8af0-39545ba8c40mr9319048637.0.1771912447683;
        Mon, 23 Feb 2026 21:54:07 -0800 (PST)
X-Received: by 2002:a05:6a21:31c8:b0:395:1b4d:c683 with SMTP id adf61e73a8af0-39545ba8c40mr9319032637.0.1771912447224;
        Mon, 23 Feb 2026 21:54:07 -0800 (PST)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e1e1sm97509475ad.55.2026.02.23.21.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 21:54:06 -0800 (PST)
Message-ID: <598f8927-01f5-4889-9f8a-ef9c9ca7a616@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:24:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/5] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Glymur
To: Bjorn Andersson <andersson@kernel.org>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-4-sibi.sankar@oss.qualcomm.com>
 <siuuvqcxcfw2be72hh2pu6csmw6qxy26ixnxppbfy7gtpzxxzd@vuucoicoj4h2>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <siuuvqcxcfw2be72hh2pu6csmw6qxy26ixnxppbfy7gtpzxxzd@vuucoicoj4h2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699d3d00 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bH6bprHrhxwb1ATC2rQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: VmhuhPmxZyTLJlil3DF3o0Eg4qNHVw4O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA0OCBTYWx0ZWRfX0PdLhP2sSdDN
 NrfcyPm4LNBKaPYG/AtK3isc1fuq2bG0erEV5B8Fas8jxbWjQ7oycMN567YUlS/nO5PULb+bx1Z
 tUIyElArWxMJzkE/yURIJJAerHM9tDSlfOz9sGBiRz+yM/Xm91TDuocEq5mO4UxkK/fHbC3WOoU
 uugur8o0jlSPuQj9kBDIG6KKOvZdyk+rK0abq8Qw5RId1Sv8diRVbdU6BO55E4zS8hDmL3M2Lcz
 XbgOJlTNN5ta16QUA9G5HUbl2f6vfJsdZbKfoXFGw62DubadXu0a2s8O7fHXt8aEIluBglQXLL4
 IqfUwSSa7W/XZ5SKGuJELbnhgLuUFqCk639QHDTJPx6Ourk5YFLAq4fiU/IkWdJJoQN64v+Thdc
 hOkdYSmtGJ6i/77MJSHspb0gUnXWUDW/Hrkda7K87QpkhcBJKLEY6s1CXT4W9v9s7z6AvaVWLGz
 VibyI7rb1M8u2GU3xRQ==
X-Proofpoint-GUID: VmhuhPmxZyTLJlil3DF3o0Eg4qNHVw4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93898-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72065182392
X-Rspamd-Action: no action


On 2/23/2026 10:01 PM, Bjorn Andersson wrote:
> On Thu, Jan 29, 2026 at 05:43:56AM +0530, Sibi Sankar wrote:
>> Document compatible for Qualcomm Glymur fastrpc which is fully compatible
>> with Qualcomm Kaanapali fastrpc.
>>
> I assume this means that you have successfully called at least one
> FastRPC function on Glymur - with the WP firmware?

Hey Bjorn,

Yes, we did verify fastrpc on both ADSP/CDSP on the firmware that
was upstreamed to linux-firmware on WP Glymur CRDs.

-Sibi

> Regards,
> Bjorn
>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index d8e47db677cc..ca830dd06de2 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -18,9 +18,14 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,kaanapali-fastrpc
>> -      - qcom,fastrpc
>> +    oneOf:
>> +      - enum:
>> +          - qcom,kaanapali-fastrpc
>> +          - qcom,fastrpc
>> +      - items:
>> +          - enum:
>> +              - qcom,glymur-fastrpc
>> +          - const: qcom,kaanapali-fastrpc
>>   
>>     label:
>>       enum:
>> -- 
>> 2.34.1
>>

