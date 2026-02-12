Return-Path: <linux-arm-msm+bounces-92692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA59GYjCjWm26gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:07:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D224012D4A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29927304032D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFC0356A2A;
	Thu, 12 Feb 2026 12:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVJn4/fL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOUD1JmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB4D346A1F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770898051; cv=none; b=fQKsG7cvOdj/f8KoNYGi2iRizqFKKT9omWydmNFzEUgAtcEfrBaEIWDNfoWOWVBOOi8nbTZGMZhLN1abVqeY1v3Q4sgpFJZdeebAM27hNlRKljNHKI6T/3wqj4fPtF8TgdWtAX94rBcfjp1g5cZ/r6TchSlNE3nRAPrvQwN6qWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770898051; c=relaxed/simple;
	bh=FadqcaIExTIUtkGIBGPU8njK45rv7t7Sin2D+ouTCvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpdrmIwmFbWohSZIgG2njVWBM6FMQilL+jrqR9uq/78CElyD6pVjkxaWySPPS26sV2FkKuVqTKJWX2fo9tdgptz0PgEdvjEMQnwkvCIsGqjhu1NmseTgINU8saqMz3TqkfK0kTvphGFFYIPR+uofX117HsFMfPOzCkc+YCA3bbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVJn4/fL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOUD1JmW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAGFsB4112091
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Thpgs3r4xpWKLJQ58zxeP7+Av3iAjbR8Kct1ef46IMs=; b=RVJn4/fLiKl3DcFH
	BfdTh9xdcOIZMY10nNA3cNnyzAfQ4+j1H7AR6a8gyV0ExNdstWKgkL1vYnD12ddT
	kEspW6xXTXWUB9XF1plat3nOj51TonqYkJxfQq7r4H5CX33j+wyjqWVy6qBuRFS/
	ypJkwQ5uoPBWB6RsKZaJRF9rFOJp3/V4Z2JoX7bmV1HSpNv2a9rl9EhebDSGMr2c
	76e1mvXh102kABTyKaz2d/f/qvE0VDI9+I/KdjDf+A8JEGGfdCN9x6zhsWKAgp85
	0RWSvXZRw/vd7JRGZaFdfLCJ86xOG5YLpApNT55gr3l3otj+T99TDEm59H9l/380
	dXEwCg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9cya8axr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:07:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89496f5086dso28527776d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 04:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770898048; x=1771502848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Thpgs3r4xpWKLJQ58zxeP7+Av3iAjbR8Kct1ef46IMs=;
        b=fOUD1JmWq1tGu3vg1Vj8XMITK+igmUw4kEXPCoETICGcQFwWRlzc+sZxEUAlJbtZPq
         qNy2MvSLl/g1Tn+w1zcB7M4mEOTop0MFZ0cBG0YDt0qYvV9+gkQOM7adIFhn5WE4lr78
         /+M/jqSYagjHNYM1Un8ZKYcs8FyrR+oukp79W/Xs2J1lb8rqJiyCokHaoDqB6Gvi0ZYt
         44sypC+snWN46ZZ2lX4LHSF99G+l0irDDXzCWustJHyriDL4JA1daNH86YznN0McX/Uw
         6LZNGnICamQPfhHgZFpW8kjkw9l4kEKCEwbGoajDm+3/NUwUcv6//G015P+WBI4eUeoV
         leDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770898048; x=1771502848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Thpgs3r4xpWKLJQ58zxeP7+Av3iAjbR8Kct1ef46IMs=;
        b=o7S0fElybTzXfucTbhRNf6zqckDbLmc0m8rUEk69cuiXBg27ahJ7U52Zcwd6lwAR2q
         Vvt5ds+PjMUQC1XJbIxydCnuYwDDjTtL9cq6XAqVg2eNqkjZMSqHlcwXnQcvYrc+f5yi
         4FibnGN2zseIKAiN9Pgk8Mlk8mm8N3w2wigOWco04cMC9SVQar71i7fW7ox8QxJwss0K
         B4cw0XCEPhoXStKxVQUpGpTMInn6oYyv8kpQueAtlLfag7Aw2+rRXM9bYRwZN/NxLJDr
         OvGq8oBmvMrqdo8R0X8w6IQiXqmo0isDUhxFhS2ypBJNfzBHqXuFTZH0F5LdDJWDTPIo
         O0zw==
X-Gm-Message-State: AOJu0Yzx6vzygYebt6VWZ7ZQrwiFQtEjKZ1oUv7WjDj+8cZJ5P+Xibd5
	7rtnPaebzxjijhN17faPocZSaF0NLUB0MHHr0tp7YYyv3YLW+83u29hqzTssV+xblq6dQwlzdVH
	93ijlpJGNiwOhwiPnoDpREunJAOgpLHuqpmsz4dWN7Ee+Q1BnGctZ8UnZsCNW9sesPyvy
X-Gm-Gg: AZuq6aK6vosr98FVjw44Oo4vzaMiefsRSKA8jKKQZRikp1H8SbYZ2tbXl4TgnpykrVy
	daJRZ6k6wxNsNvGs9tJifGf8kMVmEusoJ1f+aXB79QeS/6fWR5E49vpL59htTiA3TxlqlYKIxZS
	P1tvy4zL68pWO+viBetB0CU9vods6R/H/pKZO9vnEX3xkqDn08oy01YZSEBvyzdeWeExORhqwi0
	tm+KcoDi3X/VuxwE8myikfkednsJqsRm38XciFfhKb5vk7KyINDGIJxyrXu2B8FlPJUo3DouH+w
	QbF+cbrgM9JPyMMQI0AtDgFArDJ3CrSXUdDwPmU53zurdapRJLGarnb7GJgsSYukpQ75b7qTAjD
	vwUP5cmCxhKJD1ZWmEf9A+CML0DvGvlZrQVGUIuQBfaIFDyywI77GwL4N8xlxOTymxovzmYwi7y
	jE/nM=
X-Received: by 2002:a05:6214:4c89:b0:896:f2d4:1df3 with SMTP id 6a1803df08f44-89727af2297mr28098686d6.6.1770898048492;
        Thu, 12 Feb 2026 04:07:28 -0800 (PST)
X-Received: by 2002:a05:6214:4c89:b0:896:f2d4:1df3 with SMTP id 6a1803df08f44-89727af2297mr28098386d6.6.1770898047971;
        Thu, 12 Feb 2026 04:07:27 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf38c80sm1709186a12.21.2026.02.12.04.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 04:07:27 -0800 (PST)
Message-ID: <0f2fc3b0-3263-490f-ad35-24651a800f11@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 13:07:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1-dell-thena: remove i2c20
 (battery SMBus) and reserve its pins
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260210175001.7691-1-val@packett.cool>
 <20260210175001.7691-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210175001.7691-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ABsvfAaRUWTFKIeclO8EcSDHaFtVXvsX
X-Authority-Analysis: v=2.4 cv=OrBCCi/t c=1 sm=1 tr=0 ts=698dc281 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=n2RZqRzcAogvZMCmR6YA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ABsvfAaRUWTFKIeclO8EcSDHaFtVXvsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA5MCBTYWx0ZWRfX8BNxIOGlbQrM
 i0cYPTN+PsIzfPHZiVnqc0cvq/D+w+4msgYgRwbAU9ssApXixxZpouMyQZQ6VbBQK2np0paff87
 9RL7sY5a97Eynqn2hwu31W0b2SMzMYa8EWHRPEptdsdkS4XGehu4gbikTSVyeksJRD1uQ+7PHzy
 IVCKWoTc6TrgcMBjTLc+ta4r0Uy7FECn3UUsKFdeB5wYaJ2Qb3IxO5Qph4d3edqcBIAgubc6Kae
 NV4tLDhgNeNHyuSeD0kLfRc3loGAtpmLott/Uegk/YF+KH4s1fBpURFl/1VOpniUvg8d48aC+va
 y5lteJ58qMco5ej91kJMi6ELhkIXvl8fK/jlQilUY9gf1H539gE7x6xs+zj/sdGENbtxei5lSIW
 lEsH+O1auiCNAcNDb9TKLirsgyd5UG0OdGpaz5wWonjVgdmfT4AXQKzI1VMngseHn6qhwQnFJqL
 u9UzfehuLWRqEJv08ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92692-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D224012D4A3
X-Rspamd-Action: no action

On 2/10/26 6:45 PM, Val Packett wrote:
> i2c20 is used by the battmgr service on the ADSP to communicate with the
> SBS interface of the battery. Initializing it from Linux would break the
> battmgr functionality when booted in EL2. Mark those pins as reserved.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> Wow.. I was pulling my hair out trying to figure out why I had the "broken battmgr in EL2"
> issue that absolutely no one else had on other laptops, turns out I did it to myself.
> ---

It's good you found it..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

