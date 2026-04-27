Return-Path: <linux-arm-msm+bounces-104648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBsgIFoi72lV7gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:46:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B6946F516
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01335302FB5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3853039BFEF;
	Mon, 27 Apr 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XICytxMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzYPrcVA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBBD39BFE8
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279326; cv=none; b=ADlsRsGCz8WwEnlo83c8//hNBfbzfWJx2mchxYMI0dvTr1xW68bN4ztuHc6/narBny/Up3A94eYhSMjzghtokqxaKoCHFTcTkd7R2hL/bpXDulgjmbTe0/wib5KnhGwgcbEezHhcfOaWfnSPjPRLXd7oNU/9UJzkZkcJlWTZpOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279326; c=relaxed/simple;
	bh=neKNELKcTkDyFNQTzfs1oysao1xPFI5tJYGHEXhqorA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFU9UpYfuHiHnbAZMSNg2RSIi74EMnQ8biUYPSfc1tHfjVI4HMG3eYT8CK1ddYOFzp0NV1SmvJ+7VszlkNRPN5bu1txnyF26wq5xN4qba7NkJbOC2XP3Iejw5m6zAHiM78eqw/BviV253i9fmanzGjwhp4wIVktyLlUQiouU0yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XICytxMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzYPrcVA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TG2C3682681
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qv98aU/01DIYDSvxt4p/UE/kkHTjWYh+2Lh80L4kIiU=; b=XICytxMcw4QY1PIS
	HjoBLQch3z0TdAso+pmr7g62tDODZbOMia/2gDNqycOXVdCzTsrmO13YozO6HjXE
	oc+zzksrbyAoHt7tDtFi996sEhu9IcTzOz+zKW+os9S+bJP1p3c645dE9ooF330O
	+pJ2dZ2H7wLh71q6h+VGt1Ij1OMnBenHyn1DLfrfWwhmnq6tF5tMeKLYsQt7kSmh
	MmNR9uVST38IosAqvNVAJTQ4ic90l5oT0z/Yzx+tbE2egI3mnSOCKvP3Ae5BpHC+
	K22FzwvmQbINB0VTBbQeze9aYqxjVRx8iN8GdPZ28Ir2A7lswdMyRK3ETG+Jp2QW
	/S4yvQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr573n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:42:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35e5791871fso11924519a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777279322; x=1777884122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qv98aU/01DIYDSvxt4p/UE/kkHTjWYh+2Lh80L4kIiU=;
        b=TzYPrcVAyJnOL8Vrj7Fk0LEk1mO253GMx6XfQawoxG8epe6XoQqaVZyTcOXOYChxs/
         jPh25YNyoFH3vs0p2oUxtEaR1dWr+nswPkjUunELm1MwNv9JhEBvBKg4Jx+39K95bYMw
         kwnK6yT2S1hE78Ww7cAZ0kXfPEMNAsC6g/Bl/jjQu9Xs3xDNQSQwkpE5kSlphTLdT0DJ
         aMGvDKV3KkrgnkOjWQCxgqxJ/Ke3tblCh6xE2hWcWRMvw043U6lCiWeNYWEFkwVRYy+I
         j7w+Ez7cEbJxz/Qo9gH8hnUGagtfO3VLyxxmNTGlOBsy6GFxeT15j/lmmf+6nB5zC0tU
         uPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279322; x=1777884122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qv98aU/01DIYDSvxt4p/UE/kkHTjWYh+2Lh80L4kIiU=;
        b=YLJlrSG7Q3fEBHultumU12+qqRFwVSBNqGrAL7CrzlGSyf9im0wusG2H7IycMy6WBh
         FXHatXzIZ/WGAjc37XOhrKBZzxZz3AnqOMa3znFTgfkHsyYOBSJ3ylYoA9nfMWiYkUk5
         lNcfAxIEq36KaBXb+BAwqjs+LdfKWoKQwZmImHhsVOKfmcFncjEjLlDcva9ieUs1wEAL
         r3wpoFatMayCqaudsBXrD1Wa5Yk8mJtaekW6EpFkKH7zSMh4/XVU+duOWAblTJ1YI+il
         Q3XQdDsL9P9XcSRdi6tEbAHv3D6hyi0+TYpTqjoUHIUhMt3jaq90EYIq7FOtMQ1JuL2s
         FwQQ==
X-Gm-Message-State: AOJu0YymKZhrPexdtvyj59k3wESGctFJLpuAsQwIbiybnBV3BxofyxXD
	aBaj2J8On8OtanMPcmNUjFukbMVPSBJcma+lD4Ss1QEwGszv9p5rf6SXmMRgw6C+nJ4lTml+zAp
	Sj1y8a4D8Hl9b0qzHBx2uygC44xKoNEcd2ykDGpiok1kzIL0wlAUWeWfmnfGYcGFgKkixMp7n9o
	LQ
X-Gm-Gg: AeBDievPlUJ5yDAX9gelHhmHdIC+Q5D4GSbZvjd9OUhPqlsYJ6WzTvbgBP1I7ZHghVL
	8rvtYH/iMcjPUlrIplBr7eP5AVWR1Y0s5IN/KO+3a6slI6vlh6btD3AbTZEFiULqRMMjdaGX4bC
	9VcNjhixt1nyHqW+/2NHeWyF5+Pc2D8TZdPNr/BoOKbXjna/Ebq8YZdwgRI0iny7W7wFN3+Ktd3
	iqGw2xK/ksA2RODTA+XcZJFU/gBDY9sFHiwWVpgsOMfxom6LGosDdviH1Aj4Aq2/Q8bp5nz/D0l
	03o8DNCTENcPkSRaMLH/qrHd5Uo8jy2ov3M6tZzUofgOzHE5eCg+yX30Ytbhrw2X8HNWdAxMx/h
	P4SPmI5G7Dz+nVYzB3ARnfplDII3eMJsFfSuaLmxn3I8sQg6UNKQYTP0fsF4JMjCGnqgfjvo3kQ
	m4HmmWUrSVSxVPbwEMlOTvR1EW3tj9rHeNdMtd1CA16u9vvQ==
X-Received: by 2002:a17:90a:fc45:b0:35b:e4f8:7b2b with SMTP id 98e67ed59e1d1-36140468f71mr42967997a91.18.1777279321763;
        Mon, 27 Apr 2026 01:42:01 -0700 (PDT)
X-Received: by 2002:a17:90a:fc45:b0:35b:e4f8:7b2b with SMTP id 98e67ed59e1d1-36140468f71mr42967976a91.18.1777279321311;
        Mon, 27 Apr 2026 01:42:01 -0700 (PDT)
Received: from [10.50.4.70] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc593bsm38705687a91.1.2026.04.27.01.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 01:42:00 -0700 (PDT)
Message-ID: <1cb7a0a5-4bc0-4391-9592-3909a627ea96@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:11:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: glymur: Add QFPROM efuse support
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ef215b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0rvPZX15ANotvEkyALsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ADlsv0DpBcyxhPVmUZRXSpx2CJ1YYnn1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5MSBTYWx0ZWRfX0H5Ddt2womcS
 DO0d0SRddhZ6utjmeOWIOI1QYMAIeBbY2WWUD/MR09E+fTyVRZ42aVEn/mUcpt/BSPiIa2zigG0
 xkw/pMGUiyz7xyn2pKSnvQbSUMEL5QCIiRB4IG29GqvP2pPdRf1x2oLx9qrCo4XarAdN2xj+gA/
 eqWpb5UYPYjFgvtwtL7RRuReyILu9awURfeI2whSipXAYmMIcC/cfvQ/YdLRa7QOxfDepy68B6E
 CG2U9iLpI9SpIFYKIju7rLJ/J2qYhOkOBd0SQ8Hw3pANEkxB3xDiSGJi4w+qiqQEqlCzd6oX5sT
 vrzHgCgw3mcWPhv90YXSZlrOU5cqgJSuIHg5ncS0BNb15enZFEWcbYwSPfRpBVKMC0yfdVJyUy6
 UJyU9Oj8pv/39QuICw0XzQM1h0TGBr6JuK9QFmrm4ohydBVMW/bX/TwicUxpFLtvZGkfSa4DVxS
 Ray6dB+H+QwIWQDQhKw==
X-Proofpoint-ORIG-GUID: ADlsv0DpBcyxhPVmUZRXSpx2CJ1YYnn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270091
X-Rspamd-Queue-Id: D6B6946F516
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104648-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

On 3/31/2026 7:24 PM, Pankaj Patil wrote:
> Add dt-bindings and dt-node for Glymur QFPROM efuse. The GPU speed bin
> child node nvmem cell contains details of clk frequencies supported by 
> the GPU, which is then read by the GPU driver to select the correct set
> of operating performance points (OPPs) for the device
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
> Pankaj Patil (2):
>       dt-bindings: nvmem: qfprom: Add glymur compatible
>       arm64: dts: qcom: glymur: Add qfprom efuse node
> 
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml |  1 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi                     | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> ---
> base-commit: cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
> change-id: 20260311-glymur-qfprom-51c7521e4da0
> 
> Best regards,

Reaching out about the patch series,
Wasn't acked and no outstanding review comments as well

