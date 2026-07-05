Return-Path: <linux-arm-msm+bounces-116533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GeDIMN8oSmqH+wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 11:50:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24275709A45
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 11:50:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=imbAsPdI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="P5BRU/Za";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116533-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116533-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A978300B9F4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 09:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372CE372EC0;
	Sun,  5 Jul 2026 09:50:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AD625B091
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 09:50:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783245020; cv=none; b=oYAWKF57ysGpr/iUb+rRvnV5UkoL3EG0HirTWLKOkw5w5NhjIZmumkxcbnVSfSzft/caBqcuTHAnCYY4TerhCSnQgSjzkVvxeie9IIG++sDINJ3mSAD9Qne0L3DaEcD5rpcW2rBNmBeZ4JaJ8qMG6b09cTek7L6D0kgbvwK4Wec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783245020; c=relaxed/simple;
	bh=lN6FGnIyO9hbyJ7xO4gq9+8O9xbjfOEMppV/97DZ0RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d60SvRKFN2YQPDIoLd2umUbzlD69p2qg4lAKqCgTF1xYH00KsJOuGRmZG5GcYqqZPkC3c215JTONLllNk2PdJEeALhwsvWadvovoiJbl/YJLoqLYyrGRFztfIy9kG0KwoBKk3vTXgdobjHzdYysJXH0KgqOLQjnwVVtBv71vqwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imbAsPdI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5BRU/Za; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6650cdXJ275202
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 09:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IO5umusy15uBlz6QwRBlAdgkQwTeBNR1A/rZbbmQ+Tk=; b=imbAsPdI/78wXBPN
	D0jns2ekSIYAng0zSD8Qr0QGrA4nE6kfm84r2+FVj4Sz5fnKda6YbCZV61/yYjte
	bX88MARylaYfdjIldXpQqTc4d8bQMTM3P5KAvCWdS7izXTeB3Ci0j6UzGbPIT4UQ
	sGwrlLrEd2AZf6ZpzLsZpAMUXqzvjJZkXpLUOW84IdlyOnNJZnLwRN16J54QcPtR
	Ls5YoTtZxFs6AeHN9ZNF+ocuZKTTP3URp0eJuOXm+AVn2tN3DdEbT2CWypvnSUZv
	QO4uI7Ag56uHZrbzF4JdYbVY1UbYF83iHHPOD89XMNf6MgfHaIJd/pnzcieEIntE
	HUyRFw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64jk61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 09:50:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-384419c6c74so1084097a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 02:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783245017; x=1783849817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IO5umusy15uBlz6QwRBlAdgkQwTeBNR1A/rZbbmQ+Tk=;
        b=P5BRU/Za8vZTDqTHaPZwCQ7WDHvnn8UHQulI217PrNmw9wCon4pbXPOIHbEsoyn5PS
         gHStj3I4ahEgL9X0cVeEnOfbIOX/QLxT3dFtW8azG3hBCAKYMapkKk69Zv0YeRNrOYW5
         JdeVVfbQujU3Oc1uYGQ+ef02CyjIDHtlO5Tm0YaUUKn87bLfCzCimauKFxFIOFCpC56E
         Ln1Vj4KVyp7yecYJyFozpHtaDPIk4vrsrR3GgMzoS2iLAbvGE8TqvPtCeg4+6SEsoeE3
         5dyMi0XfOFKit0JHcYPSJJKpY/dPafXi5mc7qDzFfYp8jKvsJLXtwiQAPnxRgPhnNM4d
         ti1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783245017; x=1783849817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IO5umusy15uBlz6QwRBlAdgkQwTeBNR1A/rZbbmQ+Tk=;
        b=eoQR6FLyQBmQ1eRD1WXIC64HdR/RzEEFE98KRcexzB8JrApIKU5xRNyiJnM6vhmyV2
         1dh948NTghBIOZrW9Ch83Idz+awG5GUqxXh8jTVG2O7kh3N7qoxKcvMJVmTZHEfelLpN
         YS21XcRmHsnaho02QC/nTiexhffI/qyacdNz9baBnYn766qSLBMpiHOWcWiMp38c9cHC
         8wOAKsMwcqB1Bqa18Y/wFjORqBST7OoA/jGDteml8SeOpgLb5UQZyHgkJ658k59y6puf
         vFjoQlKa0ICSJmhtYfaPPIEbAFZVgyC1xVUKVx0eNnKCkeqzE11tBh6tYSy6NXCQyYQ2
         UWgA==
X-Gm-Message-State: AOJu0YynoNKuy862Z88EVCQ55V7oPu2ikRGvJ9p1xHR+Sv4Clwjmuz3H
	aeRQm9wJBrXKUp+0WoFbBhzBNLS8ZpZosl2xATe1CgQ489fEP0+DPid28sRb+LWTid1E3uco8SX
	Q/Hd8CH1hrpocDFvZSWjHiYyEu+nuuKK2D7Dco0rDDqJzmZ/49vpyVdGHAutnE6oPSyAU
X-Gm-Gg: AfdE7ck9pAaFGDxBGbhPyw5OB0T8dHrWrXs3lmluAWtdmbxho7i6TNLcA759pM7Wn+Y
	FbYBVP5cCx5YJweqjLAmTW8wN7fl7sleKGdmq64L0Wnq750Vj8dB8pspcyvzif1Un0NSiLVoyMx
	Jq8PV4vPiAenfZQ1/TdVrKcGykKh9e3TwVZsBVcWDg7xS42Q+oE0UQr4yntC/H2eyhR+HZ2AdhO
	JjVV1dnlkYjts768n4Jf1QwDJIWxMUoQLJYeWst/ds9mOUeNn+S9RsZYZZ/+239aQ7IVkXpazSe
	LkGZOLkxG3QRfbj/uJsNHDc89bE8JjsiPSWPPvJcnwRpnXMxLrxoaTwyRhGQuCT4TmHyjJCeyLf
	6PWetfm+AnNNInSN4TrJQ0X2FLQ0oXajZYQPJJto9Mg==
X-Received: by 2002:a17:90a:e7c4:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-3829eff9c3bmr5733623a91.19.1783245016621;
        Sun, 05 Jul 2026 02:50:16 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c4:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-3829eff9c3bmr5733595a91.19.1783245016127;
        Sun, 05 Jul 2026 02:50:16 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b4c5577sm45758032eec.0.2026.07.05.02.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 02:50:15 -0700 (PDT)
Message-ID: <afe16407-c0ea-4498-ac24-9fefe94b0474@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 15:20:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] soc: qcom: Add QMI TMD support for remote
 thermal mitigation
To: Julian Braha <julianbraha@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-3-3882189c1f83@oss.qualcomm.com>
 <8a418031-4bfc-4212-a7e7-0d88aa4621c7@gmail.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <8a418031-4bfc-4212-a7e7-0d88aa4621c7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDEwMSBTYWx0ZWRfX9bWwb72peaVF
 0XB95jlXmMMfnQz4LvemhpKoGsj9baOyUagv8jVXM+E8Z09rX3/Jz91w/9fwJNw9G+hJN0IB+VN
 Nz9ToOP4+HeyvL0/lGgUXE40gnIBhSeK+6Lnm2qUbDbcTFjNLrkCsmeK6vd6pVXQU7Zi7Z26Yxe
 ymbwLQuVfXx5sF6oLRnR4cZ2F8buR4oVjA52cjzyQIJg/ouhLIxLstJBl/pwc0Vfy1YMvUfflIT
 ekXtYRSH/vAbEUoN6pwwhQePH5M9PKUaQp5PxEsSqScq9aPTy7hGsxf6lBGfU7Hz9sh8L6hjmtx
 7LMlyGTrooCpvb+Uru0lS0Xv4tRX09eTROPaqRBjopNfPbOc1ROGpZKnIGaugdTraf+hr6jb8BA
 aO4mDx74JxDC2GDyJgUGsdnW/jPALJgeqcxTTZtkMaBdkQd9kBNvMwrNl6kx5NtcVwTa2sloZuY
 9XJ2694p1OpoMZ7QAFg==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4a28d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VSZR59-1Ue7iRqHKT1IA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: efzz9vqcP__CNIQhV1kGAwEbcL9OlpLb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDEwMSBTYWx0ZWRfX/1LVITaLE/Ho
 a+T7PMKWuUZgilZm454vQqQijjr9uVKGjicAy7dg92SqLFzr7vLeyutSrAiSsHlxS5wC5VnY71r
 VZ6xeGPgoQ8aJziKEqVs4APk86TlTt8=
X-Proofpoint-GUID: efzz9vqcP__CNIQhV1kGAwEbcL9OlpLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116533-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,oss.qualcomm.com,chromium.org];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 24275709A45



On 7/3/2026 11:39 PM, Julian Braha wrote:
> Hi all,
> 
> On 7/3/26 06:03, Gaurav Kohli wrote:
>> +config QCOM_QMI_TMD
>> +	bool "Qualcomm remote subsystem TMD" if COMPILE_TEST
>> +	depends on ARCH_QCOM
>> +	select QCOM_QMI_HELPERS
>> +	help
>> +	  This enables Qualcomm Messaging Interface (QMI) based Thermal Mitigation
>> +	  Device (TMD) support for Qualcomm remote subsystems. It manages
>> +	  TMD messaging and handles QMI communication with remote processors
>> +	  to exchange mitigation state and apply thermal mitigation requests.
>> +
> 
> QCOM_QMI_TMD can trigger an unmet dependency and build failure due to
> selecting QCOM_QMI_HELPERS, without ensuring NET is enabled:
> 
> WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS
>    Depends on [n]: NET [=n]
>    Selected by [y]:
>    - QCOM_QMI_TMD [=y] && ARCH_QCOM [=y]

Thanks for review. Will add depends on NET to fix the unmet dependency.

> 
> - Julian Braha


