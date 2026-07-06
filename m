Return-Path: <linux-arm-msm+bounces-117021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NFnJLb4OTGplfgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:23:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C37715636
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:23:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OA23AkmY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="V/tIcdTw";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117021-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117021-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA8B831B8CFA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 19:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11E43DA5DA;
	Mon,  6 Jul 2026 19:29:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FF93806DD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 19:29:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366183; cv=none; b=ZLl9nm2J0jdxtv6Yjg8vqYlzm+/eSorgrDrI+z4NgMdkDD22pClxAiUFrybMm2RaQ4uSYK3FuWkv5MUxu8U5XuML3+NcJp0yb8wqakbT6SWgMaBP6NyHHlw1p4JbXHzxuV2uzlxPd/ltxXaSTjOpaZaC/lWj5nSZ7Len+C1APT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366183; c=relaxed/simple;
	bh=w3L9gA3qWCSJOJycfuLUhr74UkEspHCqcITKn7/B1Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdPz8Zz1NX/kOHTiPe8U2MjLV5zzT4JPaOGNaJlSj3lqmrVAFl8hPL20I7xxWib7jJpDKmbp7E9G3wvr+CbEdZUp3+/7yI08PsvmyfE9G2mm+Q9I3iHqLMbCzOHlv7cQbvR145XmUPclCGHGaPzv5thKILPtmMg9fOsWPUS6xWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OA23AkmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/tIcdTw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFCjB900947
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 19:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MNHaWIk4PBs4MJ6Wrebqp4A4AMrSu5e1jkD6u1Sr/0=; b=OA23AkmY3caOk9jB
	dNUnlz0tTKUiOmhQT/60BasqZkYmtET8Ptz2FHtHF65SEQNdaHEKbUA7U91OLXLH
	h0IaflwetgJaohLkZydtXvrbHM0m5kLLhYJ/fHuMbIHpSZzDFhW9U17ND/8p3aeI
	tRdo0BCQ2mNQo/OFjrZjokhSiAx+J7MQfQ0cQnYPOzW/VQpDv1dQuCntiiXkOb/B
	lM003tlj7LVU//H9BsGG66yxrbLqwf4J7PaFyLGzCuJDGyB3erUuiQ5g5x/qrngf
	84FeJTr5NnBY7e5yxwajq2xT0gRruMaOHlu74kIz206u/aYC4ozBwquujD79mZEw
	HvPzrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7k6sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 19:29:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ea24a2db9so229261085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783366179; x=1783970979; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MNHaWIk4PBs4MJ6Wrebqp4A4AMrSu5e1jkD6u1Sr/0=;
        b=V/tIcdTw3wO8CdE+BLX7cMbfXDw4oqcnUF0gB8y8xRuFAcF7PYY3tBBXGXL+OTGL98
         m1c2Q6UIzuohG5KLVhaW6kKY1HzbsTuk+7yGXy0iE0VSTR4DTi0cK6TdTlTDwOmibigI
         Pg8QwVawko2DFfxuYJI4+f6ZIGcubkmJfmOoM6nytuXUG5zFlcA0HRb5e1W+gmvLNbN0
         ZusW6cG+9NkXgNHpEQxBLRhhvj09xb3Hc9j471hVooVrPOtTlwp6OPPo44gm6SvwpzfA
         d917Sjg2lBT/TmIp+qbYpDP3rARTARHoN+ang7jSS9htr8oatFO+gKvYuF2eAj4LtFZR
         jkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366179; x=1783970979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MNHaWIk4PBs4MJ6Wrebqp4A4AMrSu5e1jkD6u1Sr/0=;
        b=RznWrSR+Hm+jW3vPeoVKqTYQLfzAbLhRHt8mGWLuwp9FZaL9nu2mRdrrRr+5tmUWV8
         quvUvEcgZV+kiTEigSLCWrCFYzTp01WVBe0cH8Od86zcYyf+X4XhkYojYzwH/AkJfZaf
         iph6BwxNIdV/bNl/N8FXR8R0yhXiDD4vyBQHAQHRBOv6Gs4dohrIPY3poPrOK3TOu3Zl
         Ab39Mw2HzWmq7MkIYLqFYJUGtpER6xCVAPxzXptHRomYz9Eb+0QFkZAug9cc/fSU3w4o
         wfcgz6HnH/125KXVaq9EsnFELXLst3y8jFzJoyTNy0oCI77KEthddR9F/jA4Po+z6nPW
         Kq7w==
X-Forwarded-Encrypted: i=1; AHgh+Ron+K+KzLcNaFAe3jhl+OTBvpq/dz0XVD45DzOw13MBEjDd/J4FcQlNLNV8ztg+bHy6xkTBcpTrTOtdfOAu@vger.kernel.org
X-Gm-Message-State: AOJu0YwYMO+xqw8lacKQfF/ThjENbPaJEJh5jh0qeYBRANw8/RWm08JA
	3XSoDKTft0Wyo56/J6iIV5XzCeeAry+ym5Nbiy0rv2kguluAXDQKnuJ0EAeuSq0JIhg1qycNBog
	IBW7GeBYQ/piZAQrnT2I7R0VrsORyOy9eKX9/LbiUc8Rji9EBLYlACwTR/xmtieghMyDB
X-Gm-Gg: AfdE7ckVYLlBY0nqjxurG13+giAHhkky5vdIvW9MyYe431t616p0aQMJHN2MOP3SevO
	mJDBlxyd46+ve0oekLrZe2vF3CR1KkxHiffabL1TmtS/lUBV4nxmq6Yx1dEL/N7DJfyWGFHsP5H
	bomaNeEzRNrgQXYltZrDsc/7CNpEZoomm5dn/uTHsyS3Z75p86AvrX6RvATa3ZDap3PbfKpg8bn
	wv3VINk64iEboJzDTci7z4hlndUhm66SKqt+s8vn91aoVKbIJfHsSGkajWHLXF5bJv0BEhrRbC/
	+853ZIaKCJf+xxWInWLazre/F3GfZngjHrhGkxPvBhAlvDKGgVUp1uYLOIOel3VNv6XKzNzLILq
	IExXDKVutAgVwUXaXgL+QfzaW0vexYRBC83pRq2r2yXdCuWjaTNNK11zwx1UWnWGfU10Mv/VhYw
	kemkswl00yZES2ghe4f33bXgQ8
X-Received: by 2002:a05:620a:4412:b0:92b:3720:bc59 with SMTP id af79cd13be357-92ebb4f9c01mr259962385a.28.1783366179323;
        Mon, 06 Jul 2026 12:29:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4412:b0:92b:3720:bc59 with SMTP id af79cd13be357-92ebb4f9c01mr259956885a.28.1783366178684;
        Mon, 06 Jul 2026 12:29:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb685sm3095513e87.46.2026.07.06.12.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:29:37 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:29:35 +0300
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
Subject: Re: [PATCH v5 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Message-ID: <qfqoes52fjrd5ivq2tqfnua23lkm4qgyrvalik35qb4u2njmiu@5e5wugwoxkzb>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX+fUF4An5wiPu
 UMRWTeMVq7cyt5Co4IEK7IxbNQNQB4pVliXIs01NnRHnsejgeNvxEo7gxf9wG/YZxlLc0Lgb5sf
 QK/RfCJqBLR0iWkCnPq3p33udrwIudhcPCyyFJ0IHwUIrhrUt4nfalfI+leVR6OpO+/gEpF9VV0
 VjuALT8U40CkV+Bv+eVspZsRMc9443AEjyUSNNce2mG+GnNYUNH1IWBU5tuV6Stl6mQVMGijeZ1
 9jIQORMZ6Mxzn1ao8+3t1CqlTS7hZXqX8cEF+2RaSoNFDJf/EY9rqDGRtY1tMJ3dbN+svUeO8BH
 nxRzuOD9Rc+qmgr6Fvkj9QDotMi03nStI6pN6ODHbWXKzDSz0hoSEGsU89C8xTGkQ899wxCOUll
 D4WeAGfPdPAtMwN8sNih6lpIMYoF56p6nuxO6JCPfF4aao/LZWNnT/5CRYLKJ79Gwo1CkB3ooa9
 exfluJvFOTuACBPTlZw==
X-Proofpoint-ORIG-GUID: mfksfAR71GQsGpnOv1pNC-m7ri0CZlXJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX6k5w6tFZloy5
 ExL3Twts3dI7cw/EDAzV7lkLxQYCawMBgp7J6h9uoLc844TP8yOqNubx5DSDtAxqLac3OinvzmT
 rMEd3u4UVcPV8GQyGtN++GawJSTAnc0=
X-Proofpoint-GUID: mfksfAR71GQsGpnOv1pNC-m7ri0CZlXJ
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4c0223 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=n5oyEeUQHuXu7Mk2C9cA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060197
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
	TAGGED_FROM(0.00)[bounces-117021-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,intel.com:email];
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
X-Rspamd-Queue-Id: 00C37715636

On Mon, Jul 06, 2026 at 08:46:47PM +0200, Daniel Lezcano wrote:
> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
> 
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
> 
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
> ---
>  drivers/platform/arm64/Kconfig                |   1 +
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
>  2 files changed, 132 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

