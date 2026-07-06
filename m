Return-Path: <linux-arm-msm+bounces-116858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NWntOlWyS2rFYgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:49:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6748F7117AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:49:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="VK/U3Diu";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P4URPOP+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116858-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116858-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DE0D3045E2E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA28C416119;
	Mon,  6 Jul 2026 13:25:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C83A0B13
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:25:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344356; cv=none; b=ri6cShDGEaFBO+XAcjq0bEGIKLxZ0looQZmMIrYuy+rU0UNGvM+QBuWcOm45iG9D/1A2lYSqOCVQsDXQZrjvGE4PRS91RwehgMJWXPH5SJaBBan5bVbJXsokMiuDJpKJnwDhkvp0Pvj66CFhABBiFQgcQ7NkJBGE3z0qpszZCOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344356; c=relaxed/simple;
	bh=2t9CuXwCB2vIl9APo2o4vPRIEb+dUwYD4ysd6rRlclw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFNopKdho2vgxiIQ7z15uMf2URkTXmJbTPJTI2+roYjieNKjNfkS+oV+2HyCVPmdm/oPwok0ebQUtn5ywEqH0K/zcJml2ubOtcNIwA1Y9G0B9AMzJzcsdweLMVYlOdo8/hjKknNLGsuy/kwIu0ZFqV/bXe94ojOrWn4SHcg2nkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VK/U3Diu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4URPOP+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTMk367424
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HNQVled0KgZDT93hmXfBB2xm
	dP8O3wvyGKZXqdF20ss=; b=VK/U3DiueIz1i3ItQHbF8kARojj2FOMsO8zG7GEt
	fKsvzYU3/tCPTGKUW44BPeqnuU53To2cb/sAdN0LWWN7M6AjP3EvcKvOk7wTKwBl
	9EFnTczJerbN3QAbcbyGhaO4Cu9X9VE9Z5fhIUQ5VCap0vDEHI61xnivWgqZaMoM
	fIAQmeH2nrTZrfJc8OVbcUvhvaZam2gXUofwrWOTqAtwQdpo1C1wmX02ASCqevvZ
	s/WFdJBCp8cMZkpU2EiWisM5cjnjG/dJltmsaAk6wgtYnAbC+AA6JdK4TBrGlt2W
	+h1aiRzgYh1ZvoyrEMM/5uMwoaFyAxIDtHO+zdkmGwofmg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891us3cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:25:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so5242146a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344346; x=1783949146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HNQVled0KgZDT93hmXfBB2xmdP8O3wvyGKZXqdF20ss=;
        b=P4URPOP+v/8Q17iBPgr5Y7MR82uNIXGAdJUeR2n1B1S6O1+iozbkbd1TS0LfmTz/qP
         GO8Oz5GeXn4kBbBEmTKts0zTHyw1oWuBJEC/acO0AmADVk1ZGei+qdSA/0L+6sXhijV6
         RY4GNo2cel14EKqB/QGrf+n/ndz4mX4+DISWr1GLPsOIIAOxzu6mONmBfoeXzJx8gXvO
         7F+VCz4cmGNsT1GSq8HTdo8cuIlBIf2faKSriFuhJtukK4GrqB5NhqOMvCuRcgOFJE6Z
         qg5WpXpx/9nQ9JjFo7gqL+gW/1TO8B+Wwdz+8NMI0NVSM+ErWgEyHsUS+v74VaU35RJx
         PqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344346; x=1783949146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNQVled0KgZDT93hmXfBB2xmdP8O3wvyGKZXqdF20ss=;
        b=l8WMGG0ZCdW074rEyf3IsdU9G7Hw5fTVDbBj414OsiYDa8y1AaM1B1AqqKEvumK9nR
         ommhYltp5dHRDqw6q7/q8LjRlUg8Bl/KSln7PPHfK8cRiN8LFJ0vsImb8ZddEKz08Obn
         NUX/A+GKaRflAxiFyQP7XoqVKbwkUSWE4Q7lOinJj8KgMK6E/TR2MJFaef2Q4873+4up
         JBSADMdFP7AVcN3ddSsFM3MsWvrWLxjwPcuKnZ89zw3R1jb3+YYF9NToHZWLvpBtbaXs
         0OO+C+PLWJcbIVXDMb8LvmdsEOlzoktM7+WBkUyYgKGwD1+vtzTR3jCRDsHIgRCaNV66
         uoQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrk8eV3o+dWUsVBvCjBsgpxzOA9lKOnNJeyMXmAKL8ycPNMeHut2zbpc5STUQlggu5B1AVW0MnQuiaNGhCO@vger.kernel.org
X-Gm-Message-State: AOJu0YyPagE3lP4LG4nRe1GxspBAQ7l1VUVvWS46EpWl1Qq2LspFkzh+
	F51E+LOEUwRs4i8sZfMXX+bR2PPVHSUSNsgDoZGSK5lyWn/8WAm7nGoLaOTo+/VL0p/XJxuNO7W
	elSX8R95MyyH20bhB/TotsZ4G5x+wWSme6uPxhZI7emzBqWBb/0Kd/jIiwaVuylunBYtN
X-Gm-Gg: AfdE7ck9v/NEZFfV5Ys6BpE+BcEYy8zR0ScUVJgPv+0PCqRWY9azHe9qg6UlLq6MCbt
	x3uDrVze7GV8bVFz9Iq39jEJ0ZedAcI7DjFdsR46gb6uTenEYpUL/M6adPHHjoIPEJqqpu+Iovb
	2qJO2yaJOKN2zWQ4YyuDaXFNLa+szDsxMHObEDSP16fJlSQq6ingqZ6e0u6fzpjlXxNFXTRa4qm
	0A2FA0mTRIXDpSJx1tTDqfwaj1UCcyxoaaIYPcZodYcVNC4wrM0vVAVuqeDjTnqoZ3x/AGiI6YP
	mHCBWxLpmwLuAM1JJdjp/ehdZ+5BLxs5rvaE2uCE+vp7qdiSqGbnJzp+zdeuZ2FLdpBQo615o4J
	CqaBhK1jbPWCpG0I2mbM/OX4aLSRSyquZ/5TZXiL0jgYyIAe50StjCkN/XA==
X-Received: by 2002:a17:902:ef44:b0:2ca:cee0:e172 with SMTP id d9443c01a7336-2ccbee24250mr4750415ad.30.1783344345987;
        Mon, 06 Jul 2026 06:25:45 -0700 (PDT)
X-Received: by 2002:a17:902:ef44:b0:2ca:cee0:e172 with SMTP id d9443c01a7336-2ccbee24250mr4750055ad.30.1783344345483;
        Mon, 06 Jul 2026 06:25:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7870f58sm51690345ad.59.2026.07.06.06.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:25:45 -0700 (PDT)
Date: Mon, 6 Jul 2026 06:25:43 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v7 3/7] clk: qcom: Add generic clkref_en support
Message-ID: <akus1zcopzgPNaxn@hu-qianyu-lv.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-3-776f2811b7af@oss.qualcomm.com>
 <e187bb2d-9496-4683-8eac-17a94941c952@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e187bb2d-9496-4683-8eac-17a94941c952@oss.qualcomm.com>
X-Proofpoint-GUID: -Pn80MkcEgNNtijzDkUHNZc25mPTGR1H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX/lDgO/VD+shU
 KESUv6NoMkY9UUvdBjOeqDnS8KCwz1qX1jgSaXJp3qO9TqHM7UdIenARilvImzwFtUdiY6NS4Wj
 +emwWEs49+hiRfpJdcdIJRZHNUUHxCQ=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bacda cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ukEeeJt9K7XwON3hb0cA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX1Ksy28saZEPZ
 EuQz//ZXoZa6NQekdWUYyLIb2RGLMGXOCaBcHcfIFCe9ErBhTQG4o7O+5J0lrargmmtls98S2AL
 YN00EUT8PS85gvBGlkbcxpap872VFdt5QUIvsy53omSKPynLiFKSqTnZ/FB1dKlT5J4Wr2pUF8Y
 QRHBW+TkiuFnvuqVU4Jj+ELm7unRJxeU0F/0bvdxKd0QKojg8cY8vHG8gcQs/xayae6I4YlKZKh
 YQbC/bLtprGbkTsEhyblQs6TuAqg01hT6a7O7LyFGX/nULUh01xNY5BJ+5W1Kte5OHB5OvygULq
 3I7Km+3KZmiRkTY/wetiDFk2HwB7Qi/zBD7HiRIGBH8BrSYSl6r78XTG8JNTbhXY/a0nMWC7wzd
 nHantC3xII4spwJDVftjVdPRWwhMqbU5gZzVQDnjHn9Zc/kNimIeJzpnRy2VAUAkFIoLWdsG7hw
 dgTrhGYyOzqm6CZBdZA==
X-Proofpoint-ORIG-GUID: -Pn80MkcEgNNtijzDkUHNZc25mPTGR1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116858-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6748F7117AE

On Mon, Jul 06, 2026 at 02:24:02PM +0200, Konrad Dybcio wrote:
> On 7/2/26 9:36 AM, Qiang Yu wrote:
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +struct qcom_clk_ref_provider {
> > +	struct qcom_clk_ref *refs;
> > +	size_t num_refs;
> > +};
> 
> If you define num_refs first, then you can have refs be a
> zero-length array with __counted_by(num_refs) and make provider
> a single allocation, like:
> 
> 512946cf0f32 ("nvmem: rockchip-otp: alloc clks with main struct")
> 
> otherwise someone will come around and "fix" it in a day or two
> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for the suggestion. Will fix it in v8.

- Qiang Yu

