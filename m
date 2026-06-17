Return-Path: <linux-arm-msm+bounces-113534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pD3nN390MmoC0QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:18:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A6B698696
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:18:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Gia1PQyo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="QG8DBqi/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113534-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113534-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59057317BC8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3813C5853;
	Wed, 17 Jun 2026 10:13:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D5D3A05E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:13:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691187; cv=none; b=kwY2v/Dp+Hx3xKM4OaamXPEqDPlHnHmaoQXQpKCW5EM1KjP9+N0CkRPp2NN2+M85JhLNA8i+3XDkA7Hv1z4u32EeNNgfkhgvV4EZpyVCjJfkEYVXrBAPR2C9mtK6mKlkZcYkDO09F76WMVTnkdiSgOrs5DteQh/ft1WbTvaLPjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691187; c=relaxed/simple;
	bh=UoM7xrBB+ZCYmns2vLjYYzvl9XGVdcm9LQNtgl1qOwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5MJAeK7TasQyN2HQ2UWlsEL9hziFKOd8mKdisPQf0vmtDmPTDX8q1UPFI4ULekidEGUdE5irPFVNU2Z9J/GrdC6zkZGvAqEPwYwTq2u6i32Qph+upbohnGz/akF/abR+Le/8Lv2ubmWk7cu6MiE3ktu2lPUrZh8TOCpkwyoUOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gia1PQyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QG8DBqi/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UDux1734960
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GZ/8Xv192XsFQyD+0JEt9/9tPuIbHQCOMoIPHcWB8s0=; b=Gia1PQyoK8Wo4nRQ
	MCkM9D63pFLVuXGmBdXXtWmIH3/G+q1O4nPtEYiqafAKZTVh5otx8I/5fwxadXDw
	D7/1LCAa97Ve6vWnk/AX+uuVVSc0cwesnJJ9GkDSiUVrTAE84D332vGY8VWlKiMU
	DunK/6CPNdS/2ZzPPEc0pAZDctSCcWnPxgiYb8FrOagNcVrVTSmPEEIa2JWIh46m
	q7sBPWNPwopa2CoPWiIco3/N5HeMrNgFcE5ErkEFxxKuJ0xZsCj4AhOBiginqo83
	hSgrzCQpcd4D51dRHcwRbM827kk1b5Evm8UATWHcDV8+UCw+cucPPjuGaKF1SpAQ
	A7Ijfw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemjkyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:13:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84240b58211so3769894b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781691184; x=1782295984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZ/8Xv192XsFQyD+0JEt9/9tPuIbHQCOMoIPHcWB8s0=;
        b=QG8DBqi/UfQgXGLZUG456VDA1bkiMYFrK2ZA+LkKhZ8PEDwH8djOeN7aanEys21XF6
         Fgqlx5Z2P/3OHW2yWeRKH91By+FjZmn9InliMSlhMOKfE70pWBEd9n4MRQPS4mBfx5Ij
         kw5glDOe4ojCVLUTM5paqqNVkgeBKKeoiRlMEZ5ej4dEJWc5fvxaLmj+BxQ0T5w6IGvh
         4KA+pVSFPnG5nVUU8a+Vqgv6SQvhzKgTMjtfTB9SXh6WB8oroA/3sxJEYBH5E4lc2Riq
         gww76UR2RkjDt+3DS1Vg0l4mZrMvoNIWj08ORIyPApwDlhBnxCQTM2etDJVtf6gP2cXJ
         YpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691184; x=1782295984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZ/8Xv192XsFQyD+0JEt9/9tPuIbHQCOMoIPHcWB8s0=;
        b=DQVJtS+WPXDW8KhGaPsqMq5l+BsX2JxNLeuL2nwdZMNkYkKqCK9V4dBXMh7eyGpHg2
         PRfb0tR4eq8hueQ78Pf6Vve1g3ziDsO+f+Vd7tUvkH0CQw/thHOIcxWfxdVE8XFsxkBZ
         CPK06cyA2R9FKvcC81M3TJxwF0zSR/X1q+brXsJzjRHL1MfqhO7Js8Mg2Ke/T9MbiZ74
         Fn6V7t/sHJpchSZfwHc/kzVitUGYcJoPe3ACVEF4g9msBCS0e3DRcL2sFKPEXg8Y400U
         Iyxzq/KdmDRPaPA9jMaGYA42WGnv++/zEjeQAfsNCgwPxKPdvNvj7KRqQOPFNl8IaqJo
         a70w==
X-Forwarded-Encrypted: i=1; AFNElJ//BTsKKq+yAWTjZJiqM/ilEbpmcEmta8adUZCCGJVIyniWQV0aO9I6ItkjLEoSzTq3R0LwrT8llnmkbBXr@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ+W8jCYNXeCFywZctGg3VW0t7Hbz7jtKQwEZwiNv797vpJR81
	KjoGegJEIQbi6KQVMFx3vhkBVNo5sUsJBrS/hARNhD3Dd77Y7PHleR9cHNBEBgpRDPkC+ihw9uy
	rLyTI2fXdrJHkqSQPwnkSDtstMbtI+hZVxqDbotCchc6H3B1UtEzcs0qQPIzQYBbkb//g
X-Gm-Gg: Acq92OE13qazjPJ3zI2WuLbrpHWUbyNWtz6XpiaIhkv24fVuFc64OVr8lxJehatlTES
	BgpHmLE6RpP+3Ez+x4qw08m2YZ3jnkk0iZui12crI1JvtOABoczBamMd2DCVB+ouETtENVA5CIJ
	7oZ78JvNp251mtkyKIt9h7srzfC0gnipvzE4jHj4ASYXlubeR3oC82JEzliaAI11u1Y5AIjwWpr
	MYnj8CIwKy2jFhHn6LsJRAwCC4CnqoJwXi6WiLh2YlA10bWfvQSzhHKFCSnRvl1S4mDeU/ggUdi
	0nmtm8GScGm3fnTKYCRplBkG1tiAezpNkxCH4O+Rr2w9777Y/noofX1rviwHPclFCqEd+OT2gkx
	sjA5+V3JsPTWUKQkCY0rK7TpecbD3mnMarxlpVr1o2wJDtF6y5BZ0196vJN4BCPckDw/IwOUNzq
	jqgPoE
X-Received: by 2002:a05:6a00:94ed:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-845245659c2mr3122563b3a.30.1781691184484;
        Wed, 17 Jun 2026 03:13:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:94ed:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-845245659c2mr3122518b3a.30.1781691183961;
        Wed, 17 Jun 2026 03:13:03 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9bfe1sm16026068b3a.12.2026.06.17.03.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:13:01 -0700 (PDT)
Message-ID: <82253653-bd85-45b8-8520-e2bb213ca48f@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 18:12:56 +0800
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
 <1bcf00ae-2558-4c3a-970d-aee1da0c06f9@oss.qualcomm.com>
 <29806448-0588-4590-8540-a689ccf1e7b0@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <29806448-0588-4590-8540-a689ccf1e7b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5NiBTYWx0ZWRfX4t3hHW2CDugw
 vUM/1d8tDBBeSaoQzCh7awiCinDgC/Bgmjb5xIpHogRO/T0qyTw6XzHstQZW5RmYiT8O5Al9ys5
 col9M/kbwh7iSKtFKgvxj86gLjlnhHI=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a327331 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3bJTXa-xiIkwHRLKEFYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: srPtYUMJV1bd4sA6MK7LibJ0eqMldLxe
X-Proofpoint-ORIG-GUID: srPtYUMJV1bd4sA6MK7LibJ0eqMldLxe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5NiBTYWx0ZWRfX9l1srv6o3CoD
 OgDcqsoyB2juxheqTHXUP+mYatMNEb9q50hEmwS+YG65AnpjZSWlLEj603Xo20JA0Mx3Gdy7AVt
 oF+I5veSEqehzAyMH1Q9F+d3CP0+e0PP5IspapjQ4RoVCbRhROMaA2n1yRPRlQMJ0FTt9iHyOJq
 RdntfO5wKoPISVmEBDpHhSlDy9visVRX537K+d5e8XZO+2qGOhveoM/ARPPrH2ovu5/I/kfF+hN
 YziG/3qMYWpuV97Czi1T6liKFH4qKLLP0jt/9rq9UtTwn7rhBA45UeYw/1qi61I4Xk9PSnVmtgJ
 IzSCu6oq+/Md/2pL+NZTI4fkJe7MVJPdUFGbDGG8CCY8swN5wvaQKwB8etp2j5ktOCWW1ld3cSo
 0UNmxnp7GQgYNQmVW7LJfkWgBBJGtP6b4J0cIUaXdxGxlXHh3nScZJ6lK5tbArkkLlXOZSy9I0t
 wTEpsbkW99aOs+8wTVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113534-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 50A6B698696


On 6/17/2026 5:30 PM, Konrad Dybcio wrote:
> On 6/17/26 4:31 AM, Fenglin Wu wrote:
>>>> +        ret = ptn_bulk_write(h, HAP_PTN_FIFO_DIN_0_REG, &data[i], 4);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    for (; i < len; i++) {
>>>> +        ret = ptn_write(h, HAP_PTN_FIFO_DIN_1B_REG, (u8)data[i]);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    }
>>> So if i'm reading this right, the first loop will always write
>>> 4*(len//4) bytes and the second one will be entered at most once,
>>> to write len rem 4 bytes.. should this be an if instead?
>> I should put a comment for clarification. Here’s some background: FIFO data writing supports both 4-byte bulk writes using registers [HAP_PTN_FIFO_DIN_0_REG ... HAP_PTN_FIFO_DIN_3_REG], and 1-byte writes using the HAP_PTN_FIFO_DIN_1B_REG register. The 4-byte bulk write is more efficient, especially for waveform which has several Kb data, and it helps to reduce software latency when loading effects and reduce the delay in triggering vibration. It also helps prevent the FIFO from running dry during data refill in FIFO-empty interrupts. Typically, we use 4-byte writes for the initial 4-byte aligned data, and 1-byte writes for any trailing remainder.
>>
>> So it still needs a 'for' loop here since the remainder could be more than 1 byte.
> Right, I mentioned len rem 4 but failed to notice it's a
> single-byte write.. anyway, a comment here would be good
>
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Configure the hardware FIFO memory boundary.
>>>> + * FIFO occupies addresses [0, fifo_len).
>>>> + */
>>>> +static int haptics_configure_fifo_mmap(struct qcom_haptics *h)
>>>> +{
>>>> +    u32 fifo_len, fifo_units;
>>>> +
>>>> +    /* Config all memory space for FIFO usage for now */
>>> What's the not-"for now" endgame for this?
>> The hardware supports more modes than the two currently supported in the driver. One of these, called 'PAT_MEM' mode, also shares memory space with FIFO mode. However, 'PAT_MEM' requires memory to be pre-reserved and waveform data to be pre-loaded. The entire 8K bytes of memory can be divided into partitions, and it is configurable, with FIFO mode always using the first partition [0, fifo_len], where 'fifo_len' is set via the 'MMAP_FIFO_REG' register. 'PAT_MEM' mode plays waveform using data preloaded in a memory bank defined by the registers 'PATX_MEM_START_ADDR_REG' and 'PATTERN_SPMI_PATX_LEN_REG' (they are not defined in the driver). Since PAT_MEM is mainly intended for hardware-triggered vibrations, such as a signal from a dedicated GPIO triggering a short vibration with a preloaded waveform, and although it also supports software triggers, I haven't found a suitable way to support it well into the driver under input FF framework yet. So, I am currently allocating the
>> entire 8K FIFO memory for FIFO mode only. We can adjust this later if we find a better way to incorporate 'PAT_MEM' mode into the driver.
> Sounds like a plan.
>
> For the other mode, would that GPIO trigger need any OS intervention?
> Could you speak a bit more about how that works?
>
> Konrad

I'll try to clarify the 'PAT_MEM' mode further. 'PAT_MEM' is useful for 
latency-sensitive vibrations because it preloads the waveform into a 
fixed memory bank, then it doesn't need to load the data of the effect 
in the HW before triggering the play. When playback is triggered, it 
plays the waveform from the specified memory address and length. This 
memory should be preserved, and the data is preloaded during boot. 
Unlike FIFO mode, it doesn't allow data refilling. The trigger can come 
from hardware via dedicated GPIOs—currently, three are supported, each 
mapping to a memory bank set through specific registers. Software 
configuration can be done in the bootloader or in the driver probe, but 
the 'fifo_len' should be adjusted accordingly. After setup, software 
doesn't need to manage it further, relying on the GPIO signal to 
activate the playback (for example, a pressure sensor triggering 
vibration to simulate a physical key press). The trigger can also come 
from software using SPMI commands by setting the play mode, start 
address, and data length. I previously tried using the 'FF_HAPTIC' 
effect by mapping 'hid_usage' to a predefined effect in the devicetree, 
but later I found it unsuitable since 'FF_HAPTIC' is mainly for USB HID 
touch devices and not general vibration usage. If you have any 
suggestions for supporting 'PAT_MEM' mode through the input FF 
framework, please let me know.



