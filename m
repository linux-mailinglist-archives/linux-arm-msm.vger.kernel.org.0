Return-Path: <linux-arm-msm+bounces-98408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDOCGOGAumldXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:39:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D26FD2BA0AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA1A4300CC89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D6E391E50;
	Wed, 18 Mar 2026 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDu7bQQp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DV72IvRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4FA373BE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830365; cv=none; b=nxtUp/gqZGnyk/K0WAi8+n6CWkvsFZv5ZeNrSWA6CZquG+KqaeoSU0+Fc4yatZ6tIGX2Vb7ePIMz6CKZ4py3Yhhn2ldjW3zu+aNDY4ici6BFN1JahyvJ/6pEEQ8Dh3r2HMm8E/SQezuInwbdwgXNwMkQ7aToaayHl1w+cAXEQ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830365; c=relaxed/simple;
	bh=Lu/1Gg8AcMocYblP2/duop3ZtFJxThXGBBLZjOrc7z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcV1R1fTRdk6VWEEHa0fJ3Mz755Mnr95Gx2lgBhWMKsyVOvbGCOso72N9LULbZsObDcwXFaNYaSBJ+rXRoTZJtGtnCoJ1Gav4V8n+CidCcxP53NmeLVt1zH5lPufC2CR5skITqmgJTdyepJ5RydswB0/22jNrK0HXW4U5pFJqk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDu7bQQp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DV72IvRa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9tf67403175
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZHCpdutiIPCDZe+ZxRsP2OGSZ1DdSpbzypkIBafBf9w=; b=GDu7bQQp8kU3xilx
	vimp/0nqTr3r4KyTjQaIfFFSxP+/Lpv+Evn806VhWahbu+1rRNhxiauk3EiWKOh1
	Vni9DfG6utPiv9mOeO4nsocC93yZZYTUyn8aqjvvCZWerCiXy7j1vCnnDUZjmgoi
	IHDvtf75wPK0yDFT48penoWismdDG6i2y3Vm0AQsVtN4ikXnN46IrYObXbcUp1K8
	S3hpapmvBvmaak7zibxupSi1ea31CwRmDUV33UIujA9Ijv4Lq3YPajv0VNFR77TS
	qkVQeMTnCDXT5B5UwnQ+Oz4vDOHZ/94/dbMlvllGZlYrj/e/tWEcB4X5hVJkgJOg
	ia5o2w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dubvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b069bfa817so18833675ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830362; x=1774435162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZHCpdutiIPCDZe+ZxRsP2OGSZ1DdSpbzypkIBafBf9w=;
        b=DV72IvRaihcfqn8cXEfgNc9d08CkSCaO1Hic66qSh8l907OsyF53kP9ycsfQdOxydV
         2A2G/7/8LFAPPEqfWYmQwCc5pJaCug/YLniqMcVd5h6gRqdyU2MGy+gS/t5PGOUPzezc
         zRvrBI9sPvyrVm1KPM0g0SEs6tSRMHesEAB6U24nfuh8ryRyCYFiZiWWi2cqTzn5vjFu
         ZhDpVtdwFJd8FC3t/bH07/j16zVpVhGJFarcdjTkFMPPhQ9FOzZyYFLxwD6bkynTFzzT
         SS6ZBhZxChhkwxOI98QNxPzd4ESfiYMz1rv1TDTkxMVv4O0ZbIovZd3frjkWbK/WRrMP
         Be8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830362; x=1774435162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHCpdutiIPCDZe+ZxRsP2OGSZ1DdSpbzypkIBafBf9w=;
        b=nRfdwLBhZg4K/fo7UoCAzX2d/Mw/LC840xShNBzeuJ6CGab+1AguUqZSLMVfiY1jfl
         2Fq0dkNxAcusykQtDtlD1iNh0JYzhjOUKteS4IRTVJ5oQ5XkSq/ipRajUmD0AGQkWZSj
         U8cF79BhmMSF4+iCdFUQ+6V2w4Uv21naOj5RVUM99YrtOdVKDF8Zdie+ZeP2LzV6AyqB
         ljSHSHBgfwLmW5aOk25hQeKR294+nN4hBP17vaYicXcVl4XznPyCg+gBy3w90lepm+aS
         wseACTrvkRyuJdJs4/fv7QqUfWgkoIrMdYvOxfEChYicjIO30uc8CwMmBESVkIaJRLGh
         dSJw==
X-Forwarded-Encrypted: i=1; AJvYcCVWyhml3XEDD2yVY1zF/+6jazBXQpUgDyIR4944USzQoUii+1oc57mKGfK57UGSMDduSOhwq94Sc5pgCreD@vger.kernel.org
X-Gm-Message-State: AOJu0YyCTzcC61rr2PCyc1zbCG2CoBiXx70Xjv1aNC6w6fR6q9qZwHjK
	+18YjKbduKvDtznKiR68HPYKJxDyAdzJronzvetiie3sxdmUzHWcwC48s196+Tv1YitQcZ14Idr
	qKClNY/XMxErjZaUmM1zi9wzKKsBToyQ9bgXKiFeKtjr2B/LpbVHiCS6QBicztrwEOIli
X-Gm-Gg: ATEYQzwjLuXxmK/+1L0TaziEekXCoD1KHpKjktEFBFGJIqnR/K5VOa/uveGMkgpRDzd
	HfKXiKw/xrypavCypaBuosVa0NmPLm5wgQ4Avr8LMAofLSeLOvEnX1+9ia5/my4abjGMiyD1bS0
	YPGEcKU7uRGYdBB3wDIBRjtCFHOl4CXeEMruE2RF5ugxnTbX/TvDDUEzRXTu59JBl8QyQjPp72g
	XeHkPucDcP0r/wX4irL5NPlcdl6QovBe0i29rJM0CwKQ0beTaTpFy1+/ea641+njcHFHYPk1OPG
	PUA/2cy4VEuwoE5ThoKqimfKt0wBaypVer5UWx8yIecu8ax6QNDN5kEWxHKcXTLmyt3tHNtYQEL
	pRy8gMQkHDv39RIVc/Crh7LsEEudIqBe0WkZLucGHkFpl0bDSse4=
X-Received: by 2002:a17:903:1112:b0:2b0:5be9:f423 with SMTP id d9443c01a7336-2b06e40e3b2mr29694735ad.43.1773830362408;
        Wed, 18 Mar 2026 03:39:22 -0700 (PDT)
X-Received: by 2002:a17:903:1112:b0:2b0:5be9:f423 with SMTP id d9443c01a7336-2b06e40e3b2mr29694415ad.43.1773830361919;
        Wed, 18 Mar 2026 03:39:21 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e419270sm21556485ad.1.2026.03.18.03.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:39:21 -0700 (PDT)
Message-ID: <8d210e75-f471-484e-8a0c-9b8ee7900106@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:09:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] soc: qcom: ice: Allow explicit votes on 'iface'
 clock for ICE
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
 <20260317-qcom_ice_power_and_clk_vote-v3-12-53371dbabd6a@oss.qualcomm.com>
 <8863f38b-51df-43ea-995c-08b9fb04f4dc@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <8863f38b-51df-43ea-995c-08b9fb04f4dc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfXzWbfgihJkufg
 icR8ZL/B+WmehLfjGrAMtoe5kCpDTgZXY7qzwZOhTGAg5xJEOf20sQ7NvA2/il2BZmEWZeia8x+
 /zroOrVfzGqHKExD9ME9cKYPKSh/COQh96RWvMA6EQutd1au/JEyFvNvSrEgZhqnKJb6d9UEr+V
 5O6QJDvpjG8FQS6E+9zIInZ+TWU1biUMAy2CW7n/2gJp6m+2qSTqlyMs0O60eVpA+tOwNViTDGK
 LlUG5UO4qSin6PsarP9f/TaW7DfYCR/qHd4G0vb4X9pbKIwmpD54lwsngmc8sGJCSoaaFdtuB/V
 GmNgOC9uNJQLpNt/D7MZ+4naZ7d2yFXQ8Oc6mKcCt2iV/e7dGtJqVxPZkFnZ8nMorwv0DVvkIkD
 wYge3WX7YoxLz02Dda3zMSwyo5oYIRKgRCB7PG7Jy2bYIHxN3vm+2lhXKasXo/I9WOfBpaAgERM
 csWOP0/frogP6EN6XZw==
X-Proofpoint-GUID: BHoXOS8RWju01kVdDRCh7W_5JoKDUwhd
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba80db cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7T9o6mVONip3bYQ_lJkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: BHoXOS8RWju01kVdDRCh7W_5JoKDUwhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98408-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D26FD2BA0AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/18/2026 1:03 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 10:20, Harshal Dev wrote:
>> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
>> de-coupled from the QCOM UFS driver, it explicitly votes for its required
>> clocks during probe. For scenarios where the 'clk_ignore_unused' flag is
>> not passed on the kernel command line, to avoid potential unclocked ICE
>> hardware register access during probe the ICE driver should additionally
>> vote on the 'iface' clock.
>> Also update the suspend and resume callbacks to handle un-voting and voting
>> on the 'iface' clock.
>>
>> Fixes: 2afbf43a4aec6 ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/ice.c | 17 +++++++++++++++--
> 
> Why the driver patch is after the DTS patches? It is explicitly
> documented as no-go.

I will re-order this patch to come after the DT-binding patch and before
the DTS patches.

Regards,
Harshal

> 
> You do not understand how patches are being applied and you think you
> can fix inherent problems in bisectability by creating incorrect order
> of patches. No, you cannot. Read maintainer soc profile and entire
> development-process document, so you understand how patches are applied,
> what are branches, what is current RC and how kernel is effectively
> released.
> 
> Best regards,
> Krzysztof


