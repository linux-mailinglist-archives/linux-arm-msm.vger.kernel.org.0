Return-Path: <linux-arm-msm+bounces-117635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BxWuA7ZPTmpSKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:25:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F4E726C75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:25:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VteuG32F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Kj02rgB+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117635-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117635-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38ACF3035D57
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03301306779;
	Wed,  8 Jul 2026 13:16:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3912230BF6D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:16:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516603; cv=none; b=giBya4ICBq83+a50pzZqID4jhqgRKodnqaDCrxs9H8IgE5ohOsxSix055ehncTS7FHFFfE2fQEFLFLqafumtgIUc+ziqkC54b9RYQt1LoAklW3VcY7k5JB8yfpT9vXWj3Kbiwe8ldNgyddZ6cPFV4DYR0qYWGamPskF22g8ByHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516603; c=relaxed/simple;
	bh=zJva5cAsyjmzVqBVumTX5Zywhnrx7uMtvJBFxDGeIMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkdFJEvzISohf+2SDtit9SXnkxf3HU3VYyKJFafWX96He9kHn6Wjzm29KxeRRFdsigLgrByC9ad80OY6Ar/4uCkHy1bnDS/ujEaCVtMkvQFDndYySMrrhZz3xQSxHONg1fWgWdoLWZ7ww51x/ysNli+8wXMDPUEuDL6juasz/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VteuG32F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kj02rgB+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668D80aM2678697
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 13:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXzmEq6LO3fIlF4Ec7BnotwtU4WcSRjzWN/rTY9gyJM=; b=VteuG32FZRLC87er
	yf2b9CrafHqJm1QWxUNNEHbAnav3n71OmWW8m+kxEVDFgkmHT9oPlFEm3BvyHAVX
	sO/0i88dVGTYPWFP/z7MKEDMbrNy3Jjo8n3bfhtxXIGr7DDL7DuENaeMLnR8IaZn
	tPdiTCAYGY9fKEKcORew7h/KBqBMmhP8UboEZ/A6y5qw+oyABiypxIjA1x9vfvHj
	wPV0Sfn0jQBh2nUTOwf/ClmrcYj3Tp5oeVKnnjIQ5IFrD8wEN2VoIXWu2RUiYkIK
	p2cphXlgQuSrQI+DzYVEn79nE2jxp5NFAA6SxS5f03TV5y62EzXTvaRXfr+KcK54
	WRx2wg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9q5s810d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:16:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f3951a6d76so1952676d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516595; x=1784121395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXzmEq6LO3fIlF4Ec7BnotwtU4WcSRjzWN/rTY9gyJM=;
        b=Kj02rgB+kYolpgOfwPVbqPxMeNZmWRe8SB87z1ZuFl9qMguDM7U5GVCNcue8SPMwFn
         fBlkjHQSwVJ6nyAU+dYdth9X5QX+5+AUCZeumH7cIJAZ2FZ5y9cB8skOKd9OeTKh9+pV
         fQVcOpeO3bsr+SbLGE0X9jjizTnmbH6P7NqMsKA7rHcbb3JpfeIRIKJj6jLPrpbcNGqQ
         oBWBXodA9uJxSrhP7CH4dPOCK0boD9hSMge7R0VlzgL+p+iKJk2qnHaWXQfJ+Yr/uVgE
         mX6za7qdUQLzBdlDAUCLwN2vwbBW1yzxpwtLy8sW25L3ZOaDCAELitr3TyC40TNeAqVJ
         828w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516595; x=1784121395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXzmEq6LO3fIlF4Ec7BnotwtU4WcSRjzWN/rTY9gyJM=;
        b=lGwnJosRuhGasOKLdlVJNDHItM1m3RvpcSuExxB3P13j6aFbO0xSic69cjminzN7cs
         s6+UyGNGLIrTjg8LxXwj5rL8agGPld7ab9B9mOnZhr8v7Kl1IGyZK7eEI1nlBAkgc4TL
         SbVYPGyb5pKHGqS5q+NLkqomTk/6bwGFwRnVMIOmMmrWjnGtaObVDrRbN0W7jkkj8JPL
         OyCqU8oN11xltt9PnHzJzlkVVcKc1zcokps5bhTooDnDGayGEBIf64t7cTfiopnZdcKK
         5bL9VENOWF5+Ikb41ImvP/mVoDncdke4lzz+tNJiYyh1pf3RwkXQqmL5+ayFQHIa00D8
         THWA==
X-Gm-Message-State: AOJu0Yyeiaj2paPFi2o6aaNJ5QrtWkGESgL+ae+BLED3pEY7CPyx0kQF
	TAbQxdcjRkl1ak0pHw58ESaF0pUGtNjczPUkPDAxxqpEFyREUvwjBnOKx3PebQzOtqF6eL/JuIC
	ahpA0PPiXSgac+h1uQd3FSUROgqg4Iy2NevaqJLOT0FdpSSpAsHaUx408ON6FM1YXhLXM
X-Gm-Gg: AfdE7cmkPTjwYHy+iZ6AFmL5nN2ytVMxeYc7e1RnlnuUqspBbFRcbcqdennjxn1x9hI
	O9DZK1BaLg1kJ7Jbg4Vw+HgY2NEcJg3VDX2Dxz3da4TfjrhJ21pfQjmSN9NzF71VtN6LSi9JqbZ
	PHNbALx8Ou+lORyhAVZ8Cold3EzfDwrdt3donAeeEji3n71Z1OKKfv+GRBOro7BqlcL7jPAiX5T
	syR9Up88S7Pxz5ydTOznI4SzHTkZKYMwyoIvzGdIp/vjclDgB7I5OSulmvZDnb2lZ16JT3Fqy2R
	zKJj1B6lpDQp8gh8KXOIHBE/tQggUlpSs6/0/7jHGTaaFeRXyLfRAK0Kve8OXCBh7C8wjWX1Pxd
	eO/Ot2ejuU19RVXxW+vsurDs9Vi4aMvnjZ5c=
X-Received: by 2002:a0c:f405:0:b0:8f0:24d9:364b with SMTP id 6a1803df08f44-8fec3bfbae8mr18446876d6.7.1783516595495;
        Wed, 08 Jul 2026 06:16:35 -0700 (PDT)
X-Received: by 2002:a0c:f405:0:b0:8f0:24d9:364b with SMTP id 6a1803df08f44-8fec3bfbae8mr18446606d6.7.1783516595095;
        Wed, 08 Jul 2026 06:16:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a3652a02asm7016471a12.11.2026.07.08.06.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:16:34 -0700 (PDT)
Message-ID: <5bfb3aea-4836-488b-aaa9-ad770baa9c95@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:16:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com>
 <20260708-eliza_evk-v2-2-c599246ceba1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-eliza_evk-v2-2-c599246ceba1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyOSBTYWx0ZWRfX2IrLewu37Lgp
 gDivACsn1OW2msGHrnr7diHq+DWijwfqqkAD7nwwpgRiZD5X0LhxT6rh2S38Qrs3KwLkVfOzvVo
 56TZRuo1J4Q/yUWmf83Y3pJ131EX5kMXCu5ZvMPeTL+sWnfY3PQVLtaTiqtzlpymGwtYU6ixPPz
 ahl2twc8c02bp88PkYliuAY7kkImZq0lfZQL1IS/hXaLJ6EG5Hzx3PdZTdYofeLp6Yvj02c5yg+
 EqilKM+c2JJdiVSedshV+CaNx7AtqedmUgcPj1C30CG70c2sfQ4oMnnScSPr/iuS1TQKFMA82l/
 5NgkJrrKHn0yfCsyOi0Egemm2LV5aDmBFKwBLjsJCqRjel8M2sLDmHuRdXBbHS2jI8XFnIWYebc
 L7EVI5Pasxosr3wHPcJ5W6rQO7qqZMaoep0s82mE0yiOGWoV8tYjlqpkE4O0JEJSqRjm6Nyy6it
 pjNl/WQxnTEW99OrEBQ==
X-Proofpoint-ORIG-GUID: A2I77aCusWH4EbEcI0nxvHboX2GRwSfi
X-Authority-Analysis: v=2.4 cv=NfTWEWD4 c=1 sm=1 tr=0 ts=6a4e4db4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyOSBTYWx0ZWRfXxYbfTToSMs4l
 DVUEWlWEuyGNV3+Nu7EfrYuK87PWhDXI+KVDBRDHsazmDpHQrdpIA9giIlrN9aHc6D9MBsti6yL
 qgx4ajMDBoEWNuynB+SuBh0ZeWCdOPE=
X-Proofpoint-GUID: A2I77aCusWH4EbEcI0nxvHboX2GRwSfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117635-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60F4E726C75

On 7/8/26 8:17 AM, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
> 
> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
> 
> Override the base iommu-map with the expanded set covering all the
> switch's downstream ports (0x1400-0x1408 SID range).
> 
> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
> from the PCIe controller.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

