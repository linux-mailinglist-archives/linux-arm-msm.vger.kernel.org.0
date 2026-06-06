Return-Path: <linux-arm-msm+bounces-111499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HAggBUsQJGoQ2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:19:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 601E564D5CF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:19:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Wpo9IbW2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WHf7qg+c;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111499-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111499-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EA96301ABB1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603B4385539;
	Sat,  6 Jun 2026 12:17:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EA437B415
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:17:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748255; cv=none; b=l26+G3RwAxW4ORY0ULBcPYnQF5b7U/tQHVzNpgF6y8EIjvilv2Zb6MShtVoqUQmdtBNFXkapuaO8emA7cFtMZqKxB3btPgd/yGMujOQl6RuA0mA6uCMRw94wDZzjZ2uAW/XWAgLcTMxzDn58nUdPfbRjRTsPBo83wWBkXFMNobw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748255; c=relaxed/simple;
	bh=cb0vdcAh9cY3J15mE5rLya7MP8jlTCeWMKnX8CcOiwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXbj3vHwalia2RK1ZtQVK5bqduVDlmVDCk7cwhlASE58FEDYlumRn1zro3IEP5e1mAgu6ShEQtLDdaLK2CfbW3Ciq6ZpMn6eCYyAAOxa6gYAPs+1qzY5lvU1v0QaeWcROVc/x1qaLcAyY1dm1g30OmWgbOL18YeLKVJdVBiS1ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wpo9IbW2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHf7qg+c; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGthg1296121
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vgZvs8ItyoeNzwdrSoQaw7NU
	3tYQCqRT79Wusa/gol8=; b=Wpo9IbW2U2wCrMvLt6Xez0VLv8ki56i9WVHlQUZp
	bZooegCRoCJXy5IX18MVaTLrte5oIcfWoS9qaiLiVqEtwTVNKDPGdej+SKmX/FX7
	dwnxOh5eNKpI0M9t1AcExvxaLEvhZWxOhSJ/zTKsdACXfTr93T7SGknbAcrFXCtB
	lKYI1aL6epM8UXzLhlH33hc3OpiMVEi8I9hSx4Jnr0pbzE8DnpM0ZFmd+8z/YXMc
	KwugfXljpdaQToMRX/9XQaQvO+mAONFvpj0RsabkdtlEOQEsdcg0sEBYRh+fHP5m
	NM2dnniTrJIJrMK2054lywh6lRSYo7JSXRXJ83ZpyP5scQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3hec9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:17:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9639d763d99so1439906241.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748251; x=1781353051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgZvs8ItyoeNzwdrSoQaw7NU3tYQCqRT79Wusa/gol8=;
        b=WHf7qg+chO4cnz7JdOqBulYGaq+PWu78ZoUC5rx2dVpnlRHQdEnt4ngEPmSkf9hY1/
         DOGiEtFwCyOYk/SMjRjMkw3AsAOUBq1KV1aukaYaa+tABbU+1sScrdgMIyR0tYXyBDHJ
         2MHYQUYC6FrkdCxw+skpR10j+cTk05Xgoiy2WMRbysptF+33GNZvF0oajdKmRX564H1V
         pL/eva6Jl7b7hTdvE8Ki89hekAgqtyASm9ct/sEgyN0k3leuzZvtn1BUy5oaDoMzT1NF
         30XD3iSor5Pt7MoeWXdZeiUPDRByDEX3/Acxn8EKrKxrkhkCkA1Iuq+rzCqF/s64263W
         Ww0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748251; x=1781353051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgZvs8ItyoeNzwdrSoQaw7NU3tYQCqRT79Wusa/gol8=;
        b=W4eY+ZryZ56+n5gdOgYZNJ8cO8aQg6/CSDj1yNj/qbqdy5KzakQnsdrT2yh+7u6PFV
         6jQsO2YQ30dlpp/SFcRneOp+G/Mp5yObt9f5ojdBI6ma28hcQglJ8nCCMHqYhStPX6MY
         kDnjwl2z8zaTMCRxnxQBJP/PtWt0QQnqTqRiISbUXEJOz2U6b4fApZrs2j2VVzEnMQyE
         kjetDS2sH3aI3scCkO87sEwP3NafYLU7/8y3AvWhXMv5Jw2MT3EZKjadccJyY+Ux1Uoc
         9qfpuWGs8XH5M9rC36OVYg4c5l2cwxyYN7Be23m95qHPVUiU2p+7q6itkO47chAhihFP
         Q4Zw==
X-Forwarded-Encrypted: i=1; AFNElJ8vevZ9tbZlQRrz6BPwvFOt0JDpCBSqqstrrQs2wBTZevYZdmNl+ZlZAdUrS1YjxIX9Pox6LYYF89xz/eNE@vger.kernel.org
X-Gm-Message-State: AOJu0YzX665yxbi2KNKYJuyO8V+jQS/+xgoAsStiVBkYHdmhOD6Y47d4
	7M+1uaJeFEpGUPnstGoBOMUwAnO4HHg9cCNEYUWS17mWJdUtNih4b2LhlJEb4XXNJJ+iQWg+JHu
	8u61qisqzEkT7LFTdXl9lpPwx0GSiACEk3RpmXhfdpbZG3ZLx7wij7xRQEZ2SdKveRVHk
X-Gm-Gg: Acq92OFGnJ1KOzJefD8wvPVdkgYwKX2OpPeCquRJWT2HNelhIG8+QX859KxIbDuFLk9
	+/udKUqfx0YEcsAa7+fTsQ+BAgUtCBuGGFw/jZIFOqFNSFQSVXVJubtcq8jkgcYus7/BPRx0PSN
	wB5PnPasiPrkCKq3fgX3v0Z2NOqMvVjCAlzSPQxlPPNzcx9+F4BTn2B9vwJe/GgqBsEJKhFcQs7
	O16NC5SDi5blgi8KWI4baVBjoOZNB4C0NeTrCyUwZz426kYbHBNWplGWz2GZwZO3TRvbPaRVn0l
	8aKpCnTzMbMBXZ2VTqNgK0NwgPQKLdkytwCdpAPfs+LYmTlS9/UIqThSHtG+BvoYUQlNeiAlNdN
	cOm8jSu+nTTNpt/q3QIvLFzyR/hqCAfAUyIDGJ6BnDP5QDel4sNwt1iwvAmsiI8qffzFfeUNB6R
	YZOx5zeZdXKAfpCeUplKiCQ6aweOEqpRYBtCx31M0ybOEwZg==
X-Received: by 2002:a05:6102:4411:b0:5f7:240f:bbee with SMTP id ada2fe7eead31-6feef48d3c8mr3403167137.1.1780748251240;
        Sat, 06 Jun 2026 05:17:31 -0700 (PDT)
X-Received: by 2002:a05:6102:4411:b0:5f7:240f:bbee with SMTP id ada2fe7eead31-6feef48d3c8mr3403141137.1.1780748250808;
        Sat, 06 Jun 2026 05:17:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed56fsm30934311fa.37.2026.06.06.05.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:17:29 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:17:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
Message-ID: <aiQP1wpq1MAlsttR@umbar.lan>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
 <20260605-shikra-display-v3-2-9846ba5fe635@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-shikra-display-v3-2-9846ba5fe635@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyMiBTYWx0ZWRfX7a0qlEJBk1vc
 XFhxMru5qV8zrgV5qZyOaqR1pkwKyAjAeUZxpY9++FFZi6MVV6aD0A4cGekmMZ41Oy58QpGnjZl
 AHnpfQOHAlVcJpRc2U7maXcZmXqDRIjtJ8dn+J6xL+dE0te8gTy2GH6e1qzDBk/9Ow8IJfMtbyD
 7yBP8stO02ns2VxcZJPAvlcWn3MzjILbf9gU6OE1QfpgCF3T9bAL6cwWh++J+JdJDPjp3pNJu5/
 WSwXbLjyzSzhRfcrLXUXG2rXTJsBDxwd7isKd7V2oCEulHUFN84Le5EvR4bZa9Zotlv8hhTtrb+
 WodelPQHIcd2/zt3sI3rH1pxsfJkxQGaBsH72N2BR8bpq/iop7T6m1Bx8o87spYgXR/o//stn7a
 VqE6m8l8RiBZlEgYqsltf1KG6lq+bysp9yf235WB/wcqGnPyk+n+xo0yGMBFB3fGDOasn1bS2mn
 sIFOtaPX/a2q0s3D9lA==
X-Proofpoint-ORIG-GUID: _eODjFzHLcOA6ed7qopSRFT7r6ZY1bmb
X-Proofpoint-GUID: _eODjFzHLcOA6ed7qopSRFT7r6ZY1bmb
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a240fdb cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=oNl6jLlcSFQHEdJXP8oA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111499-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,umbar.lan:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 601E564D5CF

On Fri, Jun 05, 2026 at 03:48:52PM +0530, Nabige Aala wrote:
> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
> used on the Shikra CQM EVK board.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Okay, you are really not reading any feedback. This patch doesn't belong
here. Move it to the series adding the actual DT with the panel.

-- 
With best wishes
Dmitry

