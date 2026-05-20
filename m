Return-Path: <linux-arm-msm+bounces-108725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEoTKXGgDWqC0AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:52:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A1458CF67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB87E304AC9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECF82F363F;
	Wed, 20 May 2026 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyCHvUq6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AFB548EE;
	Wed, 20 May 2026 11:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276997; cv=none; b=WNC1IZOFhFxLmA2+4uq+QjwQ6wcVpN21rkty7ynzKf9pg1uslb5HutpTEGX8+tYyWwg3xXjUuVsG7B8ONWxz3AG2AgRJS+AC/RTOkZOzjWsul/Rce4ZpidjXwdPKqBQvVP5O1pfI9vDiiHI3rqJi/qLCuoK83wLYDOkyRRDj/zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276997; c=relaxed/simple;
	bh=pt5s+8VqY9gzjyhGDvxKdUz/CP+gdiVXU9zfBbubgVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz8KOYiWu7rzKtxDt+Vkr9Y7OOW0v4Pt3Mc/E7l0zEulJn2H5prmvicGcIDfJLNMzW1NLeBX0TznCy2BALHn59+cRw6NE6tKDEhVTG8YV56LIuIEck77P3BmQ8WFmVIOZmr975GNb1xo2Ay/YEqJfsVDjIBmCA9zFdKKm4h5PKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyCHvUq6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K8uaZd4115171;
	Wed, 20 May 2026 11:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MaVVDbsg0Qf1q7ZkzeGs0e6M
	s+o5j/imjdgouDQWfhI=; b=LyCHvUq6GXZ5kGYGD2mLYhq0urwUgKA4cyDe45Qa
	Q2H6uetACVOQbnnPSSRPumoWWwM+Dl07RAqt0O+2Hh2eBbfyngfkHMzOclSq4lbm
	XLUnX/eI8NdAOllkXzrq007sJ7Nacu7ASll9yfIGGtA/WwnjUUU+2U/7q8dvZCN2
	YGGu/mlOcoWxl6Ppqu6yaX4UuLgC0yIQpHuy1P0Mc7QQDsdjzr1Jn22uPYM5zQci
	xiEU5qWHn5CM5eYTf5XRcsorqGz7ZYAssMW7DgVRHs0kPnz3Zt070UD4L1rUDFlQ
	NONWL4MFCZCRCTpGvqIA8RSo9PeNsxANpvEAFCa2Eie9TA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0gke0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 11:36:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64KBaS20017167;
	Wed, 20 May 2026 11:36:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4e712fys9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 11:36:28 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64KBaS6i017160;
	Wed, 20 May 2026 11:36:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64KBaSVo017159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 11:36:28 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 94D8CB31; Wed, 20 May 2026 17:06:27 +0530 (+0530)
Date: Wed, 20 May 2026 17:06:27 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 qcom,pm4125-vbus-reg
Message-ID: <20260520113627.mbstqbtdr6hfunwn@hu-kotarake-hyd.qualcomm.com>
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
 <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
 <wobourxqghhmi4htonf2ls24mcaeca7chytmyxihbxokc55cbc@jayo6u2azowq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wobourxqghhmi4htonf2ls24mcaeca7chytmyxihbxokc55cbc@jayo6u2azowq>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: hTFYv9dg0c2zlcN2AoqnMQ_436kw9y1z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDExMiBTYWx0ZWRfX+uuLweIKa9xq
 /Q5N1ThljmLrSN+Wr1M+xqm4et685lO4JKLvuuY3nDD/GEqzxOUy5l2EeZHFI542OHMMAp2ZUsY
 Lh7Qv0KDazWJCUNGsOQLiDA0ZRlHe60MFT2GiOhq9L7aUiF9cQfYwyh79Q+GCGShuq2mFTPEzs1
 H0gRalYgEdMSvFTy31DNrNBVMNUmdnYt3MSSUSNw3pKCpu0QE8Lrf6+f0xALMjaIQhgGqoepODH
 BzWU8jSCQkqvnwnovjeiek/AcxWibxnE2nIAIJ/85GriMxuvV2vJN/TNEwOOrcOSknF9FIl179A
 K4mqTKdM5pNirhY/wT0V6HTu66re+Kmn+5H4FCAbzFaL94/ob7SN7IOAMyKtNsLSwLvbRtm1M+y
 m/S+K7xF+fzrUjd+4R44F1se7kT2RQz9XBf78V2eJm9uDlTGDz0GqSjCPvIfeIPzYw2nRpnrDln
 gw/G+LUpwPR0d9Hz5iw==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0d9cc0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=vsn15EuVot32RTnektwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: hTFYv9dg0c2zlcN2AoqnMQ_436kw9y1z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-108725-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,hu-kotarake-hyd.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 50A1458CF67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:58:35PM +0300, Dmitry Baryshkov wrote:
> On Wed, May 20, 2026 at 02:37:11PM +0530, Rakesh Kota wrote:
> > The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
> > It uses a 2-bit VBOOST voltage selector supporting output voltages of
> > 4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.
> 
> Is it only PM4125? What about other PMICs which have the VBUS regulator
> (e.g. PMI632)?
>
Yes, this change is specific to PM4125. I have verified that PM6150,
PM7250B, and PMI632 all use the same register offsets (0x40, 0x52
and 0x53) as PM8150B, so no changes are required for those PMICs.

regards
Rakesh
> > 
> > Move qcom,pm4125-vbus-reg from the pm8150b fallback items list into the
> > standalone enum since the driver handles it with its own match-data and
> > register layout.
> > 
> > Make regulator-min/max-microamp conditional so they are only required
> > for current-limit variants (pm8150b, pm6150, pm7250b, pmi632). Add an
> > if/then condition for qcom,pm4125-vbus-reg requiring regulator-min/
> > max-microvolt instead, and update the pm4125 example accordingly.
> > 
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > ---
> >  .../regulator/qcom,usb-vbus-regulator.yaml         | 50 +++++++++++++++++++---
> >  1 file changed, 45 insertions(+), 5 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry

