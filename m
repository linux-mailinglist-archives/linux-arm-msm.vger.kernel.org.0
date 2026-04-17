Return-Path: <linux-arm-msm+bounces-103533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ISbIMk04mm13QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:25:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D219941B953
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EAA8304D274
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9FC39DBD7;
	Fri, 17 Apr 2026 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5tBxD8L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vl15LAB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6F27262B
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432325; cv=none; b=YrG1uDQFuInON4PK1K4salH08Sc5zmCVaDaTVljQ/r8Z7rIxew8F43pKAks0FX068SIarlWcGAChDSlNsj2mTezEuH9xtLUol/sn1ZopToBXjpt+w70PwqkSSzu7mlF/d1IdVFJKUhhHH0JfFjPXlZXoQGeSR+vApcDPlYsWG5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432325; c=relaxed/simple;
	bh=TPOcdSfpvISq6EQEhPEC4xrtwJHgRxM3d5dvRWfQGo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfRncjn7r33nor2SQul/9JAVln+7aHwNFKTM9htaXSMxXUx2fU5i28b9tsiGNq6YBTuF8HdHQS59yscfvcDT2I5zg7MxYVezL+yXRe9YEuPyht+lpoBf0pqW/VtO5H8UWxIeqm1JJn4oPYRYO4c29R5PHQtAhO3STd18TAkRHmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5tBxD8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vl15LAB5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H82vPo1872519
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNcL6sT7C05P+AcSNna5P+PTt/SHMOgeqU5I2FLTS5I=; b=b5tBxD8LR4NpO9UZ
	U4kjwCG2N7sqGI087ah5J7rZ9O/7R4fiTv2oDl6QV5xZOPxfAUKWNfAZGiVBgVs7
	WYGOWzmTaPkellHGTTiekWA/qB3/sFBbbNOYoHJa8OL76GM5OKBjay1UvVIYB0M0
	Td4sB7FFE/SSd5cwfKImD14VwqAx9YhbJ0wd/QT6c2R2irUeei0iddAaK00yIDmB
	8NHecEpvqDF1Pxc1Zhi59iJUpOnpJMfuTd3kX4+NkRBs8gWHxDv1JQ4zPnN5qnoK
	wFR9pT2flM/7FUd0IQDbZc7lHHX7kk6nPWPh6XbKsfBm8ymyUaHYVs5ok9v+jvDp
	AAevFw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk2knc5cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:25:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24611696eso5097425ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 06:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776432322; x=1777037122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNcL6sT7C05P+AcSNna5P+PTt/SHMOgeqU5I2FLTS5I=;
        b=Vl15LAB5zT0aDzM6PSmcEyxP2ASDMLGoxCY+sNdFTSRy0YBj+yXXuKhPluzCgQzILF
         bHZrD8T9wuh0RgAkUIsolqkBnFFt7bahaUaNR52PsPSJGl1qQghXHXPGf4TwyXrezIJN
         UTPgtcEjfJ5RsGhNx1wEAWhw4W72MOK9qeekNNkiHhXW/M31swpzMSkly9Mk/ihAs0Iv
         mxPJAkM4PUVL0MqG7Cy8gQdVL9dS5txiaQZKF3cStlme8ZWouMunkJJEzmq+C3xktoYQ
         CgFpJtp9BflvLwFO8pvMjYjokV59wInp+UQRQVu4OvhNWRNbZleNgIayllH7ZdvxPmAK
         qlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432322; x=1777037122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNcL6sT7C05P+AcSNna5P+PTt/SHMOgeqU5I2FLTS5I=;
        b=S86xNBlx+ikrbCnQnyE189HoMZo//XoFIyd6fCgqsQovlbOgDsnUHXGh0Ob2Q1vPWx
         WzzLp1RneZn0EjPisRazdDGv4ItW7AzHRqXA5K70TCJaE08wHBzFp+ZNzQL8CwqC9x8+
         ad9euTSjpQpAkM8L0105jMkg0DRmEXogLHOUIMfto8P5Evup90QV+egD8Hi+qRi22kmz
         b1KtibBTlXdWhSj36V7NsJR2iCkbs2Onzu8bb3hZdNDJCzriWKXGi2SAuGB9oHbjvFW2
         oIzwgQA4ibOuORe2bMsV4VuaaauXRCMSVGI1vHZSVjWVoul0s9Zo2xPsg2u8yhJ82l4i
         njhQ==
X-Gm-Message-State: AOJu0Yybmn8ByZ7Ky/N6XIO0nGJiD9484z/KElopziNF5z6QWWf0a25G
	WRSERz1pGmQfqK0PzNNZ7z/5yPNgLuH3jsN8BZ0J6BvK7yPJAmhDMAWaeFbsNUSFnrDUUhbWUeD
	wndQaaBq32TJErczQXp0QzkTNrSa9PoVC7VQGoWT1yVp8ETMx1iLluXSThaRKd6SqXPcO
X-Gm-Gg: AeBDieumE06e7sHswPeQMEDeQcskqynO03O8UZA8BZv1VNNGxBnK6IybG/hlP77hRei
	mEgIl3EBWA7UBqT5gI7knBg3htWP4CC817OU9TiYGfrggnJIOQzIDHVTN0zLx3WRS5xPSUWY1sd
	I75m/463n4dqyM1gFS41+TDYnmgJCnryHqtGjG3m8i/D1/QqiFu75eUI9jNpJ6AI/Z6/EwdoDYZ
	UBVnOlJJxHDRpAM6dy3WwfMJaQcPqkyAAvRbFiayw1HB0sCkbY/lvN1O9hvesUN1h6U1S6FeZz2
	2JvQqi3QmJGyeO3ZSQnXcXHgejKINvo3Hqi2bDnUeAxR1W2ffLskToIlDx0s91zSaA09/ikWCbz
	Mw4UatuDNncUHp98+euVjnAxSd6dLjfUkeNt18cuRNU0srpGeNC1lvT2Ztg1Y3A==
X-Received: by 2002:a17:902:b693:b0:2b2:ec4f:7074 with SMTP id d9443c01a7336-2b5fa032a50mr22722155ad.38.1776432322031;
        Fri, 17 Apr 2026 06:25:22 -0700 (PDT)
X-Received: by 2002:a17:902:b693:b0:2b2:ec4f:7074 with SMTP id d9443c01a7336-2b5fa032a50mr22721745ad.38.1776432321486;
        Fri, 17 Apr 2026 06:25:21 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa32ad8sm22769075ad.31.2026.04.17.06.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 06:25:20 -0700 (PDT)
Message-ID: <4528374d-8175-4a1c-859f-23ddf2bbef52@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 18:55:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-1-ca1129798606@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260409-enable-ice-clock-scaling-v8-1-ca1129798606@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fcVN1vLp4z7kUXqnXvOe2PGKG-XRPtxM
X-Authority-Analysis: v=2.4 cv=XNoAjwhE c=1 sm=1 tr=0 ts=69e234c3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Y1tIbI0nCN1IA7hYjVgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: fcVN1vLp4z7kUXqnXvOe2PGKG-XRPtxM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEzNCBTYWx0ZWRfXyxjO4BVnM3ST
 uf9RgXukgIPwJawrQJl12hWyOEEkhq8sacLxibPLhrgE/AJYWsvg7JOFc4ca6PcELk/erSCHFqg
 nZ5heX9ACqtjbahD6fZzKu2x/7YKNtvxbzDWuNj/WWw5qh+Pre5ba+BBp9BE3Qmv9hwVfKNVq/A
 Q99ChgYnr9No5YozYMV4Ijue4XHWO6U6+GM+PtJtpd9qlPKD83aflskPu9SWFT0PjRZWUz7fViH
 P2cWeovqETvpGGvVUctt0E9u8ea53ibShrPLC+SYow1q0U9IsdGsfwOvrTOI7Ukj7WkP6WKloer
 5oghmeL5UaMShQ222Hdz8hsVuHsRTDaqdYIZFPJnXGpLGWGTvIG2wpCQkKLU2fLIW0WBDZy4h/u
 JnZMrPPvCG6ZgsdQTrs80MqZ/BI+/2Pf+oMWUG09z0bNSL6Ptu+yZhCJagxuNsyWse1+IatddIS
 6KZW15wDs3BQkQmnY/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103533-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D219941B953
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> Register optional operation-points-v2 table for ICE device
> during device probe. Attach the OPP-table with only the ICE
> core clock. Since, dtbinding is on a trasition phase to include
> iface clock and clock-names, attaching the opp-table to core clock
> remains options such that it does not cause probe failures.
> 
> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> core clock based on the target frequency provided and if a valid
> OPP-table is registered. Use round_ceil passed to decide on the
> rounding of the clock freq against OPP-table. Clock scaling is
> disabled when a valid OPP-table is not registered.
> 
> This ensures when an ICE-device specific OPP table is available,
> use the PM OPP framework to manage frequency scaling and maintain
> proper power-domain constraints.
> 
> Also, ensure to drop the votes in suspend to prevent power/thermal
> retention. Subsequently restore the frequency in resume from
> core_clk_freq which stores the last ICE core clock operating frequency.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/soc/qcom/ice.h |  2 ++
>  2 files changed, 94 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index bf4ab2d9e5c0360d8fe6135cc35f93b6b09e7a0e..9e869e6abc6300c7608b4d9a18e7f3e80c93f5e7 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -16,6 +16,7 @@

[..]

> @@ -742,6 +800,40 @@ static int qcom_ice_probe(struct platform_device *pdev)
>  	if (IS_ERR(engine))
>  		return PTR_ERR(engine);
>  
> +	/* qcom_ice_create() may return NULL if scm calls are not available */
> +	if (!engine)
> +		return -EOPNOTSUPP;
> +
> +	err = devm_pm_opp_set_clkname(&pdev->dev, "core");
> +	if (err && err != -ENOENT) {
> +		dev_err(&pdev->dev, "Unable to set core clkname to OPP-table\n");
> +		return err;
> +	}
> +
> +	/* OPP table is optional */
> +	err = devm_pm_opp_of_add_table(&pdev->dev);
> +	if (err && err != -ENODEV) {
> +		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
> +		return err;
> +	}
> +
> +	/*
> +	 * The OPP table is optional. devm_pm_opp_of_add_table() returns
> +	 * -ENODEV when no OPP table is present in DT, which is not treated
> +	 * as an error. Therefore, track successful OPP registration only
> +	 * when the return value is 0.
> +	 */
> +	engine->has_opp = (err == 0);
> +	if (!engine->has_opp)
> +		dev_info(&pdev->dev, "ICE OPP table is not registered, please update your DT\n");
> +
> +	/*
> +	 * Store the core clock rate for suspend resume cycles,
> +	 * against OPP aware DVFS operations. core_clk_freq will
> +	 * have a valid value only for non-legacy bindings.
> +	 */
> +	engine->core_clk_freq = clk_get_rate(engine->core_clk);
> +

When you are calling 4-5 functions in a function, it's probably time to define another
function to keep things simple. Maybe qcom_ice_attach_opp_table().

Also, I still have issues with engine->has_opp = (err == 0), mostly because I don't
see this style used at other placed in the kernel. I would still suggest that you
make it simpler, but I won't hard-request it.

/* The same explanatory comment as before */
if (err == -ENODEV)
	engine->has_opp = false;
        dev_info(...);
else
	engine->has_opp = true;

With these optional suggestions, feel free to add:

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>


>  	platform_set_drvdata(pdev, engine);
>  
>  	return 0;
> diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
> index 4bee553f0a59d86ec6ce20f7c7b4bce28a706415..4eb58a264d416e71228ed4b13e7f53c549261fdc 100644
> --- a/include/soc/qcom/ice.h
> +++ b/include/soc/qcom/ice.h
> @@ -30,5 +30,7 @@ int qcom_ice_import_key(struct qcom_ice *ice,
>  			const u8 *raw_key, size_t raw_key_size,
>  			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
>  struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
> +int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
> +		       bool round_ceil);
>  
>  #endif /* __QCOM_ICE_H__ */
> 


