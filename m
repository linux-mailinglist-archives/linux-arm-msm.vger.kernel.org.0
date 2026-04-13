Return-Path: <linux-arm-msm+bounces-102890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMTRH56o3GkEUgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:26:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 745833E9170
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 315D730013BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0AF382F2E;
	Mon, 13 Apr 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eC2Zia/R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgCObfj4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D141237FF72
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068759; cv=none; b=LyHfi2qmodov4ZVe51Y7l4phHNcdUThBg05EeP2MPmg52lycfiQarC2zZj/Luy3dQypOu6i1LZpwuka1r91JERsO1CnvqUVSeOUSSPW5Lzn8IJyMQx0z7nFw8VQCsul8F2HQU2P9bAvNlPEaJZESg2j4C+3gkyIrRWIf1AozvHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068759; c=relaxed/simple;
	bh=WbaClpuiijaEJZhRB9Dc8DeF1n892C6setvc/IZwtMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkIeA0h9Dlj5rsjQSq/9Dh6N8+ay6njgQeDEdM/E/Lbfx1y9C03uNwQmSwSeUe4LfOHjLzqFmLPz6DBLImc2WBRFbLxEUzxbuq75ibsfwk/l7QNPuQz5JTeUVGGjcGDI7mFAoPwSjQuDCMkNUTZdvNgvX0YVTP6w2Ugr+Fhhr9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eC2Zia/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgCObfj4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6mCY01058886
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+fqw4fN0pTXLVOUOmnDw72S91boPNMgI00B4oKchFo=; b=eC2Zia/RNQk/1CJb
	7vKS95WJIoiYeUbj1v5MURU9ILPsfopYXjCuYJ5itFAPBLQRzh/2uXzlT8byOkp8
	Cs7eoEpH7tyGzE8EuceyxrY41VM24F/oDUHDYhjHTnmXhxNIsvEQVOIC88izi4ew
	WCYbU7qYfCw2bN16SSiGb870LffLbFYtXnMJrm9k980eybLQfWxm9tYMQ0jlJjs4
	OC78Nnz17bH19BEw62XToHoDhIuVPw2/eNwoKjX6/UrISq1J7QO3Ai0M6qoGG4ah
	Dgh2lXWTwFjeCglKCv+x0f9fHXAeNotPFj+lnnf63gpJejZngq8XHCBZs5sFCbXE
	kiW06A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtmfd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:25:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d840206c3so6430351cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776068755; x=1776673555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+fqw4fN0pTXLVOUOmnDw72S91boPNMgI00B4oKchFo=;
        b=ZgCObfj4wZQWp08sYMowTSLIB43d3iLSQARUnecMC+d8roCEaralFG9q8izcsp101/
         9s1TWjyhBz03+hZghL0dIYDfd5Cwm+9Bc56569WNUebAGGl0aJETm77KoP6BZHXe06bb
         0XqbexRH62MYtN//oElbbGP04AqrSm69GGydQl8GvgNQOOQZugLDhVVOU24aJsbRcy62
         OddHKghF0n55p0mfDLw6VlSJ4OvLbnCuJVQtimELOpxFGAtdVyIKKEk5Hm/jENEPSrDj
         O13DygkG/uaQmVL4DJHhtTB+WwM1+PXWTLX00whW5mOF7CMFriVqlrIiUpv9nDwzN033
         KXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068755; x=1776673555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+fqw4fN0pTXLVOUOmnDw72S91boPNMgI00B4oKchFo=;
        b=QycJmuLED5faXfFwdO4KNddW9dWZ92PmkD++NC/yK2ajJoBSM8ZI0odRSxBfu+5o2D
         4pShhW8uMNYtRg+9KHUel0e5y+TLseAkFNfxkvj9eYG5j0M5eYnm1QX8nGWT/xt2GghR
         iYWZ/+VL08RemQwTjZ6f9pUe7E+4rbm3JqVYn9jV4bFQ3fS9yo+iBxmQ3x6+hCGBYfbf
         qcyHXKqhEbmFBumRs6f6qrlFRx+LEI1yaODmuFSgXRt8h6ftUsznBIMsApdLimrpkOyL
         16GBZdEJjfhqDKZw8H88Y6hlGuU2Ckd4BkfMlsHoCuKg5dsxOqvYq4EcZDScAtUXLOkd
         mOMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nns+uko7GTnFCWDaTcmp7iz3Fawrh0Y2o3P5mcCP/KV4B/ProIOGTSdZjvdAK2mt8RujarjX/XjsPURKm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy0Op/Zka6X0Yub1FnLi4gF9r6Q7wQ86f3/R6qDgSJgdA0NE8d
	vWCX8F+8lETR+pVoVAtZBnBtFF5Ryo4HHM/+CSYaugBwKVm5f02S9PtU+7usQYozaqL3s/uh4e0
	SF0fL1cOtcRHTTmGlnjn6U4gifdKVkGe6mLAHbCqg1bID8TgxJYbNrl+WfsG4vGCde37Q
X-Gm-Gg: AeBDieu3hVzeCkYQH3G2iZU7gTkZdyK7pjsSdlhg9W6JMTdX/oBgqM6NdPuuxaDVrCf
	glkTar5+NgVd6CdeBstADOHiVaudJYFLuW2P35g0eINNM3/tyIOWp2bsQ0G3m0qSGVu+v/cwxJ4
	IJHDMvFzRgTAfKiA5c3tuh62EZk/D+NfFyjFHeagTzTUF28SZC2lzy6zl5bk9PskEdFwOXB3ob5
	E+4JIsXvYcLsQqWDYsVDokXVCeQC3pqSpp+c9ihJMoG6YwNKZROrfNzu7rtSJbMLsEJ3CeNb7gc
	rMHR5fxaNAeFTMfzWPzzWIiNnXW3MqR5A8oW9Vw4ybDFsHyUkT29rYjs6/OJHTYOGPDWbaI1eTG
	zcjAw3Tp1NBOOoEKvaNGEA6dYlXHFWo+ZeFFHuc3kH25HB7zwJ+6CpvRv/sTzjSJCYHVz3Y2hdr
	de3aE=
X-Received: by 2002:ac8:7d90:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50dd7ccf4f5mr134206521cf.2.1776068755248;
        Mon, 13 Apr 2026 01:25:55 -0700 (PDT)
X-Received: by 2002:ac8:7d90:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50dd7ccf4f5mr134206261cf.2.1776068754884;
        Mon, 13 Apr 2026 01:25:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6708d902086sm2137057a12.1.2026.04.13.01.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:25:54 -0700 (PDT)
Message-ID: <b708b3e8-aec2-4c52-8a54-629c5cb2d0fb@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:25:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/35] irqchip/qcom-pdc: Use FIELD_GET() to extract bank
 index and bit position
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410184124.1068210-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dca893 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GoGuyCN6GRDGdbe8FcUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Imf7gyc8K-wWQg_KbZAQYtvh6XW4cFAu
X-Proofpoint-ORIG-GUID: Imf7gyc8K-wWQg_KbZAQYtvh6XW4cFAu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MSBTYWx0ZWRfX+b5h3DD3HuD5
 93ofEF+Hjb3SMX7hoabcsQSs4aQGt9J/jP23kwL2ByMx0w65YewwFGuwaxVxfQPs0UcPXVHge4Y
 x7SMkqWk51iQ6e8XvtHfTdCHPXtcmqP6WiPNC8F4NPFKBVKx700wc/+wL7ECUVlj/5V2LkHBaD/
 ujl244pHzeVF+EZHCSVPf8W93Lu/vlP5xj8OTTKWBgtOHJzeOsZvI7k+82K6Fl0dFNRmZnGiHJD
 EoxMRTT2acP88JEDbZ34jMqT9qlTp67caeP0GHcMuJJqd/MlsdrICn7s8Uwo1AxFn6FwDbAQc/+
 RYobR/wxFDuCi9rF8EBd3JPBnEJuhj15YjpRBaRpD5VpIz0jtSHk5noJeSbSdQITRfRcR7cT34n
 aDHWHjWPplx4wuwXeZRqkerSsISbLuB4Lg6dp8MT+FDRVjC7E6MyJ1EG5owTO23vWB7RSMA9zmB
 Uc9omq8ZrFgHTJ3eVYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102890-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 745833E9170
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 8:40 PM, Mukesh Ojha wrote:
> The IRQ_ENABLE_BANK register is a bank of 32-bit words where each bit
> represents one PDC pin. The bank index and bit position within the bank
> are encoded in the flat pin number as bits [31:5] and [4:0] respectively.
> 
> Replace the open-coded division and modulo with FIELD_GET() and GENMASK()
> to make the bit extraction self-documenting and consistent with the
> FIELD_PREP() style already used in the PDC_VERSION() macro.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

