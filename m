Return-Path: <linux-arm-msm+bounces-105400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMlrIZyJ82m74wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:55:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3654A616F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 569A93001A7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFAF346E44;
	Thu, 30 Apr 2026 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIFTqGWt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTcrCQhF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0C2E8B98
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567719; cv=none; b=NLxNxFjqgPWFX6+C5cQcOZ/M4+Hpo79R+BiKLKCKo8J4WXoP9ceK+cPpSUMso+mwA1n/Ot4ETmEeH49X5DgVcH8hmxyExZslKJGfO7gdL3zY9zawxCXlbm8o4dA8cTAdWf2CdjRaCW0tEyndHAg1cFeYh/x2M8AVZ6whCnTRDcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567719; c=relaxed/simple;
	bh=iyHbIkFdXPqVIKb5+L3th6PStWzVqWAUPryssGRqqWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=anAPR1cuTCMpAsVB/2SRz8Uc3tPkLpyFFUNQ7HgRjJatN86c53Dxfx86e/9WByTh+7TVX85YdOEoq5rCKze8poE8sjJWXHcRiz7XoiHkHPuGfi35fpv+9A+JLlh0+Qv8UmsdQz3anjJWw7LkYBprqOoobRq7772+AfsQjxpUGz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIFTqGWt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTcrCQhF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UF1VQE810488
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SV7o9l8CrqKI3O2AoXkSm6ZCuba3HAZ7LYr0cPU1ZLw=; b=ZIFTqGWtrPS7GYxw
	DtQ+Q2j/lx1w7j5e8vt9Y3cXUiEzXkQpK/JIJirhMTfYX1gaMpft1DL7Gu+WexdD
	/3al3xWvIU8I/cp1gZ4sMx9IiehupzxCSAe2W/W/KSn28mFfytoJF44uglxGDDUj
	tqjswAjT74hwz4AoDoFG2Pa9d4SEnxziHbH4HtYMYLQKycwJyeYDDP5QWJ+GOMnv
	plYIyBRagjkiHbN6GIakI95OjF5S0geQdaSTKViSD6xy/IWGRqqjtxp4ThYP3mvN
	hmpQwQMq64hbogG/s1HaafP/+F3LYe4LjYDOL/GifdjllIEMk6p/zE1Zffo5D5w6
	nbxlkQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3q3v0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:48:37 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6055c46b2c8so107101137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777567716; x=1778172516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SV7o9l8CrqKI3O2AoXkSm6ZCuba3HAZ7LYr0cPU1ZLw=;
        b=VTcrCQhF1EAzGQz6wBEdYW97cF+Or5trT8myfA+Dm4dBtRdYpvG1xIgL+03B8BgdHT
         N9NYNCfTh6mp8rrhlneKC3J44fKlnX/jYqnbRyWxZUcHXpf7wBhogI7Z9eIddpr+mknN
         AxVfJ+v3rP3PglHEnYnse+wu3ndWw7SZgW2WMI/wIr54EZF//JMUZHs2jLvlLPtvCaUM
         751fs6MLpcgtEh2PGrXLY1vDdiv6D3B4liZNTIl0ShW3a7mLCZ7RjG5PA1VSwGi/n9jB
         kTJwdmg84BeKqhKOAzNMkDdf0SDVQrd6G4wxyUAgi/TVoYZDnv5m47AzC5o2Xyh4ul2v
         OJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777567716; x=1778172516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SV7o9l8CrqKI3O2AoXkSm6ZCuba3HAZ7LYr0cPU1ZLw=;
        b=a71OkYUgqbiRZRk79ZLL6FDQT8V634AiiROe8FQCv4PAIGeSKhkZbAMreYUA7vdp2/
         VA4gytlYY4kozyzJWka3HD64aJQc6ZzxTG6PGent6iZSqHufOs9ItqLUwwDdAu5pc9Fq
         9fSDxsS9OFJ2aNJH0h/GURrFy6B6Mjysn6p0yc66AZyYhIkkhb1VogJ54eyLpY1MUZqc
         Bz3Ru6T0NQKmN74ePevy+Om/azeEpFeyUmaN6wGjlspc+cisjPWno0XvtSslrTmjwZv5
         3+XJf3JbpoYGWkvkOygWUG11HuHp1J6li1TJOImpVsiyVieI3QkaEztQNvcMS5FjfTEJ
         +Jlw==
X-Forwarded-Encrypted: i=1; AFNElJ/ywi0Y+XKWp1hY3qYCBDxJLkt6zkENdkSNrbLafKkZh2CL+z6eNIvzbZbVjw0em854t7flegMXpqHjjEcj@vger.kernel.org
X-Gm-Message-State: AOJu0YwEm5sJz1mS2bxIWOq3BHnCKRcEr9HFtAtvVoo001HtUSbYmDQ0
	MTcmnxx6gFSI5aC5+OSzYCcfB/RktWLKRGcxWhPOVQEAeIn1ViI95i5gzlFlHE1VIucBvLTbvXa
	RzHUF3gSJc42oHNCaMtkQ2RFLCOlVBkakLBwGQYHD6psdt7txkqgquUomAHd6YOF6UcxhBAQdGc
	IZ
X-Gm-Gg: AeBDietIT+NSyuIYOv/FyVdypM1gbSdOQp9eUXozP264r98bYzn3j6Y17JyttxPKEux
	11drracw9BRTPcWpFjaC6/gLIFgltTETwsS9laMg6S6flNRMicN0weDlg977ZZm4DSW42Qmwu59
	/oLQEVGQ26m7OeIuBHD8clGjCQ9MZH7VykEVTqQYKUtKCyLsHC9dMdKMR86qepk7xdzd4epLgVA
	P3D8LxbborGpQQAAKJ6PofKaiZcAmar5uCWDRx7QDsYlWwwJZmDgkXBNUYSsp/MZxMkAUHhM4Kf
	46JMV290EoW2OJ3HZdrPsNUId8cL3uDoMryCBcJkNm8xha1OWYFu4GsA5TDIeFvoV+gwC+ogLpI
	KShwGrgj3EXiw4O5lJulVQS7Ov2R6DTj2XXHTTB5UnhBA8abivNn9EUI29Omrehgtxyl36RWN//
	6+TLarA/JYfPwjJw==
X-Received: by 2002:a05:6102:67c:b0:602:7589:6536 with SMTP id ada2fe7eead31-62ad2e44437mr760331137.2.1777567716294;
        Thu, 30 Apr 2026 09:48:36 -0700 (PDT)
X-Received: by 2002:a05:6102:67c:b0:602:7589:6536 with SMTP id ada2fe7eead31-62ad2e44437mr760325137.2.1777567715784;
        Thu, 30 Apr 2026 09:48:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d919sm18279566b.23.2026.04.30.09.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 09:48:35 -0700 (PDT)
Message-ID: <5c838838-00e5-45f2-9515-edbdcddf50ec@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 18:48:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support for Lenovo IdeaCentre Mini X (Purwa)
To: Mostafa Saleh <smostafa@google.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, maz@kernel.org
References: <20260429141815.827157-1-smostafa@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429141815.827157-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QUkDKrKmFljWSq7Tg4IU9CL_mspvuLzZ
X-Authority-Analysis: v=2.4 cv=dOyWXuZb c=1 sm=1 tr=0 ts=69f387e5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=yZY3LKPz1QgPfZ98hF0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE3MyBTYWx0ZWRfX9sGP9og5Wf+Z
 8CJuGaaikkXwASyArvA6mHghNbZJ/r1CC4d3ijbDQS56O8ddKjADt3vThElXwomut+y9Wt2UbV5
 ne507wrfGq0s9HqpZ8n6nOU8g2lcLbv2X0sPx1in6C1iwU7v59JqyoP4h8326PxWkZhBP3aLtVx
 6Ceus+cQi5kiU8i9CM5ftQVvnbnPqy+2eBki0XUSyhDalk+zjx68q+ZHEyiVmliT2Q1Q2HJ/prt
 /aEfpZkZknu0go3AHULtGD4sIoZAccQ087FIdB5QDakG04MWbjIduQlZFP7wOQbZwTnkmztK7+i
 qZdDF9cpfsHlFKmrwK6pcdszAX8y6KW+snfVnsVafUYgu1VokBOzg0PA2aVrnOfIqwoy9FDdOZA
 1T4Jo0cAMX5yslunSQV45yQoYOIhqEl/a9+WDmIIexQ1GI0ycUw9zX643IkG50GzaUqG2sSQGia
 dcdGyB1E3Txa6fonN3Q==
X-Proofpoint-ORIG-GUID: QUkDKrKmFljWSq7Tg4IU9CL_mspvuLzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300173
X-Rspamd-Queue-Id: 7B3654A616F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105400-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/29/26 4:18 PM, Mostafa Saleh wrote:
> Hi,
> 
> I see that recently the support for “Lenovo IdeaCentre Mini X” was
> added [1]
> However, unfortunately that doesn’t work for my device, the board
> resets once I try to boot the kernel from UEFI.
> 
> I believe that’s because it is another variant, as I have been using
> my device tree for some time[2] which is hacked based on the crd
> device tree with some trial and error. With that I can boot with
> PCI/NVME/Ethernet and USB (there are also some other errors in the
> log related PMIC), this device tree is based on purwa.dtsi unlike
> the upstream one which use hamoa.dtsi.
> 
> Are there any plans to support the Purwa based variant? I am happy to
> help with testing, but I can’t confidently send patches as my device
> tree is based on trial and error rather than a data sheet.

Hello,

could you try

diff --git a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
index bfb7cea56df9..845f303c3836 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
@@ -8,7 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "hamoa.dtsi"
+#include "purwa.dtsi"
 #include "hamoa-pmics.dtsi"
 
 / {


for starters?

Konrad

