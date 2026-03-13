Return-Path: <linux-arm-msm+bounces-97561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMnIHWoztGn4igAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:55:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E55822866CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0476E30C2589
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E80635F60C;
	Fri, 13 Mar 2026 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4y4nTn6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxyO68du"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372CB35E920
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416988; cv=none; b=kNPR1JOZUCHplDZHS5AR2FGzRyW4WmJElbHBNOn89g8puz/UkwHihi+an4ymvipOqVaultXOlxbGy9grWH+a1Zk65h1uhoaNH01hNIH2gNn19FLGC3T02TULvoviKDeZF/LtHgD9IFH/YnYKJrrvG63Tj0lEpB6+aP9QJ2NBfYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416988; c=relaxed/simple;
	bh=LNF/ulUaaW5dO4IEer3wHJzBNsU0mMg2Wob8qkOhPIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiUlRifZ1p4c8C1LR9ayQFO7dO5nTEv+KhCFnvJ8LArHe6larzobwkfyZSxZRl8YWelc3VBBAAANDZ9mN2ulyo4duo5jUzzxFmTNtPs4kQAICGOEi+dCX4qRePmS0ZL1j00sTxNxYQrSOsZOtpMaWj1ekhxqSxegD4Q+UzAxoug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4y4nTn6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxyO68du; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA83TZ1749335
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ngjNSuCvttZ3xvrVRmeGzmNn
	u0ReudBP3SkdJ0pWCZ4=; b=B4y4nTn619mJ4MN0GVjX8n4jFtocDCfemyoJ7xnU
	4tk6yeltK0PgZYzx2nSEm9uUr+o3oMvk5Zi4hvNrIBjUniACDNBi+sgY4Ejr+SJe
	uvfsh2ihE3aRS0yNMhHrq/OFh7l+fH/0+hEHd+5BkfLC1CyKXMph1/yDImsJDZ6y
	bVyi6kCjlS8P2Ht/whee79nsrZ/+9rvb8VvG+i3GagZ5j5ieS594k83Vvgl4xPFd
	5wKLJgz4B2PI/s2fbxXLAOAiOsrgcydrJgwRWosUgmhxsZR4A83MdeQWdfsyVurP
	PbHYDD8CgVJH1irJKb+wwmtPSXVjZ9XoZPisf85/1MoIKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6h4e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:49:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd722c1a69so1364683685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416984; x=1774021784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ngjNSuCvttZ3xvrVRmeGzmNnu0ReudBP3SkdJ0pWCZ4=;
        b=NxyO68duXuU/ay89eTVemSZve+ynXislPX26yChfBsDwwncyHfxcBRFmiQTVuaIwCv
         6CLRnZubh13joZAM/VFoxlfqfdC5DejcD3laZX2pSFuU+PgC85ZJHNiNF9Ox0Ck9pAPR
         yFV27NxuULSGWhNt5J1tYS3tWEQfkLUpb2KRYRkbvXPB41yc/Vokivf5YewCguDIWErI
         3MbEOSfamdkz0BsFKFlObk1kH8ciatCiEQqJZNeKY0DI3DbGJsP83ItdJMuu/+LFOAvj
         4KLjV1hMmCRKZBnpybilrIKbaTLZ4vmRplfzWy6mqmVDPSPwmMar1gBZCdmYss2l8RI1
         HHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416984; x=1774021784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngjNSuCvttZ3xvrVRmeGzmNnu0ReudBP3SkdJ0pWCZ4=;
        b=KMCCIIf1/rgFrli+d8m6o9ukobRsoM3J3SSW/nwUSAQwMiwLv0rgR/cmFojbs4MutK
         5DDCakRGmQsscoJqv2U6PCehrWUFF2vDwNEPVhWWpDC16pWtVc2pmcfwxyCVkae4VmLV
         +AN6quqtJ2lm0TAL2GMf2aW/a6kYuAO48nr2i6LzHDdAuevzWzHHapjLmFCEkK6yB5KU
         EBf15NpfRzzEFEWTAOX3+Nhi+RFvZTPbGsAxBtZc+gprXJeLXq5WDlNdvT/luAd9npWV
         IFAb5pZMddPGhgaqfbhPwTVJNKFiVgxMxUIU7Ditw6rb4MU94N3+vgPaYb6FYs8CPkOn
         cuXw==
X-Forwarded-Encrypted: i=1; AJvYcCXr9zGfIJdKm+5+RevGlIPmSV++GLKlcbNIXxb4lArbMcU/sw1T2kGhW3ru3Iq1Wirwg3AaK+LBmOmO84V9@vger.kernel.org
X-Gm-Message-State: AOJu0YxQVuphbnerUMZklKn/us1p69IWjtp1YTY4Yl5xSZNLZnuBK+X9
	3pGq4lAgtlpp/8aimYOQt/3dBa2+4HyJ7XmiIYliABIfTLiwnikDRIlJbcaq/ywfcyRcj0vFpA3
	Q5oY9bRCmQazYD1fbjZ4nllTK+cFCvUFhE3xEo8PcGYoTA7hHf+SwkXNT/8TrqTDlhFtsO7g4Kl
	Hc
X-Gm-Gg: ATEYQzxgzltIMdNeHGtT6B9w2dOHVhiuYZCN2xPp1kfsKRIJFm0+uKEmhT3AhfdeLsz
	Vs60SooZeQr0yw/oln1nVs4gQylw2rYlOuDHQSEQ+w6hmRZdGc8mYqEwNq9CvaJO7VUeWUgWWu/
	of0Ai/6SepsksU3C8tmFVqjONXqHjs+OFhoXzEzK7+jQs4BsdjZ2HVaZiMcpvoH60hTTe2xfult
	g2E3qI4TJC73pNFAYgjzWtiVVlKff09yJsUotx0/tHYKTO1N64V7bcyC6HlPFlQWgiePa9axaAx
	7amkM1dLyjSOTrk3hlN37mSh5YwVwQAmLpV5VnMOFOxzGtbH3eN/tva4BFvdC+KWpOyOPTjx9Ds
	zbLvgfdamveohgDFyryvYhYRv/QcrBkOLmSTqMhnM4TLWBwsMWtn1rVYQ8g6m6NYhi/VjYdzRDx
	QMEnq01Dw2ZduJ92dRjiZDJKEUEctpG6n2KRk=
X-Received: by 2002:a05:620a:470c:b0:8c7:177f:cc1c with SMTP id af79cd13be357-8cdb5a060acmr531249485a.16.1773416984202;
        Fri, 13 Mar 2026 08:49:44 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:8c7:177f:cc1c with SMTP id af79cd13be357-8cdb5a060acmr531244985a.16.1773416983767;
        Fri, 13 Mar 2026 08:49:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15981e963sm1198655e87.64.2026.03.13.08.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:49:42 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:49:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Message-ID: <dexkqry7yafuhtfemv44r6g34iekldklhvq5t7n5koktfgibi4@w7jqs6wsxgxu>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-3-ca9d0efd62aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-3-ca9d0efd62aa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNiBTYWx0ZWRfXzNA1FSfVHygB
 p3eRvX4jIawbA4s5UDbQ5JaKOZpueYvHQlwpI0l42RWGSWo+FFt7DTGOfk92uLlq+doQpsJJjLL
 BIZ0mvewO06urHSd7D8JZ2MW9Gr9rzBEIScS/2ZgHS/fywPbKA/Tvc0bWbxp0QVvKMNXARoHABQ
 xfp9Qq0nWIpWtsrzzCLt/IsW1mypjp7PM4ERCv8qIgaSsSytCbfND4ey6uSCF7opygNjWekGAvB
 ePn3jo6CWDp9BcGgFpjw4OvSdJVAMQAYVZ6bFnSzYa0wpca6jvw8iPoQ+YC2Ce5kQm9Uc/bUriS
 OG1FXVNvJEqeGltklEoGN2WhqZQA2doV5iOAbukO56NwU+3Lzunjy4h9k17eF1IE+I3P3Wevvls
 vp6t9dgsDb3PzSAHBCtm43/dZVoC2WckqIbJMLKSa/S6VfyJ4h1lX+SyzbEigcFv+bpgnYnQSnJ
 9RxPfF0+o5SdWLQlCfg==
X-Proofpoint-GUID: X56iwQjrQzyy_CKNzPMqUP_JtfA3HZba
X-Proofpoint-ORIG-GUID: X56iwQjrQzyy_CKNzPMqUP_JtfA3HZba
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b43219 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BYiauv21-j_JhOubGf8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130126
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97561-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E55822866CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 03:59:53PM +0530, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Glymur CRDs which adds fan control,
> temperature sensors, access to EC state changes through SCI events
> and suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

