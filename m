Return-Path: <linux-arm-msm+bounces-99218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDSOGSUlwWmbRAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:33:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCA52F1455
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8385730086E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C984F396572;
	Mon, 23 Mar 2026 11:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JbTYtvET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOdxMcqn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83609393DD1
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265303; cv=none; b=GJjSLNFUctL4qT59IEobowAWqSXk7kCcIn0oU/vRjsABjNCwZsl02giQPVEyUGSxKVMabunhHhaxYsgIOOn4ZqKi0t4WF5bFuJZtnrEW76kFvq2fbYOxYjOL/mYEJMQlOdVz3yF4Y2CEgsZXUiQ7glHCVvBZwQKIEGLPlIeZI5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265303; c=relaxed/simple;
	bh=P0lgVEvoBBzeXOQHdJFobPCFwkZqzwkaKNHhWjCx0sE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOPx4YRul8DzzVt74QVtQYik9+ZfCPR46d+CyefbGMDm/lgf4on8dN2bmbMPFe9OhSk3lXyByqpVX1A3BicKSuBj82uA3eA7atuBMs+K6yoHAsd0jm1Zvn2socu6Z5Ha2AWAMN2KPQAGmjqclX7wDz/NficRRlJnfXarcVd1omI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JbTYtvET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOdxMcqn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83o6t1364149
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otLGVBC3RcY9v/x19x7aTlyFu0Pant4SdxjD1/Z6jQM=; b=JbTYtvETWYt2Hv6R
	7rkcK0dp89Vy3Idz0atoCVTltiQ2GpY0ZuzYiGip4Pj7jGHq9zZDnMO7FM2oWZ99
	Jj3LiiyTawQCYNLnYri+SyKYuSBOuRCjtVupGTN7wvBeHLgxI1ZqnsuAJDMaiVaX
	1bfiqmYBjPc7H1ZznN5ROtL+TZViVb2lUUQjpbArWQ5jrX3WgByoaF8ksE6KfSnv
	k1tcjbx8UoqQPPbvAtJl37UV1jQbXAWcuy5UHxGase7PD9ej3xW7PUpwo19koPfe
	TtIyB46hoWC5ht2qPOJdygXmECaPJLazmcno+lpV+L1FgfXjs8ifE9xGLAOr8ojz
	zkiKrg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p78r6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:28:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b32feb719so26869291cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774265301; x=1774870101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otLGVBC3RcY9v/x19x7aTlyFu0Pant4SdxjD1/Z6jQM=;
        b=MOdxMcqnnY9Z2Qj1xGtjw5F2MFUUHN3b9BqR432tRiQYpk4YjpmqcNz6TZLBKeVOBu
         3Gcc6E2toWCNCMw5qX+aZB6r26lB0ghjrfl7lnKOdYZqIX3zoc3V3A5wW8gK1Sn9jDep
         hg57B3wf2/gvEUv0yrgXZRFytVgPTWNZlYcw60Y+r0ixdYq66n8WJ7jSZIa2WhfPL/kP
         TlarjN+3+llIhhywB8klCpS3aTufm2Z6hkjaJVPn+mc+SmO56yjdPFo0RV+eOoqj+M4+
         tHu6pRixvPmVYrZsUtflVB9i/MixENJN32QcwwAiZQIx0zRHZLuoMmdC1gWreYfQ8UPI
         bsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265301; x=1774870101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otLGVBC3RcY9v/x19x7aTlyFu0Pant4SdxjD1/Z6jQM=;
        b=ZjDyAKm0bUVeV3LapNRi0ejA48gA3gP8RB1Oyk6Y74a1WTM5qBBeQlDjHt+1p6OxsG
         CBk2gB4NB6devXaqxPCAJ2PLLbvWFi9/C5+eWSg5iWt9Gc9uCpZrWG9hiG6pFv5OKw1F
         4HsFe9HuBwo975VFSsvv2j1MCCPmQDM1FPgC72l7hAQvHq7ti9VplV2voDM3zBH30K8K
         98iqAk2eP0COBR0C3Xia0pVPcaQEJqURp8PzuS4RcZ14G/obdbicYjzeJqfnBinNdCgK
         5+v3JpNSUpE9SFRQ5rCIGoy3MCvDgfCOsRu2zQMwTw9l9+UAzApuLE2RhdUBPk7cBby1
         4Q9A==
X-Gm-Message-State: AOJu0YxkK9B+iaMJoA74OkcilSSnqWfp9ykgczfDEvBYtQ6HMqJVuKCJ
	h6Ze9eCQJYHbl6Mx5VSEvLNMXMXZ+8PP1OA50zcgsoWjrWsUbNSEnOlA5Iw++spRRpJygi5j1T7
	BQcp4Yqccc2uFqj+DEsFynsN/wWtNHP82uR4lYqZWk8ezDkzFYaqIzkTYWl/NE5D9nW8U
X-Gm-Gg: ATEYQzzJRaaz9zr+XKnTn+DK+S1tFj0TEJhXRzON7xB95okBhGRfQzrAEwYdwHeB2Ro
	TAC0MaRX2eLJG5n0FcND9m1bSXYyDVSqWiPTYLq6cGDHDOv2/Z1NK3BkVIdCqK/0uM+k3TsjVYL
	vKdyFedQ3YNtvgeEL7CmMCMcJ6LGO1Gf0Lg17Q5ozh0zcErxKObWZOBd3B7Ksg+z7AnHB44wPRF
	t3iSipebgExEeSPsmo07hZaduAxcOtwGuk1Q1+CO+bK2sVUJJY6AjiVmQStJ9ZnnapSugz67eVF
	BJwaWgEviinGe4Vh2Jw76hrtzZNBvTXKUmMJwAKmGqZlzHVdGKrIPKBfbcziYbcJV44svJnbHG7
	dgJhktT3chHnG6vmQKNbN1dDh3NHk+61pXwIoQYzAY3RLEZpLX6ffq08VumWuNK+n+hCoSHXJwZ
	nF80M=
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr133488591cf.9.1774265300909;
        Mon, 23 Mar 2026 04:28:20 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr133488261cf.9.1774265300425;
        Mon, 23 Mar 2026 04:28:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8ef74sm473465066b.25.2026.03.23.04.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:28:19 -0700 (PDT)
Message-ID: <ba3d5ae1-38b4-4ea2-9588-9ee7bfcb0675@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:28:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable sdcard
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-1-89c9b5ecb26e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-axolotl-misc-p1-v1-1-89c9b5ecb26e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c123d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=QAr4PxFQ6c4scwZbW_IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: d_u3SBOSXA9g5n5JUwAjfvUOEqUxeOrg
X-Proofpoint-GUID: d_u3SBOSXA9g5n5JUwAjfvUOEqUxeOrg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4OCBTYWx0ZWRfX6DgvJv7ZMgiY
 I9i7U/8cgsNjA+nsTMIAMGnKQUELmabXwXBeTHQ/erjdBcxLwM1Amtg3fKesgQQx5okLmzYgGef
 60m/LK8qyLhy7+2zzSYaZ9g1e4S0HBPNrglDHbXynOhOM7PBt2sb9a/LRb/zxj49Rzg9TZxUJ0g
 YFNVYaDcw0MUrdOOeuG8cYSKQfJV7c2P1VVHxP5mYyXBRQ6tFlmjtlEHIleI8lQoVcGbBSOFvuS
 ac0a5kCe8VY7QxzOGEAWd+58azHXm4zl9WnUoj4wCrWr/h81Y9v1Rh06ZdWL0qrslbsIcS2pZNo
 k6wsSRPaIgurLZEKO/k3CPeiQ0k6TBF3DFj2mm8DZoMxIgetFTxTChTZhZcnsCbOajzYZmDXGTo
 cfv712ZFmnfJCorCrpdaawKBZDVZDuzH6TgeGiubI0ux37YzeVGR4OPl/bAuCgce6Q45A2sfAQb
 VFNFkUnXtD3150BojBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-99218-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8BCA52F1455
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 5:29 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The SHIFT6mq features an sdcard slot, add it.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 43 +++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 51b041f91d3e2..1f21da310b762 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -600,6 +600,23 @@ &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
> +
> +	vmmc-supply = <&vreg_l21a_2p95>;
> +	vqmmc-supply = <&vreg_l13a_2p95>;
> +
> +	bus-width = <4>;
> +	/* card detection is broken, but because the battery must be removed
> +	 * to insert the card, we use this rather than the broken-cd property
> +	 * which would just waste CPU cycles polling.

Since it seems you're going to resend anyway:

/*
 * foo

Konrad

