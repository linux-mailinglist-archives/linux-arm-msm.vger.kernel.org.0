Return-Path: <linux-arm-msm+bounces-107933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEG9LsYsB2oLsgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:25:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A0B55156B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8E75300736C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B03374722;
	Fri, 15 May 2026 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+HNLWx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJU6NbYg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B126113B293
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854974; cv=none; b=nVuyMloUhjiw5Dsx/VN+ntRD5AFCnQc+Z2GctnIu3ahSxlgDzSU8xrDVn8xRAVXSkNXYXe2qIij5eeW4itCngAAUw1GkBBZyFGUyechYj0Ki+8WOadh7BsiDLUDTXqAwQmX57m/7V2gs3v50ytfvAscNcjp70IQussnILY9Z2Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854974; c=relaxed/simple;
	bh=vg7rsFdmrkTWiZNtp5qMnR7zjL7mLG8s1Cu9e/+xksg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFujWOwUgXmgupmy22g7Okq/L2isokPxE6vuQyEtfgyH9okuCDpwfJVONtD6tA/ePaXDruCr+9X22cMMsGm3lOUUX5JscJa/BqOaog8lEOWu8Uc7fZG+67EV+A35J0rfxSKL+NQa1sTwmi0OlCrPrJ+w6+7rrk6j0N5vbX4qE1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+HNLWx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJU6NbYg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBJPGf3200281
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 14:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwgI4gCOFcfcSUDdRJPuf785r1N8oM5gm37xd7VD4IU=; b=g+HNLWx7lFuEr2lr
	i2DRUJKq2O5DpXHZkJ6ciinfLWRpDGCRe8YzfUjc9VF8Ln5EPlpXo16OcVHbAAfH
	KjR/iXDEVPVK2VY7s/QYODuMwJocXFS5bEEpZQvtibNCGFwKiGS7jgqgJdsRFUtw
	FBy6P1zRCW3Q3zG+Pz/qSvsTaUI60YFJ3qpUQWk8KfJZvwaMlowmNQVVc+ACszrd
	1B/bOdCR7dfns/JoBjaf/Q4Gkz5zLS0067f3qzqTA/cqFCHQVxkMrH755O1VH5gT
	LSe3eS2BGA+//s0hSHlpKTIO07CI1rcW9VlGZxn52CFCzu7knCRyz0+2B/NGIzNH
	PQI0iQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1quhxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 14:22:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ef37c3f773so10700629eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778854971; x=1779459771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwgI4gCOFcfcSUDdRJPuf785r1N8oM5gm37xd7VD4IU=;
        b=IJU6NbYgFtNoKWiQO8l5QsGVAiDuAFMFNXqnzMItjysQg+0vdK5QM9E4jiHqjmXf/H
         lRwj13xQxfMfVUCEggJ/rslcCpVw3wgrQezO4/pgaOxfePy+5P9829C6hM5Se8a+Zcpr
         iW7ZGKM73Jz5gGwEE3y3U99z5GYyxxNjoKxorKZ3xZIkBZnlj6rDv8oEC5rHMFaGcm5I
         kmchnuXgOGhOTlUZKAFjpZ9WEDiw4jQ2dYArw2ay2d5SRh/eiltZeuXaWfdAI6ViZcyD
         ylN62iWbUQk27xGH9mG950pNl1V9De84sITefOgxA3oFQBUMMgwMzXym1jbhm3hJ4u1d
         M7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778854971; x=1779459771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwgI4gCOFcfcSUDdRJPuf785r1N8oM5gm37xd7VD4IU=;
        b=kCTlTofza7RfyqEaELh+9W9DUgowUDjeMq+Iiyc1n8NIqPn6n6Opl4mmMH01DO3Q+f
         DDT79QAJkOrxGPsSDq5r3QZAxTY31W0+ePkT4GB7STguA3ToZyyU42VqVByWV6Onm1IF
         BBmI6AlJdXjhFLUJzld3oS+IRNCTRxiu3w9zLE2bwIyyhIk+PhvVm5hTZziMghAtmdT5
         bb/oN33zTGQ+ufrHK7TCbOCfQnoI4aKXrZmM4moJSfv5qRZzK4BrpIk7VePabSoj2FN8
         yMc5RNdBtScVqT/dSc0VuPtbEWCK6mUSbsyP6XR9QylW2FEuTvhLvBGC4HIZCwDAG77+
         a6hw==
X-Forwarded-Encrypted: i=1; AFNElJ+mp3tUN/C/I5NrRcEbBiJme1dFsMqJL1UTEQngC/tilHinZAwZmWO8N+YEuTul72B4YlGpTbelXuqyXYdY@vger.kernel.org
X-Gm-Message-State: AOJu0YzfeJZu+iqBPfqOK1otWEHoo5fPw1C5SEDKuSgBgq7fbGn1jLB9
	IsSkP20TRZyIBxTXuxAS3FdcPRkF5FkHYYgDZAGW8myKyZPEWD7Ej8oPf3GDtQzDfJNJEMN5g3y
	wbWmKKaxgCAG2cKKnsbYvoD7CQ/O4qUBrpnonXlcmVjO0plp22me/UG8o4kc5gMs/7Ors
X-Gm-Gg: Acq92OFeVgf7wjbPTqb2riiGUJseXbaEFQcxQ7xgc5D1EOOtl4X9HjVA0clf9xOZX1w
	8NUV8AZyZAYKigWgIG0JAUF/AgrDJ2k8IqD/4Q+b6LMfmMaL5OVh46+7tu/lLXCZT+L496AOolW
	AZuWh0NNSDQ/JADca/meooGQEBZ0d+L79kh8OMX6LUUKUFlpCEHAH+lOOh7xV/8sIZ04uZt1k1C
	OPxh7bVeyYCxVW537ozNVh3qeUOvuShDk7WBH+0kTQYPZ4111lNFndyoYWZ80rhEK2WTOlydX1o
	qTzkEWtxArJ53ami+Z4f73Voj8JVVrFRRrk+CtrdYbV6uaHUXD1lyDjmhzI0wcSbcqW8AScfDzm
	Kerz7Rlhg2K4+S4rUm+9Lwjbq42VQCuVh+f0dbO7ssIgU1wcc6CjuYywDT1vAPDdsikuJQmhytt
	5ITMxH
X-Received: by 2002:a05:7301:2f85:b0:2ea:cd38:f921 with SMTP id 5a478bee46e88-3039869ffffmr2132119eec.26.1778854971060;
        Fri, 15 May 2026 07:22:51 -0700 (PDT)
X-Received: by 2002:a05:7301:2f85:b0:2ea:cd38:f921 with SMTP id 5a478bee46e88-3039869ffffmr2132069eec.26.1778854970441;
        Fri, 15 May 2026 07:22:50 -0700 (PDT)
Received: from [10.110.108.188] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500a97sm7956995eec.9.2026.05.15.07.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 07:22:50 -0700 (PDT)
Message-ID: <01578e6a-d10a-46df-bb32-fd45ecb365d7@oss.qualcomm.com>
Date: Fri, 15 May 2026 22:22:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: ice: Enable PM runtime for ICE driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
 <20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com>
 <b07a3634-a7a6-4f28-994b-fc900be26879@kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <b07a3634-a7a6-4f28-994b-fc900be26879@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a072c3b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LBsR1RIUYHBeOwdxVikA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ShtVKFmSnWtTmg5dh8MjYGSEoSUrQFHh
X-Proofpoint-ORIG-GUID: ShtVKFmSnWtTmg5dh8MjYGSEoSUrQFHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE0NiBTYWx0ZWRfX2lvBab6YRNc/
 qjaeGA4ZA0/oUkkHRiy6KL834Av+K1yN1R8p8yw3BDZZ74+nLIsUtLFe2JLgt0ZHAjRwd3OooTN
 Nrb5zEfIIfFlUyb3k4dxRAnWNOk4XVKeI1xJwhrB0Yy6M8ZK4+RLzK1RV/ku+2x1r1YurhIHFJ1
 t1s6PA+Q+GOGU0nfRmDl5y+ac4q/FnVQOCyeDi8MamnvYKBito+VgYCA6/MciZpDvBz4XLT8Ahk
 kdUK3KRuLO3eR8IlP65OUIQGzELvDqQEoX9E1QBSokJI3UchASmTvmo8ajMBMLeBYEPtqThJIUH
 1f1oywoxSzkt5lRnBRISb4zxaLVq5A9PLQ3CDjwbNcBb1QaqkGPI745nmVsvpaaMqyaJMnr//wx
 YoPLcx3JTRp1G+YwJrRbTVQoPaUWK8JpiWZUaTg2sJ3O1fuXdLQmnOmTtVVRnX5KABFxl0sTmCY
 /CNsx+N+mKwxJT8VGBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150146
X-Rspamd-Queue-Id: 63A0B55156B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107933-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


Hi Krzysztof,

Thanks for the review.

For the SCMI-based platforms (e.g. sa8255p), the ICE resources such as
clocks are not controlled directly by the ICE driver. Instead, they are
managed by remote firmware and exposed to Linux via power domains. As a
result, the ICE driver cannot use clk_prepare_enable() directly to
control the hardware clock.

The intention of moving the clock handling into runtime PM callbacks is
to align the ICE driver with the power domain framework used on these
platforms. When the ICE device is attached to a power domain, invoking
pm_runtime_resume_and_get() will trigger the provider (remote firmware
via SCMI) to power up the device, which in turn enables the underlying
clock and other resources.

This design follows the guidance where the runtime PM framework is
used as the common mechanism to abstract both:
  - direct clock control on non-SCMI platforms, and
  - firmware-controlled resources via power domains on SCMI platforms.

In both cases, the runtime PM callbacks are responsible for performing
the actual resource enable/disable:
  - for legacy platforms: clk_prepare_enable()/disable_unprepare()
  - for SCMI platforms: power domain on/off handled by firmware

So while it may look like an additional layer on legacy platforms, this
approach provides a unified mechanism without requiring separate driver
entry points or special handling in the upper layers (e.g. UFS driver).

That said, I understand your concern that introducing runtime PM solely
for clock gating can be seen as unnecessary overhead on existing
platforms. I will revisit the implementation to ensure that:
  - the runtime PM integration does not introduce regressions for legacy
    platforms, and
  - the design clearly justifies the common abstraction for both SCMI
    and non-SCMI cases.

In addition, I rewrite the commit message as the following to make the
intention more clear.

  On some platforms the ICE device is placed in a firmware-managed power
  domain. In those cases the ICE core resources (including the clock) are
  not directly controllable by Linux and are instead toggled by the power
  domain provider (e.g. remote firmware via SCMI).

  Wire the ICE device into runtime PM so that a single pm_runtime
  transition is used to bring the ICE device up/down. When the device is
  attached to a PM domain, pm_runtime_resume_and_get()/pm_runtime_put_sync()
  will invoke the PM domain callbacks and let the provider manage the
  resources. On platforms without a PM domain the runtime PM callbacks
  continue to perform the existing clock enable/disable locally.

  No functional change is intended for non-firmware-managed platforms; the
  change provides a common control point that allows ICE to operate when
  resources are owned by a PM domain provider.

Thanks again for the feedback. I would appreciate your further review
and comments.

Best regards,
Linlin

On 5/14/2026 10:06 PM, Krzysztof Kozlowski wrote:
> On 12/05/2026 05:37, Linlin Zhang wrote:
>> The QCOM ICE driver manages the ICE core clock through direct calls to
>> clk_prepare_enable() and clk_disable_unprepare(), which limits integration
> 
> No, it does not limit any integration.
> 
>> with platforms that rely on firmware-managed resources or platform-specific
>> power management mechanisms.
> 
> Nope. It's perfectly correct way of managing clocks. Adding runtime PM
> ONLY to toggle clocks is absolute killer, pointless overhead without
> benefits.
> 
>>
>> Replace direct clock management with runtime PM support by moving clock
>> enable and disable into runtime PM callbacks. Use
>> pm_runtime_resume_and_get() and pm_runtime_put_sync() in qcom_ice_resume()
>> and qcom_ice_suspend() to drive power state transitions, and enable runtime
>> PM in qcom_ice_probe().
>>
>> Reviewed-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>> Reviewed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/ice.c | 58 ++++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 53 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>> index b203bc685cad..6f9d679b530c 100644
>> --- a/drivers/soc/qcom/ice.c
>> +++ b/drivers/soc/qcom/ice.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/of.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>>  
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  
>> @@ -310,8 +311,8 @@ int qcom_ice_resume(struct qcom_ice *ice)
>>  	struct device *dev = ice->dev;
>>  	int err;
>>  
>> -	err = clk_prepare_enable(ice->core_clk);
>> -	if (err) {
>> +	err = pm_runtime_resume_and_get(dev);
>> +	if (err < 0) {
>>  		dev_err(dev, "failed to enable core clock (%d)\n",
>>  			err);
>>  		return err;
>> @@ -323,7 +324,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
>>  
>>  int qcom_ice_suspend(struct qcom_ice *ice)
>>  {
>> -	clk_disable_unprepare(ice->core_clk);
>> +	pm_runtime_put_sync(ice->dev);
>>  	ice->hwkm_init_complete = false;
>>  
>>  	return 0;
> 
> 
> This is pretty pointless change. At least by quick glance. You changed
> nothing here for PM, except adding indirection layer and more locks.
> Clocks will be gated the same way, no energy savings. But on the other
> hand introducing runtime PM subsystem is huge bunch of code with its own
> locks, completely unnecessary here.
> 
> This itself is poor choice and has NEGATIVE impact on all existing
> platforms without any benefit.
> 
> I am surprised you went through SIX internal reviews, collected two
> internal review tags and no one suggested that using runtime PM ONLY to
> toggle clocks is pretty pointless and undesired.> 
> Best regards,
> Krzysztof


