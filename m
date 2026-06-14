Return-Path: <linux-arm-msm+bounces-113050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PfTBEVUaL2qc7wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:17:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F65682462
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:17:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V2Nd5EsN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ACPIYfcX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113050-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113050-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19CF930075DD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D5233B6F6;
	Sun, 14 Jun 2026 21:16:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E392882DE
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:16:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781471811; cv=none; b=QPLJMvee/qjrVI7jPR0mW/T7FaaiKIvUxugtRVRkRLWPPYtLPEOsNIUB3yqXPykqqWVCsBJQA8+2MPbFo6KLgXJu9XyxXVNrkJ0Mt1ndsQQJbaG+h9g3uOKdYgZmYdKUvZdNNfqBIpAquU0kwMZkA75IMqoS+nlq9t/V/zXL31o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781471811; c=relaxed/simple;
	bh=OnQN8rk07OguiwIShipBYJB87jroy5ghHMUG8Q/P79w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6G0oCefVydvYZUsdWeUNa3l3m9b6LIWTQ4VqVH/bbMMYPx/r6x8UgJULZ3YL0mKO9IPOu4vkxdqQSI4tT9CNSaZiHc2A4jgkRZqWTzuIcKwhr6QUDMbbTjz737tJmUSTE5VERETOg16Fm22+yEXFvbieKQNsPkjjbCSSiWTDzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2Nd5EsN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACPIYfcX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELEb2K2731070
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q2kynjv38blCZw5JxOBaBRl0
	OMUucc4OfZpGXP4Wdi8=; b=V2Nd5EsNyFNAA9E6e5XYoiRBaGQ23Hk+/aPbuSJ3
	y092w4rVrEeA+M7RhjmzFcECfD/xaoiie1JGf+kXzhLP7IRJumPkmDgvaj8Mn1kQ
	WLaMlMXJoFBRduLanrJDoql1k/Jvz5VrAojEPyQKvDwfYfUXKZyv+9y+HZTeHhAy
	CEJEK4thWwZm/V3UB6ZhXsfLxNTEiNIKHWWzhCx8pvAZfElwrQ10p18iizA/U9po
	eMGBAAAOQ+L0+j79w+MH6czDHE2wttfbPZiNtYuXjCSDpcyB2alatUNuqD7J37wJ
	pJJpIxb9pogM1yqzgZyt+4UjQTXtIz5lEc0/H8JVIZuSJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wvj5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:16:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9159c4b210aso431444585a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 14:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781471807; x=1782076607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q2kynjv38blCZw5JxOBaBRl0OMUucc4OfZpGXP4Wdi8=;
        b=ACPIYfcX29iel9ORubVSgMwmNoJaGGlbpYuq1iX+NJVNh1pvX1sbCLwBvYpn7msLRP
         JUfvsh2eN1DkEJtNBlvM+d4czK+j3oT3/sqcPsEBX/x+dHNPDnTxu6C/PeC+51sEU4wd
         l8x9R2oYJxNANx5gYWkkr+5vKqhYg1pQ35q/vcrR1U3lzAMcQP0CcUL7q+O9+frYHfUs
         tZNwDOr+ownaotI0dA2W3AnU97Uyrg2iYdUDV0mFbv5BpxXpWUP6fm96BF+FOSsdqLvI
         bNxPm3O4PjDS2q8fHPiblM+fOCOvePOb35EwcQJ/ossDqSHwvbE36wrzyslFyXfK5Q+x
         SDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781471807; x=1782076607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2kynjv38blCZw5JxOBaBRl0OMUucc4OfZpGXP4Wdi8=;
        b=JOdm8Pj/63ER2VyPVyuIZfgW1YBGh2OrvfFphbemZCd/3o+T9fMLYt9w3fwSN0qRds
         sSkyBUbygs8wMGJqSVA4GhZeGBKNyMR1aChV3zksi/fiVmWBH43JqcgAS/oKmadNxhcL
         6YyEmhDIEyjfFTm6lbSnc9uF042NXX6oFdcOvnfRayNtykkflqulW0KT/2jCgV48n4gR
         MAvmvL2B2QoMQXJpScRCzB/88ybwqP2pUSrcWRI3P4M6Xgj8s9nXH+wmQjEV3GyirIz8
         2MvLMEanvdaKZJX9VbweMwurzZuiUoKPQtSh6+vOeB1fjJGGKjsHwUU6OmbA3531s6Pa
         OVFw==
X-Forwarded-Encrypted: i=1; AFNElJ/d0Tot6iJeWL/olr66OThaEkxxgjVE4q1mqCXR0N/cWRpBFSaUx4N6UIx61Ycjgyn+m032dv3lqokzayh/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ajk2m+egrOtm0IP1yDXVUMeW3kV23bP2Gh8Fe76daS98NMBH
	EYmF5XB9/57BFa4Y8o0bSBf0edZTsMebuYOV0SMaRY8Sw3C+Buw3Z/o7tlvD+Jj4WHga5CuC6nV
	f4C+m0eSUZLKs3/oe/tLUlCM+oN/WI+FoHjpYzWJr3lJxYyuPojSfghC96PZsLkwXQauM
X-Gm-Gg: Acq92OFg8fwkvHIAs61PNDSnZ2nIxtTZMn7j+hm0Xs72VPZsq9DvXtHVyIAPlN73Jh+
	TjVA0wgIiEmbAK6fcYCzaz+gdWFepkDN1pQXgFCsrat4sUIzJNc35CEbM6r5i8Ne20S6FNXi7ll
	UjTs7jipPBcwgMMwaWmKbpzdpOfBOg4XgUQa76n05Y7+8egBWGzlNyyU5tczSwiMSzFFyeQZmz9
	WqJdM57UVXr2iJwD88idmPmqjbyk/aFv0bPyiHwYm8mpFodUgrn62PwfaOXN6G2EsGndM6LlJfO
	lBXHaSfZZ48MCk/vHlgHkms3RPzjlRnQumA4VhBsE/VWN+m9UpSD9XwZQ5I/zuAYAl+LmSkgsUV
	wXRM06pKfOQoXDCxC4/eLe73NIe0o97c+UHwk77PReBZRqwoSQaaV7/cPWVPeYYcpxI8+Y4udTl
	KcEwsoe24vqVfAHvzqmvIep9ABD28hhOSq7oE=
X-Received: by 2002:a05:620a:4804:b0:918:4374:bbb with SMTP id af79cd13be357-91843740d1dmr917579485a.23.1781471806679;
        Sun, 14 Jun 2026 14:16:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:918:4374:bbb with SMTP id af79cd13be357-91843740d1dmr917577185a.23.1781471806269;
        Sun, 14 Jun 2026 14:16:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a734csm2217235e87.40.2026.06.14.14.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:16:45 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:16:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel J Blueman <daniel@quora.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add Embedded Controller node
Message-ID: <otnrim6weraf47ncpo6ngb467wvvytx43o3q7jntdaslsl2rck@fbhbskgyxasx>
References: <20260614130621.68811-1-daniel@quora.org>
 <20260614130621.68811-2-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614130621.68811-2-daniel@quora.org>
X-Proofpoint-ORIG-GUID: PTw7OAuH-mSYyvpUBrE_4EQSorDluRVG
X-Proofpoint-GUID: PTw7OAuH-mSYyvpUBrE_4EQSorDluRVG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyNSBTYWx0ZWRfXxldSPTXYJBdb
 DtOyqenGa7i8od8aH72fcAkBc8N3JioH+UVA56sgkuRiRfoj604TB8mlncV97WLV+mHxjAeWrrU
 BjcUTh3g1cFNtYWFPKHO3lp5R9o9fyg=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2f1a3f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=QbvKFJkngEId-OerJWAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyNSBTYWx0ZWRfX0OILz05gCPPG
 QnWHk233OC2+8noJSW/ch7FYCwLFKivM2Mp3DvmqW+Iuxd7OEB/OpFrmw4dERx8DJhXSMxony/p
 iwz6b8aRpnLcUr0bugDB+K9kq+EGTE7/S8DKR3coNrkD5TDfVmm5PglvcsJ0f7VsrpifNxvmuUk
 G2gcTt2Tw18HNwV8ef5ANCKh1E4LtngngPpUNx4AHjnBAnPcUD1qcoZHYHN4ssi7D8VfmuBv4RE
 zd/6iyG2Bglb8QHqne7mmpf4kGWJ22PVBG1msGcAMr1PwjAIF7/tk9gOlB5dxrXnd03t38TPRTd
 Oe7TrKMsMt0fy8kzhZZt04EkYjE2YWDADgKHP96O46JMAfuO1VYsQ93aJUV5+/5IUUYS7yvhvP7
 Sj/UJhCvHMMzwDfiM36LXhIyruQM7j8Kt8wFqTe5Ax6Xwu7lnv13OMby1HnHcKZSRNyVctli0M1
 p822XnPuRqU5UfoV6/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140225
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113050-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hansg@kernel.org,m:rdunlap@infradead.org,m:bryan.odonoghue@linaro.org,m:linux-kernel@vger.kernel.org,m:anvesh.p@oss.qualcomm.com,m:maccraft123mc@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,infradead.org,linaro.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95F65682462

On Sun, Jun 14, 2026 at 09:06:18PM +0800, Daniel J Blueman wrote:
> The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm Hamoa
> X1 Customer Reference Device. Use the lenovo,yoga-slim7x-ec compatible
> introduced by patch 1 for fan control, thermal sensor and suspend

This is going to become commit message in the Git history of the Linux
kernel. There is no 'patch 1'. Moreover, the patches will go through
different trees.
Please rewrite the commit message accordingly (just drop the 'introduced
by' reference).

> behaviour.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> v4:
> - add reviews
> v3:
> - use lenovo,yoga-slim7x-ec compatible (introduced by patch 1)
> v2:
> - corrected DT compatible node
> 
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
-- 
With best wishes
Dmitry

