Return-Path: <linux-arm-msm+bounces-117364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1eA6LiUrTWpSwAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:36:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA9371DE97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:36:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V83Lk7Ef;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FxCtv8Rf;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117364-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117364-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9965B30080B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 16:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54D7435AB9;
	Tue,  7 Jul 2026 16:36:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C3D435A9F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 16:36:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442177; cv=none; b=MSAg0tmKzazwV2iyMm2rbateO60Uzq/bV/g33OHBrS0/UXCzRqd9pGBv/G2wWf/Me6CZP6wVGvDHv8HRs/3Xs2S2Z0cUSnGPqWoBy4y1X9fbMrqqxNnkESZ5R4OpDJJsL/IrYBMvhpM2doHdCPhJmgNLBPnRymA/PCXknbX1auw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442177; c=relaxed/simple;
	bh=jD7vMq40BtjbLgY2tK+JEwoLI6ZCP6ExRZNtAmmlxYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WltDjWWXDa3wioOr9ninle36k6H8XFQkTT6V5IlIPdmLcB7/YFI7Mc9lR85KU96fNb11PwJvryReU+6cc8/YCtsRYu8VfT7l9lpDCrzVtvVTDNo6A+q4dzyDRHQV8Sv2b1TVG/AVO09gHL4RibjX/GGTrOC04XsJxQqcDhiNdgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V83Lk7Ef; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxCtv8Rf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTFVi029936
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 16:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOfu/YSWSoVJ9+8gOLnE9/D8lneB3OTBsZ8QT6Zknbs=; b=V83Lk7EfjAfcIHfd
	bkLPBHZ7XgqzFQ9jyOKPYHyMkGKzP7+6Qr/7y1Y10nxHQOmGEnfiYcdrtZj8vJVe
	huf+LH3EXGxlwQ5Zc6gyIpLVJkcFUXPxNu1Lub0lZrhHU5Incyp/bl7LulZNGj3T
	1adSCkhBFLXP5OqmCWI4hBid86sdntPa/eAK3cAbrPHA5OuiOjKkVbwzloPyitAD
	Br7JeOHWzbXFwR+BUvgbDap8qMW3pwVx4gZLZ9Y3ERe/oNl2kWYD8GydLMJK/bfb
	TTLhMaPXC5iX7SptJ/yL4LOhOzXFNvsXketDXDOrDheXo5ZHJij0XomcMZ3TOSuH
	XJlWpA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj7bg7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:36:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38096521198so7166221a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442174; x=1784046974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOfu/YSWSoVJ9+8gOLnE9/D8lneB3OTBsZ8QT6Zknbs=;
        b=FxCtv8Rf8Uekvi4+/jnXVNMxDJq6E+bhmfoiK/LBmEBqQPcuEF4gKhTrQWzNy19KTx
         eu+gopMGpfMo7VlB0IJ9F/9I2FN6fcf2/cxB8ew0NY7z3sGpN9sQASia5lxGreFhizkx
         bb0z1GiXWDl6fY8oCahECnFyzWf/PxEXNVOxJVwCC+fvQ1RbCw5aXdxIAkK/H6pASCq2
         x6O8Q36WiOx3fP1twVisOdhPM9BvrOu1wyosFXII/JTUSjXLDtkOJOPNSiaZGv02jpvr
         /TShSUUZyfaSvymSMOYS8Q7pg/AHzQ/+PrmoCRCnYhS6A1V4lEG0ixZ9YjVqW0Rz4GtM
         alAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442174; x=1784046974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOfu/YSWSoVJ9+8gOLnE9/D8lneB3OTBsZ8QT6Zknbs=;
        b=mCj9zSZ5lmkNhGTZrwmyG9UeeIvutzHfDUPgXYRtJvPlHkPHSXLY4uNNqmajApL/HA
         yWr9ypo2WQTn7tPxoHjjQK63Iv1DjrvE0sPIokP6or4vyz/9NNbAM93NGfFNrg+AAkC3
         TZ6rGr23APdkv9Az0MfVoxDN7Srv+q51CuQOHYL79yeNpN6/ezI3dbwpQ203BTNyA7B/
         knKzsNxx4vDHI09j9+SFnjVSBHSerG6orTcYpappJ+xcpuX2wNSoFcrdk1Iut3KEN8uQ
         yiP612MJV3rK8lyCtgS3MAAC1ai4+osB8gpIL15w01gsgzVtIlYd6q7VCE4PMSzkPMak
         Awww==
X-Gm-Message-State: AOJu0Yxw2KcUqMTAgws1vvN00e1sBj8+EQYe2lqGDuUHTBR9Jd9f3q7H
	R4lFwlvgjvEE+0cSA/A7xQsWDPaXYgXo2HHeur0miS94wE8DSodcXZUaC5NXou3EindFBQxNBz/
	kGH2TYiSMmvEEAbla/v3FJoGYXoDhDheKUo5HoKQgV9zz0r5guiZ8ZvGKswNsLaSQgiv6
X-Gm-Gg: AfdE7clMPXPDeKRf5w3u1SBxgBgvudXC3P+9DYnLfAWNMTfkEBM+IAlLv47sew8tjEE
	MSNBG4oA0nuSPcmFZfjcMRhbd9LOO8Mxz5Q3SGFQdOM7RG1ET6V8ZysJcSgfnheFMVooaTuHx5i
	dVG3tl37ZR9ZKpXvcghNuwnjscpicjRDag69sQlyscN9s41gH6MGftag/y6NrHPoR6P+K8ftjND
	hnZdezRwna0LbQEYvvXbaMEUvj/t6O6yN9w0sQwrYHf0SN8DHw0D6wykHVz76fOjt0RXVixjixc
	kg2LahfUMNUuoriXnB31styWTaOVNLt/jfa6y11DmXzML2lU5+fCGcPT7G7gUJfg+U5syjajFbi
	z7vee5XBZSQQbBBi4xpV/BXN8RO2yJJ8g5Ibbm31vcQ==
X-Received: by 2002:a17:90b:4ec5:b0:37e:1609:b304 with SMTP id 98e67ed59e1d1-38756801500mr5684095a91.1.1783442173996;
        Tue, 07 Jul 2026 09:36:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec5:b0:37e:1609:b304 with SMTP id 98e67ed59e1d1-38756801500mr5684047a91.1.1783442173406;
        Tue, 07 Jul 2026 09:36:13 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.234.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118389d9bcsm2524489eec.20.2026.07.07.09.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 09:36:12 -0700 (PDT)
Message-ID: <97b205e8-5ab7-4205-b1dc-cbcb0497987d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 22:06:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
 <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GXqS_RdgkvkTuXoY9IM9X1wqYgccicpg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfXzh7RaI88fmx+
 R4WitnJ5vSi+JRxsybA1HqCTab79bkY1+JyewA6fTehI9hI0XQn2yiUHj80swyjo5Pm1WgDE/Li
 iHsnkCMNHw09MbBIoKOz4fI/wyF4kemrkygES+VFO/QHslJfRQ2u9hTHFD/4Yed1doDjdraIE4a
 WTDtY/7Bp24xAMKGofweXz6iFUHpcht24gSh6uRXckGIikv3sme95SOLOBQOq1l5lkHZcZurtII
 g73FkOwm2VG5mbyASAMHPSPQF1e16LhBv7Gw9pOkhCsqFZbPIuG2ikuGkBFnggQulMLD70YJspu
 NlhRyz34jcUXT3g5GLJLklzRKn+om3xUFcccnIcSzpZaUdWVvxJYcor5CP8wBtCMD2UlG74ZaqW
 y8g2WmEClN7YjREMiQRK0z9YogSGyorZ51R+tuqllywp4iUpDnGbyG5mY1GjT3UFqUeHEWbgUA6
 +wEE75oMApCTboUuTUA==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4d2afe cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fIivk1FRtaL8gRNK6azaIA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=TqdALn-mf9RdMn6JgEsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX/ousu+aWHvp3
 9vZIBTZ6C5ZPpEJONruwo+2yu8LnGQi5YeD8LMLFL2Pj4iQJhI581D2jCQ3hwsnblU+7o6k+iZY
 KF3zgrHSXxAyG5QytUGJxPkbAXoGQ8c=
X-Proofpoint-GUID: GXqS_RdgkvkTuXoY9IM9X1wqYgccicpg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117364-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:apateriy@qti.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAA9371DE97

On 7/2/2026 4:25 PM, Konrad Dybcio wrote:
> On 7/2/26 11:50 AM, Komal Bajaj wrote:
>> Add gpio-reserved-ranges property to the tlmm node for all three
>> Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
>> SoC internally and not available for general use.
> These are generally added to prevent non-secure access upon TLMM
> probe, i.e. the board won't boot if some of them are not protected.
>
> I assume the proposed set contains both ones that are _absolutely
> forbidden_ for Linux to touch, but also ones that are dedicated to
> some specific purpose that Linux _shouldn't_ touch.

Yes, some GPIOs are reserved for secure-world use and are therefore not 
accessible from the non-secure world.
I will update the commit message accordingly.

>
> Please add comments, like in glymur-crd.dtsi:
>
>          gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
>                                 <10 2>, /* OOB UART */
>                                 <44 4>; /* Security SPI (TPM) */
>
> explaining what these pins are.

Sure, will add this info.

Thanks
Komal

>
> If any of them are boot-critical, squash this into the introductory
> change
>
> Konrad


