Return-Path: <linux-arm-msm+bounces-111357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i37RJ32kImqObQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:27:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CBA647504
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:27:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ICYn+N7m;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ya2OW+x6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111357-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111357-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 343EA306C585
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217003F7AB6;
	Fri,  5 Jun 2026 10:19:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1293F7A9E
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 10:19:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654775; cv=none; b=Tv3ZTmng6tRJ1oQFHm40pMljHqtuHb+vHqQOfVc4QZKpYPm73rNUu8IbPtsmWCIRqZFNMWlXqGXpF1SsDPA+gA1Jt9WgYoWcXJMpfJ2KXGZJJTqcZ7KSjqE1RZ39Z5G8a/K8drdlmhBVLIxdU7lt9exMaZm35UkJug7VLYFHX+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654775; c=relaxed/simple;
	bh=b3y/Ri3dF5pPUhVma/VEkqg6XXHRERmZ3NYb/UDlu8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qajvzNUKGbdw0PRODgBs/MC7xN63KONBUnVTCfoaMu9zHSEK+aYIpO/58zGXwrgMkOUzKjmrWckIs3t2xu8nuUkt+d9UNAogvCQfZgo4SGxLQTFts/P/AU7yDmwIWwzo209REZDytGKCgy/DMMNOpVGi+oKhmH+zqOnZfiy1EJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICYn+N7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ya2OW+x6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655A984H2975186
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 10:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5YZKQX2ZQaazK+ofLFvgf66g1BJkSfhht9kOwrmms0=; b=ICYn+N7myKnXgswH
	bQo/8lg0kxpiIsoldDGC/gCBvv93FgpFUDsZiqWxEW5IyZI9xSmOtpZ4LIwn+UzD
	YD86S2Oh7R5qvswSwd9/vySzJkbatdiifBNHWj+VyWU+lFp5rh3jyoNMKl6+k92b
	Bo0uVS2dDPj1s7IrkaKU8MNvuhBDlbW8mzjGJtXvhtS7RM4WeWUVey8f8JKF0BNo
	HVP4MSj79zvTpbS2ZAmCVQM5pBT35uE1OmPx17Fs6KQgzvNvzJjpyo6GBLIgAC1o
	jSy5twHm6Kq3/QkqqSVuBPtfaRUZdTns0JQnGWdoTxyagp5KZ3XwGtO+63ujvoM5
	gF/90w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekpnu9fdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 10:19:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c36f4b76so18575505ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 03:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780654772; x=1781259572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5YZKQX2ZQaazK+ofLFvgf66g1BJkSfhht9kOwrmms0=;
        b=Ya2OW+x6ubNZETusVDpSdFsptl27AGAvWwKIvQJdza8m3lfwFQ0lQ6CQoZtVvB335R
         ZQUp0WHGlkaU6DOT7dfxbvkgpaEaDiBhhufCkzWdwTxy/4ZA10VjEqbsOJHObpTUSfm4
         4zILTSUR0cYlSJGsfjzywXxTyW1wbEjDK8tvAz1G9AyeUZau2vW2CCp9jO8qP27zbhbV
         rcfUPbnqrinkHMjoZKtHj5KXMdj5IOrCfCLhivCMMTzaXTIC/K1bVRdhSxo3CIc3eahR
         jQK3nvzxhoSoAWDXq80xLoENKxbSmVyR7JMgII76zZMJDWEzejr0fgu8mEDVBs2GILE5
         ktxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654772; x=1781259572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V5YZKQX2ZQaazK+ofLFvgf66g1BJkSfhht9kOwrmms0=;
        b=ZHvt4jsJOCn4iRrC/PNT7Dh64rFlRHFR5yDVOBuMgfqaz+IEkL13YwQ99uikVYzbx9
         Vbva8EF90lCVm0mVw1B8XL/smOR5tP31+im78bM3uyczrZBaSGtrwHEdl9a36vlQNOlt
         2fswOhusAo8VUSMqmkcBwfsV15u7vRx2hyTxXMeTfSTTPvPXiXq6A0Nh1A4RuDWg73hl
         DeYXngz2bVIYhDtd52dqkiy8GDM4jGGtuN/OJ8qCh9zT8c+n/fLvC3av5cRLydEzcXwN
         g0fFLejPxuGf/N9k4g0YPfFQORzkLHDm0XLLGWDU+Fk1CvdiSngg2h7YdgZpoA8vjpcd
         wawA==
X-Gm-Message-State: AOJu0Yx08UOk0vCTd+f6H/sQSt5CLkoowqfruG9fcmhdD+FasuutLQTq
	vYdZ50jq3C5aH/1RvFU5CH6f4IHvXl3kEGCgC0Dq3gr4B13EEZDpAv4DgFlVH4AVsLviTjOGQXn
	LjOggV/um3EJuMsuUaPNyaLVSag6hk7+fXLlad8b3AguQQlRtgSzz3U8VH9UGomhy1DPP
X-Gm-Gg: Acq92OHHx5m3zNfOF5LaqEy9qBAk0OcbR0m/ru9ToDGDaWxjBC1xf9txoBUQbmb4Q4I
	M0wTRQ5od3bDAh3eAGjYZh9oseZuo692D8O5Wb+AQXY/VDUcacFGe/xF72lO/x8b6futkZ8CbKm
	9Y52xTdrzzaMB9g5SjS4Q/4i+L6AwN2Xx+mGWZutvuUcMF+L+5QdV7g8V/M077PeWlCHwQIt+LZ
	Kg+hyItVhcaXu4CD99BINbob3JH6v/W1NCNJwppZGnbfrEs2dGKx3XsoBS8VMJ/yQa4sdq/TYGo
	4PZqlBiphHnYusgqxxLwha7dy5Gtbx1fVo7Pd1PSgd5WVhMMhqdp/ZmzDfjdFd5RZQVjhRTZrB8
	vHmiCvRHFe+JB05s5/W3F2uL/5MgakvlE2sKsdYmSs+CoMMZa50LISb6Gw5Y=
X-Received: by 2002:a17:903:1b47:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2c1e8344ef4mr31586485ad.16.1780654772054;
        Fri, 05 Jun 2026 03:19:32 -0700 (PDT)
X-Received: by 2002:a17:903:1b47:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2c1e8344ef4mr31585795ad.16.1780654771441;
        Fri, 05 Jun 2026 03:19:31 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm89741445ad.33.2026.06.05.03.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:19:31 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 15:48:52 +0530
Subject: [PATCH v3 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-display-v3-2-9846ba5fe635@oss.qualcomm.com>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780654747; l=775;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=b3y/Ri3dF5pPUhVma/VEkqg6XXHRERmZ3NYb/UDlu8k=;
 b=HHM3jKlqb5X26mBRFsD9fw5P1MjZUiGWDaoGxngkOUjuZ5dFNTpjD798rKw8GJ45ZtvnSvf0d
 90SFK/4Eb5ICuvRht1mtLZquyu5ms+kCPxWy6f9+XSOw5aD7GeN5o8L
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: 7l_ufUcVbvmeMwdGwmcnKkDo2j0KnlM8
X-Authority-Analysis: v=2.4 cv=Ksl9H2WN c=1 sm=1 tr=0 ts=6a22a2b5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5OSBTYWx0ZWRfX2TlDXKARfDdA
 Rq1/drFnyCp5khJ2vSgS4g+UHwXqXQ4gbzSTy/7S3W9Jl3ngIh6OO+wTP3ksukhx+WhcVrR1fuI
 2IjIi2NrfKXNBvVn61mQVaDf+36j8adi/DDtCD2F22npviyrRbGOlg4yAbihzb+PYRHS6w+T5D0
 OGm6IHJQ28bsnVt2C+3eMvfyJHqEpmov/+MU8/jYA2knhNk3wrhCoJbR49mx6CnLUXwRaKcO+Wf
 guhLmsEfy0DslCj1IXU7xZkrQyp0RRszF8yxKOeozxAup/PQSAAGuG2WVy0XXcLl0wj+qpozs3d
 isWht6s6X+jQJuGntn0wYWZCYg/W6EYu67AZ69xFY5lzI5HmUAiv9BAfNp1hLoj07ZFQoGXpK7t
 XtRtGiQpH5DlZKwF5rIrQeOKcjDgKoh+S9vMfe9h9c9oCO5Ckxie/dciH/1xzN8BRD+lZv6bzxF
 vWjOaMLowFWiNvGV6Eg==
X-Proofpoint-ORIG-GUID: 7l_ufUcVbvmeMwdGwmcnKkDo2j0KnlM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111357-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14CBA647504

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra CQM EVK board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 909f3c188e75..a6d72ff63e57 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1005,6 +1005,7 @@ CONFIG_DRM_MXSFB=m
 CONFIG_DRM_IMX_LCDIF=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m

-- 
2.34.1


