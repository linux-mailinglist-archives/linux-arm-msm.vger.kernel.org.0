Return-Path: <linux-arm-msm+bounces-111510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WYe9AXcVJGpq2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:41:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9262F64D786
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:41:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LIgNCPTK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TZjfWCs3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111510-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111510-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB322301913B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0C13AC0F6;
	Sat,  6 Jun 2026 12:41:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932BF3ABD83
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:41:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749684; cv=none; b=vBmK3rRZhirbrp213eBr2txhcyi1MetAEc+eAHZzJQctPJ7Slj5NQyOi8jZizozctMm67KxY5MJ9wEmOXXLi8GNQIh3+TiTL89auP80Jy24lzWAMOtcCkgtwcCf3z4ygLodP9ypc6SIeA8pk6usXXT8S+6Vot45pTlvx0QK8xFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749684; c=relaxed/simple;
	bh=6uToLWIkhMVLVPs5bVfaOcvpcrTZrOqNSF1Bm7annfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uq8+0BM+AkIYg1gqBP/dUQ7If7E/cjCnbBmRaQ4LJ9YPdyZsacJnn66KUq/QfPkm6+4t2fkveM0QV3hswvV7wQiszzbeH8BF0jOtiRCOCtj6JvpNFINKxJD5Z4GaqE475+CKO/gaqOZE+CvXTHkdyF19uP5ONSx7W8EVEKWCGF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIgNCPTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZjfWCs3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BERe31258373
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojRmqHVzAY9ubyxt9hMVCKPiSD0rZfJdWLUlBw5lSJc=; b=LIgNCPTKnlPTSgSb
	CvI34d80M5q9qq/2h9651kVdt5wnHzR0rDNvy6DnetFDXQY8eWXBEJVsHt/BgnET
	5jy5zUbvK0UlubLyrsTpfYvfBei4XD+mU84+FPBBYqi+KDo67EW95nDUjjd3NkMY
	Kx3LzU93ncEVqWcOQXiUmKZNYrlpzKVIfoJMFwDyFWf6BU4K4la5IlrPgeQciobN
	K9GW+Rlelrixv4iUWkyrHp/JHtqCNIgMoNOFRY9W9Vddzer3gr7xUJ77tmRMlWyz
	Hsblm+NLYR+NKitIMVBmQED37LGtcOEcP5mH9V5Kiss3JvPikr68MhrPjyZG51rH
	/anPgQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadrvmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:41:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59ece6adf0cso2531368e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780749682; x=1781354482; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ojRmqHVzAY9ubyxt9hMVCKPiSD0rZfJdWLUlBw5lSJc=;
        b=TZjfWCs3taNBpam4vBTQoYmIK7d4q9QK2pIgl4/ccaFdxsGzr/L94NBTQj7S+R4/aH
         2XL4P17mYXMR03qpXrd5Hxt0KDs7kHMP4ao5m9+SUqEOwCU69G7F4XnDHxjeR5qDKp+6
         uVKx9IPT28eo04HlT7x5bfSyksF+LSqUsDkx+rv6AonwH6EOKx/LAyqszfOVYFI2tjO5
         vi3kE5hgpSf7/kMP0QJgXsA6qr/IBtXJLWkFHMItuoYX/Jr3kFEBsFpUGAKsbuUwliPV
         j/mcv0llWVy1YJWPTdSSwU7t/ZDx3AiEcgwy5uvSogbL333cITk+2M9GYILPkBYFRVlV
         +CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780749682; x=1781354482;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojRmqHVzAY9ubyxt9hMVCKPiSD0rZfJdWLUlBw5lSJc=;
        b=FkEtrtIca4E/0ajtDCGX4qDbmBbzQQmtF43/axBPhnlma8cMhgzSU6JhjpGWhh/VHU
         JPV4iGVBSLA9mpZn2QvGMBFO1S/NY6RSzYRcvPUKywKQcOtnc0sRn5y3M5Hv/kbadvNj
         /faDp9moOjGispuq9eH8Nk6KHdmT2n+IcjP2TvOo1PY4aJV8vy0LRRmEnqb/p4H+0wgr
         m/NH486ahkkdoOoreAMfCEEhzBeZJ+SRMhRgjr/GlgehNg2ZWP9Uwljz+MpEsTF+86qq
         pVYgfQ7sAzWaYsATMgVBlnlayXhec2xCd68/nOLWeliyhmPa3KWM4vYaIwOLvcX/+gry
         vB2g==
X-Forwarded-Encrypted: i=1; AFNElJ9cORYkqiX4DwbPrEG1aPsK39IXW13Xvo+6SxVw+ygAqCZbAsvIkCa9qZFvlbPdtTG2tH8KVfnBtYIZ1e46@vger.kernel.org
X-Gm-Message-State: AOJu0YydUgqHc9LFMJtcguzCngsmwTmV7CbrttcMHMhLUfhlro6JDdPR
	q2+VQYsTvRYCr30quUVKMe62MbLHVu01eW2ojezamPAnUXA3vFv5o4HrbqBmo2zTO5s4f4SwFwl
	vnHHJcvub18Yn13oDVBp0Yf+sPN6kuFDowYae5woAQVw008puRXTGTosz7MW/LyS4S4cL
X-Gm-Gg: Acq92OHw9ia4xPuGTjDLRp2rfWcv4gnm0ganfyUhgFljz5KwoUt39HZ5aIkg4r4A5L2
	upHTsbX1Ce+xEzs24XOoUQZLSHRndsp4R9WTUyma9RGp8Vw6I3XjWyWOEavWFDSuv7sziRj3gkd
	+z7ecphriqYMphmGlri4pv2Zd/79giFVLjG+Ep73SU4hc7oXQAvDhbdtArGumcYZJpZCl74IQjF
	KnslcpTb4k3DLGAUsuFW0af5lsvOhHIPS7aZdpBIpvJmLt8UwW51Jb3FLkMoWULPvPBDpfrQ1q4
	hMqw4mUukx3GY45hTeQcCi961PgYUzzreQeXNlLMOgWkhaK8Ri6y5OJljPcunVwR/7Bll1xhRCc
	CBPQdxHFIcWdIrjhN0xE0qGVTBT/RsyagPqMT6hdvnBgBaeCMYtxNmJjJGE1Ts/oQmWEVCW6pqn
	WjN6g6O9oQ06KxEuNKAdTJsjNfardw5Aq9vzCScuuhDtw0+w==
X-Received: by 2002:a05:6102:3ec8:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-6feef48d3b0mr3910650137.3.1780749681744;
        Sat, 06 Jun 2026 05:41:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec8:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-6feef48d3b0mr3910636137.3.1780749681305;
        Sat, 06 Jun 2026 05:41:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed74asm2416158e87.13.2026.06.06.05.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:41:20 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:41:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: shikra: Enable TSENS and
 thermal zones
Message-ID: <nescd2gwgx6msrzsawljoktwaxtmyo4xdi5s4csy2na6pebcsy@ldzwnj6fxl7c>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-9-0fe3f8d9ec48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260601-shikra-dt-m1-v3-9-0fe3f8d9ec48@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a241572 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6o-Bo2YM3VKyGZF6QcIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: IhGO6DBGriA8La-jAjTl9WzHjUmVz4nP
X-Proofpoint-ORIG-GUID: IhGO6DBGriA8La-jAjTl9WzHjUmVz4nP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNyBTYWx0ZWRfX/kxHTvdY/yzA
 7qg7od6Y608RSs/+aAixV36EbWgTNb8/TPuD7dKCUzXdBP5IGZJ0EyksLAsvZEFvlol4xgjTU28
 15s7Nix5hnfPHYs8+u9JAFgOTp4jRAdqBSr1LNwj8VahJDSQUwWbqdrpL/ommMs0s3VXBwxwxkR
 v+ttAV5LTBhBiltDXl4yYTZs8rI1jg3JRBAZmV8XD53hDcoTiAzKE5LAgrp1GNO1aHjW1SuGtR/
 +2IE5vzCX8Sfvre52zrfqCiBbK2hjVmpYjj+/Fayd4DcFjhoazBlwF32VezJ2qi0A5w/kfMpzLf
 tatwM7eXV7IMrjdxkLMmQE8u18HAl0WTv9RX+ukHGB8aHqRtqSxhR5gcC46TZoIXR6/mY+yqwQI
 H7sTXHBZsIqF7kFTJ2VBEe3FgA2Bbp2nmOsYmto5JA7So2QEy1E1eN/+8XLPSgIOKChLOAxk5Pp
 yxCieb+J0LEGIsmDPoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111510-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9262F64D786

On Mon, Jun 01, 2026 at 06:25:11PM +0530, Komal Bajaj wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> The shikra includes one TSENS instance, with a total of 14 thermal
> sensors distributed across various locations on the SoC.
> 
> The TSENS max/reset threshold is configured to 120°C in the hardware.
> Enable all TSENS instances, and define the thermal zones with a hot trip
> at 110°C and critical trip at 115°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 267 +++++++++++++++++++++++++++++++++++
>  1 file changed, 267 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

