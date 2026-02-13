Return-Path: <linux-arm-msm+bounces-92833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id reynEh2rj2nSSQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 23:52:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D5139DE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 23:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B0EF301DDB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 22:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B6B3176F2;
	Fri, 13 Feb 2026 22:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blm3BL7a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DV14tLX7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0063161AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 22:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771023129; cv=none; b=Om/ZUjyrWYY1adnaM/2k/OjDpsEIAZxU4SU4qK0ZYhYOWAy47NJXKBMSwHSXfJvxhSPZ5bBgo4PS/8/ksUE9/PR6ilAbwBGJFsgPjV/w7s1t9h06N6DKE721hfczp3Yk0aqq+cNCZtVkZVHWk6a3WL1Hs46MJu+GpVW+r3CsRcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771023129; c=relaxed/simple;
	bh=3KXqYp0RwiJTBHG+X8gW6+u5xMj14y6FNGdQcKsbQBo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TfxgqfgF96HVF7PdNyia7uzaL8XxaMihbp1/RBVctk1k/2HQDohXSYA9amLAfGGTOIpTyb/qb5/REuiJ41CS/Ugm5FK0Vy5EZjOvdceLzi8ncsw8v9GeOUKZw7MCR9Mb3TRP2Sun1eYl7Fak3W1j14uyLk+IvON4+zjmXl2OaIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blm3BL7a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DV14tLX7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DHr6ja1507156
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 22:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pSRPCVbNw7rKbjwLiRmMue8k0pDouTah/uYscuuMf8w=; b=blm3BL7aKtpPgFNj
	q9VrUuqRazoplx1qvCi2CR3ZapOrRAN3HwbnbSh65eQV2XOJVODD0R101j9OWq6Z
	fOW/RRAXoMx2Z2X8ZLDkp8m3wnKLISvDolF+qOgtkYtqa2LgD4i2hWHBIWfh2MaH
	n4FCED8vFbyIiIYH+vM6bpd7MHfjJUTwDP7dyVkNS/Ykn+bfGWxfZpToeLY/IWGF
	kNfqmGdQf8yYQpqP93yGR4xdvXXTC8JzLGXx7R6/z/RjRyt7lZHBHIpTUIsh+khC
	N8CsTW6AnXhDOoQgEF1NFPTabynoEmNpsmMHavtZiXrKq77fr6Axkak+xDYIJvUi
	GZoE4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca8rdguep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 22:52:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ed6c849so455150585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 14:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771023127; x=1771627927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSRPCVbNw7rKbjwLiRmMue8k0pDouTah/uYscuuMf8w=;
        b=DV14tLX7qXtbw6y6HJWNpoj47XehI3vjQYiLCOATyEqy5Fm6U5kHnuLSzJfEfIHfcn
         iiGbqOr0YU3iQlCOX6Sa0HODdTvQDg1fp5nP+oUd79UWnpOSuERCByNMaiKVqwdJSvyM
         jACzgaUzVUkrprGRhFHIkwtqNuCjox7awxUVTP0jYAv2qMCt4eBJZlq2pog8+dHaLo2G
         oVa9DA8jKvXQs/pKtqnV+MB7l5AtezD4h2YcRKsisxZ05oYzK6012bMYQm22JaIfX/8d
         LpyVva0H5J8V+dQ+mUBo0rviJwFeA+gULQUjQ2l/et+/AxU4iG+YW4+HnZngZPQgIJo7
         ISIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771023127; x=1771627927;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pSRPCVbNw7rKbjwLiRmMue8k0pDouTah/uYscuuMf8w=;
        b=s6kOcN95qC2I/cwkDcwtAyLEsvRzOnWiTtcdVED44+VaZ+HYKvhPfpnTssQH0EjiDZ
         CF2ET4vHIlpRGxxYtHuUSedtHH13+8kgNEEl8RbBcNPdHNlQY27LMPToJIqfkIDrq1n9
         hJKnS6friBeJH6MO1rorntIRSL097W3/rCCDjeIIQGnKD5ZVLe4+5n7OVrqDXZc9DibD
         QMQEMGCqGimOnW2Vx/yv3tADQ53o3jc0EoI2dHYjMKnvIr2eLDY4EHMwdumyPL9C4/dz
         g0YHmAth+jIw2Bwb2l0nMhgAT8ZHfnmtH2AG6PoLIuKs0k7s/LyKMwnq/KzweLlbzriE
         c4vw==
X-Forwarded-Encrypted: i=1; AJvYcCVTIHr3D5qfeTOX3z0TTvjYyTwnmI7tYL+7WcZld91grOU2h5JMucoF/8+fSTGuARE5Org5tcB4MERwvhE+@vger.kernel.org
X-Gm-Message-State: AOJu0YxwWebsSuMTIlZa/td2Zlc9SU16Q8MOb82Ovo6UVnzNjjMsQm3B
	P2RayZwS5AHUfgLW4mGTBe19k9/LPi6uHYz5L+WxGNaZDpZYN/daZA+vJBbHkm1wGiNqWsyRP/+
	uieX1SBAvRDDlx+UcppYb1D8N/DDPWoYz9Ckjc2FEypbjd04Iu39RLyH+gBAFq8igD1ZN
X-Gm-Gg: AZuq6aLtchKASnJSaBggUr6ucQFf436ad1qDOSNsU49hCklWqpitxAxyYcQAq42MrKy
	o4eCNBVXIp4lzzGMANOTSKKqbLY9sbcHzfxcLtGITYISdbzXxxmLAQrYrrMEb1W6ZTxJO7oHenD
	v6F+xBocyIDREGlx9uBr+O2TqPSNW2XdQeDUrQ1IC5CkVpTUpe+ZFmQYBevKYHHJe/e00f/xvTx
	0nzeiVt4cy1/vlkUC8NcBnEDamKdAGq2XMFfVpMdmmX8/cnlaYtYPhCHOHBHdjzdN8NtXv5iolG
	+/vZaO3dViTn2eA1OpJvDKoelXMnR1wG44KCTuj4ELz596KO0lOFXpF69jkpR2Ly/MHrv8i36qK
	Wdf/ip8QHfTh0O2I0oZJxkvFJz4awTS7PiZLDNKrS16h/e10KYloDv0wzmUkSZ3s0SFNCbafmXs
	kX9nwxu6Pywaf4HWJXI+fh3tJf0EZATufHKZ8=
X-Received: by 2002:a05:620a:29c1:b0:8c6:ed3d:be60 with SMTP id af79cd13be357-8cb4248a74amr454449485a.71.1771023126665;
        Fri, 13 Feb 2026 14:52:06 -0800 (PST)
X-Received: by 2002:a05:620a:29c1:b0:8c6:ed3d:be60 with SMTP id af79cd13be357-8cb4248a74amr454444985a.71.1771023126200;
        Fri, 13 Feb 2026 14:52:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56867fsm1829162e87.24.2026.02.13.14.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 14:52:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>,
        Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
References: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
Subject: Re: (subset) [PATCH v3 0/3] Add DSI Port B input support for
 LT9611 HDMI bridge
Message-Id: <177102312411.531660.1550838144624471871.b4-ty@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 00:52:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=698fab17 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=Gj2pMmEfbv5KbNg3tboA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE3NiBTYWx0ZWRfX3B9kSOuVLOfv
 g8UPAHCHlme6Rm7/4KsHUkDsKD6pXVgyxs3cr3HNR8yq92hZordAnzD1GBe4eNuXcv7BPHim0mS
 eh+2VORo7V0OPp9AYZo4Ym+p+rxnUMXyWJ3MyozQCLc8B0XbLoJaaDwnEm9Q9795Af6iR9vs2JL
 V3XGov/CH1k2pFqharngcfjk0Brc23ETY7DhWF+2SXvaE872qGxg/ueZrjggjqi59h8r4L9JqD3
 IiOWYyW80Lip5G6NMikNYwcQWUCQEJs62thWSxjPUUdCn68a8zQpRa9UbJDu01R7pDIJTPSHDhp
 wRbk3DTfny669R5qN0zUexZRxxf+iC5UrUCT17W/TljottppKnl4tFgdMAutknCIyfYI1yVCtvX
 8JPS/F2MvHl8//yeNhLmtVwC/fDe8TfPEbPFXCbHqQG+rnWgrtzZ+LI9Ag/+kG1PVrdzTszigm5
 bkI3tArOGFABCyWQN/Q==
X-Proofpoint-ORIG-GUID: nT0FJDS6a33mdWwRD4-cjZ9p4ertGKbS
X-Proofpoint-GUID: nT0FJDS6a33mdWwRD4-cjZ9p4ertGKbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_05,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130176
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92833-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,thundersoft.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B09D5139DE1
X-Rspamd-Action: no action

On Sat, 07 Feb 2026 15:32:53 +0800, Hongyang Zhao wrote:
> The LT9611 HDMI bridge has two DSI input ports (Port A and Port B).
> The current driver only supports Port A or dual-port (A+B) mode, but
> some boards like RubikPi3 connect DSI to Port B only.
> 
> This series adds support for using DSI Port B as the input source by
> utilizing the existing ports mechanism in devicetree:
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] dt-bindings: display: lt9611: Support single Port B input
      commit: 5ae47f510f38ba125b3bf213735f70d90a44e52b
[2/3] drm/bridge: lt9611: Add support for single Port B input
      commit: e8bd92c4a0d2ee0fe8ee2b33c94dcffb3a39749b

Best regards,
-- 
With best wishes
Dmitry



