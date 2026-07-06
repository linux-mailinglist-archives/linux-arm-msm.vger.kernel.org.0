Return-Path: <linux-arm-msm+bounces-116866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +oDIIKnES2rbZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:07:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 290FE7125FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:07:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B1Zuk3yi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GhIm8Lz+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116866-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116866-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7866135617CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F74131CA4E;
	Mon,  6 Jul 2026 13:47:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDFC30DEB2
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:47:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345624; cv=none; b=cC0jHXay3IIAgv4z0iUl+6FfGt6tYIvzmqUjqf4srfezXYj/uy7nMBMPTS6HC6Vs8A8etfGOnqBpdhkFARtcsj6Wvs9E317JAPOxk33NFCrut6wI2B9IiJ00i/notfO7Am3frH7pOZjbCQZ4irWUfTH5mbZnugjjLp+epxVS3Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345624; c=relaxed/simple;
	bh=viziuRWu3cmIYW7KJ4As+2Yaz3LssnrQtJgI6ai/NA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKwCtJhbV3onSkGV6enMu5Ehl/YP8dm5lQXvJSxJ4iYV5Q+pAylDAHOENKEei74d4mQHiQVu2/HtED8fQbdzUPsZkCoLwM4Ovrz32xefyP2aovOuP9jcuaPCO8pYIjTNsokvVPmCn/wxBupgpQGgOo38+RwBNaPvPcNraaTjFug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1Zuk3yi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhIm8Lz+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax9C2391062
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9//kA78ASIVOr5machFeqRo1Ify7TeABEBtMdzpknE4=; b=B1Zuk3yigUJ+FfBQ
	IJL6kp42xLSI9m4C96UnNlFoDpC0Hv+keCZwarJTlvNZEC106BVlG+QpMHk/S29/
	Xwra5jhOjUPCHhNyBCZ17mM2AyJttWu82IomZikWK9iwTI2GRGPgTDSPxAGI4ByP
	IU3JsyLdkPUwfoL25FxlvkfjrkYM43t+X7MlJELYd6hIUu1yVpj6gf1xyv4u7B2N
	Q+cw7rSOfqNoSzA4e3GWFOCtt01xazyOPviJuy5Si+FJLiYcJmDiMz6dnB++Z4cr
	znBVQxM8hAlcxQ9DOygXt7iWgBRH6a7vYA47wY0KFcOxXxo+D7ena4m0s1YmZgJ6
	6hnQWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgs19y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:47:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c27616421so11796951cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783345621; x=1783950421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9//kA78ASIVOr5machFeqRo1Ify7TeABEBtMdzpknE4=;
        b=GhIm8Lz+8xavfPePTGk9fQbV8spsEi9jKKGG3w2RCGfdbt8XBWj0pX2YcnRxNuU4h9
         2yrGq8XJiJ3nmOUyndvZ8SzSLXOdjy6LBeGC0pdqtGezrivZ1mIRDlpCQ35loBHFsLtb
         5A5DwjHN8jLJKNc/dNMjJ0MItU/iQ81ZI4uQZkmkeHI2pjh+OJiHaViiQI5jJUr56+Ww
         6FEO/ZLd1JX8Mfdm9QNYmoarhY3HrfEsXIMIb16mCwJ5tB6ju/VVCNauDGnHGbE8khwH
         XZGiRy74CjkLVUbIjivBBuy5D+Z68dxqfYX5KrJVb7B/PeZPUBp81dDJGtAdLcltQtXh
         GZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345621; x=1783950421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9//kA78ASIVOr5machFeqRo1Ify7TeABEBtMdzpknE4=;
        b=cOLlTwuhcCFL7ZfrvLVeHkBEu+6Rtf7SmzYTMW+rWupszfonwhu+9O0c9s8qtNywo9
         lo76M5KQ2P1xrKVhsozYbHcYGjuNf2ItX8eyedYhLSQUnoyChecsOs/RNiqdrsh03wIg
         6Tu2qVW9TB3z8wPgOZYROxgYz0wtYQ2FD9Oy1uwLd4mTXmS6Ss5RLcCCU77MtyqCPvHq
         SiFqsZfPd7O936ViTozkunrwTQtMgBEZ0ivYreujSOpaUURhLEnEZQ49n45doywJDL48
         od4HxHfwK9emjV/PDF6FWEuQamPbagpDiO1XUFV6C5tKVoFlnxoS2FwRIT33NxUBW6NH
         H0cg==
X-Forwarded-Encrypted: i=1; AHgh+Rpsnb6ylTOMfc4E/R+P3BqSDoHxplk989MNp+EJkXscgGDQSspp6V6t6a0iFAG3TYhQS71EQ4uTByDpXD52@vger.kernel.org
X-Gm-Message-State: AOJu0YwvtBMlOE8tJ5+zR83CSI42Y2CbmiVIY8+jcX724vLcDJS0YUMC
	l7hO9A0HmlmBT7DKToktHSSwNkUuDqX/dA5VxGnH7hg73pldoKEmVCkwdwt0mDqxNw4Wa7ss8Kx
	nTxFkMstoxUL/785KViaChkxIwrg+7rGySjTrceThdpOZnalNsGoTdOW63MAu5AbiRnNi
X-Gm-Gg: AfdE7cnjbhNA1UthEEUJ9obF12O3mILutrLlvCyStRr70WQybnwscA9oDgSbll86/QK
	aliQqQtuxNNvN1MHarqPlHIVA4+4qZnu0iF3ZmSpGFz0ZwgDer4QrN1A/r1MLXjb/gXm0STQjYU
	zoQ+5UGOcpQVoPmwtJ9RAgSf01uu6TBZDXrcJByA4v8fYP6jl+W0ML9rXMy8B7nHJ6rdTILIG1d
	zqEl5a6wl9xmiszcpJb8ZMc0luWgDcXTEeOzpbyZmdPmsyyGMMnJCSHLdePKOAUINCiXel02suK
	xDk3L8tHckLJCRF9Nbg2MsamItTnU0Ft0AZSnIpQkZkOeVVG12B1LUM1tDaZ+RwwLhCeBJ22dMQ
	nUg1fdpuudoCytqnPNJrCVz5gqRg/vCHt/oM=
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr92401681cf.10.1783345621041;
        Mon, 06 Jul 2026 06:47:01 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr92401251cf.10.1783345620551;
        Mon, 06 Jul 2026 06:47:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628effcsm748307066b.34.2026.07.06.06.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:46:59 -0700 (PDT)
Message-ID: <180768d1-814f-440b-805b-61148720f81e@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:46:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xCXDdJzFNi_m62fC3pJf_w_DsR3Nr77S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MCBTYWx0ZWRfXyosWr5mrCb+R
 YCb11NYtYBpNMFjRLr3pKHHyWNhaiQ2J2HSGz/H4M8HTg7OiFY5qt2kitKgdExPeTGhYtNoFUAw
 JEPFRpw5dwzDZKmGeLkPcRStzWO6ngtvtrWOGo35L/eehsv7JLeIsqF98SkWH7xjbRCfBCoKhZV
 fQ00mx6YjOns5UQvx3FaJ/RnKDXRpM0KcIDF4oxYFyTDmV42cEGTX0TabFyZCZA6I9LZ+MZvw1u
 N4hd/S0ucWGleyQ144MhAMrRHJU4OpwJ5dpwvPJqdIHkinTL0MJkDcoi+fPDx+mZ362U25hsWVp
 IJb3EKchwQIzqNWx0NRarlbIl9XRsNHafNzzPFIkAmzlKdHAgxLh+CbxZuaj6V/GrT35AYRvvSO
 ji5j+7EOGXxM7a+woU9qMsyqUzvFd5UerWPddT7Rk3lPX0qVPE5Xo9nKAb1BrkwAIVCbrXZoCzA
 3N1SiqqZFKW0VaumQUQ==
X-Proofpoint-ORIG-GUID: xCXDdJzFNi_m62fC3pJf_w_DsR3Nr77S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MCBTYWx0ZWRfX8Aj4M9uNTn/J
 //i/iriTPcvlqoY1jfmkb7qk7obZd2JLkih0ecL4ikmy113BhjuPbfy1BTNoTKTEcY5L2FNV0Of
 YIgWjhWpQlFfLhFTAbJ/mXHaRlTUhFA=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bb1d6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=N0UkSJE8pd8tNmhoSi4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116866-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,vger.kernel.org,kernel.org,somainline.org,quicinc.com,gurudas.dev,gmail.com,google.com];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 290FE7125FF

On 6/30/26 5:25 AM, Fenglin Wu wrote:
> Currently, when the LED is configured as a RGB LED or a multi-color
> LED device, the same pattern is programmed for all LED channels
> regardless of the sub-led intensities when triggered by HW pattern.
> It results that the LED device is always working in a white-balanced
> mode regardless of the intensity settings.
>
> To fix this, scale the pattern data according to the sub-led intensity
> and program the HW pattern separately for each LPG channel.
>
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

[...]

> +	prep->data = pattern;


the robot pointed out to me that this must be = no_free_ptr(pattern)
to prevent it being cleaned up

Konrad

> +	prep->len = actual_len;
> +	prep->delta_t = delta_t;
> +	prep->ping_pong = ping_pong;
>  
> -	mutex_lock(&lpg->lock);
> +	return 0;
> +}


