Return-Path: <linux-arm-msm+bounces-111586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f3a5EITFJWqhLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 21:24:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D1365159B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 21:24:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QNlhldtX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PDvlCJo0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111586-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111586-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDCA030073F2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 19:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7498322527;
	Sun,  7 Jun 2026 19:24:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8133C17A2FC
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 19:24:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780860288; cv=none; b=B4+JRXJdD7E3zs3coRHeZ0Wpb+zt2lNQb9nIj/PKz5BnuDsOC6wRwewq1ViksOwX/sVJoykKfXpCimsB/M+befUZo+v+reN70YggbEJ5YvX5Ix+d1MeHQ6hoF3CwotJra4YjX6X5GhpC6CmKPzFrmcvFoXrq2e8vzMyDxvy19qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780860288; c=relaxed/simple;
	bh=uiZtP7SoGdmYWA+GnOlsHSRwOZzXjk9fopH0g7UL1V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXXq7NuzXHrFjRwWgwvjLC6ovOPcrE7MaQzz7dYcyfN9R5ox2GfvCQO7iLkS+A6G96TaAp2ard1G6DYEkLvqxcdOa2XH1XCNiSLo9GnMgEMhNAmOWD4JOLDG1VjBap1TCYhvbSFui38WfZDT1SHkSKP0xepSr7HDL46IEbXaspk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNlhldtX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDvlCJo0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657IIKFv1219810
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 19:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z1CKRv1lstnUT0kv9ube8Zp6
	dPQ8k4opd+3LtWXGqzc=; b=QNlhldtXJ0Xipzb+Bdrj+jsdRz5swXPXWySMAcgx
	DXPihSJ8PKjyFiryLodF1fhxnWKX7Q+ir92YJUV4OdhiOw4JGZQ4dhmlwniJtLH/
	rLbdHMlCkLQS8ZEKzUgSU0zyD4k/nSr0dZR1y5DUzjh3gi9VJIHhWG0hE33I/H9M
	a9NWiLutRcMLefALaEI6bnWSlviJNu/two6W33xxA4w227jvXV3hcZw8QfhOE4V5
	6RmLjMPPn3rQtsQl9Jk1EbiFtkHRKH5nV+O7og2CeNxcJ1Cjy5EE7/OUjHRnzeKP
	UsX+bVdi+vhC8BaTG3da7eLTIInXfU+O1puqfnHhGJfVlA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf4sdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 19:24:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59ebf600cf4so6796843e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 12:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780860285; x=1781465085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z1CKRv1lstnUT0kv9ube8Zp6dPQ8k4opd+3LtWXGqzc=;
        b=PDvlCJo0oBnEUQ0FgDwFNr2VWP20ru5nPbxKpkFBEnqXeevRXDN+B93iIUoNIfPCYL
         M11Jd8Ukpekg7iMLHW4ea3X+r5IQcXqp2hxcAEut6OF8/UOhi8MAJO/WcTVlgG9h6ZOV
         ysj4xrS5rMNVy072Gt3K0e2+rWB2dFPNK4rzDOHiJWF3BDWi4UKVLH1QwhfOQ5IZ6n41
         CopCQ1jLi8OGf/NSzFN6DycwDzZ9uohzr6fT69iDc98qwztrczdwoiacGoxNFwnqm6ML
         yHoxhRjAmy57SXpxpjU6ovonH51qvBnwPZGe4ZzQpsEq1a+G4MVfcX7EKa+/+JYEsKkf
         A2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780860285; x=1781465085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1CKRv1lstnUT0kv9ube8Zp6dPQ8k4opd+3LtWXGqzc=;
        b=Y/2uzs9buv3Hwdrmt+6KEOXO8r3HSb1OgY6IOWD3hjWWDm1CVBViFNBuqWgIbNntAg
         eHrdyMv76DCrUDaAWN0OIV+93RFoCt1oiewvdV9kDa/5L55sAXMBr0Ypwvi89KrLKxB5
         hMUfztPsHdKEOal6m4W2O2v8ypeT/gSkFW22wPLweCt0OLyNXRUq8yDudgEdmsPAkteX
         NPT3PSsOzPk+zk/d/ZxBNILP7FMXFahaWz2Zk9TPiI9JRCfmGH9xDIu635lj5wXCcols
         aSQxX1wao5/sFlz2w7ljQu6ufeLMDg8FuL1ehUxhwgtMQKSgFdO06+lZX+s1VNFigy7h
         M4hw==
X-Forwarded-Encrypted: i=1; AFNElJ+tTEbw6WO0qSOBDi466Q6eBZvBBr/i43vAlspoJOzKi0XRYQuSgpzOPSsONfPsKQtIvgZ94Fh4beDGWFhR@vger.kernel.org
X-Gm-Message-State: AOJu0YyALuQd00WIqbDG9byU9RYtSQpREoX4XuJ+3WKkKsljyadHIuqx
	PLl/5yULxvcM8FG8vm9vvH0DJoaF+n/zpsZ+2XkkWeOGt6GWhtm6n26Ui5JFzM/YCJSU1k3M9nB
	dQ6/yGwqJaBx67iw4Aponb27kKUMzb37AHsLmm5AVxD20+CQFb3yH8gtkkaYAtCC9VsBw
X-Gm-Gg: Acq92OF+wT5Bl/nOMhc6jNKxyNlzXsVFCMOqEvW866twhZT5uZg32jgARkXDBoyxfD7
	pRp9pxDbzrSc4sWqCbGKEGhcftATajjx46T4Txjzpdj74nxXnvH4OXdPyueudaoKUdAUzU43W6C
	AxpJ/GMaNY1VdF/m29WxX6BkAT3FtJzIYpslC7FIXGHCornhXCQ1TTrxTFnwAX9vB6rq6aC708D
	iy+XlhZjXN6GKJrJqIE6WX0O23BIw0zBQxRNMATmvywjNpg/r6AK4DpdOXcU60bakTOuQCeRIhK
	o20mJ0rI8x5SwHrHqGGzub9c6QATS7Xpk4iNW4nvQnqVGuIyVtOF6tC4HP/mYS+31Et3mSaPsO/
	DsUXs6Zq6WeJip+dB1h+SZVU3/8sGLwc7X/evedRo9y9NtO+XNdvhnEAOB1MPTqFQa2m55V+5rv
	6tljfz55V22ZJ25tbf3P1SW87Qu7Nrd7VqMulpuDGwWhZWZQ==
X-Received: by 2002:a05:6122:8296:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-5ac4e7acf3cmr5447708e0c.7.1780860284914;
        Sun, 07 Jun 2026 12:24:44 -0700 (PDT)
X-Received: by 2002:a05:6122:8296:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-5ac4e7acf3cmr5447701e0c.7.1780860284541;
        Sun, 07 Jun 2026 12:24:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed718sm3199990e87.14.2026.06.07.12.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 12:24:43 -0700 (PDT)
Date: Sun, 7 Jun 2026 22:24:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: Remove the
 little/big_cpu_sleep_0 idle states
Message-ID: <qlraiygk7tcq5xvdxwp5ijfffhmn4akza237lij4xf65fmc3dj@33yozanoe4rk>
References: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
 <20260522-ml_cpuidle-v1-1-fd311cf33fb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-ml_cpuidle-v1-1-fd311cf33fb4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a25c57d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=FdeHW23CIx2ZWAafQ3IA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: uucPAQik11tYpGCBNEKM9MGKwAVukqE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE5NCBTYWx0ZWRfXxN2qQinSm8Ua
 xryelkh/5ebl3CmQ9AdrNS20e+mBMu3gEIBqA6b/pGE5id+WS3ce0+NbMUMnTPQBDjwuhh/ZpPT
 WNRRXdmZwdQh2MH/5XSlWMJzgcC8abOUjVuSrX8LqeZEam/TgQqU6eHl3GyF4M2lvL4b3VYBf8O
 uvpLjLtErlHIJ8YYZkLp2Ml2OrNIz1NhAEhxQ7ZxDMN7H3q0Lwq8K7DZVmldBXxRf4viMwCok08
 xSh1Y4VYaSESK2b8P0Zk9NYSmzk7VRKIPIhhCkVKnT3iIpFgI9MmHbllwYC58u6lq5cS9ETLMf2
 9REOOOCmRUDZUGekrJ2G7Vey4uH9se91QBzFhDYlV+BFbPYH4/3zlgQS/On0GftqZygercmfK2X
 IfxevYAz1lvhBfW3YkwF41obdfMttoYi+csVyQs2GAmzZmd4/xqoKPUYCbaDoNxGjgKgn2QMy9s
 c0b74mop/znNx4i9wbQ==
X-Proofpoint-GUID: uucPAQik11tYpGCBNEKM9MGKwAVukqE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111586-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:navya.malempati@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2D1365159B

On Fri, May 22, 2026 at 04:40:13PM +0530, Navya Malempati wrote:
> Firmware supports both CPU power collapse (little/big_cpu_sleep_0) and
> CPU PLL/rail power collapse (little/big_cpu_sleep_1) idle states.
> However, CPU power collapse modes are often not utilized in favor of
> performance, so remove the CPU power collapse modes for monaco,

They are not used now. Will they be used if the cpuidle governor is
changed? If they are valid from the hardware point of view, why do you
want to remove them?

> aligning with SM8350/SM8450/SM8550/SM8650.
> 
> Rename little/big_cpu_sleep_1 as little/big_cpu_sleep_0 since it is now
> the only CPU idle state in use.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 36 ++++++++----------------------------
>  1 file changed, 8 insertions(+), 28 deletions(-)
> 

-- 
With best wishes
Dmitry

