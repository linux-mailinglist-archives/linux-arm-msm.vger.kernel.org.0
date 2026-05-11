Return-Path: <linux-arm-msm+bounces-106861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLwYG9meAWpKgwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:18:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FE450ABBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BBAF31A553C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FA8363082;
	Mon, 11 May 2026 09:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDV/ayRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvdROHih"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24623BD647
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490418; cv=none; b=Rs3GP2zX4Wof5OnOtfnogYxBK/bDBb2Bh8RMUqTrdsM/4/viJhAK0uZBh52Uk0BOuBXMO/TboEEnGL4oevfcgt8wC/ji8M2NvIfkGx7IDX4p03AYGehnKInONzYk42+TyM1MKr+rx+ZcYAC/V1GZjSGNVRw07WE8ycwZI5lzdTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490418; c=relaxed/simple;
	bh=FfPwtqgOkX1uJ3sUDZ6sGSPnCIcswR5ao4yfyyYEf5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlhFOQ6waDybjlBjUJEr/gzuVCf96paYs6NWgp6+0m7HB3uv6FfVMJVchrydkkdmkUwRay1/v2I43rHaJxvnp/WLeL1AFzLoaWq36/JgAqo9hDp+ObggnPvxftW+aQBUwfz7rJCxMY0V3AynEW1dnylZM/VvCzT9JUHyVj6Vaoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDV/ayRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvdROHih; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8I7Sj1850699
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9r81hLdy+5UdlIFvYJjAgeru8301hA14/IjYRO/7rU0=; b=jDV/ayRU9lStkFP/
	IsYT4lXV2wkPsNhXCTWVXX3oILJJjC7q//iDCpEvyIBYoMH1tswQWtE6JsOCqUky
	cKLvZY33QC1jacSUNU7ecJG1Iv4+b52VusW4t5Su1tiVpJiG9gtzk29rM7cDkuN3
	rSO5PtPBIogT++gTyYPwZkenW4QQRrzmnin/uHcytOUP835i7uotfqi2sWeRhgOz
	2TYq2rx+7arHfb1C1gOw7Qk89Fz5Ys+zqrc7CDtBBwXFC0gbXjXrdd/KRauIOXRf
	1J7lYvw157nGj7Az7gtaACYM6O9SU2uhYISg6uPUjCXKccj0txtMxxMaHFQlk4mx
	v6xDJw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3bfvg5yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:06:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so1502926a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778490415; x=1779095215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9r81hLdy+5UdlIFvYJjAgeru8301hA14/IjYRO/7rU0=;
        b=bvdROHihc/xVsWRLslYVQLPibnC0VBlq85jsZcw9wjjl1hwhTFNwDrFxP0P231aPHd
         ARyF/upvSA4u3Vjb4pFZSTmbBXZOxUEClwQJ5d8pqe9O2/v/GfATN4hzHvyY73cLT61W
         1ScjDp7KeBDUzFlmeW0yQliASLWL5t8aIiZKm/zokgEeRBoe6Hw783QcV2EC6sBkvW9h
         LLX+UT2W4qhtpcIezVMwoHeyA5q7EssHwDF6tmzO5CbEaZpEvquujcqNXln7nvAETGoc
         Ay4uGiBY32++OfYJCXhsT3GMoObAjgC/hA6Hd39FtXvwQuiN0Ma/a218s+xr6uitmQPL
         Ppjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490415; x=1779095215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9r81hLdy+5UdlIFvYJjAgeru8301hA14/IjYRO/7rU0=;
        b=sbtfcRv10TRHt5fn+XkhTeSUFVvoBha/STS7xBL2Ag7lxwl0xI/GT0K48dN6FUZiMZ
         125Pz2/Wd6sYajH4jP8R/ic1ToBJ/feusgq9CZWY1tpi8E6Iw5p0s+C48fvPni4xKqYU
         kUl3cDv/nlENqcW1nYJhtKAg5CISiuoXwk1EAloxsnUU91WMT3MtjdlM+0OUVADzt4G+
         hPMJ/5tFuXebpKjyOk49BntkgGlKeyETdG9bkNqD4xFEFJOiTAGLhaDiSN4idziCxbZm
         6+31PKxKIf9JtG0FkNtF5bisiflb2vtRV7TVZl+b6Siqzeg+9B3MWv5smxZkXUACRZnl
         vCLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2b4l31ToIV++JzhrcJHyptuSUscu1LnIpTr2zC8UPOf6AQxqDNDOBMZp+xe15jdvEkVkEIOJ6SYAp9E/K@vger.kernel.org
X-Gm-Message-State: AOJu0YxJe7pasil0Q2aCwmxtdXIQvcQsNr52xU6AhvzJgP2fJWPxJzyI
	xgW1myHal+Q0tFXt3KizUhPCEcI38PsEm6vOfWpRLWxgrgHk3YvjxdSVXVoIPVMqti8A8geM8SR
	MTgqmP6yDCo70B3Khma0ktZW7bQNkUzajF7JIDphJCqwsKl83o2UJywELdstBHF7hmEw5
X-Gm-Gg: Acq92OHZD/fzt/IJB7S4DG8MhOflPQDkb/cDX3O6DxK0RmW241b0zwrefcb2fkcay5/
	fs2puQgokokgMDNMxYpHPThXz/wAqdabF9E5IwvA/rTmZbtX8f1bZcCv1O2JO2wKsktm4vz6T1H
	oz1Mb+U25qT+ok4NnWqQ7faebg3QULrK4LpkXumTSzwMuXllft55lB5g0804OvA25R6+yW+018X
	XBt15KlxroIQRxm+TMyqn30ijXdKA8HP/wOZJQAT/kJ/snswN/5zF/+jyfKbHLNfjoqMCSvxP1E
	wnnsCbor813h2cdjb0WrcKQpyX4W9OjXMD3YUP6tQeWOvsyPAzv0aV33iRwaD0uAmp2+aB2Fp+P
	aanpF4Sl7inOWllTQbcU1RoDcbS/O1aPaYjC+YycIZ0X8oNzUefbB9bd/0kVQlbNKDDdiypETxS
	QEv3h0ibgdlVDDrg==
X-Received: by 2002:a17:90b:2888:b0:365:d46a:524 with SMTP id 98e67ed59e1d1-367d46c601emr9621803a91.2.1778490415321;
        Mon, 11 May 2026 02:06:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2888:b0:365:d46a:524 with SMTP id 98e67ed59e1d1-367d46c601emr9621690a91.2.1778490414692;
        Mon, 11 May 2026 02:06:54 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d687a2a8sm6936179a91.15.2026.05.11.02.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:06:54 -0700 (PDT)
Message-ID: <a5a97989-0e5f-447b-906d-c09801aacda8@oss.qualcomm.com>
Date: Mon, 11 May 2026 14:36:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add USB Phy driver and binding changes for
 Qualcomm Shikra SoC
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <agBP_HeLmVAKLFUh@vaman>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <agBP_HeLmVAKLFUh@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fa4HAp+6 c=1 sm=1 tr=0 ts=6a019c30 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WzJcQefkPXJgcSUdovYA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: FxJtwasrY5pjSMzV9RCl6JAlhykFOyGV
X-Proofpoint-ORIG-GUID: FxJtwasrY5pjSMzV9RCl6JAlhykFOyGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwMCBTYWx0ZWRfX3RHqKzPevqik
 YXShdO7VLMwG2xK9CZN/RbiGgB3PmJXvAsjpmhdGvfQjEedSEpQOB+ZiHc1Xdj3LTtaYORJkb0+
 hRjM63PzgSG6DnwVGPbs6HMvvi+RYmws/anRcigcoL3AkPvSBHKRnv7FA/MUJqwlo4atr9NYsG6
 F/9xEolgJ0nGEAyXvedGrY8PSKSUMTdAq1f55M9fuegA+tHu2x3j+BcljJeuzkbfj2cadDN6kL+
 6d5AGIGWl/YaduZbSiYikSzbeH03CawzfhODryUL6O8qyn0J/LUnRJViiJFmjMhFxHT0qNAjFiv
 +G2pPwrcjQ7bR6QzQ+kLyzWzAk8eHEACu/gjAslQ9HOBKl3wMIINCzb5mS5EyoxIPjZEid9awAK
 XsbQIDzVnee8Hk3MZVOtvxxvjEhg9zqh7weaBatdfAbj4zJkbVHWjn+swvt0itZJmPoIzxbSk39
 W6V7R1GpbCYgSoHaATA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110100
X-Rspamd-Queue-Id: B5FE450ABBC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106861-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sashiko.dev:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/10/2026 2:59 PM, Vinod Koul wrote:
> On 04-05-26, 22:36, Krishna Kurapati wrote:
>> This series adds Driver and binding changes for USB Phys on Shikra. There
>> are two USB controllers - One of them is SS capable and other is highspeed
>> only capable. The ss Phy init sequence is same as that of Talos.
> 
> Please check https://sashiko.dev/#/patchset/20260504170659.282532-1-krishna.kurapati%40oss.qualcomm.com
> 

Thanks for the report Vinod.

Will do the following:

1. On hs phy driver patch, will update commit text to mention that 
register init sequence of Shikra is same as that of Talos and hence the 
qcs615 init tbl is being reused.

2. On the super speed phy driver patch, I repsonded to Krzysztof 
comments as to why fallback copatible can't be used. Will update commit 
text appropriately once comments are all resolved.

[1]: 
https://lore.kernel.org/all/d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com/

Regards,
Krishna,

>>
>> Changes in v2:
>> - Separated the usb controller binding changes
>> - Updated commit texts.
>>
>> Krishna Kurapati (4):
>>    dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
>>    dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for Shikra
>>    phy: qcom-qusb2: Add support for Shikra
>>    phy: qcom: qmp-usbc: Add qmp configuration for Shikra
>>
>>   .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml  |  2 ++
>>   .../devicetree/bindings/phy/qcom,qusb2-phy.yaml  |  1 +
>>   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         |  3 +++
>>   drivers/phy/qualcomm/phy-qcom-qusb2.c            | 16 ++++++++++++++++
>>   4 files changed, 22 insertions(+)
>>
>> -- 
>> 2.34.1
> 


