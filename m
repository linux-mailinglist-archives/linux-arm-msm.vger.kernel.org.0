Return-Path: <linux-arm-msm+bounces-118114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GM4rLrRWUGoCxAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:19:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040B736A1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:19:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YRf3QpFS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Kw7Y955y;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118114-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118114-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF4843017468
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 02:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECE9223328;
	Fri, 10 Jul 2026 02:19:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5931D9A66
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:19:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783649970; cv=none; b=a5ypmJ6KZJ8KSKDkSZc2cbi6FEwM+8KTmvPKqrAr4oVW+yUAVz670nu7neBCw6RquQ2r2Yf9BhyHqpzVkim4r53LQcZ0CvSbJLIPdya8u0WJFqZ5obXnhiHAbVi+bo/x8/LIp4YAqCN/5PkfnyG94rfYFCW7KuJQGjSPqcTThlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783649970; c=relaxed/simple;
	bh=dTOvkTrvE6CGY556iIU40hm7Hjr3+MgiKgj8hRpCJPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsJoOI3BwPuKgBvPJ2HQL0U6QJat7TZkJvi+T5dLyjqfcNQ23fvosxnUwwv1IbZ3eHMVTQ2pUFE37/Etn1MZt6yHb5aGKcryxZWGoHnoobkM+7vVpC4NPvAm5Y99aT3/BpEdePi3UaC7J/JqLp0xSv0sh7dZT/VCDcD8GsAJDeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRf3QpFS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kw7Y955y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HX1wm2419432
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1zdXv9NQmLrQmjmpGUVK8uh4
	ptN22Hc7QiFgP9f/iyM=; b=YRf3QpFSOsnm9mEqyEOC8pJ7obSk4AdFpK02BzTn
	wlvgOuOVoZe9HuC4U1gAd83JyVQMZGUN7Nv6OnOSUwJTnawJiWjTUAXHcVGG1rUi
	/mrXWi1cnHi3ovw8Ihonn9T/cVxQ7iHns92k4Qu3CmykZTPluJkXWny9vLLcmjyA
	8BGS2BqK7/cpxsGogJfp4XRktjDM3vsTbFBl5LAnMOSZHyqjQe/zaROVOkOQlCwo
	5sdgEbjvhFVuo4TiOlr4aXTSfNm6GY7EkAqT/o5+xXbVkSw6pGI+wfLMpBX97zCS
	6763F6V7xim+AwUH4umo4mALnxvWCDuiw7wIDQAtPl+AaQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjafv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:19:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so672682a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783649967; x=1784254767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zdXv9NQmLrQmjmpGUVK8uh4ptN22Hc7QiFgP9f/iyM=;
        b=Kw7Y955yHtvZHq32kOeLfIZC3drgvhR0/eb48pnGOOEhIBUTrhTZxGdG3Dg50yOqfn
         IqubefC+aaVmPbZuuiWdeFuP7ACTZJ6ZaCVr5Apuxl9+Hf2fDmg+zohElAUEmcwHr6HP
         21qL+C83OOcmr6aYltVsMFEofqK8+nMHSn7bUSnzPTDoCFfmzHWI9XHwo1sBzlvIFX8B
         Evx35qTlEV69MJI3sNuRayuVwTvE1sQymTLqQt75FKDs6POAxXISt3XGxnkXeeR7qBRx
         auFY7fBdS3dIHeY/1R4mv8Ndm/5iYYAgSZjxbpMEBYRZzX4mZvB+Cq4l83QWDqVpuAwM
         OqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783649967; x=1784254767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zdXv9NQmLrQmjmpGUVK8uh4ptN22Hc7QiFgP9f/iyM=;
        b=LCnPJFF+4vW0G0AC3KLidU0ZflKuOv4G1EKTMnuDcOzkL13NhL/sc7I71GXd9yONZg
         lr+m50vNX6THhqQxAEq510G0ihgZqsEpneJCbtHHEaBlmoRCgaiNunqt4Ubocta7aP7V
         Yj59N0RZlPs7Xian7UnjHDd5azGaN1m1vaFUK/o1Cj69kQvq/I0oTBy3fsQezh88ekv5
         OiDswTdR5+3qsvZnoCxhPVx5c/oj17+hO7ouefdQkh7m+WHXZSyeDDMOWF5VVltpnIKG
         vq/G55+Nh1ipOQcetxZvlOw1BnB8OjD1TPowBYFB2D4oyY+u8kIsyn806M/3FTlFwjTZ
         vHPg==
X-Forwarded-Encrypted: i=1; AHgh+RqkP/eQ0+Dn5s2Pfn0Nu81bh8UAqubw7rxKL9OkudERxI29VS5ykQFn54Do9HtWzWr2IkMJWzZO6W2ZU8et@vger.kernel.org
X-Gm-Message-State: AOJu0YzMSnUXjcc9Qvy1+cA3opoGHiuEgFuc2Hw2A+iO7IP59f56s6Gj
	0mp8YCYsKPrfLf7TYwQJ2L+hqN9vqo+xKp+c4TnM8QpPr6Sf+WGsMxEKXxUby4mBUUDM3lzEmLn
	CZWxP94mVV4G875EygRjC0QKFmExnmU13CsQiRMU6zksbU0tGYuxz50ia3B8a24yEcm9T
X-Gm-Gg: AfdE7clXQQYsBKlaPqaeFI19G7mW5awjetIGwSEEnpPo8rGyuuzY1jmqgLVffBz7uev
	FC1wbLX54HKoaYK7dayn3WHNM8DKVwEVwW2pO7789YwuITBJUrh3nU7Gik3kYs/Fdk89RV/ssA9
	/cjk7yHp2VJA+QXCOmzA2HXY46NyI4ze1WvMlv5jU85Oo1uycCepbSndlkFBf2rTIhRJyHp531T
	yNmqc14ryFBZTmlk+sv8GNHR5xZSa5D7QzUH5130DtHtofJKOAnHA4wTccIvHiyGORiKWs2P3Bl
	LQb1bB5IVRim4pvuAkEqpRNHKnlwVgHrv32SwCrb7TTK0cmfkXA0ELR+mN8qTTP14Xkc5+Ftg9/
	FycLLCeLb3MricVOedZbhBiTSXI58xgUv5ywMxSWYt7LwIVCUGzT4M4Q9ZQ==
X-Received: by 2002:a05:6a20:cfa8:b0:3bf:b931:b3f4 with SMTP id adf61e73a8af0-3c0bd1588e8mr10223130637.51.1783649967312;
        Thu, 09 Jul 2026 19:19:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa8:b0:3bf:b931:b3f4 with SMTP id adf61e73a8af0-3c0bd1588e8mr10223105637.51.1783649966771;
        Thu, 09 Jul 2026 19:19:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm13596455eec.22.2026.07.09.19.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:19:26 -0700 (PDT)
Date: Thu, 9 Jul 2026 19:19:24 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 9/9] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
Message-ID: <alBWrK8X7fW+UC7L@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
 <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
 <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAxOSBTYWx0ZWRfX180KNKrUxAUL
 HSiXOZe/HCKzeAnuz2Z01cYzjLw2AOgqk+D7D3N245yK/xQ+N5YrsijZA+bVtS57hVx2Gc5cbkN
 BKEopm6inf+pYM+h9JuSubFv8kdzLVsxalGiE9z+gogb7t/PH/zLGxXwdipZQCGMP1UwqF4Pmk6
 Noa0CyQmly4cMf7TDNrskeN2T1Hinvchxzw17iGijESfoAvacBECWSYnY/EVJb1uJF/U51JLtXJ
 0vte8Stzh25IfgM62RbqdZrgy774Su05mGXU8ZiESsqqUzzN9u1MIDE9EceaVJSxTf4rbmQXMi4
 tinP01hCXAIVNovgExqUb2yWq761WJwpb+i4FgL7HFp4utx8fB/L30mP9x6uyoTHd1QVLUvnoGe
 xUjuQws3dgICvEmnDsCmkvbdrULclVq/ARLr/ZRe+NLBvY+g4ZaN1LEo+0koqOuV6vRzrWp+vBT
 dxSSya7CjFZO4zqQnyQ==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a5056b0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rieQvRA5rQoxJvxsdQgA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: VL3Qt47bkDX3yjqfVG5FWfNStG8dvou1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAxOSBTYWx0ZWRfX4slU9mzg6Cod
 dvOjYjenJhBtWB1YpAts7t6wf3JWacztyUONgtbT71GjXic/dVUiogfpyAUaQuVaUK7E4S8Z6o5
 eeQmMG0J4KMt+AA9ffMC1LBoLujFuyo=
X-Proofpoint-ORIG-GUID: VL3Qt47bkDX3yjqfVG5FWfNStG8dvou1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100019
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118114-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5040B736A1C

On Mon, Jun 29, 2026 at 11:20:07AM +0200, Konrad Dybcio wrote:
> On 6/29/26 7:05 AM, Qiang Yu wrote:
> > On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
> >> On 5/19/26 7:47 AM, Qiang Yu wrote:
> >>> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
> >>> PCIe3b as consumers of that shared PHY provider instead of separate PHY
> >>> nodes.
> >>>
> >>> Update the DTS wiring to:
> >>> - point GCC PCIe3A/3B pipe parents to the shared PHY clock outputs
> >>> - add PCIe3a controller node and route PCIe3a/PCIe3b port phys to
> >>>   &pcie3_phy using two-cell PHY arguments
> >>> - configure the shared PHY node with link-mode and dual pipe outputs
> >>>
> >>> Use QMP_PCIE_GLYMUR_MODE_* dt-binding macros for mode selection.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +		pcie3a: pci@1c10000 {
> >>> +			device_type = "pci";
> >>> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> >>> +			reg = <0x0 0x01c10000 0x0 0x3000>,
> >>> +			      <0x0 0x70000000 0x0 0xf20>,
> >>> +			      <0x0 0x70000f40 0x0 0xa8>,
> >>> +			      <0x0 0x70001000 0x0 0x4000>,
> >>> +			      <0x0 0x70100000 0x0 0x100000>,
> >>> +			      <0x0 0x01c13000 0x0 0x1000>;
> >>> +			reg-names = "parf",
> >>> +				    "dbi",
> >>> +				    "elbi",
> >>> +				    "atu",
> >>> +				    "config",
> >>> +				    "mhi";
> >>> +			#address-cells = <3>;
> >>> +			#size-cells = <2>;
> >>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> >>> +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
> >>> +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
> >>> +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
> >>> +
> >>> +			bus-range = <0 0xff>;
> >>> +
> >>> +			dma-coherent;
> >>> +
> >>> +			linux,pci-domain = <3>;
> >>> +			num-lanes = <8>;
> >>
> >> Is it fine to keep num-lanes 8 here even for configurations with
> >> bifurcated PHY?
> >>
> >> I would assume so, given essentially this is a x8 host, whose 4
> >> lanes may simply be effectively NC 
> >>
> > Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
> > never enabled at the same time. When PCIe3a is exposed, it is always in an
> > x8 slot. But if we have a x4+x4 platform in future, we can simply override
> > num-lanes to 4 in the board.dts.
> 
> My question is whether that will be necessary - if yes, sure, we
> can do it, but if not, we can conclude on this early and not have
> to fight over it in a couple months
>
I think we do need to override it in that case. If both PCIe3a and PCIe3b
are enabled in x4+x4 mode but PCIe3a keeps num-lanes = <8>, userspace
will see an 8-lane slot. If an x8-capable EP is connected to that slot,
both ends will advertise x8 support, but the link is up at x4. That looks
like a genuine bug from the user's point of view.

- Qiang Yu

