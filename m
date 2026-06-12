Return-Path: <linux-arm-msm+bounces-112939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xN9yInwJLGpgKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:28:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE1679CF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:28:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W+qV7bgh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hnHulXb1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112939-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112939-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3139634FBC0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 13:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193523F929E;
	Fri, 12 Jun 2026 13:21:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE51F3F6619
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:21:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270474; cv=none; b=NQJkBQJlBWkUprCjjLp1dpiaehI38YEK3efH/2jRsxs9ygp6fHhiD+UVcaitpd7S4a+GAeuOwQeS99dxaQICpiP1Qvo9+mNmpsuVLt1l3C3K8GpMge8/hI9kHN6CUwehbOt6/ZNW7hTpzAtaCgVb0W4BLstWFmpLnhQjoIKcbdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270474; c=relaxed/simple;
	bh=vy9Su2m4DmwOctrPRiAwTZvTKMsMba4B1kY7ipGYKQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNsIgC65dEdRjQDvQpQeDeqaFio3JbBl/HphyjzO/HSHHS/q5bcKywUoWKkQb5NZeVtwcNYTH6Pdn8aIkvsKJzBGezKqLDRzZ0dvsIfsoayL5B5U8h53w1CNk0+8+O70IdLtnUsl98cCS/scWtAISiaV3ncar9etXFTapWw2m7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+qV7bgh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnHulXb1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj7Kq3721543
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XukqHtEo3vmVMvPKYfaF8yIm
	I5hN+w7/56VOovRhwkw=; b=W+qV7bgh6VpTDqSKi3W5BsAs0y+R+mGi81qqxv6o
	jW7p3uTongRt2LCPIzzgwCL6i5gSrIsyGvHSl6vn40INI1jBz0AcOw9VAPB4ipuY
	9gURXwd5Lo3GifuHaWNgzGKgyfx/p8P9r1wHLgxFIf/KRW0Vwq1rheLwIq1VV1F8
	st7FuXsnxF1+KjAyJTn4urrulrhH/iKnt1f5GjLlT6T52z1bvyJHww2uHTEya8/u
	X1hKSuuHGJXeCAsBfFJh4YuroF91RImv+XD3TRrB4q+fHSiak5UFRsRc3ZJcT+zd
	cMPI5RMLg1y0N7oem2+zNNgNCkSPmiPnNuQRLwiQ50lhbg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbke5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:21:11 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7e5ac48so1074096241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270471; x=1781875271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XukqHtEo3vmVMvPKYfaF8yImI5hN+w7/56VOovRhwkw=;
        b=hnHulXb1TP4d7athtv4W2pYPy/60J7DCXlYNPVwCB2eFDULdtXbijZnEhTZ+dHK1sH
         QMHQ1EHkzbac/unduYRrCW9LEefBVylHc4zIkBYBRM3fLeSmpoz8Ou4KXI1H9iSPed96
         t5LDabAZj9Cq8/b3hckeJ7lF842mxQjj7gHSVWwuNO7znJxNzWTq2DIUgsQaEX6hqilG
         KivM+64hjQMBW+F1ROipfhAgPxVhPVwwhCD9ytll8ydBvJ91wBOfzP9kRhRVp8PeW/n6
         k0K6e7YCrU1zVnln+a/P8UJfW70F7gBwOxkpgZ6KfS7IDoavo8KGUUX9/+WeB/thwVB1
         KlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270471; x=1781875271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XukqHtEo3vmVMvPKYfaF8yImI5hN+w7/56VOovRhwkw=;
        b=NzEoaIHFS5v+KPNj+p8v6dOQmmoxF8fK+8fSDHR0Gj+gcMZXeyFmCVVsok1Avd+hdM
         M2T94hF9FM2m0hMduECeizAeWUhuoFE4Ve5nLFYuk9QtkIFq1yFQfTNwMqeUXBhRfVlR
         wAMWeApKWGrtbi4TjW36zDORoc1r03u+qq0gg7KU2rJZ2bDAnTgo/+9Rw7zL34/6hNup
         zEmYr0Op/g3ZT1BCJfo996JnErC/B/Wmh/mNvD3ekoZkIzBrlGpjh/R1BUaBX6m8GcR8
         LBLUNC0XLT88+7ZREPdIljjdNNuijhZIqNgH/2mRdn4voPOKAFIJUTJR8LMvRrlVBWD4
         pJhg==
X-Forwarded-Encrypted: i=1; AFNElJ+RNSV9of/C2D4cj5/R9hUP+FMkeED2P7NdRl4X/egTvtOlb00FkY4YjC2GUfhGJ5lUxADz4FKoNGMHFnIC@vger.kernel.org
X-Gm-Message-State: AOJu0YzAOmXeCgaOI9Y1TYEfbv3OkOeZJU1/21Ubhwj1OPTCq4QA9ehd
	S3KT0kwbbn2dwbatFpP+/logAVJeA6AxmmULTN6zDSL4Ov23GdaftwtSHQAM1+YVz6eqmNCf3an
	84TPlroByjAAf0FOdGEAcKc5n+bxqKUk9Aj3ku1dBlXITv1LFfc+kDCv0zX8mz/54zr6v
X-Gm-Gg: Acq92OFyznUVfF5sT3BD5gAS3Sf+6DgOkuvgsK4VkBTDYCDqHeUoV0W6KJpKL4KVsTb
	b6Jal3z5iEWlLWp+QC7J1V45oqDCIxVU2pc9znCUT+3ZRiGLYREsNbb368LbHxcxX5idIptp9Kw
	weoOJg2sF3EA/2J22zlbzyL1dAgJd9gcOdHfg7emtroSh4r5B4zdU6a4IejcUzy9cHSWHIAsRVx
	AbvCgQWvSsCToZVOQzt/hiUSHS6HXO1lzKl8HfsEcc3cQf18vJgG6Dt0E8QtPrtj3XQ/ZhVBlyf
	1FxB3knNjUlNEQMExqRoqm5tlNoO/Ok/7DydVyd//FSP+F6jZMkUz31jnvqJeoXGH+kKD/fEAxF
	OQO01INvfcsJGowVsDUZsop3/9dHEuYMzRX9prUIrPj1QmB9GTTeA/i2eyrNNYgziwDsjLQh9BA
	Mqc7x+2RadIImaQsb+1xBJ4M8z+RkvW/TELNE=
X-Received: by 2002:a05:6102:449a:b0:631:4e9a:bab with SMTP id ada2fe7eead31-71e88c5ba68mr1408938137.18.1781270470820;
        Fri, 12 Jun 2026 06:21:10 -0700 (PDT)
X-Received: by 2002:a05:6102:449a:b0:631:4e9a:bab with SMTP id ada2fe7eead31-71e88c5ba68mr1408894137.18.1781270470445;
        Fri, 12 Jun 2026 06:21:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm5867081fa.19.2026.06.12.06.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:08 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:21:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
Message-ID: <yldq3k36hyzwz33lmw3oj7ix7uzs3sl56wlgo2ho7sosjge6hz@64zpgubj6j7t>
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <20260612-kodiak-cam-mclk-v1-1-fd294ff003a2@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-kodiak-cam-mclk-v1-1-fd294ff003a2@fairphone.com>
X-Proofpoint-GUID: RHTG-TU5T7VLfl1mDHaq9zDsUaX0n8kr
X-Proofpoint-ORIG-GUID: RHTG-TU5T7VLfl1mDHaq9zDsUaX0n8kr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX5QL0n28GJTuT
 DBBJ5V6n+yB/0YbESycVfLTyv63TSXSTASFAph6coXFkHKeR46jzLk+VlIE8x0JBiM8sTvy9EsF
 p8OfhGfWljohgzDjypieB6PRbDVR19s=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2c07c7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=IT9ScGb9VJkqv4s7YT8A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXzuvlVhGA/36J
 TGDB1cWy3wqmtcyVm5J/vw8xfnz8LTc2rdVc4AxsRVPzidaHIbiAvRghvIurZN/OrY1NEOEr/P8
 MTVjFuDd066EN8Zv333wTpyCrSJOIYVQRmMVOnjt9sArO2fbCzZzQShX6MCezjXxqaCIgq/OiOd
 /ia7FUuyYLae4w+bXY8zHXkmx88pzHyQ9hgvHCr7sNFBSg2XRu6X8ySnN0DY33RkdsyQT3t6547
 WtzZEGdDHHOt9TETABvv5EXdmBf8IBrGQiZgZyvMgIyobO1xIkFpgvZMRPOKysPDD8Qq701Krbl
 I8XnQkcl4sLhLBau0CGskyP7cAz5YybPd/V75Hcnf8jBICC7juR2ShLVuMWdfVGo4Riqyp+JT8A
 WFa+DSVIRcb6EUh8gPiFNF3ekcr92AxvxBekL6EB/MHFfF8V2jIVkso8LsBFEATXa+ajVVmhpqk
 XsK/H5XFwgAr0T0sJog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120122
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-112939-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,64zpgubj6j7t:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7EE1679CF4

On Fri, Jun 12, 2026 at 12:55:51PM +0200, Luca Weiss wrote:
> As documented in the "Devicetree Sources (DTS) Coding Style" document,
> pinctrl subnodes should be sorted by the pins property. Do this once for
> kodiak.dtsi so that future additions can be added at the right places.
> 
> No functional change intended, verified with dtx_diff.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++-----------------
>  1 file changed, 691 insertions(+), 691 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

