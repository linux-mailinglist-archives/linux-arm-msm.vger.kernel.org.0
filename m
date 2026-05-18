Return-Path: <linux-arm-msm+bounces-108126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCZ/BdXNCmq18QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:29:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F44568C36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D3EB300A595
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369C01DD877;
	Mon, 18 May 2026 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzhU4nZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IP0YDWWl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78B030C15E
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092162; cv=none; b=kbooAw2jclAV2UM+EJ0ZgifrHyrnS+UhRirMxU7EEklsd7+D4dmgtjg7xYP7dMTXvCczTLtaKNuA1z5WXDmXcq4LlxX71X2ZXyLvPgKhzrVzPGCRROq+8NUv4yzVF8JnolIx3Zl6UTpkkMk0+7a5TgBCxaxEIHaXR0APM4/p5pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092162; c=relaxed/simple;
	bh=2EXg3OxF2j/6al05Qm53ULE8j+fAjq0a6MlKEUyB/Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIoHX2EBkYEXIE9mYayZTTAcdUgk/GYmXQdr7BSOWVwr+3v3n3VTfOCZ1CGHqSc5l29rSwmEqLRfFrKoMUhthY5ni4JYChrXht8hgJfLmrhbmGjeBI5JXHlZo0vYv0seKwGMoXtQb+s6e+g6au3e37UuI7Fw8BCb0UMtIUvRpEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzhU4nZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IP0YDWWl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7OYWH221510
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+BXVo92FUl9O6WDdoWVkgJNuoOJFy5KObzGmTx3Jm+M=; b=RzhU4nZGfi/gQBRY
	UzpruqOz7ulYoB2AwkK9924jVo+bHfw91xww8btYZ5DnL1emiCmiUPtZeDlYPufq
	qx1q9T0VtmkONvwrZ0R3EgBE/diuHpPXkhWWwydMx6rR9wk2ZguQfxjSGLMet6hs
	V8rmAyWPjC/UphPxxdtEKvtggkBrPtJFGGK7UMhRSSPVQRRYxmoUpLz3IL9nkvEk
	GOhrL0uvgvQGAqa8GEu6um+dMec2w0VPb324CNXgShU7PKpZd/x6ewAnBa2Jifb6
	IdOG+g9Jhm140Klp8h1RhbwYf4whuJ/rsVwTEHnEsZQ8iqNXU58oe9ivnLzx+nQp
	f3vsBw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g5dap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:16:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9114b077480so25264785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779092159; x=1779696959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+BXVo92FUl9O6WDdoWVkgJNuoOJFy5KObzGmTx3Jm+M=;
        b=IP0YDWWl0XGpxOVycwEuiOTNyYNXzWsfJoBY1Tww0Rp1xocd4QBHhEQLaHbuc9oZii
         elQ6Erl5FwqVt2HsThTjRmqJBWtUb5tcmB9LG9zKWZOsleDwp4QqQniX0lUZU4PWg9k7
         PWuL8pa+qlhbggdv4IPxPWtlSgiNNVnlQJRdZgQ0OLd3xbPgqVPC25YRCujFNp/TT+Sd
         c9m/ebyZPOBqDO98xprR60aW+nnfbO0AWT7hRrxir6/ZJ/c9VWuiHNjUSqsny5dXTZXh
         +6jVxf4xUJ8wgJhH/7irst3iGWLb4c0gZEYqucB7nQSYLComkmeG3Qfhnc3goIxyP2Gf
         g12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092159; x=1779696959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BXVo92FUl9O6WDdoWVkgJNuoOJFy5KObzGmTx3Jm+M=;
        b=j9w0U33xfkCUK63F8s0K6MvfmfzyFMpyUoBWjXYl8O4jJx6XrJjHD8nIboDM/xTK40
         /qpanJ2wkti7tvoz+keWICipsjQTdfzYeJQAfhpohVynSIMBLN3XZrV0rJzHWTFvowrd
         AknSlA23aUljwvoJG4mr7Cqi38Zlk+1Hq8uZzAemCdaAXlaFzW0T8lwsgLrloj1AjKP/
         +PJWj3m7AlzeVM5fD/mtyiAw9uw8vV1maTw1bA73J3jBfIe0tpO2jqzMxI7POl428cPf
         pppicxDpd+AsFLo4HfFG5SN9pyGFtPDO4DYUa012mW16WsKX5a6hirmh1rIvEg8l6SOX
         qjRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NAGiLC/y7oKdfpIhQ8anksHssRMN3dJotq3bNBl3Ef3YPlb3j2uC/oXj0VQIjLMwEdV5Rd/xRPKSAQEf1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf7slM5XS5qo+QoKj6qQqEk+Wjnm+onKBYKuDaCu0V/qJj6LVY
	AxqFXfm97CUCqP08TZ3c0mnQCmH6mkPgOIDAbKB1Nnn9Q8XGTuIChSq3vDKpLbBn1qCwl/9YLgP
	LvXcE0RNwRN/D77YBajRNFpGnX2cwXn5km+pCk7lH4r7UtbLfkP4NjzzqGBtr995f2uqhEc3c+A
	Bx
X-Gm-Gg: Acq92OFtukRb4Q8SjR/yr8nRldXHRUFjJ4W8RkTiA3vhgLW5pSS2261YL3vL6oKJy97
	HXkvPN2FJlyhiA5ilG3GlHO0Scz0iJfs9YvQIQIvYAOVqu4SppbJ6fcT4eSujTIJAjgehqP2wx3
	cLwu4mDhfcOadFjbw/a/r6p/XI5jnz9iCcWlj3uHOB9jarolpxuYIUUx3eYM9pjDRDw1/eJDTu6
	kD50DlTxUk+64CuqVHGXXyzuMYsXbF9SoqbzEaU7UDBm+Y1LzEGI5MRKovzxk94YO2mOX5V2WH9
	2DGX1MgYdZLFQCAViRpFc0JcY3KowpiTb5Q4Yp4rBjfU/XiW8GB6DrriyAZXFTh8UWUzuBYD5IB
	LOq9niQnOyF+kX/ve9z5ekDO3h5MA9j/A6lg/5EBuF+jZWLPm3+Y41YBz+bH1RUNFq+v5s9mtLT
	jbe/rmp9nVDOrTUA==
X-Received: by 2002:a05:620a:1997:b0:902:daaf:22cd with SMTP id af79cd13be357-911cae16edemr1370911585a.0.1779092159182;
        Mon, 18 May 2026 01:15:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1997:b0:902:daaf:22cd with SMTP id af79cd13be357-911cae16edemr1370909685a.0.1779092158754;
        Mon, 18 May 2026 01:15:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831187ecb7sm4807181a12.29.2026.05.18.01.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 01:15:57 -0700 (PDT)
Message-ID: <365af59b-e7f1-4450-8ef7-77aafe6c7028@oss.qualcomm.com>
Date: Mon, 18 May 2026 10:15:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] i2c: qcom-cci: Fix NULL pointer dereference in
 cci_remove()
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
 <20260515234121.1607425-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515234121.1607425-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OCBTYWx0ZWRfX2pqkvDGF2Vb8
 WB3YW+8JPC88tYwI6fFHuXHjISUVtfTFeLrJ/RBsStcfXrE+iE3AMI3mQ30aIJWEozBGp4Le7PC
 U7PQMt82ReBrf8H/QlSrBSCIFkLQr9hTelEFjakwJ3XXZI2SyUalNNOq8yraYy1mtbF+aHmZEe7
 Al3CzvQyIa5Yugvxq8aVkgEPfR3T84wq6r3HEADDIJ0D5q0GPDTn8XaCPifGyuKb+Tl7g+pSc+k
 QjoVRNrC8/+QcUBFJh49Wn/ETxhodNPIN9fWKO9+ZmK85NzFyTHhNm87weLnmZsKp7GVf0qA2NP
 3tjNHvKubUNHAy3IhqoFr60hwZ3MvZYOLxMj8yuvxzC+eDfWaUEh70hJrn/jK/0U1QF3tFQtLhP
 dEovIkRIdXozLbMVtH6k/EdkwPU7STCIHxscXAl8jU2xLkHaR/XhI4DoOabcZrw0FK1hl2IzPFR
 tuWx2FxzZLrBnsV0WNA==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0acac0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=A1756nShQ-hiEDrWl18A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lBGTVQlmiYz9cFUsgiO_xSEe1EzSV4Vr
X-Proofpoint-ORIG-GUID: lBGTVQlmiYz9cFUsgiO_xSEe1EzSV4Vr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180078
X-Rspamd-Queue-Id: 13F44568C36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108126-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/16/26 1:41 AM, Vladimir Zapolskiy wrote:
> On all modern platforms Qualcomm CCI controller provides two I2C masters,
> and on particular boards only one I2C master may be initialized, and in
> such cases the device unbinding or driver removal causes a NULL pointer
> dereference, because cci_halt() is called for all two I2C masters, but
> a completion is initialized only for the single enabled master:
> 
>     % rmmod i2c-qcom-cci
>     Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>     <snip>
>     Call trace:
>     __wait_for_common+0x194/0x1a8 (P)
>     wait_for_completion_timeout+0x20/0x2c
>     cci_remove+0xc4/0x138 [i2c_qcom_cci]
>     platform_remove+0x20/0x30
>     device_remove+0x4c/0x80
>     device_release_driver_internal+0x1c8/0x224
>     driver_detach+0x50/0x98
>     bus_remove_driver+0x6c/0xbc
>     driver_unregister+0x30/0x60
>     platform_driver_unregister+0x14/0x20
>     qcom_cci_driver_exit+0x18/0x1008 [i2c_qcom_cci]
>     ....
> 
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

FYI I think the driver currently can't really cope with master0
being not registered

Konrad


