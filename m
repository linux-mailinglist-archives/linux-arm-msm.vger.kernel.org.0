Return-Path: <linux-arm-msm+bounces-118969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qll3K47hVWrbugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:13:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24639751C16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:13:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="aKLwt/Yd";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Y1mmc/+F";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118969-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118969-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C395305D5E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B033EEACF;
	Tue, 14 Jul 2026 07:12:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E143ED5B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:12:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013134; cv=none; b=TkrZoXxWh0A10xm04phs8CmP7dfY8hAo1t1JrU5BlBo6vtn0aZ7mjkIxiIY035Ac8MS/bt5s8CYUAt2oxDd3uCXadsCXVrF1GnYnP1qsfBjYybFBfO8V//SyTmJkBUxMWsKdBXXYKLurB8YzD4qmDDtfpj7CcUPWFYVXm8DkP6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013134; c=relaxed/simple;
	bh=Lwrlcw71vgTAamdXcmg82wNsEkfj5fJ+XFI5vf57VMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tr02/QwGu+spWpxbR3QuOH+aRq470/nFOtxFFhPshGz4dYugyuAlZM7cqk06MnPCM5CYg0Bhlkevl7R8oVJ/1+FTnZ0kvna71AlmhtLYSZuhU5d+ln199UG8+N+8Qc6DHJ++D4twMwI06RibfOlEJpnmwwG98WRsl7Pm7Ad3xlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKLwt/Yd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1mmc/+F; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SSUE3743628
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qhtQcYZdRgQ9G3QLEHtqpERI
	w8uiHWgJf71rUZ5DikY=; b=aKLwt/YdsdYYrDNKbAFxV3961OOF2l4AW9c2sc0E
	2u+V0niDeaXir8atiEKu9OCQMbUcfUHt87mq/b4fl2Lhrff87dkXWZpTXGPiHF2C
	oxWFcque+z+guoQ21kaw61GCiup5IJ/B75pIuWA+CVzrW0koj+t+Skh9bxunPIn4
	amcZdMejBRwA3O5tpGVrbyB2VYfyxcMK0h6YomZQGE4suhWBfZ+WUeqfLpygjlZQ
	AQQCxxh8RzZ4bFcGh9bCVo252CyHA58oa22MgNioeKHFkZSZYYOF9swkqMb+fRrh
	gh5K7fjWlC3+NsaTARaf14/MBOyzLgNp2OfRq5MA6p24kQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p2fnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:11:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so6039170a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 00:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013118; x=1784617918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qhtQcYZdRgQ9G3QLEHtqpERIw8uiHWgJf71rUZ5DikY=;
        b=Y1mmc/+FPb0G5omOPuObf2QVEctFMk3YgFwOpONCzsWI1cBFP649VQimLBTU1m9mxx
         eFs6HlFACtvxDIp1Y/HKPhVvsnAA9o8Q5ozAT/0XBfXkNe6vN+oWc6GzuhJdS1pgfL6P
         Jo8ey2ujqsVAnODVTgm+ghzpuLappFHAFGddN/XeQmUu65uJEBOkz9ZF0NnH406Q1rhv
         XvAuTnnaATBpzsrgA4Z2im1MYSHJ8l2zfdPij6K31TmOp1qTFbGZbt9iQwcYUiMdW/WB
         gVfGpmWNG/d7ZpKkB5/4K6son6fGoy3NZGpd7K82IMvDYI+2b6WFSPRPIrtZK8JaR2iK
         lIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013118; x=1784617918;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhtQcYZdRgQ9G3QLEHtqpERIw8uiHWgJf71rUZ5DikY=;
        b=XoBx8CohRCPEMVneGRWWFqY+9KGjsmkhry77t00Flr6QmQJs9V9YJcywLOIpZqTmyx
         ckmAMFUibCuTKViFGjwpeGrfr3J1xo4SUfkLMr1ELSmyV6KmR5B0Ukhbl2mt0OtH2Tml
         YLBpuNN779X2CpXyMjrW7lLZSNOp4WvTmCVFn4JpdDl0hLAZSsYXHmK/Gr8kxr6NSVZi
         3v0ficgx1NrRBQea6j1iqZc2Zuf/JNk0U9unCqcZMPHvEl9Ua6ue+m7tDZ/2yGyqMpia
         AN24xWdh5CI0E32Q7VblBmVKD3j3hLrxrtdLioxpWzFuqk6E27BHK/hIWufxNZxo6mxJ
         QiMw==
X-Gm-Message-State: AOJu0Yz+bbNtsy73wrvg82XQ4cZcmHbEZyFAd1uGjDmu4detDR61NKyQ
	DzX1U5mEgtMlx8mxIVLjugxqD8L53XwjT5r86emngDMncU2E9HESK+fBMmNtl8D0YIB2VFASabH
	5wrMYLz6ZtqsoNLvlDPegsc/USi5rfKvxBD16TIF5aQhl2lmc9wL1yJFPt0VorLP3iYSH
X-Gm-Gg: AfdE7cm45fWlnbden8mE134D8BBXnxNdMcf6E5qsoGeyJ2PukE7TY60/sUj33W2QWV/
	AJPgulQ+rItAmRlhagWQ6ZBGQqBSE7T+XPPYFg0APmAQJmIbJ7YzrXyyYT4c0jiQCmOXsDN6JU/
	Z3gaAHZ5eXFyPLjmq0VZbuM9FpIJWtwfynH02JMaKDLGV9K4aq0GF1PF4QwYoNn1ACZg+EGi0U3
	mOP15CmxQk9zBjqmNpw8K0s1KhAF4FBMx0XhOnagXEXUG6OxkZuC6d9f7OzQPbIQ9LjAH0ur9t9
	AnlNeonuRnra+Qw1OrTygF0U5gsthc/Dqe+hizBTJYwXPaAAY9pxL9W9yZ+lTLEf60BCwaaJCdD
	JH4/fv88hvFllGefcc9OAlRr0+8g5AaErYtXWEg==
X-Received: by 2002:a05:6a21:9a4a:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c3570141a9mr1460415637.24.1784013118370;
        Tue, 14 Jul 2026 00:11:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:9a4a:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c3570141a9mr1460363637.24.1784013117782;
        Tue, 14 Jul 2026 00:11:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9081d5c3sm26728942c88.9.2026.07.14.00.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:11:57 -0700 (PDT)
Date: Tue, 14 Jul 2026 12:41:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/2] arm64: dts: qcom: kodiak: EL2 overlay for
 qcm6490-idp / qcs6490-rb3gen2
Message-ID: <20260714071151.kol664rhv7afjnus@hu-mojha-hyd.qualcomm.com>
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
 <20260713160754.1250988-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713160754.1250988-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3MyBTYWx0ZWRfX8JmmOTUL1ORP
 QObDWhULO2UditdA+8WqBS4SDUHJ2V4qHRGrlkWXeY+2Jy5bHjFOFkgk5oz3Igzl2jaCfYAknSN
 72VEm8Q9ANPbqyh9hxTU7yVS543w4DI=
X-Proofpoint-GUID: pmIQxBS2HtPH0p-P2JHFg7lZgnYXCH5e
X-Proofpoint-ORIG-GUID: pmIQxBS2HtPH0p-P2JHFg7lZgnYXCH5e
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55e13f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QLVsefW0f3xFOmyi1IwA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3MyBTYWx0ZWRfX19+66hIGSVJd
 DLBG7epmORHlch2L+WuTacoKxlqEaVmf442k9xUMXBxGziJ76g8oWBiz5u/dtIsfMxUs5GRsbG/
 NNVhJbsi5FPfWpDueRIJ0XNgzEd5flusE1v+L+izEHZ7ZrTu7cpelviZM5HNInwNKgMAGrh+mzr
 Ii5mJnHMAWwjCIMx5wRZjxAQ4QCKZkROlB3R8jt/aXBeKSoZBUFkbPr+dP/jCWRPjUjggAd1JcU
 mHDJ2XJLKzsT5QHML7mdRz3XUzUp+e3nL5JAvB6RxwvILON0ou0D6rIH1j35gmdkFt7sY0Yk9UH
 eeFopbSR1Y7lkVFETe0AHDRANPC8lHDXUgBdCmd4e1AQsQIWPaCE5XCCdh/brsS7v2jwlWp5TQB
 UBydRKEe+nPGjV0b3obZl6i0wQ3WV4c+qYhzpggpOup2RoiPJINrYfpFU0DXIN5RQQ3FELIeNLU
 ABRlZo4DhsU4M938OYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-118969-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24639751C16

This got messed up and went as a reply to v9. I will resend this
v10 as RESEND again. Sorry for the spam.

-Mukesh

On Mon, Jul 13, 2026 at 09:37:52PM +0530, Mukesh Ojha wrote:
> All existing Kodiak board variants run the Gunyah hypervisor, which
> means Linux can only boot at EL1 on those devices. It is possible to
> boot Linux at EL2 on the qcm6490-idp and qcs6490-rb3gen2 variants;
> this series adds the DT overlay that describes the IOMMU streams and
> other kernel-owned resources needed in that mode.
> 
> Patch 1 is a small independent cleanup of the two board .dts files:
> keep the wlan_ce_mem reserved region (its /delete-node/ was erroneous)
> and drop the redundant wifi memory-region override that duplicates
> kodiak.dtsi. Patch 2 adds the kodiak-el2.dtso overlay and wires up
> the -el2.dtb variants in the Makefile.
> 
> Changes in v10: https://lore.kernel.org/lkml/20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com/
>  - Split the wlan_ce_mem retention and the redundant memory-region
>    removal in qcm6490-idp.dts / qcs6490-rb3gen2.dts into its own patch. [Dmitry]
>  - Drop status = "okay"; from &wifi in the overlay so platforms
>    without wifi enabled in the base .dts are unaffected. [Dmitry]
> 
> Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
>  - Instead of adding wlan_ce_mem back in the EL2 overlay, stop
>    deleting it in qcm6490-idp.dts / qcs6490-rb3gen2.dts so it is
>    present for both EL1 and EL2. [Miaoqing]
> 
> Changes in v8: https://lore.kernel.org/lkml/20260522115936.201208-2-sumit.garg@kernel.org/
>  - Added a wpss copy engine memory similar to chrome for Wifi to work.
>  - WPSS does not have firmware Stream, so that was removed.
>  - Added wifi streams similar to chrome for wifi to work.
>  - Removed this patch from Generic Pas patch series, can be followed
>    separately.
>  - Moved Sumit as co-author as part of modification done to the patch
>    in the past.
>  - Added some more kodiak's board variants in the makefile.
> 
> Changes in v1-v7:
>  - mpss was disabled and will be enabled once the dependencies patches
>    get merged.
> 
> Mukesh Ojha (2):
>   arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2: Keep wlan_ce_mem and
>     drop redundant wifi memory-region
>   arm64: dts: qcom: kodiak: Add EL2 overlay
> 
>  arch/arm64/boot/dts/qcom/Makefile            | 12 ++++++
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso     | 39 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts     |  2 -
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts |  2 -
>  4 files changed, 51 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> 
> --
> 2.53.0
> 

-- 
-Mukesh Ojha

