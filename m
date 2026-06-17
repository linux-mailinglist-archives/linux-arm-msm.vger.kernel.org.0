Return-Path: <linux-arm-msm+bounces-113490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Usy+AiwHMmqPtwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 04:32:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A14D69624A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 04:32:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YNqdCJh8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HE9Xqhcm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113490-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113490-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5BCA0301A04F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 02:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992132DF134;
	Wed, 17 Jun 2026 02:31:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502CC3033DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 02:31:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781663516; cv=none; b=Ur3LQTQErlqwOj0e6Nn/DsyER3Cyoe0vS70/lT48mUnNOBukzgEtDL2UATTxe9E2ohw1nlcnbLYS7tUJPqIK/lh6BmSSmqgXBuj/guUuemh20CX4OyKOgBDfAi11tqKlFQGYo91xnvY4PnoqJ8Nyk0CYR1yvvwE5/9eLonr28o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781663516; c=relaxed/simple;
	bh=9xTfNsMwsoqVW8f/dN+Sm1Y7gmtdsAqJSTBi/b/aFyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLow5IAf9J2XDfpKcyVLgfDdRQYoJ5SvX7N+RSM/iw6weLsjwJjTjqiaRotv0EMQTUZec7bAJ06gsqF+ly0pY0x/6QOWhtdYzS5MjDsLOymMu2pjkXHUiZE5zQS0t2krD84j/15LertYdSXV2KRltp6ARhFMbmOw1nAT+HK8PII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNqdCJh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HE9Xqhcm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLUVGG149910
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 02:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sruMAy16agfp8+dLmVTyeBKpDyN3AMqjiQRv4woF4yU=; b=YNqdCJh86UFj02Tt
	WFx6BgsBz0oO+vy4cqjQiVPgdGMILtG+l87/FtJiSmMXGfpSEiouc8918JMnMk9g
	jwf1T4cbHqkLcnjNL4fH2kVHI94kcA3ChVcEGaaD5tmOKgHgOYWUsH0ojcYFv0MX
	ccRq5DUkJrLiIuRNzvwjvPgSbdvX/9hr5ygR06lEv6qTZQ4FNXEu6mFdfNuWipO+
	tVZAc3uLC5DPajfmgtlNt/VTjfNevu8TY2+/j8fa8Ga7yen/UD5+XQ2hm2l8D9C2
	p6ibTuJATpXtp/eVpUTP4EpEK+CxtQKi+IdLOos+zS2jezRZArqhp0Eykv6BHlEM
	jSlOXw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef20w5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 02:31:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so4775316a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 19:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781663514; x=1782268314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sruMAy16agfp8+dLmVTyeBKpDyN3AMqjiQRv4woF4yU=;
        b=HE9XqhcmBQcQWDG+Bqw43JrRPhNvDnuaAeYfWpN49H3YgsvJzSBAU7jWphImzs/lQB
         UUk2gAPuF4itzKcySHguVtCBgD8dNfql1x8FIV31Q17Ak4MygWN+Ef6d820Vp6rKJAc9
         iv53yuZeiBwXb8y2Jp2F8SOinWx7QGf9k6HUcEzDIsBIlTWfnV5b+umdrKJ1dr99YahB
         q8foHA+FSbIoRArw3+jBLtu6WgkEXwuv/apH+E70OcGi3H5W4wLVTSvL7fu42me0JC3c
         2zgTXRPSXaxwqaR3V2u/+5JZQCSD+men2iHEg9Ptn8YOshKaBeFBCS2TTc0jMO/HlFj5
         vKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781663514; x=1782268314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sruMAy16agfp8+dLmVTyeBKpDyN3AMqjiQRv4woF4yU=;
        b=OX2gkJ2n14+BWpsecTTG2a2sseKj6EGocnEgpFgXlMvlBOiRWrdMV+XGQzxW+pD+7S
         Yyw/z6eEl2H8tF/xxOFYlNzPJBvmIptKU0LRPHzo5aq2DIKjr8c7nFYPpH/Ad4OW6JJy
         Nh6pkJlTCi4D/t6G2HFQ/yJsx4MUq6iFpGPGmvLf76b4KLrwTSGB3LEF9spI0cmjn3N1
         qOBEBJFKfGznanpds+Nppr2YfpKOde/o9hyxKrbCfvFMjPARK43VC/hK6aCBCZQIrMkT
         ho+nqflW9p8a0qzZpuegoNsb40Izcg+68Sa9GyjTnDpN5Qfx3l7TjVhwzwMPTl8Zs4xZ
         4Q7g==
X-Forwarded-Encrypted: i=1; AFNElJ8m0H9h30fR6p1uWdxKym96Yw1K9u9hEQfx8qeEOHZlJ5KsIk+0OrxUxSGzap2OanHIFCJe2mrUuzw2sbR6@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ//RNqNK7BuaB1i3HOkWrzTy7c3g/LdW+1Sd/ZPX2sz/dFMUy
	TKIPB4CMKyB206d3Bhire/VBGXDc2OTI2Ajdet2LcQFgVSa8UPjW0IaJ5oEQ4WHzzMMEN5L4h8z
	YHMlW2JRyRyMvAUkD/MaFsXzJMXPrG0u0kHdWAKbqTvM8FEg+Xn2M9ZAL/GizRldWenuq
X-Gm-Gg: AfdE7cl77xQMeG49tkSAqJ4p8M32eoH2WGMiWfyh2FuFQ7SjvUWHYp8Ub4MVbOI3aLS
	DdhgkZb9ibVoaZLaXouik1mLXRIRTKg0ntabpc0z7rSKNLQQheLdSaQKh8J+qHrlvxyoakZM4GV
	WaD7wDBdVxQbbiFzWr4UeZ3+PJ9K8DtsnOugXbW0ofBNt4WS68+b0fI1QSA4E1EXOJeapIx/Q5H
	mRd3a/RJ7pdx6twAjV6fqy67KojAdv+v/v02yk79jkSydbF0MAAMghhw/0inNaRAWRjS7cd5IJk
	1CxGmNr6k6XMhuk3lf7BBI5eZvp3kv70wpYLuIOJOAmodu1Zc2ANOifOfb17TyNIvIOUz3SsA+C
	86sVlzvvqiq7EbtbXOZANbrNmYcvEbnz9Yya3+FijYHSkjtAmJvZ+uKhMYHWP2AV2QI2PikhCyv
	wCHc4=
X-Received: by 2002:a17:90b:3146:b0:368:a27f:9083 with SMTP id 98e67ed59e1d1-37c93319f29mr1924425a91.7.1781663513862;
        Tue, 16 Jun 2026 19:31:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3146:b0:368:a27f:9083 with SMTP id 98e67ed59e1d1-37c93319f29mr1924378a91.7.1781663513384;
        Tue, 16 Jun 2026 19:31:53 -0700 (PDT)
Received: from [10.133.33.63] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186aefsm12630035a12.15.2026.06.16.19.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 19:31:52 -0700 (PDT)
Message-ID: <1bcf00ae-2558-4c3a-970d-aee1da0c06f9@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:31:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
 <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDAyMSBTYWx0ZWRfXw7Djz05FgZ7q
 u4roSD7lQwaQS4oTouO63RmIoPzadUZo3bbxxV5ptIGlii+gzB33h0T7nhrOpwkVcrIehnC28fJ
 W+xngvBbVHDicaZp0/DQpx7wCWvuTmA=
X-Proofpoint-ORIG-GUID: iL9Znp1C-DZS_HBuCehqT5cERghd0zvR
X-Proofpoint-GUID: iL9Znp1C-DZS_HBuCehqT5cERghd0zvR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDAyMSBTYWx0ZWRfX4l0D2vGs+bpV
 ltzflW8lOj+81WsMaba4rt64MBIR+bAGpdzhOGRRmdew+F43U2MfT22FCteazD4u228qwBUJ61p
 8dJdE7/4Fq8opPXxjajcYJlDJ160eczrZqbh25SWVKg3SKKVwo5vK6isuEDYu/8c+/yZRoR8Rli
 IUvJuCS8HiymF4bNHSUCM/qAsEI5MfJUxmU8EsWz3SqFJPOems1XXMhWAp2Rqw3kZshaatqPoFJ
 2IPF3BnoE9smMaacFWonhnu9XwWkO3EyMvV0UZLunjcGPGbzweo0Wq09eLLuOuunUj1YOu1UzLM
 lHs+EuyR9gc432GRG5qp8iQhBjwDPxfIEW4VQACV0UOhThB4DNKObRPW/drvN3solaRRN5IC188
 YV1RkSm0101ISEk+P3HxACwK0YFUG3NIm9NN0EMI4zcePw48AdBHxoF7VlNUOgTlBoaYcfKgeXo
 fYl5nVGMEJambu2bDSQ==
X-Authority-Analysis: v=2.4 cv=acpRWxot c=1 sm=1 tr=0 ts=6a32071a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=-Z37uosrcRa51fMA2KUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170021
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113490-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A14D69624A

>> +		ret = ptn_bulk_write(h, HAP_PTN_FIFO_DIN_0_REG, &data[i], 4);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	for (; i < len; i++) {
>> +		ret = ptn_write(h, HAP_PTN_FIFO_DIN_1B_REG, (u8)data[i]);
>> +		if (ret)
>> +			return ret;
>> +	}
> So if i'm reading this right, the first loop will always write
> 4*(len//4) bytes and the second one will be entered at most once,
> to write len rem 4 bytes.. should this be an if instead?

I should put a comment for clarification. Here’s some background: FIFO 
data writing supports both 4-byte bulk writes using registers 
[HAP_PTN_FIFO_DIN_0_REG ... HAP_PTN_FIFO_DIN_3_REG], and 1-byte writes 
using the HAP_PTN_FIFO_DIN_1B_REG register. The 4-byte bulk write is 
more efficient, especially for waveform which has several Kb data, and 
it helps to reduce software latency when loading effects and reduce the 
delay in triggering vibration. It also helps prevent the FIFO from 
running dry during data refill in FIFO-empty interrupts. Typically, we 
use 4-byte writes for the initial 4-byte aligned data, and 1-byte writes 
for any trailing remainder.

So it still needs a 'for' loop here since the remainder could be more 
than 1 byte.

>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Configure the hardware FIFO memory boundary.
>> + * FIFO occupies addresses [0, fifo_len).
>> + */
>> +static int haptics_configure_fifo_mmap(struct qcom_haptics *h)
>> +{
>> +	u32 fifo_len, fifo_units;
>> +
>> +	/* Config all memory space for FIFO usage for now */
> What's the not-"for now" endgame for this?

The hardware supports more modes than the two currently supported in the 
driver. One of these, called 'PAT_MEM' mode, also shares memory space 
with FIFO mode. However, 'PAT_MEM' requires memory to be pre-reserved 
and waveform data to be pre-loaded. The entire 8K bytes of memory can be 
divided into partitions, and it is configurable, with FIFO mode always 
using the first partition [0, fifo_len], where 'fifo_len' is set via the 
'MMAP_FIFO_REG' register. 'PAT_MEM' mode plays waveform using data 
preloaded in a memory bank defined by the registers 
'PATX_MEM_START_ADDR_REG' and 'PATTERN_SPMI_PATX_LEN_REG' (they are not 
defined in the driver). Since PAT_MEM is mainly intended for 
hardware-triggered vibrations, such as a signal from a dedicated GPIO 
triggering a short vibration with a preloaded waveform, and although it 
also supports software triggers, I haven't found a suitable way to 
support it well into the driver under input FF framework yet. So, I am 
currently allocating the entire 8K FIFO memory for FIFO mode only. We 
can adjust this later if we find a better way to incorporate 'PAT_MEM' 
mode into the driver.


