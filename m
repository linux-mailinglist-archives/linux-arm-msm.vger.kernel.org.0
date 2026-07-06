Return-Path: <linux-arm-msm+bounces-116794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3LRkHT61S2rRYwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:01:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02173711A63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:01:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="lH/jTr7x";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G2F9HI33;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116794-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116794-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 966B9332B22E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B209A38F954;
	Mon,  6 Jul 2026 12:24:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445B1409613
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:24:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340651; cv=none; b=ODOAghFwdQIOhr4XxhV8M+0yqFUzEVeKst4tKIycAvVJhxQvgvb1z2wMcWWSxckZxISyjMejGvAAcPI0r7JdKcQesGCv6PKb5ewKA89ylJOjGyfnzwWpaH6qhUpi+N6kXpMNeV3JvkXXY4sWo552F16cKk6Q4LJMBEmG0ylaxc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340651; c=relaxed/simple;
	bh=jquZaB5cnyQkXfJHzXzOZTU3Nw87UqHejkSfxS+Ivrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aa45z0L2bi5/mN+MFM5hyvLNXKCVKHdUn/hipibXlTOYBUHtOEda5lEs0FE9H7zUbO6W6YwMvF2nQYy5SNQgnu3knYVIVfl16xKiL68Ur3LHzsktR0ZV1nGa+JO4GJJWwbWlVtOf6DdhKBGgAypywk5aufQglixTmi5CYOnRoTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lH/jTr7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2F9HI33; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxGIe387168
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qSRw2jkAJBqJzogSTTDVCeRoFnrRmsDwzsYxZO7/CTk=; b=lH/jTr7xhBEUnbJ/
	17N/BLVUO5PNZxCvBZJ7bZ4xO3n5aIsMbTP2oVIixRZoALWJEehhJFeWqrUDYIoo
	5LQgSQ/2tRA6DJSd1lXYq8zEGP/AHQccdecKtrXKXfVaUU/49x5lG+oHNJWsB9vM
	hP9/G2tmbq/PebV7dr9Pv95exCQRpV8l+rW+SbQkX4isS10Hnxc+kAf8VgK66Qxd
	6b3s92XDHf3KHEnMvNMhjqBq+l8Lj2TyIkMXS8EZ6CXRPvcVSpUh3/a46ZRdcfls
	9B3qjsSEuJ9SAFoF5hQ36EOnnRuEXarBpv4mEMojnkLvDdVVCTjH0huOJY8zjkx5
	lihrfw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0j21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:24:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c298a1b20so6319961cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783340648; x=1783945448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSRw2jkAJBqJzogSTTDVCeRoFnrRmsDwzsYxZO7/CTk=;
        b=G2F9HI33QmJPl3RM/+A8DcQVHigv/M2f7zF1vS56CYxYLqnXJrfZdgeVkHpoCsJTcY
         Dy4Qzv9YEwxHIDgfw31Ve5JFrsnLaJPnQCI7rc5xXxiY/uZZU+7bHd7mXocAR062JM3C
         NJdhalPDx0OzCClfeB21ZV0di7ZvpyqlMpZ0Fzeub0RVM9D1/ApUYLNOPzvH+YaIlAo9
         GB2n79kaUgWdebDVWTn9seSTBxTydmROymKmQeewsQis9zkZM63Apk6/97iXywgwCsA3
         N+4W96ZXbt31GuhchC6c9JUmiBvM4KAX0sJR0ZdjweyODJkz9jo5/EBZaWV7q0mmQrGz
         Xkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340648; x=1783945448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qSRw2jkAJBqJzogSTTDVCeRoFnrRmsDwzsYxZO7/CTk=;
        b=kqKbjIwfYteb4TmzmEfo6z/94euz8g7+LOnflDQnF9U/FsePh+ZC+irsnrX/rVySOZ
         TFUrLfG3sd7MGllL5tK6Y6n/Z+jhJCeCqRlmr/b2m6dXXnWGAibjUy8IXWaEvU7Z5q2e
         wP2Sd1E9K247CAAM1wJjzKJvxb/OE1qwANNwAFUyxMctZnwCkzO+l21Fc39PiUrj0QOI
         nPw3N+vqzp6IxTaLpTSce5JmClfH9VB/ns4ZFEwteIW40zySb+f1c/vIQ4O36DfKsK0V
         1/hsQMybH59J2jfJ5gWEHjggkPvRx9Mwhz70EzxH+GL+JX3L6xI+5QGSNFdwGSc3RD5e
         Nh7g==
X-Gm-Message-State: AOJu0Yyv0P676W6859c1y5D99iPdzHfdRW65s7YgowbXId1M7obteAX+
	GMYbwUDOEBU/ZS4REKpoA9/bAhQaPJ9HBHOePIvYqD/UavuIgKaRQUzkjY9XUlAgf430X1il/pu
	0x/qKnnmsDdFJRlT3fcrFv4Xjmwl6idgivHdzTfmXEnC+9W7qY1lubDt2sWCcFM3LE8bm
X-Gm-Gg: AfdE7ckdedxSlLUtot1l2/DnEBi9tPBHg9VkIh5KiQP61k8asIlyMOZco/pp4RHz4fH
	UqAtkkJ/LI0uJAOWqDhiK/wkJ26/8jqbZP8ktlvaiu8ENvwc/2lHczW4HPb0EfpiMYVc3/G8ZN9
	DV0r3/gT28+6gILe2Wbi2kpUsEmQemN4tsa4GsVdIamIzVShmV4ICGQXFPgb3EVt1vo2mcMlX6o
	sSI8mWUGnEGAd/yZQBdFtNnqdLDs+mmwIErQkf2xp7CotbMXjoLXOQcUbnZeqyUp8+ctcMPNYyu
	c8D/dS8bMnKgV6ekg12WOK57EwhDVZMtkMWQ2MBf/iD6fnQ+KXfYr9Eq6ixRxQ65PSGSB1nvjLb
	g4EArzB2xPBCQ5VJxat0FWbBlp1YlPmcML+E=
X-Received: by 2002:ac8:5e4d:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c4bd94c5bmr93170941cf.2.1783340648126;
        Mon, 06 Jul 2026 05:24:08 -0700 (PDT)
X-Received: by 2002:ac8:5e4d:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c4bd94c5bmr93170791cf.2.1783340647458;
        Mon, 06 Jul 2026 05:24:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b5ae4959sm731134666b.0.2026.07.06.05.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:24:06 -0700 (PDT)
Message-ID: <e187bb2d-9496-4683-8eac-17a94941c952@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:24:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] clk: qcom: Add generic clkref_en support
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
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-3-776f2811b7af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-3-776f2811b7af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNiBTYWx0ZWRfX1Ea9HgtZ4X6s
 9GWAIlmDcZBjxYGyya3kFzHO067XqPloueKTDpSPA0zxqk3DFMzGdr/i7+9BbP6CnRxC+pWbrws
 9tDwlMiu7Woh0LHY9KQ5JTSfPaC+v6AeNEHg7yVjdLXgy358eLZAUqdp+AW+ZifDMSEmSW1ixFE
 9xszfzumIugYa4fQHkJ8Z4tAYeZG0ZKkSANtByENxUC0rXwY8jq6veSsg0ubi5c7yY9/TOPL3eH
 FnToqWZJD25lroFpq0Xp/0/TYtOXAS7k55RVkoA+BagnbwwV8o4qskf1jD4CpbpSRY9QEKYwS4o
 AgOyVfopz9CI5siwFSqt4cUWP+lONmvJ4GYYYNZbspcnwkH2etuniCgCzPC0sw980JkhQwiYpl0
 /31uEuuOYTJhJej1nkPMYeggueVpsTxgTkQluVIftaxvR2dC0ECz+ADq5GshMoR4wKsWKo6tAbJ
 Q4vl8FIMJEWX8cdlt1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNiBTYWx0ZWRfX0gfqlxi5ByeN
 aded/wBkehEj1oiUhvDPVV+P25qYyeiwUj878kMbRylg/H2SnlEbfndLnKfZt54fe5ClzfXaRt/
 ssqQ7sLLoHwcPQT54u2NHopluS8Hvvk=
X-Proofpoint-GUID: JCNnYe2DREqFYuot-fdW0OgPkMNeKuVr
X-Proofpoint-ORIG-GUID: JCNnYe2DREqFYuot-fdW0OgPkMNeKuVr
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4b9e68 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4hBvweVN3K0BpMZFuekA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116794-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 02173711A63

On 7/2/26 9:36 AM, Qiang Yu wrote:
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

> +struct qcom_clk_ref_provider {
> +	struct qcom_clk_ref *refs;
> +	size_t num_refs;
> +};

If you define num_refs first, then you can have refs be a
zero-length array with __counted_by(num_refs) and make provider
a single allocation, like:

512946cf0f32 ("nvmem: rockchip-otp: alloc clks with main struct")

otherwise someone will come around and "fix" it in a day or two

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

