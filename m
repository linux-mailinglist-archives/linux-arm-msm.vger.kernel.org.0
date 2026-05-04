Return-Path: <linux-arm-msm+bounces-105695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGsoM/N1+GlavgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:33:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D00CF4BBC81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8D11300381C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D173A542D;
	Mon,  4 May 2026 10:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjvPMUMC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z1lubhyu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780C739C637
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890798; cv=none; b=AQh62GBeUS8j0RVDq1VkeW0BBq0guquM39QDCiFvjMxg/HsjIJCMVjuGHLrH1wZ+vVsshMinci+b46a2rOT3MGKnGJntx4IjGCQRCpLHrdxk+1lITVNGxxlmuQR+KqhWasWw1YTq04lTFeUHpydh3v3XxLdExDQcUkcHPF6UQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890798; c=relaxed/simple;
	bh=OPS8fGs/gcCPj6H0lF4H8yUDYT6+HtQiKJwzPf7OCcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/2NEKXlwuvLdRzaYgrf2GI67Wa1FVoHTfkg9A/hXdpo/bI3Bji+//kKIfzrk8Qs/ksVhCbtEqRHKRBJ07VGRITAPEh2Mzz29o7cU+uD94RNROdezur0ckTu6/WRkodQeZJxRXbmVEsh2iSdCH5zGuaUvsQUZUICyIANGdp2udc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GjvPMUMC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1lubhyu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644A5HB71024608
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 10:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dznsSN09bMt9ePGNE5oYToh30o13eEnnKbr6K04ZsA8=; b=GjvPMUMCF6qiIpUI
	1Qx0A7hEfLT1PCHO9dJ+uFjowpmnsXIONjk0SvPIVWnfHUkJHgbVPUofggmZ9/em
	ZBkHvuMmqK/8x9ankeDiE7EIjKsp1fEdrwvy+Oxmv+Zr0emBGOAh8sFpBNquEMGf
	g79ojJ6q4WI2ljuuvOLf7uB++zBbiAW2FWjbTR23q8fp7JxpQBSWvQXwzbFZJAvU
	xG8vt3N0MCMXRg4sE/ph37v/LDASmJ9Qr04cZ8Kr6EMo7AgrqzlE5EC7lN2G6le9
	xODtfgQUZoiG4Hguxfnx4JdhlbLuBwHJjPT18tof+hsi5SY35b97k/bgoGdKIPcV
	fHc5MA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscy82h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:33:16 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95ccc6c5b49so205617241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777890796; x=1778495596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dznsSN09bMt9ePGNE5oYToh30o13eEnnKbr6K04ZsA8=;
        b=Z1lubhyuz/bRBeDxXm1JS1q1sLWX46U1nmLvzDauK4eZotFP6XKaFCc5c3z01QKSOK
         GTJtYW/EU2qJ9ns78JvES7wEfr6ZcoTDfREZyg+YmxMdgc1HJYZ2BkZSMLOl59ARuhe3
         H+t1qQS8KdEM6lZkwTrcaEZYsKK6Xi/svG17qdCxzZS0Nj3EUkJ0hbnRxunMQxYghCkw
         7nJQu7JowKRf5YZYgDJ4oOUIz2cklHNewqh1/y5/RUndQzkqAUNlHZprrPEYL3F3le02
         V+0Q/VnUKiN50EIU1FrCbQLTuu+VrLLGOrmXzR60W+R0ng4f69yndTbKdOkxbL57xNyW
         GwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777890796; x=1778495596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dznsSN09bMt9ePGNE5oYToh30o13eEnnKbr6K04ZsA8=;
        b=KutgW1W7jnL3ZJdkHvJb2+wLv+F+Pp6TPtL3lQ4FUqK4wDQNm33qoKk1zlHf6Hv4Hl
         GoJjdpJPGBBpVVUGR95ZEm2uwG91VE7L+QqxHakIk6q4q6J69PMv/wXvpkGUayxXYqpG
         5EIetwhmmPParK/5q/nEadJRPQ1UhJ0gSCgFgXWEEDu03+sV/Zei7ROkWGIa3sIk5817
         +CR49LKaMNeaHIkMGFtkvSkQZp4KRfs3btEyko8s//UeLSnUFWN8ScfvZqmI3oiJS4V1
         ltl8yqRMKJvq/djr5VWpR96v3qBgofOCk/32/+/rxfrj8jyc/7Bh2Tdv0Z3KVP3yzJ9a
         Fcpg==
X-Gm-Message-State: AOJu0YycMJ2tIVWGcWu/sB70116AsQJ7cW9d9ml7+dMSXXTI1ik93iDm
	bE2TV6vTPgSZo2Bnx1oCKzuHh7P2Ptb1PzraIh8rT09g8DwSNtproXULFGAmm+iwzZZjKwv4THR
	VeDzfjx4fTGhCTQyUOg/yT6rf4/0ulr432wGn9CI7Oh4II767PT+qWAoWnMRdpnGG/cFr
X-Gm-Gg: AeBDietsEMSRbz/aOn7hVuv1VooCPpoBLiH+23dzpbttRTCpmKw99D4iBmjDIyQ6pmF
	Cf+QpMAX0hKasMpIf84m+oyT2M08Zs21/x4Qvw42fcwlchpUGjnvuFgB6etP9I0LzWqqt8Dn+KY
	wqpWx15e0pRoEfPSIh7AHzI5XVTvcdLsQmlU8xpSX/JS9figa2lILRQosbq4rfzlO6j1ufABWzJ
	TqJlmTrcalEDmisIvXhOguzquloMXPD8vv1ovmJ97k2OJ/n3urTlBBJ5XgQXAF5AQGerPC+ez8A
	p3MxUkNfsd36bV+85raLtpNSr4zds/lIoV+TXaORELAEv60YGDY8hdDZdfszeVdeJaPk7raEPe7
	9UndBryrOe0XCdyVhGfgAqkBfLEY1/SdYYut99wvEgENKq7e6H4SSYTufQvks72o4kJANEL/i2a
	HBZ48XFKQjYBciwQ==
X-Received: by 2002:a05:6122:4204:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-5750c69e1damr1538590e0c.2.1777890795612;
        Mon, 04 May 2026 03:33:15 -0700 (PDT)
X-Received: by 2002:a05:6122:4204:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-5750c69e1damr1538580e0c.2.1777890795226;
        Mon, 04 May 2026 03:33:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc2c1ca0133sm54205066b.29.2026.05.04.03.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 03:33:14 -0700 (PDT)
Message-ID: <a06d339b-ac5f-47a8-8f3a-ad88e484593c@oss.qualcomm.com>
Date: Mon, 4 May 2026 12:33:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add Shikra interconnect
 provider driver
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260504-shikra_icc-v2-0-81076171e010@oss.qualcomm.com>
 <20260504-shikra_icc-v2-2-81076171e010@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260504-shikra_icc-v2-2-81076171e010@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExMiBTYWx0ZWRfX44L3L4H+BdtC
 nPh5MSJApoHPp8E1rs5ID2hh6aqXGLR0LX0xQshRgpHjBoNvGernFG3+DJ3HEnjcdMOreFIyckd
 uq72mm378f017VtOk/GopKgN70TcML1ZhhI9KL+MimEicHzHbTx8bs2yhHkl9qNlOlv2uA46ieJ
 W2kTrCeWOetGBW1MhnNpYQ15XOBQmoKwqWLEXtfUrYuwwa3tGS3LxF6ccvYzDLBYzdtA+8pTOi+
 /sjaYHDZbrcCHYpPBKyBOKm3l0h6Zu0E4kNRDqiVhNOLglLymyM37TaP9vukgYyNqW6bGyVa4h4
 t5TQcVy/9tRD0UUdRE5JbUjsWEDp90W2QMraOK/F/GEv3Xm/VYsHtAc/PBU0UojMPQtgbeCqxfB
 fRlp/uWAs5b+NtUc0GYiV4BsybmRprCLyOOrZBaKQJZw0aPqQYnZiQhVV6xw8CdCWTpE/0D6e28
 gjxCckh/0mbvu5u3wXQ==
X-Proofpoint-ORIG-GUID: NVEllIUvpjnzM6IrIykDjqsU4rJWeZfl
X-Proofpoint-GUID: NVEllIUvpjnzM6IrIykDjqsU4rJWeZfl
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f875ec cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j7VvbvnbhCrZ_lwJNYUA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040112
X-Rspamd-Queue-Id: D00CF4BBC81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105695-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/4/26 11:41 AM, Raviteja Laggyshetty wrote:
> Add driver for the Qualcomm interconnect buses found in Shikra
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

