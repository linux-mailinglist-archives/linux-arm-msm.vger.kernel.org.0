Return-Path: <linux-arm-msm+bounces-93951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBRnAwR1nWmAQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:53:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F566184F6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FFCA3044645
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7613A37107D;
	Tue, 24 Feb 2026 09:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpzVIVFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3d5nrXh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B865D36F412
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926784; cv=none; b=cistY4cK/SdniaziXFbRonczJL5uO5fOEtGa5A8b/bNo/ezHYUhg05kt9Vdng9vkU+FymgdXPfhbh0iMWeBcTBsibd5gl8+bQxkvWoOqW6Vau+xU1ldxa3nQo3eJql9s8dKSNWU/GGLxjM3grOZ1R0JUNk/KFZXIWnOyObWRVyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926784; c=relaxed/simple;
	bh=xhkpng1n6YmbsIQQvz9aqEU1lB+NHPH1lnGC88a17Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5DnxUJ0nWdEGM6ai5r7JrBstNyWXDn2sQglaBz6lEfjNYULU5uG8ZD0G9vUVslu73JZ91UJVG2dHXbpsXjhircoNwtNfnR9aGI0ZnaSJfVceZMRVu5QVnXJx+NXPDHjMHSXd2IOTEEG3rFHriPDghZ7yMQu649DxSEzysf8CDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpzVIVFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3d5nrXh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LPi61459893
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u828qxpVVFzxepP9ptP2nkRL
	eZRVHAa0CaoMHz2ebqQ=; b=JpzVIVFlIcNgr8a4lRjWRfp2t/Oa1LG5qYeNOKBu
	z7CiUqu8dL8Bk4qtV1XuSW5Pe4wlISiC1pVOrOd1PeJ4BJdeJDhwooFaQPCvJ7D4
	IV+K8pPZ/9p64+gM7OJODcsEVYaiITjSa9F1d2IojjlODCHTM/zNlWW0vUltrZDK
	Ej6QHjJr/1o0U7cGwMXOKnyoN8e8NJ1D/iq/Mo1jagd38qi63qkOFwR+TnINg7r/
	rAUXK3G7o827ZJEkx59quZYYqpFf2K5y0jwPXAHJAGa5NSZxDLooHq5KyAK2T91R
	oZ4RFb7ZIafXAaBjB1skRN18tmOUUV+0/vMRIKAyKgP/lw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e390ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:53:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71500f274so589375485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 01:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771926781; x=1772531581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u828qxpVVFzxepP9ptP2nkRLeZRVHAa0CaoMHz2ebqQ=;
        b=Q3d5nrXhMBQJP13Gj5OhkwicSMZ/G+oI+yUbTDNUgRFgrp2klu0sk3ujv41dS/jpcc
         jfNRaiRqhj21+Ncc/vioQC0+Zjb1301m0GdvBO9pDj/uUl/nKY7HCIEHQfHKVkxa5V7A
         j+dtU5BRhRjID/o4pSEpM0q3JAwr3HeDT6msUHQCBxQigFVYL4Un4UtpfgZAr2BT1QmL
         X6qlPzd1qkk4H/mRMbYqKXPj0Ce4eKB5gPlrsB6zNHZQeVBJu+Go1eCHJkrcGyMScToZ
         zZUcagu42UTn1YrVea3WYuaRYRjV1HQez1ilbnnegF2EB3zsMbyFE97XE335g9fL2b/P
         mqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771926781; x=1772531581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u828qxpVVFzxepP9ptP2nkRLeZRVHAa0CaoMHz2ebqQ=;
        b=qGyCq0+A67DsMe/tSTioqGWPM90HopykC8T9T1oXr+atdk6HYiPxNX9L1gWovxSH3f
         5VuGQjQaLoesU3nZRbK50t8DeIZEKynbck6nY3oZexRDVwsq+Kn6bruTFiYA/CCNajWO
         tVogiwRqEn2QayefgqsW9JBNWf6W29zTQrIMfpv3gEr1cvPJSjc9GxiH/HM0CIiVelyz
         cO+i8XM7z/qoq1SZ/qHdxDwBa1M+dCmA9BnF3tXnUfni2fom9lIvCUqJXyhzKBGQRl8E
         ZVGtr8BUcHeSGYBsaa1uSjHUbpTfFV9uOaqFxK+jLOd4T4HcirqBAaZ9SPjXYkmUQIgz
         Oqgg==
X-Forwarded-Encrypted: i=1; AJvYcCXa68ty8aHOhuqqVtWS+qKA4D0XH8vIe4EjgVv1uyrDM4TMR1/e+nqk6GC/TJHBdDLrcgQh0Ogx2F5Z+f2D@vger.kernel.org
X-Gm-Message-State: AOJu0YxE2jBtGRZCq4ozR3DA6AkQOXEo3/m8zzuIGYZ8HrATmCpIKtL4
	oWZmpFJTpuz1QpXTryxhvBWn6FbqlNPIYBCwOjBsN1VDW4pWpbxAMHMiISwyQsIIzznL32MNLn3
	MepD+WIVhdc3Lw4qMSfOlIYH7RLsc6YnhnShdSe4aOiz76/VGOfjfyD2xaiY6hmvJrVvN
X-Gm-Gg: AZuq6aL/y2U13s/D/3siersc3fHWeAIpPIRBq26TZ59YJNQOGsaKKoCqu/z3nbcqua8
	Aj/k1v1KlCvUb7eGljlk4W4zqvRcVtpNYhX5gHfLtbEXiJjGLiIuZrN30qRCfpPl8SpKtFtZUyx
	PTLCshX8zscxAON9Rpw348JtKFdJJPLYAd08dsBST+apY4y3YtJ+kW0kwz6ZLp+Ay2Kb6M+UAXA
	cZZn0dJ2fy9uWa8YwxGH2Z9Oo54KRvHGfT4JwU8EfA2ZZ2QLLbKZFBeGnfsyEo7CmpdiW2evZqF
	WBQUSaiSi/rIyG9msVPxCUxlxnVua5opxWNnJZDqNiJiP8KFKcMQbzELhRFaixRXDjtzEcF/3Tq
	b9ZIzcGcc6aQvHsYt+1soeuCwbqDT6b1MndA4r+4oyJC5Xlqljgvofg5sWRCOFTlG5U6E+f4n++
	f20h6rwzHMyM7Buq0BvQMFLlLOMJPuPcGr0jc=
X-Received: by 2002:a05:620a:3197:b0:8cb:3870:5c1e with SMTP id af79cd13be357-8cb8c9fe7a4mr1447992985a.25.1771926780960;
        Tue, 24 Feb 2026 01:53:00 -0800 (PST)
X-Received: by 2002:a05:620a:3197:b0:8cb:3870:5c1e with SMTP id af79cd13be357-8cb8c9fe7a4mr1447990085a.25.1771926780409;
        Tue, 24 Feb 2026 01:53:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45a64sm2072227e87.67.2026.02.24.01.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:52:59 -0800 (PST)
Date: Tue, 24 Feb 2026 11:52:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Max McNamee <maxmcnamee@proton.me>,
        Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Raymond Hackley <raymondhackley@protonmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-samsung-coreprimeltevzw:
 add device tree
Message-ID: <t3khpv3xltx276k3fgfcawt46yxsb7ro33kffj4kmb6pxrvx2t@mds6hqfaz5ol>
References: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
 <20260223220514.2556033-4-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223220514.2556033-4-wonderfulshrinemaidenofparadise@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699d74fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=d2ve7ugHHLgULyLVOFsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: l-o8pWvol6PH0I_XdQyCYBR2_B6DtfKd
X-Proofpoint-ORIG-GUID: l-o8pWvol6PH0I_XdQyCYBR2_B6DtfKd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MiBTYWx0ZWRfXxEVJia79hiG7
 6Y/yRuOu6EIZ2uow8XiqjNafoiVrzKukCa201Hx0GYsFYoTkNszuTSs17JrIcukaiDwfmKpc93m
 SfTO5MppjqlsjZX8B1yBClz/wlZtnFksv9rV4lcdCIPiunfEJMbLWAuyqe7wyswPT+9RvHUowCv
 zWnPuCLUUEZJgmtqvDf8/r65IL/SKs3lIII5rLWppQt2zaQJwZi89V0csocPMzvNcH01d4M6ycd
 jb3BO+f/eWiAkAQ3WmyHpe6w8hXCUnwqvL9+akYGfWU3BZo6CVj/Rmukx4lyJ9rGKpKqy4c+vGg
 xmL5SUYAyaWGdi5wULP4h1tnGCtwKSE5cCY53kCWf6BxXlHMPmHf1Z8tIELYxfp2UaIGwku9ZyN
 leVDMuW4yvK1iVBOSRcgjmsKBZ2t0aNxZ3/V/OIbwu7rJL2q0g/W4Gb7LxakJV+EHRowWgEJj07
 FAysLnXqu1YYbM7PCJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93951-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,proton.me,gerhold.net,trvn.ru,lists.sr.ht,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,protonmail.com:email,oss.qualcomm.com:dkim,proton.me:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F566184F6C
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:05:14PM +0000, Raymond Hackley wrote:
> From: Max McNamee <maxmcnamee@proton.me>
> 
> Samsung Galaxy Core Prime Verizon Wireless is a phone based on MSM8916.
> They are similar to the other Samsung devices based on MSM8916 with only a
> few minor differences.
> 
> The device trees contain initial support with:
>  - GPIO keys
>  - Regulator haptic
>  - SDHCI (internal and external storage)
>  - USB Device Mode
>  - UART (on USB connector via the SM5502 MUIC)
>  - WCNSS (WiFi/BT)
>  - Regulators
>  - QDSP6 audio
>  - Speaker/earpiece/headphones/microphones via digital/analog codec in
>    MSM8916/PM8916
>  - WWAN Internet via BAM-DMUX
>  - PMIC and charger
>  - Touchscreen
> 
> There are different variants of Core Prime, with some differences in
> NFC and MUIC.
> 
> The common parts are shared in
> msm8916-samsung-fortuna-common.dtsi and msm8916-samsung-rossa-common.dtsi
> to reduce duplication.
> 
> Signed-off-by: Max McNamee <maxmcnamee@proton.me>
> [Raymond: Refactor touchscreen and MUIC. Add commit messages.]
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../qcom/msm8916-samsung-coreprimeltevzw.dts  | 44 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-coreprimeltevzw.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

