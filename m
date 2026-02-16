Return-Path: <linux-arm-msm+bounces-92997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAFqEnI+k2kg2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:57:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0D145D73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ECA9C3001582
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36A33321BD;
	Mon, 16 Feb 2026 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7D43Ov9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kY2R+IpL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7AA31B812
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 15:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257452; cv=none; b=K6Rx7JITB8Wla2jbvRwrblMMc3bpYdb8gyshlUBEzv3RPgoMnI2PFWvwbkTD+RaexzhOvTPggTvFALM1LI5wPpwDXi6qA3Nkp50Q9j7MGKmsgu+0E3qrjPx/Z3WqkYkprYdip+U+b4LWxp8mS3H8/ChvmXZaZ1rge5FHFk5vksA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257452; c=relaxed/simple;
	bh=oeRmS+RnbI7iajNHi4vkTeNb1F6SCKI0ecOw1bP3KVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGDNN0DPjPD0Lfk6QfxW8auUjGGJJNkEe9iCRj/nGf25/cS5VuEgEpEX559Uyb466QF1hoAyloSAXvV7ab/+q5XdOwPJqEftQ8svaJOhNz01AxqWLJcNRclSBHNUylw1zzXmg6YE4482XwY/4VDYBq2GBBGEqD9477HxeQUDFZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7D43Ov9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kY2R+IpL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GFkb0H982531
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 15:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDqYjUR+aQMkdEFghyjdfYjEhiYd5etbRbmhTWvDQso=; b=S7D43Ov9dvx/yiuL
	GBSnqyr696b3Vf1Nsxu4WONbIT167QqYS3hsbJFdEz4eg/uZv4UxipLmDyhJ7xYG
	lwqjJfZwSg0xn+7lT0xXvlcbV4qAjvKFfAKTQuEs2BtbxogEzjhTrfPX9yDKqEd+
	WVczDO0ybnRgqIp1DDR8NrieZyCBe1x0oRyl3cOtwVnvO8U/Sua9Ub+izuvPq/3y
	Wu5MaTCmgapBS7fJ1T6DMnoMyC6dYxUEeOVhAQ/zpV2MfaJWfO3cWMaRxSISWDyE
	xWeDGNNJCAThLEPGUFKAqbc8DPA9zJwuqN3NiY8/KfUUj+sR8+6HGhlL4E6BBWOj
	7TrkKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662r0wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 15:57:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb399597fbso201679985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 07:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771257450; x=1771862250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDqYjUR+aQMkdEFghyjdfYjEhiYd5etbRbmhTWvDQso=;
        b=kY2R+IpLfoDQuAQezcgscFjakyx9mCWUWeUg5ZXCpl71PwLfSVrHLkrorpirkXF399
         bj130rPDJDMv7NLYt5SkuribU0SSKQKXWwQwi+v2kSDSvRUZMXLRkepftJ+I9CcYLWoe
         kJ5/RsFtAGz0bKTE6sNEFP0bvvVRcfz9J9vC6TvL0C5l18KGuzsZ5drtX15NZ/mRHH2h
         tQ8oS7Xg4ciUZFxHkwsMH5xr9v398gF634dk8cfI1pfGGyUF0W3Sbaldam3ZhzU9FEgV
         jPKCP7sklzwKK3jxj6/aKlBofoIz6gkNISWamIXcgOCQi0KSa/XrfsIBfogjNSQxoNyU
         bvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771257450; x=1771862250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDqYjUR+aQMkdEFghyjdfYjEhiYd5etbRbmhTWvDQso=;
        b=uc4HoYNVR15xNHV4Yx2ddLhvwillPhEs8iOvwRijLhZAeuId/EYSbiUmW8ClB20EDp
         KjLzavQVNa+JmAVNAhG+9MWu8k8X6uAmrM3Xb/qFAwZ0z9Nn9L9bWWfkP9SIvUZfBWCA
         J+/A87LtCDYHXp+o0OwE9rK6sU6oYdpMBAnySRATXgohcNOWHIq7jxdE/4ZuIbhDiSEs
         M+E8TRa3XNQQNJmCDg8WT6VzUKFnIsJv4udV2ZGZ6b9+JaZ9fp0FHR+WLrySdkLJVbei
         9Top1FGxzrQmS/1tEM+A7zOiOMzc+1eUWAMURJbMdtUxT55qvvaPP7WULfJYd0b7V901
         pQiA==
X-Gm-Message-State: AOJu0YyMUzmA5v4L8GqnEHFPkFsOrz+fGgdAt6xPlqAOfIUMLZg+KAg+
	WLZe46E4FkBkxHjIPdQp0s20sLI259uTxW4rZgJNsOMt/RgxV8RhLs1HCYEhrfWzDxJPEsKFhEz
	eNCvnZk9Vr+ttURAeKvoOnhhaRMHXv7RnDbrX4qh365/PcrfDMQpPeQrpce4EHKZ3hoTx
X-Gm-Gg: AZuq6aL1Yy6QSmtvOea35cSbLrG1zvUfndk8Dp8BwEIrl0rPnKVvXsyZxDLhYdv/Ixz
	pN4IFARYaivgQh8LSA8skR1W5iaPb9HA3ViJ+ewIJtFgW+GGulgASnPOq5g2sD/di1u7iZ5eeyk
	XBm+zz0WiRONvi0SwHtB7Oy7etVsemso2KvqLjj4T32+pM50Ho4YCCAKDkLFwGMaZYIUAK0av57
	CEZb0qlP79wnWEIQO+pLWfaHOr9RKnkX28VZlJiSxmf+SaoJrCls8bXpQQSq5CofqVrvbW/OUF1
	qtdHmkNEh1VaVnV93e0fgYL31dGvaf99m9vJ2jumX8nOoNEmkJHI3g9o/aEtgzBVtMpCiw6bTm0
	NoKEIpl70xxI6bvCiJ5mT/B1c97QCk1th4KFEl8qDYtE55jP0UVAyQMHzDV8ejkMwTGiwkeY/Bz
	ymqrs=
X-Received: by 2002:a05:620a:45a3:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cb408fb864mr1126017785a.9.1771257449918;
        Mon, 16 Feb 2026 07:57:29 -0800 (PST)
X-Received: by 2002:a05:620a:45a3:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cb408fb864mr1126014785a.9.1771257449474;
        Mon, 16 Feb 2026 07:57:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad29d571sm1914625a12.11.2026.02.16.07.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:57:29 -0800 (PST)
Message-ID: <0f3fec98-4d58-4197-82e4-41480066d42b@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 16:57:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] clk: qcom: Add support for Global clock controller
 on Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEzNiBTYWx0ZWRfX/R3hptuMLvxc
 jCicmfyt2dIUiGTajmHPD8HXeWqcrXFlmjNCtV+h4Tz/AKPwpba9PsDOBewwX2ERwtMwDfzsFtw
 YgOhrsPOsaeYfh/t8vdBrgJbZeExCzAsA3rVDzcMqBt2DbA9zhxjpA/6mGifL/Xw2MICveXx0SJ
 2PxMi8n3yJZR5k8WoEMfFYRKo5NZULHv+AlnRBwo2xrV6EES38lodYh7AIx1uqbbP/2G73hDgOc
 k5b66zhsvarD8c+3BQIV2CusGH/JXjIy8XfItULmRTK61o+ylsDLSLYOlUDamhCoDbgzedbEmmH
 P4LOB+aIJFrfO40dkH+9JYRg8CU4MG9BxZtr7BFoA79IvignXFZAlbvZfPybhvOmaLmBuY8JBMR
 puchHlpj+/DBe1a9sp9mWj9OlQroPL28xR3wftaTI4A3dW5Z/RxBcEfMj2ft9daGkeCzfak12YA
 YdMUqELVRdAwGIq6bYw==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69933e6a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=F7eGajQwVCTwq7oO_cwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JVCWE1MGHjKNvLj_85AXwjjPRuRc-WE6
X-Proofpoint-ORIG-GUID: JVCWE1MGHjKNvLj_85AXwjjPRuRc-WE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_05,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92997-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0A0D145D73
X-Rspamd-Action: no action

On 2/16/26 2:43 PM, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for Global clock controller for Eliza Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Do we need force_mem_on on UFS clocks?

Konrad

