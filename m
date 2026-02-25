Return-Path: <linux-arm-msm+bounces-94114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA69Jb/rnmk/XwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:31:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A79BD197625
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7EFF3025670
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C2439449E;
	Wed, 25 Feb 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EI7sR4ne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TIAxpzeM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B84E33A9CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022459; cv=none; b=eE0N5sTuyw6e3lUCLGWE0CT2PtL4Bvufh5W2Z8zFwv2hvBgcvzqAOfqZ5FCkzWGjAGp3k/6SrzA1ihNGmELXhgEtHiWraDURQXIp8SEjW5hJiivYNdKe17USVLKez4z9f1T1UDrdPdBzsdr78O6/a/zn2u9KIkM5wrmVAyAVfJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022459; c=relaxed/simple;
	bh=lmOP14Bu15hKCJcfJsFNbgjaGMAN1gKX6Xs1zRpvce4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yh9vXH0G6Mhip0344HRHag2+n/z5dTK81217sqT/tsBc6cm003NywJ17c0EEc1lOR/89Dx72JXh5x/dmLkuIkqsyj6U+lvuBZLkDTKs8PxFaDMLkB78/ac3YSAbLO5TkYwiBI44LVoGB/REjyE6gc4dGyCCrm4uiLA+YX9wwkho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EI7sR4ne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TIAxpzeM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PB3Gb8789086
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djR0gnFvb7yIczPMk8GCLKch2PIYdEZoalq5Lw+87vg=; b=EI7sR4ne5eOf2ZiU
	6D0P2IFvmhlNlxjBUN5Pp8NMmU33e1+tOLMprWPlPClzlBiY8+4Bu2vjqnYdYGFK
	vheYblEHDKcSe3LwhyWESWj1+LKDdj5zdkbTvuyp77rWSJXldmEBW/g6M2CdlwA4
	sO1UXMq++TODBKHLW5eAi2KhOnez16/1abbpwQulJHCbntfzXVFeSE8i1k4acVrz
	Jwj4Kn289tVZl7Wtd2k5OH21kMtXgpHkB9Tqj81N1iRFwHJBZDZw5aBV5ALXn778
	u1HVDSm8lDACb98/yWvubx+kymNvl0+89VRWX8Pi/ZDD0t0rhq0ybGWdn0raE70T
	lIlpXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyv9g6bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:27:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb5a76f13eso413639785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 04:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772022457; x=1772627257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=djR0gnFvb7yIczPMk8GCLKch2PIYdEZoalq5Lw+87vg=;
        b=TIAxpzeMPXLT6mjrTNqzxoTVQF0+ABTEbrrX6zEF/aPBNyaLe4KmFiKXOECOYd9C2t
         qMMA8Jf0Rt5aN93aOhZRd1P0hdwCy8gDtCOQGqzvITUX0lKgp0V6IB4bf5GU6zxgRoA2
         JLf3BJjilGmEMPhAsTg3L/b76hGCHCWmJGA9rRB6wpUGCRwjh+760djWghQv1dCZU3gO
         /kt1dPHLc/Y+M72quSyMZIaFc9jpXQ01EH0i+4M25ymGXeodLgr2hfZZ1g3Sdn+Osv4R
         H9OJtJEgI0CyE+Az0IVF/QgtwlZzW0uaHozpks6ZJdkkzpbpyJ9G0NyShClyfM6VvYVU
         HM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772022457; x=1772627257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djR0gnFvb7yIczPMk8GCLKch2PIYdEZoalq5Lw+87vg=;
        b=wYP0tGO59rMTsuggPiqTrpIbPYHTcmf8Q1P4cmh3vPY+PAzTkolXemNb98p9UXMd0L
         z+Ch+mocDLRaYmxg1rNh0bp2M0mcAzICLUBUVsntatsG4B7RLfq2BeAgiuPC7SZb9BwA
         stKhI4+1UP+o2xVfJT7j4LCfBvT8AcONp80FEOCmDzH2qfVLAniORwnULSray7F9HEf+
         am1Ldt8ob4WBH4T//tZGTBUste0ntJElx3EwgZBVVyr/nwFYY7OR/onyn9vMqcJtcKaK
         oOp4PdK9Wo8+DjshPf65Z0ADUrRdbcrSE6bLVWmNB2OSHpfSxZ0cROelIqjT64soYdSj
         06Mw==
X-Gm-Message-State: AOJu0YxJj7aarNMaOEW2we6C8SgsOqt2R+3L/PK03QLd5V3y3bc0Gv59
	NFmKts6of6J2bMDwXSGXcyIGa+Z6ZEdTDOegyZfMDx/RrFE48iNr2HE2zbM8rjH8ljbBivmvJ2a
	CDRZU7w8X2cHIKHJRma7pS1Glaw3X5xF8RLFnESyVoXD5NsJviJ2lnVeQbbxgUmj5SAQv
X-Gm-Gg: ATEYQzxC2z9TIl6kZlHsgXLTP4DEqQ/a8KRqJ1fq4chRnvSEKBQQgakLNWGpVSZNM9C
	PnTE4ZAqjBHirxyubDBHIBUJRmIu4ybMNDjiNwMfYwXFZifqMXUc+OWUbYkJmFftSJjcdxP1SMk
	nKGQM/nwzMJ7hKGDbmX0709/6CX1FE9zwGao2Cr4O/72Dd9m/ewwXyJctVcs2VeDSY9a4m6GgXw
	Q2eqCqJZOigoiCo+CzTOqty96vl0MwOP9jbXsBoHAgUxH1SSawwa4Wx9NmfC7vgHothW+EcIq7h
	TjPPCCom5nz3LUcdTjCT3hGCwPtMv+/nzZGPr7uKWrAfKoBHcGn4hGrwu3o/QibLf4c+WuDdyFh
	zpI5VCf/5+05mznU2ma67MYD2SRhW6i5m3Of/tyybALh7GNLs3Tri2zsMBPE7wfZeu7zjIUNnRh
	ED7PQ=
X-Received: by 2002:a05:620a:6910:b0:8cb:52c2:6f19 with SMTP id af79cd13be357-8cb8ca764b3mr1502773785a.7.1772022456828;
        Wed, 25 Feb 2026 04:27:36 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:8cb:52c2:6f19 with SMTP id af79cd13be357-8cb8ca764b3mr1502770785a.7.1772022456370;
        Wed, 25 Feb 2026 04:27:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b934c9a645csm15099666b.34.2026.02.25.04.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:27:35 -0800 (PST)
Message-ID: <954f6a53-b597-47dd-926a-adb5a7513edb@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 13:27:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth
 support
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-pm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
References: <20260225091700.286108-1-wei.deng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225091700.286108-1-wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E5aTfDxQtQhjXFISo67anRt7X9qDXwsk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyMSBTYWx0ZWRfX6cj2YDzJtKdI
 aa5bGTImiIrGvNue6UnUXuAo0faLS3zK8a3eup8HC9hwohgo+Oh+mTemPxfJd5cv4hX1jTwciy2
 Z4xo/zmyh3nZq62kEYxF/PG7RaX1HT4RvqXyHIXZ16DAZnvaS0UetiDVZhOywvws4hYK2afHUW/
 NDprq1iTZv5au5EMcoaRpr9V7UTVSkMn4+YPcDDZGoYWMm2JOvNFsSsV3raYDB0cJIwNUHux6Ze
 Km8rV7Otxfo0vm90IS2z7P0zg0EXO6AKePqOm9JpEhASUNoziYcPbbeE2uGk0JOIefroRsuXMjT
 NznI0TeodWOMxJ1WpAHj5v5GUnpLYbkcUvs35sy+hkaNZSG5hMRKYIL1QVGuAFOTK4h5hZeAVZW
 yQ4Q9noNKurgE/CSC9yqROlB3kiRF8JY25SIl8toh6c7ajtexTRZmPc6MQtawSR8rBUK5qBLNO0
 wlIdopPm5jfxxzqInjA==
X-Authority-Analysis: v=2.4 cv=GZwaXAXL c=1 sm=1 tr=0 ts=699eeab9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ICuIv3KJ-OCJFd6aZL4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: E5aTfDxQtQhjXFISo67anRt7X9qDXwsk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94114-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A79BD197625
X-Rspamd-Action: no action

On 2/25/26 10:17 AM, Wei Deng wrote:
> Enable BT on qcs8300-ride by adding a BT device tree node.
> 
> Since the platform uses the QCA6698 Bluetooth chip. While
> the QCA6698 shares the same IP core as the WCN6855, it has
> different RF components and RAM sizes, requiring new firmware
> files. Use the firmware-name property to specify the NVM and
> rampatch firmware to load.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
> This patch depends on:
> - WLAN
> https://lore.kernel.org/all/20260122053624.4068718-1-wei.zhang@oss.qualcomm.com/
> 
> Changes in v3:
> - Rebase patches
> - Remove unintended 'output-low' from bt-en-state pinctrl
> - Use prerequisite-message-id to replace prerequisite-patch-id (Konrad)

Only now did I realize you're the author of both patches!

Next time around, please keep them in the same series, for easier
tracking (since they're very much related)

[...]


> +&uart2 {
> +	status = "okay";
> +	bluetooth: bluetooth {

Ideally there'd be a newline separating the properties from the subnodes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

