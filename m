Return-Path: <linux-arm-msm+bounces-105190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO5VB4Xo8WlZlAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:16:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5ED493677
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7F0F3035A9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B163F0768;
	Wed, 29 Apr 2026 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5rB5OFm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpIUi8GU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D13A2540
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461370; cv=none; b=GpOax8IYVOFASneN6ZhNHRTdvGadZIfB6/8yYmTk8z7iL3VZ+idJM3oI21C5a4m3lrmoWKTH869RYP35ttg6P1Zo5qUF0QYvIQPgk/ikQ/WjdJwdiPsz3rbuDX0EHfMpVBlgOh5w3EmTwH3cOGcZPMska1ubOQcGAGHPfctnb2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461370; c=relaxed/simple;
	bh=r7g7Tm20OlslBUQU3g/4Mkg6hUWZfO2i7ABor2hIzoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDQymsaFdZGUUABvqZeVYMJM989j0LSvx1ksv1lwDiY3M0yKoYpib2DsnsodXTuu30lTRiXitrjOzeuZD6Q9Y+j+SAJ3cQOcWj6drvoETTvizHJWw50ia1qQKHW4Jt299Vt1AIUKLUVEwajbvxAjKimTT6Vuim3kxz1yqH6cB64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5rB5OFm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpIUi8GU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pxfg963214
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DnnyIl7TvFweDB2FQ98uRWoiR/6/z2AgxM6DCJdfXXg=; b=X5rB5OFm1ATf9N2k
	gsp4otHkHwPssJEQPg84pB5T9XUhNfTcnv/7LFbt+nZ4MiNsINpMA2qYCDp0iVVh
	QgaUmW+wtEtpWmKHjzh0h54E6HbYNTS96h1QfnaojPM+bRxKQZ8ybT2hDZcBVUB5
	+o7cA+132KZkoIDB8w1n3jj/nOE3ePJRTkczHziV9vYGIYnBX5adY0B7aBig8dQT
	GdU/vUgwgehDIkkTokVefUI/AJ8blEwGqwwqEZHWHmobfAlJTIhC8Vu6OtH6b+OQ
	tD7MFdKGGIv7ruSnAuSC2vLAin6w2YS5XnLEBHKuENdz0QmMP1qZIB+h4RrLUcUt
	+BtXIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4u4j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:16:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36472c6a7d8so6547811a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777461367; x=1778066167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnnyIl7TvFweDB2FQ98uRWoiR/6/z2AgxM6DCJdfXXg=;
        b=TpIUi8GUghqOGhnjPLUDdkKEnk+AHTroL+UIz5p/Fr2EAECMsa0W0QCqvelimOHtD1
         b1DVcpEeNOn2nNF4+iKiXN70oSHjuDlwY3ZP6nM0yxk9zOVEdRk8W4Kqyur7hLQi44sl
         f+hp4fXz5KY8w9qimSguT1iZeQwiwFZLIQybv2c3VrGPITIkFaubtCdb0VG8RfmZyj1b
         gkKwvutUio4G1PxZhOv9tQMS9c8IZU6bZXHgvY29/0LBQTp4nlYyBMA4gYXHNzDfsDrS
         i8Kt3HXo7ZDt+f+aqbx33m8HXWdjqeIdJn5tJiAIqbi8f8LZi8VCwv+OZFxFpjbHVb5/
         GEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461367; x=1778066167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnnyIl7TvFweDB2FQ98uRWoiR/6/z2AgxM6DCJdfXXg=;
        b=Yhn3U9VlPUGmInXP0nRpBzqbxBsyKBfWyL5UsaFvcPNoNXG91j7JaFAhosufoWBH7i
         B/i+n0BPeE6CxFK2dfWEIBsfyEGREiVLu3Mu3Bd5tnKtih7NtOG7rYFjk5uQB/U/IN7X
         NCOd4R5mKACtxvY/zxbVq4Xfo6m7BUnnoeGb7sXfOXRMHVmDrb8xwl6fLXglZadjhNuJ
         BFzldl9ueAIZ929CB3yA9hQLyVSndKpofrqUYhs1GqoAAItrYmp9do2FYYtIb5uz6xWW
         D0roZBedY9LDX0RNOxQsQTvYKN1+A48s5xBAU1vdGt4vOVJVL19ewk4khjZknhY9VxOQ
         V9YQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9bzHDiwzpx6fKKJLGLAZUgvogke1UhC6g4hyxPaqSH4gKH8OYfuty9c/EW8wL9JeD4TUL5fJCB014uZWr@vger.kernel.org
X-Gm-Message-State: AOJu0YxTn9c8cpiQPZuyjsHqWDobi0wss6M/v3w0Y3HDL9bR8zYWhw5h
	EiNaw52kQRgEPV1wASvAHOKf715bjbhGB/KxXt99J828VO3/Ihhq5wvQ0cBTiAcXW3UsL9geq/k
	gGlPjadcvXB3Mo0rEiPhI2oub3Cy7QUDh81tNQ55Id7QecxJZItO8Su3sAeHnAS7dSV3t
X-Gm-Gg: AeBDievRBzAbW+bBAqVLJua2PZHsHoREaZzMOUkwntB4SI9KEysBXGAZvMHq3pj6nTv
	HDBG52Al0dOJ7gVl3sFHpbvsvVFYyzLubM7ec6aiq9MCQMj3UnSYCEQzQdxz0K6+7DnFITYUG/s
	lwk7ClvpgUg+lnz4eGRrQHC9gxOtsT7BBf/+V0lytlE3lXVkyo8yNzhCCsE+/d4sjgwTA58DAH7
	3yhU7H7UFF8TgnCatYyLRp/wVbql9Ew+KuFjptTxEc8Rsi74iCdwKWWE3GXPL2GYYBsCxZyUjXU
	7oiIIi/EsZ4MQmvhl7t2hESqJC5ajrEzgmzG/amAvvD5pUPMikYpaUl2SA6b3Uam+gnShGwjtaK
	GgEh4GVZYBLbyAg9DioUf956Db45ny3tjwxLcf7VQtoDyCgDrlUyhmsUK1Ho3
X-Received: by 2002:a17:90b:4a10:b0:35e:58d3:329f with SMTP id 98e67ed59e1d1-364920a5a75mr7888722a91.13.1777461367022;
        Wed, 29 Apr 2026 04:16:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4a10:b0:35e:58d3:329f with SMTP id 98e67ed59e1d1-364920a5a75mr7888676a91.13.1777461366535;
        Wed, 29 Apr 2026 04:16:06 -0700 (PDT)
Received: from [10.217.216.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303f52sm3481185a91.16.2026.04.29.04.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:16:06 -0700 (PDT)
Message-ID: <6213ff0f-b904-4d52-890d-69d453c3db18@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:46:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
 <20260429-shikra-gcc-rpmcc-clks-v1-4-c3cd77558b7a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-4-c3cd77558b7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDExNCBTYWx0ZWRfXxMxbNFblNsgL
 FIh6EQc3GVD/JV/ob6wEa7zdpEKJDMtxwTUD7N3qtthgo/FsFz8EP/QwakGPreaHizoglZu8oB/
 xXZqSdV5cT2JmcptrQNznWVv8OnwUIHeZ9Uv9XY33vRLre11YQJLf9bTPD/SOFbgM15AOSi5aGO
 8bMfgjgGXZvuo7a2QZEShFk6BAoYi6H0DZRyPWWIzIrIZwMQ2BLGMbDhrw0hpB49Iz997b/j+KI
 1r25ess8fUhLU6EGa7da10xHFh/SKsAbqktL9MxhHDYwTlZwQJ1HP7QC3YJmJLJo5db9eKMq7uk
 JGDV9yxaDStzinLsrWxxurtwuCoZCCj6jJhccN/t+IVq28nL1g6DzIjaXs4DLlXCXlNXCwAsHLC
 i3nRZbJ1bE4lfFCFeRTmSWJlseh3KLsyNtDQR7vTmfOeLNCyDQnd90W01V+7q7Isn5sg8Z0N4OQ
 kKqnhXJTazZz9nruFBw==
X-Proofpoint-GUID: HnVv-tQjU4OXQ7JyFbKShOVl-_jLIoNZ
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f1e878 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qXpo7wsCot1G_wR8kq4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: HnVv-tQjU4OXQ7JyFbKShOVl-_jLIoNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290114
X-Rspamd-Queue-Id: AB5ED493677
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105190-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/29/2026 4:21 PM, Imran Shaik wrote:
> Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-shikra.c | 4428 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 4438 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index df21ef5ffd6862bec26e3a77ace62ad935ef44fb..a2c7751b091a482f22baa633d658cad0e52139fa 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -155,6 +155,15 @@ config CLK_NORD_GCC
>  	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
>  	  of GCC, SE_GCC, NE_GCC and NW_GCC.


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das


