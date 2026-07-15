Return-Path: <linux-arm-msm+bounces-119260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BoD8NZGMV2rpWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:35:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 319CB75EBBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:35:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UQRuEAmP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=btX8UjL5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119260-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119260-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61CF4301FF90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAE94657F3;
	Wed, 15 Jul 2026 13:29:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30C044C679
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122153; cv=none; b=M1Q+q6iezjmx+0ctONlBJntRYvgvRzFFPU0lDYo9+GbxtwHht2qXt/pZdrk/DXenR3vwkha1dKHCSMymGca7htB+F4oq3ThA/tQ6Kkpdg5g5MMDnIWcKI1O8j5nCXDMqN2yO2hz0wPNBUn+HuCEyCD8rtcL677JhBJcLlE75Npo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122153; c=relaxed/simple;
	bh=GzOOsRGt7BjS1JAsyiCzz9u/awbv5loIcnCVceWzTEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HtExblN89mvMnMZ5eMPfWhOjHWnzwNj2KX7touhaomS7MdxCr/fiokJkEtFrKbt5rX4cu2MOOd1Nu/uCdrDIeW+QEhoTF1ijt/JWpt5ZVPbFKnJE3ZU+YFW43UZjI7Y618cdiUa8gTTEVHrKpw+j7CXSdGaLuHslz4AiEnna8A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQRuEAmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=btX8UjL5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBclC13707725
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVHBlxWJeXGJFrYO2asjzSD1IwEuFXzGOnyE3qzwe0Y=; b=UQRuEAmPLakw2Yq9
	WGKbJjpnzHeqkGM10aWtkSr7o25OTdPiJpRneCl6UpY+nAcZerSWlQZGSS8rk5+Q
	91dRhgRrJmyqT55CT/N56GZU9xgIOBaIcpXc4Aufaxrov86WKCrAg96fGbCb7Kg6
	Wgztym83nrAsPKy9BghxCVK2FYa0uOdaTvqbt+TvdfDajvV7pqoyfJqulCNRU9GY
	yhOpSEp7H0ebSjuq407tJyLWIY6YIFnBSaRoNlQHksldgLi08TvT9awzITfbJpCZ
	uShW6sREE5OtxIkUMRKlsCCArUHjWHKZizaGuprYc8dvy0W8lQBbgh62L3zwVjqP
	eM0OyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmgvmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c354050c34so92495715ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122148; x=1784726948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVHBlxWJeXGJFrYO2asjzSD1IwEuFXzGOnyE3qzwe0Y=;
        b=btX8UjL5KBGVPjnf6WU+RCyUnKwB27Om9nkb5H2V9ARXJFq6B5mXK/14Qxvixenknr
         eWQEGbsOtw8prtLK9d1YjzRh259QlMJAwQiwh++m6xXQ5lmTEWibcnL9eo4LQ+dQveD2
         woA7ocPD4Be1eqlah/v2/l7qQAUXsEVwQT8+RBFJQi4Kuq1sp7nTV42vsavkml3v+vfu
         SBTV74za7jHXua1ep8xCy7wCLcU+YryVjuS/F2HKSe+QjH3vWoPXaRLNedYzghqM5UpU
         qYLtKcIVbGzfadSPYg83xS3tD4EOqMGBqa5YPYCC1iAMiraKaEGEyCp+JzQvPzmnv2l0
         vnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122148; x=1784726948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVHBlxWJeXGJFrYO2asjzSD1IwEuFXzGOnyE3qzwe0Y=;
        b=XurMtRENLEOpHqMUI5i4A/7FhDTvvFwUOmFw/lLSiI1qnyQIDf3Jtyc8uxCOghdiYY
         LoxLA41qWS4tvYV11flgXuyGDRQAon4xSbgI6BOPiaxTdzCzDRe8bOufNOQe0+aXsgjD
         hOOvDjM7ZweE4XsAZVECLQohd26RJkIjrCAYt2she2T1KT0g1LyQbIRcgqOkSBKUyegt
         /36uFWClqCa+Ckm/aS2JVgFbPmHYZEwBuBvIH3xOT1Q/JY9XGD+wWncHkigSQbUkXMW8
         aMkDyz3IQJc+x74ambZbia78kT6TzVfH21vBIvtY7LQpf+j5rQMzvnnzckyZEJOa/CvH
         krHg==
X-Forwarded-Encrypted: i=1; AHgh+RoEze9OAe6Vh+1PebCmC/hxlnG325ODVMbpNBm1R3kl7LiFnyv63KMCVb48SaVOoNV8M/+FJcRCp1Ti0JSI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+mYHoPA4o7surs8azl36mwnwcGsU3ys4y9TFIOmVNgX3iqg6F
	Idr8iyCkMPRKY3aktLj4EebOHfiR70TBE8PJJZOxgxVKq7n0wIHKTDrpUeF+KQ6M5d67znnwbxF
	05R1XSY2CRlTeDvsdE8COPf6iNAwlILAP7zkGoSmZAnoFYKhUIYEriXPt4nGHtC/4lVpG
X-Gm-Gg: AfdE7ckZqcUONdKKkJU5UvqxEDtnd2kqZkAz7GTKe/gzLXuc1hIf/2MeNS8GbcbSZT+
	omeeuII+A2lQ6621yw5455K2vv7n+mtn6WHlP8wsmMprdRaGExBXCWCu7+YTTB8NKKahAD6HpCn
	TGC3YT6eQ4gXN/Nk8MS02O//rYH02aP85Sb5k8y1GlseoGEsujJQMPmhMsatZLJtbk0KTOCxmZU
	eAsB2WFXACMsx5C/Y4f1PmXb0o3f5dRPSYV2v+XaFx0zw+0ycxFUjetYJ+ERhyRQQVJJ1JMk5n+
	8No8ohmIteFhoBXDNo088I0REzW65NQFzcSE3kUYAUAexZYLf7S/Zqw1wfEjERFF6tXwxvj5etm
	omdQ8v59YfI30TyKplmSz2RQ7J2QLU0FVY5Ui+F0N3dEGhA==
X-Received: by 2002:a05:6a20:3944:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3c36c131f83mr2942633637.16.1784122148013;
        Wed, 15 Jul 2026 06:29:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3944:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3c36c131f83mr2942595637.16.1784122147562;
        Wed, 15 Jul 2026 06:29:07 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4365b0dsm2735217c88.15.2026.07.15.06.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 06:29:07 -0700 (PDT)
Message-ID: <4c52d360-caaa-4c77-b1b3-d6b7e78f7fc7@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:58:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
 <CAMRc=MezSb1hohMsNPR96-hnTr0fjrqZ2ZDKUhwnOWycW3Muzw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MezSb1hohMsNPR96-hnTr0fjrqZ2ZDKUhwnOWycW3Muzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX8njAemEma2/X
 QQ4KCRFWpnSbAnVrfn2Ttvq1SpbmafzctIuZyFnQfG6Wr6Ef/k2S35wvMFCQwEF+msNDNdiozet
 FmJs9h35OpuMzilWeXu0cfH42bQCleQ=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a578b25 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Tp_YqcUnzpVuw28kZAUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: DYXaqpXqBVLnaECiTXhg9Gb5dOwFyhRl
X-Proofpoint-GUID: DYXaqpXqBVLnaECiTXhg9Gb5dOwFyhRl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX4OOF5be6ISSz
 RCYE0Kp9sC8xES9URM+xhiOXmBU1VtJxupNb5V20ZXIPfnBKdZG7TNW2y7Nj8QoVQ0/BcmeyCW4
 MG5r2xkam1mspUnYWAfYUKDHT8oRBycQAb7u11Schro46tER0s+cVoPSnwvTPZrxq2b1Mf5eyUq
 6rzZk7dQLm8iKbl9MpoPHS42pVKjCre6xJEvXDCeg9lZ+WWumbMo3cLi6KnJecA53C5Gx1Krumo
 7eg9vVEueHVb5ByboKE4E2D+3v9KA7n7QFv94vScCe6GHuzR3cVOnacyy7/cbUYeZKVtTdSlkPg
 IsxlWRbOyBwriybs4qxfO65ruwsdez+zJXgW760zCNM806O3upZxaCcdHWmbss9npSgI7XAFFYd
 o4R9L5khWrqhXjbC/uDwZ2xkpZNXhmnFbq3VYHzyXKanwXqxlpEj6qgi6pTqmpJ2c8c1I8V/SFN
 H0KVnrRPmvily20LEgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[36];
	TAGGED_FROM(0.00)[bounces-119260-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:sudeep.holla@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s
 :lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,lists.linux.dev,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 319CB75EBBC
X-Rspamd-Action: no action



On 15-07-2026 18:44, Bartosz Golaszewski wrote:
> On Tue, 14 Jul 2026 19:16:37 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> The PSCI "reboot-mode" node does not define a compatible because it is a
>> configuration of boot-states provided by the underlying firmware. With
>> the new firmware-node based cells in mfd-core, this node can now be
>> exposed as a proper child cell.
>>
>> Add the psci-reboot-mode child cell to the psci-mfd driver with a
>> named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
>> reboot-mode failures.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/mfd/psci-mfd.c      | 30 +++++++++++++++++++++++++++++-
>>   drivers/power/reset/Kconfig |  2 +-
>>   2 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>> index 7affd6bb09dd..8c6b78ac471b 100644
>> --- a/drivers/mfd/psci-mfd.c
>> +++ b/drivers/mfd/psci-mfd.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/property.h>
>>
>>   static const struct mfd_cell psci_cells[] = {
>>   	{
>> @@ -14,10 +15,37 @@ static const struct mfd_cell psci_cells[] = {
>>   	},
>>   };
>>
>> +static const struct mfd_cell psci_reboot_mode_cell[] = {
>> +	{
>> +		.name = "psci-reboot-mode",
>> +		.named_fwnode = "reboot-mode",
>> +	},
>> +};
>> +
>>   static int psci_mfd_probe(struct platform_device *pdev)
>>   {
>> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>> +	struct fwnode_handle *fwnode;
>> +	int ret;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>>   				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	fwnode = device_get_named_child_node(&pdev->dev, "reboot-mode");
>> +	if (!fwnode)
>> +		return 0;
>> +
>> +	fwnode_handle_put(fwnode);
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>> +				   psci_reboot_mode_cell,
>> +				   ARRAY_SIZE(psci_reboot_mode_cell),
>> +				   NULL, 0, NULL);
>> +	if (ret)
>> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
> 
> Why do we have to look up the named node here anyway? Shouldn't MFD core handle
> that already in a generic way?

yes. MFD is handling this. Will remove this explicit check.

thanks,
Shivendra

