Return-Path: <linux-arm-msm+bounces-119218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wzIwGRRsV2rpNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:16:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EE86D75D77C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:16:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=C6T+UMfp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QXHjiXwZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119218-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119218-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6293F30065E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17144483A4;
	Wed, 15 Jul 2026 11:16:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255E54446F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:16:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114194; cv=none; b=jeYrNBFmkjrqf7LbsPIbgZu6BuXCQ43YS4OsUj0bfTUCwNMwsuh4uDXm8IPSqBIYuYg06yzdaCqgED0gqpLevA3d/On8j23xbm0xPprGv1GxaaBOexecAEharSxqFiWMufSzD+67y+7i4REvPlr+OgGunyn228QmBn1GsUjX2Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114194; c=relaxed/simple;
	bh=b8R7PMKX/mJOnKSAzw+WBIj3ErqOG2azS+7mDTf24aA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BvMBnWHFirBQ4+boI11rWy3ksqKHn3DK4StlADT1Dh2IGUAARs3HY+uCeESdgrO4O8i0ZG1MRvZ8HN8HTUVMh6GS4XLld6pkBUvqQVM55FvBwc/1wVsTKaxv1ErOs1NM5lxfh653chOgMCzIpRB41wxopECLI9HqH/SKZieY/kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6T+UMfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXHjiXwZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FB8ngw3532840
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nhogDVqJuu8
	4Y9umWIh3a+QOZfhAgQxd/7sF5vPE2l0=; b=C6T+UMfpT8BjG6k2aEz9pwfcRRs
	z7wofVtgxCGoTVn0Lfy7lfR7V8Pm7l/A5E/Ce7Z5GRsIvED0zN8TquZRfnI1c9ER
	jBmmR8KnmmM8m0LoAfvQ1yzTZJ8CRKp15+uc+IOfE1iBlK7nqe4yR4Kx7nqGYTdy
	zXK5QBjadiIenICy8Cm1PQPNuQjBLQg+GAx98EuHht6PLVZuPxxNNCuJn3aZEMJf
	+clcOHyUB5QQHqecG5SOqKPK+RHMZVeWQCtiv3I6pOCigqFBWjO+hG9byvd69XPu
	nP2Cl7oM1yoON2GeAvi1jqpE5sm8RW2vIcrEVWoN2pmzw6vcFxLCkUYDp1Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q60cnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:16:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce756aa72eso26505775ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784114191; x=1784718991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhogDVqJuu84Y9umWIh3a+QOZfhAgQxd/7sF5vPE2l0=;
        b=QXHjiXwZ1f50787ReGmLoov/LE/Wy4+JsdKDK5fTs3Yo2OAfVpqiEMNuicovAoi+xY
         tJma54Jvs6I9VOmFf/bBJUM/WJx7qCJdU+PLJfaeO5jh4mGARtaOCldGlkjep2QCGAup
         dv1+7S0y5K1HrP6cmX4udQ5pC+0RBZM1f7LnRJADg1KefFNC34p7ikRZ1ppw/TSj9CWl
         JnKllidnarh3n9i3W1smL+ao1jjp1f1hl1MEMQyZPPwmHNZlyD97mCE8ZGwEJMvG98Kp
         kWPj98/iRUoeXKbk3O2PgK79oASRcU7uJ4BQLNPdInV/QXubZo/LlSs5GxHaJ3cRTLyN
         m1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784114191; x=1784718991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhogDVqJuu84Y9umWIh3a+QOZfhAgQxd/7sF5vPE2l0=;
        b=dAy36nbtpW3at+DdKNgBtDoJBeGs9P5WVsEWrpX/aXYROm3+cHifQ6HhX2xtfzcxI+
         H1jixR0NPHBang2xoIxH2M3++wj/mUyMH0Cwy5teonCYSaDCKGk9Frvn1hQphYRLxyz9
         SOJFQ6b+nVp0RcWeS1LggAlyA3z75/R1mp38JYJir3SnKr0Z8mSNkh30ypU6O+pI+rAY
         TBRFQBsoAyNwBSslYF+ux8z0beez6t5AjRNEHRrROgJ9fTQv/H4Bg0FH/y+hrb5Pt6BF
         VD3C9t/Q5/pXUz4XCaT9/WcnMuPWWcaBhG7P9tzlVe0ShLB9DagD+8vYbfAGN06IjAjp
         7bdA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6sKvO/7F18xebuOoVCPeuyyXGxQeLTPnm59mTSG878rabEjLJt+EK972QdCQ/JEL1ZO7p/lcVJ+jNoJtH@vger.kernel.org
X-Gm-Message-State: AOJu0YxYKQSe8n4cX9fn8Nf2ZmG91US7JqJOewNcMxjeNxfPWfjgB4jj
	SVmSsWPgVP4Zr2Y3bcNf7YaSMc1X0Ny4L6SCNnrkNnxw8pd8BpMgK0UKTsZKmVSPYD/RgjX7RFV
	xqF+mcLeuNHU+0zQCriYYJus0zOHdipyJ4l6tFDa+csR8tYr3LeVkMJYFvD/TadUQuhKR
X-Gm-Gg: AfdE7clTsAIZFJ/CRE94VEua52aKTiwcXqrQxahiI1PuMtCwfuDLzgzvnF4YGUe2W66
	yQr2hxEokFSIz1zG+UVipfa9wQ+IEqROhvvu6ysodOot5jpbjNG074/Oc37eO/fKGPwpX/zn4ig
	BMwmcONWQWWG9ceXrDPX7f/sPQF69lkzQvHAd8wp6z+tiMXbvEsPxeC7Qp4NE+mLgHn2z97YlNU
	MVxjE8zhmWlgUU0ZPnbO/Vs4Ur7E4xBIg0M9HO4yGvNWiNxQ3HVyOTFIp/8mXLFWhpzG3p7EjyY
	W7z6DGIAX9dDsnBjPshs3/lLjKq3WEim3PBW7ET1AjE1osDbQC7GzVZV6otMfrFewTfxsMNAE3C
	ZxpuFJ60GOcFQ9/tNsS1tZysVXiKUoF82dciizgFr2uDETqJ5nbFy7EocnAWmjQ==
X-Received: by 2002:a17:903:2442:b0:2ce:aea4:5e80 with SMTP id d9443c01a7336-2ceaea45f9bmr114310855ad.6.1784114190790;
        Wed, 15 Jul 2026 04:16:30 -0700 (PDT)
X-Received: by 2002:a17:903:2442:b0:2ce:aea4:5e80 with SMTP id d9443c01a7336-2ceaea45f9bmr114310655ad.6.1784114190341;
        Wed, 15 Jul 2026 04:16:30 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42b2c0bsm471669c88.8.2026.07.15.04.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:16:29 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: mani@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, brgl@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        wenst@chromium.org, mengshi.wu@oss.qualcomm.com,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: Re: [PATCH 3/3] power: sequencing: pcie-m2: Deassert W_DISABLE2# when no UART serdev is created
Date: Wed, 15 Jul 2026 16:46:22 +0530
Message-Id: <20260715111622.2561730-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bjcmn2euhpik54ytc7falqgcezvy2loimudm6v2ibzxx6autki@rex5cjq2o755>
References: <bjcmn2euhpik54ytc7falqgcezvy2loimudm6v2ibzxx6autki@rex5cjq2o755>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExMCBTYWx0ZWRfX6NVuateBl4jM
 HMwgrF7H+iKAgrp7SyGNZfSTWCaZtv9wop7hL8RsP9ZbWPZJfqilQALOpH+Nh1a5sqcFcBsj5gk
 Wu9T9vBMLDnQYl4eknlI1qCq6qvLaR0=
X-Proofpoint-ORIG-GUID: pPHwYt2e44QNksh08dGm4jJvi2p_kcGq
X-Proofpoint-GUID: pPHwYt2e44QNksh08dGm4jJvi2p_kcGq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExMCBTYWx0ZWRfX8phC6XHv+sIP
 a5eqb/iE7opkmuf9a4lfCCutVgcLQsH9ofKwgsN83TabeQY92m2CCJYclxsANteiMy+V3rG0yE2
 ewf5d4+XOg2LsgG5ZXppSB/tl0sr3eJUQwEo6utwbgVwcaoFjLUpulpN373HTXYsEvxDYcmwR4G
 k31Nx4Pzm6oHGWnXbQZ0hDa70P8pHrZW++zw19k3T4Nuu/kFjZXEz5oO110WPZxJgiORItWkxBy
 sEWzJ6UGUvXbcwlrcmllphAl8EOuKL6zuZl7xw8kMuSukP0BRbtLGvr/2hUq4FF9b8eUKti6cuq
 miv0NPwghbHJno2DT1QNy5Yt1Sqtq/+LtEdVYWDHFKu3MOTphB3BeeTfge+ePg2EpJIZw9+ATcl
 VzeXapI5Q7wMeXo9cIGsKhIDmZj3p5jkMOoxPTuFPaAW7wbjYpixnTf7KpwaQJTmBUQw24nL8+2
 ohmhB9wyaT9hQ5ueKkg==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a576c0f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=RcxsvD7BqTzStQuQcmYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119218-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wenst@chromium.org,m:mengshi.wu@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE86D75D77C

On Tue, 14 Jul 2026, Manivannan Sadhasivam wrote:
> On Mon, Jul 13, 2026 at 02:46:16PM +0530, Wei Deng wrote:
> > On Thu, 9 Jul 2026, Dmitry Baryshkov wrote:
> > > On Thu, Jul 09, 2026 at 12:59:42PM +0530, Wei Deng wrote:
> > > > The pwrseq_m2_pci_ids[] table lists PCIe BT devices that use UART as the
> > > > BT transport and need a UART serdev created by the driver. When a PCIe
> > > > device under the M.2 connector does not match any entry in this table,
> > > > no UART serdev is created.
> > > > 
> > > > However, the BT subsystem of such a device may still require W_DISABLE2#
> > > > to be deasserted to power up. Rather than adding every possible non-UART
> > > > BT device ID to the table, add an else branch that deasserts W_DISABLE2#
> > > > whenever a PCIe device is detected under the connector but does not match
> > > > a UART BT entry. This allows any BT interface on the card (USB or other)
> > > > to enumerate without requiring explicit knowledge of its device ID.
> > > > 
> > > > The primary use case is USB BT variants of combo chips that share the
> > > > same PCIe device ID as their UART counterpart (e.g. WCN7851 NCM865 USB,
> > > > sub 0x3378, vs NCM865A UART, sub 0x337c): no UART serdev is needed, but
> > > > W_DISABLE2# must be deasserted so the USB BT device can enumerate.
> > > 
> > > Instead of forcibly toggling it, would it be more sensible to tie pwrseq
> > > into the USB too? The onboard-usb-dev implements the same idea (of
> > > powering up the USB device), but it predates pwrseq.
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > > 
> > 
> > Hi Dmitry,
> > 
> > There is a patch series from Chen-Yu Tsai that appears to implement what
> > you suggested:
> > 
> >   [PATCH v4 00/14] arm64: mediatek: Add M.2 E-key slot on Chromebooks
> >   https://lore.kernel.org/all/20260709095726.704448-1-wenst@chromium.org/
> > 
> > We have been testing this on the Qualcomm Hamoa IoT EVK with both UART BT
> > and USB BT M.2 cards.  Is this the direction you had in mind?
> > 
> 
> IMO, we should move towards Chen's series.
> 
> - Mani

Agreed.

While testing Chen-Yu's v4 on the Qualcomm Hamoa IoT EVK with a board
that needs to support both USB and UART BT cards, we found that the USB
hub holds a reference to the "usb" pwrseq target permanently (acquired
in hub_activate() and never released). When the UART BT driver later
calls pwrseq_power_off(), the bt_unit enable_count only drops to 1 and
bt_disable() is never invoked, leaving W_DISABLE2# deasserted. This
prevents the BT chip from being properly reset, causing the next
btmgmt power on to fail.

This issue is addressed in v5 Patch 14 by splitting the Bluetooth
pwrseq unit into independent uart and usb units, each with their own
reference count:

  [PATCH v5 00/16] arm64: mediatek: Add M.2 E-key slot on Chromebooks
  https://lore.kernel.org/all/20260715085348.3457359-1-wenst@chromium.org/

The series still needs review from you and other maintainers.

-- 
Best Regards,
Wei Deng

