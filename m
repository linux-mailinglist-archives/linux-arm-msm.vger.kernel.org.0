Return-Path: <linux-arm-msm+bounces-111137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wbtPHbAdIWoO/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:39:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F04463D468
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:39:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NdVTgoO2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GEuNBgVt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111137-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111137-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C059E305B616
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2953D9DBA;
	Thu,  4 Jun 2026 06:39:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8043D891A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 06:39:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555150; cv=none; b=jTK2umy7eedEobyS/sclUfxVKPaGju5ASGwg26pTzo5ac0ypvpaxUntpDn33611zgPsjBC2Hkl6tl24wjMG9GSkvvNdh85lg/391hEgF56OHroyZ5RHB9Pho6fVTylETgw9wkkPhuq4c/DyykNKh+tullpAhCaRaa6C8bKgfr08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555150; c=relaxed/simple;
	bh=RaeoiWH7Uun9nxt2b6Nvp78PFkfwJ25ykblxc3Xp0J4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRrsGDWCgoB1dMGOSZoyvBtIzfxavfQhFu1J4Xb1f3y+IffUiYMCQ+0sG5FQ3t1mszgiYcuy1GBTiS/WsEHHSqQ5zGf6JHp2IwvC0wFYxeQlyFuxjzOya9qP0kr3evbXiUzw5v1WziQ4BbFm10tj+cVXdVpPqRmBNIXKZ909W7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdVTgoO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEuNBgVt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6541cMnd2260648
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 06:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vjgpy0mZThcuqyr29c0w8qcQHkkM1zFN58HHnPnYdxc=; b=NdVTgoO2lQY9HAMW
	bceRRxyiVHKXuuIpdj+fyBb/fnbGH7EvL5p+tnTo4lQHcZlTS54Ihr8vAUQ1+uRf
	8gadpLf/GyGxNspTt8KzGglUCBBigBC7go+asz3V1L6n/dP3WjDkqvvRBASbaCmr
	nHO2ycIC00kzwQiTz1BRxsi83g9hfOJxm4F9MjWXgRgXjnQ4S67Cj+LImSj6O0Pp
	Xf0Fcdf8DXS/+CAoVkp0L7abxxxX6/BQc4fE5maquWwqQwkdEWslKutDWsM3a95w
	WyCNiMd0i2jCInd4NdBex/55UpoIhBoIefAvtyREsNSjMauUpBvwi9PyYGE3ATMl
	Z5/mrw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejr2mjqcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:39:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177b8def69so7903051cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555147; x=1781159947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vjgpy0mZThcuqyr29c0w8qcQHkkM1zFN58HHnPnYdxc=;
        b=GEuNBgVtA7wyV7QbfGBAWNjW/WLHcsp2GYgkIaXqokz3MNRGbsUpI+Gg1ZGhvvzmnU
         LwRlrL32nsdcybd8PNOHwUWWiP6IIrfUN9SMYZf7wfjPU/vVU1RDBq5lEcwYUmsrOIG9
         79LY+4PtM06Jh2Z2SBX/UStDSL8QGhWQwVfbeA7YNoZiVcJQ4ERp2DqGpmfB44MFWmA3
         17a95IqBtV8yHfz7mAzJm7QDNL/CaGpYdfaQgj+HYZkegySKkKrvOm0DGv5m2Or4NrgX
         Cxxd+LCdpjeis3mQjT5Esjl+drMu5x2eJsVFN+KzIjcW3iH1LhIhfbfgugXwo1NK+zbC
         wPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555147; x=1781159947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vjgpy0mZThcuqyr29c0w8qcQHkkM1zFN58HHnPnYdxc=;
        b=HGv3D6ZeF8OgdlgPFRo8JulNYWUp4/2xxz0W9YSzupSZfWuWGyD1zWDD9T3UPeLx76
         ECh4M885LVU2oG1QgGL1GR5L4/iOX22lCym3N9VygTlRZ/R4w1e7/FF28u2d6AiFAnsK
         lZcUodusj48LoHKKC9gTnULvs+BLNjjUl1FpEkufbBsVBmp4o7YaQuhx/l8q99GeGaqs
         EJ+fTX52tyrXl8YGpm5n54QiMeNQFNWOwBGguf5LeytP76QVL7IZLdyJECmaWAob1sZS
         wHzMU6qBpys+2v6GxTHm1A1hiurA2fC8juC066huSfyepK6V/ndK+Z2lSeslktZWe7mv
         70lQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Xny+w8wDf5MkhV9xtNBnImk07tmtgxzoauAaaxxVCDXpnCXCYz9+EnNcowFFf9sIX6SS4BQ2tzLN0FyBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxWQGTwq7cKE0b6kXeNnqhJguqEPm7zl4MWBXzbUlK41B4KD0xM
	5uLC2b1Z3pFyo2kBvtCMPmBjVDyrnB+Q1BrYmbzDvNdMAbGcu43lgIqiccoasVSt4+iEYNmZ5Zb
	Yc1Yl+gPsYz7r/+nArv31YpHAuFyC8poFHeKlvnA9//yYvTzR1iF9OYAKYyN8NceKh6r0
X-Gm-Gg: Acq92OFNI/OnIKylHxoh7+vMEZHc+L1CNIOxbgmR1a5SQPslWkYO641X9MX4BouPJSX
	EX2hPcXl7ydzC2UfwYPQJx+NCAt6Nr8quvyhP1IYXi1tqGL5E3jRzk4dmGc2U8Bk/iZqp7hClxH
	M+t4yyaraFlHXVTdgn8WH7+gtTerGz3+cVNUOEvwtuP2/DDd3AS60nRfsfx91nZxDeB8iJvfWJl
	cdjsSyYWM6DwzMaw6bxXMQ2+Dxb7mpHsVz9b/EsoWjJ3a1EV8pp/EQS4ML8a2jA31P/xr2dmczv
	heqkFHC94yLA0ena8rgJ339MWBwPSlX0uaj1tcz/04uWIefNTyR+K/d9rYpUaKuwo68EjeO/3Z+
	gflgLXweJBb/vQh06wzKq/YYdrqipojugZQ6zRG0KpJnjncZ2/6+GJGXxAyiRJfBJja0=
X-Received: by 2002:ac8:588a:0:b0:517:5afc:ff92 with SMTP id d75a77b69052e-51778748c75mr95741621cf.58.1780555147035;
        Wed, 03 Jun 2026 23:39:07 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:517:5afc:ff92 with SMTP id d75a77b69052e-51778748c75mr95741251cf.58.1780555146520;
        Wed, 03 Jun 2026 23:39:06 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1f97sm273228266b.60.2026.06.03.23.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:39:05 -0700 (PDT)
Message-ID: <cb37e7cc-4fb0-4c24-8f89-f6f9eb08a107@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 12:08:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
To: Daniel J Blueman <daniel@quora.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bryan O'Donoghue <bod@kernel.org>
References: <20260601041336.9497-1-daniel@quora.org>
 <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org>
 <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
 <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8HU4rT0E1Ldi_pwW-H8gBOLOUFD9a62M
X-Proofpoint-ORIG-GUID: 8HU4rT0E1Ldi_pwW-H8gBOLOUFD9a62M
X-Authority-Analysis: v=2.4 cv=A91c+aWG c=1 sm=1 tr=0 ts=6a211d8c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=QLLTW4K7kuvKcNWOCmVsWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=BHWUBWSSduhnyAuw9wkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2MiBTYWx0ZWRfXzDzRiadosGYS
 w9vxIJadIUhvvjwzAm3+ZCwNr32ssOu7wIo066FNgodsnvLG+opgcu1ynAHpeKmmjNoEnsx3lm3
 ecQIBP2UODwbniB0Zu+UrHGDUhhWVJoY3N8p9sJf3eZYMaCceOvidA44LR88xsxQD++K3Q4fDNz
 cnR6Sjl5bD4doLj4EQkdlTJVBpAjQ+61gm+DhH43jpLRya8L0RjamLEYI/rgCUfU7DszgeMi2Kn
 4KTTY9aE+/sQduh8dUbfQgglti3DKyd0OehtwWRkVgP4RA2VYrQ07SA8xiqCNppfzFRywVsdxqk
 fb7d56JgT5iagAeYFCN9KJ9fUAnocEuLAVcqb0KSXnDKMR+ys5DNQeysH4UADw6TiA2wpFNMSSA
 u76jT7ls92TZBMRLrMYEIM9XUqe9JBSCl4gmYax8xyMsvTZsl7Sd4U/VrobY4oXLbvomlAlVzDr
 IJHU9HiEpfDNiIWKaFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111137-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:quic_vgarodia@quicinc.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F04463D468



On 6/2/2026 9:05 PM, Daniel J Blueman wrote:
> On Tue, 2 Jun 2026 at 18:27, Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> On 01/06/2026 05:13, Daniel J Blueman wrote:
>>> On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
>>> triggers unhandled SMMU page faults
>>
>> How do we know that is a correct address - does it come from qcom
>> documentation or trial and error ?
> 
> @Vikash, beyond your comment I linked in the patch [1] kindly cite a
> source for the different stream-ID <600MB behaviour, and share
> specifics, eg if silicon, firmware, or driver and constraint, defect
> or otherwise, so I can include a definitive description.
> 
> Also good to know if my workaround is good for long-term, or on the
> other hand handling streams <600MB is important/useful.
> 

Thanks Daniel for raising this patch. Did you also try the memory fix i 
mentioned in the bug [1] discussion ?

Coming to 600MB, this have been the VPU hardware restriction all the 
while since venus days, and since address could not go deeper all the 
way lower than 600MB, the issue never popped up earlier.

Consider the memory layout split as below (Iris device range is capped 
to 0xe0000000)

|-----600MB-----|-----(0xe0000000 - 600MB)-----|----IO reg--|

0-600MB range, VPU hardware would reserve this to generate different 
stream-IDs primarily for internal (non-pixel) buffers.

0-600 --> VPU would generate *secure* stream ID for non-pixel buffers
601 - 0xe0000000 --> VPU would generate non-secure stream ID for 
non-pixel buffers.

When many concurrent sessions were tried, non-pixel buffers were mapped 
into 0-600MB range, and VPU generated secure ID for those. Since those 
were not associated with the iommus configured for iris node, it led to 
USF (un-identified stream fault) and device would crash.

Keeping the region reserved, makes the non-pixel buffer always in the 
non secure range (601-..) and avoids the crash.

Downside of this design - It would eventually reserve 0-600MB un-map 
'able for all buffer types, like pixel as well which do not have any 
such restriction.

Forward looking design - create devices dynamically and set reserve 
regions for those specific device using the api [1], instead of applying 
one reserve for all.

[1] 
https://lore.kernel.org/all/20260119054936.3350128-1-busanna.reddy@oss.qualcomm.com/ 


> Thanks,
>    Dan
> 
> [1] https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
> 
> --
> Daniel J Blueman


