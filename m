Return-Path: <linux-arm-msm+bounces-97121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBpMDOstsmmzJQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:07:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DB326C99D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 566B93118E89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32165383C75;
	Thu, 12 Mar 2026 03:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I52ktKnm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGa24s1T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DBB383C71
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773284781; cv=none; b=SKxe4B09O6ivwcnjlevwyIVprZInTrfczT2LSYDHTWYwvsBy2uUJbHC5JEw5pp5aPTgPiu/e19w27KiMdDApKY7jrOhnEAbn1EC7KfvUX1zhLGKP0Qi8JQEiGb7281jBSTyRJTQr6L5ueePe1v4HQkQ0sIZpa5Zr21uHE4w+Udc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773284781; c=relaxed/simple;
	bh=X9Uzj6IB5q588CGfX/J/JFYkaz4u2Jf8rdNseNoUpOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJ/zy3WG8EgoOYPXI2+kjX449jan+5Z08HWWo9S6uXHpnV6w/GA1T/EO2oiFEYac3asmpKuwj52r7BVM1myfQMYx0ymmlhFtbJ6VhvrEykUXe8Smc1Q8+/D44HP5+cVS2KThJWpRpH6tW29GM6TAGgkZEc7px3fJod/j8W96qoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I52ktKnm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGa24s1T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C2btK51740616
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5fc9ybXJnbqVOuZgVKyeuuj+
	QV9yiXp/QFIk1UCejt4=; b=I52ktKnmfFoX8h3Up8zGSM/726EwugHBp2Ssa+1u
	2XhdafwvkBNOQyhpqhLeILMxU3EH/Q6jOeHGqmqybJ4nhy8XT50cvKblH4NBcJH/
	TPS3GlxITCPRz6xh1lJRHgClkxTMSX0joSjn2h3XGGbHEbGO04zVIzG7qVf9y67a
	3YHYN2x4qJ3PtqjBBNnr58AOE+zCI2TDzMABw0I87KCeuEpL4BBpqpHTFcJLiBAT
	3TLG6NTQRMSWOMBQS10/rDjdGCtvuK2MzoV77uYS45Xma9Ad70MgiBN0FBh+kZI8
	6rLztoaW/yN85BRuMSlGihOAELwxpQgYh4Hbua9gDI7ddA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdg2cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:06:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd858e8709so665314585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773284777; x=1773889577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5fc9ybXJnbqVOuZgVKyeuuj+QV9yiXp/QFIk1UCejt4=;
        b=OGa24s1TuFlMxVdOCVCgB01Zm6qypXQTnEehBRfy/sJ2n5mHXPFf0pJcr0IdOBtte1
         tXVf+tyE7mkLh+4XzlTD8R7RaDG2CPBbc8VoymFYPJVfYYHZzIetF3Q5FNHbOWpyWphP
         wl2k11JyUQ2qalCFYY19eczQnwK8hKezbf11IFxfKE1nFqFeQPNWM5jqX0lCiyl3bE4m
         3AloGXWM2izu/d/Ltroatpm4v2HBZ7I2G9nAkIhGdcdPsSDn+5OUvDJK2n7O3RuiKHRp
         OveS3EJAc7+UtknnaoBQIMuqpi+rycPRFvu5iTC0iC7y0Eh11RY69glOEBeVjoFJ6WjU
         +JeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773284777; x=1773889577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fc9ybXJnbqVOuZgVKyeuuj+QV9yiXp/QFIk1UCejt4=;
        b=H3WBCsJXXmNtETzyspphTHQ9JSlMuO/FI22I6yMZQ6AEojFJqgrHwaz37i+QI2pypc
         O9peP81sNCg9ZWENhSDDAHDXksMWCylbSVoiP04RoQXLF3z2LA5KpsHiTYTO52u1mVHo
         78SJx0n1RLZlzVM4/yOxcC+BHJghgmvg+23oQpvWDLshEjzMnGXZRt5KLKMaoZRJMu9b
         4y2ccaEZ/IMUVPvj9gKxrHOpgDhC5SX6KnJ/WHHjOD+/wVWZKyxzVH4SMFYXAbeulDHN
         93RbpXRREb8uSxIN5BPMtGGEJNzVKu4ZktekLbF/AxtTisM+2BWmPShuBN7HfgNzpREH
         RSKw==
X-Forwarded-Encrypted: i=1; AJvYcCVkbK4aFczrizwxh9IIiHqGSl5wYr4RsPAF/o4b8rJInrIx4L8ijjU5GoJ1tzTndSCNfPC9XZP7WFxnLror@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ911SwB+CiCljOD56BjrbqsHXr6n1uxlVCSpW36vL70bKiI/M
	ShqGagzoUWE7+kbZzs46ibfpQLDmVdLNAkImW/EcPf5LA9fLRCMgAzHJ4v26Fe3EQlnTx49o9pl
	4rZTtderSsqFmNLIcIAcPo+xJkU9TWf90nAfB5vBhr25T+d+94uWMF8PwuQXIgH1YpbX2
X-Gm-Gg: ATEYQzyuJsXDuZl17yzyBfgI3TjIPrJb8fN7zbkND14pJqzxNPMjwUptRkbPyNSQJnl
	S/1uz5XOoTgWSqGGp07dj/HBKf4q5j3ex86E3kVtbggcCan8S6csl9xtrv2M42sxciVSMUczjC2
	xLqfurPEyGnjvoTATp5KqDxHYreUHm+zn8067yrCjGXjOFvdvkg1RW6oFluSQFsWMn+8JQ6/YLp
	Qc6XT1bR6nhKAY9u9fOaiR0w0+M69vQDSAi79qAQN3zN0pH6HgRG7dOKflVRfMayxN7kqUguFcJ
	AWpZ16mt2vmGAQTrB/NKGcQz1Lrx3dZFEKnbBA40iTME+fNZYJp9kKVE9xYL8BsVSvXK6DELyKU
	LWY+//NeiEkYRjQw+DzrBja8VR/INAtK/icT8y89VdBlHOmJqsSq7d511kagHDbUz7I1PBMDP92
	HW/oaNleIQ3tQwAt1Yn+nOevR8JGERSnI551I=
X-Received: by 2002:a05:620a:4450:b0:8cd:8025:4e76 with SMTP id af79cd13be357-8cda1a118fcmr644456485a.35.1773284776702;
        Wed, 11 Mar 2026 20:06:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4450:b0:8cd:8025:4e76 with SMTP id af79cd13be357-8cda1a118fcmr644453785a.35.1773284776235;
        Wed, 11 Mar 2026 20:06:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f353e1sm672389e87.10.2026.03.11.20.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:06:13 -0700 (PDT)
Date: Thu, 12 Mar 2026 05:06:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: disable WCN6750 and WPSS
Message-ID: <rzd4bcug3hooaf73fs2hn6pgoam3zjr6jptp3ltgz2mrhjtmx4@oicwrntb2j6k>
References: <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
 <20260311070408.2287889-1-hangtian.zhu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311070408.2287889-1-hangtian.zhu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMSBTYWx0ZWRfX5FHNLgtuLgkl
 AvTcvSVsTPBtcaV1ySKUy62iZtT8JKEgH/GR07/3LY2gudBUgVQIaZs4hGN+Mv7+qsMTjVhJkkG
 s89nEXrNIpe8JINa1XYU5dbqX3mNqTgth577rd+8SqsZ73Vm/2p5U4wNHNxA07xvjW53fD05KRV
 pOR2Cj6ql+2o0XL7CDK7+Ge9M8iGf2pd9zfB+u9Ol/urDm94ENKFpqpcVKI1sey5nTLEpBolzzP
 Khe88m0Ino8oXJupoXSRMxbhUS/oGsZBFQgxgTIaLyGms0jIR7GQzvYsBJ0jI9yd+u+MT6h+gcB
 v4zQD5irPiaoq8U8FFKWAYOm9Kwu75xOJRSDbJEeKGbi2xctC1YoQfU6Ta/MppMGCug/BmCb5VC
 pQu9ChrT9sMIKwZiHT35CeCtqNLkDgZPrjADMF+64l5r0iXPXmA1lB/XoeZinTecbaa1odXXOV5
 tO8zGLdbEulsYwyT86Q==
X-Proofpoint-GUID: QYcTtZxqpcBW1O120lMqqjmyCZt4qnra
X-Proofpoint-ORIG-GUID: QYcTtZxqpcBW1O120lMqqjmyCZt4qnra
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b22daa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OKcc8udheNl06MO-kLYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120021
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97121-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8DB326C99D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:04:08PM +0800, Hangtian Zhu wrote:
> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
> 
> Disable WCN6750 and WPSS on industrial mezzanine. On RB3 Gen2 industrial
> mezzanine platform, PCIe0 lines are moved from WCN6750 to TC9563 pcie
> bridge. Hence disable WPSS and WCN6750 nodes for industrial mezzanine
> platform.

This didn't really improve.

> 
> Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
> ---
> This patch depends on:
> [PATCH v4 2/2] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1
> https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com/
> 
> Changes in v3:
> - Commit message changes, move Depends-on from commit message to
> cover-letter.
> - Introduce the PCIe architecture of RB3 Gen2 iindustrial mezzanine in
> the cover letter.

There is no cover letter. Also please read
Documentation/process/submitting-patches.rst and stop sending new
versions as replies to the old versions.

> - Link to v2: https://lore.kernel.org/all/20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com/
> 
> Changes in v2:
> - Commit message changes, change rb3gen2 to RB3 Gen2; wcn6750 to
> WCN6750; wpss to WPSS etc.
> - Link to v1: https://lore.kernel.org/all/20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com/
> ---
>  .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

-- 
With best wishes
Dmitry

