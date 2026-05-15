Return-Path: <linux-arm-msm+bounces-107862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJBLJAgNB2p0rAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:09:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB39E54F2A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82E55302497A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085A447A0C7;
	Fri, 15 May 2026 11:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpeTpTRF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbE/TQkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF56547277E
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845132; cv=none; b=GyAcSOLf5sgqqDsIKOvQRY1cpXclScRpdDAI+tcMYU5Sj/4+/Ghd9VhV5ii6wT0qQRBjk/6RshuLgltdxwHGW4OSg9k8EEbFDqZkfiFiEhXtX4vmFZifDS9rExxMcmWVut+kDP/0BaHKawf7W2yQTuNerRJRVw4N7P8baL2sYC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845132; c=relaxed/simple;
	bh=lPtI+7bPwzckydO0iVdbucmaaYhFTrd54lsT9zvvyvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmJHQCcirvqCQwsL9Jysf4VQYOZcr3OVIN97miE81uEe4YSnjBLj1KmCF50AmBSb2s4New8ssMQIvhnNpNUQ2xWFU3PGuFVReoISu/XWP34QVDiE41ioApENO7yqCsw3gfcO3z+FUQy9lXR54IdOuFzTU8IclmxYx3INN7hvtxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpeTpTRF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbE/TQkw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9StV11714884
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ORx7k8VX7naCq5yHimIPgGtaL9fGzekDHfBPpm1ev98=; b=RpeTpTRFtNxQebua
	Rvsq/hiX3Wg8n7srNtsdZ/bngL1vlylcfA0kyw/0v2RfRF9ayilqJilY13jD6p0f
	3TdBos5k+MHC1yxYkedJmrx+i3pXlCEQVDiNYHwFRZ4YHbHuDsuu7nqb5MxI3SCc
	pTkMu10OIqw3QjZNm8/nnfCtUKVZFQ4kk+pbEfr3SstR61wVnL6DzbaSHfH/yThP
	l3mEgkPS33R665omEk2svN/8bJuL52UYFDYzqemeVOQd9uoiftqhfBuU9FjZCRse
	wdyChgYhE9mRgBVz4CuF1Ktv0HH98zTp+PYaKbgL0p4QNbKaRl+lxPfr+DIiyfjk
	wucXcg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxsumb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:38:51 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94de248f59eso390167241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845130; x=1779449930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ORx7k8VX7naCq5yHimIPgGtaL9fGzekDHfBPpm1ev98=;
        b=ZbE/TQkw5k+/V2IvSlHKCY62T2ryMoU0/OXbU6z/8sCPwzdQGr/kLdBm6NSh838Bk9
         vsDgqaq44ENpEfM/Tzqjj/HIvggyMBf5mpJNwW1jVg78UvFS1Kity7jzRBZEl8MUQPnc
         IEd3WcYMEI25tT/trHplvAbwEg4QXzJd73j0ptMDELmEMyqas0gStoZzcrhuwchKUWEt
         P6i94Z2Fz2JN+RpCWD8oQ9ZvtkABiDqgGBEzczkUi1K9j6uJTyDMY9q5QAy6vKgfjMJW
         ipP/oBE0TeUCALQ42mvANa2IBtTwAG2IAAYc5FntWtv1wQqKCb0XfDakdtskgu/i7M9F
         Y3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845130; x=1779449930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORx7k8VX7naCq5yHimIPgGtaL9fGzekDHfBPpm1ev98=;
        b=RRGatq661MgQ67t2EVqcmXQEuvYqyXVNSvE/GCZN92W2bCpdSuo+Dy2LNNVgP2gMZS
         G/C3JC7o/wyCLh/nvpjwqAO7cm4QIepJWtjmKPxf8tw0Oqt6ZdtEN59VAbBwMhZO9bEJ
         Uk38ce+Ohu3SSECkQAk4C6k3R6UEbGIxgwUDT8/GgTF7lQcoa42RSQCWUiDa/O2zvtIe
         lfk7Jy7E5KGwm51mslEE2nr2IsydGplMNrseoclRREpDTmH2AXfF+9ZX2rIMp/ytOlPd
         ZqBPskslIwhLBAgU3iHC51dW5yWzxhfrdJuXfXiYviEin9lRS1MpOcUfwNJ0gE5ET634
         wfyQ==
X-Gm-Message-State: AOJu0Yw5TFLT3q+0VZhHLRtICmSuAOZdan5BrsKfOxNjH6nfC47DrpIu
	fSV0f6jrW5Qph5oKmGkxttXOZ/UlTGKn1ZaUYTULhvY9iJvIh8PQqFhV8rZB1eBoBpBhT3OCIFX
	TsziqMBa6qjg4bN1EWl+LTZCfrCtsmyQ2fuAZZEnWWFxLhURbgxFAq0bbxYuDw58zHuKF
X-Gm-Gg: Acq92OF2q7otMTeSLjeb9mW2YSjfMzWaBusb3thzOb5MjIc6q+lLifoiTEBRtcKz6nN
	FE62QlJOxfPD+kg57BB7xC7C9G584QS9O2+NHNp2JMn9UywGXtADrrlxqnj2eaJIvOMMtQTtkDS
	WjryVs2/hocH57EgHGDNqX4nXzAADKJey80yFMOKBOjMN/m/SQxFm8ffSyCpDfDMma7hgzBhz1a
	a3RlsCsVjbwz15ZMc9L5mUEWfmvVVR95vL0Wi3Yjy0USk+d0whCFpniCxrVfKYklEgOsMwlj2ls
	rtz50mWJMIaTc4sFkUC6HJf3gr1rP7WGrqJ7yGdWJIx1Ud2uXtzVniy+T74yu4mybMCZ+P6xX+q
	YwaI15busgnROHhT6bUiV7OVHNrq0Cny2fLNCbV4+k6DR/yDZfSLbc/oJoUI+KsKmugVivszREp
	WIUyU=
X-Received: by 2002:a05:6102:2142:b0:632:8717:e553 with SMTP id ada2fe7eead31-63a3ffa265bmr443659137.7.1778845130179;
        Fri, 15 May 2026 04:38:50 -0700 (PDT)
X-Received: by 2002:a05:6102:2142:b0:632:8717:e553 with SMTP id ada2fe7eead31-63a3ffa265bmr443653137.7.1778845129728;
        Fri, 15 May 2026 04:38:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dec7c4sm221268866b.40.2026.05.15.04.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:38:48 -0700 (PDT)
Message-ID: <f6fac265-d156-44c3-9c7d-599803ea79a6@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add Eliza-specific PM7550BA dtsi
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com>
 <20260513-eliza-adsp-usb-v4-2-839936e89aca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-adsp-usb-v4-2-839936e89aca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a0705cb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IyLcjOHkEnF8UVrsuCwA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: JSFMg8ftcPEs3DtoDGtrZxzXU8AtVliC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNiBTYWx0ZWRfX7qwA/vq7XR5B
 dQKuEATt0YXBwgf5xseh5+9GwuCVNBgGwcZsZeNyOraOyXQFYwG1C2kjXigyzlV29zIZOiGwJ/U
 xOt7mUJXP7bn2qvd5D3362xAwd3lOkFzLvYcHlIprP8m2p/4pYZY8OK4eg3sPJDWFN+xr4uQNKt
 0fJRSfGBvvaZ7vWFcqvX8q3Q5gRBh7PF8chlNDGVnG0pM9E6eb/qrtvBCN52AsaUx3/Q76JWVbd
 RnremVkfwN/nfjUKVRWzOnxBW9bC36QdjpNzmnyrxgjjn9z5FJHQ+JiEE0nxaG64nYnistnZaJt
 tG2mF/pGE9/pJmB4dfRQLb60foNNSwungEUpVeWFlwOaKnQ3TPwo7Yw0Xs7EPabQLdXKku08Pzg
 1ARwGnp0E5SzekFER5Pj8oXlubRC68tqlXdhJWlWquTuAzWC41m41wClhAy5m+XNMZS5Zb5Ava4
 BNxhkki+mzpIh6u46WA==
X-Proofpoint-GUID: JSFMg8ftcPEs3DtoDGtrZxzXU8AtVliC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150116
X-Rspamd-Queue-Id: DB39E54F2A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107862-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/26 11:18 AM, Abel Vesa wrote:
> On Eliza, the SPMI arbiter supports multiple bus masters, requiring
> explicit selection of the master for each PMIC.
> 
> The existing PM7550BA dtsi does not provide a way to describe this,
> so introduce an Eliza-specific variant with the appropriate bus
> configuration.
> 
> This duplication is required due to hardware differences in how the
> SPMI bus is exposed on this platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

