Return-Path: <linux-arm-msm+bounces-104734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NTeLHBg72mHAwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:11:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9B7473303
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6048306A826
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746213BE65F;
	Mon, 27 Apr 2026 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6BEJ0Mm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4WIFQe0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DB730EF75
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295169; cv=none; b=UdSxyOYpjkaICvYno0NRdqCe2ufQ7Fsy4x8imk0eXs0d73SFM4+jbizqKBPYxaCAiFYuqbRbIX1u4TwBQdoHoShtfGbaAOaKKeTvxfRhiJHsvZcmWZ8yyVfWiQCGcZ2HxQHU0ZWxZZbGH4kiO4cGQaFwsSxUXoGTdAMRRQp5Yyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295169; c=relaxed/simple;
	bh=/Vo5RdswgfOHNJuNuRmCqc/7gYBqdZHdOW/lFNmJNE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pE2mC/EH4doSBHnvrRWOumfnfqFhO/gL8DKGFOYxHt4YybmNzjvVW0i4B2W5HlVlF045xp/gDuryHXATWQLJ7JpXRyfXRyz3tdwsWpqRnAxfKFPdDQVjGe59nzxExwRqsLyoxvRya+01xknKQgoRsXd7fZMZpjBBIRd4zFiqp5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6BEJ0Mm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4WIFQe0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RC5cKg2006203
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGkcCsiEA2JIXk+TcjaMJ2B35tfV/d5doRcU1NZp98I=; b=Q6BEJ0Mmw4PMQHaG
	cGf0U4RS6zQAh2TenqOqUpm1qqfck7uK4qCYtyGWHTdJzriENvpIoJFyKYRnDpgV
	GfpRlhYPBvDiEY1j0GhqovR8durrd+Rc8HdJWUgNouuncQ9v+mDMIcJu+2tQ/UAJ
	bhMKYBlDiJejF3uhCZhIL0De9CC1wXDSOe5lYZCV66cC2b5UKPzRQ72KhqN6BdOM
	NOQCVkrkZB5ya1iEyp9MBBtUwyw/tBCqcZmjz+R5TTDOA6V/sCYzO+8a3+papD21
	Yxj/Nz0YEeaye/1IyycN+/dzANbWqHSCEbBMocnKCQiQNjCdx0eI2x9HmRkM9mFU
	tjIJZQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkg6m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:06:06 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-479fc1fbf51so281482b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777295166; x=1777899966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGkcCsiEA2JIXk+TcjaMJ2B35tfV/d5doRcU1NZp98I=;
        b=i4WIFQe0OsWktWEE3ch2GXxm+jjCMa38m6R4jdH5Zjl7XPYoVff0Bn0WwtNT42F+Hr
         /RsAmBtsMho6qxg0OWxn8+82sZdxXG/wXoOhL1k9EGgW4dckYYL/WpMsjBB9mCimmxFN
         a5eSvlj449QEzWuQa195qyGQDpkabU/nGlTbLSML/n6RRQckwBJWEGMh1hI5ukDdff+5
         BlE7XW7LV+I2Be+OTozF2nR/UMCkqxUkBnIPw99mJRskGbhzE/BZ6kY1gtDGumFGCs7V
         hwbwR5y+O3fiP+vPDjBGyqgz+46LfGBMQOg2j9gZuFKUAqunbmEyMa2JfYZujf0or8dD
         VZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295166; x=1777899966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGkcCsiEA2JIXk+TcjaMJ2B35tfV/d5doRcU1NZp98I=;
        b=WiFm6YEnpMScn6QmEu++lnwrSTTb67xvjlLuTh9BSfSZyDwe4vyc6l/61WomAN9v/+
         ffiOdcmaRvygQ3L819eP/T1B5T2cOltemmEd+p3YSb7Tq7CGXUbAI7WGdA+I6ipABMPx
         80jva/kGxxB2yi/juaDwPh8ccyKKJq7If1EmmyzYSHBGIqlexjIkgpmN7ippx5rOTjv/
         l/F+46U9jp2SANNqkiQbPl2dpA91WayrnDO0BAU1c6EzTK7PwHMqOejby772/+R51OUK
         9hw8gu8poB0A5ogYVLaiuDgWJXJ8oDSnLk6+jLZW0E3aJ/a9pZoD4YDSjvYGjGXmYvRY
         3+pA==
X-Gm-Message-State: AOJu0YwNn1W9k+PQqWUXa0kTq7dO7+2MqXEy14eBNWqfaUQe4zklJsO3
	qDJXxNOhBV3Gt4ctIdhgXPSvZueeRcQBk1+J8c1mNKR7FsK6aizuIctx483C2aei0VCeA74rHHp
	np2ZzPhHO1t5H/RFT2cR1nmiCeb6cyD9Pl5T/809CjKoJ1XQrV3AKxPVOMSUyxZNHjmdhYFqhll
	QD
X-Gm-Gg: AeBDieuvJKZ5ZvEiudJNIQC1fpwKRxnRX5f6nI+H9o4NGI/0ZDMMEF3Ua/vnZb886cY
	RpCia72X1a1w5AeGbWsN4ggTxMinC/7jAOyPZrVPssGRHyEOq5hEeFlmBeGUWmGtdOVLNUM0+MA
	PlWI/ljqgU51xffwmUrewaMt8paepPU17F8hYxdbxsq3JqcA6OsvhtUWT264H8meUYHVRbotzxj
	v07DhSukw3/D1xzXXw4EibHRP6PLe90G2JTs8+PVZnimOQEmxFfo6yjd8+bx6d/KpdQt6WZgCI7
	AHcJ2ObMxQ5mfGrRs/o8KEWE7iWC5IL74JuNTW2yK9BEfCv27YWKX/sxP8RTKlrjBG98GcLcNf+
	4+gsgecu/OHDh6VlNojBgWqb/OXGunR7vZNZ13xztFEKgGnriBson3bT7E2yyPKJ/Q9tq9askPM
	JdhzSCwZVLI5q6dg==
X-Received: by 2002:a05:622a:1c0c:b0:50d:9138:3322 with SMTP id d75a77b69052e-50e36c8e98amr408672471cf.7.1777294818721;
        Mon, 27 Apr 2026 06:00:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0c:b0:50d:9138:3322 with SMTP id d75a77b69052e-50e36c8e98amr408671681cf.7.1777294818137;
        Mon, 27 Apr 2026 06:00:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451ae5f2dsm1099761466b.21.2026.04.27.06.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:00:17 -0700 (PDT)
Message-ID: <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:00:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Kepplinger-Novakovic <martink@posteo.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260425105300.745044-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KkmlxdPJJEDPCq1_tISeKBs8bdcyCDnl
X-Proofpoint-ORIG-GUID: KkmlxdPJJEDPCq1_tISeKBs8bdcyCDnl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzOSBTYWx0ZWRfXxz0oVfs9Ypfn
 pQo9rim+OHss/5y9X7jFms5AQA39UHYZP2Q01tZ5miZ4xisFln9KuyaCpFSpSbsvhlqPiaUwhHh
 Fiv8ZZ4UiypSemANZUOwvGvPi4WJIT5I6PSSRwvYX9LQAXmwzTyrXf8zovhGk26+VWmsrO9Qr0/
 dtb4lKjbHHkkmJ4s/xgoW0FsjYuOb4G6+ZkY7FMi2FrSy0fsr4Sc1nnL3D1WsAmrRlLDlZ5qpg3
 PJt6ao5V8zCIwNQpWwAyjIIDitPwzBTAMh68ARgu9MZS/owBlQjRV9rWjWV6u1OCplLK8c1u5FZ
 xqjswkfYR5NiZMU4MMv8BxnwtE2TjbFTDvMjPHgtRiZ46H51EqUeAdhjhG3O1Eb7gQzyHSzDz55
 DP7AwpBF+AEm7MLm7+uoLIzmABXld4RJtxYxkhYpA2G1C990EP11F17+/OhoJpM/3PVapSfOzu7
 mK70HVH5WY8LD1aWgiw==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69ef5f3f cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7hjUlyXiQ9dVm2DUhQYA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270139
X-Rspamd-Queue-Id: 2B9B7473303
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104734-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,posteo.de,linux.intel.com,puri.sm];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/25/26 12:52 PM, Pengyu Luo wrote:
> Hi846 is found on my Gaokun3, descripting it.
> 
> Note that it seems that only Goakun3(3.0GHz) version is equipped with
> Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.

Are there any other noticeable hw differences between the two variants,
that could warrant the DT to be split?

[...]

> +		orientation = <0>;	/* Front facing */

Please either drop the comment or s/tab/space

Konrad

