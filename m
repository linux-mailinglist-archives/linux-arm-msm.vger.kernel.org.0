Return-Path: <linux-arm-msm+bounces-90847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMunAiTveGkCuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:00:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B84698195
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B928D306AD24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C8733B6CD;
	Tue, 27 Jan 2026 16:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlhWqse7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4CpMS3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B583311946
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533141; cv=none; b=BG+SwszcFvIcr305jc/VPaPbVR2lQmGJFmAnfR1Azd/Eij2fPDyyWkKM+O/UazYYBjzXVTNyX6Bvi/L4tURz8lejl4Y92dqQp+nU4/6TQztdQA+Jz0DGVz4fR4X5oHDy8Nrku+ozB4KZIEYaZWkdV8Dax1JUqQFvQCaVmWdCHwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533141; c=relaxed/simple;
	bh=IGSWwVQk6hK0IjIwxOuBNPQF3TTIg15Mr3FZVcFFot4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IV1BuZIG0sj5ziMLJfEjgFFHsJ1peDssb+n480Orvo5xZdP2ecXVrvFoWe5C6heUtMtd5marWL5jFPmlhxOYk2VWpFq/S2zZK56/MXDvaY5ptB7NxwxntIQltG+c1j3w+N3AY2Hx1kuUs4sPT60YhT0Cg1avnFjfYX0UsI6DNGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlhWqse7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4CpMS3E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA4P7J171390
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k4EOXRWuy4WzdOY2En7DGdc7
	2r/k0PMvyPe7LbbgRbY=; b=AlhWqse7MlJnMFB3sV53eUcF3JNW3WbQODlcygng
	Y9rlEBH8feOSUT0nk8lYu1QvdOxb3OTh85Hk1jmfpXEgcYeTitFL+u/+y86sh1Ke
	q1fq/BuKmkIBsE2R9qvXbuQZ2aSDhPyuwT473L1fK5SRSxLRzbWAHnqxqlGSRhSK
	6gjfNC/9bcy/1ZL1eIUB0OHl4JoMvqbYxIJo1YDwdX+DSK8oLJcPlGQ6Xjd/DHcc
	0vB7VYlPlR2OrG3PdPVeqY0O36ayIaO4wFMfuFGG+pGhvTyOEXX+s/zQ7bh8/u7Y
	7BvCRkvI1Ubq1lCyq4R9qjEleaWbwKITw/JFc/9+OTPPCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a3qq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:58:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70d16d5a9so144382985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769533138; x=1770137938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k4EOXRWuy4WzdOY2En7DGdc72r/k0PMvyPe7LbbgRbY=;
        b=e4CpMS3E+NEbz40SAlrpTwk8v/xEgEQLWmYQH67OJRNAp62BfofZnLllJCceNdUnC8
         HGQw9/9PcD8A2PjyBETgTw8v9vhMjSPupkn4Op8K+9ypGL5TJZFU6a5Ozi4AXDvpWjoF
         oPNDnaDWlDhK3V5D1qat94KAM5UmijFVvwawzixywL0jPnN+Rm3+kwcBENnuTXCoQaah
         KBPAFeecylS5bUnnCyB2m7Et44Ma7h9kMNjoukfblTvaoa5ZeuwVyQXw9u8sia83OLJl
         lCZ9iXJRYU0SdgiRTyEYn2xF77Tko4nv9EKYSkX/8b7RwnNftibZXlaMUYdhJzuiCnP+
         SLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769533138; x=1770137938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4EOXRWuy4WzdOY2En7DGdc72r/k0PMvyPe7LbbgRbY=;
        b=UlCCz5YCEf6kpUY5/5vb3B5fxUeS9n5tz0mnDF7avVACoA0RcPOVOTt3H9AqH9+6Nq
         V29N1+zqu/T80gh0PCFIFBVGH+gQ4p73wB0FYxDQjG1t7oy6UnnA9kwREd3yuEszN9Oz
         VojyPJdmNlk8yoKfWOhkpvV0LnbfkHh1YirCcNz+nlKdQo0lauHRfJjjtHuipawSpTbk
         NSz+VpakkrNKePWTtjXaVJWS+uLVwbo6DbHydwsI7qxKneCAXK5BTTz+nwn6SjkJVwHj
         HWO2aKlDmcnx0oUm46Fj4XZBajy0vuOiub82jWjHfilqmu7E+Kw64ed/PtA/6Z1wl85h
         37FA==
X-Forwarded-Encrypted: i=1; AJvYcCXYGvr9/AVw5NTOj4Z/a/X13lbi7XXYzHFcioJ15yaCnruNW3y48NA4Uzs2o8duP6epvZsMRpFQ3RUNsqnu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf5m7w07LD9XUpDxkSBQw9oP6Iss4tlgAMuZQ5l139Q5ngwZbA
	9xrDFhjJPW0KpjPX1BfrTFqp67R9t95fcSk8+0mT1rMihaVSppnQz5ayfbs79Ilqr+7U8ry78SS
	IJZdnVnpYa9amUwqV7D/9bMVHldc/d8Lx7UkiaBWMCf7V7BTzTFydSfsCPoTiiRs/KIVH
X-Gm-Gg: AZuq6aIoKSJyIDw4CdEy+0UTCeaaabBNzPDfTLHQGhQTo/hI4yoLJItBdnbOGNKMJRx
	GR1N04KYGljviMofVns6OK0tfqYkDBFSnZV4CYb6+29KI6e/XnqUWP0CqaHkv7IXBNbXHyb54nh
	FdLNdxdMnHmk3IvNUzDjRvoBWX5Bn2O9208E8AWrSVr1Aj0Ykfjf0GhFReHgweFRaXvNOFWK0Py
	yl3uxiVtVIpAYJOgYteBDE0JUaSs9tWkAS5sHIwAkVQfi96Q0V8AKZaGwe3aDKxh81GPICQVE2X
	LTYJk0VNiW7eh5AzvUusQQZSMpkJNevby3hk9oOv6NU9phoCZzLjuckLkhIpCQBfa/YVGirjuwc
	PR5DSp80093qgeQiKTsREy/nk+RAfOXQTiELGnyfyW8L9ANw4S/cPJYrd+l7wnwCvIu5mXoVdq/
	1IidTpJ+3JqxWQUMMYDsJ9Mx8=
X-Received: by 2002:a05:620a:4015:b0:8b2:f82f:c630 with SMTP id af79cd13be357-8c70b864814mr301765885a.31.1769533138580;
        Tue, 27 Jan 2026 08:58:58 -0800 (PST)
X-Received: by 2002:a05:620a:4015:b0:8b2:f82f:c630 with SMTP id af79cd13be357-8c70b864814mr301761485a.31.1769533138029;
        Tue, 27 Jan 2026 08:58:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c73b92sm381441fa.16.2026.01.27.08.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:58:57 -0800 (PST)
Date: Tue, 27 Jan 2026 18:58:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <7cfriesyupcm6kmb32ynb6m4zsrkbowfpnpkkhhhxw7dmy56go@cetfuzk6wvlp>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzNyBTYWx0ZWRfXxgISMj2wOUr4
 G46p8veNh7vjF6VN4F5jy1AlpMsBSk4Ny6oMQsMNFD5GcRNsfwhfmRUmm9h6Z3rZrFgL8LsvSi3
 syFmRswu9+5tOcFgOvE6WEG9GQgWFTzmooZFjKrEYdekrrphbcWvbgChLJkXpmSbeqf8ucGxgXT
 C0FkRcuMZibadGBWjTHFUS5mdSlFV3m0KCXVqzHqZbFZGmXSi5Qb3ld5Ybw9WziOfU31uqDcEL2
 IbnJXCl9fZjvM+Ldb/CvvprngWo+1B6drPuvS9GlefbZcUQwmVYkdyG4SUKn4R1FuIm0RJJzw+S
 QsE1TLYaE0GTggs4HxnnUYR9qqGD0IgTUAp7NyFBoE612xE9XXYjSlWAx2jSlpS9iAoX/nQS6Lh
 Ki6UYXmEzUmz5yiRM0ZfbqqcucoeHHnHEieRutixz59+nZ4Q0/L9upHI1QhcbCY4IFdzb2Boc8T
 c+frfc1Pj06w5fAZyHQ==
X-Proofpoint-ORIG-GUID: nCZhliNyvQWBS30oo8-3NMk5ycgotZaT
X-Proofpoint-GUID: nCZhliNyvQWBS30oo8-3NMk5ycgotZaT
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978eed3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=z393bjM37XPXZEtfGisA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90847-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B84698195
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 05:03:24PM +0200, Abel Vesa wrote:
> Add the TCSR clock controller that provides the refclks on Eliza
> platform for PCIe, USB and UFS subsystems.
> 
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   8 +++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/tcsrcc-eliza.c | 144 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 153 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

