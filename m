Return-Path: <linux-arm-msm+bounces-94116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFIOHmvsnmk/XwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:34:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A745197705
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 766AE30172E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07683AEF3D;
	Wed, 25 Feb 2026 12:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkiVe8Kd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZtKk9Qz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F753B8BAB
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022867; cv=none; b=oYSv5Zkx50Tf8zf7exFnLvgbGV1W1SLHlmgCn19PLKO9Pds2Y1wjGabFc9xZcjwCVBihoT1dxRrh6cMEEIBSBj4DoUGsN83kwzA6kkJexhIzmNryiHRO5SO1VHw+Pa487ySWxJw9/RL9QKx3Hic9mlIqbVGIYg2edBNZZg6eL2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022867; c=relaxed/simple;
	bh=TdhSuflbjwL3XyTH9X8phaMjOghQG/4HOMGxwZtfVAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKkCobgsoat5YozYusCNAraY3LpZSVDjVcmX5YYSdwbgxumPzzhDMf2fU4+KDmoNAEEfD2J0lTROVkmoSTlJxIRLluwniQaad8W+iKQ60YCcQ4+xi8t+rZWvmIKvRQuZJ09pUfnQK09z9EovOU5stOK0rQfn2I3GnyCOqhz0GXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkiVe8Kd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZtKk9Qz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9RuKO3056476
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JACFJ/VGwZJNnMBUOjPmygX4Hql8HmIMPgx6kxcaSXU=; b=WkiVe8KdjNJTxUKp
	fOdxAMGwLDgHcHB8Cym27hsZHg8oBr3un0CxlclfdAgFjhPf0XgRfVbNK7/1sevY
	RH5ffTtdq79kaUl1Dt1mePwz0E0rkPjLDCHw9Nf/mEo1QULJYccTiYE0SzzcjXfP
	jgwru/N7u0Q9gfKmJsnhKctyz/eIGLcrW0ZTkM0ch8rHEFvMqE9HNeWcRHXCeuBa
	ouvHSQD/RPXreid9zZFq7wAcqVEt4xNERVRk6/7QNu5kL7e0bPULMtqPh+gSFYBZ
	G2c7wHJ0TydSWNd+2pxN2pdqxvMrGPAMj3ZY/yEBBr2D/wbvEi8P9PxP7/0ZYC8y
	K79RfQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39gm74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:34:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954ab64c65so71926686d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 04:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772022862; x=1772627662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JACFJ/VGwZJNnMBUOjPmygX4Hql8HmIMPgx6kxcaSXU=;
        b=kZtKk9QzS9q2r64X7vAiOsscPndK+gd8YbLNkhJD+M/CfjJweIgN99MPqXDikfMiQJ
         /nPrzAtblhBmateS/8kdDxHLKaPStD7dcXZxsx4A9SyGA6z50BF5sgHGdv3WKh+y2e5U
         m48nD8IWGCM3dpi8mc2pZct6afIeZrUHtyckPcdAIUbu+WAYOT87uMqDHm89ZS2CINmT
         Wuapb+kX8OOTTyySTxLY5mFSCgcIf3zXAONTrJVWwQcQAzcKaFY+vhRxpESLB5me83Be
         G5kmIpFF8oUDt4yzQVx7Ibo7AdT/b44prpGsO1l6l/ZK/fsMhWBzc7mtrRdQO8nH9BO7
         Z+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772022862; x=1772627662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JACFJ/VGwZJNnMBUOjPmygX4Hql8HmIMPgx6kxcaSXU=;
        b=QsNKm+0UIdP9Xa72HhLPCS/jPMbFh9GnqwNjRA/KxSLyccgQJ751glEmYF14hXwmgZ
         1+ptgGAgN9jAXxM2yNWvVJFw2DXCs8NgDGt3Gtw82HcNxmOyiJ0KZd1AjJrTBUInNm+O
         VTgbctAgM2gvM6pgeyUfWDdMqGSrIpbZSedi1ySutsqz7HSfh8Pr0Z22nuLSB13CXL5P
         csflxG4cc0LW2DeIuckAe3/AFHPd+yMLqzHADWcRQ6vUogHgHVrsRL5cZfGgSpygtwS3
         qkpxuaH1HzDnTAd0twJBa5fF7Wrz7clsVT9N14ja+zYzyG1wdw1lX9q4EP/epgHlflQP
         B8tw==
X-Gm-Message-State: AOJu0Yxs6kmqeJhH7Ed15WGd8lwSkB/HPNc6n9RGlTqVm9teYAYtFxHK
	IAfkxzYv4hZIRXdx7rLR9eUo8Ac5+dNaah9q0hCXkgHTRXpSTJW2J3IhAiMFQP6IOKkSqjNMDXD
	zOC5UiGh3tYUEmZ+maAneZiQ2PqbtmUz5c6465DoHr9C/MxmleUqXKbAhf0G/xxfP8axy
X-Gm-Gg: ATEYQzza0+Ta/CcP6Bua8zoqaYOleQVPHKd5u7FDvbxVnsLZ5IiXOcmv2dDYARPqqxI
	LR7s4+BHYo3c7Q1QWhiALnfmg0gqgoIFMFYAIr365W7VI3vDI/dq5t3R2Y1ZjYmHruvgBx9nxdO
	sqXOspdFi3LzQGRcijeK2LUbsifmmQ9XdgXsmJr6hxz/etlkeJ9W6pd7Y4GIHAmrGVuEfhk0Th0
	GmCl2L+MW5VHpxDuwti61txtIj6d8GPthpsMFgHyHaeuVIPhp7eaRGe5XZDvahrf061rhlmpkmJ
	TAsLdsP80UeRVRoz9EyPTLwUIrzEl7F4cWoguXE0AiAxnDQjcSy4QrTY2FE7ZDQW7Ad9g8Pxf/E
	oTng2aXITi5NIrHtjrHzH/iJy0WBP2Zes+6f2iEpfbmCBHI5H9u7Kw6NHOEffiV1PYH0rIHOLmo
	tt9A0=
X-Received: by 2002:a0c:e013:0:b0:899:b649:6948 with SMTP id 6a1803df08f44-899b6496b13mr29383106d6.2.1772022861952;
        Wed, 25 Feb 2026 04:34:21 -0800 (PST)
X-Received: by 2002:a0c:e013:0:b0:899:b649:6948 with SMTP id 6a1803df08f44-899b6496b13mr29382916d6.2.1772022861575;
        Wed, 25 Feb 2026 04:34:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c5c514sm515848566b.5.2026.02.25.04.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:34:20 -0800 (PST)
Message-ID: <3fc99f1b-6e67-4e17-ba02-eba963714ca1@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 13:34:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
 <20260225-wdt_reset_reason-v7-5-65d5b7e3e1eb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-wdt_reset_reason-v7-5-65d5b7e3e1eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyMiBTYWx0ZWRfXzTnhh3ZNgBoT
 sxQhJGZtoU78ywKfUxGRd1gmSkGAf+ocSw3IQS/vDmmj6vXxNayk/yv8fUz/vEaEG8E6OAzSOI/
 DvbFgvZNuIIuR3BDlI2YwwY/olh9yUxTQxBUsEuuXaLac3ZzJtK1HwFV/RiDjFUyu8cKJyxY+ev
 KdHsJvt2jvKBJPcd4n6eEBitnBYBGTcK9njplbIv9LUX2Q4AbIQADT/k8tczgdz6ojNre7r4Llw
 Iy+BhHNFliFELSgZPH67N3Mynf9jKctXyju7sGL5p0mWSxXVixsTKAnH1tPxb/aKmym5nXe9QIb
 hgzs+iLJgCRZobzN08X1gKQtuPSkMuJBDmKtj7rXCiTOl7GNDP7Mtbk520ZzmkmW3fYkTa9SyeY
 z73+uqG0dZ8E+PaEhUF4umb0iSe6gdcin864ETUficfPX06ChuZkiM4LVjgUbosGQMKKJgQMxfq
 aLuBIluUqsRyEEERXpg==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699eec4e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gWikCEODulKzl4wm0QAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: V5n21aubktemsabKuw1SwR3rpiLwiupK
X-Proofpoint-ORIG-GUID: V5n21aubktemsabKuw1SwR3rpiLwiupK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250122
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94116-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A745197705
X-Rspamd-Action: no action

On 2/25/26 7:43 AM, Kathiravan Thirumoorthy wrote:
> Add the "sram" property to the watchdog device node to enable
> retrieval of the system restart reason from IMEM, populated by XBL.
> Parse this information in the watchdog driver and update the bootstatus
> sysFS if the restart was triggered by a watchdog timeout.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

