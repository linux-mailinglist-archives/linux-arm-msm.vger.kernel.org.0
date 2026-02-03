Return-Path: <linux-arm-msm+bounces-91622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KObuB7a2gWkrJAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:49:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E7D65D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BA553021D2D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 08:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92243366834;
	Tue,  3 Feb 2026 08:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ou7lfahf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNPQWllE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F31392836
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770108590; cv=none; b=TzzyFHNadFSDFQwO4WDA9BMg3m0lGTKdMPSSxq0i0gCuEqXT7VE40XoYAc9MU+QImtmfirnAT46Efzc2nOV/GBfKDd3whdEOtwgwQhebeQI2Lo4TmrYNA+7rD0NJjLAqoSkA8e00tTY0rpN6RHwykx+8wer8wnSy2Y2kaQVlhFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770108590; c=relaxed/simple;
	bh=1kvvC7r/CfxAKk9jQZKpgrqBe/ARXJe8GWOQjSOSroQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kp5urULEnZXugPJarp7mOG+wBq0dzgobhEYj7CTI7+217w0H2ZqntrMzXmzQG4bLWI//LuYtwIk4pAnD46eI8fJx1S00O1PpG3GVmiFu+ZSgqldxv/dU2tGP9OQRWAxqwALEcixAqhArkikRRLHK4BlwbsbR4c77fa2KHOrLaRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ou7lfahf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNPQWllE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6138nm57848291
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 08:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jF5KKiYNyFON31AhO8Lw1oYW4SyaO8F6HUHaGcJHEX0=; b=Ou7lfahfx8c4+QwX
	8R2oFwnwLAqBFRXXKoBDx9e37L70hqG2HLb+S8vj96zoCnXHObcJpw1QbhmXNJKt
	4dgM4pQhk7sU9Zr0VmAUxM1w9BNaCBVUivbEalLIrm8EUwFHa41HbMIyjtc2l+wE
	sSiAUpa+vUehWb66h/IrU0l1ljX3nIVCF+Ht9SXorgmObQGi2HWbqSAgOlfwy9o9
	kCHwxIB4i0vXRIfm1qNqkNYfX82ECKySH5i5+hko+sHPH1IHTn2AxJc7AYIbv7Pu
	IjvOBkAafWmoxBBV+mgzKavfk1G2P56A+PV5qprjwNmWqj92a0xU2CAj0a37JP9a
	DcwgGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutg004-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 08:49:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2fdf3a190so53511485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 00:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770108587; x=1770713387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jF5KKiYNyFON31AhO8Lw1oYW4SyaO8F6HUHaGcJHEX0=;
        b=cNPQWllEyqLFNKg/z+x5Zy+s79TrlSdMuvWH+hiEXde+oBmD/oW4lLYnCQZ9gud94t
         17//NYLJjCEt2bHa0RltJqpHj4kf9vmjxdYW0KP0brDbzjHPx3hmrNYqXrsQEF/8Fr2S
         Xj5jbXwsbW8Utc+UQ2R5N1BbjzPkI4jf8LLtO9FtuXmmm853mp6r2HUkbAciQZnR4AnL
         NJhdKISx8B/crKktNBs4BnKAcmembHBZVM7POoatOqLct8gFHCrvg2BJ9kgtqkd3/8S/
         xO8kFR87hthT9LWGqcui55Z6vgswIsfKKuFni8WIQT+FSW9wViPlYpjJrfDgsEXeTKuz
         x+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770108587; x=1770713387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF5KKiYNyFON31AhO8Lw1oYW4SyaO8F6HUHaGcJHEX0=;
        b=GuKquEnOnpK7mAqs2kvHKak/guQvvUVkb3VJj+fgCyRrf8nrEaBj58AoM1Y2lkKalY
         HU40d7erKOlYChqQ4jPf3k617a/AD5jujH8vOObedw82DP6cTqr9zchFcVvKBIG8L18L
         R9PEQmEVRQ32ny/zuRFjtlMxcJKn4+bkJjPcDwn4PRkeaelxahFCwLgl0GE2DIHnBvPF
         VIaZDT/TpReKapC6WOf5DwZ9ISLXzxvBHxwNOZ/lxFiU9N5eT/GNOg74W/8qQjB1isKj
         hT6IJrvELu09Ter9GjXBI+G6aBL3IdWKwxaEcauFFoawIYhQthIfv+inrqAIDYWX/mhE
         C04w==
X-Gm-Message-State: AOJu0YxgTvqd/btHnFbQz9O8hondf/WHi537DIBgicoY6+68XCybgRbD
	3IQYB2lPiMjUPNpfIiyJuB/VNOdQ42EclCc1FZCmFXg2FC0csMkkubqfB/LFZTwI+2ExpVzAEe2
	21icEP2t+w5XLrWUkzrV4IEcR4ejarnaJbxxQF9mRv2zgQ69FMOOiRNtQPyPJD1F/l6Jo
X-Gm-Gg: AZuq6aIZRyXnpvRubNNLcOVGgr8pbATmBKHxsBLQ5odvBCIZ9alPtnXzUi3xeFthGBU
	20wiB5gjddSFB8wdAEC86602yRjLuANt+WckK0uDDw4jw8X+tLQTco+VM10IuFLUqnuuxzREyJ/
	KMrB9S+eDCR02cy+K0d1AQ/YieeiXgHXkuJFemATnh7zsGgNCM6h7WRVD4a5JBi1zQePOQaUiM0
	HTG3sMI4TKfdI1KHnp1brGAlSfIPKD3qflnx+erLJzvACwxQNTBfXQ+yTK94sD3LTvt8+9igeM7
	XvYejuao7B6yxWnBSFqTGCC72j0sPOtoJ/aXcFKbOA4ImQ37323iQf/uRmHIrJwzmgmFla4i80i
	Ekj1Q4clx5LXEQ5FNws5M5HpEl1Wy/xYnok8PFrgO5vbE9hz9O/DYYQ/TBVK2nACWnE0=
X-Received: by 2002:a05:620a:17a8:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8c9eb30974dmr1381396585a.8.1770108587162;
        Tue, 03 Feb 2026 00:49:47 -0800 (PST)
X-Received: by 2002:a05:620a:17a8:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8c9eb30974dmr1381394885a.8.1770108586765;
        Tue, 03 Feb 2026 00:49:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f1f55sm993426566b.70.2026.02.03.00.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 00:49:46 -0800 (PST)
Message-ID: <ebbcbb07-f268-4041-aac6-d81d6489201f@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 09:49:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa: Add remoteproc IOMMUS in EL2
 device trees
To: Xin Liu <xin.liu@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260203063244.1498699-1-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260203063244.1498699-1-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA2OSBTYWx0ZWRfX8oPqglm2Oo5Q
 pPjVaI+sSXZR1a7lGjy24TQKuRv2KBD1+IXNVEeSHmoafMYtZ1/SbfbHbAg+r9FbHCG6eCshQwJ
 IpYiXytl5wr3vF/Q1RNZozx8P3lnmlv3sB0Sj/Oh0Maig6wN6NOWyFbZA035B1+JsLXGg1vHnTx
 NYQhiXx79Kx+a+IV0zlLjOrCEfjHN8/enoLlU6d/MDqRPZBSQdbzVlae3zH3CR1unslYP593PyG
 6K+qGCrz1vovNMPWlezSR/IgWezKvFLZhaLkjxWdicYay+uxktYajbEPiYr67rY7gHUrXbsbbsK
 PAg9FNeY3QCg7DGW5tLBAKZsS6zK/L/nFUaMJC9inJwfnE83R8IgjkxmtwynhbG+bd6Zw6eL+ue
 nsH+XRWncsV53ZoS1okE0QwXgGzK0pPua4yOtrbZAZdaIOqhjnHy+3qzFdHc7I8I95RlGlMMcfD
 kIDWUrEIwtgbbgZbYkg==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=6981b6ac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-wK_1IhX3kyHS1aeiRAA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: SbH9PWc4WCDs0SqKDUAzkPe0DNWYvbmy
X-Proofpoint-GUID: SbH9PWc4WCDs0SqKDUAzkPe0DNWYvbmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91622-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 874E7D65D4
X-Rspamd-Action: no action

On 2/3/26 7:32 AM, Xin Liu wrote:
> All the existing variants Hamoa boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on
> those devices. However, it is possible for us to boot Linux at EL2
> on these devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU streams
> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
> by the consumer of this DeviceTree. Therefore, describe the firmware
> streams for each remote processor.
> 
> Add remoteproc IOMMUS to the EL2 device trees to generate the
> corresponding -el2.dtb files.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---
> Changes in v3:
> - Modify the subject title

FWIW subject and title are the used interchangeably

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

