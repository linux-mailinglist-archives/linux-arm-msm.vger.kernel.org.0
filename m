Return-Path: <linux-arm-msm+bounces-90034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC2GIwPmcGk+awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:43:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2597A58917
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 94F81749B7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB2B48BD21;
	Wed, 21 Jan 2026 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mODgG3N5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jDZPPPUk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BF32E7F11
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005716; cv=none; b=G/Av8v41pmJHQmeucuBIbrj5Y2/1qnt6P/DONUjT1lbhUh1tgojQv6HMhw8EhZFQefsRLHSpyvMR1gZHyvyglm7rMAS8Zl1qjTdvEQR3wl4tpJCEIrAfMvvUEcHRJQVbbyduA3/G0vKBSL8SlFiDVT/VlS7fslB8+xNyoTwvrU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005716; c=relaxed/simple;
	bh=XaXKrhZ0PI5oP57YlEb/zxWTqPBEMDO6bFrznEi0py8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZzZD1P8L1bnNqWRFLpIPWZQUSow9ZvhsnJ6pwq8HE7j2cK8zby19i3vUf2Q3Q2QxetgwXy/3DIkD4OIQO1yU8t7XHS6CvpFXk2dSRGfEUspKPMPvJ1fNy29eRsL6lihpVY1PiSpdDt1nWlm/uiE7geoKQdfg8mYMlFhHKD5hwc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mODgG3N5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDZPPPUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9pW832452261
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3eWZ3tsQ3Zo7tMDkgRQLiK
	yPjXJaJJy29sQFbi6hTVs=; b=mODgG3N5UTc2QTerRVt4a/RGoKLGbi808IvL7R
	E6H7sV9ZXdMRj+9d6UjPhHz6cqw285zkT5s2wn9VPY7AxmHotvkNqh32Yz9MUF3S
	BggxbYj1xc+uDjGbzRaJkrlKe9hLn58dvB/xPnfoQ/tKHz8Vx4Bo/f+gS3119875
	hG3jhmBTsRx/h13vmk55AgwDgl5YVveKGdD1t1B9PWMvYzXbe9Sr4dPBDj1jDTeb
	YkV4rIDkDa4j9WP7uSC1nlUJUQ8NAp+H2lLAAjaTAyyoH/OfOynczpNlVK4AS4X2
	SG+6nniBHY4XHiP/ym7YAe30EgjumQm7qzLWaTKuYGUcw1tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvhqgtp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ba026720eeso263716885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769005712; x=1769610512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3eWZ3tsQ3Zo7tMDkgRQLiKyPjXJaJJy29sQFbi6hTVs=;
        b=jDZPPPUkeuWuyNrzH+OTYYiCqUW1hXYm79i//0iWiZOMfDYgJFmGmMEFhxF43dRjmJ
         wv+y5PCYny2rWOKPszHw7ck7LaP0cjqRh4Wfon/p/e6keIGrXzpgJJTFOdB2hUUhAheJ
         Bg8NYYEk1H5+bZEmLraLH4NSfs5s3lH2o9qXi89cwNzmgaudnMrx7+tSWB4EJSVU4n8v
         34hTGDZkEnkSmIbOxgcv6L8DR2ZasUf7cyey7bEdeJhVT7fwlDVlcfPTbF9zBN6dSmD9
         vQqlzLbPPSfKZKJw8sNSDzqIbGeYDI9imtYRdjSCKnkWQ3+ZpvnweQSooMIJBFMpYuPL
         CN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769005712; x=1769610512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eWZ3tsQ3Zo7tMDkgRQLiKyPjXJaJJy29sQFbi6hTVs=;
        b=lDptO6sVg0ReZTIj7lyj96bQca4/jmyW7BerQGjX3qnRSDWo8T2vGTOowr3xbVyjZa
         pi+RHStVGLZwFq629fpjx1e0wfaOXgjdyFqH2Ei2WZ+zMzq+gNZd0bH8Jne68Vry3s8L
         0H0V40gkRNId6KcIlWMUiTk/sCTDzf14LVyTCZs4tbp2E7buTOM31WleI5J4+Osxcm6j
         ufkOY+zuoNkagT2m75qqLY85eBRX7vtLAHeuqkiMV9CJVbWkEhkJ767Jo9g42LdPVcBv
         h6lrbm5ZKNeDwew3jJGpp4V8rMUXGfNHwM5jEf7n95ly71JdxyDR1UwwzvWFzR2Lxxd+
         +eBg==
X-Gm-Message-State: AOJu0Yx0GChVyEjZSV4ZCSe6CXj8x1Pba8c+JVi7U2NYNWjYiQ4TTsdJ
	cWCic+Q8JSvWuuSeZiUEsqc+dJrBxJsmnOrfnMfZoDERUGSwUO1iGXKIs+796mfmukRBuIumnrp
	lbWRnHFfaRaRQUl69azqKoRqmibsMfwiu0vhEGQkQrmaJ3+iDTJpeKV8ABO+ely3We65l
X-Gm-Gg: AZuq6aL0lZeqPqjqGFxK3tRWifwAMoxlDLEdaZefpfVTclNxgG7tMZDIu69X3C94Jey
	GSB2fiPiASDd7Y9wCU7wC4LsMqoTdAUZ2buDkdVEnJkj8pB9i0Umd4w96gAaxgRT1gOFmTlI3Dt
	YdVVXzuWCtk8nEKzZoNQEum4FGGmMLnzNjlOgPXt3dVCRsuQh46T1t6E5SoQHrDpK48cCU9Gkk+
	4VsN6CEFvIfudf9xobEyjyv7eFDaNSByFzaB5GLodxz9FEoklQks+qdDVJjh67LsXez16xDmGFc
	nfgupADVxkzdqsM2bAY+D7QRDhisgBjNfwx4OV3hsniSA9WGddobpEcZ1xjRkmsXjabC/9MVOgU
	ZHQ/ZnMEPQJkEZyi7sj44owgGZu1Sb+iCWvoVEKfH2U1nqlT+bhibjHzwqb6ATh6nWWmbUPNh5L
	qnBkXc
X-Received: by 2002:a05:620a:2941:b0:85b:cd94:71fe with SMTP id af79cd13be357-8c6a66f2991mr2589736785a.33.1769005712192;
        Wed, 21 Jan 2026 06:28:32 -0800 (PST)
X-Received: by 2002:a05:620a:2941:b0:85b:cd94:71fe with SMTP id af79cd13be357-8c6a66f2991mr2589731085a.33.1769005711356;
        Wed, 21 Jan 2026 06:28:31 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a0d:3344:10b3:c488:b09f:b54c:1120:95f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435996540cesm6098180f8f.43.2026.01.21.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:28:30 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Fix possible NULL-deref and runtime PM race conditions
Date: Wed, 21 Jan 2026 15:28:21 +0100
Message-Id: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEyMiBTYWx0ZWRfX0EDQnReoEna4
 mWIw+yhynCvY//4AQe6zgYYslW/+pAm4dvGm4Nb7Rez/Hc361wLjAQfAtOLvHn5U2dkTBLmqDpf
 /3DHZcAExM6tcWwGAhKfrN4AH8mfvO4QWV9wjGpoKsTuMx9/GVugsrWeTt5Np+xYVHG+tdRjQfY
 mfTfq35WvUrtO4iMJ/1vPrtEmcGa0hc/2L70yDWNZuTkfklq+8H24ZTQstbetMMJgW/4HWHalfv
 04rLChlFekkCXmHY3k/WZriAnia7E3o9A3Cw/2qkEACi4nmY5zFs65vJwl94+sntfAkgTYotIU4
 1rNrQCAL9/9smlflDgdRxVuBQS92CCx5FhA2+uJWMh7Dg4XTCjClcWmTqOX33nKSjD9Rnfqpl2C
 Ww+15St+wq0Qxtl4MWEwl4Cw03f0Scl8BAuyaKxcu/6B3y1Lg7DxxZaWbfnMIcEdkeAYp7Gnit8
 OaG/oOTpXoZ5/Vy2o0w==
X-Authority-Analysis: v=2.4 cv=S5bUAYsP c=1 sm=1 tr=0 ts=6970e290 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=C7rGozDzmCPgz14KtV4A:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: kf-s8LMBtbdpue7P8MCZc40ICmunBSOC
X-Proofpoint-GUID: kf-s8LMBtbdpue7P8MCZc40ICmunBSOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210122
X-Spamd-Result: default: False [-0.96 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90034-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2597A58917
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Address potential NULL pointer dereferences and race conditions related
to runtime PM in several Qualcomm PHY drivers. In all cases, enabling
runtime PM before the PHY instance is fully initialized can lead to
crashes during early runtime suspend callbacks.

- Attach driver data before enabling runtime PM.
- Introduce initialization flags where needed to avoid dereferencing
uninitialized pointers.
- Reorder pm_runtime_enable() and pm_runtime_forbid() calls to prevent
unnecessary suspend/resume cycles during driver probe.
- Use devres-managed PM runtime helpers for proper cleanup.

Changes in V2:
Split patches 2/4 and 3/4 so that the null‑pointer dereference fix and
the runtime‑PM enable/forbid reordering are logically separated.

Loic Poulain (6):
  phy: qcom: qmp-combo: Prevent unnecessary PM runtime suspend at boot
  phy: qcom: qmp-usbc: Fix possible NULL-deref on early runtime suspend
  phy: qcom: qmp-usbc: Prevent unnecessary PM runtime suspend at boot
  phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime
    suspend
  phy: qcom: qmp-usb-legacy: Prevent unnecessary PM runtime suspend at
    boot
  phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime
    suspend

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 10 ++++-----
 .../phy/qualcomm/phy-qcom-qmp-usb-legacy.c    | 21 ++++++++++++-------
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 14 ++++++-------
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 15 ++++++-------
 4 files changed, 34 insertions(+), 26 deletions(-)

-- 
2.34.1


