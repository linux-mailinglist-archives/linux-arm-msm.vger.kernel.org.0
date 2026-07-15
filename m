Return-Path: <linux-arm-msm+bounces-119137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HwzAGp8AV2rHEAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 05:38:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC29175A546
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 05:38:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cS85yIjy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XLMUqEQj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119137-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119137-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A61F23013B6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 03:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3233B3BE6;
	Wed, 15 Jul 2026 03:38:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD4D3B3886
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:37:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784086681; cv=none; b=UxrvwkUMFcgNC2bpuub1plXubTnX2MFj2QO82BtCLzHIy11R2Baf6tPV3SDRK3HrgFXuqaVCNavC3lRC9pncvBSzKgUadd/PV1c2W7iQu6DrspwEqqiCASJma1CKI3HWgfwxK0HTjvGWIgQeGV6Bx1V3up2adjYuUoAtrJ1eqyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784086681; c=relaxed/simple;
	bh=oyFkWMNa9fRt7sFWFB01ejvmlxQL3Rm6WRjhlInZEk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Im2GSsapmsaFo56rNOiF4J0o86Zm282VpJnglpEKM8A4pPx0r6s+h00zmqIuYi6BnKDC2zTTkOtJ6r0jMdgAfBsLSmyoLfIFlyJQwIsECe3JN/hHsGdGog7AY9XWnJqdErdN/3WEv8MJOdxX6w/XxDFYPzAS0m6xXGsbbdDUTjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cS85yIjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLMUqEQj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IWZt1953695
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7e9IbSuaSjhO5SzNL0GuiEie
	GTLyIZc7yOYtJCBxBik=; b=cS85yIjyVOXE4H8ASxvmvqe8Xyd934MpiEl4tqFw
	qasjj9YLFaF9bGV+QO8BOOu0DUtBanN/pRvWRj4ycXEizGSD5To4DV2n3s0OoSYj
	lMpo9dFlp3wRVUo+oKeL7LFKHpYanJNpJ17PaofJO+9LZ76lelElo0poTWMHZfBb
	jHvgXXm1w+KELX+wv0VPFlcvpal2N7WO47dSntGSmt6zH1Ycs7Bj/r0y7N/iOLBO
	leDl5LMjTvOGrfXJtQ8LbKABcreP+AVCLjrfH4zFOoHszzJB/SeNcfQe+XMALvug
	aa5xuG/rErcXEgZE8YvqB0MQeKNW8C2H+ZxogUQOCwSv9g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0juya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:37:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cceabd70f5so37993745ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 20:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784086673; x=1784691473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7e9IbSuaSjhO5SzNL0GuiEieGTLyIZc7yOYtJCBxBik=;
        b=XLMUqEQjTRFieV/WsbxC5KiDImZDklqKeOIL308oUetVT0ABf8cKw8N3VpyFNflHUs
         qRiCeaNpB6gMAhwB1GI8l4IdNEjjKiiPHed4kaDXToiY4e2Tj5f4nVpVIt+i8StBjkfQ
         osm/vmB9mhnGFvVhHhwNC5cpdGVeYeoXOC0CgMVIENBjglCH67L7kQ9+k39h9nLyV7G4
         M0nrR0TPlrXFmkiDHolSAXV5OJ/1GJieMrH+HozsDKUOQofPdUqrR6orL1JSpaQTjg+Y
         XMj2TXzpbMFPtJxnUMfWIpIyArYmkzgplxe5WzaRxlznc2Ocba1uYLgn3WGGbi3FV3Jl
         Nkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784086673; x=1784691473;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e9IbSuaSjhO5SzNL0GuiEieGTLyIZc7yOYtJCBxBik=;
        b=lewRR24LlZEr3XSaKeiieVzFdkxbAJRTQsZXSFqLnM2wQaDNd6NsZY8B6k9G5lKxjl
         xtocMmTyCkO4PvpumFfgEHkv0Ygw/qv4OkK0AWuURMffecj+XzhdfEONZOgiZ8ah8Mtu
         AMf+f53qYEKSiLP6SXWJ01xPBKFqyypMSOzrUh27sg6fjBGkiYZmOQssOGs7hJHKgmsV
         4jWvQSirauv7qX1w/wj0qmf4FUCoxgKXQyKgG9iCentz1Nmbi+fSRFUAX4+oWwPzPIAt
         053vk27rKpAGtlhrL1rhMPi+uTmR4t3YYuDpCrJCYNondbNd8rUOdIXb0r8rT/PMbi91
         fjxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGQijNNjHP0+5+gu0mzoVj7ynj5SN2afeFM1qgSWsYHK0y52UFSkGNiSdJeGsmr9WgwOswjo0VpixzEi/X@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvx2U5q0mVkgAGhgP3vc727sXrPEN0S10gs7jAON2xysuKRiSH
	4NIXqv+2aa3TtI3IsYq/HtJgefKtrRYzZo+URRdfRoQ9zW3u6xbYxUsev+8jGfbZaeaKJvp7qkO
	TJRIEqaXYJpiMb+ffkp9LAnfVA/Vmqf6kx4fSuBpFm2MBVaYimc8qyEM6pZlYMe3uZbPo
X-Gm-Gg: AfdE7clfm3Hd/BOruG9pJab1IDaxA1RTmA/QV0+y6YKJzUJMOL0pdjb1I6BO+Run4RW
	oeEqDJ2HDOOWZ8p8zsidW+o6ZfNfAvWqpIl+zQN9KBiubga5jWkbfy0kdFGLBw+opV6kAMVRRcQ
	6OZPkSwgNY+WjPqfwe8yBCY7aiTcz55/zi6aVAh0SbrZ/N/iQoThJ8tn5thb07oG7GRuCJw/Hac
	lyIJ9Fd8w67bBw6vlWU2ndM8M5U+fURW6CI0SH25l/KnPKqwDX/13hWtrkGZOOY1n7xkq2v0Pzx
	Z1NQHjiqJpY48iOFEVCJxCWjJsOMpBZfjdq2AYdx2WpK/7dHfWKX2qx0lH/Xmplf3Ih+ZR0yucQ
	3pMuJvscEeB85OLScw/emKA92RTgrlcOKqlK13+SUEAYSHyOzrPqCekHiza1n
X-Received: by 2002:a17:90b:390f:b0:381:939e:adf0 with SMTP id 98e67ed59e1d1-38dc7752a8dmr13926710a91.31.1784086673448;
        Tue, 14 Jul 2026 20:37:53 -0700 (PDT)
X-Received: by 2002:a17:90b:390f:b0:381:939e:adf0 with SMTP id 98e67ed59e1d1-38dc7752a8dmr13926691a91.31.1784086673026;
        Tue, 14 Jul 2026 20:37:53 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm53899311eec.28.2026.07.14.20.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 20:37:52 -0700 (PDT)
Date: Tue, 14 Jul 2026 20:37:50 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <alcAjvLJCz9D9X3p@hu-petche-lv.qualcomm.com>
References: <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
 <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
 <albAccNnsI12AIUo@vbox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <albAccNnsI12AIUo@vbox>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAzMCBTYWx0ZWRfXzYcQ23kcVqXW
 VxRpJm+6rneq7HInkK5rUkt0CSX5cDict2A8mrh/ZeXdQYfqpl0sYi/YLJpKKfgtPWtjGEzkACJ
 nnkJhgoPc8WCSTtrVnuWwXhLP8iwcbo=
X-Proofpoint-GUID: Sv36Mmqs-qrjyMZJ_LT5zhQykaxzkLL6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAzMCBTYWx0ZWRfXyN6fPlVN5m0h
 0ZY+psOiUZ08UrdLHwYOhAJ+Q+sFjwmirTCpQtfh9B41bV1MJNqLUOy/5GBQV7gnrICMAo5UlXb
 tMr4t9jwO55+Gl64cQ+4xPGYZJHKQq7SXz4GPkIf4SLqQUnR3egoGooaGe+LjbSZh4wcC+Fz03r
 YweT5apvyTNN8eYXd17l9/vgUhYkyK4pkCoMcyE/OT3leuYzaNUTw064IgtLkM0hO5PcKXQR+Nt
 7wZ8nYf4g8e1dm8EBZs3XhGk2XQLRTKqIiSJVBbGOyLPDZuwHE/2mZiIkh/nZEhLnvZ2bCWjYRP
 QIMliuQY99fNrbV+H6ld8nHMPt2kkqMdLCX82ZJ1+8AE+5DKef9eabuiSKUXF9s28tWNWQEYSrw
 teKvgvmRtebCuVS62IbZXdagBo9fq5ugTshvUCw+32e/U6QdmsmbRfMNAQ/tk/UO4ncpL/f6RP4
 TjdQpNTCMdpxhIN1O1w==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a570092 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1QtRUzTFQfe48BcbiroA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Sv36Mmqs-qrjyMZJ_LT5zhQykaxzkLL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150030
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119137-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:Thinh.Nguyen@synopsys.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[peter.chen@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC29175A546

On 26-07-14 23:23:01, Thinh Nguyen wrote:
> On Mon, Jul 13, 2026, Peter Chen wrote:
> > 
> > Yes, eUSB2 is based on UTMI Parallel mode, but it has dedicated
> > Physical Layer Supplement [1], eg at CH2.4, it lists eUSB2 PHY
> > Features.
> > 
> > 
> > > To go this route properly, we'd need to introduce a new phy type
> > > attribute in the phy framework, which will be a bigger change that may
> > > impact more than this driver.
> > > 
> > 
> > It is not at generic PHY framework, it is just for USB PHY dedicated.
> > 
> > I do not see big changes, it only needs to change above files and related
> > dt-binding files, and other users may leverage it if the controller
> > has special sequence or settings for eUSB2.
> > 
> 
> The usbphy_modes describes the interface between the controller and the
> phy. eusb2 still uses utmi, so adding eusb2 there is sematically
> incorrect. If we introduce the eusb2 mode there, we'd have to audit dwc3
> and every other driver that uses usbphy_modes to handle the new mode
> correctly.
> 
> That said, I have no objection to adding a new phy type for eusb2. I
> just want to note it is a bigger change relative to adding a boolean
> property to the DT binding.
> 

Hi Thinh,

Only the new user for adding phy_type="eusb2" at dts needs to check the
controller logic, and this is what the user needs to do that check the
new added device tree property logic at the driver.

So, it will not affect current user for phy_type, and I checked the dwc3
core, it does not need to change code for new phy type.

Currently, it is only benefit for qcom platform, but eusb2 (uesb2v2 later)
is the common USB2 mode, other users may leverage for this new phy type.

Krzysztof and Dmitry, do you agree we use existed device tree property
for this feature? 

-- 

Thanks,
Peter Chen

