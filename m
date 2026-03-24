Return-Path: <linux-arm-msm+bounces-99647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKKvH+aHwmkAegQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:47:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22059308957
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D747A307C6F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3885F3E3146;
	Tue, 24 Mar 2026 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqEc/gu3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pju0Adec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D803F7E77
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774355774; cv=none; b=O4Fv6g8qHbFLiszUeGobVRaqroEWCyAosKijQzER9RH2qPNKLnhxoL4DjgNaDTQyPF6yR9IHU3ZCdjOGyvdZGEtMrGncpvmeJ4iZUHzeUC1RqSEnTWhyA+coD6voG/0aoUIZnFTn6O8ROyfqAM6ba503px7gxfgOsN0denZ8klI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774355774; c=relaxed/simple;
	bh=ye9LlQ659YClM/e+RtKML3/FgS7NUsGw5Fqp99hnm1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bax2S8sPe5qNk2+hq7fTw7cfpwXXHK3hpISTEGMo3G8yp5I4aDD1b0Z0sCYbI7LFxkcjKJq7cYjDQStiEjBMZ5fndgZzAf9Sslul9tWxNFgEnSlc3xFdk/+cEQ8G9ZlKkfwOxYyC8E+IZVdg6ezkJNUdgVX2w4STQ9b+c2HQzsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqEc/gu3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pju0Adec; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9hP2N4059154
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Foefc7NLncsQsULtFdVyI52wAX5lZLxzE1pYWlbO84=; b=gqEc/gu3+V0ezOnC
	O7fMSZQ2TkDn3BVrVMKPdTr5LYN87oxKdgNHv+yS1BoP/AS/2np58Z1GieRcFpXK
	sl32LY7ECQL7tHMgCtYR9lvqFtOSym0is4Qa5T/sYH6M9Zfh68RB5xIpGMmwI558
	c8HzIMpfJhlzza8RccsbiRLVV5jYnS68hky3vc2pePTB3Q+O0sIWRNRy/l4Vp3ZH
	sNZusvBrCtzqrJmpTx5d5fMZlDdR9u6Qu0ikK5+FqgLrQU8FPm36dKHUDgR/2u4h
	V/cTRHICUwcDwswxmhEq0+fSJ7GPQW7wqJPesFGVEqkc5DmqNSzIeFLgIVDvz8Z3
	WLq1qA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jskswk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:36:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a01982dc5so50647476d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774355771; x=1774960571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Foefc7NLncsQsULtFdVyI52wAX5lZLxzE1pYWlbO84=;
        b=Pju0Adec++S29Fi/xoh70mCXwEB7jnTuEKD/SaeW02Sm75RLQZyon3SFnkRIGkeet1
         J8cnXwxaE2k7nGyrvi0Fi6krzGayYtj3ClnwjAzPtIS0HUVxigt63M8UK0qmluTE7PmQ
         UofcKAvZ4nMBHtxwTAW0OY7jLgUbZWTDCuB844x+CDyJUaSvafCTGX+DfdPGlj+zVmnZ
         HZXLgL2yyoww03sRv1DBuVLa6aFZpxfUfEZOQLo1PTOnhXUGf3YprIu+jG3ksz0iKJuP
         1TDpQRcDJFlZDkZGkmWVtQmw01xcHmP2BkSslcxjJf/y5Hmahn25ytM7DIePoFnu061j
         odvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355771; x=1774960571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Foefc7NLncsQsULtFdVyI52wAX5lZLxzE1pYWlbO84=;
        b=Q1FYr16KNuLpum5z8f2QKpBcCHCmQJtH+9jZZzvwZcji5edSzE3DdFczhAA0cSSoBe
         G/GYklg+Ez5FmGC7x/lT+g7885DtAjaLROkwVszq+H3ZfdsoZIXpzU8EihvHa2RgLnOY
         BGiT0koZ+y39yrz0ZvfKzJ57hPYV25Tzo7JAoXuX9ejAtdO6YF4RHp9IGr9iTopRlxRw
         1J4jHww8G4mgKfnbrmUEjV2pPA2GWsU50rIrJOfZdsanPEKzLp5nq3XhrlIDs03nYpHj
         rtGpuHeEyTN+Tk+HhQj6pzWJHXV7jCEMZymskI63K7tg3hT4OENVzfGgDYVHnAZgbTLN
         SgUA==
X-Gm-Message-State: AOJu0YzkKiatcIn+rH2fVrDIC32DauUypdakmpEJEpK0u4JlxoD4jDmb
	phEWjwy4EtAKxj4Gl2UzXtwEF853szFOsDMJrsC5SLBQ/TlMzgabR2d+twe7AgRmih3sPxq0fEt
	XofuhzbXmKLiZdY5Pcqu/wFVXoV4Tfgfnl9lUMqzrMKVdFua0Dd04t29e5ibLRUnL03Rt
X-Gm-Gg: ATEYQzwAAYq8GOTal26kMAs0EvTxj8e2GVJjMvfAgClQP/RwFOpaEjYXf37+ubc4Lv2
	Sd9t1lZR5upU1W0PlLXF9V70mzo9vEUHWFJm6Qq9Q8Sk0LcvaY7ddyCDEIbAdD3iFKjOHNTOWDO
	7jPok625LbISrB5D19lLxcX4xRM7sEdLPPQp6NwUKh08uDQT8JKx1d/0Y4sAlQfZ8jvcph6el/h
	cwFUZNg0Po81Me4ZPt7bQ2NVq3/gLG+ohBs8LQE0aEYWPU/zz0kTbVby8IGQqtId3oupzfRXVuT
	Tph/9lvIEdvcILayGffyoizEZunY8xbGbpwbxa+YxCfvG6jcEfUakIfjbHlpd8NTZo0DZc8rsYr
	qPSLIxh1IAXeNze6xUvDRjd7xH80rpcnjEzzmRtfui7Qd5Hf4ID3wFcEv4ZLSsW4oyBqyFRyx98
	xXKtM=
X-Received: by 2002:a05:6214:268b:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-89c858ff291mr186891656d6.0.1774355771282;
        Tue, 24 Mar 2026 05:36:11 -0700 (PDT)
X-Received: by 2002:a05:6214:268b:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-89c858ff291mr186891256d6.0.1774355770680;
        Tue, 24 Mar 2026 05:36:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832fdcd36sm605400366b.28.2026.03.24.05.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:36:09 -0700 (PDT)
Message-ID: <c402afa3-1eae-489d-8358-fbf4f9a80818@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 13:36:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add AYN Odin 2 Mini
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-4-33a8ac3d53fa@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-ayn-qcs8550-v4-4-33a8ac3d53fa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMCBTYWx0ZWRfX8j02i+avUuCH
 G9v3NUJpZ6n9+rS8AiujWNzrUHH67fTo1aZH0dhh24wN727Yu5CyNf1K45ZGO3zfPQIQ9As9Jaa
 ZjrbgOlSUtwjqss1jnx95znevm1AoVB+OLJSkHiel00fY1WPuMtOz9P9Lyf9TvLiQR7hj4ySIqR
 QI/Epsytv0VdMnv+12FmdDACvdIIKv3sgLYTAVufGX4gjmV/9TxO7PdvouezRtRlVSuTyuueD8v
 ZDckLdTrZqkvf1hpFupBIdNr5T8+pt8LAPYehQahUJ9RTBjoTq+Lj58qvB5GclI4kpRGcd0RVfI
 t0icsMa2yF1DCYDkeBzVoBCOhJfLpRCT+SX2ymIrGKDW5CnRONQSRAWj5E9MShSmPnrZxEwlPR8
 fzxn/FkMHRHX8WXSL6uiWgLdwL1hy73UmSqXD4L+okbm7gUdT8/HXOrAnQ/CkkqPGRZrTEX4Z++
 84BQeUg1YFNteOrscSQ==
X-Proofpoint-GUID: c0pvIfEzIrh5U7PCFLgGqWzDrYaR3Aca
X-Proofpoint-ORIG-GUID: c0pvIfEzIrh5U7PCFLgGqWzDrYaR3Aca
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c2853c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SQODTQQMv2b0s7nSLyQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240100
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-99647-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sobir.in:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22059308957
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Odin 2 Mini is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 5-inch mini-led touchscreen.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

