Return-Path: <linux-arm-msm+bounces-112832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V9xKElNVK2pj7AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:39:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0089B675F7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:39:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DCESS5gI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DFxsqMP0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112832-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112832-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34B7830E2D4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5472D2394;
	Fri, 12 Jun 2026 00:39:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C4529B79B
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:39:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781224782; cv=none; b=VzBjlfGzGOmR/GGDPOtBMaXMKnXBkqlII01GTCzoOeHUN/uQKV4UCVnsC/QuxL60zVNXAt2YCKoOSFZsKJL8X38yMx/7rR4gzruKp4p2yjDPI73Ouoc13YSmLJEuonwXPQHp6sNtdCZOUq3dM5LNZyhXsYG0ngfpBlg16YAst20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781224782; c=relaxed/simple;
	bh=qN3s0xS6mEz5jVfdgX+2b/WgZ8Le4zRpIz5yLmm5qic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCjvk6YQq1LNwB9aJil3wahW//J5mK0f9NlIe+g7PweiFdvdp1pUom8uor/K5o/M8Pq460sHa5uPEMl1AlbkGD/NJRo19tPRRO3sffqDXbYQ3aEFPPkdJJ2htK27v5rZCUg/E10GPgpdp/wB/gusW3BtZQI4oVLpEWN3r+gjs9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCESS5gI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFxsqMP0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMVxal1921870
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5qQ8e+6QnBVjDDTImvqK60bW
	t8XMxUyo3/iEy7fPpGU=; b=DCESS5gIwMluiS8dJ2s5VqpNPtF6XHo/KaprE3hg
	79dqmF4Dk0roT2GdajIsDO91xkDoNLwaSg6ZxveHaKF3utWFQUYZMC99YjefrQX2
	zoKpCLsrzHTaCp4DqbWK7HbLhSbc9sajANAT2xd/hCFQGIG2p02+Dhw6LDoqke4a
	Fb28BLULMWmnaAfq0zxfF5xSC9uNF4AaGucKzeOj8NTQLScDDK6yasrvHdMJJqSp
	UZiwV9vl6vIcpRKUpvWoZbWShZ/9P4Lv92RwahBGlXYP8D84MU5SVJi4v9vtL6lX
	MJu14nBZWgx8aF7QzeCdFH93cs9iNJ2A3IpHzlnMoIa8YA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbhjnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:39:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-307fd7138b1so779691eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781224779; x=1781829579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qQ8e+6QnBVjDDTImvqK60bWt8XMxUyo3/iEy7fPpGU=;
        b=DFxsqMP0rQLIud3HST7+xhirSLEqPOjXTIf8lmdR1uY7XSzTjGwFpdS5b1jDUj5U3g
         LJMUYirQwt7BDy/s0Esu8OVme8uVjcqeobhbkzbsyDqu9NWx0aJYZLb3QMxhqL4OrIW4
         xEMDuWCnpav8Hc7XbyvqZmro4NeOT46l9eU6MoBDpj2DrAMxixZAWLbeVOMgL47ZrejO
         TEj9F9wuokrv6F9R69Zvxt7SQJkb14EDhiH5FYoT9vG+YWH7T1OszqoWcim8+S0bYojb
         14AWWe1SqW/GFD9i2a3wPyy1xyNLxi4Bp0tZJ0GH2EtyrQfM1I+m1+0INqF3Ve8VRpVY
         Za7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781224779; x=1781829579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qQ8e+6QnBVjDDTImvqK60bWt8XMxUyo3/iEy7fPpGU=;
        b=LZZenPWmYj1//PU0VKZNA1mG5nVANs204Cw4wRDvlEwA74qkEOjMRD+G75KsIoZbDZ
         wuJGY4EvAYxcH4CKYPNh/K4skMfzVLUaFU3Rf83RzsVdJ/VpC3bXYESXYcTrr29DTEAl
         bMug0sl+6T0+nLADQkoyeWwhuY8m6856XGPNxgtcVfuNxaMCyvRSR+Q7w8HL7Pj7aRdF
         L0s6jk3IAIqNWZezjmsVdbxLxrl43G8h/E+/RVKvk+tFos3zrqYbU1L2ThQLNRdmvCp3
         eR9YS0f9SIl+Uqu9pekwwMmOp0bpemvUHqRH6YYxvjuorleO009X/vdrhaovq+0tlnXH
         EBbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xhtBLgft+8A3ZTlla0Dg8eMN8ja54kwSYzgIjD41ako2BIgtlUqGQsB8BGaXs3eYDlchQkxhxAq91481c@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk3HziDhMdboOAadGQ9q5Ugaui6yU6RvvT4eg5mBhKia/yrhhc
	pV/srdoaY2WfEguPFLbktEFgphcPzMRETiUEHZgieJi9xYWA8esEXHD2Z5DkY7gZlcM5kqMqnRB
	7wZe6XqZ5/WSJjaC3jqtdEZ9njuSQanlBC0RKL+zD7HHybZc2NumoTNqGPNw0jT8Wo4gctBkz0e
	fh
X-Gm-Gg: Acq92OH8NtKENIvgUwlPo3Gny8QXS/t7rFDLOp/oh7aXYxTJQUV9y/R0M39fwe5oJbM
	yCdKLTuJsF8Yi+1FlZWxoCZfh3cLXut5kuF+HtkVY5+EK5aKlmG26NGI5VTrxM10fj38suUtg+4
	l6jnJk0bhrm1FSMwmhC7RB/ZdUTNEEP54ip9ppNnRGG0Bjgsi6aSK89HVGoFv98unwMABWV4AVh
	7lZokPyfMTm2TCV81C5A6QoM+LOANdTHsloYpa4uidmGThrYRuV/ODseb5nWyQX4ZICEm0q54qG
	Ghv5+6+eNu9GjxKu0pkfYJ7qIVJuxMJ8P4RHtd+c8IInqvL8XO5N3NTnl18bv+mqS5PN/dw9jWe
	CXARCB04WXnEqPCsbwUCjfP9rHFaRGYktCweg1RLkzJRdOVSzNRUOG3K/jOGfSxhX5TSW7tvBwW
	Jl4A==
X-Received: by 2002:a05:7300:5b83:b0:305:179:4dde with SMTP id 5a478bee46e88-308201e35c2mr451395eec.35.1781224778920;
        Thu, 11 Jun 2026 17:39:38 -0700 (PDT)
X-Received: by 2002:a05:7300:5b83:b0:305:179:4dde with SMTP id 5a478bee46e88-308201e35c2mr451363eec.35.1781224778353;
        Thu, 11 Jun 2026 17:39:38 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm987482eec.30.2026.06.11.17.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:39:37 -0700 (PDT)
Date: Thu, 11 Jun 2026 17:39:34 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/10] phy: qcom: qmp-pcie: Add PCIe PHY support for
 Hawi
Message-ID: <aitVRtzigfZg6Me8@hu-mattleun-lv.qualcomm.com>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
 <egojnbup5igcre6ccegojsdrvtokwfoccqhwmfxkoy5ukvuxvj@ailtbrgrgocs>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <egojnbup5igcre6ccegojsdrvtokwfoccqhwmfxkoy5ukvuxvj@ailtbrgrgocs>
X-Proofpoint-GUID: Q3f6p8NWmIado2jBlIHk20G8_mD1Kv3m
X-Proofpoint-ORIG-GUID: Q3f6p8NWmIado2jBlIHk20G8_mD1Kv3m
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwMyBTYWx0ZWRfXyOkuADg5uceS
 kNTfxJ2z/kRNC6DxPKHOFqHtciTvs3x6cU7E8D5Ig7MQIn/FqAllEzGNld51hbGMxOBCRYTjDh8
 pYdts4sKE16880etjSCoyWPii3Dv6mE=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2b554b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=JfrnYn6hAAAA:8
 a=KKAkSRfTAAAA:8 a=ph3dTG6zQT6veRjdJtQA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwMyBTYWx0ZWRfX7+CO0vNPRUrn
 frGKWPPEfqJE7FEXXSLGatP0zdZzi7xLUhDHhAm7EuLwnCOB4UwkldR1OjJS7EWgrYHISdwhT8t
 O18BUIC/vgQ1YZVNbgyRYSvKQKgBIQaVmi7PyMIby2QEQ+HVBq6oI9m0taayadnhOMWtL2ywMPe
 0bsolAMfdA6RHsDqQl+i2qh1rj2TBfSJDEiYwqGYiwly87kqDUW8iWslJcMSd2qv1Q3LnVJcsAM
 YiIhUEdTrc64wlDU4pCvAaiy3T/mRvwKm/pT0TvSigeo9PNI1dLnGkvmOX2DnuOAtOjf1qxFvln
 6mkHCI4uvR2JgjZvyFEuF/1Ez730VSkHvar06k3uwzJFy2QlgNhgX5sjqNwuGwjCs99wW6AI2L9
 gH5DMi49cTfMakqMZ8BPhrIUtFV+a8v8aPbCGyAnk+YXr8uy+aZetBPO+AfhKRQuHlt73gHoesO
 WfyaVVjLKLy5zI08wjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120003
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112832-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0089B675F7A

On Mon, Jun 08, 2026 at 12:25:03AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 01:32:54AM +0000, Matthew Leung wrote:
> > This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
> > platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.
> > 
> > The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
> > v10.60 register definitions.
> > 
> > The series adds:
> > - device tree bindings (patch 1)
> > - v10 register offset headers (patches 2-5)
> > - v10.60 register offset headers (patches 6-9)
> > - driver support with PHY initialization tables for both configurations
> >   (patch 10)
> > 
> > Overlap:
> > The series has overlap with "phy: qcom: Introduce USB support for Hawi"
> > by Ronak Raheja (see link [1]). Both patch series introduce a subset of
> > v10 registers (this series for PCIe and Ronak's for USB). I have
> > coordinated with Ronak regarding the overlap, and we can update the
> > series to resolve any overlap based on the order of merging.
> > 
> > Link: https://lore.kernel.org/all/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/ [1]
> > 
> > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Rebased onto v7.1-rc6
> > - Patch 1: no change (Reviewed-by carried forward)
> > - Patch 9: rename QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG to
> >   QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG to be consistent with the
> >   naming convention used in previous pcs-pcie headers
> > - Patch 10: update usage of renamed macro
> > - Link to v1: https://patch.msgid.link/20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com
> > 
> > To: Vinod Koul <vkoul@kernel.org>
> > To: Neil Armstrong <neil.armstrong@linaro.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: linux-phy@lists.infradead.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > 
> > ---
> > Matthew Leung (10):
> >       dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
> >       phy: qcom-qmp: qserdes-com: Add v10 register offsets
> >       phy: qcom-qmp: qserdes-txrx: Add v10 register offsets
> >       phy: qcom-qmp: pcs: Add v10 register offsets
> >       phy: qcom-qmp: pcs-pcie: Add v10 register offsets
> 
> Squash these 4 patches.
> 
> >       phy: qcom-qmp: qserdes-com: Add v10.60 register offsets
> >       phy: qcom-qmp: qserdes-txrx: Add v10.60 register offsets
> >       phy: qcom-qmp: pcs: Add v10.60 register offsets
> >       phy: qcom-qmp: pcs-pcie: Add v10.60 register offsets
> 
> And these 4

Will do.

> 
> >       phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi
> > 
> >  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 382 +++++++++++++++++++++
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   |  18 +
> >  .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 ++
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        |  22 ++
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 ++
> >  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    |  49 +++
> >  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++
> >  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   |  47 +++
> >  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 ++++++
> >  drivers/phy/qualcomm/phy-qcom-qmp.h                |  10 +
> >  11 files changed, 747 insertions(+)
> > ---
> > base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> > change-id: 20260506-hawi-phy-pcie-283933b4113e
> > 
> > Best regards,
> > --  
> > Matthew Leung <matthew.leung@oss.qualcomm.com>
> > 
> > 
> > -- 
> > linux-phy mailing list
> > linux-phy@lists.infradead.org
> > https://lists.infradead.org/mailman/listinfo/linux-phy
> 
> -- 
> With best wishes
> Dmitry

