Return-Path: <linux-arm-msm+bounces-114459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pg1PCKDcPGr9tQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:45:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1C96C377B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:45:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hPdJC32n;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dajSjBKG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114459-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114459-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DBC4305909E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D61378D89;
	Thu, 25 Jun 2026 07:40:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064D735DA5B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:40:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373209; cv=none; b=jxp90PkiLuFC4Ww0Uw+ubiqca9NoQNT9Wsap8qnib3tvgXUME2FRWXmK48f1NmYmg7JaRHVZC/MOyiGnneKFxKaN5+fnHXobCm9vLS/wDZsAeL0xzX4mDUhahf/W3Oe+qpUOso4jtfS6dMHzmQq7L/wUoAhspvELR2QKapVOAeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373209; c=relaxed/simple;
	bh=6LMaV7tSjo2C/B0aYBV81KfWE/PDaGlSWTVSu4v8Rvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFiELkK2fItV0LSD5o+0dq/3w4VgtpxapwcI33/8QprTzSPap5FUdY29//WhO9FRgB4Jo+9YekXqymz42X/JFzn/eC10fJEdb+MoRUuNyzj28RG6pX/ctRqTnMygBK0+4vOvV5jlm2W9MRRdtFlUwCeVG8GQVo9wjxyavmyeVZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPdJC32n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dajSjBKG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3e9E6904422
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/4C4/vcdt4WFOXcl6HzVU9MdIEVo3PNCuawT5cNjq0=; b=hPdJC32ndoS62Ptk
	XP3uYf6bJlQ1DcpVu7pkym7pIrqBmddGJeKrexZYoWb9/WP/oLyM9mGveO9DeHOQ
	MevYXdSZoajVQBHKdWhtc1x//mW4sHgElllJ2JDSyO+x7ltm7scsuxKSaWIHRh6s
	9hvMwFT1oUMbOUTH8++0U0aRKBPzABYA+V7gXQQ7S1ebjGPF/Uyxt25JwjGdCGmx
	8LJsL9l38hAuyuohvnryfAZQyRoufVoYAa8NMj1vsmlmWst6LBpCVTinCQQQ34zK
	BJcVGthoRwHN4kYCKBO5vQzrTFdk1RZl62JhHeaa92Qi1eJtvvVJ4HjewU4nUaGx
	WdTgjA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7du712-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:40:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a48fb4d5so16836665ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 00:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782373206; x=1782978006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/4C4/vcdt4WFOXcl6HzVU9MdIEVo3PNCuawT5cNjq0=;
        b=dajSjBKGT1C8qSe/nH+fDGfaiYfC6lgZ1gVRqu59IRzKuOXxeVQyIGrcVitOPwXqSQ
         FD3VahvOgtswuP1Q93IAQDBAIhAbtOJItwX3C+m1Qp3Yt/Tph9kfa3DMeQAOLGxIsQB1
         GdM7fuTjYE16USpjeTjRaOyc47RccGjbs8cHxLE5CvRWs5+F/xDlAVBCKYPTtLhogGVu
         rJ1PeraUPLifpOwfU4nilDH2+lqJL7J/L50X4Lzkz6GT3zhnN18VsS7lovUSXf4OODDu
         nsom63RF0tNuL4oRKSadTMQAucmJJTNfPawXZbYZizlGS5GSCZ8gOU3yLgtiEHyBr6Tq
         o1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373206; x=1782978006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/4C4/vcdt4WFOXcl6HzVU9MdIEVo3PNCuawT5cNjq0=;
        b=fWTXZrTUqCYF0QcZUqah+B0EQeV4Bs1YPhwFqeAWswaBjiA6ZgWoitq0KJ/Iyl58g3
         uOD+64rBjtuGokD66jvaKOOjXVf7XxjUaMpZSGeGJgG73lGJsqHp0ZOb1uHPOuTsvzSQ
         5Ltoma5jS9YEOeWPMIaDsxeGYRNMv24UsPV+4A7Awfpgpk4Sjqc+RYS1wPbQE3XJRor7
         1QIED+sbUyRfM0wb3ci9r+snDqmCuyeTDzsfcW6mKEj0vAPUZTHHOYxFXaZu532/U2P5
         YdyEDq/wtCuwo5dJbn6enleB05dAOJXiGEhQ1VgaT7W6EdIdWdPwAX0qfi7fbBt74/0E
         QyyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmrIXwRkior4N33bnTnGMlR5U7u2nx7bdhzpUcU3hPLRrAiKy3Ua4FYRin0iXUfrNBb839KZPCpknk5U6J@vger.kernel.org
X-Gm-Message-State: AOJu0YwlxZ4xy7f1RIJpOwOiOZ69mNuScCCFjEF5oTsZ7GQdLMoJnG+Y
	9Ep28jdzwNs4KS/GcGmEW3c9U/iwgmaxrhO0MTnQpTTQ9+vkC7pKaFZTNbAHvpHNhXLPiaOcjxd
	uAASBOEiOhbCnfZuDEm1mascJcwaQKxBa5Mv66C/53lno+vPLylpUQRxZ7MY6p8Ph1ZI9
X-Gm-Gg: AfdE7cnqaM13ae7q2R4ByeIRqTL1HjJDRQICLpZOoUM/+CUTqZGcoAvseGnxGbDkYXB
	NiC3aeZ+anfVt1NbWcc0HWlCbZ6Vwyw1MNJj2f6ilgOkMK0Gap5XMAdPv2zpJWVlEfDtvKcz6KK
	0nU/N8tVl+bO/XUT2oNMpesfluDOEaXmnqO6jkKfBdDG0mdzR2Bn7i19v/A3wtfMRxRr0NuhLzJ
	gN918lv7uhv/3zCr6z9u4EZ2P6jtFU86NwNkWpSiB5WVddeOSzcy60+vHIRlUJAGSB2aQEaNe0d
	sDt5TdE3+24mQZWBVo2ShLaLs1YvUOmFujmBlCLfT74seD7ZRVPF8yI6sSYmtJjyrXaTvHyvdoa
	6tAXhYFHxl6ibkqkVxFgR6C7EeIPwCFrHe+FTx3AxBAVrK+fnnMMsgZvTYHpz66c7sEnjEeaFYy
	KDF9VH
X-Received: by 2002:a17:902:cec1:b0:2bf:dd8b:7cd with SMTP id d9443c01a7336-2c7fc696019mr14046625ad.10.1782373205818;
        Thu, 25 Jun 2026 00:40:05 -0700 (PDT)
X-Received: by 2002:a17:902:cec1:b0:2bf:dd8b:7cd with SMTP id d9443c01a7336-2c7fc696019mr14046365ad.10.1782373205343;
        Thu, 25 Jun 2026 00:40:05 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f6518bb1sm13912915ad.84.2026.06.25.00.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:40:04 -0700 (PDT)
Message-ID: <32ba0f9c-7f01-431e-8cb0-8eba9f546adf@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 15:39:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: input: Add Qualcomm SPMI PMIC haptics
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260624-qcom-spmi-haptics-v2-0-b9118e60f3e3@oss.qualcomm.com>
 <20260624-qcom-spmi-haptics-v2-1-b9118e60f3e3@oss.qualcomm.com>
 <5a5fc753-977a-4e21-984c-9b4a09d002b5@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <5a5fc753-977a-4e21-984c-9b4a09d002b5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BCgP1nWDpB5MXaEmFdhUAtCyPcn12ZXL
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3cdb56 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=epH8AEZvAp_WDEgYvPwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2NSBTYWx0ZWRfX/NSY9s6UevJ+
 5WVcl8yD/rAhqBpMikVDmd/GfNzL7tM8ubeZuFAbhXuyiEnrvJVm82a5UWGb7LhJT1kjWFaKML4
 oCnWRTiny0jrBOY/kTtDAAXDnETeaYI=
X-Proofpoint-ORIG-GUID: BCgP1nWDpB5MXaEmFdhUAtCyPcn12ZXL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2NSBTYWx0ZWRfXyX9VoVfkCBgg
 xqfPKg/krIBM7X3voohYBv5QJwy/91fKRZ4Ba4DNMBCabnyOwYuuiwclBcV3bX0Fg0w2cpQmfH7
 Om+ny5GBETeWiJp/StG0B8vEbF73oO5D/a4lgQHJHMuKVLzG9xNsKgkFCen7liY4GP9vr/wAZlL
 gJQHxCJHkWr8PHBa1RB9fhKGQiAMCpYUXZcwQo7kHyuzlZz4HW3Cj1Cjjp9n59AwUtnvJKKfFuS
 02w/P6EpBka9kHuQ2KCZSQhf5zzInKTttiTlIHfsvkdwrjdjkwe6nN3M+aZl5jn2wrpiHhYd9H0
 7FPMcnthBNufOOqYHLd6X++K2yna7feNMkRFdZuK+KAGt9w583fdsXDjL8CuVHMX7H77EQpUqQa
 cdlX6IQpwI5ff1Sot7JF2aAvwvL8+PXimD5UU2+wcUqu0yyezf73o0pqceHlvBS4FSl22epJCbZ
 Abkz8YXJVM6yB2s6LvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-114459-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A1C96C377B


On 6/25/2026 2:23 PM, Krzysztof Kozlowski wrote:
> On 25/06/2026 04:00, Fenglin Wu wrote:
>> Add binding document for the haptics module inside Qualcomm PMIC
>> PMIH0108.
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   .../bindings/input/qcom,spmi-haptics.yaml          | 132 +++++++++++++++++++++
>>   1 file changed, 132 insertions(+)
>
> You did not test this before sending, therefore this fits in to AI slop
> category. I do not accept AI slop to be sent to mailing list.
>
> Best regards,
> Krzysztof
Hmm, I used AI in the very early version but I didn't use it after 
realized it was not good. I don't know how I missed the issue when 
running dt_binding_check. I will pay more attention next time.

