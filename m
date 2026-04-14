Return-Path: <linux-arm-msm+bounces-103064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMFsGsX13WlolgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:07:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A542B3F6F2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F8C63012A81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EE138BF9C;
	Tue, 14 Apr 2026 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQd74dol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fx+IGZsf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED1E36E465
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154015; cv=none; b=uQSxLolfe766xNs8/wWdA0cVu+e9Vyl0V3KtG8Ad+QmZg2sjn0ScsoQRR+4WWHogLMnfbk2UAABBNypOw05EkciHSuUlOrWfZcAn/lM6EFMOtrQWK6wDo+LZPxa/rNnCiRZeaxHVG5YvmfIDqEcjdy0y5fDlsVmxPE+iTXKt9Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154015; c=relaxed/simple;
	bh=JXSAZRFUj4/4KS6bbrhUvanR3/5N5X5ewMFF7ODmEr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u60m3tYPgqyVfXQow368Pp4Zq3NPXkQWi2k6fKj3xB4E69u9p70PBgKs6DRLlMdVJSRuiSIUsJ8wI68nwSmorEFf8d0kdsdjFAaTCOQFWzGVuEKR24cvsjW6SYjkV8ulwZ6IAtbZgzqcNJmmjuqszRnOhUEgIM5x+pt+9ey4WJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQd74dol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fx+IGZsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6XeBK281661
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/HPbc3BrdRcd+P+xFJI7+7IJ86LVkhpxPxus+jxM98=; b=HQd74dolg/TU3GwE
	isdVVR9yiqcPmWNqHKP/hCah9xLpneLiqx3UEZ5pORLZtcTiOpzFJFEGLdv4HdKq
	cyNQ8fPpXMabcJo/nc2VD2foKd7j6H6g5UUVOi5TKbCPnu4Z4jGDJhbp8dfnxyO6
	bsQLN+X5TctNLYKmbj6CFVioBVXF6vT7ulHRV9CebOZhQXwWKiMXDSdRN2vX0pSE
	n4Sbr8LmiRoExThb8yPc0Dp+V1GkBsQzDYdmpVaMhSgMhzHCHvKNldHorTbD4yCw
	n9UtYnx0Ns0M88E5CsGFAg55lye0GQufD3kRG2oDRFONarqTDi7NJyUgQC8CuqDf
	lPnf7A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vhpax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:06:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5d076d88so11600901cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776154012; x=1776758812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/HPbc3BrdRcd+P+xFJI7+7IJ86LVkhpxPxus+jxM98=;
        b=fx+IGZsfZjRHCgyFxuNzqgVqSAlruYgNIsZmUh5D5hlp5aHJSClWTKqDJfSpugl1N8
         6bC9yZ5ybwGZBVH56fH1ehCzD7s4BQz2sKB676N7LIr65hYt/PKdJCk0AfNZJ6DmM/rc
         GDiKvOARmdNM0S0lyBdYko8/U13nIi33ECMGzDtidsMIgwCADKyKbOZ52rf8l243UAvb
         68z89Td5zZw4FSmvWwCWlJsBhP3NKPwNmrnEDBMW7YyGN+7NgWFoJn8hbs4o7PjkCZx7
         yrHbDsctkI81KSMrZU8H1i8xMYN8il8fT94p7NfPTPjYbFpF+Tc/3nwDT3L0Gytgv0Ll
         W4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154012; x=1776758812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/HPbc3BrdRcd+P+xFJI7+7IJ86LVkhpxPxus+jxM98=;
        b=SAk6bZbyKAleV57Ubs3zlKThrpStiqg27e0Bu/FfgREQO6auzB3cKeoaqNx41Si28f
         ARMlaQCwOOxai+S3LKNx09Q3qmuSuqApmV3kN9YhgpBbLN6yKVCcQwuTgGZyr2XMHYgA
         eWXF0ra3KqhYGAOWzq7eRMs1TgFq/NeqotbkdIddKnSsH2SVxfpOYmiwSoKYwZBmRky5
         aAszWN6N8sqB67lFG2S0MUkksmm9EajmWpfk8TNlo+sIbTcnoH9tI3FdZo0SqLTLQQPs
         VW02h/PrHbxfc5ll5gHUnVOf3O6Ff2Izk3T8nQk5WXmhkeP+/TsKqkxefX4Ka4gOqteO
         qzNw==
X-Forwarded-Encrypted: i=1; AFNElJ+853R3LhZ4P0SrsG22liNh2kUzwy3yV/c2bUjIWvpWwHJKm3eo/ur/KjkVOy+pqUpmuX6Z5/pbK830+Ghv@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDYpu7QneTAyI5tJuy+5J44Q7OOhjmkVgzjggOMA0LIu5PjEu
	yJ/EeIMu508FITtAUfIbNWQx5OEhwaS3178DLisHqP1aGPsaMNI3O7pf85hNuXaYR6+hdMMoK7Q
	SJnAUo5zAQonJ6WS2i2tdbxCjwcoTVbXlit8KnAO/jeNaQdRD8YyUsPSGpvdunFQJPJD+
X-Gm-Gg: AeBDiesfGuOOxbFyN97H+sumbrTs7g//bai6QKJe9K2xAD7rwkPSA5U0uweZhbkss/k
	oo8Clxqs4w1NH3p87SxTYBBP7Zgy0U5MKINGQ2+s02P2X3/rM4/nqe1mrpIJA1UQxeCyi0+DChc
	OuXybQ1oE9B6Kw3A0yrn7rgXFNqaLeM+t6Uf/S5JPReeYzInasHMF1SJ4shJ/7j2mY4Ou3RWEHw
	lbyyh1N+QHuAXKmtsaFSe0QRpSki9NnQvl4vIdLncqyYj+2BHuehtVvGfOI7JAn19diLzyPhfx0
	8Qf5Ox7QU+uyPRhCJJU+rUBEn6yC2XOBIdS4ZxWQvkzX5cOW23hbAxdBhc2NjPsYjJtSMNXh6gZ
	WBJhwktDakmkaqPKnlwxW4jn6+IdeFccnE/5KxwwsM7KKsQAcyLf5KoTPI6A276WD8XZ+YHcgQK
	x78UDyv2hYUj1oyA==
X-Received: by 2002:a05:622a:22a8:b0:509:219f:8e34 with SMTP id d75a77b69052e-50dd574d883mr159458151cf.0.1776154012415;
        Tue, 14 Apr 2026 01:06:52 -0700 (PDT)
X-Received: by 2002:a05:622a:22a8:b0:509:219f:8e34 with SMTP id d75a77b69052e-50dd574d883mr159457891cf.0.1776154012013;
        Tue, 14 Apr 2026 01:06:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671d70c9656sm330688a12.31.2026.04.14.01.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:06:50 -0700 (PDT)
Message-ID: <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:06:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4A3OVKgi2gVaAjChtRkH4eZiuSE4zUPA
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69ddf59c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=wxLWbCv9AAAA:8 a=d3x1nyaPrRoEkPAh3MsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: 4A3OVKgi2gVaAjChtRkH4eZiuSE4zUPA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NSBTYWx0ZWRfX70m/rgj6DfMv
 lkH3pCkWiR5XmrsP0jLDE1AwgyqqOs2FQ/by9Dh1gyolxpBqb7B8yFXg5VN1D6qQzj2CwVKA7To
 m0g50fDEpvtCRp4gEwz5SkYdvU+Hv7psTDKCPApesShn8LWqqQ2090vLXpM1EPTWuQ8Id+6Mkkv
 5IFTIjRhTdSdrJBiMBpBWULtGK81idTBf5VbTRAWHCi8RgI/yxGw+YuLSuP7LMOyvfdwUvWLNQ4
 j8G4FjcjgJcRk+2OQL8htn8HKZm+ZW8LLRgiuVmgefvyievggGKhy3hZ8HbwMeLpuOkTOGFw3N2
 5coM/MvF41XX/E/oM47WMPgRVat/97YTJMFxz76USyLF5lnGIkkMzyRKjTOBMjtZONKGukx0JJc
 C8d6M04HyWT+A1ohTfpPUxOKixMNH6WP7dG9gHbcAGVZvd4wDZ7pe3oxPWAjTWee6BxnBg5UDet
 ckybMYG6BdoGugFrjYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140075
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103064-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[oss.qualcomm.com:server fail,qualcomm.com:server fail,smankusors.com:server fail];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[oss.qualcomm.com:server fail,smankusors.com:server fail,qualcomm.com:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c15:e001:75::12fc:5321:query timed out];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A542B3F6F2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> msm8960 uses the same clock descriptor as apq8064 but lacked the

This doesn't quite seem to be the case, some fields differ and
apq8064 additionally has:

QCOM_RPM_PM8821_SMPS1
QCOM_RPM_PM8821_SMPS2
QCOM_RPM_PM8821_LDO1
QCOM_RPM_VDDMIN_GPIO

Konrad

