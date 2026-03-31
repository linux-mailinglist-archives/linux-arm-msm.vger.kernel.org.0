Return-Path: <linux-arm-msm+bounces-101114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP9DJOwPzGnGNgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:18:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0F36FD88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C83E30714DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443F2426D26;
	Tue, 31 Mar 2026 18:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOE+muqR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEGbFbJN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B07369234
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980124; cv=none; b=QNq3DRvlOmnuuApuw8Xm7w5AtNuVd7kpjaGzsoNgs53AuM+od/ef54fxtZwozcvWpjzPea4NWX9EXtsO2mu/hmyj3SJ5++48p+C7hOezabHPUdcbqaGVcdw9rjI096Lzvq6WHDnPd8Kc/4DTLZFehqcHZ2sgRy8d+d4ziBCmr10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980124; c=relaxed/simple;
	bh=XwRHmY9CtWZ4J9zShXrXIqOJ0NZfoixesZforBPJPPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsKprvE3OUU3nFNbe3m3ODPFjVP5SC7Gifxwrv9jxWwWiOmx/P82IOfgbE3HHlggm2mhFY6m0GDQhkY9pSlDQB1qvGo2jahmQmqn1peL5XcB8BN7BAa17mFT0MY2SPf0DzFQokWF6dvXcmcRfRnkGXLqXvOiLvBtrhvMxJe7eC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOE+muqR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEGbFbJN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdhWj3926865
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T/7RRbF73vzftBQK4H8lFwKI
	tX5RjrAG7T4uuMS2qo8=; b=jOE+muqRUXVIISZDQSyq2VdrdlRqGxaAeaxsfpUx
	XYNyjLaZiLq13SgmA8OC/H9P65bRrQgabJ0YbPQCwIHy9dLV+NNZC1TQ16XsHOnY
	ro9FyLY7rnqSsxxmRBMTLeFLsmJph6QZ+kBC/XMJ78B68PWkxLE1cNNYOIe/2RiU
	IRGeaRHlBA6uGorMxQClN5yf3vtBDxTp0LPHQn1XCEtFbOgurMS1Di6AM/3EAG+w
	ICE7BYp1pk3Ay62KMbwlsyrTxxdyyTYWT5omL2sf+tv7MUtiGX1LgSxfvIzsawuS
	gE+YL+wQY6rzogEQlkORxSJA2RkC5R7Ox7S9FY+W7IgTzA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b932gfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:02:02 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6055b93cf47so1390210137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774980120; x=1775584920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T/7RRbF73vzftBQK4H8lFwKItX5RjrAG7T4uuMS2qo8=;
        b=iEGbFbJNH8M7aV5CqQ5G/G+Ot5jgRtLe0JJdl0ac4FDiWKBO8TaTyKqYO5AiTG+jYJ
         6u+wJkPL/FDU+ebTTVdaBKMFNvFfkkh/fqwMxA4avd5Qdb6ValfS5LeJgnp2z1KrEtGA
         XE9kGQeAcvp1zDP5e4KkRvEK581q7CqNUeJ/2QzdXaU1Xwi3XDiarj+s7ZlUgexxMYEg
         XNHg98bgvoDnQqD8u71pAz2T23iW00HQw5orb1rajHS0FTgkO9GcoKyjFL6MyGS529ng
         3RvM9u2rvmybjv5a1aZdVEnpF6Yh5F/ylaJxKg1P/Xd+O+2wgbLxP97iicWXju9sZNGG
         Gvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980120; x=1775584920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/7RRbF73vzftBQK4H8lFwKItX5RjrAG7T4uuMS2qo8=;
        b=pvHVZuXIHPHu7sPScdb2WIvTBmLX2U8OtIFweJOOxz0q0LK7oxtQ00I9K1kSEC0dYD
         aGGt/I/FnQSqL/Yu09Jwo0z5rVjWOXosaXauNyd3ee4MR5TxYd0cTmWrD5IvVmQ7Dhe6
         /xODdrytAm8CI4Y+mvrQE6imOzkajjs4NkOcxJ98iEPceRxkd9nmJacWsDNlCooyhRjK
         VDYOdCR6LIr4U5IjQhOw4k4Ooq59Iw2MT2K+abgFT6OEOnHOFqLDoJGtHmjEROv4HsOy
         MvubpRdD0WtunpP/oY34fL5xhuOYQNlXMGNlGpbcMqyn794H/7mxrQ5guM/5G7cDfsTU
         +F1g==
X-Forwarded-Encrypted: i=1; AJvYcCWeZQ9BV3r96ksAkpQZuVSKA97XvXv+Aznube8b90Y2+/T1yloLwRyoY8LeYKaj69oXgS3UrdLbHI2JJvVo@vger.kernel.org
X-Gm-Message-State: AOJu0YwacFyOf4jctBCr1+D1Jr6PbgY0PE3zbCpp3p4L9NA1e4Aftcqn
	TgUadOq1I95HeJqOTQBcZOQek59cknBxuPUJiACTE5kObz2H9srUAk+XKJPI9dlDGKanf8qNTXu
	NH/OOsEcUQOFjO8Gs/WPAUb1dLnjT4sVMJ2R1wI6NGVRqY+paadaHh/N3t5Fv+tM2NXFOr21Cdl
	Zk
X-Gm-Gg: ATEYQzx0iXdSDhCqcohsPKAazsOT3iZEwdHJ376Wh7/O2/DSYsQgrjlj0SDAbGXEven
	tpQRsV+1Rm62ldMmkRma1TUcJzlzyEzmfStFgbxfJF/B2O67pXI97YEbCIHexjNLrzCfwghGan6
	0xcrIeyDdcyiumHSBpYeF/7PzO9bObgRQLrgIViznxseepppUIHhGrCos3Sqfa3S3ogQ67ul+EM
	z7NNVitBcnwuRz+Ujsx3/XBMFkEw/9axlG/QSiZoHozyasUzqtTO7+S5XfZKFCtWATxefAQ+GyF
	RWggH5nJLqBR+ADyX4KAJNWmQE0ISa6RDvQZPkeaHSJ0uqCtelyKXjT652uqcrIKy5Y71f3McLq
	MpS/R0AWm/4CTsA8f+tj4QlADVeIPWSMaZA+y6FgMxJ07bc6VpJx/VhGb8G3c4LMSqNYa3d0l5N
	DKHEGFJdbrx6lW0jgeZGyPUfGft27LMGPgr5I=
X-Received: by 2002:a05:6102:4192:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-60567dad7bcmr125089137.5.1774980120181;
        Tue, 31 Mar 2026 11:02:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4192:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-60567dad7bcmr125038137.5.1774980119664;
        Tue, 31 Mar 2026 11:01:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83892035sm23548101fa.22.2026.03.31.11.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:01:58 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:01:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH RFC 2/2] arm64: dts: qcom: eliza-mtp: Enable DSI display
 panel
Message-ID: <mz7pt7jlcn6koretk7hoigdcykonzvu4av5dcjmd54fxa6nvqg@yehg57ubl5gc>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
 <20260331-dts-qcom-eliza-display-v1-2-856f0b66b282@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-dts-qcom-eliza-display-v1-2-856f0b66b282@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3MyBTYWx0ZWRfX+18N800c8Krp
 Y7NeqPuA+53JKNrjtofWA4suhW+cpK4ukex/Bwh9N54+sQWf8WjOen3rr9bvh9tteZYcGeATmME
 DAxUtquCMTLygQT48UiGKHEgUmv0jVirULCdFzugDcaFR+JDx6/EaYtT4zwi5KRbmVgknUVSVfy
 NYKIQ3yJfSqZUh5DS4Yk2Kjg+YIrhozl5uh+JeP9bMGFu/DO3oXckGVphJ+DG6IclHlUfFAWVgX
 uDwHotX34O/dnin6HmMc3GLUyGskBVhjA3MZdz8pRkNiYNiAmCOYlbynjksNGV9MgxZeca5FZNc
 vwPSDGshP1gK74sGrpcFl47Ly2fdg++Rn6yZe9/5PNIQELcNyDJsjcVOoiQrcvOM++RoHywbxNE
 6/I5NGJVkPwXTrXcRyUSNZnlFoK1orSvnNM8WN4CeyTeGbGEQdYXZXcXxEc6fzmQ35qoLhaKLfy
 plbYt7KqmtX7IjaAMkg==
X-Proofpoint-ORIG-GUID: M4HsQ3ZjegGTc91NbbY-zQDnLYU52xVz
X-Proofpoint-GUID: M4HsQ3ZjegGTc91NbbY-zQDnLYU52xVz
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cc0c1a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=PGz71x9YbL1CjCHebeQA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310173
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101114-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D2C0F36FD88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 04:02:50PM +0200, Krzysztof Kozlowski wrote:
> Enable display on Eliza MTP board with Visionox VTDR6130 panel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

