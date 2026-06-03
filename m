Return-Path: <linux-arm-msm+bounces-110958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C/t2DJkaIGqmvwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:14:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B82B763761C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:14:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Rr+24RCI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Gr37nqCb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110958-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110958-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00E133018D61
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0787346AED8;
	Wed,  3 Jun 2026 12:10:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9145477991
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:10:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488629; cv=none; b=kuUx78eqzA2XnLHIvQj+heELw8p1Rxmrh8ttcE9bfK6xvRVnwUM0Cx365vY4BzrRXUxAW031hhTB3wgnX9Hd7+d7CWTbXeMt4njQTF+lfFzLZyDDu/xuPievYKXNJR5z+twknsQIGQUJktOLtO4kRdEJiQRArge+2yrQdpNxdFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488629; c=relaxed/simple;
	bh=i6M7Je3OtasBEUq9EoD9yneuR3KuxwI1TtYTZZtwof4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTFIzrm/04tq41OqBtSimr/D5SYpz5/c1YgcL9c7EMX5PiMuU3pJqvsfDoyYH3YoTtlMFaby5o/mp6FXcLUT1ziHdp+Wwo0LABcGIwMrq+MKvOR9k+lsRh24uk00sZ1xmLZB9erou98eAQav1YECY/cjqUyVpiB1lqjC6N3TKcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rr+24RCI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gr37nqCb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RJlC3077826
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 12:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ATJtFTYaLad3DCcw6EHaR6UDZL2D5tB2SW9NzD1xdM=; b=Rr+24RCInsAvsXQX
	3+KhmLczGOqk6E0Onhh0aAeyNo6M1cBzQlYFI/MP+d3lgTJ/XwUdNqkpFcRCk7M5
	D//ro5U4qxJ2nfNjzPIk8lBRl/0ZO4tV4hl5cuFxPCEUhL2ZjF0ISSJqRtdaRT3h
	rFFrB6Gp6FNN8xQn0UYYzikBH7r/2pJipxrm3ELlmufBMRwmaM2StXntP/u5wzqy
	2+wohFpm59HvzZacrSEGQBZwyo0naCYVUwgwjrBmcAal7az0fkd+z/wjmsQGl1iu
	zGQ1ok30yEBiDmHojrCaxFHQc/WFeG3CG6Y25lIVA41QTNb0mvE5OEzEYUVDQoL/
	Titn9A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbtd3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 12:10:28 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cf37fe12faso1497074137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780488627; x=1781093427; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ATJtFTYaLad3DCcw6EHaR6UDZL2D5tB2SW9NzD1xdM=;
        b=Gr37nqCbnouKUYovwURfvyK0L8+vzBz8YOVsh1bWYQ0LEhZXeu04dBMMw7byQdGQo/
         nkHhtDynvLvuZAuH1nqSiq2t3Q+UKdwOlXWvMK3so2XuoO50ybAXRyWgu7JXSt9wHRio
         gS4bzbVKmCTkCCUAkwGOm+Tbn5umQwflycybNRLVmN7YpjL1J/9WK+6hAVXvAAuhU+3g
         sOhIu5tCoVIu3OHgkFB+c+aKAUDtDxBL6IVPK8q2uTBK8Ocv/NOM5VkdY/SK5NfJEBg6
         qAt+VEM/H9UlnVpVCQ7nsclIfy1sXbv4oQBdYJQ2crLEAfyO7jb68wp7czQPAU+gvurl
         LGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488627; x=1781093427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ATJtFTYaLad3DCcw6EHaR6UDZL2D5tB2SW9NzD1xdM=;
        b=cThiHHF69lkj72bLX4ZIR9Zx/me5HhqnDSBlgIX2RPq2RLAnLv7CB7yXTwwcuApFpb
         H6pr02FCROAmkkSOJWAPVLKRouO9dVzVSZRTdY/Yp8/xy+Gbn1WQ8A7E5U6gJCsp0L5A
         Swwvmquh3zD1yDlr++XnowIpgBnsr2kAUeUPkf02oFU8BxdTRDGCVgFC3ueOkffIREy4
         qcLCuHgHmJlzvk992UJGMLOLhTAdAcDzLKvarpiI9z9EO4riBoGpVKE8/2nhNTHkP0Wh
         Qc9RVOnKR8qlMYl7z4NL+sgi4YM6830/pRbzVbw1io7OteZs9jZ12bKK0Tu6B1xwuDfs
         gpxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Y2CoSoNaYIrmiNlqypqBMpK6taXOdNivJIrlrojthKWyxNDFvNBqjiM2omn5BM+tlW/IRLrOAIbvoPUck@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt1DYVP1VZLailJB6yQwhKnmfMeKf/3EOECW4QtM3IsPVL5QCd
	3HyMhVZYQ75nyzBZLWjkiRnGEgZxy9zL9YUOWTbjEJMGeMVCFhkYytz7RA4y/+6BA0F/Zc5F+Rv
	oMX7BwfZP4YxOTDHok9wv3/3zgkWJb2GxNWd49fOEBA9qhSAKS/2b6n3cla9Pr4Vlhc7I
X-Gm-Gg: Acq92OHeZyOMC+DdVuc7jCtBcSmZatumlbZh6edpYRvn54z8jwyC9IfyK0BnqZKzaLf
	E5KAVk7HegTVaMk4bD+S3aZmQNG2I2ztyhJopyPEXFIXa+D5e4ugXHrUaMIDjEtEAnWFg9E/uwN
	Gl77nkQevDIT0+buWmr269zZrbvMPYlY7MVtYczRteK+fLt2c0OqGJdw3svhpfoHnyJvZxnPTgb
	/MgVuP3zQVDt1cDOnhNJAsFEJM0kThwAGwcgoT966CmV31CETGHqCM/0Uq23mrxTZsIzJwEI+4B
	ED13I4Bjf0omQZkpLQmrFVh8NglX7jRcNod+Sb4N1VVMHn+j/LiTZ6e+SyVFUo57E4G7TCe9V6e
	Q/H5knL0IEL/lVL2mcPmnE+5WwE4vMBZzWE6+aLiNuQw3EoDOskpOm8efhtmW0yvj8lLSIT0HMQ
	ZqsTFQv0U3mOOVXOqxE9X6DSAGHmfDl9pu9WbCrjCWvDVnCQ==
X-Received: by 2002:a05:6102:32c4:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6ec4881b223mr1353320137.25.1780488627180;
        Wed, 03 Jun 2026 05:10:27 -0700 (PDT)
X-Received: by 2002:a05:6102:32c4:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6ec4881b223mr1353307137.25.1780488626732;
        Wed, 03 Jun 2026 05:10:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d503fsm8633201fa.34.2026.06.03.05.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:10:24 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:10:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExNiBTYWx0ZWRfX0H+7WjK/mDV9
 F4fAehdytaJyHhxwjw7wbMa/C0IPAHlXA4UjB1zcrRLs2dtr3XljEsOuTbFahkjpVwHl3t7ITlI
 29neLP7usWcsqURN8kEgTUxlJfR4L3mx3ykednx1N6r7ml5j757GZkbiLPXo8Wznc188ygWLVA9
 9lGLY5F2cOCnIqMZ3UaLk2bKxICNDXU+wRjSSPFg/8L/8Wjg8AxDMt9Wgn1YlxE7HIPoRmcd2BN
 WShjM0CyJIeTJ//0eriqafU7IIIMMYssusGMvrpKLw/Hqy7sq4BS8EDBtv16DYX42x5cmrofFOu
 /mvBEwbT4gbX3r91IPedHeex+9sQSJQqFCl4AQwfH4vHbvvUs/mRVMDWhe+FqhDG9CtTrbSjZ5G
 VAfMGMt+aEwe5+NyPcBSeyg8w8PRMSe995a0T+gHEpRWvtui/yhqgUa+/uSo109/U1UDiUCBFCd
 ipiN90d7/NXm7gGoQOQ==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a2019b4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=tcGPitenHjrlTjGvCv0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 3QnyQjTmC6GgUjZK76Kwnc3x8shbDA5P
X-Proofpoint-GUID: 3QnyQjTmC6GgUjZK76Kwnc3x8shbDA5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110958-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B82B763761C

On Tue, Jun 02, 2026 at 11:22:41PM +0100, Bryan O'Donoghue wrote:
> On 02/06/2026 23:07, Vladimir Zapolskiy wrote:
> > > +    ret = fwnode_property_read_u32(ep, "clock-lanes", &clock_lane);
> > > +    if (ret) {
> > > +        clock_lane = CSI2_DEFAULT_CLK_LN;
> > > +        dev_info(dev, "Using default clock-lane %d\n",
> > > +             CSI2_DEFAULT_CLK_LN);
> > 
> > Why CSI2_DEFAULT_CLK_LN is set to 7, what does it mean and how is it used?
> > 
> > Since "7" is a meaningless number in the context, I believe it's
> > practically
> > not used at all, and if so, 'clock-lanes' property should be just removed.
> 
> Documentation shows clock lane at lane 7.
> 
> Truthfully it makes no sense that the clock lane would genuinely be locked
> to lane 7 but the documentation does seem to suggest it.
> 
> Yes in fact I agree. clock-lanes can be reintroduced if someone can show
> hardware that supports/depends on it.

Konrad and I checked, Hamoa supports using other lanes as a clock lane.

-- 
With best wishes
Dmitry

