Return-Path: <linux-arm-msm+bounces-113628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eFWqAk6VMmrJ2QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:38:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E28B699C97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:38:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IkB4l1Ud;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ZmHlera/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113628-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113628-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2095303F71A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760473F44D7;
	Wed, 17 Jun 2026 12:37:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287583BFAD7
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:37:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699825; cv=none; b=KBMi0me4P14Ailbrg4pvyT+H7f7Trv4bzrnfrBF56ktDZF8SBJNNWlVAVKh9KmIxW6FI/OxJXyPFtECT33bdjpNUk32b6jOvWwDqzg9QiyTNO/aVJN9OeELfr5eSHec+4yHE89tQam67GM7eK1iHOHfe2P2/sus/oGjCiEexDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699825; c=relaxed/simple;
	bh=v82ZYuwMb2xVyLg5/0OZvOZP5AwSn0n8+YZ1fAkQCy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enRdcospJ6Jkac/Sr4I6WgSwcnKPbQru2AZRjtDm3x7Gi5lJzWfqOvl1TPUCu0JXLxU1uFBe9iY7Zf3DKzd2BHWhzly53GIqaSZ4+rqmKdx8XN+WU4qg9FUHvIbvz+3t/PJFj8nfLriH3L0vF1Q4Rt9oHXXwmqiKiXScCR7igGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkB4l1Ud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmHlera/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8VxA72056609
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mi+7F6MOp31T+TaUgs/GJmAsdi52R6SY4Bwom4Oq8sY=; b=IkB4l1UdITnYKWaC
	wL45X9ePJuiiK5gOyRHxSwiI+n4rPPt0FTr2+odBJjodQ6iGXkDBzrWlecwLIfud
	XSCwrQnEbir1I52dqBiOb6pRZEpGlRoivLT3KFSyV8/R1HkKe5OZyxdOKMD8tZmy
	K3frueGKPYQ97r8q5anE2eMV4RmNAVCa28mKTo3Cljo6jUsnkjsd/eh5GUIScTBL
	gji/iq6STVXRqj/LTODJUkpSw2UBHyST7xObm3FNN14BTCkBCuox+lKavGzgHEIl
	nywgczybJ464SJYenBiwSIz+tX+P/8pR40kDrr2aARBoyVRuav3vZ91caBfKAilw
	xsq83w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesb4rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:37:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914b9d0162aso65014685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 05:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781699822; x=1782304622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mi+7F6MOp31T+TaUgs/GJmAsdi52R6SY4Bwom4Oq8sY=;
        b=ZmHlera/RQySWCJfthUgq1crDkrNCR3DdYaZX2DiNWUInCqN0esv3SStIxXa2Mek9d
         taccGkP18cdJCClUYLklzZSzWBVUAVrif34VXJcIm+7xF1VnN1fGCnPkmIa4zOhIrTiU
         z4Z5dBqgo+/iwFbvm+m3Seb2lOQ6305QzFZ+4fSrJS0yXC9XG2DJx9h4tIZwB+oo5jMk
         3q+tmunFHqdD2qfHw1lt+w3WB41vTXe3B2KfNhI45ULagmy8XMPMD7ygh5LlxcEOJbH0
         S/fyVwI2c73XU3BYbg239sq+YcuoDTsBvcKF3gnMwXCzx00IM6HrUQvz6YDUWo7N3OJL
         yTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699822; x=1782304622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mi+7F6MOp31T+TaUgs/GJmAsdi52R6SY4Bwom4Oq8sY=;
        b=U/zKhyJcdm+1IfRuQOXtVYaGOeggzGkyZst5/Qf5rJ7EvjK3YeHLI0XzJPCI5XfXgp
         REeELZStcZTGY9gCiF/Q8zEka2n8YgvfqXdoxfSr3LFFpp4IGBpHm+J6brePERebc1l/
         Q9PeJ2PfeLkCF1ggiLn56oMjnxr/jerzdTnf9zauucYd4X5L9pxSOyUfZoJIWBeUFVZn
         ctkxo00NnnKpzlkH2LZLVGOHMAg/fU3Avg+yDE1E4iSGOU9lZnHhoxMpQJy/A1iCp7vP
         pP125rcTQF9UYL/CUke+jbEieABuNo3KzPf5ikGAKB8Zi2J1hcmP8v2+gjJolHaFKaZt
         Ofeg==
X-Gm-Message-State: AOJu0YyzKBA3PrBk2iKW+CZo2Yp8yJ8izbeCID6Qm0eVvKxKzC0ZXeQa
	WUMPvG65xJ9se2IbcT9tZ2tQ9hjv8Z54Cvdmy8N2oIsncFMUx2+Pl/z1crKguy/paAbbxIFvwHR
	cpZO8dbdyDBmgZs/3O6CHz231B8YWpvD721s9aAZqUdeL5xScP+NVIPWM+eM3RDaqLSGc
X-Gm-Gg: Acq92OFhj03eM0xbMOzghoi9CjGRDhfDFNq+gRNCjeLRZZifURUp6lgS7q0znuyCOf4
	BBhcudg14lPtT2wUa2ynDgDje+Xh8QCM48duw/gVuZgREILsDLS7ajE3bL5iCRijZ6bTxrefsf/
	pIoTpV9I73gtLtL869g9NVL26dRWK4yTI8VAyEBpw6LDafg7WyqOItbUkQ2zeSs0QGlSfLxeAEV
	QzK7waQMtbevEh3eKjrQcPPmjP4a3Zu/27otI+P1gmaAuubV1EFrqETMW0pIb5CgPPTaTZZkGRZ
	1Urk2Zs5QzRh0FI9+HdVRkItJyTmW36+H2fIMSIQrJBkShdylaYs2H6EI6F2Atj+8w3a2e1dPf5
	BjZ4dFaps4Fh/o9aa2hK4o8zRRmZtHOS1P2w=
X-Received: by 2002:a05:620a:1a17:b0:91c:9d38:30ac with SMTP id af79cd13be357-91d8cba7875mr374529185a.4.1781699822122;
        Wed, 17 Jun 2026 05:37:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:91c:9d38:30ac with SMTP id af79cd13be357-91d8cba7875mr374525485a.4.1781699821571;
        Wed, 17 Jun 2026 05:37:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44208c9sm808828966b.13.2026.06.17.05.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:37:00 -0700 (PDT)
Message-ID: <d3b7b468-7314-4ad8-85fb-2f9e3e1a923e@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:36:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display
 nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        KancyJoe <kancy2333@outlook.com>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyMCBTYWx0ZWRfXwaCjuJqybL/O
 onRc15UTo+Neo8Q64Fv5iyMyWZhK7C7VYKTTE+HeMGYh30lZIWS11sV1XLwNAVtfPEoTKPiH3iC
 B++4YCYaM3sgVmRc8qJeDAsdgKtfbyE=
X-Proofpoint-ORIG-GUID: ZF_scLFLA5saDJFtDk70vcZ8f-PHq7Yn
X-Authority-Analysis: v=2.4 cv=R6oz39RX c=1 sm=1 tr=0 ts=6a3294ef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8gp52aLBMaF4WGxJS50A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZF_scLFLA5saDJFtDk70vcZ8f-PHq7Yn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyMCBTYWx0ZWRfX7ksL+ekvQkGV
 tQIbAWRlund5duDhYA9MRTMw4f0epr3t+8lPRULYBvhZvzbxlcKE2elo7M1JjQgexamphqGLp4j
 x9bK7eOYoXsl/Svm7q1/C84mvhSvdeB6ALRe14WMeRriu9BTIfzeBpgnwozOI82F9+EUvbxeOoc
 e/0h6abK2NrI1wMX0uvGUEH5ryzft0j+cZ0VMjQAhcAnIYvELqrUKODzGEhWdekv3hs8mzHjPQw
 ZAyqFBm8rcF8x/l5YxxiEO+1ZqaonKNaAz+74d0LOIfw+2mMCGlz1Suc66u8R8VqERVcDNEZKiN
 4TmUbnB1n2zOWOCeKgybXEKNgY5vRsS7HNUum0p6srHh3aGTLiYBFNGGCp67TYtQ0vl6MvJhJnS
 KmBtZZDsuBGQWSTGgqs/ZfmKjE/F/yMyuXUsdgP9P4Q3DoYr7g2+XM0zyg72Rkm/SfCzCoudMSE
 WaEg098vH3AheYoqiVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113628-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,glider.be,gmail.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,outlook.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,linaro.org:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E28B699C97

On 5/22/26 3:15 PM, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +	/* Backlight */
> +	sy7758_backlight: sy7758@2e {

If it's the only one, 'backlight:' is good for the label. The node name
must definitely be backlight@, as those are supposed to be generic

> +		compatible = "silergy,sy7758";
> +		reg = <0x2e>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sy7758_default>;

Please use this order, everywhere:

property-n
property-names

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

