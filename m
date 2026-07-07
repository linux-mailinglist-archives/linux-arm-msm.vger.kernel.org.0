Return-Path: <linux-arm-msm+bounces-117186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T3QsIPC6TGpIowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:38:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C43BE71931B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:38:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="o/71RZVA";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117186-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117186-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DE1F3006B5D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE39C3254A8;
	Tue,  7 Jul 2026 08:33:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5539E30AD05;
	Tue,  7 Jul 2026 08:33:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413214; cv=none; b=R4zQ1Gcj43ULl1lpTu8Tt4hiACqkX4SLYafpI1pXvSClzHOYOdSPtNj7op/2pFQ0xVp8ws2c9fmo5iR5+cSUW5obmoktXCfsyXIuwVnkVTQK6sNmwrrlew9CtA2xyUZLJf23lD4arPV6qIdyVxA4NkG4UqJgvP1nXh5Y+AEaABk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413214; c=relaxed/simple;
	bh=jZB3PTbU6bAXQpzDktc+u0oKB62z1DJkwV1K+bvO9Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM3+w2bK2ZfV+Co2Ckn1n1pBkKC2GBUKj+blPrsPFPsr6gS/Egy/Meybp9pI7nkk3G/gBX61jo+MxcwgpSaCxSBrD5cRu0j8ikeOAXIfCHUwe+KdLfbeOwNrIjPZZS/JDa9OtTHDXN7WJK6kpiqzHeeojJoKoAvB5gi9DL2SB98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/71RZVA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dta93139321;
	Tue, 7 Jul 2026 08:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+m6BB7PlbAu+OnAqQAjXlnJSI4bnQu+pj4JBp8ta6ks=; b=o/71RZVAy244eaJY
	MDJ6k/WvL2NAiRQzdrav3Jtg0T9XLcXC4rvxljv4rGnovlBs+g6+xeex0FbRLMUN
	fes1BDRxJRdsA6R5q69CXuKRvtHdgLvh+LtGEzU20xFWxfHuxx+VfLUBTf0wolrC
	wyoJGUOG6/D10WGumOFLiDI9Q/4iSoM0rs7KA6ySCS/V/NOLTXwvb4WgWqdGWLSm
	gK7L55SG5eUhvUqFQGOv+rM3AP2nJLybL3dtM3U/j/4rTLeyn+gt3qDvUFArJJdD
	wvGL99b/SHsVyqmJQecxGvJRsaVRnbUFDXTxPVxuYZu7lOw3GrKpSBW9yTk/z9LP
	6NuiTw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t159133-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 08:33:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6678XKhq026985;
	Tue, 7 Jul 2026 08:33:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8k01bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 08:33:20 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6678UmnO023346;
	Tue, 7 Jul 2026 08:33:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6678XKXn026978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 08:33:20 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 907FDB31; Tue,  7 Jul 2026 14:03:19 +0530 (+0530)
Date: Tue, 7 Jul 2026 14:03:19 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
Message-ID: <20260707083319.rwtnt4l6so3kdduo@hu-kotarake-hyd.qualcomm.com>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <71tt4ete2nCnQuCLAao68H3X1IjhICYvh8a9Y14WT2pr_opABqQnPif_6w1Mmdw4cDCUUB7i6t4ApGyUdHPdRA==@protonmail.internalid>
 <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
 <14be441d-7223-46b1-9292-fa73ae326ac6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14be441d-7223-46b1-9292-fa73ae326ac6@kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: EQeVRFtknzlqOo_pUCNDHch2qlN_QqIq
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cb9d4 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=Apo_wohB1TfuvuZ_3JcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: EQeVRFtknzlqOo_pUCNDHch2qlN_QqIq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MiBTYWx0ZWRfX1vVSRD1Oe217
 BH1AY/WE4wYfOwXajLrHrGSrh/8C0Xtw91YdpG5YqAHMEnUDI/7lIRgpGU0gTZjCC9Lm7Dn4n8G
 0ary4eDvVkp0eTkmei6/IQa2cHKclrY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MiBTYWx0ZWRfXxuaBmFQC3RBG
 E5jr2xrneIYxlObKt18/xhIgpmY0W0X38k+YDxeHthhpd7x96kIadkRdR9uzAAN/c+QbceVME7+
 DlDgMUmLm5sMV+OEltuYdZtKHxGIAM6tJSK8PosWOWNxGAo913U4ZbC2ZOYLhw9HvwtG2QRBt5d
 FAWswV7LkxkMj2BH6xtMVnDKKCbkXXQpXQaJG0bm3NfmJNUwfqZ7qkr322CNA8C94hFtuN+OERL
 6ZN4Yq76WzYJuH+ta2vEvBNh05GL/oYsXb6Bf9GcmGgOmpWgkWIBlrQALARlCGHyllpdjXAIzil
 hwERCdUtkiKq1HHriHHZ7HwUct77zJGhOXNHz7BVmDdeNrRbSP+DVq66GhdX0unYb/ojzylBB1i
 bXfWkqvtw9FM4CloUgdzc0yv72aVHlL+ZzhaRlx+uGptAR1V7HbFFYZpzTTQ5AjiEpng/+UbLZr
 IdSpEfXKdPn1muLrlpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117186-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C43BE71931B

On Mon, Jul 06, 2026 at 02:49:33PM +0100, Bryan O'Donoghue wrote:
> On 06/07/2026 13:31, Rakesh Kota wrote:
> > Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> > constraints in qrb2210 DTS files to use microvolt instead of
> > microamp.
> > 
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> You should break this patch up at the "and"
> 
> One to remove the fallabck, one to fixup your regulator stuff.
>
I understand the preference for splitting at the "and", however
splitting this patch is not straightforward in this case. The PM4125
compatible and its regulator constraints are tightly coupled in the same
.yaml schema file — if we split them, dtbs_check will fail on the
intermediate state.

I've confirmed this locally. Removing the pm8150b fallback compatible in
isolation causes the following schema validation failures:

/local/mnt/workspace/kernel_versions/kernel-checkers/linux-next/temp-out/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb:
usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): 'regulator-min-microamp' is a required property
	 from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml#
/local/mnt/workspace/kernel_versions/kernel-checkers/linux-next/temp-out/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb:
usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): 'regulator-max-microamp' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml#

This is because the qcom,pm4125-vbus-reg compatible requires
regulator-min-microamp and regulator-max-microamp to be present per the
schema, and both changes are needed together for a bisectable,
build-clean series.

Could you please advise if you'd like me to proceed with the combined
patch, or if there's a preferred way to structure this that avoids the
intermediate dtbs_check breakage?

regards
Rakesh Kota

