Return-Path: <linux-arm-msm+bounces-90013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGC1GfzLcGkOaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:52:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319257195
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D3069608C22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF1030DEA6;
	Wed, 21 Jan 2026 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDqEWHGx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eyTz9S/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC33AEF29
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999341; cv=none; b=uxckvJbmiuteJ9lSRgnNj1Xgy/3S/A967UXuGpnS6YrDY3lKqVFOcjdua2qVnWeCiHLyU4rVdYPNM60fn59h6paiUbpXkf6RhQj5bauXq6TyucHDWTtiXr+Tf0TJVyPDihwwQcpNipaDI3ia1BPcxbuYg+YWc/OAzohSvdOJkcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999341; c=relaxed/simple;
	bh=vXvrWCbPZshubxl9KodIBlxMPpxf8R/PEWbLicFw3s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0k3HChzTzuazP51yyjw4LmGWNT51N8Pg782ERAeSyWf2dFTCJs+uxT4nQz40zih7jIKzr9A76U2huyKUOV6zcf3mgw+jn28GVzGOQimYWKcTI5MrxR4o5wKAr4RO3vVjw54QpIm2eYYAZNserScYu3Th9Au/ho2L/uvyC2Qp2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDqEWHGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eyTz9S/d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L8vJg72946412
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdH5rm0S2Ix+Vx62gLP2DpOzpxqm8kJTjnlDwLQwkjE=; b=JDqEWHGxzTeKMrdL
	vA209huw8yPPtN95PeJB8qJInz3N7p+5Z+osw1xN1Txe7Cxvj2gW6QXFJUnAXdxF
	IeLz8JTmSpVtHEaagvsTdVQ3hOE4Ko6pXdd8/5rlbtDlp6Dh9uwcRAnjItECSjM6
	SgtuLau6YLRnX3SY4pbVcRJ+nEpSGu2wPwj5Zy/hYl4rNJEXLTVavgaQYIK6soNo
	0zm00KwPr0aKNqUHtl6GOBF/nLoScVlKEtDXt55tGC3vk3e191DE0JuZgg+O2tZg
	yqd1mR6EETuCFpom0EJCewqWBg9JE59KztQyiTtqycDn+rp484hAzymRhS82pyvy
	XhbEIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btur98xxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:42:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c533f07450so147476985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 04:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768999338; x=1769604138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdH5rm0S2Ix+Vx62gLP2DpOzpxqm8kJTjnlDwLQwkjE=;
        b=eyTz9S/dkVtiLr3LgLhC0IDNmyRuaupjFeLNe+MC4mYCNkIPL5+HoxL5q9ARTl97Wg
         nuzLjaCSZ5aAw++La1AbGAppq2vCc4lEJiYmW8gn0f9zp9xcoiMc0YORlZ2ai9VCD9W5
         bx9JhIRXKafIokNC48yRE/hc+pebv4OEpgt1tTM7piyIdApE5b/TabZ270eYGcbvFv+c
         5FWLe6ccf5uQNYBzuhID838xto3koloQEEbMUWoPwqiB2fwbO8lRmF4/38Y9Mk6STR13
         x70Fh+ftH6E3rMLW7nRPfqUYkOMCtDxeWeCt2BLq+axCzBsPxMm+l9FeWYHkFkBGn3oj
         rdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768999338; x=1769604138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdH5rm0S2Ix+Vx62gLP2DpOzpxqm8kJTjnlDwLQwkjE=;
        b=rJhbpVKQBUqz0UqE+sh1fvi3lmmcCQXs2iU62bJphuowolLsp2LO/camTAiBc7N3lj
         ihjldGumkPv816QetM+Ex4z1EehHRvo5I2AzKoNj9DcRGXrD391qK5AdITgtQbEe6hI6
         GUc6kDsVe6hn2sSV/ykBkzRNjxcKdV+L01qBaiBIqy9+OGpE2MOvHl4wdWBvvmK2q682
         WNZnQJPKDUtjBvwBk+xpB2FUlH3tY9J+/LRPaBhcWIHk6ClAQi0DEQ7tDilBfrZ2keBv
         tcUbUH9SuFso3ea7cepz1dOqRHxobgmjPChTcLn955Lae6jSe9R/1E8NrL/pIqMe/gpk
         IR5w==
X-Forwarded-Encrypted: i=1; AJvYcCXF9F3NosOT1sFBySJoJYfqLBalyldwwYSPem+qsp0QzMtWLAG233i7HIKEP4I3DTFxxopIB9T8twAD97oA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzky9vv1FXSkFwkIwscgqwJSK65ajShY2P5nmORXQy3eqxNDxJG
	NlojIrzqKnz+s1/eNYVXo3WoXjipyb/ddieiPswnS0RGcT3sWMAGPVQ5E2MYgT5Kkm7VcAWqEhb
	Wx9jqTKpXLyujDCaw1fOPd+92ZBVijf4eX0qgMXsWBUHgWVmRYGkibbgFwTtiRLSSMzar
X-Gm-Gg: AZuq6aJ7h46Zo4J3ri8Hz7YjHQnFNnbe/7z37m5k/7+5gxX7f1ycY7Pfm7PPyvSqFlA
	zSj/LfjiaSFHcrFucEeWsDbLE0cGrT3pB/EyGfs6Mzt00vu6OMwWDn1AlErBF6fbqYNktT3zh1E
	OWMVtp8utfCJ8mHA1rG57nea4IW9nNg8r1PeXr8pkY2uJ40duIlX75l/YyRlEzOeBjZo9XL1MNz
	qeuzm3GDYzc8NsvdJGo06e11QH4uOuYGpDGf1QiKX9TpxKX/HxW0VxCbzGOpsvTxhlKeo3otbFQ
	8eHYyqZmFPMk/iMuDECsWsrpoNJ93Ui/YVuK7qrdquNQ6QmfOL6gGSxR3u7gZfDcnnrZtfGnBxg
	nwZM2H3otFmtIC02XWC+QsSaXzog6dnMyoIANnv/5bIIsfnxxogumOg7cABNDVLsC1jM=
X-Received: by 2002:a05:620a:319d:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c6a66e36efmr1931175085a.2.1768999337853;
        Wed, 21 Jan 2026 04:42:17 -0800 (PST)
X-Received: by 2002:a05:620a:319d:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c6a66e36efmr1931171585a.2.1768999337195;
        Wed, 21 Jan 2026 04:42:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a31bffsm1555355966b.68.2026.01.21.04.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 04:42:16 -0800 (PST)
Message-ID: <d2aff319-d98a-4007-bfb5-8766e3c3c206@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 13:42:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: add device tree for Xiaomi Redmi
 Note 6 Pro (tulip)
To: Gianluca Boiano <morf3089@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, david@ixit.cz
References: <20260120180052.1031231-1-morf3089@gmail.com>
 <20260120180052.1031231-5-morf3089@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260120180052.1031231-5-morf3089@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -wX00LDgkcH1ydWy5eWXX9mn5gO5P9fq
X-Proofpoint-ORIG-GUID: -wX00LDgkcH1ydWy5eWXX9mn5gO5P9fq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNiBTYWx0ZWRfX5BhbhNJbj3MZ
 XaTf6uvlaTof2A92h57RLaJqkIddiNrXOwjt5oAbj0Ul+yFjITAQW+gZpMP6DEEWDVs7PgBttus
 9iG0p5AB3k93sxWJQBHikmLve9j1JitrXCO7h/fg64qkWpmp+rG9Z3rCqOi11ke8q0/4TgsmWLI
 gew3WCH/CRSjVNfDjBKuTmcxBYeMJSfZF/ll6QH3i2yGGuy9FdRRTFV85uwKuQ6wr3tCS7Gfwz5
 pNxqHdO62GPV0T/XRKXlU4vLnPTcqiBqtHZidrz3U2w5aU64R3XIAfKsx/3U9CVJ3NM1Pdg+BdM
 JtBrtD3ShopG6P1IU67t5zxmTWi4pTXia3gZUnK9xQKEojKdnrWQ2h8aSZMBvdE6x6NvgBiwLRS
 iB65zgeG14dZISZrGJ4u2lcgRl1YPcsrdS9Z2ogWaZTsKmZyF3kNfFv4Yjr/fJxumGtpR0W/Rqz
 v51C6CEkY7SVFmDIvEg==
X-Authority-Analysis: v=2.4 cv=QstTHFyd c=1 sm=1 tr=0 ts=6970c9aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=C1k7gCzBn4eoMjjkf0AA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210106
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90013-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1319257195
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 7:00 PM, Gianluca Boiano wrote:
> Add initial device tree support for the Xiaomi Redmi Note 6 Pro
> (codename: tulip), a smartphone based on Qualcomm SDM636 SoC with
> 4GB RAM and a 6.26" 1080x2280 display.
> 
> This enables:
> - Booting to a framebuffer console
> - USB support
> - Hall effect sensor
> - Battery monitoring
> - Charging (pm660_charger)
> - Status LED (pm660l_lpg)
> 
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---

[...]

> +	reserved-memory {
> +		ramoops@a0000000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xa0000000 0x0 0x400000>;

This is almost the same as all others, excluding platina

If you think it's beneficial for your "ecosystem" (with e.g. a recovery
or major custom ROM kernel), you can unify these definitions since it's
all configurable anyway


> +			console-size = <0x20000>;
> +			record-size = <0x20000>;
> +			ftrace-size = <0x0>;
> +			pmsg-size = <0x20000>;
> +		};
> +	};
> +};
> +
> +&framebuffer0 {
> +	width = <1080>;
> +	height = <2280>;
> +	stride = <(1080 * 4)>;
> +
> +	status = "okay";
> +};
> +
> +&gpio_hall_sensor {
> +	status = "okay";
> +};

Seems like all of the devices except A2 use this definition, maybe flip
it around

> +
> +&pm660_charger {
> +	monitored-battery = <&battery>;
> +
> +	status = "okay";
> +};

This is present on all of them

[...]


> +&pm660l_wled {
> +	status = "okay";
> +};

This seems to as well


> +
> +&rpm_requests {
> +	regulators-0 {
> +		compatible = "qcom,rpm-pm660l-regulators";
> +
> +		vdd_s1-supply = <&vph_pwr>;
> +		vdd_s2-supply = <&vph_pwr>;
> +		vdd_s3_s4-supply = <&vph_pwr>;
> +		vdd_s5-supply = <&vph_pwr>;
> +		vdd_s6-supply = <&vph_pwr>;
> +
> +		vdd_l1_l9_l10-supply = <&vreg_s2b_1p05>;
> +		vdd_l2-supply = <&vreg_bob>;
> +		vdd_l3_l5_l7_l8-supply = <&vreg_bob>;
> +		vdd_l4_l6-supply = <&vreg_bob>;
> +		vdd_bob-supply = <&vph_pwr>;
> +
> +		vreg_s1b_1p125: s1 {

Please diff the regulator settings, they're likely mostly common

[...]

> +&sdhc_2 {
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <8 4>; /* Fingerprint SPI */
> +};

This setting is common to all of them too

Konrad

