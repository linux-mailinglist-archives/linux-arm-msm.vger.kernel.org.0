Return-Path: <linux-arm-msm+bounces-113080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XZjCCV+PL2ogCgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:36:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C640683849
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:36:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HZqeA4vE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ktLFP8h8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113080-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113080-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E46473009B22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0821B3AA9F3;
	Mon, 15 Jun 2026 05:36:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED13A9639
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:36:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501765; cv=none; b=sRCgwioAfE9lxUa5X8BcsvCR8E3Ac6btCyU9HH0025lNYYG+e1WPGiRJZ7+EBXkSfU9kn+ikeKr9N6OdXNWr733eIHJTHYgjAzQZnXb+G+ODsnkJRk8B1RBDkHy+oB4NouRZobybzKF8jYZOVYCdfI3SVw+kXFGZSlhkYei2VLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501765; c=relaxed/simple;
	bh=7ejzRRhHDCje1fWIH3my2ejpZu+LlmMXR7YrGYw6d+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8Mn6GatKTNPAB7gvoIfLMn60akgLvwBrl1lZLthlYpmBfu0/lRJnepGdReU0Ba7SuQJfyofXNy0sxs2EgHEcIhim5Lm50L2gd1VwP/ghFUT2GEYQVWQ32pzC0uWBEwlBXb68hZHfb6y9t+5HQgQCimPnpVladO6HzSBQUWcx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZqeA4vE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktLFP8h8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kcm63108347
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGetSEqda/e2ie1FOipAsTCcvEQLf9TTw83Etm/9Fno=; b=HZqeA4vE+EItQks8
	VkD/qc1JtdyMKmltIZIfXuQwB0n9+VuaGRLFwvU3queV74k9lb410RG+UM2Ftlg9
	bYaeZxI4Gys4kSIOqHbcWzP+1gjBSvVVcuzkDQhy7wgx+tYp4zmd0DZzqiBofmQR
	BNVnteaPhow93/k43Pc60bylPeYafh2Fgt4SV6d4y8RmHh1SeWSZB8VhxQfTgqBp
	EGzOgXnATIvCG9M1yhLsMexCsH5i0X0CWpNv9QFo1jB3g/b0dtbavb4q1PiQ7rx8
	exuGrddhEai2jrex2ejOK7Dr78Ch8omhdlQPM6ik9YwwO95eqsyuCKVEa/SbOWK7
	iBsNAA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery955n8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:35:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso3409595a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 22:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501759; x=1782106559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGetSEqda/e2ie1FOipAsTCcvEQLf9TTw83Etm/9Fno=;
        b=ktLFP8h8TLwOYiC0dvOzrkLshN2OZXK3HwPpU/o6+34HQRRhB98ITMuZjYL3juSdDn
         WfEmDiT6PXH2wlOMNdaR/3x9m0+aOj8lM1XvDeR86rMQx1SIroi9Tz6u4HBPM0k3klzZ
         4P5wh943K0k0cXaj9L5E1CdZcZ3xK7n8zsTu9WNBuwQVVKBlrxzN93x/8mcLBjgqkNGY
         Co+3aePZy/2yTBze6D/wvHxg8nv9QbSkSKfYPfP4wDnFE1Vm1+0Kz1xiHiTP5RneDlAu
         gERkuJezRY7KXZA15IndbwVwsE9M2h1ho12d0uJL9Ganxb8oO7ES1l/5w7xnBRoGuPoa
         U9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501759; x=1782106559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGetSEqda/e2ie1FOipAsTCcvEQLf9TTw83Etm/9Fno=;
        b=jbcpW6X2x8PWRSDK8KfS+eMnLi2vmunUabTLM9ojlX7S4VdUa7/9GYCX4Z8yy/GxTt
         fMS+dxVTa+KldL5dquWKm4z7JPTlUFm+DhN9syvtJpu3B176q2DQxWEtQlWHloAk7VSg
         poVnQEWYrDstCfGU3/isA5xtzJLOotA3PQRg2obbORs5Fyb8SbSITF2kXJwlNDuUXDBE
         qjayqG2rIkJVo2OnCiTzp06yk64OoEbHcSP1s8ioivZobJLDkQpBs1gtclZlXfMbunLr
         6JWJj/yp35cN3XgG2wRlDwGm1JUsBpcTpkryHfYlpcV1ljiasTRBz7huP0uiO6KE2lta
         4JcQ==
X-Gm-Message-State: AOJu0YwFCwQOE0pJkLj0Bwn2S1Tqc74HYN15Bg5V0gFT4PXChEe7EYGK
	SmGvOSSI9VEdCXKwfkRbcmiUuw0AzssDnKzK6JxXQYL1S0Q5fc5dWomzPcTTgtgUZmEb59K/77k
	jaTS0hnVLtygUxEpkeVsjFYb9Ji3b65dVtbygjs0ekM1ikK2GvzuUYKH/pi9ZyhveyT7Y
X-Gm-Gg: Acq92OGgf4xa4BcVolhNUVTzMDvBMwVxJPpRu/pdoFa3HeGjtliPT4sZxN7PMHMSBIt
	mTI3ojN0xXqKwtj/vwUUiGwHd+MnJV05OqqsPvM4GNuKQr3iZEO+QsX8daCfK7Dam199itp2l8x
	yWmBR9XD9j24Apw4Gk0F1v0kjUgjBoXvZccW5mt4JQ39TSWkbT01caCQOVhTLaY+jfCWizhkfdn
	fm26TvSyVVaGsnPxJUJYHo1yxvGQhYYhTZQzynp8IgqZwnfXNsjZhMnFgU1Nv4SdcPdEZpd984R
	zvHEmPbSVp5HYBUKTdL3bkQcmQh9PytUJOzsvge5Yy+q2DymO9d4+gB7aVXG/Y9thU4lt8aZ1rW
	/qZZaUTy9XOaD+OHB+t0ljhHeWYyKW0NnAkPGGt4rCskRhOPs7Os=
X-Received: by 2002:a17:90b:2541:b0:36b:b4a1:2939 with SMTP id 98e67ed59e1d1-37a034f72efmr12639708a91.15.1781501758832;
        Sun, 14 Jun 2026 22:35:58 -0700 (PDT)
X-Received: by 2002:a17:90b:2541:b0:36b:b4a1:2939 with SMTP id 98e67ed59e1d1-37a034f72efmr12639683a91.15.1781501758394;
        Sun, 14 Jun 2026 22:35:58 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1f07bbfdsm11133492a91.5.2026.06.14.22.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:35:58 -0700 (PDT)
Message-ID: <d5b81cfc-bfcc-4c44-a67f-8147c255c890@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:05:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-3-f6857af1ce91@oss.qualcomm.com> <878q8v7ij8.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <878q8v7ij8.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I_whUF_7fxpnme9mags_J8RBe2h1rsWL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX0y+feRf69yBO
 KHVQek6/BsHSjqdS1rY+NMNJ38mtJAKXcnWFIBBvFt8jgpIPPDc/7ae8nkAEw2VuS7mi4+GVv53
 6dcEdYBYGl62XI3nF7vfHdX/V6OTD4I=
X-Proofpoint-GUID: I_whUF_7fxpnme9mags_J8RBe2h1rsWL
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2f8f3f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=LOz6dEoz8Lk_-hOeqa8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfXwIGY42f9nIuP
 KTfZQrasINu3OKXYD4+GbQSUvWKO1kFwNPDYBoEDUdyvbnS5Wshfo6XYXZGyvlTZKOQ80s0HnLG
 /abrcgugMLw4ZzA6Q0J0xnAyauhNMmT8NXNhTsyQUo8jd4il2gi5/U3ZOfkuUkqAfE3oGuPSW57
 vqeJV5y9+U5nASDoPX0y3L5ujeKnVqmPKTv1V/uH3y3+1cfcInnneaWvY/0c0UvsXY2P2K9RoPP
 RZrn3a95663UIq3+jNrw6RtEaNglSw7I39ZYvt321T3SrXlDlh6pPnQovUmPGGajNRY1xPfQrkL
 VWqrK3VLWYODy+TU4Yz3Py56vqgwUI/0sf8raIbGQL0sHfKhcnpwNhf2ssuKc63iTPAmrO1qCJE
 l0bv/fY5W5zHX4mTSVqIZtnqDcO/IWXFti3I9uMzTC5EKMkn5lURlF3NJYX2UzXxV7kwMZ8A7SP
 q/jYQDcONdHGES9qkEQ==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113080-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C640683849



On 6/3/2026 8:55 PM, Thomas Gleixner wrote:
> On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
> 

[...]

>>  
>>  	index = FIELD_GET(GENMASK(31, 5), pin_out);
>>  	mask = FIELD_GET(GENMASK(4, 0), pin_out);
>>  
>> +	raw_spin_lock_irqsave(&pdc->lock, flags);
> 
> guard()

Ack. Will update in v3.

Thanks,
Maulik

