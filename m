Return-Path: <linux-arm-msm+bounces-118291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RCAdOkjwUGoq8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:14:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 368DB73B22E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:14:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FpgQS0iW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GuohloA5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118291-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118291-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 060DB30131E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993A236CDFD;
	Fri, 10 Jul 2026 13:12:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D7282F06
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:12:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689123; cv=none; b=dVGGl77UOeh7G43y/tm1GefExFawWCkZHj/6/gV/1/yyD9q8MaUFz4CbGF3ZbRW57y36MV29OhsLmbGCUTTqVwAlo374DykV37Rjd9o0Mh4hykjrxwe4lxzWJYDRousA9C4Sl/u07Pgr9qEnXnKSYbSsINhJaZV0q7/51qYdMnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689123; c=relaxed/simple;
	bh=aC4FPxDxzHdrM/prXjD+lyehQL9rsY0iUchgNtG/mfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bC76cwFV2stXd+cBsNG5b4X7oTQs6gi0l/Fbq4GzV52k5N9jrWj0bMkRgXczdq3m5QhyBiHxo+QoAWxcDWTDZEDZyy+k6uigDtEmASXsyU94ObraKjNsdsQFYBJZ5SjuZ5DC9Tggb9vqc9jXPq+B5dypLVfZmpmobIDhOKZi2JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpgQS0iW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuohloA5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6PfW873796
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=esnNNQyitugAKMlaLQidbpw6
	dVtFnR41VBfwzjsJV1U=; b=FpgQS0iWrTSwPiSi8AIob1Ty9Opqu0sY70YTU/KO
	xROVHmnMAd7DcYpaAoRP6MC5VLspCJo2+LMKHqR4X26xGjFOD+0/JqZdyNV905eo
	Ly9ujki0eB6ut62d/1zavw8jpQT1ZNKQ4QSGTHN192acJKqH+t+EK1M3w6NCxZZP
	ofagao00Lvu9XrLc7WT477uo/TLUOWWluR5QCJfgcNP7+cdEhl4NtBO1cERL/Mqh
	fpHjUBn6KNud4My4O7N6mW1R/79BjTPl6AhSc6cp5dppT+/sXa9vN1BGPvFaxAMw
	5M2Yp9YLcVFQzWF4U+e6N/4xBRce4myc9/zYO9/uBVMFPg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8ru8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:12:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso961797a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783689120; x=1784293920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=esnNNQyitugAKMlaLQidbpw6dVtFnR41VBfwzjsJV1U=;
        b=GuohloA5haMTdnh2w+CZsymv1RYzB3bz8j6gYvb4uwKtE1nP+WltVgFgCk+TtM0z7y
         0MHOkxc3MPpJq9DixelUaUp11XHA42jWIXrldACVH1KgkWWIOywW0RT4L8tTtfgFAS/Y
         D8yUESs7LtJSqsi0IFT1ifyL/mqZqjg6qVDIES305vEuZg6PVTkKvPyK4PacWm+X+0Rp
         PWbMiCJ2hVZIKB7HMQzeFawZQOzrD+9yz6igAFUcDEA+sUrCUWwUqisNSvf7iUC7WVZz
         gOyMdeYywA0oRhblPfzLyKB6/WWDZAlj5XN25LN4r0f3aRrnKK5N88JQqItl56XXqtvo
         XcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783689120; x=1784293920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esnNNQyitugAKMlaLQidbpw6dVtFnR41VBfwzjsJV1U=;
        b=icr1tfNtzuvirhEYoSvRLiv7n8vR43c9XvBZCiUEtuIt4+hn5537u4N4GIOl/QcAtV
         nDHpOrg4JLM8xu4JvjTJYP5iQxEFh2tN67pNFNDmcJtt9EkjWP/4DIBqqgF99NPldMTj
         YWpqH5c2POUUTQjLP/kYQziWHdrJQoyko+8vTT1mMTat9eXkFOBAGtOeMmbeaK/Eo4h0
         nCtR4OErqhknfzoYSYrXRWsmp9tZ57zFZYdi4nhHRivf4Y4SBeU5PdOa+eabzyLKp14B
         97lYNrzEbdZGQ5fDMK6BrFLesG0oZLOol3bBoFgfF4hk88ayQuV9bE0pzyvOwzT0/E/l
         cSnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCWytHV00s2m3hZYd3A++oAaC3/4XDKr+6n7/5KCFCDZE2qPqOb2gMCKAW/vwx7B0olSHErVpEzItNzS6s@vger.kernel.org
X-Gm-Message-State: AOJu0YxvspAWeXna5DDSIkQ8C42TGo39ZHn9I4qu+LRTnkm6QgWSdsAC
	7zk588T1eqTTCG3t5r6G35bH/G/JMljHlUUDUXrZzjToIXDOsVmtLOdGIzIEdzFsVR2ijtjU1iM
	eRDcSP2xoCbTzuu7zGOEsLEO/vQcPzfpqlEuAMTQ6Je2crjaK9ke8HGFm7jesx23UCnA4
X-Gm-Gg: AfdE7cmB+Tc2B8O77xzM6P/Rd5BjZePST9jb+BQVtfxvOfh85dlC1UlzzbE0a+NUpCe
	lSXDnP7axEKeWOTiV4OlokbLBwvPacE4tPxHa2QdA9Tckp5+Qo0iKsJxhvF/FAnnnI7GQ+XK7bP
	s3xvfEg9RkRTwX4WZTwwhOI3BbzA4fvI8JMfBGUC7duLPIsd8CHMn+inz+2AVc3lBgdQJZ01NBf
	ICLs8cLG23MxEXDvSzMEnPIYi2/BgPx2kOj3vLQfrZoJY5wZAoqOCMn4iXdpqJLc7PjjeFuDAIV
	zGEnlg1P9EYG0/8g8MDtEsP+DeHITJDQukdjOUKp/FmikilwvkAOwyk9iXoP1OjrTy4I/Q1XoMI
	S7NqjSrXSafH9iANLf2UjhtSCSPRlZ56b8az9jKY0KDRaVSn3jXyMTpIoAQ==
X-Received: by 2002:a05:6a21:1bc3:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c0bcb7f146mr12783137637.42.1783689120027;
        Fri, 10 Jul 2026 06:12:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:1bc3:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c0bcb7f146mr12783097637.42.1783689119556;
        Fri, 10 Jul 2026 06:11:59 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c76dsm41245733c88.3.2026.07.10.06.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:11:59 -0700 (PDT)
Date: Fri, 10 Jul 2026 06:11:57 -0700
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
Message-ID: <alDvnSiplhEg2yhD@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
 <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
 <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
 <alBWrK8X7fW+UC7L@hu-qianyu-lv.qualcomm.com>
 <6802dc29-d783-40df-bbb8-8b2dbd94be29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6802dc29-d783-40df-bbb8-8b2dbd94be29@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50efa1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lFNHJFWHrmfUljyRrh4A:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: XEKdmDiXzwZjhDcEmGW6X9-o7xtTEUk1
X-Proofpoint-GUID: XEKdmDiXzwZjhDcEmGW6X9-o7xtTEUk1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX5GfEUR6320Y0
 10mfTPe8B5JO79EaLW2j9S9hhC438dv4IEc7iLPmuu8BHrJoIEnxbrI61L3nhs1cwrH0WTrgm06
 mbR7g1rrnld1kZ7ZoPjjYobI6cwNZb8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX/cujEi2Si1lF
 mK7fTA3b7gB1AYEP3Sv/EvFfeURkaU2Ya+YKVrOrF9lm5WTR/8j3M2VG1fV1ryFDvPhtTTjzwDs
 ZjkCtjxIhXIQhtTkXquLJKR4UkHJcM+mWkLYju1ICCTtVz06d7wnW1IEF4K5afVTRATEoxB1Wqs
 l/7Z4wfjrLhUr1oYiWH8rKiq5N52zsazbaAIoC4Gt061SgpRPBI6TmS66h+0edS+xZMN563xpdh
 ZAB+5V5936Lxd40tiaNziqldLcsp3oxzWFowSrfOKQokp95PtKv7cRxY9z2vwRWeWIhLP373yDf
 iBZiTmVAErp5pmGxwKG8zhXwAGrE+PSC0Xu8IKxPZww1x1fWMO0esCwMqSyy8oZDYRHJQWkgeQR
 NYLFAuMv9OBfOulYH4CNeJl2gver2ZcFOwsK9jUCxM69CuxSvl+PnofijyC+qF0YWjY4TugyQbL
 a+L592Cl9r5mO5uwJ8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118291-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,hu-qianyu-lv.qualcomm.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 368DB73B22E

On Fri, Jul 10, 2026 at 10:44:20AM +0200, Konrad Dybcio wrote:
> On 7/10/26 4:19 AM, Qiang Yu wrote:
> > On Mon, Jun 29, 2026 at 11:20:07AM +0200, Konrad Dybcio wrote:
> >> On 6/29/26 7:05 AM, Qiang Yu wrote:
> >>> On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
> >>>> On 5/19/26 7:47 AM, Qiang Yu wrote:
> >>>>> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
> >>>>> PCIe3b as consumers of that shared PHY provider instead of separate PHY
> >>>>> nodes.
> >>>>>
> >>>>> Update the DTS wiring to:
> >>>>> - point GCC PCIe3A/3B pipe parents to the shared PHY clock outputs
> >>>>> - add PCIe3a controller node and route PCIe3a/PCIe3b port phys to
> >>>>>   &pcie3_phy using two-cell PHY arguments
> >>>>> - configure the shared PHY node with link-mode and dual pipe outputs
> >>>>>
> >>>>> Use QMP_PCIE_GLYMUR_MODE_* dt-binding macros for mode selection.
> >>>>>
> >>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +		pcie3a: pci@1c10000 {
> >>>>> +			device_type = "pci";
> >>>>> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> >>>>> +			reg = <0x0 0x01c10000 0x0 0x3000>,
> >>>>> +			      <0x0 0x70000000 0x0 0xf20>,
> >>>>> +			      <0x0 0x70000f40 0x0 0xa8>,
> >>>>> +			      <0x0 0x70001000 0x0 0x4000>,
> >>>>> +			      <0x0 0x70100000 0x0 0x100000>,
> >>>>> +			      <0x0 0x01c13000 0x0 0x1000>;
> >>>>> +			reg-names = "parf",
> >>>>> +				    "dbi",
> >>>>> +				    "elbi",
> >>>>> +				    "atu",
> >>>>> +				    "config",
> >>>>> +				    "mhi";
> >>>>> +			#address-cells = <3>;
> >>>>> +			#size-cells = <2>;
> >>>>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> >>>>> +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
> >>>>> +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
> >>>>> +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
> >>>>> +
> >>>>> +			bus-range = <0 0xff>;
> >>>>> +
> >>>>> +			dma-coherent;
> >>>>> +
> >>>>> +			linux,pci-domain = <3>;
> >>>>> +			num-lanes = <8>;
> >>>>
> >>>> Is it fine to keep num-lanes 8 here even for configurations with
> >>>> bifurcated PHY?
> >>>>
> >>>> I would assume so, given essentially this is a x8 host, whose 4
> >>>> lanes may simply be effectively NC 
> >>>>
> >>> Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
> >>> never enabled at the same time. When PCIe3a is exposed, it is always in an
> >>> x8 slot. But if we have a x4+x4 platform in future, we can simply override
> >>> num-lanes to 4 in the board.dts.
> >>
> >> My question is whether that will be necessary - if yes, sure, we
> >> can do it, but if not, we can conclude on this early and not have
> >> to fight over it in a couple months
> >>
> > I think we do need to override it in that case. If both PCIe3a and PCIe3b
> > are enabled in x4+x4 mode but PCIe3a keeps num-lanes = <8>, userspace
> > will see an 8-lane slot. If an x8-capable EP is connected to that slot,
> > both ends will advertise x8 support, but the link is up at x4. That looks
> > like a genuine bug from the user's point of view.
> 
> Do we know what's advertised on x86 PCs with bifurcated lanes?
>
On QCB, it advertise x8. On CRD, PCIe3a is hidden.

- Qiang Yu

