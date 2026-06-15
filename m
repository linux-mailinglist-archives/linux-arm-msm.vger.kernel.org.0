Return-Path: <linux-arm-msm+bounces-113273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cToRBPSRMGpFUgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 01:59:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEEB68AC00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 01:59:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PCL8BRAo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="PB/fim1w";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113273-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113273-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9C2C304C96E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 23:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FA236F8F0;
	Mon, 15 Jun 2026 23:58:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECABA36E46F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:58:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567922; cv=none; b=lWVHcaRqd7lH2NSyLgmxAAjoD3rOFoF4SnjRDLSMzeCFbZT4cqFSPT5XJw0EWcemZiMGtzsqx6dE8juRJO/ir2YfF2lthc19zhbWJbuJMTe8FxdXfEMuJOCJJNSD0KceEUH+N4BYDKjbyxEEiHP763u/3IXjCsYArOiHfhKhmBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567922; c=relaxed/simple;
	bh=FVSgDtBPRhge+35IFB4aqXX7KeZouUbPFNRti7SgTto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvgcqtyL9zma9Yc7RaQkCC+sBvGBQTO+L9IispkwQCezx3jPuoOaf1q4rBObt9jDhxkqO82wyrFa7+6+MWwdvXMiwOUA00+kUEAALvxKpNlyV64v+eqoa0Ml5avacWSKyFlYsFeKa5EeMvhGZdMaMV3ezYs2hU58FRT/xrgWyFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCL8BRAo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PB/fim1w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ0qTc1453759
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=meNFmdKl6fC1VkSKF346OQk3
	19zoGIXldNOR354wm8E=; b=PCL8BRAopjceVsrj15RB0rfDQq3Kn9E2TksnmRT6
	93MBQ5LJjm7kiqmAeOWWA4I9i5D5jZdnswZ8UVrgEhQQKx3h8GhHd4o+aANLZ+7o
	XHzhFdFQUMN7lu3juWti05xuzvRF7D2ej7jgIMaz48/m6eGS0QRYWgG/m5r01ohJ
	ZlLj2NdeirYltE0flhQqwvlGB7n5GSnROYFm3Enk/mXsBjkRZ50+LgGPF4IbWmpM
	SwcdIyedv30POL1CLf2DdSt8AQyLVU/DXVFuaFlr0mDLCBfrZj2wU3Nqvx57w7BV
	UZQ/VKJxXDDeqnba/D/gstufkzFMrqv3kBr5g/vJ02FZ/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2cc6bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:58:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9159bc52211so381280285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781567919; x=1782172719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=meNFmdKl6fC1VkSKF346OQk319zoGIXldNOR354wm8E=;
        b=PB/fim1wQZUpFofgl/6FklROC9d5prPX6kthn02THKQ+x3SCPfNdKeS8DcMwohSWGt
         mi5b8vpZ/SWRHyBycLqr8YcptrL+NXAwidG8nE1fcSR/xFGHh4bLYaJQHLzB3AvIPWix
         WvhjxgdY69bO/Qnt+vxGckFQgeflh0D+OhEoTxMOpgchDQB1ftEQW6gb8X/SiQlpORry
         ROBhVhK0/0VnPixToOmcuvzYGdpesBJErQq7M50cSTH2Uwad6k2bt2PfR6CoD90giA+4
         KA84pe0PDYEHFXKr7+TcFikAyJRwvcFHoffdV6IEkRcz5Xpj2SJm0cJtWrhaOc/gfBRx
         KB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567919; x=1782172719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meNFmdKl6fC1VkSKF346OQk319zoGIXldNOR354wm8E=;
        b=UV1Wpw3EWmZ8Ab+krMiYUO9a3mlMMJ147C0B4qX/GxfwUunhJ9MoU+AeWb6vlsNP+K
         6cp98Bkm84Hdrc1X9pbS0I9Fehrv2Va/Eq2FgzgT+JVtBpbupeFTEwqZXIldIBDaqqpJ
         ecEc0+Eo1wtmb9dfena8ud12sPX7OV/MUWfDMKhWPVSHOQ8WhlAU7qyiuFvhC5XbHKsU
         IXMR7M6yU9HhYEslssqf9/NdLDQUVTW9X2F3wqfKNPy1Ss3GmWpyc2MEodoBpVYjlbry
         OjuZIzAE9NrfNxbAhcYaemdC9+dJkzDLoy1r5S25FewwpNrV2wHjvhrAeVGkomzgF+GI
         FsaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fB4r6KNiZJBupfaxg0N1kyUB4mA5YWZ0SSMlT0lJQCT7XllWfnfRR4ZwRokqAXJWMgOCyCg+UNiigySz/@vger.kernel.org
X-Gm-Message-State: AOJu0Yywu+iA8Ndc/7f8lBhKx7qAPSRsERV6Ws/fsjsebZQhqArouTyE
	u50D4lKgyxUB4DillgXn3g3me0YEWYkU5Sgj3EDU7adKMN90qOI5FYI7l0voxhZ7H+cO4dEj2EI
	ZUNSE9Nl4LMpFRW/xcdrN+x6LvoZa5XWEouWL48+v+lysq2mhmsfoiNFgQW6Y+T6GBHO4
X-Gm-Gg: Acq92OEbn51E/2tpkMGdurwWTpflK3Se7FexrHTeSFI45NEP83O7avXmCLaNXXqsnk3
	mnN8PVL7mvLooD1HU94jgehjYZUSrFk4DWfX8xCG1sV/N3ZPeOb2x7fDZFox5N4WHv443U0jU+k
	dZo5qm6vSv4j7wpD74L7zaEykiT+/UkUP6oHewE26soIQmsq6Gd5P+zoYp4I0ANEZc9ezagNPEu
	Pl4dOxyPne7jAnoaMw1/e3ONZVQFT2i05B+/gB+yKsv+ilTci2oWW8zocbsc+DPlRf72ulebFvd
	yrWVgrN2nuEfUHfp3QMqojbQfozVZe9yo+0p6AuKou1iEId+v/jnJn3+GZL6e5JOWDm34ycAQ5r
	0tkB7vk5AIioGFkkUzXgP7PPvkkAtFHgwf8Z/giQWzWX46MUVtnqW3cP5CEIlzGy2lfZ84jtNPv
	+Mw9kPHbVkQQkxdtYwFPOBxGg9jiQ7JAiS/lM=
X-Received: by 2002:a05:620a:8909:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-917f1c50c74mr1974878685a.54.1781567919337;
        Mon, 15 Jun 2026 16:58:39 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-917f1c50c74mr1974875685a.54.1781567918860;
        Mon, 15 Jun 2026 16:58:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19af27sm2417531fa.35.2026.06.15.16.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:58:36 -0700 (PDT)
Date: Tue, 16 Jun 2026 02:58:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/6] arm64: dts: qcom: pmk8550: add VADC node
Message-ID: <jw6qx3reertq4opa7yjz2irjmvkgfqh5ad6ksi3ne7wg3m7yf5@qs52e6bwnamn>
References: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
 <20260615-topic-sm8x50-adc5-gen3-v3-2-216a2b5ccb85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-2-216a2b5ccb85@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfXzEipCfsChUxl
 dw+QEVhAmhAwlcpLs+lGd1i3d5RdmNGhh/sBVAd18O6tlFyfz3pFDQ+JwqZgyJQStA+Bftbn3Qb
 Ae8smugwl/J3zFWpmwhvmRZyom5h8DdU6J6QpQaaQWZrAZmCZmcFLNqmVciqTWYmEgfiyuQGS54
 7MT3SDLhcBcJ1OZfsGbLwGCRl22L2HYkp9fHu+HLvhcDscmXkBnRlQAHjCVi1Eg6u4qS/fd6MwR
 ZyJ79cpu0MCx9Qw+vgPClvRw+9YJwkRcyRfn9QaFi2Llar4RdBX+VNkMAcL+1GpTQ09OJXF+Ysm
 AqcSEp3GvLUzMpwau4gitKVlGGre7eLr2rKiCGTXGnD3PhJLA4QXTedHSBjh2cmQDG1UGY7/9Qo
 jt7t6vtK+za16ylLB2PFvXCmhXlBm2psciDD5rzNVc6+ZvQ7Yt5vRZZpbUlG6FaSd/BAjNx421T
 kNeoQwo+Gh40qmcapxw==
X-Proofpoint-ORIG-GUID: 035YRSdDPEeCM55hNaw2k4kbnB4IZdT7
X-Proofpoint-GUID: 035YRSdDPEeCM55hNaw2k4kbnB4IZdT7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfX/Wnt9h0u+qMu
 DCtaynLfaHqNPVLK78xPztFLRuJa2gy7iaozpVZwGpHO500wlRwe0hjzlkkp22VZxQ0O9cr6Fv9
 YZoh6AAOLRS/lLZ2d7wWB5eEnQEpW7A=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a3091af cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=etDZx0vAmZIugf9a0wEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150253
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113273-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EEEB68AC00

On Mon, Jun 15, 2026 at 07:00:08PM +0200, Neil Armstrong wrote:
> Add the VADC node and the initial pmk8550 adc channels.

Nit: PMK8550, ADC.

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmk8550.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

