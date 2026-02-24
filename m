Return-Path: <linux-arm-msm+bounces-93900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHNGAKZCnWkMOAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:18:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B421825AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E42D53019837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2792D7DD3;
	Tue, 24 Feb 2026 06:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJM0S5xl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTeGx+1O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E63728136F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771913890; cv=none; b=Z8as/aevX6nge6D3oRlbwZZeFpN1+tawUBanXeYr4ivSD+PclWLHKKZTBfMKLI8Db/vDnTz7iktY/N9KNcda14N9S5qDsAVTCJiRZJrNskIREvxfSJgrfzQTjCEedt7yaC6Gwe0YjV7Zfh26KdOyr3aWInJ6gXD7EJYWxiE9fk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771913890; c=relaxed/simple;
	bh=55ftLdvyOLNET2JD8Cx2U7172SmE3PQBBQsKretftwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tnwrx5SpV1XpPoSSLFDIm4Od93Ch4Or7RzKCoGROa9b8KFcDKScTrrsRO7ggOI87H7ao9MIzO/4UthuWZmBApIXMzJ1ktYaRfBstDbaQXc3wSfiESMDMXDxvoZ8PHPcW9ImwSMmeSSUT68/VDEjDVuHnhs9o24rG+dIIeyhxhP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJM0S5xl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTeGx+1O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4M6vQ1252377
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIF3RzhViYYlwxx+OD/unsWmeMnNrO6XtaAytnKLG5w=; b=SJM0S5xliId38m0K
	yEeHtH36NYE+SuY/Jiivi5rbioKb+jvioZ0KTCFwPBsbt9TixdCi+zbsJiwsQUZT
	0gh8VH+1WUfX1G8tCK8yzM9LRRkBRXzYAVhncJEw/2wQCsdTcQeSydM/3ZJgT5c9
	dFZtguSyMcGmuv0OriC68j58AdtPaBW7girwYib3Vdsv8McKNnp3SaNuRjWQDFU+
	TeGs2DHWyoxECcnALatSSaqQkf8tyzUiFqFOaTt9XCWz9NiyNabV8yjowfjZ+2U0
	y4WJ+01NZTMcNnFnAT12oWjlGRpca/6rQBoBnLNqv0TmLFTLiyWe8Hf1L9jUHg2B
	87zx+w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4568dex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:18:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso4786935a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771913887; x=1772518687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JIF3RzhViYYlwxx+OD/unsWmeMnNrO6XtaAytnKLG5w=;
        b=jTeGx+1OOb9eQnXAWNJAtlrQ6ePfASVtxcTx6IoLsMV8C6SM9NiwHvT11jHOBgzxwe
         pnn+mlu5C4Co8xTjKvvXYe26/Qjeg2lmY0zZAvfFFBSDJtWPUGHYyr92RqYecGFmD4YB
         v/ptkmeS9meuTE45Dz8WIOUlf8dFjY78aTrNKASuTxjH8CprmhqRpCYCwHNMXIJA2Yzc
         rCxEavu7r/iz0YUUYOwzqxiT0VbC3JdcK6FTsLMsV4Ja14//BpGIuQI/swEPfvlw22qO
         0e7pntsqSXDQscISWd0VE9iwC7lHFTxdc7ZguA5bC9Mo0Mt5+th0w8qCXu/9uh2YUdRG
         SWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771913887; x=1772518687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIF3RzhViYYlwxx+OD/unsWmeMnNrO6XtaAytnKLG5w=;
        b=Fi9HFuZcVXo7mVtPEQ+i/7ZwPzAgsXNr2FvjQDOCxlnZ1LAg3nPLXtipzMKoU3Wc5f
         bVgVCWolF62/OjWJVsmxTlobtjIPbtfuKeale8IfJFexXy2mGKq8FUzami2KAuBsNkj+
         msfIMTigWT5QbWu8W410g172vavgiIAulE5FAdLfi9kaPhik0f7HLS++eoN0oPCNf4h8
         QC+KMyCTPJAyXDj8E4ran8Slo8xDINPl+1j1unNEUoQuqIu6/k2hyeoQzj0rafHQzRzI
         Nv6TP45E8fAWXjH99ioiKaMA1AQdg913/EUEX+NGuSUSrJ1qBNqMgh+p1+yQiqZqZLu/
         uDOA==
X-Forwarded-Encrypted: i=1; AJvYcCWzjPp8XL+BESnKrnwqq8W0wDi2jhTNvq1DQ/kbqOQ4bxdYMribF0AOUSakRZd60zTt9BfdYAy+LXQ6f+43@vger.kernel.org
X-Gm-Message-State: AOJu0YwkOD2xKUcERbaMQb+WmWM6Y1IfYMPsE8Je7//3dHhEgtm0U8ce
	rkjKdiPup1DRyY+5KGPQofTi3AGXC0H0OmO1Mhanf44SNXecLId9gQLZvCWeBTy9CJnvjvhPZU+
	Iilf+0vLpJZidSrARZnT0qkcuei2hH+ByPs3La6guvuGAOBQzIB8f7PehlvNhxN09G8im
X-Gm-Gg: ATEYQzwMpLpSUwz+dMDJG96pseFpdJ6mhfBWwRADyXejRNPJjjE8gJHsjcF0b2sI18w
	2JmxbcS4qo7IR0lhy2ZIj+q9YMDti9iuOYoLwMjZTO1vBibs9L60qob1dk20UnRkyUyHPhmQfjV
	gz5VVmePPpqN16NpxmMoEt7w9nAC3cSIsMbft6VUzBPv3EmVnklXobYEszuUNd9hShlaeRouSCs
	WLv9KyuUCTdVx2zguYb9D71IEEmwL+a5YnKoG9mMrDIR5zXgH89p9LTQjYrJAC+GE1Wg0mTQcym
	CiS8Jr6zopwyoVwcBtbvpbxHJdtGBHtf9/YdbYf8wYm/XmiehBcToEvJNEiDmzUYA+OdnnrOoVe
	D26UHwp1Gbskh9tg2FwrKLRb9bILGzC4HPPCUffVQucUdW4N8z2RMHSMSU4zjx0hkhuLdnfSAdS
	OguL8QZUqO0UO1H2ONPNWiCpoOufJhaAZ+WLDkG7Y=
X-Received: by 2002:a17:90b:2e0f:b0:356:3ba2:1233 with SMTP id 98e67ed59e1d1-358ae8b3dafmr8115460a91.22.1771913886840;
        Mon, 23 Feb 2026 22:18:06 -0800 (PST)
X-Received: by 2002:a17:90b:2e0f:b0:356:3ba2:1233 with SMTP id 98e67ed59e1d1-358ae8b3dafmr8115432a91.22.1771913886336;
        Mon, 23 Feb 2026 22:18:06 -0800 (PST)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358af5f8b1bsm8333890a91.0.2026.02.23.22.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 22:18:05 -0800 (PST)
Message-ID: <48778fa8-b485-4c79-be1a-c70836f65f0b@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:48:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
 <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
 <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
 <CAO9ioeUSJQC685K47qMBn51r7APReO9T+h_K3bZ_94Uwn1unBg@mail.gmail.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUSJQC685K47qMBn51r7APReO9T+h_K3bZ_94Uwn1unBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Srvw7Kjsi8hAgiwB_MlfFAl6LWCx-QEL
X-Proofpoint-ORIG-GUID: Srvw7Kjsi8hAgiwB_MlfFAl6LWCx-QEL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA1MSBTYWx0ZWRfX8UwmKNuKI1Cc
 1pOHWgvzHCnNCyLLjo3samJ7tVVtA3Vu+NgNa4eIH7eepvKjyeeIBW4iTlo/lfXs7xTC9Ef3JCy
 7tGV+65ElHV1nmh6iirbHS664wILVfHZF/uoDXt5rD7gMoTgk83ufjYQJv23LXhL3wlJ5YCmJFx
 t93nhNXVH6W3XXmBG7YTW9tyhzLo6fjHiMrg1a2jfhN3LraBY8BTrh/g/Vm8DR88d6WfWELe2ih
 kEi8XaBrT0ucoPPwoJJ5BEul/ZXea2AKRV8zb2P71nDrGAFo8H0e8d41V+e1J3vbsZgdAWTBT0F
 oyXt/S4ttCaJ3wequrjRRPEMR9yFaY1QEl9sfV0mMMUclEEOqAB0aOzn46aEaoq9059gin97JdY
 VDkW1UY5LNd0XbwWQgevOSrEAx4QRBZpas9bqxYw1VOT7/OwOf2w3GfnNkpOhWj0aY6JC8GKSu5
 YsgCWW1V2h4sLG+7vqw==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d429f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ePpz_JlwkyPc9ubz9f4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93900-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83B421825AB
X-Rspamd-Action: no action


On 2/23/2026 10:44 PM, Dmitry Baryshkov wrote:
> On Mon, 23 Feb 2026 at 11:09, Sibi Sankar <sibi.sankar@oss.qualcomm.com> wrote:
>>
>> On 2/3/2026 6:09 PM, Dmitry Baryshkov wrote:
>>> On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
>>>> On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
>>>>> On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
>>>>>> On 1/29/26 1:13 AM, Sibi Sankar wrote:
>>>>>>> Enable ADSP and CDSP on Glymur CRD board.
>>>>>>>
>>>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>    arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
>>>>>>>    1 file changed, 14 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>>>> index 0899214465ac..0eed4faa8b07 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>>>> @@ -487,6 +487,20 @@ &pon_resin {
>>>>>>>            status = "okay";
>>>>>>>    };
>>>>>>>
>>>>>>> +&remoteproc_adsp {
>>>>>>> + firmware-name = "qcom/glymur/adsp.mbn",
>>>>>>> +                 "qcom/glymur/adsp_dtb.mbn";
>>>>>>> +
>>>>>>> + status = "okay";
>>>>>>> +};
>>>>>>> +
>>>>>>> +&remoteproc_cdsp {
>>>>>>> + firmware-name = "qcom/glymur/cdsp.mbn",
>>>>>>> +                 "qcom/glymur/cdsp_dtb.mbn";
>>>>>>> +
>>>>>>> + status = "okay";
>>>>>>> +};
>>>>>> Please make sure it gets to L-F (only Kaanapali is there right now)
>>>>>>
>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
>>>>> but the firmware in linux-firmware is (now) targeting IoT devices,
>>>>> should we use WoA-like names for firmware on Glymur CRD instead
>>>>> (qcadsp-something.mbn). It would match what was done for the SC8280XP
>>>>> CRD.
>>>> I think it's simply time to stop pretending the firmware is generic
>>>> (some fw simply isn't and some fw may come from different/incompatible
>>>> branchpoints) and include a board name in the path
>>> Well... CDSP is usually generic, except for WP vs non-WP.
>> Hey Dmitry/Konrad,
>>
>> Thanks for taking time to review the series :)
>>
>> The ADSP/CDSP firmware that got upstreamed to linux-firmware got their
>> functionality tested on Glymur WP CRD devices.  Given that the firmware
>> has already landed, can I continue to use the same name as the patch and
>> have a different name for other boards if something specific has to be
>> pushed
>> for IOT?
> Thank you for a prompt reaction, it took just 20 days. During that
> time we could have fixed WP firmware filenames, but... linux-firmware

Hey Dmitry,

I'm really sorry that this happened this way :( but I was out
on vacation the past three weeks getting married. A quick
review comment on the firmware pull request for naming
change request would also sufficed in the interim. Also to address
some of your concerns there aren't any plans to push an iot
specific ADSP/CDSP firmware for Glymur reference devices.
Also, this series already warrants a re-post so I can still
accommodate your naming requests with corresponding
updates to linux-firmware.

-Sibi

> got released just two days ago, so we can't fix that anymore. Now we
> don't have any other option than to use a non-standard name for IoT
> firmware when it comes later.
>
>> -Sibi
>>
>

