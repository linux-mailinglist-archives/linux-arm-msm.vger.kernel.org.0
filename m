Return-Path: <linux-arm-msm+bounces-113078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ELlKLxuPL2oOCgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:35:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3474D683813
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:35:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="im+Ci/qH";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xnfjhqd2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113078-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113078-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32AFE300CFF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5763A9D8A;
	Mon, 15 Jun 2026 05:35:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05E4393DCD
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:35:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501708; cv=none; b=oSjA4NPxxVjLGR7lN8MJkFt7GNS+R9pNv7mWE67WxZEF8n5gRvpv2KhzwN3eJ4WusVsz7b5QltwwfuYf9+ULl81Tkx92TyIQ/1zmg8CxEtd7Bcp21kXcHvmdB7j+7sMP/MQ/2fm6NUQYqSue8jOLZuIi3fkiXvTFP3mJP7TYR7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501708; c=relaxed/simple;
	bh=xAVH9CLbHxCJVbEkFG+t/rqI6FJKD21DENEMJdE0V14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BN3Hm7x2PO6dMmIwwPCgbkk1BQNEoWB/It+YV/GJ+TQqvi9r6STZCRw8wgAfCGthpfOI29jBynYb5ObkxdCW0+ZG1bvFtYgCQSefjAv3fmn5mjTeLHBWOqosMotkHW2LDTjrrPzpJrJnv68AjisGg1PqEb5UfNdlar0QRF71+ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=im+Ci/qH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xnfjhqd2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kxEG3108872
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LU+hghORQXDVk0u4Z9joMyesALG5eF+oWNtk79xIUXo=; b=im+Ci/qHDG1GNJ6J
	kwnjPeIp+16ST/V0lX8/8g87hVOKRdXvdfk2NoAWA6xFyYfg1HLYn4jzW4PH9dZY
	SO9qjtCe1Ie2d/9MVAh7aqJ1sEPVi7A6mBhAwXDIwWJ/k2lWU5002X563Weohr1V
	A8fLg0AO0+YqtLzubPZ7t2x9LqT4XOlsMI7z4rpB8OFOZglJENu9B2wJR7CINp/i
	UXuECgssRzSBUfRJX2m+NQ6i6osprZz2AJ56VQ1lqd6jjfS/aqLixNeG3sH3VUeQ
	/ZE4XxfqnnhP9mZLoa4vtRtBd8x/UchzIFP1sL+R5n9ZG7iiuDe4QYzD1D0JhZoT
	F/dr5w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery955n5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:35:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97415004so5624027a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 22:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501703; x=1782106503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LU+hghORQXDVk0u4Z9joMyesALG5eF+oWNtk79xIUXo=;
        b=Xnfjhqd2MItOXeNZd1blUi2Io5rRDEc0RNAwTwT0cDn3CgkiRRPI12jXXKKwPwKQ9f
         h+7UG9QvZZ9pJB1212mL9hnU/gDKfdQre0G87yhdy+USMMMFOhhreNf6M28BRi2nqWBP
         ERvzHH8t8/dVKdISs+uczcPjGiuuKO0lwd984SEJLwgUROTLqJBO/OQqpstr8adJS1Lp
         SNkm2EP/E4cwDH4W4Xh+kaMxBhQrOafDIJyZiMd1xjtIviZ+u48SCPe+MJPFuHbxGvBQ
         wszh7dZzqFZcbAs/5IuLhrnV3qlz6k9XVnj3auCLK328AwPZ+sSpoIUGLMNeBK6kuJ4q
         t7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501703; x=1782106503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LU+hghORQXDVk0u4Z9joMyesALG5eF+oWNtk79xIUXo=;
        b=jthpPJTqpij1/8eQainwW2lj9Am5WLmcxi4kGdKkPXVEWfihU7FbsGcATdcS8N7bj6
         YVJDrIXLFoFaVBdBy6L6muYS3bDEhvlgiLq+UdSKaYjIXC7rRBZkc9FMoiddm8D/S1vA
         QZTnfRF28IeSVObagQ21FmXhfpkwUz/zO1PE58Ooy8VRVWsYIv9ZdAPN/j22WH7oogDx
         QEruwfyFPB11IJYkdRAuWicHoYmH622uNJ4Cis8wj698ozTwng/ZxC3H8BaQffQHXOB0
         EYHt85C7f82oe/F8tfopODVS7tFNhqfC4jDDbn4Q7qKID2SsDuvYaodncHBzCkHJMgM3
         iU2w==
X-Gm-Message-State: AOJu0YzVQrHsZz0E+w3DbxjSPhFnxjYKuG/rTkmP30zJxpnBk/MmdDEk
	z19XUG82bwXpw0A9nPn3tcm7+9SFVVdesU6RogHvlx9U7/hGoC/FMqeOUIfs/rCKHS/czVgLaFN
	HMoyMKIi0WcbPLg6gIPmA5sMVvvbJP1rPHTFUS0lKk0+Dv2Xj7KHnFQBeTt8W0/59fVUH
X-Gm-Gg: Acq92OFpUeqjOpveDNZ/cp393S7GyLpTJlLnS86whJMO+pXjeHGaVRmB3zRAs8xrV2k
	ozf8mohTBQn713VrBhWHhl6VepH4YLyd47LFKiQOMV9us2qlQHgT+BVoOsvgPyD300Z2UYiULqa
	ARjLs4zQuxHtAbMuZPH3HwLjD4h1BS4IecJsV055Pm+uvf++nGHuaU8LEeuDMjxVtngo1w23JsE
	JVcRWer9efUxMRZ5xJhA8cBwvf1BdcYgnIWnlI0cHQL22HHEiZHHtECwphOicS2EqgYIELO4FTe
	hKYKMhv+pCnS8tkdXDY/FnYFaOr32FHEbtxMI+0d8H9ArzN9GnL617LPp3IUq3IoMQkcLeuFt2w
	RYVbt7fI/T93ExwOfuRw0cPE8F7bMzgvwmhpSnS62fOENZ8M5GZ8=
X-Received: by 2002:a17:90a:d40b:b0:36d:6315:1de4 with SMTP id 98e67ed59e1d1-37a036ea1b9mr13512475a91.17.1781501703251;
        Sun, 14 Jun 2026 22:35:03 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:36d:6315:1de4 with SMTP id 98e67ed59e1d1-37a036ea1b9mr13512426a91.17.1781501702806;
        Sun, 14 Jun 2026 22:35:02 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a233f58ccsm9379806a91.3.2026.06.14.22.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:35:02 -0700 (PDT)
Message-ID: <454dbbcd-b0a0-483d-a21f-df6a33722a5d@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:04:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
 <73f700f2-7cba-4832-bd06-e82a7fd51a7a@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <73f700f2-7cba-4832-bd06-e82a7fd51a7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -XwGVTP2_Dk09dORtTnOl6vcDZR1gT7S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfXzLoWpLVdS16q
 d2nQsHT0sv8qiNBFPDpPJQHSscdJM29JnnDsCQia6pEIol+BueUxHb+q9Cy5AuTYA5CLO0k6dXc
 Urq0JEK1Ghy2TklaoJfDYaAuJc29Q74=
X-Proofpoint-GUID: -XwGVTP2_Dk09dORtTnOl6vcDZR1gT7S
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2f8f08 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oNLwIrGxYuMEB2b_hKsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX+3G9Ze+EE84k
 98VEIrhVpv42Gc7him2o7cNrHqHBeUOelNU0TWG5orpj0+eo60QmZjMo5x/47evO/rrXeewzEJ6
 +b73d63jX//8zI7xQgqtbEeXUmWJjBhBmC4I/rku2JHFKlcun2rv+asL2HRwlwHhEi0o24/3TNx
 JuaYtHqzejj7drp7Nd0gF9NERI5nyx6zCNCjR0cLjPi7eDhbKa1Vv2DcSImofnUqIkagqetcezf
 /BDWQazBzmDcDquFsSqPP13HURaliCqGiUSuH6KBAvnIDpdfj52fZSjalv+dk7/yD4I/CxhXNaZ
 apxA8Zoc0C6n3OIJT7JqAnfVcTxqb7MPGGtc36cbs7qtkP5UPdpzTxxs3u2YfHiT6twESbt3KGS
 r+luzwaIg7LYQAdjwPA7cmX8lzQuhUZYdxA57eQTThwzNmaoPzk3dMK3GsZOVqzdkrr/1VChe+h
 pID0XzQ4LfFnqOz0vDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113078-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3474D683813



On 6/11/2026 4:35 PM, Konrad Dybcio wrote:
> On 5/26/26 12:54 PM, Maulik Shah wrote:
>> All PDC irqchip supports pass through mode in which both Direct SPIs and
>> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
>>
>> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
>> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
>> still works same as pass through mode without latching at PDC even in
>> secondary controller mode.
>>
>> All the SoCs so far default uses pass through mode with the exception of
>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
>> boards whereas it may be set to pass through mode for IoT-EVK boards.
>> The mode configuration is done in firmware and initially shipped windows
>> firmware did not have SCM interface to read or modify the PDC mode.
>> Later only write access is opened up for non secure world.
>>
>> Using the write access available add changes to modify the PDC mode to
>> pass through mode via SCM write. When the write fails (on older firmware)
>> assume to work in secondary mode.
>>
>> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static inline bool pdc_pin_uses_seconary_mode(int pin_out)
> 
> Please add a comment somewhere near here, repeating what you said in
> the previous commit message (about the SPIs being mapped first, followed
> by GPIO-as-SPIs)

Sure. Will add comment in v3.

Thanks,
Maulik

