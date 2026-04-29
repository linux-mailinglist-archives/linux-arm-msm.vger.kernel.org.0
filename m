Return-Path: <linux-arm-msm+bounces-105236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIUrLbkZ8mljnwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:46:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 524724961E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99C2F3070ACC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E228D36CDE9;
	Wed, 29 Apr 2026 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ef4lgzEQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCOJrjCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1959C366575
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473640; cv=none; b=GDrpbrjAXQ7oEgEaEljy0ke66z7UinhYet7/RhgpKWRVNXVyoTtWyRhGrXzYB+eZyQ1WrMVpPh/vS54sjmzyYRiuXg1mOCUSaanWv2aq9/nkP4z3SbE1JG4U/ohb4b72DxxL1ZwjDV/QqSXYCuBzGlsyLVj4tYmdv1yathCNoVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473640; c=relaxed/simple;
	bh=niI+3mQl4evkN4UDHgVij5jImVtE8gOR0Lbni2M5DOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dY4uVwAqAWRfGHAwIOah2mi7ZNR8JemIHcAjKT5UZTTBqFOKgZNu2gB+iYxqXO0PebweShqoQ7NpCRGdkfcPJhGnH/EEMKxW7VC+u2susj6FeXvqgxRonm1o56b0eieMcdoGddPT3MSiEdUXmmCkzcfkPCqtCEbL5+AvQ/zLcFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ef4lgzEQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCOJrjCo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCehJb317362
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTvtklw7T1tb7yJFotQqtbbrKTIyjQvnhgz95DrLbqg=; b=ef4lgzEQ0flJSMRZ
	KCnuAiih1mbTvqZvzGBYQboodTPMVkgCKfwmA5v0NlHDxRLUAe5/usrRvZ5DunCd
	Dtjq0bLjjK3NrCNYRkODrOqac+6ckiFHH6fmetbhcIKei5jHHb+guSZrHefwBrGg
	FoyPOBVEtGV92AmsE50FouavHUlLT8wCyRDvN4QBXV0ev0XkwZEoB2P50ez9bd9q
	7h7a3sEek4My4c3w+FppcLU8QeCdwUdddAENA6g/bEViMqXg4Op+3Sg7d7SJgik3
	L5inTOStIvMr3tGDYjL5P8c0QrSJPEcn26vs2X3sbdU4Ugl+yq7SJ6TS8ccR4a6y
	KsSeCA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t8e92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:40:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da99b90f6so14966128a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777473637; x=1778078437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTvtklw7T1tb7yJFotQqtbbrKTIyjQvnhgz95DrLbqg=;
        b=UCOJrjCoQniY+ZspQrTPdxh1CP37X+0Vw6j/gDLdk8qtn9KDdemql1OErNxg5iBn0a
         Kn9nZpdYg5vqzsCTa3SBeBJhUNPR/EMXa1YgmV9KT4Ze9Tdn00wXCs1oAcmooouQnHL+
         qkPPtvXX93qgTYllTbqHaUvZiMB1TfVmc8a8GS26gnLG4Jeifedjx63zEVt/06EQ2m0m
         gFntdgqQE1ZjQZyfKMMq6lISSd/3Gn+4maihhUfeOBdsnq3Aqnu90mNHEXdddLDhd5rJ
         FzqlMZrJveOirNDzOu359iO9qCt1c923C/nL2q7LgfUG8ERiKGJ4X4bqKfsrF8P5+ccE
         F2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473637; x=1778078437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTvtklw7T1tb7yJFotQqtbbrKTIyjQvnhgz95DrLbqg=;
        b=nOVqi17TKHaRQpdhb3ZhZni/MOq2PXZlopO25E3bqKiel///9xDp4iZ+hcudWkKy29
         t+uY5epZ1Fhrs6gqmPa//aE8oP26TPBI7IMqHuZ9cnciDUvwHfs1l0kMu9pZRRwsLePc
         +dDyBftR8+XSe+1NlwvkFywTZyBXayV1dhmJhlAIbcjPkBsqwKmDhiHlpMcxj5+h09Sf
         N8MCfWWfZg4tizJDuujSz7hyL7PVTWTymBTxxGCAkhgLrrr+bYR+cCIAchYmkBDEnQJR
         nisD9YwNZrWnGXjLIn5EukH42mfl9ukBrfl4K+FMQl9b9JdVOy5CO0zMaZyFwmyWijTA
         42qw==
X-Forwarded-Encrypted: i=1; AFNElJ8imXF3+fwaZ0S+nHxqYc9fDf3wHm+7UrOJyJ464InmacxgJotHBNwuJ3+WBkLLTwuAbSJrLOjfCMQXdG7m@vger.kernel.org
X-Gm-Message-State: AOJu0YyCOmA6Qk+FhWmNNcVYtcE1khovx4yWlr1HTHiia50PAbUNbT22
	OyP2zOV/1zxOUcjwY7X7LbV/AZiMORSi1AFf3W56aw14RyzEZ0Bq/+s9IAybLStsxxTFpTRY/fY
	pBIBJBa5Kf/bVaxqknmxawCI1FnOpZzKk2bQ/SIRgHJqcPLue0SzvlX/4XNOCHLPIUiNQ
X-Gm-Gg: AeBDievpubgYGlv5DeXaUX+uJnUhdl+/2q7912VHD4ttlB8KIERFq5B3EOyvXiRksd3
	CdaueEC32j9D8DeaNOldOeTZCsGjHJFeXb43kCgSHoThkCZFcVM16TVcGORYVQG9ZIQjL4+tnCB
	0uBq5lvPi1hHT1ELuDv0JGcYB+AUSfOzQg0UjLdIbfFB1r5QQd+xHpr7AcxwxMYjyAi6kUlg8DH
	8e8PHWDesW6iElKxSDx1DV+wTp6DVo94VsrziiQjqf0EFllyYc/xQ+LzEL2yXqqvRv/xBUWpNnw
	BccMoCx5i0ilEMN7X8II70jQonZb5jrlCugq1sJijxB302NJmHVkP8MIokwuOoLwG8CYiCZOCuh
	dypVERLqsSE+bIm4g3+EdQ97iW2yHE0OAuZi+gqCI2dzeZd+sSSqXAfr2DI1gGhakRF3vR9YlCc
	zm6KhOU6TeKcHp/8wQzC4Nncia7jaq2L83Kgv+pjYwJC+VmzLlBCc=
X-Received: by 2002:a17:90b:5828:b0:35b:97ba:acee with SMTP id 98e67ed59e1d1-364a0d2ca8emr4196254a91.17.1777473636549;
        Wed, 29 Apr 2026 07:40:36 -0700 (PDT)
X-Received: by 2002:a17:90b:5828:b0:35b:97ba:acee with SMTP id 98e67ed59e1d1-364a0d2ca8emr4196167a91.17.1777473635798;
        Wed, 29 Apr 2026 07:40:35 -0700 (PDT)
Received: from [10.190.200.117] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303f52sm4214118a91.16.2026.04.29.07.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 07:40:35 -0700 (PDT)
Message-ID: <e494ba66-3f8d-4d71-a82e-b37f5b34d45d@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:10:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 05/13] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
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
        Srinivas Kandagatla <srini@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-5-dcf937775e73@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-5-dcf937775e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cXGGAc58uaEAsLwNv9oV4qbl4zsSi-T2
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f21865 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=U_Ea8TlPRqx-BgSQmf4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: cXGGAc58uaEAsLwNv9oV4qbl4zsSi-T2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0OSBTYWx0ZWRfXwmh1fZPRDr0c
 sVJD1uqdoWomwBzkoXIcm/EB6oEVgV9cnTpCOfDLofZlQsH6WkkTQjoIrRHdEqshDovyC4k3zWY
 aiD4LYRh/D27teMUkJag2E8DfxyLZVKaRrZ1+2MCLLFQWShHMhZFlhf5fdcNoS+V6ZJYnsrDpGR
 9VkUfzIXXRBxZupCFAj/C2Jqcmh1bNMdWzao2/zJJFGhiRFoWszrk3Oym3MBr/MrYDYj2VFnCSu
 yVRGyNZWKw9lNiDomec8oI54ho2CMDqJU2E3qJISMkyHTYePTl7PDLbT06hxCSd0c+2zv23ski0
 7lFqXUgjE+xXEgo7vpAQ80M5fdudCxWRcpvN1dH8XNp301QNrzmIF9+oMpXby4lbrr82/o+ZUqA
 XQ6s779p3MDMELuiUGm3/xfEMFssayB2INgncXZZ9wK1YeSEyuMf8OBKghaJcHSI9ePBIqHub0Z
 5gHf7XWmcBe56Uy2wFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290149
X-Rspamd-Queue-Id: 524724961E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105236-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/2026 11:04 PM, Shivendra Pratap wrote:
> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to several
> drivers attached to a single device node.
> 
> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
> PSCI child cells. As the first user, register cpuidle-psci-domain as a
> child cell.
> 
> Update cpuidle-psci-domain to probe as an MFD child and use the parent
> PSCI node for power-domain traversal.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                           |  1 +
>  drivers/cpuidle/Kconfig.arm           |  1 +
>  drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>  drivers/mfd/Kconfig                   | 10 ++++++++
>  drivers/mfd/Makefile                  |  2 ++
>  drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
>  6 files changed, 58 insertions(+), 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c871acf2179ce16c80b404027e6b969c7787a6bb..333b01fa00b8fbd15e6f31a6b9af47600411624e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21239,6 +21239,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/psci.yaml
>  F:	drivers/firmware/psci/
> +F:	drivers/mfd/psci-mfd.c
>  F:	include/linux/psci.h
>  F:	include/uapi/linux/psci.h
>  
> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
> index a1ee475d180dacab245510674514811aec337ad3..1a1316d11e0a2e4f61801586229f5104e2435865 100644
> --- a/drivers/cpuidle/Kconfig.arm
> +++ b/drivers/cpuidle/Kconfig.arm
> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>  	bool "PSCI CPU idle Domain"
>  	depends on ARM_PSCI_CPUIDLE
>  	depends on PM_GENERIC_DOMAINS_OF
> +	depends on MFD_PSCI

Should this be select MFD_PSCI?
We're seeing bootup issues on Glymur when MFD_PSCI is not y

>  	select DT_IDLE_GENPD
>  	default y
>  	help
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index b9e4ad7d43a3310a76ce62018dff0af1488e33d2..a2d01810f2957abdfa52ae66503dc0cbb205f163 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -17,7 +17,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/psci.h>
>  #include <linux/slab.h>
> -#include <linux/string.h>
>  
>  #include "cpuidle-psci.h"
>  #include "dt_idle_genpd.h"
> @@ -122,14 +121,9 @@ static void psci_pd_remove(void)
>  	}
>  }
>  
> -static const struct of_device_id psci_of_match[] = {
> -	{ .compatible = "arm,psci-1.0" },
> -	{}
> -};
> -
>  static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>  {
> -	struct device_node *np = pdev->dev.of_node;
> +	struct device_node *np = pdev->dev.parent->of_node;
>  	bool use_osi = psci_has_osi_support();
>  	int ret = 0, pd_count = 0;
>  
> @@ -181,7 +175,6 @@ static struct platform_driver psci_cpuidle_domain_driver = {
>  	.probe  = psci_cpuidle_domain_probe,
>  	.driver = {
>  		.name = "psci-cpuidle-domain",
> -		.of_match_table = psci_of_match,
>  	},
>  };
>  
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 7192c9d1d268e93d1557ca6519ac96056e37e221..75ea5b47315cedfd1153899eef28614a165a14f5 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2376,6 +2376,16 @@ config MFD_KHADAS_MCU
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_PSCI
> +	bool "PSCI MFD for psci child cells"
> +	depends on ARM_PSCI_FW
> +	select MFD_CORE
> +	help
> +	  PSCI MFD registers PSCI child cells and exposes them as
> +	  platform devices. Child drivers are probed only if enabled in the
> +	  kernel configuration. Select this option whenever a supported PSCI
> +	  child driver is selected.
> +
>  config MFD_ACER_A500_EC
>  	tristate "Support for Acer Iconia Tab A500 Embedded Controller"
>  	depends on I2C
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28afae975ac61d282b3b85af5440119..36e872b11b995135a04ca24c33fd3a4d08e4f49a 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -24,6 +24,8 @@ obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
>  obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
>  obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
>  
> +obj-$(CONFIG_MFD_PSCI)		+= psci-mfd.o
> +
>  obj-$(CONFIG_MFD_TI_LP873X)	+= lp873x.o
>  obj-$(CONFIG_MFD_TI_LP87565)	+= lp87565.o
>  obj-$(CONFIG_MFD_TI_AM335X_TSCADC)	+= ti_am335x_tscadc.o
> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..7affd6bb09dd83452664edeccb09290fe4f43186
> --- /dev/null
> +++ b/drivers/mfd/psci-mfd.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +static const struct mfd_cell psci_cells[] = {
> +	{
> +		.name = "psci-cpuidle-domain",
> +	},
> +};
> +
> +static int psci_mfd_probe(struct platform_device *pdev)
> +{
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
> +				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id psci_mfd_of_match[] = {
> +	{ .compatible = "arm,psci-1.0" },
> +	{ }
> +};
> +
> +static struct platform_driver psci_mfd_driver = {
> +	.probe = psci_mfd_probe,
> +	.driver = {
> +		.name = "psci-mfd",
> +		.of_match_table = psci_mfd_of_match,
> +	},
> +};
> +
> +static int __init psci_mfd_init(void)
> +{
> +	return platform_driver_register(&psci_mfd_driver);
> +}
> +
> +core_initcall(psci_mfd_init);
> +
> +MODULE_LICENSE("GPL");
> 


