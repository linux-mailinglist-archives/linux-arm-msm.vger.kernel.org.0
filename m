Return-Path: <linux-arm-msm+bounces-99257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNeNBiM7wWn2RgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:07:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DAF2F283D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17719301D24C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EC01917CD;
	Mon, 23 Mar 2026 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tn/r/259";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjUcV/u6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169561DF980
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271153; cv=none; b=M7F6WCT9wXYTxwQN7MCJvfHTsFKb2YOQQDnNnza/Fql8Zmp4cuxsz3V00L3rL341Z8ByeS7DlY5oQdsY5HpiUYJmQSnqyx9Vq+qtr9T6yWgQLGNU04JbCzxfyBwo8BlPcW1PTW5rV6tL8KZamwx92id9sepXtr5cVK8/mMdzjbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271153; c=relaxed/simple;
	bh=5pFvHn9vqBZ5iZp0mdcgMnSXBWmTPVnlI1yromavMG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOLpDrEudRod1NjC6pNdxcyhdsZXnVHrOXu0VxbOxaMkhfo2lRqPQDCsytPZGtbyZ7+uRmVZmAe6EfWY9X1VuyjobBVZhaD32SCsf1VQ7328AOxhMQ3OWUY/SkUBTrL86LemGyUbSth+ypO7wtPdEb0bLSIf6kW3MRo/xMfVBaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tn/r/259; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjUcV/u6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7u1gY3468329
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5pFvHn9vqBZ5iZp0mdcgMnSXBWmTPVnlI1yromavMG0=; b=Tn/r/259maIRFrrq
	fmuzi4F5zGM31cE4KEKnViiclPM+MhmYKFLeFuSE+1gspYs2zX/eHgOL3Te6N+GO
	b78KYq/UhFxStsarLkDjTM98z6s0UXPaIAvsXEuK8ZGxXXY8kvCGQVrms4HnqgEW
	ta+cx2fSFDSgiHoAhYurZXozr6rJDaKlQKuM9xp69BVO2tFXZbSD9gyhN6pbeiT6
	0VUvPt9NbyaA8/1ajI+EB5zYCkbIjJAlUybF4PRVahXsnkHHoQJ0P3TcArxD0ltF
	HEDfnv4zom5ZkUu2mdyXHnQhbg7BtIPD5l0DWEleOO2ApXdnJ1FHtrLMj1l9/H8w
	abT0xQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgh2v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:05:51 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ac645d5bcso388620241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774271150; x=1774875950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5pFvHn9vqBZ5iZp0mdcgMnSXBWmTPVnlI1yromavMG0=;
        b=WjUcV/u6yzi7c5u/u7AjUh3FTYrNrADuE5GtzwJrk7Um77bpbZwQfAoILfsKUOo7/k
         PqbzJh8nK/l01CJBgQdTshduTFGpkd4xjD8g9AgAIak+dlMXf6SF9NywTffMY8lb1Crm
         H69zdF4bEY9JHXlnsMUhPfL7+VoZ3QbxD64bLCyPUAyDxwp7hXXLrU3l4fVYolKyEP+R
         ODiyYwKq8wcIhwBX2o4gG47cwcJ7LL6nQFhiz2UxwPtw4WjHbfEyYbWTKFI0aHEdvTEj
         I5qUMtyXhl80M9yoFJp05QCum3Urlo/MK7Ner6lFOYTM3b7lmv9mKtdQfp/KMvsEYevH
         YiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271150; x=1774875950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pFvHn9vqBZ5iZp0mdcgMnSXBWmTPVnlI1yromavMG0=;
        b=bktZyKUy9dA0tLuzTMphK75iKlOi72vg+J209enrcGwTnd0DP6gWPbeL2AD5gbaP6c
         Pttft7I2RuJfyJ27BS/CkW2umR+ZxdAa8gPxRRo0Dl2GI3a4Kru+oQAPsSAA64ybPDpV
         lABCHmoJ1DFoCyO0fioHKI6x8zXXDpEI/J9IOJWkg7vAJ4aT9A6gqJdrgN6iptID4iX9
         KHgbSaSMwAXLhdlosPg9y7ZdS1HUpiMuiXk9KibpkYAGrajolgSk9BApUGdDuiBXNp2I
         bvD/laXkFpVQQ7h+dApPcv7OVFs8ALPTuIcZ3WNnHQhgZ2fuTBZE3kt9NMTQn970dbPB
         Unng==
X-Forwarded-Encrypted: i=1; AJvYcCWGwqXvfzXgcEuRqr/n99WpUmcWHhZSXZ3h0KTJkTFR/G1k6d3+lGM0YrSa6pp+S1gxKdXG1ZE0s15Be5zA@vger.kernel.org
X-Gm-Message-State: AOJu0YzIwq0tZhAgmrGyVnZsSSEGRujH3kM0ExWHpgcCpWY1wbjxaG0i
	3FTDI7MG+ftrqoqFGPTHhfYHgnY7rZwgCUJLc7nR9hRDeBcq6RX0JNEf6hmNqXIW1TWzUG8DTSp
	nIXyM90JTipDR5UMpd1N5XBv9JHad3TtYTJg+gEJnkjNDDkcpLxpqbHmQlStI61klg+jk
X-Gm-Gg: ATEYQzxDwHnytQjBAoqWQgWUS272pAK4aTeFCHFulmTEruNS+awxU/8oEH5OxCeTeA3
	HcbyzJORxyvqV1+rK84sgS1FG1PSvnjnzNBg44OF3RdBsvNLzcBj1VsrQ5FEEinLh4dhegaWYu5
	UOlCgdREvBHIF8uso+aVn4zfP3P2O5z50EIkmQw9blKPI3PbBRQ6SCwmzP2ry/TLo2QevcS4ieW
	KgD+llh1u8UA0PPJh1pn/dBfJtptYbdnSGATzv7gatJoLlaliEITh/aBoPAUZ3ezy9XvcruPS3A
	3E/Wtcd9Aw19mCtpZy0FbflGrJ/DiwJYEB1zpd8ZT7K0Lajp878siw8fViGNcgW0zL3dpBF4YGi
	KMd3HlTSpYEIhlnatOIPMbjkjh+QxNBa+46aUktF0VWIC4C1mTq/Ky2ebm60TGQuVpwoQYS6T0M
	9wQ98=
X-Received: by 2002:a05:6122:c244:b0:566:fec7:2ac3 with SMTP id 71dfb90a1353d-56cde1c89bcmr2016513e0c.0.1774271150446;
        Mon, 23 Mar 2026 06:05:50 -0700 (PDT)
X-Received: by 2002:a05:6122:c244:b0:566:fec7:2ac3 with SMTP id 71dfb90a1353d-56cde1c89bcmr2016481e0c.0.1774271150017;
        Mon, 23 Mar 2026 06:05:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8ef74sm483058866b.25.2026.03.23.06.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:05:49 -0700 (PDT)
Message-ID: <a1a1ad27-d4a7-432d-9b33-1169e379fba1@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:05:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
 <20260314023715.357512-6-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314023715.357512-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3RzMozdHQxdGZ583myaMsqbj1cqou_o1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfXyUKCmy/Qo+08
 ypnY/4jf2ue2rEMsVM5dY5DEkXGXGCPkmSIvsALmL/ZVjoOrjCYtcpSrcCrv76CJNeqSq9uzP1l
 MveHHmgxeEWQ0JqvwpdITqxkVHPVJAlIPTHv1qdf0LuDWdLpxje5f//W9M4NUd9OBmgynAp6QgN
 pDvXO+IOwaedtABYp53b/p460aZu2Llq6yNebhWgGfGmsIMIkPm5A37OeJgGnOwKL8N6OyAlwCV
 CHRaP62CWEFOE+MdJ2j6YcCTYvt39JDpUGowUw8yuwSHeeItC0enNHO/Dd5Npc9X7asvjQybwAr
 fhsstDLMkQyVswl8v9I+IVkfXfhX6k92OoOLlHxyaGQnXpEanv5GDb2g/en+WhLyNubWZnyYrct
 WVR4ysLjWgp4qQPyZUc53IumgoRvfRw8hjaNF7cAoaB2w8Al+bV0szg7orSMTxZ7WaTHmtc2nls
 2Iv94pRIv3mATByvKUQ==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c13aaf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=okWnqFoet6UbQCsWwnsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 3RzMozdHQxdGZ583myaMsqbj1cqou_o1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99257-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: B1DAF2F283D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 3:37 AM, Vladimir Zapolskiy wrote:
> The restriction on UHS-I speed modes was added to all SM8550 platforms
> by copying it from SM8450 dtsi file, and due to the overclocking of SD
> cards it was an actually reproducible problem. Since the latter issue
> has been fixed, UHS-I speed modes are working fine on SM8550 boards,
> below is the test performed on SM8550-HDK:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I see a doc saying that DDR50 is not supported instead, and that it
should be reflected by the registers for SDC2 (but not for SDC4)

Konrad

