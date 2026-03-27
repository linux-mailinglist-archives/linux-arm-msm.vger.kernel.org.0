Return-Path: <linux-arm-msm+bounces-100267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBleDs5bxmm+JAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:28:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AAB342851
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A7DE3067F4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F173B47D0;
	Fri, 27 Mar 2026 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHeC/Lqz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i17ZbrBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620803AE190
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607140; cv=none; b=R7kLmRGLfqLd54fot9kM1KlBcbj0j56SwYYQIOEva16OQgagE/4Udl0k1Grylx44d/hSAUfhtx2FsB/D43GIycB73QYwmFNLOJAmeGnl1vGmY09dULReqKtibgrhRlX5G360STuOhfaP0E33CtF/lsgK17m3I6NT+owwHmUuvq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607140; c=relaxed/simple;
	bh=aaLaEVM9z60X4uChumDS5uyeAf1TauE4AArZ0hd1IjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AN/H21VXkueNic/Y36u0mh5AGr3uwk8PbQbR8Rqf8lq+BUDwl7w7nX7d7gUYPQ4VQawfs5fIVxCt/mM3mRrA4C033Ot5UBaDAojaE5/Gz0V1KUSAfYPKrVjHXm5ldyJMyorGa7FYqvjzmZteXP3mUbU9Y5Gge8/xEeOcA5c3vBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHeC/Lqz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i17ZbrBA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vijm731346
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2g2lnBb9Rqivd9Mdp7ZRvaNs3pwUAyNuD+qVPybhMLw=; b=JHeC/LqzxgKZHtFH
	RBmwK7wuQUyDhKtZcevbZ9IqQm0eR4kX6S8QsW9SUmB8lzPFaY65/QDGdIzK2Z9t
	K+KJce24MuXx/etfNbIu8+cW/HEVyKIFuaZQIXhi4yIApoGRJZ5NyvzMH/4r6jha
	fhYOMk5to2O//fJ3n2+6+RaGDzYUTLUwkd7MyCygdF5Qy8k42jzWNesrO1cBuyc6
	IXnhCvEYRYcqwIQzVr5PzAR1YGC9UWMRjtpekdtpLQNX92axexCm1aigkBULcH1Z
	EDmYwb6yxx6X+dyQF9m6aR0R81pFGDJR9AbCxmEXd1PSvj85BIk1Pb97sWzgPgdb
	Y7NQLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q2xtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:25:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091327215dso31809571cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607138; x=1775211938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2g2lnBb9Rqivd9Mdp7ZRvaNs3pwUAyNuD+qVPybhMLw=;
        b=i17ZbrBAw1hbSAHb3R4lpGHrFt9gr/67jmKiBkDd7rGCM06NCpRBIUUx7F243lDtFJ
         B4SynNv5snv0x9VU+tDa2bE9BqUCwa8L/R48CiOTxCsBFJ7MqsylnuElPomtrSf9ISiC
         6af0Xt0WKoE/+Arl8gKmblaU735O4up2nad+fILlgUq52HJZG0FA97nyPBJ6ymm0JHVT
         ID8M9vhWoval9i8cbulA00TvXRN6op8+gvjo9RME3RDIF5NktBYsrknJ9xxw22sH2U3D
         XGN7Bd8ul2NX8BztA9QsZqOWBr4krU6bV9VcpLnQtXUMR7O3D1H5A33uTjnZPg8aIc+9
         Ygxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607138; x=1775211938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2g2lnBb9Rqivd9Mdp7ZRvaNs3pwUAyNuD+qVPybhMLw=;
        b=gwI7+ce38phFRMA2cDz7jCEHfpqHhmseDgwY8ZQexQgFyDgJmYx8XCkrvr3vrHKMX1
         g25Z+b+7ram7PFeEmrua7Muuch3SX5zbmMIJkMusGnKHPJft6pJrToZAZYBx1pj3IdZK
         SKZZnumMFCbWwdNDns1rLNLn0e8vdlSjSRmPjk1ujRlVai8bGtKpKcOOuT/24dFUwjeP
         jPGTL7N/3NQzEJeWb5z18AZ4f7z6U/ANRlBAjP8yE7SfKgc9eQ2+/qfDq9pxtpajVSEl
         /ktCyK4CC6cvBHlARmJA3/0mffxX5NfuDop4nPfS88Y5guBGLGX4fXhrhWLxe6+ncQ/C
         3WLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIFNdN3fYd16n6DYMUMW2yLtwHvPis0mAVfrbC/XpzyfOx/S3vZgKoJWsRUVJuz2nKvde63tiRGSRSup8i@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4q2EuUFSu39fWOOHolqIIJEGcuiXE2dRkNscZZq6E0Oeqci95
	M0qYIG1PnFsKjQ8yJNkE4hnSQUzVyUGev3JR4ZNhC0ptoQb5PYez1urv1zxe+RayWGVfuVJTmTs
	Kemo9ga0PVVNXcELvK2Fiwe+Syb70Fw5D1xG8wjY78H0MdhjJw4Ak4BMXnJ4BLHXUQGcrluWXKj
	PW
X-Gm-Gg: ATEYQzzTTlEOwE/OAhrR+SzYjo3IGc2ezWkrCaHYJYldUBdrB3LGJALJEau7gRQ6WMG
	Gprxj7RGWUDC4uEOFIQBt63+G4jh+MSX/OTC2Aif267CcFWF5l/W57s7JX6kSST0Uko3x8wukOB
	79gm9nWXp/Znp+lNYCtJ/souZg5MLNBEYbJbOACxCfKHfi7GbJ/cBEhVsH0UMBftlKDULqzvnF6
	zUfjR9ayk1n2EhY3bmftcMfsr0lBiqTfIu1O7wC4S7rWoUHFvnY6t4xd6noF3mibcoKlaQVkR11
	ksCLDzxj+1zWEDKzKZWtcUgA5nCdFtthgehXNMOP3nG6Zoy6fQolMEABU5NeXkVq7qiUl8jI17H
	TpKDPkzQ4ZlAdTDqjA5AwuTsPVA6JBHlbBfXe27Q9Gc9H24V3SbT5mh7OgZZH0bWMXze8VBJ3Pm
	cV0DEmJhYG
X-Received: by 2002:ac8:5744:0:b0:509:33b:ed6 with SMTP id d75a77b69052e-50ba38369a9mr24560881cf.23.1774607137699;
        Fri, 27 Mar 2026 03:25:37 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:509:33b:ed6 with SMTP id d75a77b69052e-50ba38369a9mr24560551cf.23.1774607137280;
        Fri, 27 Mar 2026 03:25:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b656:6dd8:ce4d:18d5? ([2a05:6e02:1041:c10:b656:6dd8:ce4d:18d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872717c3dcsm13044735e9.28.2026.03.27.03.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:25:36 -0700 (PDT)
Message-ID: <8c398cbe-dfcc-4ee7-af98-f2d89597d845@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:25:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dt-bindings: thermal: qcom-tsens: Add Eliza SoC
 TSENS
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260327100733.365573-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260327100733.365573-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WLfEAOMUXpCaHZSv1E01GZD4YXrMXloC
X-Proofpoint-ORIG-GUID: WLfEAOMUXpCaHZSv1E01GZD4YXrMXloC
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c65b22 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XElCsiNtPgCGOgBlZg0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfX6QBTUOzqgTJa
 mtVX+uzwRHeYEebv/kRELcJrPuFobQQtbRtypmghR1boNufLnm49qWnMiRsM+Z6SbrC83tHjka9
 wnpR1KOwYRCJfjFTFCDunFKoEn+i8yGQ5oOAZAYwPU4cQgrWp/OYRqNG5fTzlBvY/HlKHfndg79
 LzX8alkPzZ/aaGR+gUoZnn2dMHFyV9woM1YabvU20AoCeL9iJo/8r4UkWUWCQcZmD38/QenIfL1
 FPtZRg4hax5hCLtoOhuG7UHWQamOmPtGf5E27VhDQzkh1egwiFPATrtCuJc7lfNfeohvwgVwAkm
 9EfhzTBcZO3QBvM3yCnT1c75RRvoag8l8IvbnYrGMapskRgJqgbLR/6CI4LDXVGv1CCQo0UNbah
 fdpoda6fxS1JKOkpwpgVqmcoSrzGeYj7gvQrjfxgn8LnGqjP0Yc/SE1VttKGGtQnX6hU8HqMZOI
 G99+r7rHLoTKtYEdYVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100267-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1AAB342851
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 11:07, Krzysztof Kozlowski wrote:
> Document the compatible for Qualcomm Eliza SoC TSENS module, fully
> compatible with TSENS v2 generation (e.g. SM8650).
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied, thanks


