Return-Path: <linux-arm-msm+bounces-104548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJO9ILpF7WmJhQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 00:52:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8494682D4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 00:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24CA4307173D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 22:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF0338C2A5;
	Sat, 25 Apr 2026 22:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NB4kJVvw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAnoXxJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37768299943
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 22:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777157070; cv=none; b=JNh/kfX8OJhwyWHxmNrhEcsi3R32BJlqXPWdm6Bd3fnPOf6yHnjG4G6pbFWQaA7t0N5M3Sf7Xxb9jObQ5dIR1sP0WRsfiAgu5N5FOZ+c9WlLSBVms9QycodXVbQtA3iTjaqU83B+1P9SRdif2v5wEeMWIJ8MLOnT4Z0bXPpXVpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777157070; c=relaxed/simple;
	bh=rZpT+POUN3z3DqBxngUpST48In3xWM+cRBsauAtKy5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlEQDcMOfqpIEPJusRKfMIBx5t1cnxhj45kH18wvbNIg/wEmbVi6+CkT/GMLudYY+pGHd0lcWfhIlB0oEqwhe8bne6ILevB5BVQ2FSB66fDS3Z76LFKJXZ8MyNZcOchKZpkdsBk8Q4IyLdQtGSaJ/CBqkAWFfFm+/lJvSUWP79M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NB4kJVvw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAnoXxJl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63PGNdMP4144532
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 22:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=69opmhO/JckTSfgkLtNwnsdf
	o8m6zXst9te6ZZrstnw=; b=NB4kJVvwXpmcmlUL1b8lE/MGB+zFFytqutrgvIpS
	2qhz1QIrEzPZSSWzgZCr2+kGaaMjrxQBsNdcb9kSwSN7+Asr3q5iA1paVk/gdsmM
	6PreTbzcrVS/wwexEA7mLfPVzmhVIZyaJHDpBXlJdqk9HHLYaNjM9Pe1ZkfiQQ+z
	Dqou8nMjmBLxqncfQ2BNb0hU9tQYzUvXGf8xw/FEw/n9Bprnwp13lWIE08Jtw8kU
	FY0BiLXUnbVrPXgVk5MhNl8mil7LOM7mHPT3oFievcrMQYJRoUv/yNHvB2J03UTY
	HP8i9CdNMoSJ2qD8tZ1HdI9hfqQK6NtilcmnS/VJ9g5Rzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdhr06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 22:44:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e592e833aso98807611cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 15:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777157067; x=1777761867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=69opmhO/JckTSfgkLtNwnsdfo8m6zXst9te6ZZrstnw=;
        b=SAnoXxJlnrXbQJWCvLhgkOXeaOWKV43F2aDojuig1vyAxsS9cT4L828PYb6kSXjQDu
         +cm3yCLMhKhRjW1EnpYRSdQi1reMCo3SFyXZ8HSfAKNkf5J3V/K66JM4q8bXEMwkWPt+
         cdUWZSmApfxiepPTq+lemv8UpPf0l1QX004MVwM/p1EM3elzA1WFgx2fPlrMpIYxkvf+
         k2HD6A4mkrqMIGOIl05m829d1EhzeQMTK9i2Bb4vj9TiQEUwGuS74LUfIZ9fgzkect8H
         4t1xdldpMeT2rDb8X+B9k3qE6LZ/qHSmPcPXtHzdniajT5D/Ss2yBNMwiKRn/dCf2GGr
         oskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157067; x=1777761867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69opmhO/JckTSfgkLtNwnsdfo8m6zXst9te6ZZrstnw=;
        b=U+x69xRTQfUOK5NowumUQcLmTvcbLmUyDSG/tV7ftWfrNeNFKOj0dlylmkju64D8II
         Cn8ROL9F05Tx8x3bZOKx4a2U8zycl8hsXlBSo3voYcs1OXj8WuDD3iRgsh/eCekY1zvB
         fQ+dcpNtTbuqkTMff4UbjU8t6Ok8mVmEqMXNAoY6lABIYiFwAWY8uGe1fW6on+RCqw4u
         WPqYleqNf2s2AcfKQwmXFHLF6l2mx++vZQPku4vXinuGDnEfWU891WiIkZZR/ODkDnjg
         0fGhuktSBVh1lwmzUO9GG3Gf+rJuE0kS+K5q8Q0YfDUcb7/80sS/Dy1+nuyyzwtM48gC
         ZM8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8kfPcMLBF+/17RCipTzoeXoOAsh3hDlkiWBbppFOskzvbe4C/8o2kxcuhXp8nIRkEgIiLaZdBPML8mFKXh@vger.kernel.org
X-Gm-Message-State: AOJu0YzcCxRKVP7C4gZAYX8XrNNXEeIEvSz9BlM6TpuGSOKkctkJIQiX
	sL+mw0jM7IgVz3ya344AxuO4XpBjqEkmZaYwmZ3lbDDMnEsetmD9tVw6Wx+NVKnlbUaZeP26sab
	KLLcbP1ZUWbrNdxxo/96U7bWywHWKxgahZARbT8iQ8klgiKxWVWOwKsgtTTMqQbhTqJ//
X-Gm-Gg: AeBDietpq2Nz8r4VtyEWP28MoxGlFm1HM3ib0Y6hXTkxajxrNsnx6O8rcActk7VhxpN
	OibZX9IWVA76mfeWzGMAZ0KBMHWffvQ4dN1+zrrFOIEa3SyfMfuTSetxdx6hgZ6rfLMlV0f5H/8
	yzF3gKMPcIo3+sGuVa4JswHRGuwq128tS9d7XMgFGYoCXJPrQvyKIMqJtnLRW+6K8yUZ72+awpZ
	Rb2DIepK1tqAHCQ+/o3AmkSG2xe6Vr68Qc9X5mS/vYPMD4wmV6/laji0BeEpvu7qyvtybw0+SNR
	qMCL72BBodt39Q3Ls1DHNM0R1P2jHc4xB0+sc5jSJQ/6ooIdkRSoLAOVPQBgiCPoHs9kUlkLc7W
	ETw6FBl49RbsRWVVB2Yydad7lKtV3/rEBswSyMmOdkxJBoOZuHa31XcytmEpK2e5EKVFYYFpWeL
	tJ/jurtA0+4p9V11WMYi4VkX7vU/qbnGoJ2pmxtn+HpxGeOQ==
X-Received: by 2002:a05:622a:4a0c:b0:50f:783d:8cb1 with SMTP id d75a77b69052e-50f783d8fe6mr368477761cf.58.1777157067255;
        Sat, 25 Apr 2026 15:44:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4a0c:b0:50f:783d:8cb1 with SMTP id d75a77b69052e-50f783d8fe6mr368477591cf.58.1777157066814;
        Sat, 25 Apr 2026 15:44:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc361sm6992581e87.32.2026.04.25.15.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 15:44:24 -0700 (PDT)
Date: Sun, 26 Apr 2026 01:44:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL
 init in bonded mode"
Message-ID: <wrhuksrzlxw2pjlvjm37dwjuztcv7qs5t6mqiav4ujecwqdkwj@ozbfxpbgaimt>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
 <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDI0MSBTYWx0ZWRfX/1Pa/Puts7EF
 I9V3Gf/epyt548xmcR/QNCu5Mc6DNwjhNp1jLy/BleP0KUVFQGt9Qx0pkCCUXLawXgv2IG9vbqw
 FIY/ch2Esuc01BToDg48/Kz6zkMcVSTrQ+hwk6NUw6MXrn4IJ6yzBpy+5F/IlozVVxUXXRzDGIq
 fIr4DMOMOLZLhHtjvi0G44Q7X+bTO3DR2uNC5mNDJyhur+uTdleJka7czgr0klWL5jaHLTsYGu0
 q8iHV0U2Ty9h4FV5V9WxXPT79WvkhY6YACZ7G5DiL4dwC8lGz26VMgScz5Cih08If7Y+Pp8P12s
 fg6tVSpBSP9HJXdZsEZuhAJ8HTCdDX49+FYa5ZCGuSncqj+tZoae7s8oAIfvE6Ow2L09ltGCdjE
 tF6w+fPlRe0ZQFTNO9x+Z5mKXtmHx9oUqOazdbl4HU7EDU6Dxmrd3vVAwE45BLhJOxNP2wvCe1V
 U3ea0xp+qNru5YZOHUQ==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69ed43cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=gR0NIcCwXHEp-eBqhiAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dRX4ilLE-1IMHYd7tX4Q8k4LpvLPu-qN
X-Proofpoint-GUID: dRX4ilLE-1IMHYd7tX4Q8k4LpvLPu-qN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_06,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250241
X-Rspamd-Queue-Id: 0E8494682D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104548-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]

On Sun, Apr 26, 2026 at 03:38:49AM +0530, Mohit Dsor wrote:
> Hi Neil, all,
> 
> We are seeing a regression after:
> 
> drm/msm: dsi: fix PLL init in bonded mode
> https://lore.kernel.org/r/20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org
> 
> Issue:
> - Resolutions are broken after this change. Like if we try to run 720p60 it will be 720p30.
>   Even though the byte_clk is set correctly, the bridge is receiving half the byte clock.
>   Some divider is getting set which is causing the byte_clk to get half, ultimately fps to
>   get half. Some other resolutions may or may not be broken

Please provide necessary excerpts from /sys/kernel/debug/clk/clk_summary
for the working and for the broken cases. Also if there is a difference
in DSI PHY registers, please capture those (see
/sys/kernel/debug/dri/*/kms, provide necessary DSI PHY regs).

> Reproduction:
> - Used QNX RB3Gen2 Core kit with lilliput display and lt9611uxc dsi to hdmi bridge.

What is lilliput? What is QNX RB3 Gen2? Is it the normal Thundercomm's
RB3 Gen2 or some other board sold with the same name?

> - Run 720p60 usecase on hdmi with dsi to hdmi bridge.
> 
> Expected behavior:
> - Display should support the expected resolutions correctly.
> 
> Actual behavior:
> - No display on lilliput display.
> 
> Additional details:
> - Reverting this change locally avoids the issue.
> 
> Could you please take a look?
> 
> Thanks,
> Mohit

-- 
With best wishes
Dmitry

