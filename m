Return-Path: <linux-arm-msm+bounces-103611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JBuRHgMY5GkuQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 01:47:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7884229CE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 01:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB837300EF87
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 23:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A0B2D3A75;
	Sat, 18 Apr 2026 23:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8Lj18rh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NizHDYnV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF6522B8C5
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 23:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776556032; cv=none; b=Q7HnYjKmg0kEAbeL/D74aDc8dq8hUr0eQG4PK1jt4AAxaThjd+IzDVCYnnZRkXjkj9sFDDyJndyO83bwgkHu/bVyjw1tVboxsN92qlUF74Bt4JXWtP7h6XG5Spfj+77XHbmHf0MqxCAjha4GrYvYqm5zdN6gFqcyvaXvhu459Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776556032; c=relaxed/simple;
	bh=ZIq3ZFZ3ccjd2F7BAVM8KR1tPxZH5+doNDatLqhgqZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1M9UZqzNvl5VJlFoCHAxiVF0H2ylRrIW3KRS5ka8h9r1wypjX+le1lDoXOO2p3OHRZB7V7RNi0eeqbD8jgkrnp5t+cAcmD5zVg8E5aYAcoAR0bgwPVlpFYdNbBqOL07rWk6KctV5g/1wtUIQ8m7frbPVLXoVEhuhyF/MyfNY9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8Lj18rh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NizHDYnV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4UFwX2011874
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 23:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mf9OnmoHEVZ1CoA/TLWVuCr7
	h/Q+VXDFuGsuLoR9U9g=; b=l8Lj18rhmcm+9cV4pJDbqtyViizLvMd4VY8jFAt7
	rRfMEGKc5DV99pQ3YP7mkbsgf7L6F4Q4o+fBmcgIugeqgr9OOxMdd/CvWNfdLNNO
	8hV1aiItk6k29if2G3Vy4qrP+g+/SOVvUaO4d9XtgeCCeCG+kO7MLbpMq5gjlHYu
	bEksLLiVWPiUycHJquZghFeHkrKMkEiP+Njkqojnov1hw1hLiNi8ZjHGn6CEUR09
	hu46d6RZoNvOzTV+mF24eESfpLB+JsMQXh+KFS4ry6tos2BWGtvHjI5gmeE5haYZ
	fSpqUzBXEv1uN7cvGW5cF5Im+y54ZuNQxItOGHHTQ+WLVw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y61rpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 23:47:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56ee7e84f9eso1305372e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776556029; x=1777160829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mf9OnmoHEVZ1CoA/TLWVuCr7h/Q+VXDFuGsuLoR9U9g=;
        b=NizHDYnVIEnu0CUS2x8JEGm5HteNuTK032t4DB0Y1VmIs8q7Sfg6zVs2mGB+BGFSkB
         l14Eko9Gln3Dgp9qVQLhJ/Pr2/xQQI/s4O//WurlNj0nj5HhiKNU3yEP9+OREJIZK682
         CIRVsMdrxR4jImiUM3RNNngSX/TQoKu5poozVg4atY4LGTUeodrRvuVsnuUWLXVKOxKa
         h/R/ipC8EVxHDWRYu0+OSaXL/BJBs5MeBiBwv0v5HqhH4Y7QZQADAkyw0SLP1pYE7/DP
         B56lVSXCJnXnUdgsv/NWnSqAPIig3j+msBhqZd77HzurcspK5Cj4Wqsgt6hhXPoRpvci
         5/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776556029; x=1777160829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mf9OnmoHEVZ1CoA/TLWVuCr7h/Q+VXDFuGsuLoR9U9g=;
        b=I4UEhtaS6ryooLNHZn8Le+Krzf+WoaHyWhClClHIgFE56Dij8/xAa+wBt439U0Jc+h
         E9mggFeYFSDvwL0qD07ALvp0Z2EqPyT7CZmmlBjgT34za5oz42WQe6fOUPWPRPPcV/Sk
         EB6Z3n3oeRIJ9E+t/o0vJ3znwX+qvwLQuIfxFrCY/wCLyd34efI2zRb0O6pd7S94x9c3
         kO8/sc8O9VGPU00q1lYKxdudWBy0iqtFnKNvI9auTN3bVQhB78mWg2wv1+vvhbGmOcYE
         2EL68mN43nUENEr6tLV0QUemmJ2uPl47jPjqbi986wvU7+BOMWguAEP+Tt69Q+ZVNHF0
         ZOUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wXqV35oBEt2+OuZdecO/ShqNMdvSAxq5Z9xR6lzggG6+i7rFpKWKcXR/hAl7A2PpDhn0oCsiyVdDDoZ2E@vger.kernel.org
X-Gm-Message-State: AOJu0YxwayPHmaOVb4st2pfV9c0l8rCg0YFyjDuERm6lGbar2qP9x/m7
	3G0iEqoMGfTCResjI1HEHoC+hjqlvk/T/ZXhkDfjY106q4RtDmNXqhLyYUOmErYcxLjN35n1hDU
	LsOAUkuftCr0nmGWIbzZ8FTTuRew+KKUuhDj/9vvkQLHkz3bUsXom++ZPifQMveO8ulQu
X-Gm-Gg: AeBDieuj3S5tlzvx2tIjZHPQ6bojcAbSi30bzqFYLjTOXu3RFFwwcB7QA2QrEbVRU27
	AKjhWQ62gejMJWAKxZKtDnczXePay/SX+SRs52A8RZWVnyjCPXh5hZUjqOhDjZWjWOr5it33t+5
	X6R/MnqCbhZMthm+SpwKsG2FMeum3WtPMXfjkBRzAUvyA3D7l+DQ72fcaeSDLhbZoUdua2+p18K
	tDO0O7CBldl6wBMidQl+nAMKpJh9iiJbWXNMELu0Y+IfXldaQFhL2/syBpk1Vwl6YCFNGOIz/gX
	NMGVhZscwj65k5f3mCkgZbez/Y2JGoq+iHVKrP8RpMs/etog0O/Cqi6AAc7FA5cjea1gkBf6EkS
	j34j+gGy6gB/Tys9HQbEnk6onMsajYZIbXUBQ6fOA1Azo189jsRDpUNL45J4qLlVGJBtmYeJPS9
	LfMwDSJ+k7k5R1hJD0QBuqcGtZZJU9pfTcxsbffg38lmIHow==
X-Received: by 2002:a05:6102:568d:b0:608:706b:b346 with SMTP id ada2fe7eead31-616f784511fmr3026417137.20.1776556029321;
        Sat, 18 Apr 2026 16:47:09 -0700 (PDT)
X-Received: by 2002:a05:6102:568d:b0:608:706b:b346 with SMTP id ada2fe7eead31-616f784511fmr3026410137.20.1776556028819;
        Sat, 18 Apr 2026 16:47:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0b6dsm14310291fa.20.2026.04.18.16.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 16:47:06 -0700 (PDT)
Date: Sun, 19 Apr 2026 02:47:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
Message-ID: <pxldv7v6iymoa7oyg5xs5d76atl7fliol4oty3urudvnkoaynj@4xhovegebszz>
References: <20260417084749.253242-1-zstaseg@gmail.com>
 <20260417084749.253242-3-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417084749.253242-3-zstaseg@gmail.com>
X-Proofpoint-ORIG-GUID: uhuu0WH0tzSQRSAWQuCrrVbbVYjzEoSQ
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e417fd cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=-fOaLbwZGdKy0L1vIOsA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: uhuu0WH0tzSQRSAWQuCrrVbbVYjzEoSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDI0MCBTYWx0ZWRfXzWrP7w7PXlOm
 upSqHIxmu89iC3NWiuA/juqiNi3YR+ssYZ5uVaUc/YJ5tqEyf2vkcedXmH5JQ4aqlSBjpeK00pP
 DqM77bire1CHJGCNxwSWLObTOT7R9uW/r0P2ImP2LHiJHvDVoH7vBkQnD6Z6swCLCms10j+wCEo
 c0/RD+iTAX8iTK6HqLyE1UyegGvWYEOZJUTntNC3wgzAwVvphNCG7orQQCfdnkYZ7iwrOivnAWM
 zkotqTN0DdlxaA4qfsjikNbUgxy7x3B+omsF8lyI9UE9CK/p8o5q/4dqu6h2xKgc8InZApHSzZ4
 MiQOJEeG5eydU7NLHIk+45y6v650MNEWNE6uU6Dq//jQzVsqCIazx8UfQAhenhG4ym4gr7Yr30n
 BSa0Weq1CPiVBbM/wAw5xB2DAG3E57mBJJr4GhGQGN8Draro86qHNEuuemXM2SOYEDXxWflT5Uk
 oI4j+/f6kpxjHlAv69g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180240
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103611-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A7884229CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 10:47:49AM +0200, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> 
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 907 ++++++++++++++++++
>  2 files changed, 908 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> 
> +
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;

Could you please move these properties to SoC dtsi (as a separate
commit).

> +	firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
> +
> +	status = "okay";
> +};
> +
> +
> +&tlmm {
> +	gpio-reserved-ranges = <48 4>, <56 4>;

Could you please add a comment why they are reserved? I _assume_ that 48
is NFC SE and 56 is fingerprint reader

> +
> +
> +&wifi {
> +	qcom,calibration-variant = "Xiaomi_taoyao";
> +
> +	status = "okay";
> +};
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

