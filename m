Return-Path: <linux-arm-msm+bounces-117020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8dktE2UOTGo+fgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:21:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 986AE715624
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:21:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="CDm8+83/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="W/YDRlHs";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117020-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117020-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF809318AA2C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 19:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C083D952A;
	Mon,  6 Jul 2026 19:27:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B13C3D812D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 19:27:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366074; cv=none; b=L9BMIxekbFYMUPhgZpYQt8NGw86GScIgywG2CMzursWoGTXGBxfTPpH6KiD7CMmVohbcE+BFswEM35YwoT58WuZXYO93IufTTJZ9EaxM4hCbfY0gfvrOvqGpIUOlk/KIr8z+LSrrv3SeW5wiwxUsAhncs+InYgIpYs80B6FDKv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366074; c=relaxed/simple;
	bh=KwFroddWHFnfpsjjmJcfTGs4Cx+LN3mYnxqBFPiVtrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/vHTdF2Hy57U8I/oH20Is19nYsLnq4Mj6lWwAZnJJPKH9QzNDDdgRrRhhtePuV8YTIOthvsf6mnpmHD9bBknBbOBfzr93IIX8RZnqjlntqvAUldYmSk2kCOze5YAStSo8d6hZsct4uGD5+icGLyCTgCnaWgW0KIHWUnx1wSuWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDm8+83/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/YDRlHs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF0oO825590
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 19:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RrsznZZTAsFf9rgod+XonTC0
	tHI1lPnoz4qCTniAIfI=; b=CDm8+83/EBqBtCafuPl/E6BEeEPNBQLMnsA/r6xI
	78dVO3E7UqXuvyxlS9d9nP3NTmwb7XUxU5+f4CAWqan5wMp53XwU3501AyuwhKyq
	S9H3Jg+t8jRRK4J4FRwVypsBUbBMuNxKezwLzPuNt0nqZxt7A+SEe4sw9ca6mj7z
	wIxVAagYUUJqsnIryN0jd/gH0dG5ZgdcKTVI+3jUJrYT02tzobEMwr3wjo/kBgAV
	ACCH1jIfiTLjLMvi/U2a0te2Vd7qlABTlTbZPiITWYDQdYcbnsVL74r8rjWJEleA
	nqTrrmPh+vRwYNl56N1qD6f7cDjSZZGGFQ4d7+5ZMJk5Lw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8aw7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 19:27:51 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bdad49fe15so3368622e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783366070; x=1783970870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrsznZZTAsFf9rgod+XonTC0tHI1lPnoz4qCTniAIfI=;
        b=W/YDRlHsD9v7uPY4oCMs9qpaPUQeVyUY1AsGR5XDRUjNfABcbYknH7/5Gbsw0/fBvY
         u9WH1WVqa0koh+wlEFR4d4Isfx8twBTLgXYvUJ+r01X4ygUXaR76dqYeruxL/vPALmpj
         77JUFQjNZvRBA84KTyrRkHJ/zgqWp37yC2k4JiDSSobdTPxjuV104F1zcCKn+aZXgWV0
         +Pqy4qOIpeiqq9j0XA91hCg57lzrZhMhI1wXxOhjxOwk/bt0afastcab6su6VHHYj777
         zrcM+UzmHoz7O9fXhlWcvNmLsnEpyjYka6KX/Fq47sRgCsN4kYyyRAhHni9rudJlc46v
         Blbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366070; x=1783970870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrsznZZTAsFf9rgod+XonTC0tHI1lPnoz4qCTniAIfI=;
        b=YzyuUWz/bjbb6qCSQkm+zIXV52mNFhfcnquW1k8nQO4zLy6MUzNEVLnqBNenBj1ss6
         KYxNZLw4c7IE0PG42FwSpmkux6MfQR1Es66yktYZMFguqBD3nJEHqLLrx+2uSpQTgO0F
         W27Nch79EnOblNUPCbD2uP/L7K77AL2sRoCocJZAzzYrTncNMAm7D87xjH4qKq6hoHg/
         94X+VjTzj2GZNnrr2C7Vp87ViVKSuihUOn/6UNyI3D8GfKkQ19R7f/Xf2+wZ4gIzfTJp
         MzRbp872Sx3Fro5z/J+FzEgyyVgRIDNF2fsIIk+kF3NBvVpsOYwTysIk7H6/EnM5LC4w
         zPfg==
X-Forwarded-Encrypted: i=1; AHgh+RpJB9QSI+nVOX5dvxdgAFntnEbBycR+DZuEtVuQTIdF7opPmsAbR5AqGJqbqbEUL4XC2q+7v5Ois0DN73xR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ip2G7W8G03m4r8q7wn4PvpjeycarwmlcSHezm7C7yYEBiJlh
	wiH/o9M/gg2xIhxqXUcGGBcdvbxnrnqU7+CcfRzHM9CCQL1ZKm9GNKRLV5gas5SPtj4G7TxF5tM
	QMa8KLMrHb54A8fCm1aaOzl+UHXV99yhk0MYR639hyY39JUWMrYDx1nyB0Zyr+oRzgIJm
X-Gm-Gg: AfdE7ckKp2xkV9tF3JT3OJ7ovv7iwIuBcFc3tgyIgFq8+7PXdxwvXO8dwt1t2ectZ3c
	PEaOfeLuqeGHlzUZgx/P8qydPNJM9e0E65sn2odpeHmNFUSQcTqkBxlTJsMpUbXoB4Wego/4s9I
	VzPkV/garyHV8Ao8M/Nta8KwfcvJBp1PJsXStqw0BRNY3rzuMtZx/yHbVeOPQ3xPcmGGmIEyokg
	KKVFaTGlPNC6FGYa6/5324oeIVq/gK2G98YPR8vSgpUDLPq/9vFySj6Eoq5nE8nS5qEXWXGAjNY
	66z0DThkZSz+34i6xbGKsTxYyscRYuwhRhHaXIlyzK26exEZFlZfrReGYPY6jNRCWK4nogtTcou
	9SwLXeqD7br7pFrPITeh1obtb8QMq0pkLi8bfaEveIZFcSC6OL/TxIv/DweptW92m6an4KlRVbE
	sglVzcV7ww4SLSZ8lUOrHUO9bc
X-Received: by 2002:a05:6122:1d04:b0:5bd:73b5:6d2b with SMTP id 71dfb90a1353d-5be9078494cmr1239885e0c.8.1783366070406;
        Mon, 06 Jul 2026 12:27:50 -0700 (PDT)
X-Received: by 2002:a05:6122:1d04:b0:5bd:73b5:6d2b with SMTP id 71dfb90a1353d-5be9078494cmr1239866e0c.8.1783366069969;
        Mon, 06 Jul 2026 12:27:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfdfdsm3144066e87.59.2026.07.06.12.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:27:47 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:27:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal
 zones for keyboard skin and charging sensors
Message-ID: <x6gbkwgyr4z7ueuu5twvnz66ie2nusql7fmp22moet7l3ltlit@6lpm2vbnrqhd>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-4-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706184648.35613-4-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX7zA7jnXLT46p
 WLWzLoUX6OIOPMIvsDBFzEpVDRCqLIGSC0pO4PfPeFdjGOnyPi0GpuQIp4WdhKKvvyhr9xMxlyq
 jR5zyg+N23dSeoX/mX38wp76nE9IGaE=
X-Proofpoint-GUID: 3pDv0PAQk_o-sMEXFI9raFmycZNqmb3a
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4c01b7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=AzhOnzq_2AA1uY-T__EA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3pDv0PAQk_o-sMEXFI9raFmycZNqmb3a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX7s2VsFTmhy+B
 zZV9RLNYaNt7EVIaUrHcNUTchMt+fL3YnMdwU7oULJq8o7jo0qQxuZtrD/orWAPgnK9a+BkHmRh
 r96op/YedwWB1BPNTfd33qGm8yTAF3hrEj32VHxQK/5GlpcQrVIPzD8iQSoA4em897kEMzmPP8Q
 HeYn2Khip4g/i5OrczVoRTbibiPLmTUJiTiPYubl8Tj21arjB2SE5vvLAk+qLjFQHxrpz/yDy6c
 Pf3TIiCEf3Xoo7o6I8zSVbNrjNXaZcO26zBm9FSbaDSb19pIosGVqDivVKmbw11Qu7xdzVmNYHx
 GWb9Fc7wu7QVN33xfzM0bhS9wI6I4jGvLELO/qbBJf1t0n8bcTWCJEPugrda1X6H2txFRRhtVou
 6KlYKFc/unlWEiTu+4W040T3l/x3v/MeH1nqIn/3s1OcZbMPRvwQu4fzAprpttYjCu70g5XCbCh
 WsvsgxjSSOylZpQoU2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060197
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117020-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,6lpm2vbnrqhd:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 986AE715624

On Mon, Jul 06, 2026 at 08:46:48PM +0200, Daniel Lezcano wrote:
> The Lenovo ThinkPad T14s embedded controller exposes several platform
> temperature sensors that are already used by the firmware for thermal
> management.
> 
> Expose the EC as a thermal sensor provider and describe the keyboard
> skin and charging circuitry sensors as thermal zones in the device
> tree.
> 
> The keyboard thermal zone defines passive and hot trip points, while
> the charging thermal zone also associates a cooling map with the CPU
> clusters, allowing the generic thermal framework to apply CPU
> throttling when the charging circuitry temperature exceeds the passive
> threshold.
> 
> This integrates the EC temperature sensors with the Linux thermal
> framework and enables platform thermal management using standard
> thermal zone definitions.
> 
> The EC protocol currently does not provide a mechanism to program trip
> points from Linux. Consequently, the thermal zones rely on periodic
> polling to detect threshold crossings.
> 
> Using the charging circuitry temperature for thermal mitigation provides
> a conservative approximation of the platform thermal state and prevents
> the platform from reaching critical temperatures under sustained heavy
> CPU load.
> 
> Without this change the platform reaches a critical thermal condition
> and resets under heavy load.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 67 ++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
-- 
With best wishes
Dmitry

