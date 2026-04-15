Return-Path: <linux-arm-msm+bounces-103265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KitM21f32m5SAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:50:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F9E402DD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B33431A5ECC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B7D33DEF9;
	Wed, 15 Apr 2026 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5tcAefE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIOzDYZr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4242933CE8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246216; cv=none; b=DMsYzW5v/cfxvJiolvg0ImB2/fSkarh9DAKcqTksYVER8onfpkpvW5drz7E4IhMf4MM2tR/v7Wx/omyOFhHqSVDVu2iVVkp6rRimlpZlSJGk6jb2Z8dbO2akuGs8TRkvtoPfYj+16JxmdMRMEUMWjTQmROrcM3v5rHUP8o68984=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246216; c=relaxed/simple;
	bh=BkNOkehDJkrp4NHd9wg0OovZlITEy0Z536OQnRXE/Ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJNj6a1aMABMag2rmr4jG2TKkn6DeVk4Fg3KyHwo6e/0kGweAEYDsRkj4CO6WdMMKt2vg+RAuT1HnQCCJT6NGroDLTXJ0/pC7zwwzd/rq4ojeijJ7q42Miv9isn9Xn2Vspnh3J5xmrGw3JycCn1hyeu7fEkBdL5LcmZ/Se1X8q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5tcAefE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIOzDYZr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8uMOO1778805
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZj/oxg3uNVxM3EIb797B5MnQJqyDgWAp1DNROgmC5g=; b=X5tcAefE8UpDqeXk
	pR0j8DA/rR/Gc4+02N1376/bOJtmWJI+diPOy5b0jXsJHwHkgQyAIAYPl/rJEeu7
	7liIOpf1t01rQTQLig5JoWS/I10vbQSWA6fiSSR28JDWL+QfhhTOWXHKrBzW2xHi
	zhzB5gUT5rNBWhvtfgRoR6+v9D1Ho7B1b/w1QBR8xpR/9uifUYDMSr8giLiw3mDD
	BO/CzJgKH4SBszttkrDvrxv74EIw0Q0o9mOS9hRP3xnRyslhQoBYPmA8bLrPEqzg
	PxsHstbxyFhkiVOBt4lIgkmBNrigTiI74vGCri8M4mF7dLHKbEVuehdmn9XVeHak
	yfFvWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw031ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:43:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b9074bd42so17869631cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246213; x=1776851013; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZj/oxg3uNVxM3EIb797B5MnQJqyDgWAp1DNROgmC5g=;
        b=iIOzDYZrgTc8E9Uah3Re+hQ+6uhDHDNbHt589q9Kz45fMdIrCyIJOUKeiVTfLkJdLJ
         koA1YezSXSiUFTpVJDgwnwPZ0jJcWU08yS4lwYLGM75IJ7cOIbTGB0frY8qwGLz/hvow
         EUHklef57tsneAWQFGhYbssuzRKlqCMjFSgyg0vJHoA2JlCHYu5eJX7Ip1lAYMct77bU
         BmyYXRSMxjfqq2yoadYEVbB8hS/XNCftM8nR9mo2NPid7zXp29WPEtEBPTmU0cgMM2c0
         nYv+avyZJOU2o4yqsS+lx8l9Vgx0/50JxorkdJLIQffvcZdJ2bkCMS+a1S2gfq/R0XKe
         OQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246213; x=1776851013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZj/oxg3uNVxM3EIb797B5MnQJqyDgWAp1DNROgmC5g=;
        b=sZBKhPQiQ+uBwPj5FLbDkhcPBVUJCxgsGZAMcrzl96c1NcoVsyX3I7dVS+DbXAYbn4
         pWAacKm9HYPywenuBTesgTunFo0B4nIQ/S7d8c6fYM3SAqy55//3qLoaCklP56tM0xN0
         2ZblRdid/M6QeGuhB/F63MC3yJtJyYcu9V8WHEksUc/n1McfNbmK7ygjee+c5PZt365J
         ML4yYZusrjMNCEH682f/pjM8UyoEupUfTkNJ2xBPCZ+oI5CH2eyRPGP43/ZQzrIgqyd+
         2Gde0aYlRy0sdVkXXOL2Km/ySjbYLdSf1BlTdWIXrhizPbOE3QISDhug2aq6RoU2b6q7
         irXA==
X-Gm-Message-State: AOJu0Ywuw64x/sfUjGW6O/+zV9C+oFEiKC+FYSWrh6ApXFTK9LFzkt13
	MQJVtdDcX5AKExyBPEa8ZUkkGlV60P7VzwEMhYFKNfOnH/2/FuCNWtYBpwumSv8ydfkh00fbKsQ
	afVltiOx+WgIbnmYOSMboToR+3Wx+RuSa26PtVtLUU4eFBoFiZ4/SGagf7r+1qn16hxkz3fLsWs
	3I
X-Gm-Gg: AeBDiet25/3dODuPcMQJ6BwL6GtWOPDdO3H1rU+5NcpOG2Giw7hw8nhuuO0/h5KJ6yi
	mez8qZg7/oKi7MYcdWamKXi3585VwqS6Xx9Q8vYYsU0MRVFe7X1WS5WJlS/i8VjDI0c5AGfMutn
	9azov11TqG2GPy5oSAAZApPs992ZN7cy1bLhiakuXP57lidit48rUbazIUgDzjOjHz1SwWxuLdc
	jVqRkZHt1xzc2jP8NxL3os5XosxaN0F7ip3YUUJ2roLFMFmTB6Aur6JmS2DQl7CIrT4RH/ACkhe
	CKJSyUOf8W7c4HrIqlMBtlS/GdQRgXx8g/xaX4bb6NHdvhG09pmPPex2Yo1lCTDkxaYPwxcFjyB
	ExSDA6N1bXOPIMZuqgMEY+6d/9F8x4crrXe3ZPNqQfN/2t9v2wwD0r2RRfyxTRJyE8ap4y0Jn80
	KXTxlc3G0lPuflUw==
X-Received: by 2002:a05:622a:4887:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50e1a7c066bmr15166121cf.6.1776246213471;
        Wed, 15 Apr 2026 02:43:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4887:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50e1a7c066bmr15165881cf.6.1776246212913;
        Wed, 15 Apr 2026 02:43:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba177dd36a5sm38267266b.54.2026.04.15.02.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:43:32 -0700 (PDT)
Message-ID: <42649c1c-3868-44ea-8186-49e34abf10b9@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:43:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-1-03b475b29554@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-1-03b475b29554@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TViDvUd994LCcKVyV2nF_GyGpt-wjHfV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4OCBTYWx0ZWRfX1x/csEfNrsGH
 XdiNbaCRIPO/2FPD8IBcPV30M+ppFmKXyEqg3EQxFeFgwnIY4W3yhIsLo3Fx1yn8AlRQQfHY974
 YgW0a1OZaAh47O1UUgS0vAJW31iV+jot+9bFmjzXppb3+HwdOqqTxKpNHKtQFRbQQvN64WfZQa0
 jgdpqGlNrh7z36wV3YpPpYa7kZHeaMxc8wiQJ3GNxSi+SHUk8aKwAYzESMFbnsmCneZqZCcSGF6
 tk2JvAEpDCAYN+NbuWVWU8U2xJklaGeXexW9WisMkwlDG2m4YTnRPKd6ekmZOvvNXeu9jCAh638
 96tL9zR3rU/cBnOrngDYlFlw6gl2s9fVpAUBuZBya11R/BE/0CiBe8HD09FTAbxRz/n7iz0+kZn
 gh2MJ4sgxMd6f90I4RbgCesTPVL3bue4YeAY4ORwk7xHdtM9pdRs882JA7WJbxZYGMmZhKuUvtD
 Esqh9rcDBnDo7lSEpxw==
X-Proofpoint-ORIG-GUID: TViDvUd994LCcKVyV2nF_GyGpt-wjHfV
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df5dc6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=G6eyCl79rmFccwun_h4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,mainlining.org:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103265-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74F9E402DD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 11:40 AM, Nickolay Goppen wrote:
> Changing FastRPC compute-cbs' reg values to matching iommu streams
> solves SMMU translation errors when trying to use FastRPC on CDSP
> so change FastRPC compute-cbs' reg values that way
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

Fixes: c0c32a9e3493 ("arm64: dts: qcom: sdm630/660: Add CDSP-related nodes")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

