Return-Path: <linux-arm-msm+bounces-104745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN76DiRu72mHBQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:09:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA538474107
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ECFF30053D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102BD1F192E;
	Mon, 27 Apr 2026 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNo9xzCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDEBECdK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927613CEBBC
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298699; cv=none; b=TeuHOoOWrR6fCs39rPZbpyN2hUhwRAK9Qyrs/G5H2oYFyrs0wdKbSx1JJ2fei0ca7LH7V4RsoDvXptZmnqhJNwGQopXfIOfx7Gw2ncznJEG3kTsPU/w50fStR5HIQgaovWLuBVbl7UcKjxyRwRICcyzsXrWAD1mefIZHShKVFRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298699; c=relaxed/simple;
	bh=rnKDWblutbaVRN4OQavnvyRCkTcs5zBrEO+FDHjzCm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R35HWAqSLQ1N4dgMhmR/btLG7uswhnW2d+o+TdTX5z3kxE/H7BNNpd9v0lUSiIa/72LHMS4N/pg9VilrgEpPhlb2HePsID4KihrLKAickY72jU4zm0X8/BmKZKPMYODIn+iKZcUVgWRhEsgHhqZ70Fpm0nVW6i9l5YRQnVnMz0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNo9xzCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UDEBECdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYVxo429172
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYPywVIvWOIbB3aINxx79NXY4+7xYBKmkbz1uIIb2OY=; b=nNo9xzCHqOdmO6+E
	9k18vL8QVbVC7uMwRJ1zadVdJisrlU51Bq7lDBs5BNKi79grrpoYv2u3kMzlAePD
	pGSJ/Rhhz7U28HdYMmJDu3EkqZTpmDhkkpFGDTVi4I9vrIxmWZyT7OVhFI78ZC1r
	Sulv5KAoVNw+VwYLTSIC8e8ANVG9clEiWp8Ss2Mpb0gb7plySfi+/EpINXk5P8eZ
	0Alkd5fQXExM61QxvvwIjKQuiCIIQhyo+68K0TsgmNIQpK00+A7WIQbJrCMpMor9
	6gFJG9OO2vaQLDQlJi0KL4jK5DcHU56yxTRq7s9sEIsHxMdH42lwMNWi4e+lN2wT
	QeTTUw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x30ad7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:04:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60586b8e65cso518860137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777298697; x=1777903497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYPywVIvWOIbB3aINxx79NXY4+7xYBKmkbz1uIIb2OY=;
        b=UDEBECdKLakFV+9ZjOa2WAvzJP6v+ni4/maCnONT6ygNpck3cDn0QH9M6m5chA3mxj
         koDAn1O3YPVJTIobWkHY8yws5xmK0rqYhYMuF1YFjJ2YZzIz2qhN9WUlRcSrdIAXjKT2
         BPJtJyZDd6RSdbR0oRxPDDwdDZ3X1t7YlcNVa4KGOUbAolNoNMeMokdcyQDQb/iJd0N0
         /B8UcDr2mNyWebMdb1hQonF4bOKwHT/egxPk/2cI2ate8aakCAsDrlXePRDfjVSgxwm1
         Ug+RYv0VBvLeQwMMaCExcDbU0B01cPStvY0KeJ2iRBxq8S/8aR7XHg4s6l/3X6tcmVu5
         bV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298697; x=1777903497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYPywVIvWOIbB3aINxx79NXY4+7xYBKmkbz1uIIb2OY=;
        b=b2KLFVLgZ6GfjIUPnF0rSfMX8a6nEPKLT2s+x1mGj6qB2hJpaArwH41hbrz8U7QeWi
         9YBBGYbmcQHVQO+0lk/x42Rx/PyL8F4E8L5YtB3ax/FPSuPnqLaQQKhP7cker4nVUWiI
         vBRXPDfV+UK+x8W2MX5PDjhrE63uO0H/EM0F4NHj/lY8Rl7ZrXBRhKaANSsz4jPPaBjt
         1IASds0xRGEZcEO2gt6RHs09Vyyhs/HHV5ZU4R+gxBrZVmF2V/jA5jpM19/otGJxe3mf
         LAC0j5pHJWe0ha8C/m2VlWV8F1SLvkCIxvMPsTzQFoc1jhGUS8wmOy+avn21FLcQnPsA
         5e0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/nyhLBjMTYr6MhegqriHeG0Vhke/5zqbtjmUoOFHTNb0KDKEnPYuIdyW9HhSPYs0i2JMfWg4OONSMKfxJJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5EYL6MCbCfl5qDWVvjDmKlKhRCFsbURkUmGCesVTjaZUdpJ0R
	W6XuP7j4wuk+EN0fOBxZGvlY7biryUZ8IH9JHFF/k3qVLfKw64S5wPK6BvVyVPYt0pr5yBnrh3M
	RI6ghiCK5jIOZa527FSqcXVESLdDoNXUHJGElyKwDkNbJ71CpML+N7yVpX6C5UGUKgg6j
X-Gm-Gg: AeBDietqS5KNl93dbQdgUaUzSA9i0McYhyL5xZpNde/oLr3ArCXL1wiw0ZQgCMRTscI
	V3TNF5mjGG4uxFnxAO0iT6mewR36mP/fOkI/Hj5KB8U6zvbzqYK2+GAjZDHrQPPic5SeZprmxYI
	bRxip0xEq6ere/72ZyBueh49mhVXevd9qxtjNeweNT1UcbVrXf+u7ZkJztwZYaZc3NfdQXaxFeU
	zcU4WGK9saX5vXV3coDJsHjheds4iiUujmqrQBpLXx0IFKQ8sTCADdSp27DejHtjXlx2ZbiliKm
	rW+AXL3Aljx/7zlF4X0D8RdSUNSlMicO8/ZOiqJc57kyWhDUfquouOFXBtt0nI7PH8ReyjZ+A9S
	r/0TPUnNlpH2L3ykigaDnoQfUAZU9aoFuVZBv5wUI58cA2E3pOSTTWA6L6CQHO8wK8T6ZTvGqOJ
	MNZq1V5YlsvmwgAg==
X-Received: by 2002:a05:6102:8501:20b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-62352cd5657mr1167770137.1.1777298695354;
        Mon, 27 Apr 2026 07:04:55 -0700 (PDT)
X-Received: by 2002:a05:6102:8501:20b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-62352cd5657mr1167625137.1.1777298693398;
        Mon, 27 Apr 2026 07:04:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455926c61sm1100136866b.63.2026.04.27.07.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:04:52 -0700 (PDT)
Message-ID: <c145efc2-9285-4e2f-a9e9-73c4faadf15e@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:04:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-2-f430e7485009@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-2-f430e7485009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0OSBTYWx0ZWRfX3oRSR3abD5NJ
 81qKoPvjiQ9loElp9efY8lOLD8ehhtJfn7VmGkGQ/7Yp7FN61nJU2pwJ4iUrP1mCfkFY4zEpjyS
 ktMlS+fXj498q6KmNUh0ly05Avsnsm4BF2Ka9D/z6utduuNIa65a0m9H0b2Z5JUaeGrXZywFvCk
 EP/O5U3iebSZyfBbpD8XrG70H38r6c5hy1TrhB8X/GIRE310j9JhemteFWjjplmfwjQc211xXve
 zC3jZh11hz7kW10i7n7Xs6lu7n2J/Igr9x7t35auAea1QOTTzXVVK8snynrlFWtZaLUXWJD+zse
 F7HWnGmAtJ0PAFyVzA+0BogC5QMXATmgda2C+bNET1MJdzFH3egoavGc3dWjLtpCGRUIocqBpah
 e+Hhq2pOpEpwnoENj1K0JGygS7icGQ2Zrxuww0BfqLrZHoWW0J2ndz6JcX8wIFAWOaRysACRxka
 RJOWIsxIQ5vzsVZKflQ==
X-Proofpoint-ORIG-GUID: Xyf_vtTCHrTZVYLYZwErjumATbaP8v3C
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69ef6d09 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=s_dpPsJcIKQ2JMW1VggA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: Xyf_vtTCHrTZVYLYZwErjumATbaP8v3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270149
X-Rspamd-Queue-Id: AA538474107
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104745-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 2:43 PM, Loic Poulain wrote:
> Add optional PM clock support to the CAMSS driver using the PM clock
> framework. This allows CAMSS clocks to be registered once and
> automatically managed during runtime suspend and resume.
> 
> This is especially useful for global CAMSS clocks that are shared across
> multiple CAMSS subnodes. Now that CAMSS is modeled as a simple-bus,
> these clocks are automatically enabled whenever a child node becomes
> active.
> 
> This avoids the need for each subdevice to reference and manage the
> shared clocks individually. A typical example is the set of clocks in
> the top_group, which may be used by CSID, PHY, CCI, OPE, and other
> CAMSS blocks.
> 
> Introduce a small PM clock descriptor table in the CAMSS resources
> structure to describe clocks and their optional rates. Initialize
> these clocks at probe time and delegate clock ownership to the PM
> core.
> 
> Hook PM clock handling into the runtime PM callbacks to ensure clocks
> are properly suspended and resumed alongside power domains and ICC
> paths.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i].name; i++) {
> +		const struct camss_pm_clk *entry = &camss->res->pm_clks[i];
> +		struct clk *clk;
> +
> +		clk = clk_get(dev, entry->name);
> +		if (IS_ERR(clk)) {
> +			dev_warn(dev, "failed to get pm_clk %s: %pe\n",
> +				 entry->name, clk);
> +			continue;
> +		}
> +
> +		if (entry->rate) {
> +			ret = clk_set_rate(clk, entry->rate);
> +			if (ret)
> +				dev_warn(dev, "failed to set rate for pm_clk %s: %d\n",
> +					 entry->name, ret);
> +		}

So this makes a couple fragile assumptions:

* there's only one "on/operational" rate
* no OPP votes

I would imagine that in the camss-is-the-bus model, the top-level
device would house an OPP table.. but we have two somewhat independent
clocks that may possibly have separate RPMH requirements for their M/N
number of rates, which could result in M*N-long opp table

Konrad

