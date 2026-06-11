Return-Path: <linux-arm-msm+bounces-112682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qi/CJNOAKmpDrQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:33:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C5A6706F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:33:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Fmpn5dCi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="QTpz/CLJ";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112682-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112682-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A47AB32E5E6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E023ADBAC;
	Thu, 11 Jun 2026 09:28:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB343B0ACB
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:28:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170139; cv=none; b=YnY070PliJo0mf4iYgvKr2CKZHFwwF/HjSgm58YtfZsuRNFV1JQ4os6wosnYi8LX1BcVlyLTKWAFoAe5Z3eJWBtx4RGtcBQ3NX8IIcpzaxnUjmW1QuXJOrivEmWQJ0R1DymwU9ghBV1tomZ0m2Bc+J+7qWXt8GzsRR92hdWwqtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170139; c=relaxed/simple;
	bh=x6+jKILjK7229wcbrxzpoPjIev8YFpI5kvKmWkbwxvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QotP5WenGGNjSFPFP3zkhJ/Zer4u6BRwkZLzCzIi6G/CfR/UOkEYE/OPuvs7PxkcD9dx0ed38Slg1+uPg6ZJ1Z52Ipm16s/kkqAG7HOrLXHYoNmVlPadpTgDA86eNFxpTjlV4LcL3xa9aAK6+tMdivQT2R94xzPUKKJguObeNH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fmpn5dCi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTpz/CLJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9Mbc2215608
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i59erlsAEhkl2f7C93uZEg3Bx6hEc0sBg/VLkFUgp2w=; b=Fmpn5dCiSJUb7/j3
	GLKWuhZv5RaUphIClKik8k9fq/iPjzyvv5VQeDx+zwLPT+sRzNS510miHSclFlY3
	iiPhepYnPSSHfd8b1L2RXYdHrP5GJG68nK/B3sl9vkNra29EeNxFumIY1BQJP7+s
	9O45KypGz234m97muKCrO/Czd7yDImWQb0k5Swj6x7AhkN60xqndhF7G3/iWUL3D
	dRrzgyWj4Q/bYBFTWa9liSUFjCvdLdwaeHqL+q7P8LsW3CShtZTwxLWzpkaPzWkL
	PbYIy81pVCYc4vqNV7jIcYpLScSwIQRPwTeITPruBt8aWqaeuoZfoZNeLlOBvsbg
	G9Zlcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5g0sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:28:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517865e6219so16828811cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781170136; x=1781774936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i59erlsAEhkl2f7C93uZEg3Bx6hEc0sBg/VLkFUgp2w=;
        b=QTpz/CLJ6t6sSTzupMD5jwIuylxYQA4XhpjNO40uX+YhsqkGsX/lMM8qzEyqdUeWWP
         mWtpgPGOH9UcqaIKe/F1shO4HmO16pKw0bTZoKo3wMP21lwBv4aGpAJCPUUuP0JKVMyN
         XcXXwGAwHVqm4xZ4iqlMXGybxtKR2MdPcMB1m162OBjNY5Ie79SPF/9YIbbQlq/5jVSM
         B7nDzX9nUJuUN8wG4Kn+Dg6mmKvQPW3cQ6UyjA43esAyQy+i+LjhCjaxvqnfQxwAvcQ3
         UgeDSLc2tvGQheN8GJjo9vcKk4woXVhh72KTQV+6KFJ2Rg0TyeIOdGgFXsr2ldX5tQ8O
         ztoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170136; x=1781774936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i59erlsAEhkl2f7C93uZEg3Bx6hEc0sBg/VLkFUgp2w=;
        b=Z0UXHHeCUD0OFR0KenCGmpYwYPIASlcW7xVNSXoee6w5aKceU289zRQ1MpJqJWptix
         XrsjiPnG42Llhf7faBT6UoGL11On4RyQLmmxjAyjyIMYmd3lud5pA2qxlTQclq7nzL2m
         KdgWpAX3OswejZHjwUkmurMpkOai4Ra6NdK8kkM3w+QF54uyay9SDEQhLKSSevCQCeaC
         p1MIGbgcFP8JDWqci0JPpdy0IX4i9YNJojCZHLBh/S+fF6sAwd0KF6/2ptbZjgfY+Z0J
         5t+mvEDYUFiPM+IbejnVCGIbaaQf2G+5NcJjcnT3nLseC2sFJCUKzNoING/Ry3nZ01t3
         juAw==
X-Gm-Message-State: AOJu0Yw5whDxV04tBKJNguhIrS1Mqg51rf282+zVvpGYRVK0oDmkA+xM
	kbrph8qTWO3ENvge4YkBldp5aSBGgCG4vX4XjEvb+iyh/3nnuxaofgsIamHosFepsgmTeElQBZy
	STLuvLHfR8B12ZytpaKGgtoitet2W4OjVcp2HydK+viMfqLK/cVhH2I/jG+dXQFGWBZZLzwAN+1
	/a
X-Gm-Gg: Acq92OG4OgXcUmPUP50KheoqNyxBqv9+tM/nZjyTF9MddXl7blghHz5AQJ0jQnxThQ+
	tx+GY8YysBQvqsIwZa8uqXaOkKgrkfG/QXm1AalT1OZixMOfWY+wi/7mhQ2+7WLXrnw6cQzfviK
	/sLHiDvHtm64/1bcQ3VtffEAiaXihvsX+/6H0LGXg35NdIrM220qv2pzZl2DmjBzvZMyIqpqjrp
	y6Ysyeyrn5LIUvkyVYhHpZ4kaleOlUpPOSI3tjdYGvkBnAg5Ma1ZD1UxhhRG/f/KKcdP8DSbR5S
	qxSazZaycFzuqCKgemDbI4po93SJFHdePyB3oRTrqrYx79mlZ/wirz3q/2kmVGBSA1RWthim5bf
	ZgK73w6f6+N1vgENWo1050sl5mDtYsctHLlqPWofaTenvnTXL9YtETxeI
X-Received: by 2002:a05:622a:1345:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-517edcdb280mr19757451cf.2.1781170136427;
        Thu, 11 Jun 2026 02:28:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1345:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-517edcdb280mr19757181cf.2.1781170136034;
        Thu, 11 Jun 2026 02:28:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b4d988sm10681864a12.25.2026.06.11.02.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:28:55 -0700 (PDT)
Message-ID: <3c2fdcf8-957b-4b28-85b7-3a50ab8ee485@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:28:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: glymur: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-add-coresight-nodes-for-glymur-v5-1-3dad99fe31e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-add-coresight-nodes-for-glymur-v5-1-3dad99fe31e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5NCBTYWx0ZWRfXwgil9u9IQQ5K
 5U4/w41ieDXE8rtoSEPm/Yg1bQPEGiT6yP9ZUnEqI+8ERKIn3PqhTcfEOiZjdK1ztv8zrKk56yy
 4TFC77mFkyV6yAni9gK9LWNUVOgN49WSMbzGgJzR7trxg3elv6/RMWg1LjWzmYKamhZvOnX1aEk
 //aDufTwGAGFvnK+CyqPAs1W8vZD0j9a4YH0R58LCcWKj5RyVfPlonKp0qI8jc0uQb7pFVvCZo+
 jFZICbZIBqhxbvWdNfdzac5nBV0b/bXGeYrZKN6tmMNUCpvZpikjRBo710ypTdq2gIysDLAl3V+
 k7xUmBjrWAFQaoevxtnQtziT4XvBw99Eqb+7KX/p4Nz4wNxfbLCoU+F0nu12somG+gS3Hw6YWWk
 TnjG49z4BfVy5OFRgG5pk0/4wNHuVRYBlAoOwEamYF4PpFcl4fYfNii7bV5qayT60d3dQtgOrtz
 XRrEUeFdWhWvitinG4g==
X-Proofpoint-ORIG-GUID: vgK59K6CPOZNtb7TBeo1ilHNHseeHjdc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5NCBTYWx0ZWRfX4D62Rm62eCwg
 NgRdWIeHGTCc/yCeiLkXsIeOUrxSOobHaWJGQGGVmbI4xwMBxwAFVC+BskTKwCo/eoXuHlK/S7D
 OasxmP6Ydhr7Uyj4f2Wuqjj7UPt9rHs=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2a7fd9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=K0v4n-E2pzIAJ4eIQLoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vgK59K6CPOZNtb7TBeo1ilHNHseeHjdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110094
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
	TAGGED_FROM(0.00)[bounces-112682-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9C5A6706F9

On 5/19/26 3:14 PM, Jie Gan wrote:
> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
> some small subsystems, such as GCC, IPCC, PMU and so on.
> 
> Delete cti_wpss DT node on Mahua since this device will cause NoC issue
> on Mahua device.

Another good explanation is that it simply doesn't exist there!

> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

[...]


> +	tpdm-cdsp-llm {

Nodes without a unit address should be sorted alphabetically

> +		compatible = "qcom,coresight-static-tpdm";
> +		qcom,cmb-element-bits = <32>;

Do these other TPDMs not have the "DSB element" as the driver
calls it?

> +
> +		out-ports {
> +			port {
> +				cdsp_llm_tpdm_out: endpoint {
> +					remote-endpoint = <&cdsp_tpda_in1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-cdsp-llm2 {
> +		compatible = "qcom,coresight-static-tpdm";
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				cdsp_llm2_tpdm_out: endpoint {
> +					remote-endpoint = <&cdsp_tpda_in2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-cdsp-cmsr {
> +		compatible = "qcom,coresight-static-tpdm";
> +
> +		qcom,cmb-element-bits = <32>;
> +		qcom,dsb-element-bits = <32>;

Some nodes have a \n between compatible and other properties, some don't
Please unify the style (fwiw I prefer the one with a \n)

> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83

Please rebase, doesn't apply on next-20260610

Konrad

