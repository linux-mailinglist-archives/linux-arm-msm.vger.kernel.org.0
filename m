Return-Path: <linux-arm-msm+bounces-96554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M2vLPjYr2kLdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:40:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F9E2476EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF528300E6B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6112F42EEC4;
	Tue, 10 Mar 2026 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4EpGxIt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAkfEgaj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E42C271443
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132015; cv=none; b=RJZi0Akf0uA6tGNV3igGNnW152WNsI7C3yHY6HO9QEnF27uJI+ffEcVnBB50pkRb1AsFh+TCaU2oDrdLud+muYDM/jamygbBhN/L0nvPLDkqzoik5kyR/MEuqhNI5bW6I/dnkAKyI31SQWDlXxMltpqnQ+w0w3BA01kqm4GDqKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132015; c=relaxed/simple;
	bh=T2nbJsiBaSmJsuvvmN4hSj5L9VFJx8Vt5p0D6TCv/Is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KB1H3CCiUYcB6lDk5KiJjyqqwpMRpk8zssZQl6I+hRjSqwgH8bnh5NiXdI2JuCeO0/ttuAnhMvcIbz9VooV00VIT6kvnj7qBdhhHx0aQHIEdLhXW36v7aOkoRh19yhZQo2ZeCtOib+TRw1LGMzOI3JyEc0jN2NAU5Kqu/eLFMQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4EpGxIt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAkfEgaj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EYs13754878
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+aatNi4tYJUoEjvW/rAuukHbHE9hwS8CQC87hhFwD/s=; b=F4EpGxItgBJIXmvE
	SRz4lHG7ehpZEFfWFwqFWWgajdCfGfpWgCY+EQ034PmMe3V6h1wWHeetEqrk3XnY
	QlfGlWZH/JHZOMZugn0nheIAtkNdlj+S3m/dOGDGLlz6p8BGcWIFiSwrdx/KQDi1
	crxSrSsNLYb8ITlYRNswreTYWnGygiMKmOlA8Y6+egBdZQYDY8QysqLqgUzH7ZFP
	ZBZ6pDQU01WWvp/RSm4rBQl047tXb5bBom5vjeCti62s8+DnbKjmSOA7yos0NlXj
	eB4Ckf7CXX4qEq+F24Ks+cgaAQwEnCQXBT0C33Z3VEUJOVR4UP33Mq4hj1MX42TL
	VAY0AQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477j8ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:40:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ad179c7fc7so46763325ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773132004; x=1773736804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+aatNi4tYJUoEjvW/rAuukHbHE9hwS8CQC87hhFwD/s=;
        b=WAkfEgajTbxTGs810MnsQqE42PIrwjgzckGgPtXgLScAKF5PpJuF0sswYkSJpdGxoO
         cnpBzG2ojwWbIgR4EFNagxXBzI57AmBwXnFwc62VdUJy2qqMJ5tk4nzhc4t8gekQyem2
         9+jV76aJ1J+xTBnWKDiZS79rD/0SLaPdPoHgsR3QarnAqlk4okkITOFxJLFH9jNG8oiG
         gD+MRzu0m4H+/cfofRb7yeBBRwJUthIGsvhlU6imajSkCW/8xvIOAIaPYNdlMgOJvoH1
         NyEzUMCds7/Li9y7twHDRutZyK92F34NcS0LTTJsOVAKLIQhDFTRh4O8ERGoCS1xtlKK
         v+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773132004; x=1773736804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aatNi4tYJUoEjvW/rAuukHbHE9hwS8CQC87hhFwD/s=;
        b=dh3uYSNoY1um4wRf74Qxuo2eAJnl1dmLO8YZPuO6gjUWnGtrtuvhf5eKDUrLnWi3Gg
         jF3mIVHPYpRYtX2Y4EpaiAIPhc6TEr6tNF9oW3wiZwN1lLwitRDGd/pbxlXZN2lV6bXV
         dpcUdUPNcOBNEKiP/EXeOqK4pFFGHM+IBAGNH8Fd+HNxLPBA4ZTRl1hI9CEJYTmmBAs1
         yxM+cRYgDZkKdCAFTlYnaSjefIJbPcVFdIr/bhwC3KybyT0i/hOiD0t80slYCMGKjcM0
         7L69XQ3l2eMo6Vvnb1xHZ3ZdxgqBv76mK6hS0NjRmPL9h3QUjW3b3Nc79joI4kA84/L6
         4IAA==
X-Forwarded-Encrypted: i=1; AJvYcCWEuPBus+NqKEcx9ofgGIZJwCLsjuEk/jC7tG8QXvvt0+aq21hwggOoLt4yFya3c6MmIq8HdlFxWSiiHz7I@vger.kernel.org
X-Gm-Message-State: AOJu0YwxoV3x/4ig4YZWCGZXC/d3IMlIYUJonnofQ03Fi4ImyZknDaem
	xSUAdoP7dNf3/kaMnZRxxnDj6LBROjCkES21XRPUsG+ifLjXJv37IYC/BuHfCw23i1zlQ/0vl35
	c474emO64y5AXtTjc/UMxnpFognQ72AZiCjbOei+O8mebZ7mFPqnioyI3lAGZlEsx/UY3
X-Gm-Gg: ATEYQzxiIoNDq6+pQ5Fl+PzwIHhf2aU4HwMp/BGKD/tILbNhMLn/VWwXaTktN+eVw8e
	am0IyBtlpgB6DHoA+shjeg+w/24xX5Dmk+a4pICI64sibqV2Q2UBbQNRFkhTKeI759jqozskhrp
	3IJ8tUtK9y8JcPXokofj0ThF2+jODJKPWmy6Js/3XlbXHCBrbf3VRdmZ/ratp3QB59n1zvf889v
	GQXcz5m2IkrqA+9tgkqLrBIOSnnp43S1zyxeBTLLMHxVcuRX7AjCbDmYvv9vYMp3UsEe/eQyi01
	wwKmCErU9xxw3qjShd11K7FB8T9A+Uoa/p/WX5HaRKYWmkKA6lrxZcTpQ2ZhnWezc+t3KS958Sh
	lmCbLy9Auy+OBKS2F7WR5AfE/RKla4dCdepGBfu6oF64WNWRmGg==
X-Received: by 2002:a17:903:2fc3:b0:2ae:8252:d670 with SMTP id d9443c01a7336-2ae8252dc9amr59263915ad.1.1773132004279;
        Tue, 10 Mar 2026 01:40:04 -0700 (PDT)
X-Received: by 2002:a17:903:2fc3:b0:2ae:8252:d670 with SMTP id d9443c01a7336-2ae8252dc9amr59263755ad.1.1773132003841;
        Tue, 10 Mar 2026 01:40:03 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e78f77sm203882055ad.21.2026.03.10.01.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 01:40:03 -0700 (PDT)
Message-ID: <64f43d77-7c09-453e-8d7b-b4e0e5f05598@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:09:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add model string
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
 <rdglzhmncexfcvec5hyenj7jx3m5hsphjlxsaeq2zhi4z4arml@bjeqghbbaoa2>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <rdglzhmncexfcvec5hyenj7jx3m5hsphjlxsaeq2zhi4z4arml@bjeqghbbaoa2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA3MiBTYWx0ZWRfX46QOnlaO/raT
 9GssW9YhgWKQaLFPAyzbjGBXdbJRhdl2/0Q63ZVqhwsnFUjkaL4zkmLy9UxD4C5AeRumEkMAsje
 r2dYRCUFA4zHSTnZ/ssoTaOB4iyzwosfJ/8+XR/4vxOsrCaOoT81A+/m5HLh9vpj1hB671etbCP
 DWIm5SdKIA0eYV/lB3XchjGeyD9nneq38NBOaymxU+1mtl1/jvDk27nofnvevkRR3akTs/PZlfu
 UJz6IobRpdtiTMEvHW8DQRzLVdNXH1jmP6OLY0ERYd/wGLY+7I92WTrWMMIym2pbawrKiGR78Tp
 elMeKTsccbJ8oLRqtvbT5U9b87NIRlpxYPngvSNjHnm4ATdZ9LQXhBQ1nG1W/N49CWPppuOt7NM
 dlqYcqcx1gIHXifMEghuC8P9FkHfglOI/U0EXvGpUHvsPj+T2D1371CSp634Jw/68zU/A+dxtOP
 dvTwMz1GYQw2j/OPhyw==
X-Proofpoint-GUID: apJ-vqff9lYdXTsWIn_xPr0kaCqvNt3B
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69afd8e5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yYSc_uR05PvdiyNszLcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: apJ-vqff9lYdXTsWIn_xPr0kaCqvNt3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100072
X-Rspamd-Queue-Id: B3F9E2476EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96554-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hello Dmitry,

On 3/10/2026 2:07 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 05:49:35PM +0530, Umang Chheda wrote:
>> The RB3 Gen2 Industrial mezzanine DT file lacks a "model" property,
>> resulting in the hardware always being reported as the "Robotics RB3gen2".
>> This prevents applications and user-space tooling from distinguishing
>> the Industrial mezzanine Kit from other RB3Gen2 variants.
>>
>> To ensure consistent identification across all RB3 Gen2 mezzanines,
>> add the appropriate model string.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  .../boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso   | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>> index 619a42b5ef48..7d6e425dae89 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>> @@ -8,6 +8,10 @@
>>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>
>> +&{/} {
>> +	model = "Qualcomm Technologies, Inc. QCS6490 RB3gen2 Industrial Mezzanine";
> So, what happens if I combine Industrial and Vision mezzanines?

H/W does not support to connect both Industrial and vision mezzanine at same time - only single mezzanine can be

connected at a given point in time - hence probably the above scenario would never occur.

>
>> +};
>> +
>>  &spi11 {
>>  	#address-cells = <1>;
>>  	#size-cells = <0>;
>> --
>> 2.34.1
>>
Thanks,
Umang

