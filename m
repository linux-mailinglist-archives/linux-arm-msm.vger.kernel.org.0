Return-Path: <linux-arm-msm+bounces-92702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLuFCF7YjWng7wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:40:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C7112DE4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C34D33072452
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C953935B625;
	Thu, 12 Feb 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bkuicc3o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OhyehKFD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA35F2C3256
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770903608; cv=none; b=Fj2erjK1x/AeoPdAZl1Kc+pyfkREb4nEPOLMOkmgZxPynrrDzYsNDPlObzyNvU2HHrQc6DoQtD+zjCUmE3bax1zRggndc/rX51UERCarFxH/xUYCfkYagvaZwdd1nrUE7jaeD11M5ODs0CQuhKC1zl5sQODI1XDyqN6QMYPyYlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770903608; c=relaxed/simple;
	bh=37nmRJX9EO4arGdOBh3262kRhsA4ftvsqovvuF4ahs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aAq0dC+aRNajDa7hBxX8R/q8abJOzkt5rZRNPJksY/Db5dquMyMA1J0sExzOVQQYLgH2/Rwl+J+GGwHc7K3zkGYHu1dsv58S3o91l9zQVDqF7HVT00CQURNdoBDBEde0bTnaSESW+6CcfaDxA7blAl8/fJBmN3dnVPOVICDU3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bkuicc3o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OhyehKFD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRfcF4033368
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 13:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcK5fSU1qnyLksgd/ye6w6DIO67sN7Wav8zOZ5kFybY=; b=Bkuicc3oTzdmBNVd
	XNomqQDNk+iRTS/jZhBnPwRz5ps1RTeLAiIvqKYeMZv4eHJqpMA5/EnlZbg5vuWP
	R0WEwW29zKGE53og+shbRibLn6qIToIyOP4wUOGpC2d2RuTXlqK1iN6g17vs9PT0
	k9DW52Yd/oj3u33VQ4mFyPaxctW7M8eO4eujl/HYwgTyUl9GXU9yMReqeEzAhmi1
	+jnXOVO2cMrNgxQLDvKYkbcAYFge1nNK875Y/gL3Zz0JzAtJu/4PUlsk9/+8LvQF
	BaPW4F68kTo5Kb4Rbv5UN8etTHQJDVK6ugIA7K+K39zal9bzNOcbLzTVhsn22/t2
	BdQr+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ck2gphk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 13:40:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso168074385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 05:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770903606; x=1771508406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bcK5fSU1qnyLksgd/ye6w6DIO67sN7Wav8zOZ5kFybY=;
        b=OhyehKFDqKiJqwtoOKaWRFGDvMZmnnbeP0gGv/dUULcz2bXTFePUXha04VxOasQEJY
         Prb76+L6ayMeLo1fCtw6kj4zVxnmngs/+9VcHYDUQHsGnfR2dlczLcRgyBbSKg0B5woa
         8PXocWHIc0gAGqZn2mxXPRL5vaFb1pshaQCFowtKiD18QUB9d36ykGq7FHHMJ25HDc7c
         hIv2dQXS9xZ+EnejcZ/Bc+1qkOX9OmpZYxquVOwPYJtqDyampeEA0NniMmpOPsLnpTc6
         BcB/tciHzdxE1s183UlQ+Zwb6i0ZXSzMcC7cW5qSvr8XSBIwCmmTd9i2UbiC933i+jK4
         nokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770903606; x=1771508406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcK5fSU1qnyLksgd/ye6w6DIO67sN7Wav8zOZ5kFybY=;
        b=jDJDuhDLyPvLmxx4NRUiDG7L5DLry8Zh3tPI0ZZZk4fa49b4WN02x4iFceDN7Iphcw
         0QtI5artXWi9C5/fpi6Aja+4OkYEhxacNDonQDBnkR7iBvaW8jbi767tJ0UWPXRTORxh
         UKN/caO5rN4ceFGGOMaN/84A2hWcGGwfvf1dJHlr2iD2wBmea5CaH8bL5YKR2jatjwxe
         5p71qYJlD+6ZCXv39Yb53gvSy2EJwtSLfOdB+znkdtMxzzkYkUex+hCP/Y9Q2cmha4ds
         hszMhEENvaHRlv6QNIRrR9hzNwav+IfctWYmhhrbHJ+XdySmcyn92OAjUKdCN2GW9kN4
         zFXA==
X-Gm-Message-State: AOJu0YyuJGHy0g+RRg6t03VEQ9sTJifIl4fitlbk9Rad84XMG3iuHQwJ
	ssMSh19WxZYMeH0iGg42XL5Q4CYFDOuyyTXoF0u/Pzs7JqjWjKVa2BBKLxGO/E+DY62QN+R1kuC
	bFrxjRFlY5F6Z46UAgF9psF9JAzKV8jRIM+C3ScNGPOFn6o/MJObaizetUnce1+ugm197
X-Gm-Gg: AZuq6aLZ29THddktbCxcSRXxgRITu0fe9MGK+FHzy/QMXchHwYGkY8vUCrS2PVCZIih
	FOro8DLIIYpLIgNVDSswcMiBKcnvW6OH+7RZbcQKkc84gD7o0+2uRr1vvDsbQYi7oWFWjrQX930
	oohhcu5MvUsdf18Jiep2g1IeppXfJavOmujNnzl+njHPpYUcfNpS9Ca7JBeJjKmufLHm1thKcYg
	opQcCHfo58hY7Bf2GXP4bq311swAHIwNxB9kKxdhBLsK7GNjTGNrMMnJI/pWtuai5C28W82VxDb
	H9u52WY17wb3F/Q4fV0mQ4gYwJ/1tlw1z43DJlZNOpuLdNyB7SmuQSPdrz/EHtBMsi7T0UxHn/Z
	gzAuUu2DwIv77mAb9JM0lOTgVXIrYRzFUwgsKOQycJ/XIOxCCCYkAtqv913Qpw5vTqX2kYca9/R
	3OUJA=
X-Received: by 2002:a05:620a:31a4:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cb33094356mr265614685a.4.1770903605930;
        Thu, 12 Feb 2026 05:40:05 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cb33094356mr265611485a.4.1770903605436;
        Thu, 12 Feb 2026 05:40:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e994c62sm160645466b.16.2026.02.12.05.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 05:40:04 -0800 (PST)
Message-ID: <957d7896-cd01-4864-bf07-e6dbdfff1273@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 14:40:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cd7fb3DM c=1 sm=1 tr=0 ts=698dd836 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EsiAks0rYVqV3SOCDX4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEwMyBTYWx0ZWRfX4ziXzxbfmmxX
 9sLXBukr4uRUbprv79Ek5f3ezkiEhwE9LutVYwSrWanLzcuoblTzEzNnhTBLV3C8f3IuZNN/HpD
 yUwNcmYdHxWpvJ75Z+ylJ5WKbLRaLyXSTEVmXuFfG3vByJ3lheAEG4kfHUOAm5NH4gUobWs+fTx
 JU3fRxnl+KAQ3EsoWfqoInLWHADf+2AN0w4dRGytPeE2jCk280zpZydKF8ksboeLawfuLq1xpS2
 RcH2PdAbQBUzpYq+qLgU0plenMNP1etU4QeRzVrYPoN8GqgX+RT3gWm77nlxOmWz5TQb9uAAI1V
 TMbpM+RExMysmez33Znr5Es9JLI+hsZCsay7t4ffyKMuFFdk6PXAXV/jLXR/zDSGM7ZJjlhmiGc
 2UHJbmy34pQpduj3Gq4nGdaQjj2tEW5F5sL0qhQ6o3B06qEtSIBSMOj2IHeiYt2joR2aBGMwBt4
 g3skLeSfxUDB4/PMNpA==
X-Proofpoint-GUID: 9cWX-6UgpAK9QjaLBcWGWUhBsYAZXdAB
X-Proofpoint-ORIG-GUID: 9cWX-6UgpAK9QjaLBcWGWUhBsYAZXdAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92702-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81C7112DE4F
X-Rspamd-Action: no action

On 2/10/26 11:38 AM, Umang Chheda wrote:
> The Mezzanine is an hardware expansion add-on board designed

There's normally multiple mezzanine boards (e.g. a "vision mezzanine"),
is there a better name for it?

[...]

> +&tlmm {
> +	tc9563_resx_n: tc9563-resx-state {
> +		pins = "gpio124";
> +		function = "gpio";
> +
> +		bias-disable;

please drop the empty line above

Konrad

