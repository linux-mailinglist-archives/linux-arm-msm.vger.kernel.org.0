Return-Path: <linux-arm-msm+bounces-84752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8DCCAF3C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 09:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43BFF300C2BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 08:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A536C27467E;
	Tue,  9 Dec 2025 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlCCbqLV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpgYlxNi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D7126B760
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765267280; cv=none; b=Sm87zLAXzLtm32OmKiwnCcq30p8pxesEkH19TXx5vvcKQYZdIAHHqqJQBc11nA0PhUYK2oGeRGRuua8SAC5oUpRvVU3WMAb7dgtXfMsUaGWkF+IbGoYmRMzj0N3fT7Ed4hJXvTvzuyisyEt32NuNrUhNTmddH+53o0Mk4dIkjRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765267280; c=relaxed/simple;
	bh=qqwExgiQ0Pv1b8q+IbGWZe5IQTlQxLfNrwy8+jHfsBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vu34JW0aCniYWF7HGxxS7A+W14pSCBt5/ry3EfoIT9GTQkMXzzQ3jbO/RuVwxhhJ7T0jdy63kERYpmdBBuU2BsHrPHs2EQbUJ7MLg2MZXOPUva1g2hTP63cXEuHMz/yHUBPKAO0kyMZwkQMUU/Ics86OsKWKcp/y4MZMROAOZLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JlCCbqLV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZpgYlxNi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B96jL342216220
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 08:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gbbm/93BVsdU2TmSdEGtryAj6P6CmSeBKhe4kPREBJU=; b=JlCCbqLVCLT1KVzA
	uaUrqiJ0gb23ZVCi2BZ4W+n58lFX2QbwJHtnsG+JX8dTf9BiozVAZSB16sP/bZhV
	1F2QV2XLUNu249vTp63XPcIjR0xQMHbxq8XOKGop0V7PVO0KfGYKtmxdb9AEjiq8
	67Y4XCOP5w01sWM5DzxFvCRatAHn7NgOIyVPFZXX1z7kGZxREPV06I8VPnVLIh7X
	UCrlDbAQT5o+FHcYhsc97m17Cc4aB9lXI+O2PLgQE5vjiqK1MO59qJcbZ4jHvzUT
	xluW33+bydwCkdH9mE4+Laaps1RJfjQywmaGgVj8Jf5rIwOoS53wGf7JwKk6DA9F
	PKfGxQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axesf06ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 08:01:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630753cc38so7794210a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 00:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765267277; x=1765872077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gbbm/93BVsdU2TmSdEGtryAj6P6CmSeBKhe4kPREBJU=;
        b=ZpgYlxNiBzz0SXiiZvaT6vPtGmkXTWgHW2J2+BsY3EaU0P07fMzFG/Zrl5t1bQm25E
         V0AfAeNNdo2oaqDSGvuTGm2MtmDguPBVigP9cXMyKzLdFPsKxT5UgU1di4WS6/yW2WVC
         EmlaKpCGc0uplIvo3pRHNA2ciwP3w91Ko/IFMeRJvmjbDbJY/uTN4VkLWeWkqGmgaZ+N
         puHQ3wDNlautzzjD0sEAqLLXTuA3nJP8xZ8LFrFDV3gc83av/1arcaddOuBqpHydho7O
         Y9JuYZe1/Z8SMSHp7voCVpkl4ys7LF1H1FSD/b7qwlt3aQaKNekPOqefo2NI/wr0LjZC
         FOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765267277; x=1765872077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gbbm/93BVsdU2TmSdEGtryAj6P6CmSeBKhe4kPREBJU=;
        b=gRmbj/xieInd2PhTzWr89M4otn/oR24+zaDlgUvpBMyHrTFSweGvqvkgFxNn1vXEal
         RFl48hcenfDtYMkVKLbwFfTvorDyMubdfIJhKQl7pNL9o43daZpO7ks52HQZdM1TikSo
         bjtF6jaBSJ+UbnYh+t0LIIVh1FnF6LkIslChZ0rRHp57y/S3bxWizZYXgxIyFYLsSUep
         cRW8L1L5IEP3JHF0x2/r6w2u67b7qCEXf6MEhtGVEsMIPV+7VAVVe9J6WSgbP6U7CzQ+
         paqz0UzsKInQe3id/WncQQmhuLDmIEmzQS/Hb9QCeR1Lozxxes8I491bPPtXczuUQagN
         bQuA==
X-Forwarded-Encrypted: i=1; AJvYcCXJmExGNDvYhExB+7Fz2XwT1xFY9jKczWVWJO1bVMjJqVJv1C4+qNWxM8TBp/kxAUGEGN+8HMAy2Kie4yc8@vger.kernel.org
X-Gm-Message-State: AOJu0YwWCWPX5TKUz/GuLPTidvl850wEqtoYFagKRtkOsSK5490hdPNW
	x6aFpK1eYbex0FwotxBrJp2DVjUqjxIqXIOyv4om/Vo/b4Wnq45eZKceqsLcfM3IsYantHFRN2B
	lQbSsteob6ocf0n/NXAQEizX1XY/mTaf/0g8Il4qNjkh/Q/arXcNLfsMqRw+FBZjbrhmC
X-Gm-Gg: ASbGnctqnmgScSJ2a9JY5lx9eu6RZ/ctfUM6PbC883Zb8TXaGbBT2z46EPLmh3cV0ed
	1tXD8lkacZuqkRGFyYNQPH+JFFkQ7wdE0MVgVzYhmpyRUUeKhvNIgw7XrNHYntLjUgLZ+ioxPAr
	FpZg+jesT0tLjYpZszZQkxoOYmb9pT6mkwg6sXBzIsl9+nS+wqB3RnkBGL7wd5+4H5enzthMotz
	3fiRGQMJg+iITUdnErRvysJVf4NAGJ7FCrFiHC2PJN5RtnQbCkFoKQmRvLYlqo+whUKU0UodE8K
	eoShxa0ErekLMq/To2eyIVlwf78tJuTwHM9OTSYjEc3eoe3LZXR1ok6fftuXVsjHVMVAAQwXFMV
	d5g7XOkmW2ZFsOW9my1pJnOhqzY5vRzUv3hauI/yXUfHVKg==
X-Received: by 2002:a05:7301:e2d:b0:2a4:3594:72e6 with SMTP id 5a478bee46e88-2abc71dbf17mr6468111eec.21.1765267277235;
        Tue, 09 Dec 2025 00:01:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwdGluAdLwKeh97YatzHqjjFh1jXb6sWUoPRSp+38BAcBDlDldQxLpMnVocsec3a85FVbH3w==
X-Received: by 2002:a05:7301:e2d:b0:2a4:3594:72e6 with SMTP id 5a478bee46e88-2abc71dbf17mr6468093eec.21.1765267276556;
        Tue, 09 Dec 2025 00:01:16 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba88433fesm42992701eec.6.2025.12.09.00.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 00:01:16 -0800 (PST)
Message-ID: <34aabb90-c81c-43eb-ba95-024f97d91afb@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 13:31:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator
 support for Type-A ports
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251209041701.3245452-1-krishna.kurapati@oss.qualcomm.com>
 <6awlcjah2ajwzxzdvoch5e3vn2ztvxyjdbikffhp6efti3f4wt@swhugoqsmf6z>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <6awlcjah2ajwzxzdvoch5e3vn2ztvxyjdbikffhp6efti3f4wt@swhugoqsmf6z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y8_r05zJLSQThw4SmPe0JQ75epmddIwl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA1OSBTYWx0ZWRfX4ZnYHn/Jihhn
 uh+BkecRqHZOTOb5kXmS0LuVO9j0+75jOm6ydNMJCmK6BXfSQF+xNyYR8IWaU5SRi4M3oxzwTWx
 Sg6rTpSI6e6FFBuoZ2o4fdil51g3Zr0rzTxLkg6FoBoQbOnOsmtA6H7lFTZglp2XRlvgBkRJKjI
 blJ6Q30pTrZdeqN0VVxm3ZoQDZzUm98tBcV+QrKd0MV+maib7rowY39pNUwVUdyBIGriSqjA+6J
 xxrhDBXoZDxCsEykQrBU01sYX9njQ4KVZaAF7SV3vmgxkd+MTAeEKzevPpdaelNVCEcl/b+0sE1
 /aGlsFbucZCY5RRnGx6JPKohVHtvIxFHeIcZgTP/fSAeE0Os6bYiOMdTemu/6kHDIqL9JCObgqS
 mjR3wHL4bcHBNPAlmqBB21RaSmG0Bw==
X-Authority-Analysis: v=2.4 cv=fMc0HJae c=1 sm=1 tr=0 ts=6937d74e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=_tTy4yycaWUNO0oA2ksA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: y8_r05zJLSQThw4SmPe0JQ75epmddIwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090059



On 12/9/2025 1:22 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 09, 2025 at 09:47:01AM +0530, Krishna Kurapati wrote:
>> The Multiport controller on Hamoa EVK platform is connected to Two Type-A
>> ports. VBUS for each of these ports are provided by a TPS2559QWDRCTQ1
>> regulator, controlled from PMIC GPIOs.
>>
>> Add the necessary regulators and GPIO configuration to power these.
> 
> Should this also include corresponding USB-A connector devices? See
> qcs6490-radxa-dragon-q6a.dts for the example of how to describe them.
> 

Hi Dmitry,

  I see same discussion that came up when we were trying to upstream 
TypeA connectors of SA8295:
	
https://lore.kernel.org/all/CAA8EJppf+j6H8vPOrer1Oj6SuM=qHKXoBahtCaCr7an-cbpyOQ@mail.gmail.com/

There is no entity (either phy or dwc3) as of today that can read the 
vbus from connector-A node and use it. So keeping these regulators 
always on for now.

Regards,
Krishna,

>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Re-ordered nodes to be in sorted order.
>>
>> Link to v1:
>> https://lore.kernel.org/all/20251208085152.2597818-1-krishna.kurapati@oss.qualcomm.com/
>>
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 37 ++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
> 


