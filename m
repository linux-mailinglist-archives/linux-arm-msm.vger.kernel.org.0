Return-Path: <linux-arm-msm+bounces-113382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0vu5Hn0uMWq8dQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:07:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 177D568EA45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:07:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b55Ly0sR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X1VXsUgr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113382-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113382-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86BEF3008C1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CC6436352;
	Tue, 16 Jun 2026 11:07:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD964218B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:07:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608059; cv=none; b=DimtkRx3PwT/FjiI9yLPy0vaQhvUt70ut0wg8iQnE3BJ64VJtyeFwInWL94yrZ9rs2f+mZD2SAM3a2PnnbPw8e/OMdA1Yufc17BvXu8HiamVzzdG/EXMVtRMWZj5hPF4TEyPtjvV6BXQ/f2DXb+oes2M0hmRt5iXVGM6cEMK9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608059; c=relaxed/simple;
	bh=noV8GPXQEbh3oPCg7ukPD94RuXQaEsZtIvjBMPtvyHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6j3pVSEg2zI9Cbbw+skHo3Wi2sKMMYVjmkjrz8iZRvsuucqs9iF2XeKPGG3GYmTap4AUkrBwxAUs0kk8qCNduJLDmQauphDiycap43EusZB4dkiDN9w/OY66mrOwsipD82BVJmxHR7PK+R33bYw6zDMlHjltUTqPyZRbHIHPHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b55Ly0sR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1VXsUgr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9VAJ2894197
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g9TCzJnPYaTh3bi8cG95ygiFsTbmL4ZOCKU8a2MS7yk=; b=b55Ly0sRBNMtYgld
	Cr8wJrDRhEiXjpF1hQ2Y2CA7yhIlBC84x7vZ0gKuGggvVSecsIdrlkUgtqr25B5Z
	Q1vqUH7JG3r8dLuGK1zJTHvSQtlM4nMNGB4fM88sV3GVeKi/EJqUB4oziwzsUwXP
	o2weY1MQ3mSZl1998lCccGvyfJciGgTKI/4hYDj+VSrwitxKCu3YrgTQaH9zYhtW
	n7Y4KzbNKy3lw/V6ZubwMcqcTLrS2GBESuD6dzS7mCRQ6KEZpr9ks2eIoUrVCoa/
	CvB5uKIKtw0wtGQqe8sTGsdAuO/SUTI6jFswIWssSzUk6ZhypGNqrNxg4M4jT5Qj
	UFdGRg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253gwhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:07:38 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6f5350426so1854861a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781608057; x=1782212857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9TCzJnPYaTh3bi8cG95ygiFsTbmL4ZOCKU8a2MS7yk=;
        b=X1VXsUgrGhfquZA4nTsSLKInQb1gbGfEuEPGiuOyihvcnVRLzvkNOb1Lm5SixMtcvJ
         b45VMvBBvzRfJgveeOTfd6vlSw+mm+iPgtt21jU4riwABd+1bX2dLZ3TO0JtJVNbKUbV
         pJK4W5MLkv5u+1Kcd7PMb8qICUPy920ecJCWMpb9dqz9VuNc62r3VrUsk0JT9djN2oyi
         rWuZG2tgl9LhYAyw1OB9vz1kBJoFn34tkOI6OYqYBe9l3Z6PvTRhW8crsH8tM+NkbmWb
         dB8T9mZMqzoqVE9cz8Zv+HNP8GBGuwkp0V9MWHwavD2KKWF7Ddd3vO2A+qjXw2kVBCJ3
         msWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608057; x=1782212857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9TCzJnPYaTh3bi8cG95ygiFsTbmL4ZOCKU8a2MS7yk=;
        b=kNenslnb3hkNxggk0DOmHTxdthB0cwm2gF0vQCzPuNpN7Iyu2i7w/qXYPVKPiO3ABF
         3zAGkoCbzAAG91ihVk46TO9lZA/msAO5ffHlLRsAAHJv8VAnJZrxLypixlLC0BXcFK2Z
         IMXsoa583uDQrGvQ3++HLppyH3ORhUwJylnwAPnMFxRaSjzMF5v0+kJTx/pjB8qtlgHu
         FB6wRwDkd99Rk1XuXhP6UjausUvBGKTXJK1ZNtPACAF4rYmXRaEdu386PI8NqE+q6INl
         PMQUf50d4I1vtcYuZG3HzDAWmce1ixsnt6G20rnr3XYUjliNVsUg7mXXIvv0/kjjDpBG
         adJw==
X-Forwarded-Encrypted: i=1; AFNElJ9zBsZVmOz1DdIVeXbtFRE+inGBxOZBZd4nOUEqH3Rt+MTn2FuoeGC48IBA/FvSSLYc2nuI0dviHM91dV14@vger.kernel.org
X-Gm-Message-State: AOJu0YwKOZTUxPXzJdmPXvdqSXY/zVkrARQXQmt5TzbQHrOG+Uy6UlCe
	sXofzjtL3VFY9P++5KbN0YNpmnuNNSkfoSV+yxH/fZWRXWuTr8FdPEZX7LTNEWtU7Dn1NVJftcw
	WeNaaFoq2md4Ai/GvuGHzJNOWVr9aDd5MuCTeTeXGwvuNuB5Kep1oJXvCXv2NPTQIN+pQvVHMTt
	IB
X-Gm-Gg: Acq92OH1K6xetCU+3eUpFufI4/k97kA7VG13qvPqh37BI3P/oCu1SXk9kO+iaVexgjg
	ePwxwutP+BEJw7dJgDoFnAbC9eYCdp0t0mcrCN0FK3DcGdvBEvxz3ecBZzwcyfR34plJ68Pz8Hk
	7r5LUh+mI8MDDnga/SFulA/9w2/U2p/LgnhEaVxWZ33dJ3zmHSKgbFtlLpd7RnuCn2FBAzz36Lf
	QoIvf5MdcYCHbCMy4AW0x+416Gj8etdE4QI3wvVw8GIyR1CHN/xtVn8AGGgVteN/e/1pSLDNmlI
	J0yw8Gzat/4883vxMGbmrk9b7f/ZqNfQLSRByKSd2GCFcLQQdLlfxGzyaShIjIOsjUQe8HHpqE9
	YW8ddMuqv4wiieh1rItvJtnjFiqdtWdAgsO1BhMav1oJYHA==
X-Received: by 2002:a05:6870:f605:b0:42d:a3f5:f662 with SMTP id 586e51a60fabf-4426d65bb73mr6608954fac.0.1781608057357;
        Tue, 16 Jun 2026 04:07:37 -0700 (PDT)
X-Received: by 2002:a05:620a:ac04:b0:918:588c:d095 with SMTP id af79cd13be357-918588cd103mr1082007285a.8.1781607636521;
        Tue, 16 Jun 2026 04:00:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16915dsm3484068e87.19.2026.06.16.04.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:00:35 -0700 (PDT)
Message-ID: <0355cf52-b9ca-443e-88e7-2e7457e4b576@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:00:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JTMeL4PGE3ANM93TYSF-qok6PT7yvFbN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX2CKYAvevHeiB
 GGJZBKYFL6nwryLVuzItgEhlX46KeGJsUpYUsOGBte8IDx4tY+i6U34mK74p+p9YhLwXscNPjri
 VOwC6ZaaaQP2cNDH+wE+Ry0ytwLPTm4=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a312e7a cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ESxSkoLR2Ta5atZaLGwA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX03Ze3DUL3GuW
 v5F0lyXz+vYKmYgSICldXO5SQi8LD36M+RDnajqdaL8yIcL5m94bctwoqNGKnWpFVSZZaihpt9s
 kDTqdBLSqhjd8wHbzct7F7Ls+JrH+m404fTE6eEZI8WiAzSIGlSizLd0ZASmh+a4QOdkncU2gLu
 LWFb9CESsc6rfl93g/IJmsggAL7RN7DeKJq3CsiJp8lGdDYThcpEJgVqSMBA7cT2zDlWDwhJBoo
 /Zi5vAy8C0RIkppVSZNH0T0nJCvIOuFOAHAMfm6jAp/6IhUFiOwL9cj7Lps9kij9O8RElcJl6+4
 hQTgea+ATeLB7qrJALAwAKTZSBcbYfnfN5xkP4j+lz14I5EWLOfO6xr6JR4R1e+DydpA6SRFSvw
 1keQZGBdySvp+B75gWKwouiyAKTkD6Su8TNan6fCGL8N7rm5WaG6Weozui2afTXdDhxc5oMkn+D
 fBb/Bu9fEtifBUNKlyA==
X-Proofpoint-ORIG-GUID: JTMeL4PGE3ANM93TYSF-qok6PT7yvFbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113382-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 177D568EA45

On 5/26/26 7:12 AM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add SoC-level device tree include for SA8797P, an automotive variant
> of the Nord SoC family. The dtsi covers:
> 
>  - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
>    for SMC-based firmware communication channels
>  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with UART controllers
>    using SCMI power and performance domains via scmi11
>  - UFS host controller with SCMI power domain via scmi3
> 
> Also introduce scmi-common.dtsi providing the firmware-level SCMI
> channel nodes shared across SCMI based SoCs.

"across SoCs with GearVM firmware that utilize SCMI for resource
management"

Is the scmi-common.dtsi actually any common? Are e.g. the interrupt
numbers going to be stable?

Konrad

