Return-Path: <linux-arm-msm+bounces-94496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K0SKW/LoWm8wQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:50:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B1F1BB054
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB99D3032242
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBCE349AF3;
	Fri, 27 Feb 2026 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/rVd4Zu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eWKg7GQL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3EC348880
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211052; cv=none; b=aYo01X2kWirmKk3MZtoamwBoBG3cEw5g1m11RwFBIYw/SziPJvLCBYcsa/+u4TiExVakG7dd5qjXOcSuTjfNOS1QVvacexBeiIxnPEHEUmKHyRnd7XOJwt0kKwHvxd99J2qTtBPIpqHfBV+N996e6DG9FOQrba6kn5S4XOCpLxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211052; c=relaxed/simple;
	bh=tMJRA9HlEGHjApTAWjol7eFamZttwM/WrxzEk0sMrYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0EVAa552T4jQ33UohZscCw6d0VFXvMoTyjwa6EIUUfrwEUc5BqxZKT5/LKqmkl2QIYV4kUAXqaKUjFX1AEnTcJn3aln8aPKcEyCDrHWxpE5erEU+L98JtlnisUKkB4d+m9g8mxJvSo9WogvvcovewfFvs17aXFBVkryKLyuWsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/rVd4Zu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWKg7GQL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RGin611332071
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 16:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bQJD553MBZTSYmF1LGKh4sLQTYxS1QYALIIm58OLJJA=; b=a/rVd4ZukBuz+Er8
	OvWIGbgbBuJ3xFg4N8n8fr/Ci7XQ69zdPmofTfef0eM7GzdH9EjFXwFk9zcpYvJs
	SnTkyBTBZLv1HU+APfzMTH8MfHH93AsOdbYpqiFhQYtDkWsfXSiJy2EgIdd7YaWw
	72iAYI1Xy/sC+7Pc+JvKlTg/HU0NKRMBuBMTSxj69O7RJt78KRjC1Kj0PEl8tNuI
	cZ42JoU9hMoeAA0qYeB5AHXKJGSPqcYuxWo1+7CnCrBCWEAdP+/KNUunj22lCZw5
	lBqLGSwySPe6vMAq+V3FYpQ5XvpT8of2Q9o3x2PK8Gi19P2RrrFz6nVA+ztE87kf
	8ucj0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck9f015yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 16:50:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb399597fbso169563185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 08:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772211050; x=1772815850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bQJD553MBZTSYmF1LGKh4sLQTYxS1QYALIIm58OLJJA=;
        b=eWKg7GQLGL8LvZ0qo3+GZA6SnUTCtZaL/7dsfwEwb6M5yftndN40uWt00o58Qb0nTo
         T6gozrYeKCGqf3FKwwT2xFmk4xYjp0kr4FkrhTmRrf0MUP/Z93jw5tpTyrLg8+vJxLlf
         h6ZCgUWR1aJV2AOeqnDT8Mi2RIjstWX5nJF0N6A6QDrnfEJ/3c8P9FK3eIoG6iRN9f8L
         ajFF+eZgcAzrlpmG8W9fMAYx8qOPtKdDAnAxfRNQ+gpkuw9Ad3qBNLq8c8LDx8XM95qy
         ftOP3JQ6iUnqyOeB/dzqlx1L3C9Xsqo69VAGu3VrD8/JH9LEA4qwhx2um+ZgXIb9mGlb
         5/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772211050; x=1772815850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQJD553MBZTSYmF1LGKh4sLQTYxS1QYALIIm58OLJJA=;
        b=diTGZL8iY3o213lNOFVrS+EeLiEdzSe68vjYYIlNbAQTq/VpbtXtUi9CHz+KbPBIs7
         DbNZx3rhg2wjA4hYW/WNB/t+T1fF5c+CzGDkWtOEqX1GSNR5jxA79Z1IJWr93fEZWOlz
         9fCrsmfsFF/qyV1U6ND9P7N9mdycMbXiqLve0DAv1N3mv43qd+kk6gChpIpX8+H2tISf
         xUQsGIEBgFc4+cj4u8hCmwG3eNKoZPBelLH8Ve3yGKXj9feO9PPH/XJGOHt9wQL/xXKc
         cQNzAvC4Z9GYgAbhhc1OLoJBLwFY1VMHCCc97yxNZycMs3H7xi4a1X/dVO4R00D1dEcd
         TZuA==
X-Gm-Message-State: AOJu0Yz/fD8RTPBoDL5PamOicT9KMk/FMrPYS5jNr3XN8jxZkVn+FMwT
	W0vnPSJU/F9GXi/VwN+e1Wt/cSnetuxIOerTpv6H3H7dKm4csSN5/sfxCYF16IvwMpz2LS+l9Db
	NkQTAb3K/KwTmj6A5elnWP09FCdEyba2wnKvcmW+N6aWhRYybUEokE5qNWhDVZ7p0H5Tq
X-Gm-Gg: ATEYQzyKNw674yfscc0+Jzdf7dCJFw6UE2Js/vHKjj/Vi01fPXNeOONwmY1C74USmJk
	k7t2/eftjW/clqC+XBEQ9CyQyI46+rFz+Yl6V6uT1BZNV2oG1y9iKG9LDNvbCvklFpkd3kkTyuO
	fWRqrJtVXyHmeUof0pxv/w0AN2iFtJdmRyVYfoJmef2qKsMovrOYVAOFL0SLVbuO2C71EIKS/l6
	HkHhevYF//pHK8ReeaT1DaJIOf9+c0i7CJ+b40B14UKyNakPclmE7fC+Xq6zayZtPQ9HeKumgPN
	5He3WxcPsyDtMJpitBp+KAvQLo3T9mUWcJ8CjWgzl+KxJEwmTpWOEniPwfjzjQ2X6X4CvP/9k48
	q/BQCeHAacMRooFEH+jpodKzRxjj4EtbaAXuam9IF5o8eveoin8KVV8pZ/73cWJ2lcxJOANE/eL
	RLXtI=
X-Received: by 2002:a05:620a:4405:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8cbc8da1ef9mr335117285a.0.1772211050153;
        Fri, 27 Feb 2026 08:50:50 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8cbc8da1ef9mr335113685a.0.1772211049631;
        Fri, 27 Feb 2026 08:50:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6d26dsm1442807a12.16.2026.02.27.08.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 08:50:49 -0800 (PST)
Message-ID: <92348d2f-1df8-4844-b41a-e458ea470a83@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 17:50:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-usbc: Fix out-of-bounds array access in dp
 swing config
To: xiangxu.yin@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20260227-master-v1-1-8d91b9407fdb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-master-v1-1-8d91b9407fdb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE1MCBTYWx0ZWRfX9fwMtxSe+ig2
 6QH1pDhLvcTgCm7skXPYjebNJNAWqXG2WmKX5ze0svXq1fAQTyfoeePH3qUegPWWV6cVznO3XCR
 bnX3kYsmrnnxq8/2si34PbLqoDMV2cjgKSfGr/ohNgxZOlb7gZaM9hq5UI1S/yTHholGBQyVkRL
 0+iw8IB2Y8kzB9dLv+I0+1YWNLzOEdemzNBTmufrjDjQkRZGOUUWy3c4VeWtqHAl9TlIsoofwJf
 qXYDnOzNpTlbnBzQpZDVdJlSvXUMYYaTRXPfcJ/8JyExSv4PNUPhGMcOpVd0EdUwH9ujxlobYvy
 TieDfswcpw2TeL67dbnQzeo0XBh0/GceJm6SPOIPT1z4aFd0FeiW7GD1/RsKhUq3UVb8OINlbUz
 xzmKXJEr/pnsRtqAeRcOKi9k6s7XMpLG/e5UG52wjWGxp5Uhsxghik17G0MqDQTh6wk64CmrdR+
 S6DaZpNE20XSVewiWNg==
X-Proofpoint-GUID: 7dC5f3603TWOZq6TivGmMSkCPh750c3h
X-Authority-Analysis: v=2.4 cv=bIsb4f+Z c=1 sm=1 tr=0 ts=69a1cb6a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=r_RmVpEsDzQWxBcQmW8A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7dC5f3603TWOZq6TivGmMSkCPh750c3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270150
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-94496-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 42B1F1BB054
X-Rspamd-Action: no action

On 2/27/26 1:15 PM, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> swing_tbl and pre_emphasis_tbl are 4x4 arrays (valid indices 0-3), but
> the boundary check uses "> 4" instead of ">= 4", allowing index 4 to
> cause an out-of-bounds access.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: 81791c45c8e0 ("phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config and DP mode support")
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

