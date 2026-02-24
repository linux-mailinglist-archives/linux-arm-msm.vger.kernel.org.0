Return-Path: <linux-arm-msm+bounces-93953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEGGB3R2nWmAQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:59:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C718509C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5ECF33055CB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9EB372B58;
	Tue, 24 Feb 2026 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGARFrV9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Js1rp2om"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62B236CE14
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771927144; cv=none; b=KmeDVVFTGOyPMDNRDBLTeKjAEwAppL+d4Br4oYIWOoxQLY4uIshTLACXVdEZhdXFjlzzIiA5UNnmpQeM0jicdIxOKW8kG8k20evOWv3q1D2HwwME12bi1CK3AqtBRnk1h1SRZsQ+NQaQo5PWrAcbwRmaMeEGJLkvpBQuAYDuQxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771927144; c=relaxed/simple;
	bh=QjqFWY+o2kWW5zo/B9w3edAEDcR8foX52todwiJavsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANuElaTvkYwmM8bwIrHhN30AC13dk30gJzLZMUiaVTLX/VLe9IjTPz04l9efpQwvBdVBSfdJIxXMKRIwGlbqHVRazoqTnOyX8c40mm3gYRWxk7CfJY+m36LG1GthGGdAYfKdBDUaD2Psxx15RFwYiKRaUvS9Buw0KwqfjLy4hvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGARFrV9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Js1rp2om; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O9sMtl1400506
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rNIdAlgewbsqMZVVKF1l6lth
	ZYqebEF0QEBiIkcCKm0=; b=dGARFrV921hiUVDFkQAVc2J4D8YpEFDAG9uIQ6Ps
	oTUyVGHUuD4c51fo7OhAKGM6EXabhdpWK/E5RPqh8dw9pG7iK8DNjuTfmFpTUWB0
	qn447itTEZeFpaVCDtXOEwYpS780wcbvqFmhQ42qksOukA0haznUQMGxyhE3a3Mn
	YUooBDqXbMWma6476FIZxWk6+2iLK71MUjPmFnePpq0U8qdDirkwye+4O5JWurOy
	bQ+fRKTRVPwOIDXSMjJrw8a6xY2eiO2Ct4l4XC3TRQex/elhzl+UfrWZ/ooxnbnN
	WbxRDR8csQlE8WJmZNhFJk1RSMhAfEUmhbmW2faVxKQzwg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9tpde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:59:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71156fe09so4270808485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 01:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771927142; x=1772531942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rNIdAlgewbsqMZVVKF1l6lthZYqebEF0QEBiIkcCKm0=;
        b=Js1rp2omfOySfFs83oOxT3KfqejSAf1NF74mfPXmgodWa7yCuW60nsWshmVNiVwu4S
         oma2U/6wb7RVIt83uQXZDaSdFGIYa9yap3Cna41iNv4njtAFSazjC2cH7k5BVwiMLFi3
         jqfOttE4SSuL9pnIg8p7r5VuW7yRjwAu2z6flXK8ZK0U2vGRyArWzFFkJlte+BAl6Mzx
         mR1QjKWB8qPIIElsAe3YBh8opgHi07CMTrGPJ+WquuhcZaJUq+EwCIVAiJZDovNcaPkJ
         iRvmho0pvGYsXFNKDhSCNWhojduR2YRQLkurFtwRliq1t19HOE2lgUWYQZ+uF8ZWov5T
         sN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771927142; x=1772531942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNIdAlgewbsqMZVVKF1l6lthZYqebEF0QEBiIkcCKm0=;
        b=bfvRdDoJFV2DcxwHGnvFmCDVPE53H9jyVEbuynuEnMGDLaVlFS8BxF6ky8qjymA6UE
         uXe5ffw4b3vuIgi3uDqzlCT4pDRWa1QcaRzPdK2mW73P+6tyHoQCivsCgz+ubPCuxx1d
         3tjL4KPIIgLl/zsLu0iY8o+ZjuI92qQ1TBSN839BZnb82yBfJfbw3n6WRdmuZFa3wHSe
         lT6sBA9ZCnOwL0/uyoaSZTEbApBPb60ikfCMQPmQXB2/esvowskeoWtIToVNWAoQHhao
         aPf1vbZ/Mvih8jX8g+YRAXheQBU+bqCcjBMI/A8VgQO3ZgGfldn3FTR9eR0MWx1fDPTN
         oaYw==
X-Forwarded-Encrypted: i=1; AJvYcCVIiF1sOnu2P7wr1+vJNWrJQTxPSx//7tW5wY1MWLAmQUt6qaDSik9UNATLgnic48rJm7ozGNcL8LlYnCC2@vger.kernel.org
X-Gm-Message-State: AOJu0YxZXJXkQj//lzUysD6IihTfbjEplB90nN900EpErR3jK5zBD8a0
	RmNp1nxTo29vWQ03U719BJ5emax0XJ00FRPfWnyX4TBWzXf+wMEatpC1Ce1DJYMW0hlpKBeiylW
	skw2tRu4BnAPZp3IBWAEcCfdyEbo5fD4Ri6Uw2jgpOSkJOpxvGsg3bY0QcgTybYnRLrQM
X-Gm-Gg: AZuq6aLKbc+BI6JbxnZ4RwjjZ3BVW3dfenLFiYMO/YzlaGQjtX99+f96H52W2kRKuz9
	tWy0oyrhgEHeTismkupxJ5Xe2c8YJYK/ViihS2aitpnSlc75R9qicdwBPFQEJtS0IC8L6aMFuPF
	3WYMLk04gmIOHWPbjOexRof9j8C5Z70Xv0QiptChVXMg5IxOIeva6HSyoTEoVa7LMkMm71hMQ2V
	yxwcWD9pbhr2CiGcROSOQXmFVfSoVx2emiGVPoMuIuLThsbbeMLJRVFINt8ledkBZW4EcGYrKto
	xgRYFqxvXK4a2QzVhVsYsMYhjbIIBYFS2ybfQzPgNbmfYouq7VlSB3NNV+DPuZQR8T3utnsfs52
	FGg9T9qql7reOELzkQx4DgtctWdAGV32AiQshVHMaW/OKhOVBehmAl8fx97IlPaD9npAGPI4oxn
	iTB5GueVtIk6Vxt58soiEv67WTsc3+QSzcJAs=
X-Received: by 2002:a05:620a:1994:b0:8ca:27f:3a74 with SMTP id af79cd13be357-8cb8c940aa2mr1505524985a.0.1771927141835;
        Tue, 24 Feb 2026 01:59:01 -0800 (PST)
X-Received: by 2002:a05:620a:1994:b0:8ca:27f:3a74 with SMTP id af79cd13be357-8cb8c940aa2mr1505522985a.0.1771927141311;
        Tue, 24 Feb 2026 01:59:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb3ea50sm2118481e87.57.2026.02.24.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:59:00 -0800 (PST)
Date: Tue, 24 Feb 2026 11:58:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maud Spierings <maud_spierings@hotmail.com>,
        "Colin K. Williams" <colin@li-nk.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: x1-vivobook-s15: add
 Purwa-compatible device tree
Message-ID: <vwrmgsmwmknvnnr4ohoivydzpkec7xyyujkodw3osnisueawb3@4oywtnu2hg6l>
References: <20260214-b4-vivobook-v3-0-3c88065bbf77@oldschoolsolutions.biz>
 <20260214-b4-vivobook-v3-4-3c88065bbf77@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214-b4-vivobook-v3-4-3c88065bbf77@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699d7667 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=-Yt9tNsTAAAA:8
 a=gxl3bz0cAAAA:8 a=MmgdznzwAAAA:8 a=EUspDBNiAAAA:8 a=LUVO1NtX9_R77zlGJLUA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22
 a=bHFXaHSPdiGCh6GRCv3g:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MiBTYWx0ZWRfX2UN1LDbU9u5q
 KKxXDJgWwLJN9d5G3Po83oS5I4IqX1vrrJlJ6GhuYAz0DVdkW/+MWzjjPj3+yTe6HfkIDb3pPxW
 CV7zl/TzNZCf0gnkRs8WmaH5zQ0P7uemupj9OYjiEtw9YsZ9eivORmXA4d31kM4CqScfVPngnPa
 Q187omZIkW63y0UTigrUayFrsHmzih3NJRD0fx0ol14h0BWXNLIgbbPu/meWJR3SuxxRtQ+fJMU
 QKOaDk2VMLBBmF1o69WlMpX7PVUjFxjqQQvOUr/yvrOmx5g9P5oJpNGRYN8NSNhrNGGeNyPFpfV
 dQeF6FCAsvU8sktcFVflvvoxOufpKA1wHewSB4qOtO6QSJq6ee6SUcaMYBqZ99dd0Rs+tUzO4qH
 VgMzEwZLSQtG/RRXDZ68aAv4pJdJ+S9YPaWk7X/kZMAIFxBhoR8LmVDR95g0Ij4W2Ce2Zr3v6xm
 9XZ7lUv4tgrx/+WqmcA==
X-Proofpoint-ORIG-GUID: VlKVppEv4Yb23q3D_FNyO8WRl_Kcrl-a
X-Proofpoint-GUID: VlKVppEv4Yb23q3D_FNyO8WRl_Kcrl-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93953-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,hotmail.com,li-nk.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,li-nk.org:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 425C718509C
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 09:32:56AM +0100, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The ASUS Vivobook S15 (S5507) [1] is available with Hamoa and Purwa SoC.
> 
> Add the Purwa-based device tree.
> 
> [1]: https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507/techspec/
> 
> Tested-by: Colin K. Williams <colin@li-nk.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |  2 +
>  .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   | 44 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

