Return-Path: <linux-arm-msm+bounces-103103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F00OMcQ3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:02:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F43F85DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20A6C306115E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7633CAE9C;
	Tue, 14 Apr 2026 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLZzccXK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WhR/4fAA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E924394476
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160764; cv=none; b=PpXWDUg+IGrC0VFTNQZS2N4xeh8MMPOMVYzd4i3o/Y3hrHS5dT53cM2t0T6BpOpTgqjmTWgcxjx+rCXumvcs1pi/tmNbG7BtbcFzWB9TMviXs0/4v0ORAYEiUWENpPKWMmeOpYWUg7GCp6Qk7uHNU4AXm+JshnKsRrcqijc+4PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160764; c=relaxed/simple;
	bh=klFXDLbVbYYCmoz9dD3m8IzQK2WxOCLICjQ6S8ajWSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrY3dC7zuhrdlfaxNGWH20iCshzaQA+B0Sg0co1FK1HPWoQ5w2bNk63aUGSCk37vudfkcuM43C2Dd1gqW8XVWFWTxjuywHCZb5xKPND/Q/AXFb8RDpUbPFUVYtB7gGNW+ATv6oeaIwZzmPhPRclOGO96p31Yli/IJSHZQYWGJng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLZzccXK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WhR/4fAA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6Jw8c2386476
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V2Vn5yshvoyWknHL8GQ5Y06VZ/WdI9bSyJ3LPPoTQkI=; b=JLZzccXKfC1Km5Iy
	mpI4h1TjkD6vmG43NXuGE3HYB/8ODx1LD/MZPDfz2q2PGzQi5/qeupWkbNBlhjYq
	tUhb3k7JLbYKbB9a9Oq/E6YOekEm2aELQutW1aj4q1pp45fSZEB60NwKU70CoLUJ
	y2FIyprPzNtXdSlfs8BkuUyCp+Xfyph945B3b62M8yqMBfeSrQ+AeknoNx6dIOPV
	ncM5RBw6LQHpSSVw038/qUnWKwUmW9iVk7qDe7y3u2I3Re/B24YyNGRunI+1gX1m
	L+qdCCCzZCXvZ+kW7H45/u0V+LwmWFv64Iwjzdx/NKpg9l3FX4p2QbP7a3QGz7M1
	iEWHvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w26jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:59:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b33a19837so16751651cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160761; x=1776765561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2Vn5yshvoyWknHL8GQ5Y06VZ/WdI9bSyJ3LPPoTQkI=;
        b=WhR/4fAAKj9eEHEdqpvlhBGa9jPjF0+Nj7tRq8+VGF67eG5YxCjWC8JNM35rtqIK2O
         STIzSXmVSjm9x5F5Y0ltqsx0WFndEsOopLOLJLU3x2L0e0WDfY/ko/L+4uYFfPzwRK6y
         6EpDIYodGrTm4eniDjJHzpDIq/fbCms3fFaI/sOT75VIqgXoAOD9V5M5SCAiso5VxfKV
         nxw4vhnBOS+IcygvBivh3EDGLKMIwt9XLWjvGggVdT12/9VwMBWAt8Wz7GQDMvIv7tXW
         ai8knD5QFzr3j4Lfl6nG6YAEC1dhZxUvGEsqgSafrhTMwgF+KsadBAidgUbBaB6H5czP
         Iong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160761; x=1776765561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2Vn5yshvoyWknHL8GQ5Y06VZ/WdI9bSyJ3LPPoTQkI=;
        b=f80WYnVtD7ZhCwz/1C/nsgceZBaCGOH8vXRaxQmkHef+kVPOsO5T0GMExMJB5CjZvL
         PytgwSTrjQD1OvmAtfGIkar/CFZ+3cJfWethKKX+7n7TPNmi/EqAkWHlFo8aW2jsWC/0
         a4h8OblGMdyuWEx/rvvoROuRINVSQVH3AUx0BoHfjSMnYKLGoy3nskz+1i8AtWEaTdcr
         AHNA4Qic6yQIOAf0aPR3a3+lpEZYFPFRQ3XZohixJuWUCdj/deUvnOdTiWIQJ46JmmYy
         tapJJxDPqGjR6UH1ARCcOPmSzADYeiSXKaU3cHWyN++9qVpy4XZ9TPPvnf1kMwnhPcml
         J/Dg==
X-Gm-Message-State: AOJu0YxrGZl2zPPuY7eiURKYBBWrOceAagbiavaFyGBjkcxxgb2Mnebp
	eYamlFUjxMZj3H2B+2ipG/1mlQV8Hwf8AA2YCv/lMkseAs+zlaGwcQ8q2cwWK4CUiueQMF+4End
	RIYs4hcodTgMioFgCbUaV34MljelXvuCUCfoHEpezJV1gLTl8e2IffYOYZ2M1SO3Z0sx1
X-Gm-Gg: AeBDieupyzuxNOZz4A+Yy3GsqwC735m0E7C+x9Emq/8EXn27Y3zBDz6z9hQ0MWW7LZA
	+dD3cmM88S3e3C4Y0MGqwJaxrHdDjFz+MOrGz4Z8zvWsqqfOxc8IRQGqWaDLk1bX3wMt6wr5Sjr
	gxJ+NtoLAvevFye05oUlcTkTbl72XA+09I+J/tj0ftGPdpy9zDmjFIwobyVnIbOf7lfijMyJCh8
	IUANDYQ93i+9MXuIh6CHTNrTkD5PtAsxeixn7TRc+K2+w5uD5ySkmrbR2HAOp6CHtRFEoJkvumk
	ReRkYOKw3VccTZCp3agH7gHWzhX0AO1j6nJpVXPMfiwQcz3djlRwZ6uGQxquIwmQi4AXgzH0EwL
	FvS+sjbLEk2/y14ugiapO/pKXfXKJAiJQ5XiYMRYNWINvQk2L2yW/TqtpEqwtP5uCZFDPs8R3SE
	DBayq+Dn42B6RraQ==
X-Received: by 2002:a05:622a:5595:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50dd5c8b23amr179814281cf.8.1776160761638;
        Tue, 14 Apr 2026 02:59:21 -0700 (PDT)
X-Received: by 2002:a05:622a:5595:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50dd5c8b23amr179814061cf.8.1776160761163;
        Tue, 14 Apr 2026 02:59:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd51bcsm390292966b.17.2026.04.14.02.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:59:20 -0700 (PDT)
Message-ID: <893e5d51-61d7-465b-9ba2-78a0927a4bf6@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:59:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: lemans: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-1-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-1-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VVHXJ1plBc0cydmJtDFSy_ZTsZerg4YH
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de0ffa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uGyuuOI-cJ-b_BVNecgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfXzIIJTQ+2QDW6
 v3LWeNAODxfmEpto2PAMAw/VCxZjGr0jiZmA8mbEJiukrcAFEoGOhAfEHzPOhJwJh5aLzEDBzIj
 RtU8ar/ZKLwuaM004NRiDEt2cZQMdwvQ57E5TBbdrSwggG+3755929iFreyJTyVMTaAEJXRgkRI
 fTB172LU7C/ecAYhVnvZThskw2do935bnoWZ1qJPEg71jfxQZC66gffdppR79EZhglWJvoONzM5
 +RbMOqqCni8zf/rcpWi5GkVauG1u4pH217BeHOgWrhZWk3LiAKFwtxuNeLEsqhN8hwAF24T+L3a
 wXq2/CSchHZMhMrX1pANadKflSYDMmdeuo3whYVIN07z3v0wxK6bjhyjNmhNQX4hO5ANsbCs/5U
 AZidLmZgmP6O6Z/w3OQofoQOFVn0lA+wWcVMRycsBfHZLW6PdEcV6tE0c9cZGscbzwlNe6vmd42
 W0vQMTIr2rfLNUal15A==
X-Proofpoint-GUID: VVHXJ1plBc0cydmJtDFSy_ZTsZerg4YH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103103-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 529F43F85DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the lemans device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

