Return-Path: <linux-arm-msm+bounces-109646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL1jBzE6FGpDLAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:01:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577C5CA3BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 743533003BD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7673806CA;
	Mon, 25 May 2026 12:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2cWH0Gj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB09B37E2FA;
	Mon, 25 May 2026 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779710507; cv=none; b=uZZaxwCzewciT917n3wL/GfiyWbbqvyzR4y5deW40bIMTQRsD8EKUBCm5GPFrUrDEPaS8/SkJ7Fuo5Cz8XHnEw/uHAy+R9tQWhKlMbuEkBYnXGE520lNDRj8sAxiffYIh2Q24zBmwBZyxafp7rY+tXrmA2+ZuWcbv7HZf6c8Or0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779710507; c=relaxed/simple;
	bh=fE4uY3q8XgLmlfS1YC8jOwm91Bf9KcN2Z9riMvyK3kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMecYpynK7eyq61Ck0iQ1ICfgWX41jwTOSZL+R9We3MxStdSTNqVuMgUtT6sHa4mh7jodQF1TL2R4z001T7zqvjQsxQ6f/19VcV1VR51ZkYWyYzDhVJfvu2E154YJfNWZVgM1hbT7p2LNQFZX7ZqV6zy5SqDRigYs1LC90YmhvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2cWH0Gj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P83s6a1861470;
	Mon, 25 May 2026 12:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bxk3pD0ZCTu3OZhP0VIKb275
	cuvSZ1qse+aBd99wy8A=; b=R2cWH0Gj/QP0GJPUc9jU0a2rvDrwGpO+Od1oSMV+
	NqBUcn5IRZWH5EmkPNhcKKJrxsEDgJ5jHvWo7HTlMBqov7BJs+NWd8PsAyeTbTVr
	1oBeMF4g+WO+3spOpz5jEvD/HLRuLBqt3RZIoCDaA7Uo4eqegLxaO6zTaiEB8qjd
	622dMQx5sOFG4neK69lf9z6ixov8Sqgxkw7A8GNi2UDKKSru7e2uuRo9QafZyN12
	uSVH6HLtoHTgYr6Q3Y1/w0skTcIPu0x4vZ48itTOXrSxOHxv16tNbk7SeypWgCPd
	GnVYKgtAScl2Xu2MD6jw/MR7E7DXcgqbzGPeJTJmCGS6PQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w603x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 12:01:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64PC1er9025119;
	Mon, 25 May 2026 12:01:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4eb5ahunfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 12:01:40 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64PC1e1b025114;
	Mon, 25 May 2026 12:01:40 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64PC1emO025113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 12:01:40 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 8D254B2D; Mon, 25 May 2026 17:31:39 +0530 (+0530)
Date: Mon, 25 May 2026 17:31:39 +0530
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
Message-ID: <20260525120139.dyfnm6nwfzuoxd7p@hu-kotarake-hyd.qualcomm.com>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
 <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
 <86f76a81-832d-4ba5-81d5-38b46b7dc0a7@kernel.org>
 <6c595a5f-b979-4e8b-ae77-d28d24700588@oss.qualcomm.com>
 <e07085c5-0fe8-4ea7-8e51-ebe104e7aa2d@kernel.org>
 <82019c2e-6b6e-4edd-91b3-a28ef6eb09eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82019c2e-6b6e-4edd-91b3-a28ef6eb09eb@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a143a28 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=m1Cw-gmve29VV5GRw0cA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEyMyBTYWx0ZWRfX1fQb06NpEbfC
 QCV+S+WfDKVP79OtWkrFP4v6ZlMKx978TV0mqM9NthgjXRFuTsuzNZ8xvnVGkV1EvWmKshxxTuM
 REkYLrg4W4XxsgHEke07X8BaZvWYJQYp6dli1Ft2+bD+Ik6Q/afbZknvvc8Bb/itmd3/KWYx5Z7
 sCWN0e6izbl22DvRUDmiHp437MbnY81sQfi4rASGWOYIdKmTBBOv6NHs6/S62DsYKrq4Y0msBNV
 xbv2sVZq3LsPrB+B7lnuvUVD9n8UL2MlEz1T7bL24MZUx8B46ZEFRruG+g0FeDuxGruC466YPik
 4nkDYGAJIZ+u683R7dSEMhrd8gUV0ssHk98H9W47QBiF3uh/IbABcwh2vRbCjJ6gXc2XTd5LSFr
 jMXYdrluBHEi7rj9r3quyf0m7b+fZZVOmKy4KFHCoyg8/Os/KqbTvxWFl4XEbJQrKh7rAC35STn
 WWvB3baen8ZwC3pMUsQ==
X-Proofpoint-ORIG-GUID: qpuvh93ksfHCibfx-0cX0hBMb4gbCf78
X-Proofpoint-GUID: qpuvh93ksfHCibfx-0cX0hBMb4gbCf78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109646-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4577C5CA3BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 11:24:19AM +0200, Konrad Dybcio wrote:
> On 5/21/26 11:58 AM, Krzysztof Kozlowski wrote:
> > On 21/05/2026 10:46, Konrad Dybcio wrote:
> >> On 5/21/26 9:20 AM, Krzysztof Kozlowski wrote:
> >>>> Since firmware does not have a way to dynamically tell if it on a
> >>>> debug-board powered device or a DCIN powered device, We are required to
> >>>> add this new DT property.
> >>>
> >>> Neither debug-board powered device nor battery-less will have
> >>> monitored-battery, thus again, why lack of that property cannot tell you
> >>> what you need?
> >>
> >> A device with a battery will not have a monitored-battery either
> > But why? If for such device property "no battery" is suitable, then for
> > me "monitored-battery" is suitable as well. IOW, if you say that having
> > a property describing batter is not a accurate hardware property here,
> > then neither saying "no battery" is, because no batter is basically some
> > sort of battery (just like empty set is still a set, empty array is
> > still an array).
> 
> The battmgr service running on one of the remoteprocs already has all
> the information about the battery and it also handles all the type-c,
> PD and charger configuration, only letting the OS know about the
> results.
> 
> Hence, unless there's some other hardware at play (e.g. for custom
> 200 W charging), which wasn't fully implemented in the QC firmware,
> there is no reason to describe a battery separately, since the OS
> can't do anything useful with that information
> 
> In some abstract way, perhaps monitored_battery = <&pmic_glink> could
> be thought of as valid (since that's the data source the OS gets to
> see)

Should we use monitored-battery = <&pmic_glink>; If so, would it be
incorrect to mark pmic_glink as simple-battery, as that may cause the
schema validation to fail?

regards
Rakesh 

