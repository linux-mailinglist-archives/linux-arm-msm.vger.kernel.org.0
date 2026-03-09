Return-Path: <linux-arm-msm+bounces-96341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EVbIrshr2myOQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 20:38:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7F2402DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 20:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9FDB300D1EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 19:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B1940FDA2;
	Mon,  9 Mar 2026 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCW3MZgJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJxU/q/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA84410D04
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 19:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085113; cv=none; b=iAYzrXQc5Rh5iTE5ady76oUs1TV2mYPZ6NGBT+uOKy4QFdqUS0MYGsaZGn+2/RMCdKtIbZirzGkT1tMZdJQ5Wq044dTWPaNR2TBEa3rP3QSOzTWgdm1wMlxonY/VpClVoGce3bUpvEq1z8gBc6OsjcGT7lhUDToQZ9yVFrfEOkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085113; c=relaxed/simple;
	bh=Loslotr9NW0zDRfJCdEhJWGxURNCLV/qgMJ5loZUKjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjsW+TRUzn00BTph4wwEKUnCqS1Wx0k7PLYxlsSr4RYiloeUMWgx1F9XsMevaWJY0+PH2QFkNjiGqgk3CLk5V4noedT4quAv92nO3GmguD2vsRWjK9G7i9qNEmwkfKV48GtvRucP6zTpfBK7tGak7WXs0x2d6v1H8PlMe7Ctnps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCW3MZgJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJxU/q/i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBoi1296384
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 19:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b8esErilgfq/s8BkSvNufUOr
	3rLNwqSWbF5fuS60O6c=; b=TCW3MZgJ+oboxJmoQGpkU+tXKUuzG9xxkSExPkI/
	2wnB4NKydHf9uXY/Nh3L2VHTN8AwO3ZRIU1c3ZsqpteNTYabeGieklSatJZ5oDsf
	ZSDxGVioUeqGsLTM6wIAvXurPG4KNkDBZWlyeLbP8R7hJiPbAb88on45RaqGZKWI
	FUASZAoSxfBjM1ME+W97KALovwj4zZZ5y+RvXPMrbsfvkjI7HcSih3JrXhzqx56D
	T3dj4Rwcig4RI3PBYmQjVHhSvKEutMa1QsK0lixFFjkyaI89cqeWyoGuMB9K+tLg
	Pt/O1mqEbJDVcP1A01kW3hDuGArq6PLzXPEHwkmDBbMReA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy18sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 19:38:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7d4cc049so1970715585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773085109; x=1773689909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b8esErilgfq/s8BkSvNufUOr3rLNwqSWbF5fuS60O6c=;
        b=MJxU/q/iKS525HFXjsCfdwwEsPUwc2+jYrNjHl1epljgKhJQsRkkM6P5FT0zKaSr6g
         A1EbHEG1FtCANr4DRt1vtQE8LwBVM5cpQApFsV6DQPKzDJKCQ/HLGQFf5iKjcI1T13yZ
         rgkx2Z22+vKhxeWPqIpWv+N2fdomdFtsT/RrA19XCiHDTt9vj6McXL2AuU51I7WYAISQ
         HPejnCLrp7afqu1SGaJHx993Yi9DeMTpmXTUupoKNpUe6dMC3CiiewhXTmEEYhLT3d+Y
         r72oLhFF7kE4WCVrljW5CGptvzEshgXy49ybdbkZNa5OfCCSiIQ9ktytRPrTyxUxGMih
         3STA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773085109; x=1773689909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8esErilgfq/s8BkSvNufUOr3rLNwqSWbF5fuS60O6c=;
        b=cpn00+oWgctY32k9oo13Xj6DnGhBn/+OKP9857kIHI8TKL286RfYr8imvOqJ99ezpp
         33raJ/AKfbUP512JL7f1ac9pD1OA+cNK79lUugQTRC9JObR90MfmwdVYqbcikOMrTDU8
         aRtDGcyYs2i9GeWrUvDoOtQrV2K1wAEkcFFaWCvaEgUcl0I7e2/FEm0mE9VavSaql/xx
         eP5X+e2Ih4TUwbG6Csrmmdh6zN8qJQuRX6LvV6GJYlCxWAIdYAxystoORWBvDdZ1vTh/
         psmYPZ9saNb95GWh9l/k8Xg4tYlemPyfbVPaxfDKQMq33jbz+Ep4qVtIFEOCxA/Moy/1
         8jBg==
X-Forwarded-Encrypted: i=1; AJvYcCXPZkD5rglRMDjFpxZuGhSbElfLC1A4YhGSDZ+4kg9FUkiVFpUEvgV1NcIbIIiCMvWt6s4rahLEOu4ErcTw@vger.kernel.org
X-Gm-Message-State: AOJu0YzAf04oHK3KMXZ8XnNWOphN8pFKu0TOysPMluVOSmk5CcVSaFeJ
	6r3KUN5AUwPU6nPUUD6EsrT1WtkinmJ6jHTH0CWY6yULNEC+M30n3yWkXCNCgVhlTPbv4U9pyW3
	SYdEI9Hsf7Xa1ZhjYY4aTCHtSHpy8hPT4HaWjt0baP8vkqX1ABVgUEO4hGLTATvhYyZGn
X-Gm-Gg: ATEYQzyPrIkZBfGeuhvZZm7MXVowOgxsPIQL0JOfzFp8EDST8ypjKP2y0NRzaj7s/Ff
	GnTRm1JuFUrmNFmcYUn7TTViHmXInKPoFHf5otPVXeS9DEFmMkK8l9M3MvbnmbIWg/q3TB3/0rb
	UB3Iyyq0cqpy3Q/zRWDMCJXY9Gnf+MT+iiXgs2DkheJhb71cg5ShHb+uKBYHjgRqKeLktFp0hb2
	tgbYLOGQv5PnCohJM71OQBIVsFPSdsvxHB6xjBOKejDccabWhTdFwiWNjf01CllsDxnw1usTAMO
	XuPLamQQEsrlQYePPQkWr94/nfqxFkUm8HcHRj7blBWXIXHQFoesN4Tl0JSLOCh4t5oX1k0uh2r
	N2Zgqa/YQV6LD1bNesGMEFo5p3PmCPaGUokz0v7NZKq619gQXq6gRCDhH7CcGTtlO89M0xjJVFn
	F9Yfoy7bZ21uh7T5AzT+n31zken4fdfRHSApA=
X-Received: by 2002:a05:620a:44d1:b0:8c7:1156:efeb with SMTP id af79cd13be357-8cd6d431747mr1653861385a.24.1773085109076;
        Mon, 09 Mar 2026 12:38:29 -0700 (PDT)
X-Received: by 2002:a05:620a:44d1:b0:8c7:1156:efeb with SMTP id af79cd13be357-8cd6d431747mr1653856285a.24.1773085108412;
        Mon, 09 Mar 2026 12:38:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d02b184sm2337010e87.23.2026.03.09.12.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:38:27 -0700 (PDT)
Date: Mon, 9 Mar 2026 21:38:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        geert+renesas@glider.be, arnd@arndb.de, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com
Subject: Re: [PATCH 6/7] arm64: dts: qcom: monaco-arduino-monza: Add sound
 node
Message-ID: <mnehsjwwp54sk5bck32emtw3e5t66b5o447m67po42vahydkv2@cdnc7yzzkwlx>
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309152420.1404349-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309152420.1404349-7-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3NSBTYWx0ZWRfX3rZjiLKcGxBL
 /VTPUI04+5PnkDmFMGCcxJ2z8kMytoIf8RDf2YJk4W5+JYM97U0+qoomOrtM1t4E+qSJAyphcYL
 aIda7BKzSxqMaV1o0PFRKgBjH74cA6nnJXNUvBuiM+cozyU3G5xHrBgH7irz/qdAilJqwq1UmZp
 YPH43UjRdMrs7DlwFEI0PL42MFrsuUfeV9HmIcklAPaVtbaw/M7iUKkJQg1J03gIzdzFPG+TqrH
 K71J2nhVmlL96SGCnukdKfmZRtMGR3Hsf/zrMW4fD3Se646rOFMC8jif9D3ae9OTuWQJHSr4qKH
 B3/7BsfuwEnslvYbfQsQ7GkinBiBMnHLsKvJr8ZiInQBKWNBt/Yvn8XlJf/vqKUNJoxPMCXh1F7
 RIQypkJ4dPt7yJjS/uhaMATVIaOTn9hI9OgC3JPvI9qCnC+6PwutFQfMIerUZGlBtQ8XIoHSAMW
 fK/ZvBKaL0i6Oa/v+xg==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af21b6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=fNMmvbdrdlD2suN_VgQA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Bu6b_Lkziidf5cDeHmERdtSpcHZf8VAM
X-Proofpoint-ORIG-GUID: Bu6b_Lkziidf5cDeHmERdtSpcHZf8VAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090175
X-Rspamd-Queue-Id: 4BA7F2402DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96341-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,arndb.de,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 03:24:17PM +0000, Srinivas Kandagatla wrote:
> Add audio support for Arduino VENTUNOQ board, which has Headset, Mic, Ear
> and Lineout connected to external Maxim max98091 codec, HDMI audio
> via ADV7535 dsi-hdmi bridge.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 66 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi          | 55 ++++++++++++++++
>  2 files changed, 121 insertions(+)
> 

If you've added the file just two patches ago, why do you need to change
it again? Can't we squash this into an earlier patch?

-- 
With best wishes
Dmitry

