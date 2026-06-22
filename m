Return-Path: <linux-arm-msm+bounces-113983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9CF3B/0mOWoengcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:13:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 666A96AF575
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:13:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UVg0mv6X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h392uK5j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113983-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113983-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98D88302F245
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779CD39C62F;
	Mon, 22 Jun 2026 12:13:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41FC28F949
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:13:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130411; cv=none; b=oPlwM3fNj6mb6PpaQSA/PJtiuAOXbCkBXdJ3VwcVmmIQZVikQbuOnUPA7eSae72Ds3jtip3/D4uc8XEblKXa6m+x5u9kZQUGm0A/zMHFIs1H3f5t/2DQh6hEBN0h0KlMAtpOFD4qULXOwbHiFkQJGRuBBdEJG0jTgjqJG3lM8o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130411; c=relaxed/simple;
	bh=qQLoam/1MFwItn0Qqrv6nrGWj1C65+jczm2tdEcPZWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7fV5ZwvI3DcVqLF8yT0IKKUnGbv4ofo3bQWu/WcjoEJVc5P2tiLBAsLo6l4ELJyI/LjcuvEBsq119vwMOPtlveZc6scJAv2Q+wDLIci380ZZ5BivZ/w5jS8AuPhxs3XEoF9n5Fnp5vzWV83NSVXNTtmUchLQjizPjojmImfAHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVg0mv6X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h392uK5j; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAp9jR773290
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u2M7Jat8m/iRJnDPYk9e2Jat/6YABPDmbkZh0pcpP3g=; b=UVg0mv6X9Ox42QGo
	Q0iNAo9uOpchQWUIBAiC6A1z4KOoHvAO/HklptGXNg+vmn2g8Jb9L8i9kHbFeetU
	TdRUZetdfqspUFP+sPY/gmBa+9M6369igOdeqq08CaGqc3TqRDMz+7gOI+f8h2j3
	MFA+rhpGoNBucNBku3RGB0LcAlut5zIgVBGb0arEzi1V7qYOrI+fAFCuMnsIBnaZ
	6gPM+0kzHapokqaWZUQvcOVXEaAX8QOyzMU4DTSGoqYBcgVIhw0gQOboeUbha60Q
	1eQWlT6tpWuMl6A2ZHP03UQILJ2s+v57u04I2KTcsh89jpfLkCnFH1t7hTODA/nm
	j8MJpQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h6f86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:13:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178a632a12so7005901cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782130407; x=1782735207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u2M7Jat8m/iRJnDPYk9e2Jat/6YABPDmbkZh0pcpP3g=;
        b=h392uK5jBpBViTzAnj7TXHzF/sa7YdJikyzSlTzYu1GdmuTpA3US5XAw0pGy3k0MFU
         9Aab4D5j7beBuHfbPeZH61tJOQNxO+fWPwY57J5UjIrayuhHumxk8x5/P/7opqqJM9i9
         vEqUXJkJjqjXq3sRQMYxgr72TxkDrCMSCvEDNop4U1lh+ZwV9UNXIH+ZYf4mW7Lzo82E
         UjMDAvc9O/AUpCg9BHaZlgF02PrxRnctUx6qX/lJmDy2mSwtHOKSiAlI5kQJ9ruCP++4
         XUsntsXVoJaymyqB5bHv653GJ5JzEqkd6c6E7WsblVyaECBNNdGXJCo4rWG5+7/ahX+L
         pwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130407; x=1782735207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2M7Jat8m/iRJnDPYk9e2Jat/6YABPDmbkZh0pcpP3g=;
        b=VEBUYcI6y5QxCo0tXyHvp51bMUk/RSCNZgFX6uSAK6cjHGWnHQav8cwGBwu1i3BIDf
         2I+/usXHpoljqXq0C8qiXDNIEHCXojZQrbRF7YI0tHVRBNYKjPmBgw0rTkGyUXSWXbSO
         CyKlzSS7U3TVtHdqmLzc3ucCXWfajXS6vBlc9J9ywIHy8GH8g+Z0RBlcEpgQTju3V7TJ
         AGWvS6RqsOuPxYKQxNTi9rzQ4c8PDvBvNDegRxyJ/8UOV5OU5NZmQqaVJCfBqH9wst4U
         UGgAj4lFq+FccwVQgNVxBZGGphEGbH6d4dqsSojdv+Cjixs06wY5iHW3iEh5j1AUN+xK
         Sssg==
X-Gm-Message-State: AOJu0Yxjb0rTWKJPs5FMbpDGlDqMGQnLRsJrvBerDckmasDVTBPkVTdU
	ekx7FXz77qr+TBN/pTyMDtD0quqVfmG6YQ/7ydaL+BDqqxZhkyZC86/D0V2bC+7YgRVhLQNbN0w
	gCSzEUE0kan6kqK3tjni1xNHpEh65SSVK0fUsLxcOiL1DOHfm48P5pJXsft4NDOAoavNx
X-Gm-Gg: AfdE7clp2/vzCErvc1Ji9IswnINaR4fkhutmqpGYa1rWLnzTo2wxXpt0JjkTguiWUYp
	iS8I+1kDXQPa+uDf9LuGZbxFl0cbEJfbahwKR+PGk0Ct0dY0vQvhnZcDZUFSGOmGR/QWsnYGng4
	Mc5/vw2BmXgQZyvs8z9kjKpDlFFcXU8YNtX2LhHcyrnsxDq/ZdNFM/euxoE2j3PDPKvjYz1h4D9
	5vsCJ5YAI3aYdpEboJjfVEQnQ2QVZEJMNAAyp9n2RdVRNBLlnFnh/pc6j3npjyw/wg48HocnIpy
	mQ7JDi5K79jT4xCXOYbTb5XXNKj+fwbf4MsWlXyzmWJX0CIJ9SQ/YmsAyoPVVrffdJ6w/o6zGzu
	antr1Sj4e3v/PxSpMwtDrcnHBqAzuThug0vc=
X-Received: by 2002:a05:622a:313:b0:517:8999:6c50 with SMTP id d75a77b69052e-51a21b67438mr63115231cf.8.1782130406949;
        Mon, 22 Jun 2026 05:13:26 -0700 (PDT)
X-Received: by 2002:a05:622a:313:b0:517:8999:6c50 with SMTP id d75a77b69052e-51a21b67438mr63114631cf.8.1782130406230;
        Mon, 22 Jun 2026 05:13:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad5c26eda9sm1621597e87.24.2026.06.22.05.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 05:13:25 -0700 (PDT)
Message-ID: <032d6002-2205-431a-abc7-7c0a010c9897@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 14:13:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] clk: qcom: Add generic clkref_en support
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
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-3-c939c22ded0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-3-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyMSBTYWx0ZWRfXz/h+R41PCvlh
 5KKWSQ+4vp6O2h08UAALsaY9G7j75r13YD1wHmMotEmVQhMPNZQaXbU8v9XzozjkIUGhctMX0cj
 l6pi1WQ7sT07mVrW0d+saYVd77EkM7AsBcol9h7hcPwy3RxtKbTv2jDYPkLFoq+3ny0Ffi5Esy7
 mjE0MAO8rT9Z5sKIu7YG962UxdIxpaO1PlhkAEotd4v/28Lsl4lZbEBofL5mQcKVdH2dHRY07OJ
 nJWNvTf9sdN2soPuHwOy0Pw0rvMg1i0MdlgYkvhzStp0OcGQfFDYdGyhKqpuh9bFs1gZa9p+xNX
 yJj5SokGQ7Js5QfVT+9sLffI8SRwRFQsyNE7jgc5/g4s7NvKJxT3ZQgCxbX1OqtlQQLHJGDFvNu
 vkwlZrgajYGbmE7w1pSt1MR+/vjZUFwCOWhC/QYRkZ4mOPHxlTmfGlqScYNFvD9kkIk6ZddtkIT
 aWDIP1fgSOpAOop3PXQ==
X-Proofpoint-ORIG-GUID: cUlhCj7N2PJ1uJTo_jIyorWZCp_Ne8c4
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a3926e7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tIU0ZN1R_etRVKZmDSAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyMSBTYWx0ZWRfX1XAdn6G+sbHy
 3WcULxXAgh06ZuieZm0Ak8V8P3io0Hguje+xn5SulDZoSgbopxu0p2UcdmDbXOIeWA01x7jyRfi
 3K/Z6AiB+PqJtyLaiwDfRcxim2bGfoo=
X-Proofpoint-GUID: cUlhCj7N2PJ1uJTo_jIyorWZCp_Ne8c4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220121
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
	TAGGED_FROM(0.00)[bounces-113983-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 666A96AF575

On 6/22/26 7:11 AM, Qiang Yu wrote:
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

> +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> +		clk_ref = &clk_refs[clk_idx];
> +		desc = &descs[clk_idx];
> +
> +		if (!desc->name)
> +			continue;

Carrying over from the previous discussion:

> // this allows "holes" in dt-bindings for $reasons
> if (!desc)
> 	continue;
> 
> // this makes sure the programmer did not omit something important
> // while not taking the entire system down
> if (WARN_ON(!desc->name)
> 	continue;
>
The NULL name check is intentional - the descriptor array is indexed by
clock ID, and mahua has fewer clocks than glymur, leaving holes at
certain indices. So this is expected at runtime. WARN_ON would be noise
log here.


->

Your worry is captured by nullchecking `desc` (i.e. descs[clk_idx])

because in the mahua case we've got (ephemeral indices)

tcsr_cc_mahua_clk_descs[] = {
	[0] = { foo },
	// [1] is unassigned - OK
	[2] = { bar },
};

while (!desc->name) checks for:

tcsr_cc_mahua_clk_descs[] = {
	[0] = { .name = "foo", .offset = 0x10 },
	// name is NULL by virtue of partial struct initialization
	[1] = { .offset = 0x20 },
};

however I overlooked that we actually just have a normal array of
structs.. if we turn it into a struct pointer array with assigmnents
like:

[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
	.name = "foo",
	...
};

we can achieve that

Konrad

