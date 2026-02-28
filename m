Return-Path: <linux-arm-msm+bounces-94605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAk7IFjxomky8QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:44:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF6D1C34DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 399F53055CA7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8505236F40A;
	Sat, 28 Feb 2026 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D73xBBRI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/Ref6Rz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3932E1E98E3
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772286285; cv=none; b=YsqRIqMNq7JFnUeZKm55ncgbshr5QkAz4XnNMK5511kgMpuxBXSX7s01bfVG1etKgRSyNjtDejO1UKzbP+akdA3PxvJ0AghWqDT1KAOg3iVyANoD46+JpPI3f2S97GZPBLplWoJmFx+MXzhtYm9bVmSYY5BkMImgjFOnWeEDaUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772286285; c=relaxed/simple;
	bh=P+e5o1cQrQflpB/CVOsVhRKdS/Hx/amuhzDTbwuAOfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAQYnGE5bMWlmvnsz/RO2HuuJpBy8R2u0mG44ApsiXfqjIszF2de8LHG5ju61zTpgMG1DIJRzkbXWJ8JzBBQkr+NFw2W5AF+2lqw2RHyHNv6RjzaQU8HwE50XyZ/TKdLJnIMMGk0CkdFjGGo7IGKK4+A9bc5ThVPhZKShIIMXl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D73xBBRI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/Ref6Rz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S906L34137507
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kid1uH/M+z4u9JpqFpkIkkB9hIR5xEKvvYiiuhLyEn4=; b=D73xBBRIn/ZpINYz
	baafx2F2XNDmjYo8t5Kwt6bXZLcvBGi3XqbKf/mbKDGYf6TQoC6EEl8dmMWBLwfr
	n3IwqOZW6LnwjyxYfwAjzqkwlN1fmofM1+NxFRo0uAv8KXAPaqSKELwXeHnD8Saa
	YhMu8JalMNWQu+/Y4ToiGZybBjcWXGYYkpX9PvVwpl/uGQtJc3ZmB1eACsUI0ITb
	oNohoE+cqN+jqrMHe/6/HsEih4TZNB3+6fzs5a42+6NVGx80RWDQKBpNcewbD1Te
	rXjmXenKbJFcSSYcGePNh1chZXaC1P5WUX4m+dzECG5YLEbdF1ZWarnbCrbAzgHP
	wYJQmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8h174-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:44:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca3ef536ddso3021122485a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 05:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772286281; x=1772891081; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kid1uH/M+z4u9JpqFpkIkkB9hIR5xEKvvYiiuhLyEn4=;
        b=E/Ref6RzWUsFO7olhX/N2Lq3FpMVz+c469+wRBB66TFx2IhPFquxBHETmA3KN+nDRa
         /ezKh+vED7HP+MqMY7GNl7Hvu07X3wWIfBZUwW0UyAjp2VeZwMP1aiGR9A+nt9R49Zss
         1hfzZhQzJYx2svTz5XX7Ids0BiRpQyjXrfPHEy1GLYg+4jkevVJJcmgTkyj4nGtbfDkB
         qMv9PMEKeFeLOqiTxyIvq+KIKJtqTo35kG3QfFCNYZXfH+7/vHNPbwOn8CYe3Co4tIyi
         84Lg71vKr5pxPhF0aMxfyBH3B8IS09XNKOzAplMGMkPadJdXb+3bW+0AD3fdT7SeEbUx
         f5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772286281; x=1772891081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kid1uH/M+z4u9JpqFpkIkkB9hIR5xEKvvYiiuhLyEn4=;
        b=WIHzCacBfPX59IGcu7iOlxw0dvnt8T9B8YlUML5PzThRZia2QZPLxW5IkzQaUUwPg1
         5JhnwIdTT2bf6NQF/VIbH7tahbj4wMB2LoD5/d/7Jav9zsb2e17zVUDUyshq+QQuxsvE
         Yv9Z4/+WYZ5YIoKe1U3avQULURpFOfKSMzOTeA68LsQ9p9f2CGtTvX/5uYPiS5dsCS0O
         fSOTAuqZ3cmchkvP3QeyULTOdLGCQ4QDwk5Jdi7gSmGOTZuVw1HrhV4e6geUBPaKPOWT
         z5bBZ7SbJ+ne/wUwMmGhHpUygX1RMDGNYcdi4Zyorvnqtna+jjQdJBgYhUjBy8DkJHZF
         XBrg==
X-Forwarded-Encrypted: i=1; AJvYcCXhqORgIiH2gbj3u89XBxyFnjkgUct9hRQsKBb7xVT4BVQkebVN+Mt+EdN80nr+hm4LmY31jEcgl5fbqgKJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyAeMn+7ChygteYQivVDGEFeStI9wuhhaNHhAMEWxR4p+yZV8YG
	hQKDhaTA/zscbtRS2DNJ7o97Bun1vUFszxYTmZo0l8jYl49QYcB9Z2B99QgGyatwi7Bme+GnST7
	+UGZDcuCLdw2VN0Tu9cSYw9G+jujfuhOs/UMpnK1mHQqKMK3GA2l/NxK1rndaP5vATKVp
X-Gm-Gg: ATEYQzwiwv0h9AnhMEx//qqQfSMVE2RoPYg1EirLOyYlti/IITXQ30HUyLGVr6PdusE
	CUs7n/dREVVEwGISL0Qky2TDppPsIsrR+x0b+fc4gg7Q8yAsmmqLo8tNij5Fve5M4oKKKCAm/k+
	X+rdpYZhjEHdTgMmxlmDRp0AxupPW+WBxmhArIUIC8rXNEjot3B3x5yjpnyz4bQ88MPZ47W5uk4
	6Ed+UiKtfzDzW5Ra8ju6Nl3UTyQ21uFJSwXXB4h3p+NKoOqm1gT4JSwL5tPlSGv5rxzWxM2IYF2
	nNDDMsPpQynzIz/+1qQ/HbumF/mqPZr9Nsp7LGncJEIhQgIOr8PQE5KiXDheb4NLcP5eNdEMAdz
	krE8SC9ukuBTet3Ic7MaqK7QmctodIxVI1opi3eez6ZNlIoEeq9qC/BMUubaXRmvFX5EwTFhvNa
	aIJcts2ps+mDUg3GP+AiIg9y1LgeSwNcUndS4=
X-Received: by 2002:a05:620a:1a23:b0:8c6:ed3d:be60 with SMTP id af79cd13be357-8cbc8e3456fmr781791885a.71.1772286281520;
        Sat, 28 Feb 2026 05:44:41 -0800 (PST)
X-Received: by 2002:a05:620a:1a23:b0:8c6:ed3d:be60 with SMTP id af79cd13be357-8cbc8e3456fmr781788185a.71.1772286281057;
        Sat, 28 Feb 2026 05:44:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bce0d9sm570896e87.21.2026.02.28.05.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 05:44:40 -0800 (PST)
Date: Sat, 28 Feb 2026 15:44:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: use refgen regulator for DSI
Message-ID: <7gba4xjc3rk36y6e7ztc22jortvteo4lsyywoxfxl3xa5qb6pp@mgm2mcczdrk5>
References: <20260228125431.23098-1-mitltlatltl@gmail.com>
 <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
 <CAH2e8h75H5ZZ88pkFYTwr5xir_giW5DxV16Pvo1_DFQuqWGFKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2e8h75H5ZZ88pkFYTwr5xir_giW5DxV16Pvo1_DFQuqWGFKQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyNiBTYWx0ZWRfX+vdiROrQxdoq
 DNF+l69xJoGWUEAmjLdZYlz3HmQP+DBnUcyWM+McLaZJgo6wFcMHGbwTuNzqw1GbvU2LldPoIOv
 /zK93388ZCBWFvQw30fThJ9R3GtV3gr+U1CPNKd45aiSNTHOkxoeyvuiRe0ApjM7MvMOoMYq9s+
 Lj68nmRAr1TBfehXQEHzOxyUHx7OvSTT5bWvA1UT7Mc1Nh0ZqHCVykHsz1MzeusOKRzyQDGMzg6
 6QNCUTgQRh6NT8sS2fVrev601c0ZYG99sKW7/UZo8iUqzhDtysZ5XAYwd56RdFFU36P59sxGTb+
 i0obi1JvXMydkv+Aosj55vhUiSQQ8ZTePj5JwGTt4mGU9gwCkn2WxH6YZaOHaTGYAUx/z6PJGBl
 OwnSqve35yteJIvEae/bC2GKLGRM0TZDxGIln7y4qlv0K5dedYDQ4zboG36uNH2L+dqsS1YVRp5
 jpSnGoaL1JaMHhNsmwg==
X-Proofpoint-ORIG-GUID: qzzd3UticpbkkXgMDnuneHKF13Ly0gxm
X-Proofpoint-GUID: qzzd3UticpbkkXgMDnuneHKF13Ly0gxm
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a2f14a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MoLNtlHzH6ZT-cqGeYEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94605-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BF6D1C34DD
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 09:38:43PM +0800, Pengyu Luo wrote:
> On Sat, Feb 28, 2026 at 9:13 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Feb 28, 2026 at 08:54:30PM +0800, Pengyu Luo wrote:
> > > Use it for the DSI controllers, since DSI nodes have been added.
> > >
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > ---
> > > This patch depends on the below series:
> > > https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlatltl@gmail.com/
> >
> > Why was it not squashed into that series? I'd assume that DSI nodes are
> > incomplete and are working "by luck" without the refgen supplies.
> >
> 
> I had completely forgotten about it until I found the patch when I was
> sorting these old day unverified patches. At that time, I just sent
> DSI patches. I will put it into DSI patches.
> 
> Many platforms should work without refgen. Bootloder may have
> initialized it and be untouched later? Once there was no refgen
> regulator, my sdm845 phone worked.

If there is no refgen driver, then the bootloader setup will continue to
work since nobody touches it. If there is a refgen driver, then the
kernel will shut it off during the bootup procedure.

-- 
With best wishes
Dmitry

