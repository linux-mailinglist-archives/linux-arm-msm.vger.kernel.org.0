Return-Path: <linux-arm-msm+bounces-90977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MwjJLzyeWnT1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:27:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA282A05D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 061D7303BA63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B5234DCCA;
	Wed, 28 Jan 2026 11:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bgLYnYwc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VO11wSR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4152933D4E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599647; cv=none; b=cTT43pe08u30YrdZdyfWkb23dxte1VMVrVUFkWV7jILc55IzoU+1Po3Ud7ZBYC/fYlgtnDosCkzGh9OMtgHS0YNiFq+xfqsGv3Mb0brnpGuxOT3Ox3MYIL7RYiDeywzpSlrwg4i0UTra2KAjPeZ3W26Sygy8CPii46MP9PkLZos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599647; c=relaxed/simple;
	bh=EQD4R80s9K33p3vFtS/DW0zAFA0Ul6Ha7HL9EjSzIXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXQN1BeyMftgLcCMRFOqOdHI1A40TCu5nlZWVWH8yPe75ozGsGXtUTd7s1WUjF+LsZ591kMbLtgpwUxP+V2UTep9jy80+Kcz0Sl4ltuD2X9ZX4x3k9DkIEtQZU4Aj/819TnRHCFkBxnF6FxlNo4uINo23n4l9DL0KD5aqJc5/ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bgLYnYwc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VO11wSR9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92dxW042005
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZO0iU86Qu9T51d5N4vqKEcp/6QeK62PA7A1aNSWaQk=; b=bgLYnYwc8SUiweei
	hmNh+qViLg+vgvHMe1+hpIekOv2yN2PZ+uIIeM725Y6//8eOTCBVfWj/gqVOrnvC
	pX81LfUIEH3BYUQTKpMqOuhKjcza37UmEaTI2dQZ5Je+3m4cQjp0F3aR2QWeukxn
	9ucB722Coh3lZJphxPBBqdUUibDUS4cG8SpAGnaktuIuw+6kouR1EngPxWymiWFX
	+EMyq68JziGtuw3XISLG81sg83tLLJmiK+TuRFhulS2eVI0k8uD3lQ2UufY6XsoH
	bdpB3/Q92ki1IkLx5Rv0RmjZ/e9xJaVgXH4OZ7fSlU/4Qg2qYIJjPsC4/LwNgc5X
	kWy8YA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355tty6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:27:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a262380deso18765206d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769599645; x=1770204445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ZO0iU86Qu9T51d5N4vqKEcp/6QeK62PA7A1aNSWaQk=;
        b=VO11wSR9eVVYR4ovShLroSDwQCFs/Tx/FBpMJjTdRMnampGBVuvVpxZcPx0h45i4Ia
         wPmJWzhxeGv//W0+umuaB6Nyra+tbUxpBoljWTw2t2kPSeDcK4TBNqVWg/F4FFIhUlnY
         jw98K96O/FR9KPIqyKbFQ/0w4oRIcFVLVlJoYUh6axARLmOf1HARlaZNhAuCWilmjJny
         wsEC7uTjIPCPXz4xTKRZDRZ/WUToyS/Wla6uQAjNRGgrX+UVy3nMoVwVOq8saLwhP+zB
         SKJOGLG6B2JZ2gJHKhO6ez5b3WY2F04bMRLvPw0l7nPI5ayqgZ3QsIVaDXK/BKrT3oY0
         y/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599645; x=1770204445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZO0iU86Qu9T51d5N4vqKEcp/6QeK62PA7A1aNSWaQk=;
        b=bOIravlfS4qX3R8YPFNvQ1YI25pyP+h0VbDMUHmJbV2XQtWZbS3izxeuWOXbckT/oz
         WZC9jm0cIsJ7bFRNzpmZkJsME/SFbflOuE9BC/65Esl16CB+7XWDB1SRLYRNEfFk6xIv
         pHwry+joTq85Sj+CfCSVSC0jEF2qdaOYeDMHJodJPrc9RPuj/x3PE0IrNAbV+0qV3rzg
         r8tpjSl84190DGES2T6Axid8BHRPVkg6Z0TEPoq4RPOfGIi25n1lhfQuqUkL5GHIXypP
         9KYazj3sQhdFi0VbKyzr3ese7UbXA6Bh2Nwuwsj1rwKszRf1C3V5aPcW1aNQRvwEUZrg
         lNBw==
X-Forwarded-Encrypted: i=1; AJvYcCWfOWOo7NMMTDedIyk/nOuYTpciraXcaKCmv9O9W8Siv5GGkvMxlyKBj2HzLmoRwX8S4IRysgQmXvP4iULo@vger.kernel.org
X-Gm-Message-State: AOJu0YxXbrle3uVm+Bg6+GuQg/Px4GC308fxs8FK1ZDbqcd2iTEG536u
	Na6zX+usB59R5+2wnAY89J3/H4gd8GWMIewhlGIJrmEfvLaExEygg5ReVYaMlkr9jQJdFBBMxyK
	8v15HVO6zJ5n05hPZJVqw7WvVRNgH2S+EcKWksAwj/MZZ+H3A0wPM3wpyffyjb6WsM55f
X-Gm-Gg: AZuq6aLQkwjU3IpzdcZtlxUsFYWvEfPCqAJwB1qAG5+pc7PDg4mJLQqEQy/y5R+y9ZC
	7pjExFO1i3x8yghVhNdET33wN2eMUpnD0nlrQrgvt/TN5XBJmvzV1mh0YOZ3ab1gAV7O4y2JNO6
	tztlxf2tVy16bwTu0djuCtfTtSDbIOAWx0YdJc5Q7+3NVPrQQdmwmKqYBoZJzJrnT3PHm6oAIaT
	5jgOHwdbpre9j9qTJhQEy5JfyCamXR2P5GyoA1bCh9oRLj6hJFcGv90CmKjWj1s51wuzfLBijXw
	lRtStMjoIO7DINHkQLWRg6LJgTBHc/w2PShDMdV9k6X2pMizW2VAQoX6wcN7WdNoI5RwoauvoLl
	o1P+Lr8sHmSL4xzwB2EJ8n4EJEHNm65eUJmv7WS2CuRhdsKPdKaQ8iUKN9Z94tU/4i5Q=
X-Received: by 2002:a05:6214:4d05:b0:880:5cc1:693e with SMTP id 6a1803df08f44-894d7895ac8mr11074766d6.7.1769599644646;
        Wed, 28 Jan 2026 03:27:24 -0800 (PST)
X-Received: by 2002:a05:6214:4d05:b0:880:5cc1:693e with SMTP id 6a1803df08f44-894d7895ac8mr11074556d6.7.1769599644287;
        Wed, 28 Jan 2026 03:27:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4452d67sm1420904a12.8.2026.01.28.03.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:27:23 -0800 (PST)
Message-ID: <2b4568ee-1d0f-4bab-afbb-cbc3215d1cb5@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:27:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups
 definition
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=6979f29d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=KqVGvLWFIAZGjLrJOEQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: naj1OQlsuqpCcX2opSH6bZORlYEcP587
X-Proofpoint-GUID: naj1OQlsuqpCcX2opSH6bZORlYEcP587
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5MyBTYWx0ZWRfXwcOmKHyGVYvE
 Rm8YjTxcAWActOE630JywuYDX4qW2Veyx6S6Ve6SWTEPXhXzloPLp2MZxJv+pkblZclMCnqc6Az
 U+A3joAzRRk6aTl032Gu7PhZwfg+pl04dGPDyU6in4fmv4Lau2yZ59wQg/V+dQWgtWFLsS1L6MU
 DA8tJ3Sr5ufwtDupECAizak0lrsiEe4WiU8EvxQNhCz3phV7JRpF3pWeAuST53X2D4ifGSjBwdj
 QECBw1DYI07rxKfg08WZJBJ8m+Eg8PYp6QDwTHw2iJ8ib3TkLpMCTkko965QYlwSt0dPRvQlQ5N
 ilqCG8k2f+myyANJGYz74qSQF/k0LuPtPca7bSvU+5bsnqTv3BOASGjH03C+g7sUU1o96jzwdZA
 qIa3Vdr+e5cveRIN1taON6Lh8ZeEYOcS0/oBZYjlE9uMWE67zSXY1AuZmtwRP6rYUQBQBhbMNq5
 ehMk8zTvvgazVtNvfSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90977-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA282A05D2
X-Rspamd-Action: no action

On 1/28/26 12:22 PM, Luca Weiss wrote:
> The i2s2_data function is available on both gpio12 and gpio13. Fix the
> groups definition.
> 
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

docs agree

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

