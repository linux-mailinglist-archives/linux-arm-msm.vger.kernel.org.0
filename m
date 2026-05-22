Return-Path: <linux-arm-msm+bounces-109224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMrdJKMqEGofUgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:06:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5BB5B1ABF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58B933010534
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89AA3C5DBB;
	Fri, 22 May 2026 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fc8XxbvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpmxsIa7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE43AFAE3
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444033; cv=none; b=aS9OIVzBPdaWxJdSMsrlUQk5NzsA8XOpDy2+a4UjS4Lk4SnU4sJTxK+O48oxdlzjpN2wb1kZW/Qw5e0aD28o7AXTGKBD2o6VGjWMI7mnACEt/5PjyIuh6NhcFezQmrhjI6roLPJWWv12+3lhdTxEqHHfZfYTpDV5rUhPoHiM3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444033; c=relaxed/simple;
	bh=7qjC8VTwLSIWUxIcPNC78Avu+AQuxyoIPjdlqavAsrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmI/63ReQ507xrZchfdQ2QPTRxSZ7Wvf7JIwnIYBCdEfXy6mJrzk36/EdYmKkPGelvx8+Pr6fwt9CMxJkysH76oDKKOyUAjvILi3lgaf39lfYEleFsBAMghGE3GNEqtjKlANmiljjX2abpWeUIoEpEaGh3v1zMZ+ObxKPQ6D4KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fc8XxbvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpmxsIa7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M93sfk1816063
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hzRbiXwHFgCyt298yD1cHbBlDAf+a4njhQqMUxBrv30=; b=Fc8XxbvIbrdf/vOk
	rR5aiEDXALEpD3J4pREEEREqmJQyD3HZvDwrdph3eK8mVDff3SnPjpU3syYn6vVR
	NdHQc5sKbHAcVeAO/GAYe+lOPpJ4/6M2FFR1lm+ncn+FjxbkUiOxCXiFbIu5IhsI
	dVvMoPmP6v78AJcutEvgdEoSpwnp9VSUMgpF2UNAGj5T4o4i1xMBUitU6JrOnAaV
	3AwFX/Eped/+ush+9sT63hoXAe0rESFImdcWRanzS4TmESuDvs+DAETwk/w8YHK8
	mSI8T/NTe1DQvYpoSpi5tj8K61B+RfB4dAPna+RIp4UXy4BqPjg2G07Clud4AUq0
	hXtLdQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm1e8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:00:31 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5753c3390b3so546309e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444030; x=1780048830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hzRbiXwHFgCyt298yD1cHbBlDAf+a4njhQqMUxBrv30=;
        b=TpmxsIa77zwhasoJ+vM1s+4CoY3El3PsqVzB8nEMNWnuI7RGsaYgSaMVhWa+pRHTLg
         59qsGt1e6V13hjuA4SWiAlfZ8zu1Yxh1SAC1M41KeaRbrsvvvZiFKIAsKHUCa89rDIbZ
         luhtsGgS5ZG6w5bgo+D0DoOWj99BrAGFVO9HGUz9hKZ30V5UDa2k3SDhuuzpz1iRlPYL
         SO1k4QBGm37NGg6epuOOm5s//I2xN74Bo9HRQup+JI+obWs65DekeeyxXcgGEtm8mTXx
         n4De/G1jnxHVG3baSvmLF6n0PwhvBntmqoQ1ta9sTzGCmclUxZ5ySOoqty9IU3Mm1bhS
         9w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444030; x=1780048830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzRbiXwHFgCyt298yD1cHbBlDAf+a4njhQqMUxBrv30=;
        b=ckPxfOBsyKvIskNmV4nyY7kgrzJb85YiuKANzoRf6SN8kiJ7atn+hq4JD2RU8jYMXF
         9U687Z+lFr874RnOrwrzswkVSyWPkCYEfTVfRxaHR3sNjIX5OZHrvShx6txsqLwWKGZG
         4vHZ9TBzCPiKq2i5Pia0jg5BYiRqHc622BiXzZ87hD72M6pFsn/TvPaceIEhwxUgPlS0
         wOG8d1mUc5Txi/DKIUjBOlqaBUZNO6ULUqfBfq0W4YBNhMRjCf1tmErhg+tqTwsjTc07
         uqLjMDEv7NoMa2amm0eCVuhitdMUT+fGtMaPMV8BFhUURS/Vnbdzb/nDyCBGftyg3S7A
         /oRQ==
X-Gm-Message-State: AOJu0YzAOTb+N1E7/gS/xkNZgJD25rfCX42r3SVxAc6MJddLjxkcBwPj
	0lXOaQW/CzRRJ3DG0Pc4RwA2JGsOIPWRhbwBUFQK6zjX7sruBSI4J7Y1wYrXMreqqeW5gvWvBI3
	7bWiVkX7EAuXBXvFW3D/nRiZNkikpAsOUxRV8mnsHMIwqyp8hb6bVeAxMDrWIr4Lo13zz
X-Gm-Gg: Acq92OHpnujVNUpl8mVJ2z6B+lZ2UN+eAtsdqzvEoExXpTPosV+xEGZ5klOgt8lbTDK
	5V0+MAqxOoIpBe6Ua9/mMups8Q22hPU4egDkQoi8Kl+jW2UcReKZq6Vsc5VD7eQlIY85fh814SF
	UROls5RJOeYjZgB7f/kLUNMD+kjbYd6MbQpNL4OrVHkSO1kQ/zRfBgVXFr7owmU0CpAIGwg/HB1
	Z1xnIEvn2ySa3ba1JPP+l87EkE0o+mkIBH0zeVHZIE2g697+8FmI9GURbzHzb2nQSMXkhU8//qK
	pl1fLvZCjoVb2fogyzyPrlc8HfIj6CRgiqdExdRjGJ1jWnswdaWIuM63WZXpof7WeX5WNVzdcCi
	C1gRCgrSE5j/Qnl+9kXNvBh9T620Ty0s2EU+rToaVvONApQ==
X-Received: by 2002:a05:6122:e22c:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-58662da92cfmr607610e0c.2.1779444030423;
        Fri, 22 May 2026 03:00:30 -0700 (PDT)
X-Received: by 2002:a05:6122:e22c:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-58662da92cfmr607603e0c.2.1779444030032;
        Fri, 22 May 2026 03:00:30 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cea749sm304920e87.50.2026.05.22.03.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:00:29 -0700 (PDT)
Message-ID: <77d63b5b-88a4-486c-9b0f-49be9d5c13d3@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:00:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: glymur-crd: Add reset GPIO to touchscreen
 node
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
References: <20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fpSi7Qch-YR_tP_TgB8SMfsJWuFFeOCW
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a10293f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zwSULZKvJjN6iqXqTy4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX7rUbdPL/RFat
 7e0Fv9k/PTLvZDFGf4MWUg0FEZr7g7jrHoLZ0cMAiAgJ5LV4KIBi6HhdNASQtoTuV9H7mpmpKwd
 Jia0FsKIFAw9fhTBf7jskSlzXPQNcE0W9x36UYJJ7byzVCjazLQGwJX79oUnf9A1m+ywPh/XyEO
 o9SE2lgkj4Am1SvkLOH04Pk4gp0K85iNqqS5SVeUr+Xes3KOGNGLYEj/+okJwTUAY7zkTiFtD67
 zR1d2olfDbi64Ru3BLXHPDo36dOaKLH7QP++SoTlh+lbpNqiWw+F2/jjQLnCLFVr4LYsV4xgylr
 VAzHvSNajLj3cAHjml88EA77e3IA6QzR+Oc1y4C8IWdXuDm9bn4EQZIJwreyde/x0pAD4eAUPjh
 C+p0BEVL7EJezgZaqfLT9rDtfBeBab0RPzH3yYSv6imD3RtcuOYA7Olb/RgxgH8JyiHRYUDGbVB
 nckf0o18d5W+PgV0TOQ==
X-Proofpoint-GUID: fpSi7Qch-YR_tP_TgB8SMfsJWuFFeOCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109224-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA5BB5B1ABF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 11:56 AM, Pradyot Kumar Nayak wrote:
> The touchscreen module on Glymur/Mahua CRDs is different from the one
> used on Hamoa CRDs and requires the reset-gpios to be wired to the device.
> Without this in place the reset line will remain permanently asserted
> during resume leaving the device offline and causing all I2C transactions
> to fail with -ENXIO.
> 
> Error Logs:
> i2c_hid_of 3-0038: failed to change power setting.
> i2c_hid_of 3-0038: PM: dpm_run_callback(): i2c_hid_core_pm_resume [i2c_hid] returns -6
> i2c_hid_of 3-0038: PM: failed to resume async: error -6
> 
> Add the reset GPIO so the driver can deassert the line on resume,
> restoring I2C communication with the device.
> 
> Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

