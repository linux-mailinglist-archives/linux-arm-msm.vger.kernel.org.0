Return-Path: <linux-arm-msm+bounces-117267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rDd3F9/UTGoKqgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:28:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E978871A5E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:28:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y8J91CS7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ckyDrN6x;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117267-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117267-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F255330E2466
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEBE3E0C7C;
	Tue,  7 Jul 2026 10:21:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AED63E00A8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:21:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419707; cv=none; b=W6UFzuMEap3cRbztyNxhkAHofpMq8nw0g4bW0qzDk84AE2VMLxZEi8IWApdTywHfI+mjrXUIpLbRAGGNFv83wXW4laKJj/yCK0XeK9n0XgM9qGCcF6IEbEyWUakrUC+78BGa3hD3ikmmmbS9ThKmeOUxwNGYhbBCF5d16xHZ7nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419707; c=relaxed/simple;
	bh=OnKD9+dtoR4+Kg+NOHjkHev+oc5f3OmADkx3Zs5N+MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tk9qcsT9H4mSirOFPfILai8QB110d/kYx320g8Tb/zdOcPrXvNUOtubnOXyimHPLsLKlAd7E5AKcx/mPeoxrP0y3xS5Z7DKyRYdjtNIBiPk+DLq5Nb1XgwRM+q6n4pgP3hyB7LgH9xJYGBnmyd9r7jeGijaCm8g7gxjoHh4wjnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8J91CS7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckyDrN6x; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EJ0I3203838
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=; b=Y8J91CS7IDLxlPHw
	0LLgApRX7lHYylK9rfWZAp9eUmLBq6KTso1FforgrKsnzsy+g6rngmJLypolaH1A
	U4l/qWZYO9w+/a8wEnxNZoyP5isz2/CpL3iz3Nc+aUwpjow3Cwqe8i3Wk/ce7paS
	rjAdDKS3ruuN0AltXANj6OF3a5mfL+E3+vC8W2p+3IoGcJMxoI4nS40Hu5Aigm2J
	SI2FnXKHWNXqGeBK0k647f9orOohl+wCzV/M9Fa0bjk21b2bzymxVIGmAhsVZrJ5
	zeH9ff7XYsky5cekOSkjsmMHlNYeKR2xvj/2fIOt8y029vPu3QJ9s6DWoqTHRkfr
	rHDMoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a8xw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:21:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c08e9c344so15849391cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419705; x=1784024505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=;
        b=ckyDrN6xVTh5IYMJQ+Lnji31CrRDVqrlSM5IrhHJ1zN95RpRYejR+sDwo4xdOqaChC
         fIV4HBoZidly6vJtj8X3Zcc119Xaldpny3KkL2ys7MdFf1ryO8SDy3rpfAq5JZ7DWbem
         RA6jmjd16QWeiZ+3ImcTB7MjuMIhVuUrFaiWFVXqeZ8ycTOoNeQc04xjRmV1vs2MQNQJ
         P2r7cxqXPpTR7yUqQjozgQINSYj61PntQGgqJl1DUgo5ynGJSpZOFfg8GDyLnoTiu0at
         nCrzBPTRBUFsMdYk4G1WNg6JO7g3PYqRz7mTM7mgVCuyF0mgY8jeASDfZAd99lrdQ1bn
         hefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419705; x=1784024505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=;
        b=HRYW7dqSQaaZHAqo6i7t3a3YSdXO8qcHCefXponTrzmLMlFlBFPUBZa3XABmUrchfd
         xV9qXUg9xbAK4aIu+18vQm7vZBpIeiuTlJBGY169LbDmi/r/Py5AAfVC5KDzG72xTNeU
         vxgIJ1jQyu3QHj78OgoKbAbtNrF0VY7WoImvLzYCw8bE+JnfTsg4KTswJHWe9y4CSW60
         lP9wLl45lzuxPaxJaU9Ztsw9CkGmcqVaUd29u4ygSajR2iiJQBBwnT2fmVBLm51OJLd2
         rRtaWspZt8xulQXIhkrypDgmCskTJy+gv8m6umbF7Ub4/xc4pijUcKuS+pXx/J9/wNkf
         iI1w==
X-Gm-Message-State: AOJu0YxTrr1BY5YPcmv+u+iYyua2LOXKqo3kbK1T2NX88wHFG0tAYPdo
	jmfiasGSgvzB/3kmhoGNpMAayw0+mbWxGFhS/KP58MKPqafq9Y3AV2KotAQWIU7oJogX6VXSfSv
	avNYV1hwOrr+yy3QU463gxyEojfZk/8fSniAjJydYqJHKW31as7vutlRO0nfPhhmN8xYQ
X-Gm-Gg: AfdE7ckSMacFabD7PAIzVtBgmea76D8W3QnMBOV01XJul3T8N5PgLc2dIPVXtuYg6NL
	DXU1UINUI0sRAbkQGCGqKL+uWxX/2qVUqgdnPuP8CJ5VhXa/DYkYSQQqKnv7R6AS0elxdOK6n1b
	ShNsQHObs0qdMkIz1MNEDQuHnoQyo3TeoG+e+H72vsrfXdzBLlTw+5eIT/BBYex8BSPUe05HWjq
	uKE+ypIHEBqUWqR8GQAK6valj2hZYMcswDpu0NjA8l/DhOci302GnypBziyJ3On9uEA6HsCt3bz
	nUNONRln0JLhcnS12DFi/II87NNoYd2ovEBWIciaV5X2ddXu9OOyL/Szh+/8QPdVnV1LfNhE7Lp
	w0/4YaAZ0fuAvRaojqVx/UxXCm3LMKBTevmU=
X-Received: by 2002:ac8:5fcc:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c4bd5a886mr130331681cf.2.1783419704851;
        Tue, 07 Jul 2026 03:21:44 -0700 (PDT)
X-Received: by 2002:ac8:5fcc:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c4bd5a886mr130331391cf.2.1783419704382;
        Tue, 07 Jul 2026 03:21:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb30f98sm102446766b.55.2026.07.07.03.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:21:43 -0700 (PDT)
Message-ID: <bcdbf070-8525-42a1-9c56-79245f8f711d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:21:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-3-8169953634ad@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-3-8169953634ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2tPiJqU4AYoZow7lXvXfUPShSNC8PhzN
X-Proofpoint-ORIG-GUID: 2tPiJqU4AYoZow7lXvXfUPShSNC8PhzN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX87ummjAt7s8g
 0MGLfJIzN4ygPGjU/N9qtxm1BQbU6VKvnNT+KdHl/k05VHIBTRslRjCn5OgaXlIv5HFULr2ZFQy
 nzKjQd5tDo+a0y4W7bMiR1CTcwvr3FE=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cd339 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FWBTG74ICMjwBxTGBBgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX33Hs7uQ6pQza
 GtzX6lXfkusgQcAVJmjBFq2vjqx4+sMTw5C4eTc7TqAm3n6L9xlr26zAlBlLGTbNU6lntwtJQfI
 O8PJCiqotJKnIuWoPmNKOMOpK1BJ4RoHTHS9h+ziJNohxUWK9CPWZ7mYJvpVxpU88knkGxXnc5c
 CjTiEGr+WnyZLNV5TxWrhnTWDoF4+3FkqG4Vdl2AMMWIie/AamEPcjkRg5YoC2jWN7S/ayaDfTd
 LYU6ED7h7D45elhIk7aMuYfoNp9/M2cULUkN/Q2Y355zb3MOI0PJSkGyteOjawV/BE7hRYftyeJ
 HYdOCRhaiR8zaQQi7MukduRGx1wlDzVfXFeq6W88TFut4QYR/yC1Wx76AUKoGWi8S9zeNzadrE+
 MsOK1wTGpZ9I89El+it/tzS9IKbg96RK3Df+RAFGstQeDahHCZ3SzVbJ0jiiCEDb/1hsHchicbG
 B2aWiRbHiGYERZ6shzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117267-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E978871A5E2

On 7/2/26 11:48 AM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

