Return-Path: <linux-arm-msm+bounces-90997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HzcE1b5eWkE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:56:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D9FA0E9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2C42301AD3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBD3314D15;
	Wed, 28 Jan 2026 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnmGYZDM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rf2w74tO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40772D8795
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769601346; cv=none; b=ZkOyaZWBddaCKdyWPbSZD2+6aJYku8k90xTGUUhsbduXBtdhEKjlAGq8wuElTkRj3Fznj2eqz5aaOLOpMam4ZuYiXWhQJm8PTklvztaCKmEBK2ZvyHvl251gtSyUFs1qwHjj08WbcFPl0t5IhAiAdCfPdThyyWHO2tfAkB3BjnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769601346; c=relaxed/simple;
	bh=H3otKTxk3rFDJ0dx1ZFjMEwVlHqvpxU4cSA7tco24gA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AantYYOab6b9uZkCpkMEmfUEZoksKRZ1B8hg67Cx8q6SVKyLbKRhwqitey5uK8QwzyCglWt+4MSaUHqsHYZ8BlHLV5TPH+M8XtcjHQ0xnDyknL/uXuxogaOIHcl6UsU7MootbTfKKQPw2uQr5ADYRcCyDfJa9HAQigfhoiEgyew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnmGYZDM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rf2w74tO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S9276V3920932
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PtYnkHdpHOqXwvm2JgPKv9lXsyR9oATXSrnQPInxFZY=; b=FnmGYZDMs+p/m0uw
	bAEWZphoiDKfK219ve7tZuVqTQBIxQ8orBBGWv/7b3MKkzWLL7ptW6bIMKLLfpyu
	0vnMJABN+RH8VuRgoc/ozkA/u3Em3NJ6nXzrhw9KvH5vMYajNrtBbOJFjJE+rniv
	fqWqsJwTnMECJMc29MUk1a11TpvduEqWJ7d4ml9iR2Jf2gC6NW2QO+gl06dkSLW1
	eUqKuOWqeAO4jiVZ/OnYWYQiKdBQpPZKuR0e7X7jbJfwkWtWW2KZF6Tevt+Nvjip
	sSaXchxVGX9iqH1KR1LGk7uy08WSyYgb16GWpgpQ6XoKa10sPAuGxQsCmf1SsG/W
	WO6Pmw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by211b75d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:55:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89481f822aeso19846536d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769601344; x=1770206144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtYnkHdpHOqXwvm2JgPKv9lXsyR9oATXSrnQPInxFZY=;
        b=Rf2w74tOIe89N8lF1qDcVQUTAnBh62tv/YPMoeNS/jHUa84ktiOWRhClxbUPxNV6hn
         eE+LazmUU4JduD3XYG1Wb++CE67vkkXKVTsCr/eLx9uFgcwKs5ETWQhnmQm4PgVaF9VB
         faGIl8b7uG+FgCe4QYIsSH4u3n3mRFvxTftRO4nlnVLPchK4c2X0r6PBCIV9PJY8Koo8
         puWNWRHYIlv29UtiL+zEkc52tK2r3D5bpRyrfQedyaB+h6xdapgu/KLAv0ZTXZlRJi2k
         DjBfPfhNvFKoaqNliHwbhYy2jPzYnvKBAdv8V+jFrDd9tihg2OZBRegMoNKFyT4rFtHD
         /Z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769601344; x=1770206144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtYnkHdpHOqXwvm2JgPKv9lXsyR9oATXSrnQPInxFZY=;
        b=TDgYlj/wcX6Ccv6NMdRZkjl86fYtAlHsrlxncatOfDABxg1Ssub4l1wNzwWDWk9Hx3
         l/u9sPZLF4aHkTzk0vxRklivhmKz1HNsDoWlr+eERTxh6Ozzbi6N2GHrG/LhYEvR+MRv
         W72mBuk4954E2+YXIjDltHqzb+JRoPL5ln6eqJwLKYk0SdZ3ATx3QjMveQqVDdv3KUWn
         jp9Vw1fP/9yBa/3PtgUNudlFmPdmxNNmALHkREDqrfLGumHILoUlzdL6wXGI0lA6ca44
         i/reML44ICsy9sDxamTh51a6Vrs5FptI57DBGPyi8VpxWwUtD+l11J74lLhYBAa6YWn5
         f+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmJQlo0ux9bKC9i2QT8r5L1B4UIUGVnYXDA4NaT5SkCwN0aZa6awsBIdhRK6ZpHmaaCjc9yk1PWVi1gwGK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw87GM2Kb/nDC9q7p3F2jkNL945+IfHuQDwcsSJL5Ia3Vjpy9g
	egeC6opmrygHX9kk2IxTU4pTWWsJRtit2RchEiKZu7V0L85iULoRyXAqQPeid45pScfK4WiYPmt
	ZHJnZPe0AZP4A/IrW+wMcjp9uD3o4MRMMP0nTMgqmrph/Lngi9yq6RdahxLtsuGCVhqwz6piyIC
	Xo
X-Gm-Gg: AZuq6aKMXriBuuI6pJTbl+8+Ygs81PLorZzgjFYFkmN26NoXL2SXcdIW7ZfThAXgD3T
	IVjoJJQn+sPLuPID6MB74rzaxUScwVjpx3MkU2DG74Ga8PEoME7fSF77TlMErPZ0ML8s4lptOVL
	SAwaK87MCO4zC/cSfHOmB7jP4xqTU19Zk+d/uR0yHcGdNeWt1/l9VA9vzqRcnFzDk4fwkYvlKK6
	3uyaQIKQaM1L/nrWpVbSaDfWgI56v43EEIvQCD8utwfusI3yVyolt3wpiexNfgEiJlgi2GOuBjE
	+UscBus09L+rQ6+2/VTyMir49HVnvRG1e8YCSZrgI2snpC782LNvSDBbhyi/k+joMJ0aBi8bJ89
	jvTADhIapRJ5knForAWIywP1KLd2fOJ4usR1GZz8PhAGDWtowCfwBIEaTWPZ6FbILVAU=
X-Received: by 2002:a05:6214:7eb:b0:894:d846:db2a with SMTP id 6a1803df08f44-894d846e401mr6160576d6.8.1769601343689;
        Wed, 28 Jan 2026 03:55:43 -0800 (PST)
X-Received: by 2002:a05:6214:7eb:b0:894:d846:db2a with SMTP id 6a1803df08f44-894d846e401mr6160436d6.8.1769601343228;
        Wed, 28 Jan 2026 03:55:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4452e98sm1453466a12.12.2026.01.28.03.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:55:41 -0800 (PST)
Message-ID: <b3460102-c624-43d3-8cc5-fd2d4b730a9a@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:55:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: add Acer Swift SFA14-11
To: weifu wu <wwfu06@163.com>, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260121112721.2981491-1-wwfu06@163.com>
 <20260121112721.2981491-2-wwfu06@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121112721.2981491-2-wwfu06@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NyBTYWx0ZWRfX0G8jSAFt0rrd
 1//V1ATaF/fb48igkpF7Bf4tUNNj7dV2FJMdw2oQV1zeTQUUgswmnKXchXDH3JoXBKyo6NKMjFr
 /X8a5h9XK/51f+Pk3qPBZbaprZXnWBqRFuwt4fRmZT62VKEZGRMkTKGUyrzs9hgCXju7ok0UiZQ
 0tA5jKglN4deKYud/9ZtsBOV5bQGCWWXIQVF9nlesrbJkh47XMTKtQpzbcY1Gy5qWpKFs7z7gRo
 UuGjt3LuuycybzmE23pVRvaCvruYnV5uIoHVPrGQ5uIek49nQWMUFeOUbUvgHaIHidaT12fptnG
 mDmAaMhCAgqVecjBg+7so9hgJpTSUMfNYVSxxPNgBwGuhG5fA8+tim4LhGU3mgO8Jw6xiDqrtFU
 CDn89WvheOxcLnR5bsx7q78b0DoREo7mRUTIWuWKUzr+8XK/4YQnjOb9+AZlvm1pVlEC+dDrCUb
 bXze+6ps9sFQhJbwvww==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=6979f940 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Byx-y9mGAAAA:8 a=jvBw4LpriZxvjtxAi1EA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 044jBUOUMReUYj3Kcs_3mbD-XIi8O0iz
X-Proofpoint-ORIG-GUID: 044jBUOUMReUYj3Kcs_3mbD-XIi8O0iz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90997-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[163.com,kernel.org];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[78.88.45.245:received,100.90.174.1:received,205.220.168.131:received];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3D9FA0E9C
X-Rspamd-Action: no action

On 1/21/26 12:27 PM, weifu wu wrote:
> Add DT binding documentation for Acer Swift SFA14-11 laptop based on Qualcomm X1E78100 SoC.
> 
> This introduces a new compatible string for the Acer Swift SFA14-11 board.
> 
> dt_binding_check and dtbs_check passed without errors
> 
> Signed-off-by: weifu wu <wwfu06@163.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d48c625d3fc4..3de631667701 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1076,6 +1076,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - acer,swift-sfa14-11
>                - lenovo,thinkpad-t14s-lcd
>                - lenovo,thinkpad-t14s-oled
>            - const: lenovo,thinkpad-t14s

This needs its own hunk, your patch as-is says:

"Acer built the Swift SFA14-11 on top of the Lenovo ThinkPad T14s's
motherboard."

Which I'm sure isn't true

Konrad

