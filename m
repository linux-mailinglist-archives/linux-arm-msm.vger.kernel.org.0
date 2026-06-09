Return-Path: <linux-arm-msm+bounces-112164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MhnDDxcHKGpP7gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:29:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA7B6600F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:29:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PcBkvwXy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aXWcxvv0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112164-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112164-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9F3430ADFA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A83241362C;
	Tue,  9 Jun 2026 12:23:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA7B41361D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:23:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007818; cv=none; b=NX54RjXFd/JGcgABScNcFblbl21HFVEVPjIRP22hOKaPMqsMnx5k0xHlmoDqOWr3njvWWlpNO3gr81GLTdDioBPQtE/0qUOb5f4Jp+E4nUDfyppUadOURutuZClIOOJ6enE6/E7FHOc/NbCJPJEOXEox7QossP4XVXxPBUuBT54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007818; c=relaxed/simple;
	bh=rLGj/87DE+IWnv6rE89CcLRhrhgUVBrKdFjoNubYr60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFFFjwiVqcoAejsq25L5P5wvqT/WTLZH4bMZUD2IJmq1it9Y/O0ZBfQFx1xE3O7lLQA7rO60FGpmbA4SElyj19ktLrW4YfgmrIabF3To7Fg/zhjg3VJ29FCA5k9UtjZN5N8t8rVqhACJNaLuSRA4HwB8EJTjhHTzJWZ7/2A4VrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PcBkvwXy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXWcxvv0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnA07518684
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 12:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjOurlIogpN4Aq/2lhXA06Z1CJvXQFLBIcp9yCrlDjY=; b=PcBkvwXy/lONhkKS
	uk/ZgPsaaTSESVdXGhRUpbWszu/7whMi+2Ptt6C/h8R0UjZE3fQAJD3w6az0ixMk
	dLrv5XQZIcxidj7PPvB/rK/yAVEkA+z/97UxuNvX0LgJY+06apkmEDcj42p5Jzyr
	VQZBMoNZeeAlZJh5wNXN1HitOia1D3Bfp81FevV9SmkOVP7goYawZCNNbSa4N2/t
	gokYUZIkJNn981cB5h+o+VafdTOD/55d+ThYqGR0inZ44Elvp3ud/zxcV7N7NoUu
	aW7W+5yyLAQV29sogziaFuvv1KQP/c0bFLjSPeyFbwNt2K2OP/FK8FkqfLedJzqz
	LWKYMw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0ss1v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 12:23:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517741bcc53so15067001cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007815; x=1781612615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjOurlIogpN4Aq/2lhXA06Z1CJvXQFLBIcp9yCrlDjY=;
        b=aXWcxvv0USnBfv+XVozsuet3JyMgSOg4L61fkNxuPOK6kTwXnwKeIVUfcD/QLbOfqg
         6LiG83ykwV5NANfw1GD+VgGMYfnYTPwW9EqlbABsKkX5aEn15IrLqQm18s5e99ms6VtD
         zL5Zzmk2yssyY70vb5gunYW5iujWjKIo6N7HylNQlqFaCWaMjpoYF7j4KTp0oHaAQwF2
         b2vuLPOwHQ52uCbrSuhM4/DnflwSkEdQTaabrCcG7tqj1exusZVbNbGUwDLHb43/1zS/
         sZdgLx9PgDqqH9ttlOVOevaUL56PGVAlqpbgciyDXq26A+L9agZVKsEvNEMLCvvoidWH
         rywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007815; x=1781612615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjOurlIogpN4Aq/2lhXA06Z1CJvXQFLBIcp9yCrlDjY=;
        b=J61bEkCLxW5b6WHGZB0NQVuYpDcTOQvf4yN65cw5bZObLBS0l4npW06yt722T8egAx
         f1DJttQOdou6ggZgyBomNlEgSp607r8SneyFLv6SfqN+tOHnbiwIYNKcVtNveaLQKgDs
         NMx8sPkqIQIBlt9Vjwft+wtRF7Z5sebyVl7DsoiqbZa7LT/RvFnIYAf4gZ1drrq28ikh
         U0PgboFkPp96WdZdLXcoj2BWxq/9GCputeVG738fk45o9kXCc6hoCXmt49l7vdYI+txZ
         bp9fh3Q9YS5srMDREgOzrV0bcWmbLU4xBUShhygJwfDfgrf2bcyeT+8lkTO+lNwLQKDM
         hkHw==
X-Forwarded-Encrypted: i=1; AFNElJ/qtrhmKPDh0pCOkNZolCtTiZnp88fvEUbgFO6jj6VSL7iXJpNBh3JQtJqVw7hlKjr9m4kijqboM+x7JbJ9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe58HdwM+vR6jDSHHcf39ZKOx5PJUgemV9FL7L0yFGSJPQ3Wwv
	n/w6CGW5QyQszOBS4OcWAyOc8kvH+T3+nVZFrnG0sA+XzKUdguT/Abnvx95Qwi94OiXcaLJPhHi
	XOyurNIMOVqrNprqFV+FvAlvtYnLjNFc002+5aFeivrD4j2GM3ugVOfa+rc6P6pumYVwQ
X-Gm-Gg: Acq92OHOYPiDZiVe9qEFrRTVKm/eeu7+llCz3uuBKCCd1oLhkDw4Sa1ffoh4kuF0cDT
	5olaaM+1VmZxd/5EvoEC1YSSUok6hTAGlE326Zid+lJoRlIyHiocZl4Exw1GvqihMbyQkNMi9x0
	TtGHt68js3ji/oEndAdwCtZCfnkylHAFnXCIErBj6b4BwWiF5Oyv0ycofs07iPp43ZbuswkBlUg
	yGTFVGcEI1U86xjzlorFZETW1L5s9tWiTuFliQ4JignMuOsVhGARGjpiEUJDzsBozk0vjx0aqd1
	mlETufhYvyLv5CZSAYKMfKzL7ySOvZ/9zblmTYeVNprqAH48ysPLUhwBY0cRMsPeN9eCtxWPd13
	6M7nN+nQDsieIlkCjpcBhWnETFmC5iBQNg8j/09Dpe8YD98IWLSCrEzo2
X-Received: by 2002:ac8:5a52:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ca3faecemr24114731cf.3.1781007815178;
        Tue, 09 Jun 2026 05:23:35 -0700 (PDT)
X-Received: by 2002:ac8:5a52:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ca3faecemr24114331cf.3.1781007814688;
        Tue, 09 Jun 2026 05:23:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307ce3sm1026067166b.43.2026.06.09.05.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:23:33 -0700 (PDT)
Message-ID: <12a8cc4f-3c45-471b-8a0c-f7473cefa190@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:23:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4>
 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
 <178073773007.397244.9871455646149843167.b4-reply@b4>
 <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
 <178073918523.417326.15121723011916371966.b4-reply@b4>
 <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
 <CAH2e8h7y9PivdMh-h78VSqMf8i2vSR2fvVaO0P1eYBT8qgEdUA@mail.gmail.com>
 <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNyBTYWx0ZWRfX72S/wraJ5YkY
 pFtVtJQOjrnLoU1sqGGHwDAU4EjlfOuu1J1lgzr2vrgidCpMs5nXp0Sg8l0NrH0hCyOR5o90rhM
 x6DsqkEMwvcnV1JVgsL1qIffp+mMgtci698pOKl8bJR3qpK6HVVqsUqdDq68kln8FjhAsA8tiVt
 FV1FxGDT0NYpgPevsOXs8O4Pv6ENiv/QWEVHQwY3VIE7dLme2enLOf+PWnyEsNVSwwOiwfnM8RB
 tCG5zrYhzuClsWqTueF/vlCcJ34q8VDJbK2YLcCbrVvHkxC2fxD5uE+TxWeBLvFlY2brOAe+82/
 up8aRQvmQpoUnsUgpQlXi1KV444hwFysYq6RYl0mwrVDPcZ43Lo1b26F19+bePdjrU3KBAadoM5
 KsBnuGAs9HuSfVKJZeFhQ1PWDeGacuM9+N0Gn1RcQ+aqOYPZOw2/iVPccPncIrTJ9T/vAGnqkew
 4TUi3FqBvWHgbcWGpVg==
X-Proofpoint-ORIG-GUID: OiC404wwn034DA64n0mGQd1tcKxOcvzl
X-Proofpoint-GUID: OiC404wwn034DA64n0mGQd1tcKxOcvzl
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a2805c8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=fGO4tVQLAAAA:8 a=DGYD9H-L74iTx1fb_rQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112164-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,gmail.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECA7B6600F7

On 6/7/26 10:49 AM, Icenowy Zheng wrote:
> 在 2026-06-06六的 21:51 +0800，Pengyu Luo写道：
>> On Sat, Jun 6, 2026 at 9:21 PM Icenowy Zheng
>> <zhengxingda@iscas.ac.cn> wrote:
>>>
>>> 在 2026-06-06六的 17:46 +0800，Pengyu Luo写道：
>>>> On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
>>>>> 在 2026-06-06六的 17:22 +0800，Pengyu Luo写道：
>>>>>
>>>>>> On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
>>>>>>
>>>>>> The magnetic keyboard (USB HID) can't be connected somehow,
>>>>>> others
>>>>>> are
>>>>>> fine, such as the spi touchscreen (not upstream yet), which
>>>>>> utilizes
>>>>>> DMA definitely. My config is here
>>>>>> https://pastebin.com/SdjuyJYk
>>>>>
>>>>> Is this a defconfig?
>>>>>
>>>>
>>>> Yes.
>>>>
>>>>> BTW it seems that CONFIG_ASYNC_TX_DMA needs to be selected too
>>>>> for
>>>>> exhibiting the problem (because there should be "public" GPI
>>>>> DMA
>>>>> consumers to trigger the stuck/reset).
>>>>>
>>>>
>>>> Is this still necessary? I checked the fedora discussion and your
>>>> GPI
>>>> DMA fix. And GPI DMA is only for the QUP-supported peripherals as
>>>> the
>>>> binding mentioned, devicetree/bindings/dma/qcom,gpi.yaml
>>>
>>> The devicetree without this fix seems to be still incorrect,
>>> because
>>> with the device tree fix even if the GPI DMA driver misbehaves the
>>> system won't be stuck (although it will iterate all GPI channels
>>> and
>>> then fail to function at all).
>>>
>>
>> Back to the start. You said some GPI interfaces aren't available to
>> HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did a quick test,
>> and spi6 consumed it, no stuck or reset. Could you give me a
>> unavailable channel?
> 
> I think channel 0b10000 of gpi_dma2 could be an example?
> 
> It seems that 4 channels are tried on gpi_dma2 before hang on my
> gaokun3, but as gaokun3 has no known serial access, it's possible that
> 0b100000 or 0b1000 is problematic.
> 
> (The reason gpi_dma2 is checked first is because it's the GPI DMA
> controller with the smallest address)
> 
> BTW I just took the values from Windows DSDT, which is quite
> conservative.

So, with DMA_PRIVATE set, is this series made redundant?

Konrad

