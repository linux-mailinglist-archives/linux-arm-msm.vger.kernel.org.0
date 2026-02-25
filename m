Return-Path: <linux-arm-msm+bounces-94117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDPDHSvunmmgXwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:42:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF37197832
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CA7C3069D40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B6B3AEF45;
	Wed, 25 Feb 2026 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4PoU5ea";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5oz3wzI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DABB3AE6E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772023285; cv=none; b=HrCWs4NrwR70LP2dVnQCijbqcFD4UarK1So+Ei0zRx/LkMa3we/UKMuTApvJ70urb9HYuxHi9FcofFDjnQyZudh/074IP1Gwq07DPJvgKX4jYWhCevhm56K/+UjEexuEDmAUhxquCOhD9LMVtjLIjEyfU4LElWu5yR5zSqoPFJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772023285; c=relaxed/simple;
	bh=iqvKLMDFqeno+jEiq0kO0YroAm03A6FEtNiHUdWPP1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jOCHzAJohe4vGtpubBed3MX4KnGfec1feKHiMdXvyqlkR/UKkGF+/EvA/LwZ/3SW+uKf1SXJ32MLc4PrdNPk7L1GWzlxvAQjcL8cFZ9S4fRvr4xJvJLdMqCpW/x8n9SelWKz786Gj3ugbk5HD2kHC7AFqZeKX6COY4DSYPlmYm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4PoU5ea; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5oz3wzI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SCn9806718
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYT7mQ2ja/t6BbG4swbmeUHgbB2sHNob61Efta+Yx6I=; b=K4PoU5eaODjd5Erx
	y7ZESAXmdu8XRksHW6ZBHZfOYVnvnlYZvfWr8XU3iinrkrtwfNLzB3760EySj3W2
	F+PYFPdXFlDwvU6kp1lb2TnRUY9omAnLsjQbglYkqJS2FlBuXLlRT8ELJiwj2Ee6
	MBnrGps5sU374fb8i1xCKwawGSj+/jhUymuWBj9XFb2hdkSFRwFxKB7mMiRDDUAq
	YKQ/5F7MOGl+oY0OiXJKyx11OxUSFi+NGVoTaWcEWYOumLsqfNU1bJFouLSZiWmb
	YfnTdELai8uFkc0uUmuwEynyHm2NKmTYJhe0RPvz1MsbhZP6F81uXQO4kDNSoLaV
	22AOGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5p9m4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:41:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb45a6b860so459743085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 04:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772023282; x=1772628082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYT7mQ2ja/t6BbG4swbmeUHgbB2sHNob61Efta+Yx6I=;
        b=h5oz3wzIMSymH/W9QUPMpdjXybvXBI8ivdCJgfvKDuucG/Vzx6raJtil8FjyaeGhkj
         8PLrxJ4WK/GV4ftq3B95T6dngxiJnk/6lq5lyJULdL6xhYIEUtUdMdd9mAe/X3Cnzx9K
         KVIzxOtWn/B0xQk+mFMSWExCZdOw0Z2PLeN6Vb9iETCV3aIvS5I9qzxUDVQ6+kNtDWXc
         uMCWH3jfHMfjuADDKTDHwSG16+KoCp6O9HQU1TQaV34YdOvtUqV3tURvbsmNqqShuxjF
         La81UAug3An8pl1j/IWBr1lXVt44zQo8J9IEH48IcMEFZE5tcqwHOMqMjvCS9ba/nuLj
         3icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772023282; x=1772628082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYT7mQ2ja/t6BbG4swbmeUHgbB2sHNob61Efta+Yx6I=;
        b=cR5t7snZIhVcmuXGB9+c1Z/8z5yQ3kMeFOWBF3Lds+ZvIzHTsMc5TMJ/iI+uw5JzYW
         voSM1vYtmghyLQoJshVNCCAvWrbASE9ZbStoZfsv0yoHv5xzCCCEABeawOMUTDr3k7jc
         0l+kwa6bMLMwJiFXLbJmaT+kJ68FE0Nop36F4pFsWsb2htU7GanE0lZ69MEwXymuPSnH
         ZM0l6GcNn/OLBy8bRFScx4V0/wAm9L148K1IcsT48g/DmlYry5WA42k0XIxSLnKhZc62
         wUeMH7Wy+jbvRqnAN+iLhNUw5xM/URo3c7m71+CeTM89+IwJLve1QS+7UJ1OI3lMitQ0
         tdxw==
X-Gm-Message-State: AOJu0YxyyH6BLU8QMBd8r0tgn/5Cx2X/PwDmKn42DJfRIkTQIcgAHOsG
	CS4up38O76S7u88Om4ZB2HnkGC3iNJ/5+39lCUjSsKDDQQ/AbdCek++hGFcDnhG+h/lOZsJe46k
	P5CRAyOXI2cPfORzlmVqEjdXiampB+bsMl5oGWeyRkTYoCi2OFDz34h1PE0gvygCH1TrA
X-Gm-Gg: ATEYQzzcNP/yi05oC7/KGNrhXFV2cahQjpfvjjPnVzPSCQVvhIuH70HIBZevVU8ifQE
	aIN4uQPYUk7JUxz8lraN6JZ9/K97eTcLJ1YmpvVKzyabvMKOtGw5qrR2ZlWt3uBQnwyCfmu9c3k
	QUFg+qdq87Iq3JlORrrZ7kDZim0CIzrh1Q/2OLYxpdOKZl3mzc0pcXBj24ZZXICtEMGio4/UBC2
	Gmq5OZYmaWQDgjpQSrszB/8zVE3lJQq94sobDZHPQkhRYV6OIPtrVdWsFi8ZiEcLS4eIHV6D38J
	hQnQFfUzxlVAUOwxJcaMnwvHLWx+AboGyLhb2xVlddgwjUgVmvtQlMLS93v0WplG5vhzo0L2Whz
	tLlFoiePIL05QaKZwQ581TidjDjZiEyppSolncT7KwD7pPwd6hZb1mimZoyPXXpFLpP2eIN9EST
	pwe7c=
X-Received: by 2002:a05:620a:1a25:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb8caa40f8mr1516386585a.9.1772023282389;
        Wed, 25 Feb 2026 04:41:22 -0800 (PST)
X-Received: by 2002:a05:620a:1a25:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb8caa40f8mr1516383885a.9.1772023281901;
        Wed, 25 Feb 2026 04:41:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f191b9sm500484366b.67.2026.02.25.04.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:41:21 -0800 (PST)
Message-ID: <1a28d203-e0ee-4c0d-a6ac-7f50ab26bdeb@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 13:41:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
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
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
 <20260225-wdt_reset_reason-v7-4-65d5b7e3e1eb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-wdt_reset_reason-v7-4-65d5b7e3e1eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyMyBTYWx0ZWRfXwakcq8ETRuLS
 k+aS0f8ym8PBM3cmaR2dyBNV6DwlFMrVkoOEpxtMxCwlJ8CnJ9xaEXtRCZ6CbogoowscrsuuL9H
 Jh+skYtQOyFJLiXOcJZqGM3csH6e9KvPju0XkdziSJ8WGGvRp+O1mBh90vV2AMJu4O/4ueBweue
 xR3PtycB7XpFmtpjxCg555LDwLHuI9pOdpvGIwwBiWl6HtKw8udpivppFI18yu8qTIKkiXLzsDi
 nevAe2Mk0A0fXxwkOAVFZ/0Nsz8BddG0wjTcqxtevHtPhVVcxUqXJvBaK7sEbp5LlhMLgO3aanb
 0xooUmRmEt5lxB+dS4m/csKPc1vJxpFRk8LW5GHuf+CpOJlQ8cBO+YWtQPmWCbhVfRDhhUB8hKf
 mXR6Yx/Fe7hxtfouvFcfCMZM4hYkVzCqiHjbn8640YjLxgsopzQ+DLNFhZAW2oKUzmE07IRQiv2
 SArW+pifznr6viHW3Tw==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699eedf3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5uP7x7crlKMPZidxuXQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 5OIXl5Ul5W_uEW-aKB-Pjy3nGPu0I8IA
X-Proofpoint-ORIG-GUID: 5OIXl5Ul5W_uEW-aKB-Pjy3nGPu0I8IA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250123
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94117-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FF37197832
X-Rspamd-Action: no action

On 2/25/26 7:43 AM, Kathiravan Thirumoorthy wrote:
> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
> in the WDT_STS register is cleared. To identify if the system was
> restarted due to WDT expiry, XBL update the information in the IMEM region.
> Update the driver to read the restart reason from IMEM and populate the
> bootstatus accordingly.
> 
> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
> as below:
> 
> cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
> 32
> 
> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
> function qcom_wdt_get_bootstatus() to read the restart reason from
> IMEM.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

> +static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
> +				   u32 val)
> +{
> +	struct device_node *imem;
> +	struct resource res;
> +	void __iomem *addr;
> +	int ret;
> +
> +	imem = of_parse_phandle(dev->of_node, "sram", 0);
> +	if (!imem) {
> +
> +		/* Fallback to the existing check */

Odd \n above

'existing' is imprecise, perhaps something like 

/* Read the EXPIRED_STATUS bit as a fallback */

lg otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

