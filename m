Return-Path: <linux-arm-msm+bounces-101043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKg/E6ewy2kpKAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:31:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCFB368CF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75BFE300C03C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64AB3AB288;
	Tue, 31 Mar 2026 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="btbVOGuA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNs9RmNl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5867D3B8945
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956289; cv=none; b=sJA1hT+a3RGcP6556TNLZ0JFAvABAREm93PJAZyRJ4eIFb43kuFxOBiIxH+jLYrWqKALzI4KwKABvz3oIKVOF6fV4IcoC0G1Q84AZPay1SAxnjFwKx7ErIF4yUziB+2TPSRxQZxLATq/UpaxbQcMwTQ5ATzz6isZecxVf+VhwIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956289; c=relaxed/simple;
	bh=F6z1cUw1BtnePPCiEn3vS3yiPviJGMnGY+6PseBu99c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7ZXbE5ofkop1OBc0MJkXuljKlbIXB3BoYvNeNTvTUO158hAxA6aphmOtL1nJB6DxV4LdPdD0rqgTFOcq25YbmDcjpJF1DocUgvbFMYQccmT5IpOz2D4ByIikFW3JoO6LQLyKIzedLSGbb0TdyagnffuBOQ4vK4V3MVpVj8ut3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btbVOGuA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNs9RmNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5jVnF2408305
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dqtid6UrRWBrpGRwZVlaNZef
	/iKsfpp16fck3/9FjQs=; b=btbVOGuAQ/jdhY6hKMTY+w6+qfA3gUvuZTBvbtnK
	rRq0IS9xTBnlmOT1ET4nnIKB4ISpfqFLKejmWHLRy+/p9U4GLk6rzwCg/72uA0J+
	KQCoK/nhS3xJTye4fVue6Wh41IUxAarVM+1d3sL7fbWCyhgq7mGn61GX+uolws54
	XOENkTDdAPlPQ0NditPjsgEkfsExDyf2rRjdUHbNV+sP4LAplLSqyWQJvne0DW0L
	pE63LhAHSxz3qnglitEY+5ecyRJ4fB5i35yUNEnnc7ki2uSZoD3rZN0aS2UK1vJi
	fjWJXPpM5/NmtVQ9nGeN9UOjs1uGapQXJopZ5ovM7MvB/A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80hettk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:24:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-128edc72e5bso938370c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774956286; x=1775561086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dqtid6UrRWBrpGRwZVlaNZef/iKsfpp16fck3/9FjQs=;
        b=YNs9RmNlqA8u/bsfbh3ozXzPM16azPosUHZ9juIfy/7669+CjF/rjl4gQqC66RuIsq
         UkNT8WJre9ozUfw9FUuye8TLsRgkg6SJKXHMI7oDoEj6NbpmKnxnuVSPNXMuUMtulpfW
         RoXyBWJqj9/B+iEWDZjn6h7Nz/kese9OO0t19NClKUOoAsXQlhRey+QhoYCW1EYeCCNN
         yhKrkRaUAWMA7entRMczvbD/Rohri/nVIJxVao+5KHIszN2fUSh1nD1itACmn3UkH+pk
         mUT97bH2EiA5E1QGAclUz2qPjZ1K5TUNf6n2AiNkBw4PmtATlgeYsOMLzUg6LvCwYCXN
         wA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956286; x=1775561086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqtid6UrRWBrpGRwZVlaNZef/iKsfpp16fck3/9FjQs=;
        b=LJk1YUGif9bZllnifpCRgfG27Eictpe5C2tmKdQdXmRXLSyYMcNS/AwtiNvTgYRi2C
         WHOVUVXkr9DKvl99ai3wU0HhsiG0Lp5sZh8WncH3QdNJSiljgaWB0S5kG2Up6x/+K7HD
         n+30A2uJYZl7uwmgUvvUSSHVwqMIARNOpjkB0tYf/VVwsRCDZeRbb/LbKv7STj2ysnYw
         Ze9CNvFZGd4dzuPvXmy6bwIZpdRe7LiByoubI/C9b+7iM7wuO1IAhLzJUkhJ0npBLzOA
         ppVgiUXZtzrRCpF3V3G/UBElJtjcg00ymQZICCE4e3aDn3S3gnfuiY0fD5kPwZQhPfur
         FxlA==
X-Forwarded-Encrypted: i=1; AJvYcCUiu3OslwyD9G9bLY/ONkRAZoR13coDPTDIReowgxBfp/WPTEHFvp9o8atxz4OSdUyzihsT3SSqJb2/bBhW@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqGRENaQ9u1UT8bJA7RdZ3fT3dqElJ/UWfzVcLqdi0ipHfiyk
	E88pbANnUxz80cqK9He2vpvtJnKSjAacij58DVr3tpuygn5CT+l9BXw54ywbnOOHPrt72UZqZLf
	AoYJc4ScCqhzP7kxxrmxrnOpd5ZqC9dS2xG6Z4i8esjhbgFVdGgkxpVld30L78gPCgBaV
X-Gm-Gg: ATEYQzzX2gk8YZRgSS3P7q11NK7O0j1MVyJatdYtQTWmGXKGMMrPpvO/dqwe8a+tikz
	izpt/QRrC5t7DVG7X3Jb6KR6i/fanRcXiDQxS6x2A8nD/CvlaJo0g2CP3ZmGXamsfbb/jz1e+Xd
	9IWHRZ0qikqDgmRzJ9IysX1awaSPYCAZWJTYeuw6DKRMRHyjBKR9fZ5R1dQtMqfKUtnfBRc3Rcq
	A5RmdJQ3qU8kz7BGeSUDe8srOBt6HwRhSLVGPyt+fgJ+zR7IeuT7Cjl0fnoQcp+xwjmpp3BoTLv
	8iJgTJF2NC0Emc+NKW6k6dDNELn+q8MwfBp7/OMdQ4AuEEFU5GZ9QrVHaRINPPQoBZUAKnJLj3G
	uEsX3mgyJjvSOTcMru5YVxqf3Ue6/jZjXXsn1KYSAOmC5LQJfWZxDHweUWA5hfV/O
X-Received: by 2002:a05:7022:f8b:b0:128:cf5c:5357 with SMTP id a92af1059eb24-12ab28a1affmr8351574c88.2.1774956286295;
        Tue, 31 Mar 2026 04:24:46 -0700 (PDT)
X-Received: by 2002:a05:7022:f8b:b0:128:cf5c:5357 with SMTP id a92af1059eb24-12ab28a1affmr8351550c88.2.1774956285542;
        Tue, 31 Mar 2026 04:24:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab970da7fsm10762296c88.0.2026.03.31.04.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:24:45 -0700 (PDT)
Date: Tue, 31 Mar 2026 19:24:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 0/6] phy: qcom-qmp: Clean up QSERDES COM and TXRX
 register headers
Message-ID: <acuu90Ri_cchEndZ@QCOM-aGQu4IUr3Y>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cbaeff cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Ar2u1bqxPTf9_ue8risA:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: uJlJQoGZHsILCmdNeOsIWt9gWjFj4dkN
X-Proofpoint-ORIG-GUID: uJlJQoGZHsILCmdNeOsIWt9gWjFj4dkN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwOCBTYWx0ZWRfXwfhqyLPA3tSZ
 NAOlWJ7/eK8s7XWG9tjRfgH7c2Y14W5cGEUM0y8rUNnQl0fiF8cxdnq5jmUUoLuvavjsAspHN6V
 qoosy21ycUcMG+aOsWMg/JCP291pDwRzmTnmA5WWnxNj4PnnpSQTCxfUiX6jwSgprZnVx/KfDtE
 kQ5HztjsCbE9Wo+MCA8BW3BIgXDSf37K7rI+Z7468eEta/u2IZcTWzf4+EP8J3MwPpMDuMW/mKL
 POa35paXctEfuaRJ1maDRmzVoJSVCwg3osVp0Z3qdN1hLbTK0gO5RVkrz9BQD8VYssmC4MSwiiL
 +eXpyQhwUVnYnq2JzL1h5N0hrw0bCjjTzTX7C+z6dOIMMInquqO9higC0ZN2+T93lYtNOGgSZqy
 0CSZGLiD++bqPMESJ2tqUiqVgS2fggJF5XTtqdOLyCVH6F+MaoNK5HaEbNGhWeF4v2HwCdzYXa7
 UT4fsO+FxXO/3KHsAjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310108
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101043-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8CCFB368CF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 01:13:19PM +0800, Shawn Guo wrote:
> There are some duplications around QSERDES COM and TXRX v2/v3 register
> definitions.  The series tries to clean them up, and also rename
> v2 registers/headers to make the version explicit, just like all other
> versions of the QSERDES registers.
> 
> No functional changes is expected.
> 
> Shawn Guo (6):
>   phy: qcom-qmp: Add missing QSERDES COM v2 registers
>   phy: qcom-qmp: Use explicit QSERDES COM v2 register definitions
>   phy: qcom-qmp-usbc: Use register definitions in qserdes-txrx-v3
>   phy: qcom-qmp-usbc: Rename QCS615 DP PHY variables and functions
>   phy: qcom-qmp: Drop unused register headers
>   phy: qcom-qmp: Make QSERDES TXRX v2 registers explicit
> 
>  .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 110 +++----
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 212 ++++++------
>  .../qualcomm/phy-qcom-qmp-qserdes-com-v2.h    |   3 +
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com.h   | 140 --------
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h   | 247 ++++++++++----
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h  | 205 ------------
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 254 +++++++-------
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 262 +++++++--------
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 310 +++++++++---------
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   3 -
>  10 files changed, 769 insertions(+), 977 deletions(-)
>  delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
>  delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h

Hi Vinod,

Did you get a chance to look at this, or is there anything I need to do
on my end for this to be applied?

Shawn

