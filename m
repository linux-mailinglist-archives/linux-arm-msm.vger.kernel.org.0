Return-Path: <linux-arm-msm+bounces-118752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id loqROlrTVGqOfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:00:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5F174AA67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:00:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TNmDsIQq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RbWNU6EV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118752-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118752-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58DB23074AD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD4C3F65FC;
	Mon, 13 Jul 2026 11:58:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7043F4DEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:58:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943907; cv=none; b=VNcx4Jp1qCBa+W7/CvRo/95+fm/g0lN1bkArIkDtCFIwE+0xyUse2A6kJeXOrWDFJW7MrtBAmLlngDV04ew+mdbOqQdApWuRToc0fKk43nOFKpZdDPkZ1Cijhf8xOGaC95vKl4sfZ3hjeLV0MyvIv1/7Z8RiNMwa6Cp+h4vhLxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943907; c=relaxed/simple;
	bh=arX9tSARvFjDoZvrQEU49DO8Egee3ocKdzSm9UKLNck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bKN7Sgps8Roxi+O8yYLvtrjcoZ6fQMry2zCr/18VmvRkDPrJ1xtKyc6inK6TqhrWK/69iGuh+ZWhRjBOmWLcmP8sKTucJ7Ob0z2zYPrcgXMuQIOS3PFMCkYxHxKGlvnphP+jSWEOxLUonylz30UkzSUISLPFq7lx9l4V+Dj2rok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNmDsIQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbWNU6EV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9uceV1089701
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kl9D9yxCe1W4JgCW0Ljt4Q
	sBgikkHSTfIiW244TT7MI=; b=TNmDsIQqKcdDgdCxoGscS6BwpGQLE9/u3ycsrA
	Ns+NiS1WoSZGqwX2OBZC0dh1gQhzYCH9JH0s+hqlvihesoudiaytBvpSgmEfzxym
	UIj6fv24+ZXywScPbjQf/1O/x/VijP8qhM6VuVxV1Fu0L/9Hg3NXnsAbmxfl+GpR
	43Llj7Ao55C/USs2Z4JlpQzfqnSgccrNmcUpiz+ItUnc36TPHSiJJ2Sd3CoBLQ6K
	KKfm8egG/5zCEU/94991QUxWg+FoYlNkbAGTJbYOA3/ZuAnZrCVVekUsb627Ogfg
	BB/uPoi6LzFW75Ve495iXkit30zqDQAeop59fOLPwuwleApw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4re3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:58:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so61477245ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 04:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783943902; x=1784548702; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kl9D9yxCe1W4JgCW0Ljt4QsBgikkHSTfIiW244TT7MI=;
        b=RbWNU6EV8MmVzdzIr/n/UR70OfKLOcjW3jOyd1bPJKIGEFWWc/JTmyH98V7QHTG27s
         waPwhO+JrOU/EO7Epxlf7YssLREX86WKNzCxT45H6AMsucO9Lt5Oz9OTZAYKxqWrpqZZ
         lGvA2BxZY7hfVy9uYhZT3VclWxQqOE2DQlw/KjSxYbe/bb+77yCRx6OOVrcdru/CepYU
         /aRD0+SgcM2mr1pqCOEQK1Q8DF/KG0KTpNF95gczp2Rep0qhoLmzZ3dkkzT+mtwovTyP
         1wEjxcwsh8viP7EwdpDnO+lVhj+WLeTyK2LaLxUb40c1+/1H4sLuOEcmAuxMBYobq4wL
         4D6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783943902; x=1784548702;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kl9D9yxCe1W4JgCW0Ljt4QsBgikkHSTfIiW244TT7MI=;
        b=bmYUM9vfZjC5BF84qEPbffiBDpfs2TVF4T6JgtibmLsiy22zTg2hl0fjEu6eD7l9up
         4LPrWN/bKeZVzWhgTicMAvAbOL4SX4vfZjLv59ZxkFqayppkXUF5AZN2H5j35OBffoBn
         3JIM42qQwLWVFMsVD5EYmM1Z0Nic+d0kAxaydMvu3Tv1S3JX62JGgMFvqY7ZUdsldUPx
         G9kJAwTC8v+GHy9d/5y7TiCJOwYE9wJRsPsyxe5O5oJmQkXIzbD2VlSMWgVxsV+LRUjr
         iYg7pXPYuO70kpU+abAOXPYmBGXLXHJIquerQRYiZN4Qn+DoKtuasFfvHmmQwOCopvpI
         Ubeg==
X-Forwarded-Encrypted: i=1; AHgh+RrgJgfyChwyYhk9zh3IICDgFr8ONTmtjl2FO5axNAeGocE4J8BjXnt/+8jRviXbph59CX5jkiqOVPGrJw+1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0H93Qnz1x1Iz/uaH70hdgmu133zjKc7wYRExMD9Qu2OwsXIJS
	NylTAT4iDN4Pod1Kw3bRdXW+MqLZD+z9rV4h+SW+1hDrXk4y+Q5uSp3ui6lhX+IiL4ccNzAIeg2
	iRtvfN1jVltSu/xCyu6EGTwOZk7uT3Zf6QsPF91rlZQ8c/KD1xNu+cDDbGV6Q/th6N5zt0kT4+V
	I=
X-Gm-Gg: AfdE7clYaIRNIYGM60Tbm/JXKCqLebp0IbUfOTBt7ZB5sEJbG5pCroIfcoF5xk7+ABz
	VCiotsZieO+GXMPbmYkOlbposnLMtxrd0sR03EaqNRLy8UeOke2QFVcP1gkXfE6N3I0C9dR65LA
	/5tymsNTMRmS8Zj4zsk5QX5YXh64fxUOXFpKJsfN5LZl4fC84RsBCLxkzaVth4O04qwmcIxjRMC
	cw6w4EVm/6xeaC2jqaKZns+AeDqAv9nhxB/uQsnADyyrxSa05V9DLtkAy9z6qoM/WdaoG7sEvFM
	DqK5v3a3bH839fL8FUNRPJ8UaZp5qUKudFZg3cXoi4jBaTJJaKfdzkpiffDvHCzDZsCM5WCc16Q
	wnqn/5ydafnq0mrxAfGanzhojxK3I6onQ38A+OtMp
X-Received: by 2002:a17:90b:55c4:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-38ddfd10a9cmr5499812a91.2.1783943902397;
        Mon, 13 Jul 2026 04:58:22 -0700 (PDT)
X-Received: by 2002:a17:90b:55c4:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-38ddfd10a9cmr5499786a91.2.1783943901857;
        Mon, 13 Jul 2026 04:58:21 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm74546638eec.31.2026.07.13.04.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:58:21 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH v5 0/2] monaco: Add PMM8654AU PON support
Date: Mon, 13 Jul 2026 17:28:13 +0530
Message-Id: <20260713-b4-add_pwrkey_and_resin-v5-0-3bea476e1453@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANXSVGoC/3XOwQrCMAwG4FeRnq3UtJvWk+8hMtom06Ju2mp1j
 L27VQQ9uEvgD/xf0rNIwVNkq0nPAiUffdvkUEwnzO1NsyPuMWcGAkoBUHKruEGszvdwoK4yDVa
 Bom84OKFwiYWsC2S5fQ5U+8db3mxz3vt4bUP3PpTmr+3HFPo/mIALXmuV1YXVRst1G+PscjNH1
 55OszzYy03yx4LF6H9JZq6cu8JacIhGj3Dqy0mQ45zKnLFUK1LonMQ/3DAMTwVfyBVgAQAA
X-Change-ID: 20260226-b4-add_pwrkey_and_resin-2c04d8d53f5d
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783943896; l=1875;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=arX9tSARvFjDoZvrQEU49DO8Egee3ocKdzSm9UKLNck=;
 b=f0doAPkYNAGP6mnoqnHR+3aZy6vAn9om0WOAcZTuU/+LM04qRI9pmt7YVQgllcFO4obtOotX1
 s+BvOoQp44hD78r9du2huXC6KYyWjBi+urALSGKaX9PHOYo3sF4/T40
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54d2df cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hkPachF6C7OTRM8muywA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNSBTYWx0ZWRfXxU1IOM4BLv5U
 ne368v3Ln6b+V1g0SCsDXkhMGjF8ueRbSH90E8z/2Pdc62HsvGf/d6YQScHSeFRXAWf3GE1h0DK
 ZHkBVfOli6bBo3bg2KanRoR4xFmmpqs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNSBTYWx0ZWRfX1FyBwhyzJTy1
 d8dSKC43VJrjNAjLsKJwqJojxqiEGCOtXHiv7dlrbfbMgjVCaEZeyJ/XLVYaXUB9sJgiDzThtev
 4rrdS3pV36Ni3WqeklmjwQvd8tzic9EiaX64W8FFgUlRl0BnlDz92H9atP5TKfdZTqnRRujOiS9
 Em752t0CEJasv4WjLAcK3j5fJc4CXitzzeFp31+QYz2oICR5IvgH40qPEw5jChkHKbPmCjcsuG+
 wzyHopH9OAeIgDs2iV2ELHVgggjEtPqmqdZpK7yTY3L5YP2B2TletIvimxsFTjYWkxBJnazlTD4
 TdRZDja0tL8D7jZ04euNTkTdXNs8EbhLC+71M2joFe99I3R516c0AZv7uHdJn8UjRDhdeNeG5EL
 D7NW7mWl42O0Zj35f2giOwZWmIGvLblxydyFejDgB5GzVKpHp2uIB1GYIUuLrhGPZzWjqpbXuGq
 lcqkANpY099ShPx2GlQ==
X-Proofpoint-ORIG-GUID: RlKQDx_Xx9qM9Yoi-z0SLibvWHn7CI2M
X-Proofpoint-GUID: RlKQDx_Xx9qM9Yoi-z0SLibvWHn7CI2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118752-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rakesh.kota@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C5F174AA67

This patch series updates the PON power and reset dt-bindings and
device tree to add support for PON power and reset keys on the 
Monaco platform.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v5:
- Set minItems: 2 for reg in the PMK8350 if/then block to enforce that both hlos
  and pbs address spaces are required for GEN3 PON peripherals.
- Link to v4: https://lore.kernel.org/r/20260323-b4-add_pwrkey_and_resin-v4-0-abef4e4dcc3d@oss.qualcomm.com

Changes in v4:
 - Remove the contain for PMK8350 and new if:then for PMM8654AU as suggested by Krzysztof Kozlowski
 - Link to v3: https://lore.kernel.org/r/20260227-b4-add_pwrkey_and_resin-v3-0-61c5bb2cdda9@oss.qualcomm.com

Changes in v3:
 - Drop the dt-bindings of PMM8654AU qcom,pm8941-pwrkey as this
   patch was picked - https://lore.kernel.org/all/20260209-add_pwrkey_and_resin-v2-2-f944d87b9a93@oss.qualcomm.com
 - Update Commit message and disable the resin as suggested by Konrad Dybcio
 - Link to v2: https://lore.kernel.org/r/20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com 

Changes in v2:
 - Introduces PMM8654AU compatible strings as suggested by Konrad Dybcio.
 - Link to v1: https://lore.kernel.org/all/20260122-add_pwrkey_and_resin-v1-1-a9fe87537816@oss.qualcomm.com

---
Rakesh Kota (2):
      dt-bindings: power: reset: qcom-pon: Add new compatible PMM8654AU
      arm64: dts: qcom: monaco-pmics: Add PON power key and reset inputs

 .../devicetree/bindings/power/reset/qcom,pon.yaml    | 19 +++++++++++--------
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi           | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 8 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260226-b4-add_pwrkey_and_resin-2c04d8d53f5d

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


