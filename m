Return-Path: <linux-arm-msm+bounces-108363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DiZNfoLDGqFUwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:06:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD4578A11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 071DD3028B69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9448C340A57;
	Tue, 19 May 2026 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5ncw4m4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33723AE706;
	Tue, 19 May 2026 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173989; cv=none; b=mB1CBxGWBKzky8+Cojbkrzo/Qsog0dL6YVxqeX36YwFQMyEpGfd+rKzNlfjQMaaISrdON3bzBvunFWhfQWoDvDM5Y1GohHSEVZlfIzFoFhzY3zMI7bq/OOpqyqer7stMUuuxiJyEbRxwbWzaTNjDqs5CSn7qG3IRYp2uQ20/Bag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173989; c=relaxed/simple;
	bh=Rq8wj6ZachvdoaG8KOSQQ7hllWfNNda+9Uu/hpQzTuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9gqFI+qGmxJkfMReV/zpVhD0MGGgENcfLChQiMHk7xkcP9je56CpeQaReq+KvaEMLt7bU+yjOf6EuunWS48b3bZXXeRVTkzkPbF/1C3Dd/5RgQysqXndvVD2z/gpACJ6Lir+QbTWl9v8hIajUBsOZBrwn1lmbz1gRRqEE4lIdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5ncw4m4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4sSBx254218;
	Tue, 19 May 2026 06:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wx436S53oPnOtFPP+0Yx5o2L
	YPL/1e7mpm7eOeOw/pg=; b=e5ncw4m4wkP926U+bCtuZuPeRdgkBL3Xf78aUocB
	5atSG1ThXulKQwqtS/S25rqi/pWPGgbyBrQQ9hcsRTr++VPRUFnAQFRhkZKx9+N5
	y5WUvJkyNQ9VgtheMGIrklhkQiPqc0Qo1WVi8LZuCMW0pKc5HN8qYfWpOrUTe4bE
	3+KM6T5rDyublSkvi3smBxWXc4OvzxVJ2sLsQnW+A7V1B3gxtw5BPqHVeTw7lwNg
	MviAd+gFzP++IUwoVZ/G1Z4Ya0Un1NPn2feLRZq3fjuYnTT8Ma4EB2duSXFE28ao
	Eyjk56gCdbBpNozSkbWiGkAqn2emjG0YFML67Ks0y4MlZw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87rfvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:59:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64J6xdTb016580;
	Tue, 19 May 2026 06:59:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e716dbv93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:59:39 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64J6xd7g016575;
	Tue, 19 May 2026 06:59:39 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64J6xd2e016574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:59:39 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 6D44CB04; Tue, 19 May 2026 12:29:38 +0530 (+0530)
Date: Tue, 19 May 2026 12:29:38 +0530
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
Message-ID: <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: XR8B5TFRA3ScnVXlztk3RBeh_FgRYVka
X-Proofpoint-ORIG-GUID: XR8B5TFRA3ScnVXlztk3RBeh_FgRYVka
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c0a5f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bdXQ0qEb_Vu53zfW-1IA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2NyBTYWx0ZWRfXyq4LJnGe03z2
 MOu+QYnN7JFl2vpX0Ih4IqJg80Gp/pdNWzqlQNRBVm7OrweJW1vHLE+PWC4j7a2SkCNOsVAgMNE
 0hbzVj23ubQZjyStJusEdU/tsVxnrYpSg1SCSLv8z2jEXu4UiWraQricdIoJ2dhNAkaEy8muHt9
 d6dkjR0aIrcjJm1zszXugBKM/zpV9FGRQ7kwEXDy+pkSh6S2OV6GJKLuUDKaAdAA9G1omWyR/xq
 4mSeTGEYSKOjx7UfmxqALBC5Z1lkaqeyHkZHdUMTDXwpllsRZIWCwli90MFp/IkXgGutu90LG4S
 aZVHZrzwAilna9bqjBJbhuIbDbVsM3r6yZa7OAnT6vhrmRwSmR01Fm+f7pePfMqpFcL8TTLmeGu
 +OYblkMk5yk5LdTf2etcx3/C9nlRclkX0wBG5rBuhuwUwR/EBOMogJBrpBraY2bgIkyvWHWn6qu
 9mQnFh0I76V21K7qHjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190067
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108363-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 38DD4578A11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 04:36:32PM +0200, Konrad Dybcio wrote:
> On 5/18/26 3:49 PM, Rakesh Kota wrote:
> > On batteryless boards powered by 12V DC adapters, registering the
> > power supply as BATTERY causes userspace to incorrectly trigger
> > battery power-saving sequences.
> 
> Does battman really offer no way of differentiating whether a battery
> is *actually* present in such cases?
>
> What boards are affected?
>
Currently, batteryless support is only implemented for the
qcs6490-rb3gen2(Kodiak) board.

regards
Rakesh
> Konrad

