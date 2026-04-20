Return-Path: <linux-arm-msm+bounces-103695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB4rIdXl5WlkpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:37:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F45D4283DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C11383055DE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD8D3890F8;
	Mon, 20 Apr 2026 08:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+P6rgi7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQNNjhgf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBF8307AC6
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673980; cv=none; b=P/O5JScqocYH9cfB2a6RmG58lvFEUgLpBCPtlU4Q3sQkUkph+niGuZ1YflhJZ4mmVNifzm9YcCDtRHG5DD8PKpc5YSHDCE7eWpqj9TPqhZ4xD8UusFjdt0SO5ujZ28d8M5WMLygOMfM9PnBBfWgChPIutUmIwOxVKQaaijaDe3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673980; c=relaxed/simple;
	bh=xXJN7wNUIwVyo/iOBq582NYI6uG4Q07+NX67P1HJe64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/c0xq5e2Od3kxJFgmhRmbJEIFhMYctomQYWOFBrYlI+piLzDfeCEePjww6x0vHWAhpc3D9XeIEw9vDrEsJno48vw1JoEtgKvYp/sQojAdvDZ8vVFtRrboItLMVkXp4f+erNSP881xDOLZ4oDqVr4u9k88kPrbHVVgwXLj2hH6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+P6rgi7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQNNjhgf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K6pdtk1096314
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvO0uuWYdMUzqJjYcJ2rxcG6gv2UzRF/Ik/LfOP+nPE=; b=f+P6rgi7wQfhamgz
	H7VLlJu3kE8+xk26nuwyMMSlarSR0Ouvc6eRic53CUAlabK75pEfMblFWVzkNJ2b
	tQT8Bk2o8OHP17GIIqdfRi14A5CSDELXDVPFmpHGqEaUUTB9fMzFZGkbSrOhKN/4
	gXoIX5Tp+5n3ha4kY369RsU98Hg8B3+f5p2PbpVi7i7HerKuwM7qlGB3SBMMKXqz
	Wx+WOf/yaaKWhC9OE/iM+7FruPaqEwGr+mQdTPbfxCMwvEWvkfYowVCI3nNTGpFi
	FLWrDMlMmbzST0/hu+OdTUlbDZDKsy20e9LOFx5xX6craDkvzI8BwwPIEipYeTU8
	bcoMBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr562b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:32:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb530174f0so16631085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776673977; x=1777278777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvO0uuWYdMUzqJjYcJ2rxcG6gv2UzRF/Ik/LfOP+nPE=;
        b=CQNNjhgfHwrQbeSjttkLSevYsk06lh5nMzmjdZswRclwHUz5EQAYz0A7UKILoBMPNN
         MwBr46enWG2AeeokOo34Km1l82DUvttl20Dfs7b+J4tolm5vdSE10wtnkyyKKoDFVJt4
         lfAFjHQ+lMWnTMCHvRNmMy+MhwcZBSu4ASrUQt5MiIipXA/7DnqQqvF1E4heDfPUf5l2
         ONxO7CzopIc05lYFfPZtyQ2BJvC5Yv/Cxo0pQXmkUkQ6uhWX792zpBanSY9EoX/HhKGF
         dxwql/GeYY61CoitU0Tv2tia071l7MJna8nlYAcXtQ3i6GqIavZjDDg45Pv/gPKxlHi7
         DicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673977; x=1777278777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvO0uuWYdMUzqJjYcJ2rxcG6gv2UzRF/Ik/LfOP+nPE=;
        b=Aa7fY7RhV7HtknhnIx06o0uTwl4A3mAtMBKjRtKCB+js7PLndr3EQ6xTbO5j1OBiME
         zSoYEl9h8CgifM1mPCOWisJMUSiv0Vuo0JRolCswk2+OP5mbiWn+FQ/oJTB2HVhQQPqs
         u3Xt1T5HCatorj+wRLhcnq8fhVcxBkm59GnE5tu2394CirQl7a9/gksI2uDayqbVjNGy
         B/ba/YuThXD0rFgUu/GaKOoZn23iLhhpVlSiaI3F/ox8pFdjhmKfo9p1RWr3eP8yhbCG
         lb6KidkSLBmEk7gZWhLPd1iJIy2exfToUEhpFrJfwnbdw8FTIfgCh+L1EejZ+WAg3gEw
         RQtQ==
X-Gm-Message-State: AOJu0Yw92NfD5rRvZvssSmjKDXu/oZdPwu+VluT9Iz3G9btmfIaI1pO1
	ijslJcEzFNdTqv9mdiIkBy3DDlpukcu5Vhh/+2OztMQogJhOMM58yM/8OnVWPbK3RKXaPwBnzNv
	taP8Mpe87D0gDx69ftQIMdlJZ0Na9C/UklzCetJiJ0dlVKlMV78PMgBsk0znoMAcjqBVVVPsPGa
	hT
X-Gm-Gg: AeBDietiT7qwNi/ZWI62EwE4QeCfyzXfGYnShOVYPtWHtpHwc/bNEh/lLSQ+bH/d49Y
	BpygzWYKzxqDnxHFO3ZIDgFEIgwPElzxrn9s912uqRZ0PNy3mTLbB4ChvNqNhh2k2IfCabjEPxr
	dzx4HVcsqU07Z/0SJuI1K163umLplOm2tH8aD6T8U5Gi8XP5/D8Z25yx03YU44A6wDbgN7pbQT4
	w0bZ+5tgi6PdvOZIF6Kgff1J22O7lQYjhTa9XWZMl7tUihBypKekf2Bn6F684ZCPhl6MH3kLPcS
	6pQbMUtuh1mHDEv3E8RkYO3NMSZ86sR1DdUMPJW6IdPsn9amgT1LTBlOlM1p+gTFrgwi9QhV9mH
	U66MkBWW4DzpImpOhXvx4aK5nDQ1SWMeYmEaclWm1i8sJwgDdZTAjgRWC0esSQzBGcTX6zF3l2g
	DLwVUVgtlk2bfj3A==
X-Received: by 2002:a05:620a:4609:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8e7912c6e5fmr1241728885a.4.1776673977247;
        Mon, 20 Apr 2026 01:32:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8e7912c6e5fmr1241727185a.4.1776673976856;
        Mon, 20 Apr 2026 01:32:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-674b7639494sm658448a12.13.2026.04.20.01.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:32:56 -0700 (PDT)
Message-ID: <4abb1626-a0a3-45e1-9289-fee366a8d9f0@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:32:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: add several missing pdc
 map entries
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260419173251.1180026-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260419173251.1180026-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MSBTYWx0ZWRfXxHi+QHle6PBV
 9ipF+UNuad73qY6XqpclRoOZQ9/wfP1etC6Om9nOCJTV5UpU5nv/FLtzkjUQW5can6evMcmO0YZ
 S2pSSCBIcja5G9fWFjy6l3teIp00y3aS/R86B04f9TpxFtoO+EWXd6xTrp2b90iS67UZXNwzApG
 h8H+ovjhCE9c8gKzrTvZ+f0ZqQfpEy9+OjqWBY9qcV1TmoS6zIdnjgbRFYVfpJp5Q3B6+h5irG5
 jQUX/qXwDk2FPGjRYYtQQWiSmSCQw04xDwqsVR7XcdxbkTg7/YG0fsbuNV6DPneIASzKEH5kBzy
 PNfqvgdtPhJOdb5+YDFhWXfS43p7Fd5lBHq7/fC4qD1ybdfBPFgFE3OccZUWlmzm4BsmHBV6mCV
 fJRKiqwtYbX9HyAaGpXLCkclpNwmic5z/vH43AHN3x6nU6S8w/2vVk/UbiFjdLelZbTpzcoz+UK
 XfIgV/rcOGFeP+UvVvg==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e5e4ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8suaKIpJtTEVhA8buzcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: YWdcQ3Y_oxikpm8jkC5JU3Nid_lz6kCM
X-Proofpoint-GUID: YWdcQ3Y_oxikpm8jkC5JU3Nid_lz6kCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103695-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b220000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2F45D4283DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/19/26 7:32 PM, Pengyu Luo wrote:
> pdc 215, 256, 257 are missing, but we can find tlmm pin 103, 84, 90
> are mapped to them respectively, so add the map entries from pdc to
> gic. These entries are reversed from .data section of qcgpio.sys
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

The below change on top will fully align it with the data in the docs
(no functional change)

(yes that's a removal of one irq mapping)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..23e80c765384 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5310,7 +5310,7 @@ pdc: interrupt-controller@b220000 {
                                          <66 438 3>,
                                          <69 86 1>,
                                          <70 520 54>,
-                                         <124 609 28>,
+                                         <124 609 27>,
                                          <159 638 1>,
                                          <160 720 8>,
                                          <168 801 1>,

