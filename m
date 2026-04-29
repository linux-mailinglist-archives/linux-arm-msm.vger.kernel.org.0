Return-Path: <linux-arm-msm+bounces-105250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLXgEC0q8mkxogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:56:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2795497555
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55F2430209FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6E837F8C5;
	Wed, 29 Apr 2026 15:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edONtCl4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z98d02iX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78641378D94
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477985; cv=none; b=BzHQRmErUSmfL6LCdK2Rk35yRvMkt+D0apk00hVQivFS08y+4dpD+m8pGwAx5DsKR46Am4lqnxnJ22p6DWZSWOwmfbN2ZuteTEboUg1CJ/LyyWRLSpQiWXWy7/pNX1zdAnNfpTSGKmDXihqGMfb/QGYOLBllQ0XB5lG46go81NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477985; c=relaxed/simple;
	bh=TGSz45bAa51GW3JYy9+OgEGO1IyCbLKsvBst3zfkub8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lo7IVysXVTmgA1p91FrhNf89VXrRFRYBlssVzXwf3wy6JcEHTrWilqjqUcDtShWiA6gYJrVq2N71bnvfUCZV2ewm3Ok0/BZ3lNiktz0sqru2boN6h0QYbqeykAWBJxcOZgef4UhkCF6ajIbJPSPVeAklip9Yo9QvUBR4++17hOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edONtCl4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z98d02iX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCeY1N317094
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsulGSvKt5+B90X7opqTC6uDAze5yO3lFk0legS6Ob4=; b=edONtCl4aA95CSAD
	mpMvPYynHqhy4nyVuIl/VzgvFFJ9eqUmH3L0eblb14g8xJ0rgf4LCN0wg9LgU6Kp
	wybojh5/59d8Gr0VsU060ITkDWuGy5uIGUtxuqhkq3LjDNO9SYqoBPwc+7mGJcWr
	ab9TlKYpXwqQpE/7/UM623sG0FshvbCu14dcpptxtJTDCNSqQazAzXLVz96usV4d
	KUWNjSyeLVwt3f2SIve4fsFPJXtn13ANWmoVrR2dXgjQkpDKVQHTj8AQFOu1QfUA
	zYbB8xUWrOpUTVRSb0y6wekHSFxB0cv22iIS1Pbeu+Od6n8oSkhCES0SHbszAbDE
	+11YTQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t8qdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:53:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso24459025a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777477982; x=1778082782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsulGSvKt5+B90X7opqTC6uDAze5yO3lFk0legS6Ob4=;
        b=Z98d02iXZJM7AJLYf/yWXfuiNDp9INdlgHHhrTBJDqnP0JcsNwiRhqRnwpvSaPUrXr
         +GcLqTIFKpnESoEIjGR0mB/SkMgiu1R7klMCeQkTbz9yX4srHs8HSzbBMRkQ0XOHH1FL
         A0uF7AKOiwxNPr04Nb8MG1fiZVaLTpAnkc4RvQPpQGLHcUzrnNvIkXsq6Fd/YTzazoOV
         QdtFKv5aS7mwrQ6cXauGP4i3ntXxfeX57+ymltk74rR0cr7+085TlOHdcqSOzpzW3mjl
         +go2cerc+DjASKtjlSU1w38RTmkWrt/kPG0QbARakE8ZQCkOWAN8QQAtp7lYJxcadPW2
         1PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477982; x=1778082782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsulGSvKt5+B90X7opqTC6uDAze5yO3lFk0legS6Ob4=;
        b=n3iGWNw2dgzQlDmSikjh9pm0uvrCd1CyScj6lXp4fcTGyl94P9luc60LRJE/FDxwo9
         vsjEn43btbteCz8JZaQcgtaSu52kDUwPoBVZrFBU9wF5jrW83TXZDvqwJNzGC9HttQGY
         2JNguc/KBTQuSAAvp5iL9/4ijINTNfJKqOylEGrvCN0tLDLGiiBoJZ7FQoR0ySphVLTk
         nZ8oj3lS0eIqF1iDEKfjG8bEHb6L+GaOg13HWwjS9mNLAz0oBU9o6SkIReMN2nWUYCD4
         yI8RX9Vw1D93Z32NaXc3FTU4k+ywD9T+df90MZvKuTx3wJGGNKh313UBivLURrouEHCa
         SWWQ==
X-Forwarded-Encrypted: i=1; AFNElJ81t7tHarb31PCaa1H/iCmqkKajU8l1a1K6DTol7NFvTdnDVbebBsrdsnxWs/VlWpPX3NnCrCEz9Aci2g4/@vger.kernel.org
X-Gm-Message-State: AOJu0YzzjsMVudkUT7kPAjEoc5F9WeVCUCKd8WgJpqVYlPY7tsTzYjFl
	eJelkQugWrqdixuN2SHZYQZm6pqt0bFRQOJ8e+Sf7fPEXX7Z9+tPmEfgQBFLmD8UHAZDBuZ/Wiv
	70X8G76EtarBpEIDMkcFaW623kKrojGzHhC+wJt4JWga8ANB1EitFILUk//UXXF1EvY4w
X-Gm-Gg: AeBDietZUnvcRGlzxGnXZfcu4JcSstHfQ50FXgEkBYcgSv78KxRzO5cFosI/bFzBzPS
	8DKpmtRO1jHwAavyoBkO8MbA6UfcJjiUuiMEcwZxe+68O4jMHSwNpAsywYzx5mcBOgf6U2LW/Ig
	Tt5847yVYGLaUYOZReF5FzBnmpWsV8tTMYPe/404DY5POKzVCHafHOPANxdDiGKpAWSvg4j2xK3
	fJ2FrXPEgZPGzcpMnNwZazp9pyR6BbSIIIqARO9uuMs69hOpdhXkdI9k0ykDgsjLactaVPVJc8B
	KMEIKqeb1e1xlgI1RgzZaaK1iTkn2H6eygw5K+Fp4geh6EvyKNlRvFxXd7oAyQ/Pcxkz1yff0Uv
	7Cydzn1CqWQTrseP87lhoiEazYt4NXnFsmlWczBJ11vat0kqMuGmruvZPvthsx7j4SVw=
X-Received: by 2002:a05:6a20:258d:b0:398:8870:b58f with SMTP id adf61e73a8af0-3a39c174b39mr9500662637.14.1777477981549;
        Wed, 29 Apr 2026 08:53:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:258d:b0:398:8870:b58f with SMTP id adf61e73a8af0-3a39c174b39mr9500615637.14.1777477981057;
        Wed, 29 Apr 2026 08:53:01 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6514688sm2588534a12.32.2026.04.29.08.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:53:00 -0700 (PDT)
Message-ID: <dcdd1d49-a1e4-4c7b-a29b-187b2cbbdb7a@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 21:22:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add QSPI support for QCS615 and improve
 interconnect handling
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
 <afGNdfKrJCzGPy6y@sirena.co.uk>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <afGNdfKrJCzGPy6y@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k_YI39cyzi_y5-Vu7L0M6q6GakMq4dtI
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f2295e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=wpQWusq9l5L7COxpp74EdQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8pjqX-Atbf6zV5YDAiYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: k_YI39cyzi_y5-Vu7L0M6q6GakMq4dtI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MCBTYWx0ZWRfX5h7WOE5EotpF
 vmaafqlNkMysrdQG+qriyj89uOVBBxhnP76nq5obAPH7F/iZ5iN1CZOLFoj/1eMn31h606h2QsI
 dxbV1FSdwJolAS24YoWKeZTWi6YxEiC1FwnMyYYuTtMgoPBUmZitP4s6lim5LWifGbPq5Kx4csi
 BIDFfdrmc0RVfps4h/I6xreI/U0LImy2nXAOUf8OFTaao9HvU7SzeCsArjoVzqCwddezAqLZ0Oi
 QaFn/6+Uzi/0KNFCURFyq6YGBoKOBwusXNjoqKspjTV9liymiO14ErPs3XtVbLomn/vlU7iIbjr
 +zt9yJ3QLy0wXjloP2eA0cdaYgTOtZie2ivS9MU7SUdhZPRrFG0MJjH/VLvykaDwiCc8H0HVlf3
 Eju/MKGKaKttavod3SlLhidqu5kpQhycktIZLQ3pIeWNB5Rnj3e08fnqIe1dM6n39na8Hg1Qj2K
 STJGCVI9PGlBTmZAMGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290160
X-Rspamd-Queue-Id: C2795497555
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-105250-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/29/2026 10:17 AM, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 09:52:39AM +0530, Viken Dadhaniya wrote:
>> Add QSPI controller support for the QCS615 (Talos) platform and improve
>> interconnect bandwidth management for QSPI controllers across multiple
>> Qualcomm SoCs.
> 
> This doesn't apply against current code, please check and resend.

Sure, I’ll rebase the changes and send them.

