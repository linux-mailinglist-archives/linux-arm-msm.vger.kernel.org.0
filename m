Return-Path: <linux-arm-msm+bounces-112167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o/9AHfYPKGpQ9QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:07:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8493660627
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:07:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Zim+083o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ygl5G+6i;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112167-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112167-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F9F13046724
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D0C41930D;
	Tue,  9 Jun 2026 12:57:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F404192EE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:57:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009879; cv=none; b=Bbihn328VHDiHZg9QoUX8lH4tgO10TCJKEx6PjIFxuBsZEwPejguL0R1ACjb/ESPZONcdFjnBVjTDqSvQynJXqqVZO+rmer25Tbg45/WPvgruRMizwFtl7zzySGljkeGo23qc+DGi6Z9c2Lo+C0/+1HFduLkQ5cGCP401xpcdbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009879; c=relaxed/simple;
	bh=VeKcdjbjG9neMz/DzvyzOu0eKpXEomcIjl9R1GRbPbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFxN4daI9VaI5JDl6dI2QAurtNiw/4YeJdM2+aRbTLDeGgQ8Us9AJbh0Vg302BLWVxklrPPJ0bLJlgAdmfF9b3mDUpJ6WpCKhOXEw9itO/dUjMzaiLdAOKGurL/IG9DMkDFJQ7KQFlhZcyrPr0/bgHbD3b11u97JATqu8ZD0A6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zim+083o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ygl5G+6i; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClJTm2249318
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 12:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGOsl3o1y58ZtNWsmGTcSIVSD26o9VXU5DHOJ3gam3A=; b=Zim+083orGh6vg/E
	dJbkU/d7rmClKcr8pxP2VksKpwGbPXv32HFrfdW3FOwNSGwMx2zV5sb8dmc8pX1D
	JBX2fcv3vSO9MdLGkjlFtOAfMKj6hbDS7RpOhyQAYJbq9Gt6PN9NMfOwOuCjtmQQ
	P0UbGWKbpAzvcK3gW8ipBJPp2+1bToDIJbJow64tJv5AUhgBultRxqg/x2NRDBXQ
	qKPeoqyjhC2s6aovT3oplxe7RpXnvxJR8Zl903egBlaaEH+lFfs+ChDaGhytZEmc
	x5pdWZneAUHpIgYMgg0I8Z7jDoO30ove3G1du3Bl565URYL9WGvvysiQv7cgTVvs
	7Cr8zA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wguq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 12:57:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c5a5133221so196604137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781009877; x=1781614677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGOsl3o1y58ZtNWsmGTcSIVSD26o9VXU5DHOJ3gam3A=;
        b=Ygl5G+6iTfUw8BLZzlIwXNOK/Fah9iHbPXplHYkfYxPG/AJDqib3TymO5L3mYqylcE
         lbawX4E9F9OqiyJUx1Ol/Q9PDLzRgJNIe4ZpMAO6vLEhnZUWDOf+EA4JtGQ7BuS/KKpo
         IS31avH/eHrlEV82hUE/Sw/VtS93xhiLAeUXCjzqgWzFV06u3v76kmX1m2oMH9bkv5ZO
         ZsO7TIOgZk0iSjgODWXEHMplv4G67tljyvUs+nHxczfKZrWfL02LLW4D/CHLl+Mz/cQ3
         nzk4ZzojkINt+ZcinsZR3U1BxBZVbY6ArBy/GQ3wm+H2Bq+CUOIHIYDJHCfYpjNuUiQc
         EvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009877; x=1781614677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGOsl3o1y58ZtNWsmGTcSIVSD26o9VXU5DHOJ3gam3A=;
        b=SAf09rgURAiTIcpw6GsU41NnTy2MKd2J8CrdlkAqeaLuONxZPBi+a5Z/6p0B3eG8rp
         DuYrUfp6SNBO9bB4RariZG9kytq/nhHRzfFWn3v9mgTR034h+nl3gLaMcd0ziac3hoNJ
         RRegBR74ZVwGB1GkYSWiuprSxSDJkyDCKS8kUzhCqVNBkoIDP1d+IF8d8P4OaH/X+QQ7
         3sD4+1lpr8YvFDiYJ9opLeakt7OKnHT6VUV49kpoHeUCzCbh490kKzbTfisKyFAWhKCH
         QZ2jwtSaqFtlZfWpf4ft/UvFpwTBieFfc2Y7Ra8oAG+rjncqonqcgI9bMvFxNODXUMJ4
         /UAA==
X-Gm-Message-State: AOJu0Yxtwvbuk7VzN1d35UJEBI8tYqvUKacUrOFO+BHxtuJDiEH2kvOR
	Kl2D9Qkwu7KDOj919tt8mm6jDenD3oe6zHnKI8PwdIW4yNmv8n4L1uMmVy3Z4CoFEGwWeve2Ax6
	1fqXmWQ7rT+nmQUWcypxyAd16E6p+aiNiuugbC7fPK4HfsopGZ6OEANl1vwUoozCqYphR
X-Gm-Gg: Acq92OHkGv+TiunJG6f4AVI5drIfF799CxEEqjFVSB2Jv6ez2cf0kWrTMRHZTmm65yD
	+nfYtN8F4f7plPMkS69egzKANtEANOtuEHzzqXINfW6F9OCApLK89TURdSFZE44oRXiy2n8MgrF
	r1qpufPckkMwBMrFeRYdwyjT7uZktQVn7eMvdkoEEEjBGsObpO9hFVWNOj05ovoDuNj4J+q56z8
	rV+Iy9A7nA1g7/0zy2yV1w196f/No4B+Od4kF/TF4Bh8H7xd8bltrKnpqr8+PLS7yzmCITIxcbA
	FAn2znChn2jt+ccYbZ2fP7tOm6f2RRZRV76wZkBZqTXmk+rDSTmyja23lKscKlCqBRsWtnaNBkx
	kCfJAqTMspb/BRmUnw4S0AlfmOwv6xzV3lIPd7zoPGrxQ+/x3/fiQsIIS
X-Received: by 2002:a05:6102:4494:b0:65a:fe89:c8e7 with SMTP id ada2fe7eead31-719254ae70fmr316667137.4.1781009876853;
        Tue, 09 Jun 2026 05:57:56 -0700 (PDT)
X-Received: by 2002:a05:6102:4494:b0:65a:fe89:c8e7 with SMTP id ada2fe7eead31-719254ae70fmr316651137.4.1781009876459;
        Tue, 09 Jun 2026 05:57:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99ca90sm4648052e87.84.2026.06.09.05.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:57:55 -0700 (PDT)
Message-ID: <b0479824-0c6d-498d-bdc8-63f678a6f2ee@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:57:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyMSBTYWx0ZWRfX552x1FHoTC/g
 JK9wOznAJriNSOlLm5BSEhgbzvRIUYQvbQGOSSCQ97Zo9wtYnSMCBoPYxLCKwNNMEL9k9ddybuD
 X8mTXdN1rTVO+r0GZ0V6L2TGGOzhF+bGDM07CA0Z8+FUMZMWxASOwAq6zbyqBDdxxsSEMfdEUjC
 exteUTtcPZu9AC9PKKMZ/nsypssXWjTy+s8uEel4LpktYpqEVTADaYUd63A7FEUz9czmBEgxrmt
 Tik9LWvRoQhX4gRyxdNfwlPgoB5PKP+QDkVhNvdxAl66ysI18l3y1hp3k3GEEA2FiwNw9rhb26O
 z6LbYMwUIO21T2kof4q8+tnn+1tyT8mBOglrcDB2yeLtP5GAZwW5i8uOadgew7twK7eb05sVk5x
 7X1zHgpG43Bgb7h0Kl0G837D+otaWoFrDkTcI/Sve2kL7CdLP5HrfZjCWEYSFJAj71i0qPPRM/2
 stqFehAUof/c1MGRDMQ==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a280dd5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZOZ9JJu0O6LkbGEWVdAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: aky8yyBIsesxYWOkMVavjzXFSVEr0H1v
X-Proofpoint-ORIG-GUID: aky8yyBIsesxYWOkMVavjzXFSVEr0H1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112167-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8493660627

On 5/28/26 4:29 AM, Qiang Yu wrote:
> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> register controls whether refclk is gated through to the PHY side.
> 
> These clkref controls are different from typical GCC branch clocks:
> - only a single enable bit is present, without branch-style config bits
> - regulators must be voted before enable and unvoted after disable
> 
> Model this as a dedicated clk_ref clock type with custom clk_ops instead
> of reusing struct clk_branch semantics.
> 
> Also provide a common registration/probe API so the same clkref model
> can be reused regardless of where clkref_en registers are placed, e.g.
> TCSR on glymur and TLMM on SM8750.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +static int qcom_clk_ref_enable(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +	int ret;
> +
> +	ret = regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK,
> +				 QCOM_CLK_REF_EN_MASK);

regmap_set_bits()

> +	if (ret)
> +		return ret;
> +
> +	udelay(10);
> +
> +	return 0;
> +}
> +
> +static void qcom_clk_ref_disable(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +
> +	regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK, 0);

regmap_clear_bits()

[...]

> +static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
> +				 struct qcom_clk_ref *clk_refs,
> +				 const struct qcom_clk_ref_desc *descs,
> +				 size_t num_clk_refs)
> +{
> +	const struct qcom_clk_ref_desc *desc;
> +	struct qcom_clk_ref *clk_ref;
> +	size_t clk_idx;
> +	unsigned int i;
> +	int ret;
> +
> +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> +		clk_ref = &clk_refs[clk_idx];
> +		desc = &descs[clk_idx];
> +
> +		if (!desc->name)
> +			continue;

// this allows "holes" in dt-bindings for $reasons
if (!desc)
	continue;

// this makes sure the programmer did not omit something important
// while not taking the entire system down
if (WARN_ON(!desc->name)
	continue;


Konrad

