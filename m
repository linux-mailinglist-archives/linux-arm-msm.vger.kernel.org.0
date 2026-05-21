Return-Path: <linux-arm-msm+bounces-109060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAHVEBP+DmrrDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:44:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1385A5017
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E593309514C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD603D5C3E;
	Thu, 21 May 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VM/Y8OuR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0A3D3CE0;
	Thu, 21 May 2026 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367094; cv=none; b=IVM/AHyudEK3lZfbhPdm2vRy/VOXTK/IVg/3iyVFjdAY0oytNtfBpJcfcr9jcs6ZpTOIp5+6Pb1s+StC9J2JY2FBjYFrKBY9FiJAdpY6YhGIi9bpr4EqCR4zNoW3M9D8L2pO+r+jXFuc3oRR9AnIbKtq8pOif5SMf18Siz6igZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367094; c=relaxed/simple;
	bh=FNG1Z5tzMqtrqsVNlBRz5I1hPeW709s2p9VDEFobBDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KolytpyVvNA8jByLm16Qrpa4vTPbGU9S1/HhbchnyVuANEt1Ksr7nPboYDvLQwxpVmhyAKZO8PbP77I9Uw3QoVyXlgR/K18bqMZks1gGbi74sMgXiAwqq4uFWHA2EHz34K5PNMXxyYyCM9SD/7nSkwbuPEcnXESH/CRjT2sWdVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VM/Y8OuR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAXrOw818829;
	Thu, 21 May 2026 12:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kt3iEZugyLmB9pALMqjSbGYfhOe3g9AmKIdVABkShF4=; b=VM/Y8OuRwamUN/sq
	RguhwCjudNL3PMD50mflq3lE7zY9tP2RtlgTLeJt4RRO+7z3fCOGG3Fc8dQqLwCG
	QQH+NJWOHIMLAE47XFhYPDldvHSY7731O8Bu0ZqCDAmMY7W88DO3MvZydxzC35MT
	rzTjnrsME6aLy5N99CxqIuj30Y8L3i3dkK+odNWy6A6JD8BS7Tmn7f4ECouBJKDg
	UfVATY5/GOBnU3BqMFxm78TYKKSEyDb5QCa/CnRWvFLayDbJHNkjRted/wF+6Dgz
	5ATSzmo/a+SAYR+0MMqzXP9jhWq6hR9M9z9nSafpJhsL3r/plFS9axK1rL4oXOMj
	E0C0vw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkge3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 12:38:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64LCWrE2013324;
	Thu, 21 May 2026 12:38:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4e712ge01c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 12:38:03 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64LCc3n9021466;
	Thu, 21 May 2026 12:38:03 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64LCc2vW021420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 12:38:03 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id B558AB35; Thu, 21 May 2026 18:08:01 +0530 (+0530)
Date: Thu, 21 May 2026 18:08:01 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Message-ID: <20260521123801.nqwojg5yhofwhj7i@hu-kotarake-hyd.qualcomm.com>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
 <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
 <86f76a81-832d-4ba5-81d5-38b46b7dc0a7@kernel.org>
 <6c595a5f-b979-4e8b-ae77-d28d24700588@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c595a5f-b979-4e8b-ae77-d28d24700588@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNiBTYWx0ZWRfX/ut0lbAyOFvE
 R7pk8AhbYorCF2tv1YKkvhQAhsli8yMPhH6ysYkvr82E1dzSEmFZrZwe65cdt7EHy2nYjJR37Vh
 4RLuapdIR7Inn0PV7rZqV8dTQJgvMfuBOHu3DODZA5FsHLTVvLcYRgfFHSFrKsBins0HZqP7N98
 OtrdACTAFFjaY+XmedxTBi6dr068YyHDgccAYWAhPVahXRg0tKSfSWvpZa18bBmLGACHymt9M/7
 yyWzStYJ8fYoQaifZje99Odl3C7FMZGpU89nToQaG6YeQoBUNL0hMypAOjmfov+MyX3gerzfqLr
 FXks6esi1gRCwtIT/SXjr8Tab+hhUbL96fww/EZfOjlbvUJUoCp9C/UMD1MVSU1EObS6EquRrAK
 V9L5/p05CFBDknkvf/Nap70ZzDTyti99AQ/Islx19qQJpDwpfcgb2t7SkyxsQ+7PnxJyskCKaVR
 /qepdr+y7+AjAH9wAIg==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0efcb1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=UqxGktDVCBaAMG5AqxgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZYrPiGgYFFOVNGtZLuZv25Ed36gg5xrv
X-Proofpoint-ORIG-GUID: ZYrPiGgYFFOVNGtZLuZv25Ed36gg5xrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210126
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109060-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,hu-kotarake-hyd.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BB1385A5017
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 10:46:15AM +0200, Konrad Dybcio wrote:
> On 5/21/26 9:20 AM, Krzysztof Kozlowski wrote:
> > On 21/05/2026 09:13, Kamal Wadhwa wrote:
> >> On Tue, May 19, 2026 at 12:35:13PM +0200, Krzysztof Kozlowski wrote:
> >>> On Tue, May 19, 2026 at 01:55:26PM +0530, Rakesh Kota wrote:
> >>>>
> >>>>> And isn't lack of monitored battery property enough to indicate that?
> >>>>
> >>>> Regarding monitored-battery — its absence alone isn't sufficient. The
> >>>> BATT_ID line on debug boards is pulled to ~10kΩ, which is used during
> >>>> development phase where some battery properties are still present. The
> >>>> same ~10kΩ value is also used on some genuinely battery-less production
> >>>> platforms where no battery properties exist, making auto-detection
> >>>> unreliable. Hence the need for an explicit DT property to identify
> >>>> hardware platforms where no battery populated. 
> >>>
> >>> I don't understand this logic. So you claim you have debug boards which
> >>> do not have battery, but define monitored-battery? Then these are wrong
> >>> and fix them first.
> >>
> >> Actually our firmware treats the debug board as a "fake battery" rather then
> >> a "no-battery" case.
> >>
> >> This is done to avoid triggering shutdown or trigger power/thermal related
> >> mitigations to kick in from the HLOS (android) that is configured mainly for
> >> battery-backed devices.
> >>
> >> Note that we can know if its a debug board, just by looking at the battery
> >> ID resistance or the battery profile name in the power supply properties
> >> for `qcom-battmgr-bat` in sysfs.
> >>
> >> However, the problem started with the boards that are battery-less and
> >> unfortunetely used the same debug board batt ID resistance value, so from
> >> the firmware side the batteryless board is also seen same as a board with
> >> debug-board connected.
> 
> Bumping up my other reply, are there other markers that could interpreted,
> perhaps design_capacity = 0?
> 
> Or are those values reported based on hardcoded data which is chosen
> through the batt_id values you mentioned?

Yes, that is correct. The firmware uses the Batt-ID (~10kΩ) to select
a profile with hardcoded data.

regards
Rakesh
> 
> >> Since firmware does not have a way to dynamically tell if it on a
> >> debug-board powered device or a DCIN powered device, We are required to
> >> add this new DT property.
> > 
> > Neither debug-board powered device nor battery-less will have
> > monitored-battery, thus again, why lack of that property cannot tell you
> > what you need?
> 
> A device with a battery will not have a monitored-battery either
> 
> Konrad

