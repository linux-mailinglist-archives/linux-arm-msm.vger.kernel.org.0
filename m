Return-Path: <linux-arm-msm+bounces-94881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDaHH0xvpWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:06:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D49D21D72EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEB07303A927
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DF3357739;
	Mon,  2 Mar 2026 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZ1dpez4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyYHOcRm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC04331A41
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449464; cv=none; b=prXDhSfSZPTq9zrPdR01nHUVrRm6O+6CqEhG1PnDL8uI3BXd5GpRtjyhK5/YBKav7ysypBtvpLto95wWly4rQvfsgdTvQ+C+stGE3WTG0bPPjTpmafpVI1NK8pu+Jk1LaFR5wmqW9dRRxzgqOZZ1E5fZUFDN6mepyYTy2gkmHvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449464; c=relaxed/simple;
	bh=K41JvuaQyeRwS6GPlQl4faLZBPG8q5JF8fXy9k4Pj68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPLDltQMbGx9huBf8bg02qYGoc+ZjFfLfKNI4beeJuEBN4rRvL9wM2dPspvirsBbg/XzgS31vSn9c52dcvCgf/3mPFDeWnlhNaucLTpUGZDPUy/NfDsbZOf0KFM7yEU2HxPewu+XrHoTo4NEM+2lEqmilx3g3fwgloye3hqfw9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZ1dpez4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyYHOcRm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229EqwD3630813
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 11:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=; b=QZ1dpez4bJDficoR
	RhQ9Sb/0BsBhf+KyrowiYM+XlrAOe2p/WLjMTACPYW71uXsW40RAYZZB1MR9l699
	mXIkuW8bfNzsD8h4gp6cCs+ncFNcv4WBJ2hwhhw2zyzQKIEWGYPqsQPzXeDCQuF8
	HOl7r4ZtYbWH2Wv5Lkghjsf8jULz7jGNdYzRxnCsMfsk3uxQ0pN8ZezxOwnxo9H7
	jq0lgHH54EB2K+6YnKHFODRpiyb5cCmpI5Z2Sxe9W/PlC5BEPS984sQY+yjmq5OK
	KG+UdUyVsSm1D8/trBuXUnih4vxfdvgNh1f26Rh1q740PjEhg8I7fThUYiM+f6cX
	97pAkQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhrcnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 11:04:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso415838585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772449461; x=1773054261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=;
        b=GyYHOcRm+PTdxU4Y5Q3kYXugc7ghiZ7ajHh4rtr/wykvqdNWsoJcfNy1kdUL4CmFq2
         yfPDuHvsziY1a32hZvhcjDZWhsXN6jX93mkpGzsF+HLvQ/33ysIJsqGMBwKXume5Iqe/
         M/T9kD2PyzsfcAN11JCHCW2KEdcH4V7+FD8Zux7l8pCu5IAEK2WVsjM4bJ7OgBxP+Ag8
         PzqKW+c5Wlhs64rlRgxZThrNFoCXi9RepXBZUQ4rOx+ByXkWteYh/6jh7BgA1hGz1BgN
         KMCImcUsHrAAZNUlsmYL5iCJNZpXNFq+q9MCqTwgvGm64rqYv9jJrR+M39smVstD9snz
         GqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449461; x=1773054261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=;
        b=q1Z6vmCztPtdVUDkOGOPDB1VblSmX4gOz8S3ah3Sg1MViv87yx8JoOdNDZt9WyKU/8
         jDEtwQMD8MsS58rdMRtWHLjabCqi/cNVpConuqVVfzqclhOjaNZiCV5rYoWirZMVRWS/
         GEZ7p0Lz/2AejxjpGGjaMr9xU6AChBMa5tTi6WxwWtyMd6atvU2OIuBTtPJ7WgYf8zrd
         acg6xucXAHGXVL+A4lNZDSBgVMPVG4Bdsk1Ay6x8IPKRn7FIptOb20psw9haAI23wFzP
         /V7JUuqRLsRBjVpI99LLVsbzlSwaBUAEy7oirmY+0ylk4nRjLqwKrt/njBMeaAE/rqa8
         tGtA==
X-Forwarded-Encrypted: i=1; AJvYcCVshsCPZ8zaFeupowSA945aDnG8qu47ddLz9iiGWSYSSdisvvyJYoW56Mikn41HHuKskDmhTpPGjhKjyykI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy4bx0ojthrYQhAp8HDJX59owxeG/ejGhaomWmowpiiEAIpcli
	rjqknhWVs/D2oMykkq9eVuMnGqIfwkS5ljl6U4VOnRKKsBKIFShbQeR0ACUrdqBZusNNFT6pJGu
	ezT/L/xw39dz3TEdWwvm6UdVz+awDFiFupi53Gyp+cFlBEbhCKoKQfihXY0wbhd6YFCp3
X-Gm-Gg: ATEYQzyxndiq2Mzde6ZLIqHK/bUJEeswyFEZt+dZv8OMTM7zVjy9wSE1GdorpwqHLpA
	zpLH2g6eQbqLExJYPfOm1uI6cbzV6DP8q8AKIVp/p4cgrLhu9oLHnulMisCRsvu6f3PNY6w42bG
	EWcyAMQ/hkMMaR7VP79FC99Onv66M+5jJ7Wqa4BocgL5ua9JChLiUhBMDPMMfno62qOgT2xe8yZ
	M/P5za0+RNmyEyZhmM6wwkPL+IgoS9/D+0vSawcvtM9GnCutE5yhsYSGjbsdBp6LpuKeZylKPZH
	mzJCIr15GLRoaBCtvic9AUL1Wwod2zVSgY3/e8NSHtT98wrjJxrFeFm9KHLGdjTZ/MPdWI68nr6
	B+GO4pQHD8C7N7iDpYRM1gYhgzxBQPRG4aS2Bbx64DZS3IZwppNCLVP264z24+ZzTxRSKJLq1Mm
	fDVl4=
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cbc8f2348bmr1176612785a.7.1772449461138;
        Mon, 02 Mar 2026 03:04:21 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cbc8f2348bmr1176608885a.7.1772449460723;
        Mon, 02 Mar 2026 03:04:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9385836a84sm318934466b.59.2026.03.02.03.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:04:20 -0800 (PST)
Message-ID: <5d3694c6-57e7-4943-8dbb-41334086e8ec@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:04:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] Input: stmfts - add optional reset GPIO support
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-7-22c458b9ac68@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260301-stmfts5-v1-7-22c458b9ac68@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m3cpPuoW7DzWVhdm7EaHB-mbibBJjQ4E
X-Proofpoint-GUID: m3cpPuoW7DzWVhdm7EaHB-mbibBJjQ4E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MSBTYWx0ZWRfX2EdcGBMX0SHt
 ZPbVG7CrvKUkRCYVC1lamGgsfDDCU3bqPaahCK5vYZb8Izy2OWaYPU6AjGmg46c7hwDvhZTbvmw
 D0Z0KRlKZpTJIfSTK1s1aCbCpxS/MTB6NpQtxTABnF7b8o5crqjOPXTDWjtBxPr2cX5gB1yXQ6H
 G/UKahs7imMxJwRQEYO5woZ6ynz1nS90PNOPerm6rRiv6tcuLblv0Yg73UKd5+N13Mqk7CZuZg6
 89bEfBC9gKmsp6pI9Wqn7ChUbFhP44I9beLWlEFaKRDp0Uxa8jb+dObKI4RMa4ejq8hHXFePcVx
 M+tP3eJc3I76FjFSA2qfKFNZh8hASwHlG5Y9MWFDPcC5SNSuwiTmZt7vcUY7qiuHuPknvwmpXIY
 ZnipyGG4rO16kLuzn8bpxVdh3Bq3msmNVZ0HEnguuHYabVrzLlczu5dDv+eHxGQDx5Wvv1JvlJV
 kW6jnFCM4q5A8X2Tk1A==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a56eb5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=sfOm8-O8AAAA:8 a=bmle8qjEDyfOUcEunfUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020091
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
	TAGGED_FROM(0.00)[bounces-94881-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,gmail.com,foss.st.com,kernel.org,bitmath.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D49D21D72EA
X-Rspamd-Action: no action

On 3/1/26 6:51 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add support for an optional "reset-gpios" property. If present, the
> driver drives the reset line high at probe time and releases it during
> power-on, after the regulators have been enabled.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	sdata->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						    GPIOD_OUT_HIGH);

Are you really sure the reset is active-high?

Konrad

