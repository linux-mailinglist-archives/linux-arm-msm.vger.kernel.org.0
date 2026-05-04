Return-Path: <linux-arm-msm+bounces-105725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMjONO2W+GknwwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 14:54:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE5E4BD448
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 14:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE830300427A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 12:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFE3378818;
	Mon,  4 May 2026 12:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDRtmbkw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WA1DjeZY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCF33793D2
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899243; cv=none; b=EQlRHBsLeqtPfxM3HeNaI/BgjIpgLavx6x6zPilDEX760/gWHhrDInMnO2tsSJHBaTIgbPX+1CCBfWdZnikGTzApjnS6mAvAovKVcoyEDr6g9dl0SuMzlpOjwabmTVZmpBRUgdusVOJ0qNTMnznbdqbCdieOdkwReqTbDFoPKIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899243; c=relaxed/simple;
	bh=bUE5xlfJ8aUvjxSfillnSt6bWESVidtjA+1zJccVmAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLk2H3a2a0qPhbh8uuuB4BUPixB7rfOHoZAwhOSZjs3Tg/5oD03U1E4ux0qcWgAi/4FfNOHdov2U1K7kWZ5dSVzYBGK/wnjMHazUiyixuefkghBUpBgPrkc49Iavr/y7/S07YlA21kqNCCLLPbJZtLoRBbz4SLhzdwa5/o5dvcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDRtmbkw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WA1DjeZY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B43KS4160055
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 12:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ix2NDymW/i1FV+tC3k75uMGr7xSTvQjTuPjMK1bZkvs=; b=gDRtmbkwEhkUDzcH
	mjoewCBoxt73SG8T1jqSGd0VmB1AMVGHnh0cZ6lo6CeO+ZjSU541VjSomLatDA6w
	Bse7Z8o/Qe/3ucolMkiwW+cbtR8qr7PNmnhNiQQyfgsB/L9EeobUrQ1MkGaxm1RM
	0JP9E7Dbu+Sz9lz8azWj9gJUNIpPDdHqWgKZxoNc3yMmHqornXVstu3iTKsY5pBQ
	8R6TMnPAAxomOkefcnZ0m2gXjjig4Pr5zLbgBmsB3VB8LxN41/EcMZGN1M0WyP48
	cCJaWLA/Y0TrVobOWelyG0sV5PsCZyulclmYPS8OpxCSaaaUJQXSYHmOG7U6gxd5
	Yyz/8w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6yfe0vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:54:01 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f6ee26adbso337573e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 05:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777899241; x=1778504041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ix2NDymW/i1FV+tC3k75uMGr7xSTvQjTuPjMK1bZkvs=;
        b=WA1DjeZY7m/YTCTtzevlB5NBdzIOTTDDm8v/afgiqtCQRkZdALSinhh2lAVc4e11DV
         q+sVaHdBNheD9TNZzpiDifmsNGWz3GE4X0qJPVDuIogs1L4KGazKjPMfeI6aXpSxjQN7
         6OETS3G11pXM2uyOuX2Qu/pi/JC9q+AYq145ZF8UkAzASKgFEz34GljYVLr7WfYmpLo0
         4QMbfNqCXwDfDjipL8KLrNB2jlnrXmJ0JOqXhiq2Cay8f7KnjFvc6iDpW5GeL93G58cb
         Mi1iGFiu/9iiPHg3OowFJIkvopD6RmnQRFdSl+IDmwg9xz+SWjHPQGfEeYNweqpu2G0s
         U1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899241; x=1778504041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ix2NDymW/i1FV+tC3k75uMGr7xSTvQjTuPjMK1bZkvs=;
        b=POxMtTsUXCJxFGDEi3F0/y2nffL5kY3zno66anlW5e3WP7E/Y35rp5yIqhtv6T2teq
         62A0Ng9+b2uGhK7Tq8/gRvMFejg703oFwtRHl4OLFrgeG8A4qkFZNP1dfN0JQM7dhi6Q
         qb7PlCk8I5dqgaPRFJfldeC8LH6j1G2Vv4ToXhAM/p5lmfxod/f6mkELiBUYp2kOrdL7
         5sKLsd8P6i+BAe/154YvEwVM3BSjo+zKaDPzDlsIpKFVH2GaYAkxuVViY+6E54RIqHNK
         /keCRnZ+drb0aLEP5TNpouIouNLyELkl00U7guN4qYDNaKmZgjdOZ0PlLG4oMOrTIcgJ
         UVgQ==
X-Gm-Message-State: AOJu0YyCgaxKqVLPAgI4o+zrjwXsTJ4yWj+l+gPxp5WkapNhDAGLv1nt
	RPmqN/fUuanTkyV1nsKApxtQYqMif3MjNOpC33dzc0nW6KJRnmNzi8OLlTrAiqDeyh9Xcndxlwc
	ghrWcHEkUJddJJMp51NpwtX3ypwBrcUkP2wt2nNvJ3xQiqb1dPxMtnD7W49g7uIqTaNWH
X-Gm-Gg: AeBDiesMIilWxUE6R9VM8EG4fCnGHsl/AWK4w55L2x/SBMIwIqozDL6FMUOU8KouCnA
	HC/i/FB2TAw/UYQjCYxa435LOPqCOxWZFpdS8XSsAcvc4Mw2bWjHDGTZAAKALGnJSdVB37a2Cm3
	Miqzh6UiFJVWMi3jQJ1RXafl859dqZlKkVE6N6Ys6OSJQrIogRIaALGUzhYv0dBXxYuxpsiL/ib
	qNOxFVvq4fRj0cd4CHYLN7HZ9t6+NLWakUctpZ5kC40sTR5bQbjFyoQCY3a0I5SG6tuHBu5mlpV
	7Rl6mHwN+pcpXjpjIuO7d8+JV6j0pnYQMsErGUEolI89PQuKRKm1c9OTS+NZr9PDJP4qWNVKq3b
	L8tR8bJikuceDhn5F4Wt7yOcXHS0DmtJ3Crt99g8YWZ1pWk1oPeia2MfPdrBNKtdkp/lbG45XV1
	4RbzGeRuCNAdHFJw==
X-Received: by 2002:ac5:c912:0:b0:56f:7eee:1914 with SMTP id 71dfb90a1353d-5750c517e6cmr1271330e0c.1.1777899240574;
        Mon, 04 May 2026 05:54:00 -0700 (PDT)
X-Received: by 2002:ac5:c912:0:b0:56f:7eee:1914 with SMTP id 71dfb90a1353d-5750c517e6cmr1271322e0c.1.1777899240208;
        Mon, 04 May 2026 05:54:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1dd343108sm139715066b.63.2026.05.04.05.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 05:53:59 -0700 (PDT)
Message-ID: <0edacb23-a132-4f9c-be4f-ea3326c8d8a2@oss.qualcomm.com>
Date: Mon, 4 May 2026 14:53:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: monaco: Add monaco-ac EVK board
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-4-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427170505.1494703-4-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aH9ZpYvSBxrnR3GYVK_2LKxct1ZuOC46
X-Proofpoint-GUID: aH9ZpYvSBxrnR3GYVK_2LKxct1ZuOC46
X-Authority-Analysis: v=2.4 cv=QY5WeMbv c=1 sm=1 tr=0 ts=69f896e9 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1dUBD55Cnpq4SFnWJt8A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEzNiBTYWx0ZWRfX7I1cD8ycnAIf
 n4uedKzKHjPyhfdQSKwITOLm1aifOv9Za/LGL4NO5wGxuWEzEGPHozXwVvY4+UhyH9MRNdrf/dk
 n36fnfpLl4kKKUCxKE5GjJaWg9G6h22GfblBuIT4mAXFKhYa9x2tSkIfM50AUN3z1GPVx+ofH0I
 0LI3oQ3irqDPmypFmIdRKiG2vZlTVZqLmAMibuyEtay7b4nTF37Cw8kEUEKeCrE5GOj5EPaH9ZP
 5MmUMItFrHsKzcRm7vEL0Ygl3+x79AyZcRX2srqLk8EjS+UnvOdocsK06/hRZzpHBBcwHtxfeZ3
 xdk016VL3DrtrlGUhNFNCfTxOdaP4k/jhZCwqb7UdP+fFBLc2oJrRIvuUhvYUVL1MtPr7afYF5u
 OfNA/xprRpO8sOh5EVgGJrE2RU6IROSPt9jxde5VvcQnKJkmdl5cQoSfFYJ72T8rnpChQ2x5tzo
 Q13pKjloNo1+B8MNF5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040136
X-Rspamd-Queue-Id: 4DE5E4BD448
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105725-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 7:05 PM, Umang Chheda wrote:
> Add initial device tree support for monaco-ac EVK board, based
> on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.

[...]


> +&apps_rsc {
> +	regulators-0 {
> +		vreg_s4a: smps4 {
> +			regulator-name = "vreg_s4a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s9a: smps9 {
> +			regulator-name = "vreg_s9a";
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};

Since these are on a PMIC that is present on both full and lite SKUs,
are these rails also connected on the other one (perhaps with a
different voltage setting)? Currently they're completely absent

Konrad

