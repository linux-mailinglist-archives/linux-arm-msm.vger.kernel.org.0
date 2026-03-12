Return-Path: <linux-arm-msm+bounces-97204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD4QEFq0smmYOwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:40:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 954C2271EE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53E6E304A338
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FEC38737E;
	Thu, 12 Mar 2026 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qa+INA0V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LB5mbZpp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F248347505
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773319126; cv=none; b=CWQuOI61A9n0ZSRq6KeQzErnftR/bFn/c5h+ea/dTNM8AvbL1aalRGQ1SAgkdTryU8IqIWD0HQgkJiZzWHd03bpwXf8ojefvGkX00zjHnq/hRRLZP+WOQ3zcw+oNl7hFFFw6+rw3X7snee7qOVeO4OZ3zG5+dA4mHfvAPoYdrUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773319126; c=relaxed/simple;
	bh=zACpLgsif1HX3UIVhszs+cVidIvE8f2Jr6Vp8AT0tCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxfTF7WOeT0w+9gFjwiOC5olr7MeljpLe6dYIGaJnga3VRET2llRFrf122PmQFoC8wiYsdYftIQF5m7Qkm+CId7LQXN8NvFtLARgfQ83dPynmPoG6JT8KlUQYUzo9QhcL2svWy/vLhzCmlzp9Cya1mD2ADUVnKRSS9LeJ2cw/DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qa+INA0V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LB5mbZpp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9ANNN3666499
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VpQ4SEdwxBmvueD5t0DDAjzG
	WQB6ZzRRo52i7ZTd6CE=; b=Qa+INA0V1nSQNFKgzWp/vuwZ3Ke0fgaJkZta+ruN
	cSnIUPzWg+09Uc4eBE3c9gTEJhZe3W2CLbcT/96KSbOPrHJbjztasJ6OnDa3VVog
	4LxCAv/x4Oqm8Bv3JkhjSKksBtLG93n1I2tpcS3LcBLad2NVb3Nt0gUh/oyTeQD9
	+5puo7aj4F2SNQPnjH4muKL0kzICV3AmvOuxQLaV9nxRoluLotyJQJyuUmJEyIah
	Yi+8IbFVQiYYbOtiSCf9sFgVDqoMpQ+UMfLXzGtv+MDL9HzaXZeQk6ulgg6sPFP5
	YAQQrMCY4T54z2XjaNCqES/jrbvdtfFqNE62Oabg2Wy0Lw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60j3fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:38:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd84943c76so1444604685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773319124; x=1773923924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VpQ4SEdwxBmvueD5t0DDAjzGWQB6ZzRRo52i7ZTd6CE=;
        b=LB5mbZppLlA/ylE5vu1a3gDUXvD+4/qrKA/6MZvDlcZSQ3vLdZ461vVoT51GvMtoFV
         i00Y83JAAktqNUqNpSHA7V3P2FUOnGlkc48hzpn37g15zSVkZi60qKrjMzNda4cJUFGg
         /KvI83/rqAvChbAOo68XvIDYBAk/dVTTSZdct5pZITOJiQyxrkQY9fXBxxfAlIbDMoea
         5eRUhYiI+d4PRxB4dtN4Li8y6p7zhZWa2GTHWZQwwtRjVjWql+zETWFEbd3Zerz3lICx
         3Ia6gnTGfxte9vVLUPOe+ms/8nSQDVx/RNDkdD4iaVY0mgogMN4uX6RxxVC/mRemTVKx
         ePEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773319124; x=1773923924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpQ4SEdwxBmvueD5t0DDAjzGWQB6ZzRRo52i7ZTd6CE=;
        b=m+7bmUwp2T64f7mjXeA2yeX6D6LLNcJkG32EHZirnU3Hh/7Qbiv7hzmZSkeQMebPYs
         cWwrSMz016a54spNy3+U1kbajLz6EIq2bw6RvZ8WnpVqsQGjxPg1a3/4hziU/bO8W+WS
         GnUHocE5k+5G3EM08pZGNt3JozAOrUKzZIuyjme2r1IJfskq41jdRT3odRKspEy2V54E
         iMSX/GHXAhOJP1qGN+6rIII6njUsFG0j84EG8ST2EbhrVWlaDpUjaXRgadOTfdGEMIa/
         FDOmOmsNNp8/R3UIa2jIeXWRgNle+5TI4S/BrKCg2rox4B5kAmDuylHlwiASMihF5FJ3
         O2MA==
X-Forwarded-Encrypted: i=1; AJvYcCU1fIGBH++/8V6PTCze2Ff4FG18XzSPb5V6/oIFLlDiP4EnVXk1yLIi9JLMjnfb8WrRpPjAprffd7Bhlo4o@vger.kernel.org
X-Gm-Message-State: AOJu0YwOgAwPge6XOOn+6If3uvALBPePCSpv/axhpL8B7JLlwJhboKzs
	hrAff3EAG/V0XAUQjLfi/CpPOn1LjWFHl2+yQ1+8GkON4JSigCbJV0swPs4946WCwuormz+2HBA
	cUzZF1qNErfJzq3xTxFcv6xyXLe3SZx7Fs2py2VSukPTqUSqQu31IfhJpQKLOXYshXMpL
X-Gm-Gg: ATEYQzwtAsdpqucq7r5s4WgLA2Aop9LUO8CqffX06fQlsBAwscchhB3YmOXbm8lNuhu
	fD+Gmj+AyJh3CS4eSrCaKPlB/CY6BSnoUpLj9whcUBHU/LqjHr9BF/BDHIJYFxaTpgELRFnB4tt
	dx8VVKsL0i0vDJ++phqMWtKq22BD2XvgTblvZMhq5wTKfaRAHLNcEE2BJetlnCC2wZ5XGpOvjH4
	kjALl+m34rG5BMSScL86ES9adgccOrFzgtO3sDibXYsmQLztT3rFdHnNvbYF7+1zJ80EZfg6Lta
	l/pRXwXqBW8LxccTNFL7i5nbo7s1S7ZUhcMrucn5Bm+XzToyPI/oX29g8TW1DxT5ftoEISf3Zgv
	6fl2+L1Mlj/GqQOPb/z9GdCRIG4tZFs9t6NF1snVzq998e/IjyBJSqxHbeQC81vpGrk9yRDMg98
	cUo0XndMCtwQ0IjTRK8u1DFi/68zYLhcYPfD0=
X-Received: by 2002:a05:620a:7114:b0:8cd:9405:9662 with SMTP id af79cd13be357-8cdaa88ceb9mr441487285a.36.1773319123623;
        Thu, 12 Mar 2026 05:38:43 -0700 (PDT)
X-Received: by 2002:a05:620a:7114:b0:8cd:9405:9662 with SMTP id af79cd13be357-8cdaa88ceb9mr441484485a.36.1773319123193;
        Thu, 12 Mar 2026 05:38:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636675csm956770e87.74.2026.03.12.05.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:38:42 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:38:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: agatti: Add IPA nodes
Message-ID: <bt4tv6weylpofod7j4ft7ugzupzjqqxx2eupaxexyoildmtzns@kphfbbizssp6>
References: <20260310112309.79261-1-wojciech.slenska@gmail.com>
 <20260310112309.79261-3-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310112309.79261-3-wojciech.slenska@gmail.com>
X-Proofpoint-ORIG-GUID: DqCTge83il7aoaecCLh5woNwh0yrcxal
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwMCBTYWx0ZWRfX3CCSj+6Qfmgg
 fdnNWf9H8fOemiaURX3jM3acllQFFpkJwuGicooIikZzSI+XiXE/FeqBrX0rGvfRxVXGpWWr3sw
 PqRdUUzZVT9pi2UK5X0e6t07iBz+4i64tkmY6bHqSUx4HgObr0se/KpmR97SLkybCwOV/Y7/0me
 cFDu4ogwStkJJHR9y666RLx7Fs5yB40MetcERq9NHXaLwg+LkGMjhg5rajS159dKrXDU8HfcAfN
 QXMM6x7+CmMEAEL7cbpCrZHp9sTLdjgByza33KkGTT7Bmo90hO0mRtqZFFEc/dr+ifsNJlh3/Nv
 nCwWm+RmL7ATG21ScWpSOd/E8c5sCdlNR3InUzvpuZjkWPxb2RvyCkmSUke39i1L0NUAsOaIDOP
 xu33umBAzdRFwHGKGjRr4vhJj4KD97/HtQAivS38kvbYg6UdJVgVbainycIz/8nmVeKCxptStF2
 j0/IASqdwuSs38JQSBg==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2b3d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=XksiSQqrTY_tai9pqxgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: DqCTge83il7aoaecCLh5woNwh0yrcxal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120100
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97204-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 954C2271EE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 12:22:31PM +0100, Wojciech Slenska wrote:
> Added IPA nodes and definitions.
> 
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 53 ++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

