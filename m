Return-Path: <linux-arm-msm+bounces-109054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJWDOpv6DmoSDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:29:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB155A4D18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 775CF30087EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6193D34A8;
	Thu, 21 May 2026 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M82Y8mbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFFD3CE0A2;
	Thu, 21 May 2026 12:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366514; cv=none; b=jhC9GZUH085cuFZJ43Xtzp9YkfP7Qv11IJQltziZ8JXCOuJOPcPCp9ffQN5g1XR03Tyl5UK4fHytM2PWNqyN3wkaVOpBZh2ZvzJUO17lp3gwQ8nV4ebQLPvUQfLd2BEggK59Y9Ae+5CsvY+lUZN8HEioD2Qm5uQlIKDWe0pQrV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366514; c=relaxed/simple;
	bh=TKIdjWtuJbDwOtSpj7b/Zh2d8/ZrukOOq3vxnWkUsXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LC/T+GBcn2LJTo143T9NAiVUqFZrmIBZH6xe33pnQY01Z/tBb5lr9iEPC9MUNT/YIDFnl6Gf6g+JIhruosMB8BAX3o9zPddwUxJFPtVI+vM0WYmMtEHcxs3ydU1ioNqGWO785uj8yfejU3tzQ+q1piFx7XbgNvj5Vg7HaLwA8Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M82Y8mbU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99vdb2491833;
	Thu, 21 May 2026 12:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yuqEmGmJ+dJ3AxgG2mfeA7Qr
	FNd0O3Iro8nSgbOpzyc=; b=M82Y8mbUuGWX2Ot47bzdbq1nU29gYG0iNMYxa81M
	aPAS+DNjMcGMz7OPMnkKhYHMBMe2gHJ0ugHncLRRggiZ8X48l0n3KcxnxLbtrK6X
	7qBMpAn/V0Xgi2UURRm2AgzBxZX8f4fOy9DxQ1POsUaHzJGcrSUAEma8HULUX23F
	DoCesnTnIpRiKUGx3JlCV1wEiSE2sMlV+G0kzje88Tgy4S0k+BsXI+LEM+Rb38ib
	5ev8pnXTjtvNUyY4wLDYOu7CgP5Z7ejhS+HNWSkFe6cVCH7MSnew1yrL0xwiThGq
	uBh+iLyrVlsGTLesEDLoWM+j9Rt66PRn5R2iWjksPRifKQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j4xs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 12:28:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64LCSROI007036;
	Thu, 21 May 2026 12:28:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e716e9whx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 12:28:27 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64LCSQBj007030;
	Thu, 21 May 2026 12:28:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64LCSQVu007029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 12:28:26 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id F3181B36; Thu, 21 May 2026 17:58:25 +0530 (+0530)
Date: Thu, 21 May 2026 17:58:25 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS
 support
Message-ID: <20260521122825.tfntz6vu4omvwa6t@hu-kotarake-hyd.qualcomm.com>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
 <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
 <91832aec-22f0-4244-9989-39bbd8defb24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91832aec-22f0-4244-9989-39bbd8defb24@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0efa6e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=4BUObyQTvJTuzYX1E2EA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ZyP4ISlPXVNytaebekqwfsHSp8xYGYni
X-Proofpoint-ORIG-GUID: ZyP4ISlPXVNytaebekqwfsHSp8xYGYni
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNSBTYWx0ZWRfXxG3PB/k9roOg
 a+7XVTJSJ3RbeAmCegj4H+zpBBwjwp/BgxlxrKYU1/YD6MNEVKx9RyKfX82x6w2qnQLsdw06y7i
 ixYl+txudgneDkUBEsE9zOxpL4W2XZ00ZaZIFAuoKUNPz+W+vpuwOFs0p5YNVN01bPccvV/vlVZ
 wm7xslbznB/3maftjWwS5q6Bxb63jDAP2s5zFdHihqgqBPFD+lH7YgJKH4PnDaKUT7fqsJktjqf
 M78R36zOeosgcYqcHSQQg2OPY0Ryr/lT+09QXQ4UoD5D8z4eVgT6H5f4BW4V2MUSrAYusjc033Z
 dTgYfKrX5srceGp6WloBGEy3OQmw3jhisB6e7W0KGlvhZXZzAbSyP/hYW0Wa4f0UK1GYtymRaph
 +ET3rpvRf0QAaITroRIacCbIbQwJ4+CdTDaEcuaeXkVyiD3/Kk92nASS9uoIWW50T/t0Ht1/QXW
 NJS0O+h7Fq8waV7UiUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210125
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109054-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,hu-kotarake-hyd.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8CB155A4D18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:58:06PM +0200, Konrad Dybcio wrote:
> On 5/19/26 8:59 AM, Rakesh Kota wrote:
> > On Mon, May 18, 2026 at 04:36:32PM +0200, Konrad Dybcio wrote:
> >> On 5/18/26 3:49 PM, Rakesh Kota wrote:
> >>> On batteryless boards powered by 12V DC adapters, registering the
> >>> power supply as BATTERY causes userspace to incorrectly trigger
> >>> battery power-saving sequences.
> >>
> >> Does battman really offer no way of differentiating whether a battery
> >> is *actually* present in such cases?
> >>
> >> What boards are affected?
> >>
> > Currently, batteryless support is only implemented for the
> > qcs6490-rb3gen2(Kodiak) board.
> 
> Does the firmware report anything obvious that would point to this not
> being a battery, e.g. design_capacity = 0?
>
No. The firmware identifies the 10k Batt-ID resistor (which mimics a
physical battery) and hardcodes capacity and status values to
ensure boot stability. It does not report 0 capacity, as doing so would
trigger an immediate system shutdown.

regards
Rakesh
> Konrad

