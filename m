Return-Path: <linux-arm-msm+bounces-119128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iGM5MrfnVmrvCgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 03:51:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B37A759F6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 03:51:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DUuHnrUK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="JSJyoxI/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119128-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119128-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06524301DE07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 01:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BE5388361;
	Wed, 15 Jul 2026 01:51:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB943381B1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:51:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784080306; cv=none; b=ThcOY6lpRCszHlDLMYZZSrxSLKLwtai2fOamSQmim58fPhz2ZzOd7tpGa9Em7ggFelBWBQj7w3pdUtXRL/xEClUjeijWembPpVe7WjXszoch6u+73LPyTgOOHZ83so3zo2rcWie3Y2sQp/8E5QBnS4tsYpe6bc+Afao9Hnymjrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784080306; c=relaxed/simple;
	bh=OkrrAHAlrssxjFhiWldKYAqb62cke08knMoI21r7UO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZVg3BzXm62OLg9l25DA06uunNtTL0BtBXqIWP5ZUSeN1mrxUCaLuO0JAcbshppAvSEPn/Ut/BChn7Oay9eAgWCqmKtGDEKU7CovqH6ifSC/jxAe+XaMzbBXor5LsLpENSigU1tfsTXV+3IY+CC3h+J3YGqnpztDUjf/hVH4OqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUuHnrUK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSJyoxI/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IfXi2049825
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8P7yp7jCDHdFfFLTkLuS4zg1CQWFZg8vZdY/h1ViCM8=; b=DUuHnrUKvlqMlzcb
	i3U0PaJsW1jb3ndhXDjo7Jh2VHINsbNgJuUnMwjUJHtR9DiT+tS0L0m/Oyc2Gu+Z
	GYgWdOwNMCcvszHICKyOQ7yqaqylyI8sdVGe6XdjR4di0XJ4AiMcTilKrpoi0TWP
	mEWO4rThpCIgnu4RkIwuuMgc4HlVn21zfUgvEaSheUAjHJmu015LrpzF6W8fxhTK
	XK+QoEs5R9kYjQe4OEhBZBI1FvwcbgsfRTc0mSeJhiVGo+sUsgPJAvJBHU+rWUFo
	Q24Izrwa7TTH1TNxxBKsUNztOaPM06Rw+AwVwsfuZHcFA/Qa/MOQbwY2hFkV15Fl
	4BPYNQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk30knd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:51:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so2122789a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 18:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784080287; x=1784685087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8P7yp7jCDHdFfFLTkLuS4zg1CQWFZg8vZdY/h1ViCM8=;
        b=JSJyoxI/FsjFBmoIyZtscFQFfFNCHkwwSJ2o64o9j+4RXcLDe5ccrsYMjoD/XzYjvf
         T73TxxVUKORzEfh1cKmorFflC3x5iStxowguA4insgbOnYQmB66dgG68LtgakCwvCQu+
         nFQzztoxlqpAvPTIKWWqakokVO5nizg4j29gC959Z+Wl0XKlxvD2MfFq4QP0qc4Bxy4A
         +X9iYvezEpGJR1nhAdHPDuZvOVlTMVm/V6ma2VwT5WI8ODIN+Ymmhc91romfI1CrSR9p
         KF80Xg7ONK776ztdT/pS/jqan+PfPnlIOz65/RuqEM8BCgNop3yWUrLSfdx0Si4WLnnj
         KpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784080287; x=1784685087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8P7yp7jCDHdFfFLTkLuS4zg1CQWFZg8vZdY/h1ViCM8=;
        b=ozdYnWX/8C0xF8Q+glffVhq+AJjUVR+5/wE4gH0YmXF8TCf1JKmPfBPFxjq1MmKexk
         S2bpDOh4aG42LoBRBNEtm98v00GKRll4hQYxWxs+76pr/OZBLRBShUD8FfRTYavxzl6a
         UytWKUgrqj+5NtYPr+pbVvZ8yZZxDwsz40dYbeGWKKG5qUSJ6tH3qiwoz0elRMOBpYoN
         F7G5vZ1nObZj/ZWF5Ifkgn9DT96Sf7Nx910Tn5vJUH5f3MadH9FCH0E8/3+7Erbpj3CD
         sgrKhbazqjqfm2vuXLdNu7nz6DyfKfc0ZDEmkAW2C2tBA7irGlPbnR4Bn1uDfLUX7Lri
         +rvA==
X-Gm-Message-State: AOJu0YzJ/ReB81sukXV9k1kC6jB+1s9OF1+0/vOtBTMQyzc2PENvCMN8
	XRWDRo/fiOAsKZec5hgHTuHhCaGqev3z66iJHMyP8Oh5T7HfJ3rMRXrO8yVmG1A+SZUfM9XSbdc
	+/iNGTIC+lWtRRD+FtL2obwOB2oP0VIFGB/DflIq3ChozHSlzDt8GCcfQMd1pQEohlMvJ
X-Gm-Gg: AfdE7cmoh+kviLSqFLK/sPEsnCS9K5wzIZ3d2vf5Gh4uapBtssbM2IjFr0CZtayv7uf
	2yCDl0eyYN9dn7lH2+g4PRoyUcs0Pvqp5drAdoG/xai7i4OQe14XUuUUZ/40/j70SmK3H87gyDV
	1VOlRMoGIHappyy5tKQNVGGx091aLRtHeJLziWr/NTEXaHnJJew44lhxHSQuX2+UxhMjGuaJfyo
	FKl8wdFjsek6KMYP0u5XaKme8ggeAQ9Z2aczoPhVROoSjsRV2r8KqNKk4AJFRcZ7VpwpSwK4Ge6
	mnhS9r+pEcU7r5yzV+dcTz+9ApbtIZ26pOJ9Wk9YiLlbXcGqp2vETgioCL8sg1RiII4EZSkvLWv
	sWBkHjBmLGJNI/k1vV+rWZMaAPo2KxpVe/O3FkqtLCr8UkKIZJ17SE5vherbioEf2HTgjJUeO4Q
	jRHEdC
X-Received: by 2002:a17:90b:3e87:b0:37e:10d1:c05b with SMTP id 98e67ed59e1d1-38dc7b3f855mr14847664a91.22.1784080287401;
        Tue, 14 Jul 2026 18:51:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3e87:b0:37e:10d1:c05b with SMTP id 98e67ed59e1d1-38dc7b3f855mr14847651a91.22.1784080286863;
        Tue, 14 Jul 2026 18:51:26 -0700 (PDT)
Received: from [10.133.33.197] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e174442f6sm2278319a91.10.2026.07.14.18.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 18:51:26 -0700 (PDT)
Message-ID: <74e3d32a-0b5f-47a5-97ac-388404602869@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:51:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: interconnect: qcom-bwmon: Add Maili
 cpu-bwmon compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260602-bwmon-v2-1-d4a851c45f37@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260602-bwmon-v2-1-d4a851c45f37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a56e7a2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=x1iS9OEPbFcJzOgkp3wA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 6t9XAPi3214ZOy1DXiWuZZgD4xTuRJ2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAxNSBTYWx0ZWRfX9pV7SCyJwrx2
 lJzN6HIhrd6GZuNrmIeRxxtuzeTCBiHpewmbBtTaNRld5qncdUGjw+1ZJjzT8WyJ/2njwG9QqHu
 lMfQDrXYH87LIgED78fbVOFioA6oIEEYarKiR3Tw1/QYoUE7hqybYowJtbVr0YiHEZYlMsMgWk1
 P/nrogqICMApnbU1OVTT932faw5AkDVcW28UiN0Q8jl0hwzraGgvaWmHaEpzoS2uEolOecZxs6y
 wKltaHKZeaz6EZD70siHIcsjbKfJ0OIzhLc5PBxfwI7fKmOU+ablcjlL195HChUQXDma4vQ328i
 UoUazkhLDbP2oQd/6PJ3F8JxeUzb2bZBHfPw6bjq/+vCgaeLo+U1mKiWAPj86+tl7NrsJBsNdrb
 GuUPmx7Yy0ap8tPVRcFK1nkaPyDnkphdMEkhEOH6euZA8uie2wcEg9FKyYgiQhEExwbFa3nKpPj
 HiM6HBJMQoEqv7mZXbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAxNSBTYWx0ZWRfXy/wo2F3a/FO6
 hpgS4FhHSx2BA2O1FwIue0e0VI4TFzWHQJjtgWA/wIYWjVngn6TKVYTp5e/x3BN5xAgnbY1WIRJ
 0hR7W9FwiNu5kFnzfLOCIdt2OoSAt7M=
X-Proofpoint-GUID: 6t9XAPi3214ZOy1DXiWuZZgD4xTuRJ2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150015
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119128-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:djakov@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,msgid.link:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B37A759F6A



On 6/2/2026 2:54 PM, Yijie Yang wrote:
> Add the Qualcomm Maili SoC compatible string for the CPU bandwidth
> monitor (BWMONv4). This falls back to the sdm845-bwmon compatible,
> consistent with the existing pattern used by other recent SoCs such as
> sm8750 and kaanapali.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop Assisted-by tag; no functional change.
> - Link to v1: https://patch.msgid.link/20260525-bwmon-v1-1-b8f6e189c3e3@oss.qualcomm.com
> ---
>   Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> index 82b1d94d3010..7989db1aa774 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - qcom,glymur-cpu-bwmon
>                 - qcom,hawi-cpu-bwmon
>                 - qcom,kaanapali-cpu-bwmon
> +              - qcom,maili-cpu-bwmon
>                 - qcom,qcm2290-cpu-bwmon
>                 - qcom,qcs615-cpu-bwmon
>                 - qcom,qcs8300-cpu-bwmon
> 
> ---
> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260512-bwmon-ecb43fda63c9
> 
> Best regards,
> --
> Yijie Yang <yijie.yang@oss.qualcomm.com>

Gentle ping: could you please applying this patch?

> 

-- 
Best Regards,
Yijie


