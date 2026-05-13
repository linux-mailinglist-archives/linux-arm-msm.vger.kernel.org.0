Return-Path: <linux-arm-msm+bounces-107390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGaWHpKoBGogMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:36:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4A537330
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E218931C5578
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617F048BD33;
	Wed, 13 May 2026 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5PQweja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTfk1H5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2204738F621
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687771; cv=none; b=pyldNUKdkL49TeTomFfDwBZUs3E611qGCviWVesxzam/FfaIVc+qShUPJNZ3gZJRiVE1r4u6GRNBh2SgGz2x3UTdEvCKkFdtG7PQwRjz6btDpl9E65j3chcYz+vqZAsNkWzBMQLnCrgHw1f5EzbJhl/gy3MT0PlAIOI1YPPlMuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687771; c=relaxed/simple;
	bh=9mPNCinHnbhstt0b+g8l4cy2ftNyDXQeq2rRfKU7a6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uydc7m5MzPtln/HH3y7YEu4nL8/dx0EslOha0DwZMneRg0WH8ZE8TcTlYIF6FyT/ejncCyBE8aSQ4UuV6Ptw+QnZcdb/Oebcro+t14+InDp9N4XsyduenGKcspD0IXgIq4OVqxfB3r4Wi+NJmfg8QMJEaAnf4rmHdPfCauFE+uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5PQweja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTfk1H5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEktDj2887813
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FV62wPVqhcL8BTl6zWBGVeKP
	No6dhCw0zP2Wz9XZfdg=; b=n5PQwejakgy1Saq6D2G03GmD6kBJncnv8hU27ZiB
	Uto/DUdOe3r/ZM6zSO3Eo81hzGMzxZNu7eYrUsjLon2XAQt1D2EWQyr1wMgyLr95
	flB4aeyO5XZ54jLVAlqceRmj/BPzMcISmh7epxztJjuZ9XNP0X+OznK7MZJZocnE
	Pb2teSiY+ISgraRD4+ooddaQdytqdA0sbUi2aS/Zrt1TA2PGwdpQN0nm6kHQM18n
	DJJylK5gT7yPDfog79SgA7uUK7JJEfA7ZoY0+/YWMkPAKNjBa/bzb0Y4jnGl6mBn
	bA9p9Xl5tTsMGpCL4G4jSai102pKgP8ypLlqDtkqUZwUig==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ghpnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:56:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-634ce585b41so1981431137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778687768; x=1779292568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FV62wPVqhcL8BTl6zWBGVeKPNo6dhCw0zP2Wz9XZfdg=;
        b=ZTfk1H5xlrP4lXexznhE41a0YlW0VqOwrqVJpGJvTZoHxHcdAm9EPh9WqxQAISt9n7
         njv0CBDGXeK/6lVzt+xhq281vkOruUa5OguExb+mTpSanye/EDMhsd+kV/KAmzNej1hu
         F5y6LGF2mvO2k5KTAwTISMs/IhkKfg2lfexXvOp/pMsGMLpHgw0TEWxDUlgVR4yZdGiq
         jRzvF+y2h924lPwRY/YPeQvaA0v8wgH6daYzch+69KKBnZQRpAIodB9HXIuO3CiHvrMW
         nFnigtGavDt2yb2fcAgThtJ+xeBIxAZQSYGhCAdC/Gkj3rFMXFqPDeJq2eRvLJHsUpcq
         EHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687768; x=1779292568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FV62wPVqhcL8BTl6zWBGVeKPNo6dhCw0zP2Wz9XZfdg=;
        b=BxhohjnD2SjAgwdjaYdlRexVW0O0b2Li+lJiDpZoDyCbPgLEFlwB0pXjumucybQNx9
         QU15tKjPdzgwjnSnIh9PDSWvzxoqyG3b9veOo4SXXTAXi/ngLqHX0ardIYN5ADknQu4A
         Hav3Q9ZjB53rNBhQLmZgL1c4VWaBJaGNUYMRJcL48j98yOg1hhisCvELBuHTCkqw6WT2
         2FyDsQj4LxtnBAJx15SG5vOthJm35FaeJF2oxGfCNLv5gtmLTEu/XX1mjIb1vbN01fRc
         BUo25+hW2E9djfegwUS9nqdwVxCy/XQVPYf5WrRJQqoHNtEGuRljsBtTuT1BIbzV2rPo
         HVig==
X-Forwarded-Encrypted: i=1; AFNElJ8lqfoFQdVurgXnsEynzbSN/UcbEqB4xcO/8qFrcMNSJiA14Brfq5IoN2TZXpIxVcWs0YxlJlMv8Malefa9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0yVAa/sBDuIpbzxky3su7HdR5pVQW/T8J6PL31sauG+sRzU0W
	Eb7ZPcXLGkm92DabD2JRpOYkfXef7IAx137cnZwvZM6bfgRn3nyoJ0Bd312wifqm7iglPigidaj
	tr6riqTBS8y8DpLPIYzP7r5s+FUG066DWzXJYbp5CCgYuIwkKRs6wJHZJPNlULqP1M5Nn
X-Gm-Gg: Acq92OE/kRfAdMbkGw4epQt5tPqFO8OVw631X9oiCkwasufNSa8ynqQl+mZccs4Nrf9
	vVrqDFJY1LKRLEBiNL5O+Q83SdpcSpR+4qZibbGJ+cswQUR/agvVm/jK6beGgEqQKC8Juu3PxZO
	2sJ4u6gwr3ivby9cbyugiAGmJmSrHp50LQsmV6ZS2crEosjuLfgm2/6g4L6tQOoaXiQY9iWx/i3
	jifvh4okifbqeDKHxmbN4k3Or3XBK5D4my3YOsFbwR8jijrJzA71lkf6MCB0G4Ltb34eYIoSil7
	KK9rkWBsxzo5HDZlPgiG7TYA77dxgXwPWbf0yGssJP09+8PNM3irnCulKinPWCjLcxM29KhLMwB
	R2pxsA+SwRR19tHSJXxw6yALWhnGKpNjCnmxNSAhSidbUxYoL+PyBv0/fhb+NrOlO0LslYKBuH9
	GhUr4lO9u7bDd6U0QtpYPOm58GAfUS3b2PYTY=
X-Received: by 2002:a05:6102:3909:b0:631:d3e4:efb6 with SMTP id ada2fe7eead31-637749a964amr1944850137.21.1778687768451;
        Wed, 13 May 2026 08:56:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3909:b0:631:d3e4:efb6 with SMTP id ada2fe7eead31-637749a964amr1944833137.21.1778687767933;
        Wed, 13 May 2026 08:56:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c873fd59sm2547257e87.57.2026.05.13.08.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:56:05 -0700 (PDT)
Date: Wed, 13 May 2026 18:56:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Baruch Siach <baruch@tkos.co.il>, Nick Hawkins <nick.hawkins@hpe.com>,
        Robert Marko <robert.marko@sartura.hr>, Pavel Machek <pavel@ucw.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] leds: is31fl319x: Fix shutdown GPIO and update DT
 bindings
Message-ID: <tyzqx4s6puwkee4i65ysimcayc54a5wy3sgps4h5cgb76zpsl5@r5ijowlt5ujw>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
X-Proofpoint-GUID: ABhHUaf2yS-lYwB4jpGpJDMnUR9QOEFQ
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a049f19 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=nkdmZr8mgQ_COcTxPvYA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: ABhHUaf2yS-lYwB4jpGpJDMnUR9QOEFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2MiBTYWx0ZWRfX3K1ypT/TT0Qr
 l0EsrEvfxogH0azL8Ef4mTvI/X/gE8gfsqYUZ0quIZGde67rWKAw8m/zgxEflTixoyKS56bYaZ0
 h+ScJ9+g9CLgBZkLnR2na7QSO2yOX9SSLCQNqPEB067lxFVlPOgJPzp8LqXzTCB5L9nyRi5wZpX
 o2uZfwx53Q6FAQS+agLyNhgrZ2u5yYA320f7wHBuw8fAKClPmpmQw6Uy0cRWqRc8znEs5gvJYcQ
 amVET08wIiKdTJXgkRxHPmsMjl2Hbhmb5+Yv5YA75u+t1uQ2lEIMDCP0IGiHXELjjrgu3AprayG
 yB1eRamTFEEN75xq2AQlCgsjLVxX/tK6fkkjBD5lQHKMRs7dwxA2xb0T1viG9W/VqS2zYY95hrB
 /ccGVGZ5T8j+8A2CJPghbQ6vftDqlpi8Yd0aTH4P/BT71wfDXLVhH1TiaX6vpQke3yIQthHWh13
 fw2qeKdv8XjpNaujJ2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130162
X-Rspamd-Queue-Id: BFC4A537330
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107390-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,linaro.org,tkos.co.il,hpe.com,sartura.hr,ucw.cz,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 11:24:17PM +0800, Jun Yan wrote:
> This series fixes incorrect shutdown GPIO polarity and improves
> shutdown-gpios description in DT bindings.
> 
> Patch 1 adds detailed shutdown-gpios description and fixes example
> in DT bindings.
> 
> Patch 2 fixes shutdown GPIO initial state and removes redundant
> startup toggling.
> 
> Patches 3-5 correct shutdown GPIO polarity in board DTS files.
> 
> Jun Yan (5):
>   dt-bindings: leds: issi,is31fl319x: Add description for the
>     shutdown-gpios property
>   leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant
>     startup pulse
>   arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO
>     polarity
>   ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO
>     polarity
>   arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown
>     GPIO polarity

There is no easy way to merge the series. LEDs and DT patches go to
different trees (well, three different trees). So when any of them is
merged, the branch after the patch will be broken until all the patches
hit the same branch.

> 
>  .../devicetree/bindings/leds/issi,is31fl319x.yaml        | 9 +++++++--
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 2 +-
>  arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts     | 2 +-
>  arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts     | 2 +-
>  drivers/leds/leds-is31fl319x.c                           | 8 +-------
>  5 files changed, 11 insertions(+), 12 deletions(-)
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

