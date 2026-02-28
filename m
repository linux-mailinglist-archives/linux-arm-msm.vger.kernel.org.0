Return-Path: <linux-arm-msm+bounces-94560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCrAJvOWomn14AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 08:19:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE891C0F0D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 08:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77287315EBC2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 07:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC64836656F;
	Sat, 28 Feb 2026 07:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2i+SeIY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfE6Ia6u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97C5364E86
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772262947; cv=none; b=kE4nBkfeBW0k0iIDk1yXYn8TC5QJI7m4JHdwZb0CF7hSpuwfJFmfSHxUTYtpgXkrN7/V/pzQu2+ti3FeA+sX+Rg0E/jzr8OPwDe6ewBQeR0EfKwSQUQgBMF4QBeVPIh7McvkHKllztwT4k6i3D189m5ZM8UtxoJQEexE2AmB3Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772262947; c=relaxed/simple;
	bh=FZfK0THcNQL97dHkTP5bOx805q6e96mowiOv2wzRXvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvgvU8dZkGUcV3py08GXAJpQxCCoGLj/dNlNgc+ozbqRPklSSh3/Ux9djNAohQs/eF2z9gE6MwVf3HR+hCuqbS9v2n2CIEFOBsR980rdiW/IHybq799IstsBWqon8mVawnVDCnR6C9GamlrPZsnyUqXnIFpQUeQvrOKa0CSIlho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2i+SeIY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfE6Ia6u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6PSpF3135842
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cRT6K5A+POG6twMPbIzsk873UZaa2C56CAb63A18WK0=; b=p2i+SeIYx9HNRJG6
	oJIViTxVbzyet14Tu90rnLpCcZ1mX+XIeVFOKkqA4nUHuomBrPB7yJMDtFjzvY7W
	jCwlwT/zFvcdsAh00z3QFfT1mCZn5JBHTleYDqmZe2y3LpCQ04dBDubQGVLrmSad
	jxRnIe5VH/3N0YeAXZcfbYNt+qiofl8STfPXF2hFNhGe4s+RD74jOIFfsZkxXuQr
	qiGD2WDpOKdlTx068241iH9R/WWYFeAY8szFvFSWywn9k1jzVVyQ3AjG289RZFNd
	7s/R4svEwPDwNcv8XJmEgLemQ9h5nJQr75wbq1nLPnm6JWiLzE6G5oWrls03jUyF
	4jjN7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshcgdw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:15:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70b6a5821so2016974985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 23:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772262944; x=1772867744; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cRT6K5A+POG6twMPbIzsk873UZaa2C56CAb63A18WK0=;
        b=LfE6Ia6ugORNcsDklZDHZb4EMRVOnHH4lmh8rsuP174ki3gDO5jjycrCzZXCZ3X2ua
         6983U6ChZpqq2YTO/u9j4cLb8krTEepOtXFTd+fsg7WsY2e6DCDCv7OZYipgFj7DX9re
         t6Hp6UyyDeuypJNTMXz8EijYGbFBsJVZCYXfvdBO62ojANvwd+y4R+7sSYqiyr5eyyYA
         QWSfYAWRpkdyzugbQMDvIJ0DC83FYCFnjA+f5JlZJ+udLzGUvmmi2f6LL1oA0GLXP5Cc
         0xDY5OCvUAlLIO4o1JBcPolxgz+CI+YDI5xTLnU/Lsw+J4AZ0j/tx5vXnbdmokd8Jb/a
         dJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772262944; x=1772867744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRT6K5A+POG6twMPbIzsk873UZaa2C56CAb63A18WK0=;
        b=Ay5GwS+sOHoRI94KyEIMlg+CGbk4l03Dzzbb9mIE9BoKBcRB/KbzAQKD8ptj9gkB30
         THegSwNUKPNsMcp80BEnMcfX/ua7Wzo9P7gM+Uu4VQulSIcwgw9bBnUig/jxLwgF/UWT
         1TXH2700bCSktVTvoIwsGZhDHR5hx2SZQc3RKQeFkZ9e0QplJa2PBu/JL6XLnJA1JNRg
         lS+49C0N1aZMSJIg1IHcaP2sI3Cw5HVN+MROPTKS5UFrdJl5QEWESn2/sAKaww5pUarl
         X+tN8ZOhHbZKu6+RF3Q51uY8TJhu3SDJiSw80gg1Y4/C1wot7lJFhFpBygmmtwEy/+UJ
         uEvw==
X-Forwarded-Encrypted: i=1; AJvYcCWzUvI3eSkQ/odbi0H5XylDICdmNJ18xqyoVJsvsbB0hcP8GhSLZnLueNAeC9UMNEPTurD1t9/7dvLRnlnb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3KoF8GBtmKWubeWTVL1TUJWTCKrSms4bpicqCeU3/GHnTWHsi
	AS4TIBfK4YwK8TQKGkF+D5ZmFqOoRwedRwH8XZ/WBUjOy0gVjKmfLHec96G8RYEgqCBU6bcVITI
	afwrPuTcc+Z8tKjwCcLGTFysGEB4VQntWGnNf9BGnuvrnY+2HK6VRD5ryczPegN56EHED
X-Gm-Gg: ATEYQzwNf/6HEqVp/FJtlA2bt38UzU0rWI/f8kVlmTobDpPAdDw9X0sWgwQxXbeFX9v
	CiYpyM98hUVy03dTGv1Hm2Ef6AjwvIS6XhZLkVFfXpu8vgOkgDEk0lY42bq3vH9eOmS2jKqvvWR
	g+pCEqBkkFBm3LtD4mEXH6eSYnk2PO4Ji3QCUmBIl/VFnYnRQry4IqvVx+I/dm22kShiPkB1uUU
	R2Q1z5uaiBICljquM6OyIHAv/tLoef32PmoG6feiAzKhLqTRhTiyThQ934DqpNhZzsC0zP72Z2b
	zP1AvNT2yVSHd/ClEA/dBg6VSon4atT7F49OurSyJqJceex2DH1iV52/9dOSYmwLKBmsML+9AX4
	X7ikHt1w+KGbFu4WjQBuVbO+m4XOI3OqEsb2AttGamktz9P7HxY4rkTXzxxhuF/N6G8mYh2m3iE
	nA9beVCyBCc+QxI4jCGm3pHetjML7LB4bl8QY=
X-Received: by 2002:a05:620a:3711:b0:8ca:2cf9:819a with SMTP id af79cd13be357-8cbc8de8394mr652060585a.40.1772262944170;
        Fri, 27 Feb 2026 23:15:44 -0800 (PST)
X-Received: by 2002:a05:620a:3711:b0:8ca:2cf9:819a with SMTP id af79cd13be357-8cbc8de8394mr652058785a.40.1772262943709;
        Fri, 27 Feb 2026 23:15:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10a319f05sm2269020e87.50.2026.02.27.23.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 23:15:42 -0800 (PST)
Date: Sat, 28 Feb 2026 09:15:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: use DP controller
 native HPD
Message-ID: <nts2p6gwzvv34pjqst6hmiiscx4u4bluwuc2zh3slvdwewqehy@wb5gdwymycbc>
References: <20260228-edp_hpd_rb3_gen2_for_next-v1-1-aebc047eddc1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260228-edp_hpd_rb3_gen2_for_next-v1-1-aebc047eddc1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: F_zEXmrx7SpdgjcRkRyicwm6GYhWHYiI
X-Proofpoint-GUID: F_zEXmrx7SpdgjcRkRyicwm6GYhWHYiI
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a29621 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=197WrjzsBFOFWKeaOdEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA2NiBTYWx0ZWRfXzNkLBBLyxdND
 Au1mlmj1wx4A5WejoV+E+Bdi4jogcaMOm2PDR0+Qk/3E6/STVrwciuIVY3P8z/5EJ2xtrGujNbK
 6dE9mmhOvwZy5EZP/2PSyvqELJhbXVrv/oJFf5qP7e/Sm6knkdE5TVZmUDTSODuhTuSNOwA938c
 xNvEIbzlyRKkpBdzgxPKotQNVnA4wtKv0EQ1UoAJ7iAsbU9hKFM6Fpasz3oLCaDPsDQdDW5QMJn
 7xZ3eMJhsq0YqZFOBnIVtrMwDvuFqaeKismM+P+GMM15mOK3BeZCskAnCowZy8iiTCiPBfxbZNX
 GECgTV6SGL87bNqkOCimaA+rTfjMZGSyogCzH+uK575+I6NGMZYurKBDaQQQDF6X4u5bfjDqlp2
 FAzckHIpji0eyJg83a8ZUqcDQdnfAveaO+knQ1k8w8viXNclbgwqePjZtNdaQKmjMN6n4JaCzuP
 CvkSt50BOvJFfXFvv/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280066
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
	TAGGED_FROM(0.00)[bounces-94560-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DE891C0F0D
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 12:29:05PM +0530, Vishnu Saini wrote:
> The base device tree configures the edp_hot_plug_det pin using the
> "edp_hot" function on GPIO 60. However, on qcs6490-rb3gen2 this external
> HPD GPIO does not generate a connect event when a display is already
> connected at boot, causing the DP/eDP display to remain disabled.

It is an issue in the driver itself rather than the question of hardware
description.

> 
> The DP controller’s native HPD correctly detects the connected sink
> in this scenario, so continue using the DP controller native HPD
> on the qcs6490-rb3gen2 platform instead of the external HPD GPIO.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ---
>  1 file changed, 3 deletions(-)
> 
-- 
With best wishes
Dmitry

