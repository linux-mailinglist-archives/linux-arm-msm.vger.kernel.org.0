Return-Path: <linux-arm-msm+bounces-92662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB2BJ6WmjWkK5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:08:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9FF12C447
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6EB13041D6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A75C3D3B3;
	Thu, 12 Feb 2026 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/AisU6J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hsFL4EOp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2F2246BA7
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890805; cv=none; b=MfWwWygxKvogYejQvy+4Lzhzxn62ytOIkwm/oQKydc0pX9cC8WYUwkLFRcJxN0JO10Oi73C/ACcRFN0QjWOK2H2jlP05tRlKcYUUyXb/S/9RykZ3rk8Cz8mq60XjYofiBZ3bqbseU1orbCm6dY2zmoCqBGfKxW3zZmf2g3vISlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890805; c=relaxed/simple;
	bh=MT5ewu4Y8Nd2iAYGw998TRBGvAJsnJg27lZgGhgThIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AlOvZj30F6VPFWVoFHd2OdBoouqz7QTGjXM5n8WHruHXhMHs6C8vQEh+PTT7GMvnq32yuQA9ZHLKed3sfrWX3II1LSMKQn0JLxhMTu8zUv6uYi5zNv28puWgBGTaOvuKh32vviWFNbB3epy8ZRKXdH8Y9ZSC4Wspf+s5tOx45Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/AisU6J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hsFL4EOp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3RkE53887952
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvaMiTXDNTVI7DyygwgGvhOjirrI3AtU5VM1DqBLk6A=; b=G/AisU6J20k26CQz
	hsMRYYiRKWvqOVzANJVLvMMUsp2h5ty6jB9SvSz422cZjU+IaQte2CBcCD6X6roq
	43mgD3JdsHJBKiuDvYs51RrSI3K20Bs4hQLpv4J9llKuYxNTgkIQcQwOyy/kimFP
	xwCBJUrVbioHpx4OvxeNwSyftaNW/kQndEgxyep8vRRGZHTXTLwGns25doMBzYtC
	exSr3hEM/kw8hdJzd5LgnXsurIwiQVR2lY8t0FBKCtvm/vJv6gUdzkvGLxQ7IzkG
	gjB863g4JY0Dz2FyXsZpJ0lhqceKOFaMmZpZcmbTmFJBi7Eb+GOcGdPNq8/Ll+Wm
	DROYUA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c90wja4y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:06:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c709a3a56dso397836085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 02:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770890802; x=1771495602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LvaMiTXDNTVI7DyygwgGvhOjirrI3AtU5VM1DqBLk6A=;
        b=hsFL4EOpxqGNJWv4FzgeiLfoWEjmigR3YWrkhmeV0mV1pUKwSBYb8vem6YHTGFjdnd
         BL0cz6OqL1Kkpr2mIiowS773np9WlKkI2i+LjTaPOiU6+B78VFAnjIiSvi92jR/Sz2Uw
         2IPjrTL/JFzewU9Hv9AibJL4SDrNGNFdz0bol1/Pz/dA9WhOyEV6Ei2IOs5Ws0UlPUF8
         kXiwCfN+gyQZC3E/Ywz6oTC2EIV2tsgQnmNqHawKypIOiOfFQx3XEBhdqvgapyV463Rt
         KUoORnYnUbHxhaCKnVmaqgCKDaLvtssAyGhxYimUZwclJMBvFpL6SqAGO013xJh9+2v/
         +dkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770890802; x=1771495602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvaMiTXDNTVI7DyygwgGvhOjirrI3AtU5VM1DqBLk6A=;
        b=g0YTqR9hgDWN5ILOFBJ9duYlsJRyzeGC+7qVmVCWtzeHgKCzpX2pXtgCOi7uR/E0Mf
         wmMX1Yi68bUE02cULrLnY8kcffXjizolmvGE2X6kXoyIZftU0NkgnRnMbKVou5ccQY/s
         PcT8cY5+sTJHadoEH3Eu3fZcCpqlwauHxtoVH3TT7sskfXv/O6tiXszxT/y83yh6DOa9
         nyIKs1cjwg2YgbBBTR6sl+L4OLDrn+wuVz5KydVEqfRxHT6giXsvHJITw8BIoSSwbckE
         tGdxrIXa/fphpfapxWnr/+bKvluB6lQEpbvuEPCQUbK85MO7+oNrNJEr8fVGxSzYSoCS
         InOg==
X-Forwarded-Encrypted: i=1; AJvYcCXxBw8Ge+sYBssHl4LIHqKRQgPku6uESsr9NbLm1DttKtiWadojG7/tSeFOnxgaXJlWSTGciGE0hC78xFoI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt8c/U9DGOMqi2fgbu+Y5AIcYlt8NpZvRAK2bVzX8zR84YsaT7
	T8YIiw5ggiywSqh8BVW0H84rkEt3wOiaSu0I5ZZJcRXbiN00fnv52b4chGfmOxZJ7coTHeOZZ0Y
	s+t2Q21QtFEvPJ+XhFVaM4yAucPOaEwzek1N/Ls7z8g8Sk8czeOXmgiiV4fT75hQa7hOH
X-Gm-Gg: AZuq6aLA/nwrMgTEmcgGkIVu6XOxQHYM+q2uKKjV7IM6CZMl8VY8ywzYxwwlXoY+ESo
	CQvS5S1vTi75oorWBxRGNkBVJ1imh9R4LBlzRAoqEW/DSRovx/2G4lqGWwPHnF66ZaiayrkeaOr
	nqVFbd912Q/QIFdHdVhYCSEYRJQjyUmWezYFHZKe1Niuyv8qZ8Ydx5WYLIjevL+5T8ii6/Kl0DG
	FGcaaU8JpCKa3P89Rb8uZUSO2rXDAx1Jp800bV9iNTx3eK1c6RXIFPmH0dYpuRNCQ+jI+UoyFXi
	KxkSfxQGLoqYSMb4CUv4djZE3F1hnPfrvpKLl7JkTSMM84XsXx8rBe0FkGhKmqdgF61V3c87nrG
	xAGy1bgEd4zbrgj2IX6CtBtaw0KuE732vTtdc+JWU7WLA/GNdFQnGrmOsBOUmEagWFp8VX/S5o0
	G+4nc=
X-Received: by 2002:a05:620a:2844:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb330a4d86mr214245285a.4.1770890802594;
        Thu, 12 Feb 2026 02:06:42 -0800 (PST)
X-Received: by 2002:a05:620a:2844:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb330a4d86mr214243585a.4.1770890802100;
        Thu, 12 Feb 2026 02:06:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f82e70799sm104138166b.8.2026.02.12.02.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 02:06:41 -0800 (PST)
Message-ID: <06604c62-73c4-4ca6-a18c-822475a575fe@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:06:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: llcc: Add configuration data for SDM670
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260210021957.13357-1-mailingradian@gmail.com>
 <20260210021957.13357-3-mailingradian@gmail.com>
 <026ce34c-c880-4832-a791-656fb245a495@oss.qualcomm.com>
 <aYzWqFybymwd17Dx@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aYzWqFybymwd17Dx@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtlbOW/+ c=1 sm=1 tr=0 ts=698da633 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=j6Lraizvz5iSBWF5Nz0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3NSBTYWx0ZWRfX1F6oQ2IIyNOw
 lMWHTi0fACqA6kksr3hpSFqYmpICNv6qUJ7oEoczQBys5QlWhuzyk3GBVjsb1wvb8q8/lodZDQG
 t75Q6BQeehA1gbNuaSlPZELYQkx2WjKaKnjEKRx53LQ7iyKa2fq7+uHkQChRKDKJFAcLWKnkAqW
 JgnIFaPE6yCgoPtvunjrMBPHPr7uQh5TKvnGXwb2h60wsf+KlyDNJ5wQ+HIMSVI+WxRRs9/P9R7
 StnRKy7H+xgmTWfjcHgCcmOE5ylZH4TpOplwxpa+/fZ979KE1kgLoY5unWo16qibMbdVcrikyA5
 hj7/+QoBlut+W2eQXisV2w8QKbvTe+wtlBE0RzOeEvDYVMSL1EtYAB+c+k3pKmFdGUkORlQBsGf
 wk/9FGUE8cj6QuLcHmBCCrEHHwdmuAnGgvsI2iCZWq6VYtMYBv2oh8Nn4iAom5UbwQR5dZUglVk
 joObqEGrcyuncZNcAgw==
X-Proofpoint-ORIG-GUID: om8AYShXPSAimKZX2fV9MKnwo98y2lJc
X-Proofpoint-GUID: om8AYShXPSAimKZX2fV9MKnwo98y2lJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-92662-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A9FF12C447
X-Rspamd-Action: no action

On 2/11/26 8:21 PM, Richard Acayan wrote:
> On Tue, Feb 10, 2026 at 10:27:40AM +0100, Konrad Dybcio wrote:
>> On 2/10/26 3:19 AM, Richard Acayan wrote:
>>> Add system cache table and configs for the SDM670 SoC.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>
>> I have a clone of some msm-4.9 on my ssd and it roughly matches this
>> patch
>>
>> However
>>
>> In docs, I see a version with only CPU_SS, MODEM and MMUHWT left
>> (your settings here seem to match), dated later than the last commit
>> to llcc-sdm670.c in that downstream kernel clone..
>>
>> Because this SoC seems to only have 512KiB of LLC in total, it may
>> be that it was found in testing for that configuration to have a
>> better perf profile
>>
>> Could you please give it a shot and check if you see any immediate
>> gains/losses?
> 
> I don't notice a difference outside the margin of error. The Unixbench
> workload reported 4550.4 with all configs, and 4550.9 with only
> LLCC_CPUSS, LLCC_MDM, and LLCC_MMUHWT. My 15-second workload on
> Hexagon/CDSP was half a second faster when commenting out the cache use
> cases.
> 
> I don't see better startup times either.

Okay, let's stick with the one you posted then. I (briefly) skimmed
through it and seems to be in line with that aforementioned downstream
tree

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

