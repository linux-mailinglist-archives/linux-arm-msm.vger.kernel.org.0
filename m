Return-Path: <linux-arm-msm+bounces-103248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PX1LTZV32l1RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:07:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 128ED4024FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DE53301F32F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 08:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151493D5230;
	Wed, 15 Apr 2026 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBmhZGsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOwAqo5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30513D47AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243565; cv=none; b=afilAIFptjgqE9qIb1YN81J6/i/iZyWLoVwkylJq1eiLi/SPEpUWY2eT1Tc0TZ/LBKKdnifA4R4Gnnt0WEFrqCrHoDtADKUmBIdGKGlqXT2uqTIdA8FYFANeLfQTlCGdzFc9b27n3YwtkMHFUS+HON8Z4UvQxaPpP8XN0q+4vG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243565; c=relaxed/simple;
	bh=kGld0xNfDz0zDVpiCsicu7zkr9o5D0sKwZEZ6dZiTPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmTFLdWJ4vqSI1O3QJS08vhhoQsL4dirBkMFgkG7zsBrhF6xLMvJ322T+VlHuaPKRuy0hwB3+9ZffcOULn+1KOpbsFXaSEr6pPAk5jJz6AtD1Tc1uKYY1pTttXb/T+hM7ih4ukGIf9WMxSxWaIRhNqUKWGZuHGIxVHFFiIwfJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBmhZGsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOwAqo5B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F2huEb1778940
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fuHeB8k/Mjlbeb4t9l+3i5xFCcgNDDnedViyIzx50s=; b=aBmhZGsWbc+vBlCV
	VqEMSS8q4afL81ytUaQ/8FRL0x+OzOswgXXtU4OlLZ2E1tdOOJrAQC5FCwHOMheT
	U+ehyjKbnUtuMR59E8Jy83H12TifqkNsu5ysmC0mDja8m4tmZBqp+x2Z4Y/BBG4l
	Jaiwi3vmftUu3v2/DVfpJ1dVw3KmHgMh3afGFDlw6T8MKsOjI6mdcYX2vCnoYokK
	mD8eEN/fmhNzUwQM/QC+nsPzwLJHzQHpndfmvT9evRLyb4JrqJlGZsBCWAj5rFv9
	1UDlIYZOqp9870R+uHIZzqP+m/yU0acamM680lDbUDg89/d82Zpsnb7S8cWhgPvW
	g8iV8g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw02vh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:59:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso58114531cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776243562; x=1776848362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4fuHeB8k/Mjlbeb4t9l+3i5xFCcgNDDnedViyIzx50s=;
        b=JOwAqo5Bsr5g5/K0iiV5pmezNSkG/vEnLrJWLiHYj8zZzIh8IVq+bYM2x4m8EV4OOP
         V6FAfvIFeVdthF1OMga4SzUijTDER8pRqhE+0aS0n1wEp7e6ks2N2Qsw0UIc/o2BBTAO
         JbS3BgT+Vys5RQkFWv6MSe3KEwqlm2ses1Dg+vZIIkChUhBmPwcbcJjKTsBCmbVoRP3L
         mpYWlrkHS3VfMO/vEJdOQVjOgNCGUmnuGGHi/abQfCF+wSk0VDMQDxWwIJCMywiErL6k
         NAIWIsIkhq8qK749P3LNuoxnJnF3XwhGW7giIo04gXu2JhzQFxO+FpU+uyVYcGLjnZCX
         Cvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243562; x=1776848362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fuHeB8k/Mjlbeb4t9l+3i5xFCcgNDDnedViyIzx50s=;
        b=g5rYSyE/+egAxNDis9XSP0a3DoD0Db99+C65Sh3eiEoQe4ubnow0EOV+76H1YQbtPO
         scOnoVewHZMKE3kckKSWSMxTm124infXC04zNaX38krTQ3VbiFnOQSsKQ3WmaE1irl+x
         DuXL0n6kfZaBSahffEMzJob9tnVldN1WOgqFi3ggsWi9nE7Q8ApfyNvuLMrHB1xUk4/E
         t7AFBYFn1maM1KduqMTL2o7JAz9acDkHt8KG4eRlpJLptFuRRgF2MlbEXP8XalvdcUrX
         7UcIiodLLzNjsvB0MsR1us7/OJWpjjPJUWDXCEQb3/cvG7jRhnIHbx9EIUZHVzPlaPt4
         hl8A==
X-Gm-Message-State: AOJu0Yy+cRhJ4OlrPEgPM0OoyRVsHiECR7AQBdoBHcRjfF/88lHZPO1S
	VK+Pp896TAA2i2d5LBYPSFaawnQrvQjYeV9D86tueAK17xGtFEjqADQ9f8TWol0Mw0FmeMX8yhb
	EYdToccTf0PxTHQAtPtzMoyDIl6+cCrEEbYnq8oh9DPs5Y8+t/x6bdS7XygWcGXmqFGRb
X-Gm-Gg: AeBDiesxwmIF3nneNZm+nvqKLLSkTIRxX/CI8WiggW5f5cH9TMW7N/AjUeHkPjOjr4w
	gWkmLVGsjLbyPVsazOE//yi6pohqkgnVcUBpjcKdjFql23lkaLHkuye9YPLZzYmCxMAZoONJ0cp
	DSEDpBrxO8HbhsdmfEKos1gLoCrsUdliwvOdfpTg9TyrvK8bHVTf4BzK0NUDjbxnvFGrR5CDEGr
	fYW8hd3lyDJkHD0QmExIRibyArJsQsax4Sh7ph6YVQNYGK9dCwL0RwpIiJjeQ+uXuRjR7PXAbHh
	BubAZgLXvs+PiSrkInErS+ycSSLvFYl3gSrdLWtknq0/YVuiA4/v7d1CblNudkcE1k0Ti4sbxpl
	6d6zH/4cBHcZSpR/2VH2AIk76QaMfS9f1FB3tmm7pro32Ev73V/Qa2VcfgpGRklhiimWb3a0LdH
	leRxoJD+NJ58Sg4Q==
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr14268251cf.4.1776243562121;
        Wed, 15 Apr 2026 01:59:22 -0700 (PDT)
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr14267921cf.4.1776243561646;
        Wed, 15 Apr 2026 01:59:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d789a9sm236176a12.3.2026.04.15.01.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 01:59:20 -0700 (PDT)
Message-ID: <780812d1-f6ad-494f-a323-4b7027a715ab@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:59:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop RPMh CXO clocks from QMP
 PHYs
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l10wZNEnfKYPGBSYrv-4vkPdtBJ_6NA1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MSBTYWx0ZWRfX1DdhgDpriG2l
 sXsuLgQAr5Oiafy9BlZ80IEozcODp9KHxAACcpI9/UQsKXfuBZisYvGLuN78TpH3hpQy3o/d+qr
 nPCig2bbvK6LmhEp8YooqdVkXtVTDapKcUQxPqRG63a6wzqZCPcPyRhcty/2qfBz6PDUpFfV0/0
 rN5b0bqFpQU8KsYj66KkhbHu2vIcqlokkNWHMcNyK4BNyEUOKvaBCr7huhG5kazS2EVC45oDgyi
 lrWtwOohnv+KSGUveQ5U8XDlcXW1qv4N3VqDyGhdiPWUrY07T5RPE/xtR3ZDEMPUvBP23rYuP01
 gjh7jNC0x6YcjrYyFwJ4T8eGV/iIqn4jIf3zZ2axiqqq0zITkUkZhJyHuRmZWVbWr0RePDUPtp0
 rh4AQPulWIBiU4Paev8pz/pVhvHbqSGzk2JnwjbLsOqLE5TxrQOvwbCO9SJ/6bBQmsykABTDeYg
 uzijanxf1Nz6AmHQATQ==
X-Proofpoint-ORIG-GUID: l10wZNEnfKYPGBSYrv-4vkPdtBJ_6NA1
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df536b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GxPRKtRK2lFiV6y-FhkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103248-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 128ED4024FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:05 PM, Abel Vesa wrote:
> On Glymur, all QMP PHYs except the one used by USB SS0 take their
> reference clock from the TCSR clock controller. Since these TCSR clocks
> already derive from RPMH_CXO_CLK as their sole parent, there is no need
> to provide an extra `clkref` clock to the PHY nodes.
> 
> Drop the extra RPMh CXO clock inputs and use the TCSR clocks as the PHY
> reference clocks instead.
> 
> This also fixes the devicetree schema validation, as the bindings do not
> allow a separate `clkref` clock.
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/r/20260410145205.GA554754-robh@kernel.org/
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

