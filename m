Return-Path: <linux-arm-msm+bounces-117039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LtwoO/UdTGosggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:28:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A86715B6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:28:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B6vUTsF+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CKPNNUJ3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117039-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117039-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3D5B300A336
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B47395ADE;
	Mon,  6 Jul 2026 21:28:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3662D420E78
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:28:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373298; cv=none; b=ICjvLczWRNVvCWvEza00LzgeQtLTApdksOuRq85oHFdrSFFEfAyGOQr6zMrsU+BAl0P2u/+BbJ3JSxWsJ1uK4p5SYzAKDsKWDBuYBiIWtB5YscLPB55yW4Pyi4jfteORhjNC99aYXk+CAbyHkrtP2VSDWn7voUZNacGon/Y+sYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373298; c=relaxed/simple;
	bh=xBAP7/h4Xm6qU6HLtUx5hvQdnXDTTiKJcKcvQQsAeJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzV3lWzRppD3qb40aQyxcpEOA6gSgGrY4nh0kQKdTRjaIEr/DwQb7qlLF4rv80wtwN28qdYYUf4Ork5jpWiXlXfbzJp/IuTKu5XXAaTEL1trnIFXat9S4Nsn+GHeK9udaUFxOtUVO/K2vjKEosn+Y61uKAqthDL9hLC+w9LxBcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6vUTsF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKPNNUJ3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDvbN1566474
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVyKUn6Qgeu8Cw9tv/zF53VSVfQF2ch+8IMvAUMaMtg=; b=B6vUTsF+PZo2s8op
	k91yrrH8BFLXGcc1v+dH/Y87y48/xr52B74MZi5C5tje3zjT50YWFG9LgR5OFtoj
	uZrN7jvmayh/z0oeFDCqXT95ZjU7vAfo76FtEQpevDbYtyoExwqDWadJCmmPwgTc
	X+VB1dDee4x4WOaXZ1LWivrvuBv7hagIygLM4VZwgi+L+Zc8stvPbySIbh++poei
	UNgwUeZDOlZ1IgxfltcCPkwhSNd6fQYwfEhuzWUHmZhj//qsu3VpZbg+YQdRF0/v
	XQgqErqLYI0rzGYUWqLwQ8gYh0IDHmtYvPATrhY3u2NOpORD50A8YO+sRN7Z5QAU
	RtbGIw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7kkc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:28:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7390c789e4cso2929811137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783373295; x=1783978095; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XVyKUn6Qgeu8Cw9tv/zF53VSVfQF2ch+8IMvAUMaMtg=;
        b=CKPNNUJ3VCCUx7nU+hqnyDcylhkUyPoJMTAUdbgiKhdJh/7uKQr1dwFr1288p2Rp6F
         dLOnyt6VCTIrtLfvjXJ+5jSC7DlnMjE5u01u0eX93oyOrQjTJkbQCi1YPccb1vmqEaPD
         8x5D5Kd6bkhawnaopOZHTjQs7zyhHbfSlVw98nkbfOQniiBu2WMGX8WpMTcCo8nHskvB
         iqKPKZitZvgvXezOZRgCirjZINF4jRj/+vcIA6oxFLz8wOQtJfLm2FvRE7izOXZx9F+P
         VMT5k2z/bZ6VG3ohoj0yOQBR02705XTqWr2IWY154QlYoQaMdUubGgg4bYF1nzmhW3FP
         64RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373295; x=1783978095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVyKUn6Qgeu8Cw9tv/zF53VSVfQF2ch+8IMvAUMaMtg=;
        b=losYka0o1QhUjU3SXkDiL4HT72O6HREd4Ofxnf+q51dn0BD4C4faTMfCOF3NqPttGc
         Qyi9rLEy3zqghl+MGheeczrO+Tg1ah4TJlPsYpkCb1YljpcgK9y6riMOBcoevPbUAuCv
         6SeQDLanGga9MXXdt66XKz5GgGwX/SbmikeyQlxs+8ey/BtVGCBinIhdx7fy87eLR2Q4
         JiFfuMXoT/5y8Sg/Rny3ElF4umX49Z9NXzUarELEl6nycAQVuyvFv/fCfcE+60cO8lkF
         os2yTSI+R3B72IDJmm4C/ZURPD2C46TJ2xPzXsr6CuqHHLBlTc/rUxdKl1wYL1rH4PDP
         Zq2A==
X-Forwarded-Encrypted: i=1; AHgh+Rqu0D5Tgcc12pCtF8p5UifUCP7giz6usVc9xgU9sIG0CL1F4WkuNqROqmT8p4Plc5QflaO3UUxLXBc3u7Se@vger.kernel.org
X-Gm-Message-State: AOJu0YzbCeCTVJY2nQstkwgZ6DNYJFLFjRnVVp0jmNF3XEDTP60YzWMO
	LX8BYs32GAA1nyKw9slI6J0BJOAjQSq4MSMlDObSvVYcKUmh53sxi/4xuAYFdeXsWxom04Nmt0b
	bNcWE1OrDCLAhE4eQ39/AqQQrJsCnFqOf1ZxPbrUDfQKXoY3+QSCwtOFl7UqY5cnbblEC
X-Gm-Gg: AfdE7cmgZytPgqnagp6WvGCVxDC/DcpmPG73nC4sdwJWpHUTAfwVOVflmZDswTI+I52
	saPbWMsPyVPJEhbQaM8+QoZIn53/xiMp7Zw5Kb6zL37s7MjKQPvyNI0iWuHxBpuikRMmRIp11tK
	UJmdcx8LCShwgDSsKyIzo2UkHR78DhYW3xGh5k3wsURkFmH8YNBItP4YQd3yusrLAv0EODWJHVJ
	CzZ8oF9Wpw9gzOGGDWwFfFvfc0WeySDQWryRPTNrfrgMwvVYPOS6DHv2cRPGa4R1AqCcqoWE3to
	cEei/S4Onfyh8fkXQLLgW1hUWN0ck5ESZ0TkeZ+frbdlaDJH7N5LHSt6fSOWqvWG3mW7bBt/Pgn
	5hmXwDBc0k4ItgFJfDpSCC3PLk7+FZ4JWtAAzJf6KaIR7uHymHc06lrx9njQoTKnjqjkUKPSgMX
	wuY7mi8CwLwYWUWBdrNvry8XIu
X-Received: by 2002:a05:6102:598c:b0:744:a3fd:410a with SMTP id ada2fe7eead31-744b7d6e301mr1160556137.14.1783373295347;
        Mon, 06 Jul 2026 14:28:15 -0700 (PDT)
X-Received: by 2002:a05:6102:598c:b0:744:a3fd:410a with SMTP id ada2fe7eead31-744b7d6e301mr1160536137.14.1783373294919;
        Mon, 06 Jul 2026 14:28:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839bbsm3150167e87.35.2026.07.06.14.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:28:11 -0700 (PDT)
Date: Tue, 7 Jul 2026 00:28:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH v5 6/7] arm64: dts: qcom: shikra: Add GPU cooling
Message-ID: <cikq6wyljzdlyuopvxno7fipifzc7f2zc6hs2ligiu5esnljui@5mxhammibgpc>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
 <20260707-shikra-gpu-v5-6-d2f373912d3f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707-shikra-gpu-v5-6-d2f373912d3f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX+S4LGGKXB1cX
 W/nT9voFO3B/52C1CtflWVEU6aM+7uBtQRZ7zuxer78Wc6ZzAHeNJAgqQGIk4Te/teLPfchmIpy
 3wunTsKuEbCzQfr6uZwlys7g9xQavX+bxAUt1Z7UP0q4kuEVTOmTzJStGpiwmwrjUgw7tEUKNxl
 QSDjbVZdFCGuQWMIF249BDPPnu4aZovvz/Nm79IQjLRnxh3NYdbUUykmaE7K3bVOBOpfILXYIc3
 MbQOT5hpfG66jxfKR2N4EbQW/JNT6n7HRq6UwpN2sq+5ZcZ0UKqzl3216ZCzT/pbIb9wT5afsLK
 hOFid0v/voCt3pMUlVM5WsQWzAj8Mezyo8qt/8QzuovgGrCfhlAoqvWNHMomS8/z6E8/UfSqAn9
 SnqlftQQ8CojibWxW5Z9cq9bRW4XEr/GqB+0Tg3FR1AYz4etMkOySZ4egbWeaC/93ovThqKUW9K
 67koiRItZU2su/PzKag==
X-Proofpoint-ORIG-GUID: EdhmACD55xZE6J_9FVqwo1jc4pZG6MC8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX+Q6GeGawYbmd
 I8GMMSbz1pH6ps7bUB1xbCYa7OYIcX8JtxpbsUtcYkcOBkSsszW94pioIh6ia705T+w2P/Tyzwz
 4d7qBGz3hjC2JThqK9aezvdmrvYylUQ=
X-Proofpoint-GUID: EdhmACD55xZE6J_9FVqwo1jc4pZG6MC8
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4c1df0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=wZTYHpkevF83xUmX0v8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117039-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:aastha.pandey@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[5mxhammibgpc:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85A86715B6A

On Tue, Jul 07, 2026 at 02:34:38AM +0530, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed when reaching 115°C. And
> use a passive polling delay to ensure more than one "passive" thermal
> point is considered when throttling the GPU thermal zones.

I'm not sure I can parse this sentence. How does polling delay affect
number of thermal points to be considered?

> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

