Return-Path: <linux-arm-msm+bounces-109215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGCyCUQkEGqsUAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:39:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76A5B1556
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FFA0304B685
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2A5309EEB;
	Fri, 22 May 2026 09:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VELran0c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZc/8c/7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E671C3BFE2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442609; cv=none; b=FUZul8YiVkZZLFkLcZ4iO0SwVXNAVwv12s8uqCcd2B+2VxuoOrfQ/hXuwcL8Mi0vKGZN+DKqv8JXGr44pXsyrYaY5c8HT+KCGDpsPsQuEFVNswRg0NNP619orXT67QQ61SgSeAEgNW5LH8akrqtA2hiU94vbf18unopMq34GU50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442609; c=relaxed/simple;
	bh=yObmgf+llw3PJ2A/gqaEje/zs6/w/A0LvJrMRyVWNOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KsNPdlWVwh6KI/ll+jt/b9wwtSIJAmkirBE2oJZvwnWEpSa0mHOqWqw2tTAA7v1dou54nYQF8IwmuNjMGldXIxMpIZq4PcCtnswtMD4102rEnSzCTebu5gTjSOzknB7dkCr2ITxYyEoHN1tmc0JNYiBKc8NWggFBljm5Ha4g1ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VELran0c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZc/8c/7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8i0BB3532248
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APbwl7JfZz1MFEo4M6V4SzoKbJVoUA0Dkbs8rwWXxR0=; b=VELran0c6hntsmhM
	mEB5xbFWjfu7Lb1Kyx7nNim1bPGhBazuvf/3rskHwt9P2v5dCTdYCjLu8bvcG2VE
	8CUkuv4mCbVkNAyPSyUe/y8VgDXG8g5mBuqh3g++t2bfzjBKgd053AZc32hhwcwz
	ehSKPc3oZrVSuEk9r8RCfHojoPIOMMadUe4TK7FCth2gsujHw+v5F/gdTAABYS5n
	Kxpm7KiqCtpkGfX25l6fdPh5A3sbUvZKQ5ffBKm1OSvftzH7RqidV0fM2WU1RP17
	GMIzpLDSih+iJoyKakApKYq+huTBtQNLAguwgu5kCHYnq9i3vR0DFOBU9kv/+exx
	+KQp/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvdu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:36:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914b79adeb6so15013885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442605; x=1780047405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=APbwl7JfZz1MFEo4M6V4SzoKbJVoUA0Dkbs8rwWXxR0=;
        b=fZc/8c/71iFlaZ8D1NPl6XMdeqZmSxMUV8vSZSgGkJXj/Hb2agj3/8cCgLugqxv+3Q
         HE7Cl/NKrPn9e8aUxXO+1aVyYjNud7j3y4FaoSP++kdoQXdTOVbYOQF+cpm27zWZOLsw
         NooABM7w3qNX0hEW512q2NZTcB97T7Ih+GFL8lqwXJA6EqLsTLlRQ0a6WRkhgX00e+ar
         jW1Vn4SHHi2fdY04nBLJCIC1CuuagKo0MHdjREfDMgpEUZojtBrCNNMPPJFu3y5m0CI6
         u0U+MFclgA0MWCf6muKn9/00gYpA1uU2GyhYZxt7kp8Z0mHI/c4raCA9U8CuTCsrLIF2
         yIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442605; x=1780047405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APbwl7JfZz1MFEo4M6V4SzoKbJVoUA0Dkbs8rwWXxR0=;
        b=QBXoU3bKeAs/F4rvG+jjBZLt9G7h5HT9jYm6q/069gchmr0FIVKrrO165PZgOXOQ4a
         fdZbqeluBou7w87ixGa/vEQixfdLH4YEfQQJHtYq8N7pXCzEA5ci1GnsnJKabUCxOIkh
         xstJND00XqclPO+HL3Yx8Z66Lg+LElQUQhFzm09k4K3rkqUN7lim0p3YoBpF7r3JZ2PB
         5Fuj2S/UhEczmOO4JN6ihneFzC3JhLYl9tJs3seZXbMQhy1aOK5UmF2vjcyGHac7Nddd
         vBcVQpULvQPzCKYXBlBriy99ZLewUkAoXO7R/dUk/y6N4aBtPbNl3ecfvc4CcyTMub9x
         GO+g==
X-Forwarded-Encrypted: i=1; AFNElJ/kGsHC3FVOJ4zJcPziTBipwo/PvZM/TfCnBdywMzG8af0unPUfgzwdXA88DR5S4TNJg2+TrP62jZ1ge/lD@vger.kernel.org
X-Gm-Message-State: AOJu0YypFdnu+zm9IuJLqzYvkEzbCEm5YprqwKpmnHitMW3RFxU65u3i
	Vn1idIFl2pgQ75RzgwelNVa5eiIaC58o14W6okh8NZR4rReoywvl04ipqfh55GTMziqWqFp4icq
	Xz0VljU3ebfgGiBIEEhvHgcznRSFGXt9fESyAmeJTJqmGj6grbJ6Atli+8IJ7kDzgnaIk
X-Gm-Gg: Acq92OH6dgIsYEP9MJeuFMRt9fpd1KuwCmtrnyZwA06V1NeivcbxLfdS3jaWT00JMz3
	043gL/58XBUqYwEOl7KA429ia3wainAnPUu2RT3FpVAkWh77UkRyZpUxW2vDPJuf/B2TIIh88Yx
	Fw5x8uBH1mkydAzOiILvAzJp4rgPlk+/8ob3EpnoOF3i3RfNE3AGjXLtzBYkHMtOPA2AhA5DV7X
	hroFNgxfrceVTmWntaNfUJGma0xrSiS4usJQJhJADuPxPQq6OfZE6ItYpfHITpp0seIiyvxy1ih
	HACDy83xMf8Q2lnex69vz0yZ5J3j93FBZ1YLOidaat5thgkU1yzlOORUEHk73XHtOk/6AT7Bc4N
	c6MjZoRmd0qC4Zj9Dl/DbXutCk3q12Cv77uT0u+rXxP5ZWg==
X-Received: by 2002:a05:620a:2813:b0:908:a758:baae with SMTP id af79cd13be357-914b49fdfc3mr274380485a.6.1779442605296;
        Fri, 22 May 2026 02:36:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2813:b0:908:a758:baae with SMTP id af79cd13be357-914b49fdfc3mr274378485a.6.1779442604807;
        Fri, 22 May 2026 02:36:44 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb427027sm460761a12.25.2026.05.22.02.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:36:43 -0700 (PDT)
Message-ID: <d9c4a227-97e3-4ae3-a095-a387b7035f08@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:36:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane DP
 support
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-6-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-6-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a1023ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=S3QPRrZGCkirkA1mjOoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8xoIlRmxys62cLg6LKrp6l9UO0WFOxfG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NSBTYWx0ZWRfX5V6HgUFkOWta
 RquW2LqBkzcey05qoknAjmMsZcKspOdFtEypNMhmXetKjEEd3eDDPrUtwSDVIBsWDbkjVnlgU0i
 a1nl+i1D/kHSccppbeQRAiYIzjn8buGdlAO4xnRgqqBagYQnbLBnRDBmCyz73fr8RRnVThbu043
 ls8QgM3AuGKQZHg/2591XHWxSAoBugfFOHxTHTzRvOwp9w1YBKVbvSqyN9yCcRvwtd02t9rqona
 /7hZwBPa9E+HkX2VyZbU6WCuOChCBst1Yu0BL6uO6BmmIkKeiy0YleqB906fdT0W09wcX2njdyq
 /+iaGuDO7uuX4yrNG6I9NGxTY7C8a1wK+iiVU7mMSf6FhzMpiDivA4DvmSZEa0q/XRpD/Tdhy1W
 5WL0gULbF4vMN2wlTl/Z1e1E+WKixZ6iCU1Gqqd76Q2tNXbUyd+0tvlfwN6ti/isZ8AuQwY0/TT
 fEw6BkLV2mPGajtkHYg==
X-Proofpoint-GUID: 8xoIlRmxys62cLg6LKrp6l9UO0WFOxfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109215-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E76A5B1556
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Allow up to 4 lanes for the DisplayPort link from the PHYs to the
> controllers and allow mode-switch events to reach the QMP Combo PHYs
> for the 2 left-side USB-C ports.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

