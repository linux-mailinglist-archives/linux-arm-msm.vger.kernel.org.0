Return-Path: <linux-arm-msm+bounces-105116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLUpDAeo8WmYjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:41:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5ED48FD7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F2723009CD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F3B38D6B8;
	Wed, 29 Apr 2026 06:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SrRUjn0h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqNBJfds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB599375F96
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444864; cv=none; b=CXGP1FC47wODJ2/92XevSM3h0KFrEXvejeS1eqpXeHjsdAWIKMgDuq6KVEzioYc5OtMqtbo+Q6HnqTlIBRmzv1Y7FgWxPDGzGVgm7CzeWE3Wp/iE3NUTtnXRdK9/ZZd2YMGEi+2uh4sz/YZT3puVr73/8tW9sFL5hrsnysEKv7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444864; c=relaxed/simple;
	bh=erY0kQyqF/hdTAswYgm1+uOgS9QTVMfy3EgzOqMjSto=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mvmT2COoJlHw9K1YrfNnnVgTl5tvqFMJpN4ntGHtVCu+R28R4H9kK5lt9Vuf3ZTha91B+ruecvZbj5iPUrPLcMm1mn3mUJNp6iIiYr5o/bpAcvtNj6YA/7eC+EnHZLJpsj8H9YFx9Qt465LVnaXWuFRZqCOu6/qD2Z9CLEcCWPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SrRUjn0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqNBJfds; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3ZVXs1016142
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1BN2WbIeDfW/CmdnL979tx
	eW7tV/N+jKAOjbRdJsve4=; b=SrRUjn0hHdJDeiImyM8Z4QY9H1MFHMIM1Eh7Eb
	4knz23X0n71bJOIdHJAfPeb4uCCutn/vFVG5Kpmu4wPf8JI7txOABLOIJkf2Iq0Z
	bTUC82BdzpTaoBIKN9iZU4LWm5wnGPf0Co0NDGqblAfX3yjM5abZuNLjDT1j5Mbc
	UQgOlatu8GcxnFbEbqagLTtLU0ntmDk+zQC7VI0KPH688YLh50pj33QmbniRN700
	FJ9FNFdbQtvrl7bCjH6LFjwUYH7DZbpJk07Upk7gYTa1Qs/TiLL8hgz2URH1bVQr
	bglOFSXNG9LgiKcBz0MG0wIMbgNHm5TEzmoCMGcpcZBJJfDA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua730jsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:41:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f5f48458eso7319239b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 23:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444860; x=1778049660; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BN2WbIeDfW/CmdnL979txeW7tV/N+jKAOjbRdJsve4=;
        b=OqNBJfdsZIQczTy/ZScSD1DFlqX2H5jp3WmhbEsQgfQMVyXWmweFJbhUYxob3qpOzv
         hVuC943YYLSS7bPwpVdYB5RcRlBfKi1W4r/xZoE9+wyXk3x0PXRTKUyQ3uk+dDdB4701
         ok8pRWbLVtw4560CawyBvPVP/qZkOfpJeetpe/VHWcc4Hez4l9wmOXs/CGn0XUNB+FjC
         XFRrq1d19FZ6EO7dGsfzgYj8LxTN7BvpO2IfRpePGelFyLT/ITP5D/seGLcloXePNYgd
         ECGIQ+HURrrmvH3ijaJUFTEru+Q0Q2WLZjxldyB5mEpLQxHdP8DNq/8gSKuUgYcLPlzb
         uh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444860; x=1778049660;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BN2WbIeDfW/CmdnL979txeW7tV/N+jKAOjbRdJsve4=;
        b=A+eXzqbGOMh5gi4Tt4IqLU9R4hwJmDNqZtI17WngE6rLmJvrb9YjCpFbBB5FvK3zaD
         RwR41tFYMY0cHVKmuxXNKLh4+Z303j73IwO3OEmIrB3J2dqQtS00d563tn2mzXmIyTQt
         SYPFSDQ22tSOVWt9t+HcEsl6mICNOBnSJZD9WGtZmldg/+szboVuP+0r/W5+MzrztBr+
         VoFLtyenHQKbQ6rmGW3fc0ZZwn0SD3ZucH6SQdf2YDtKQT9TzJZ+ivDZ7bs/mWE0y+3+
         nNAyPKHHsurSn5kZ5Dkk86WHLpH8H8hMkMOLa17DNyneXjf8L8+tp7ix5D7U24nNguH4
         j9nA==
X-Gm-Message-State: AOJu0YzMLj46ZlmnL1cUtY5PGWNjg8Bcg/YmZhs6nnwA03jHPGjJxXKW
	menaew3uMRR4JsrnNiBE8FMCbc7/Nr19/yW61Cwt0u7U9jQVmomyRzn4xcKLz2NTRBna60TIDq9
	kEOhSaxqBTwkW46YHyjQmE88HmhTIr0jhattsTek4XvSGO9wUGd9RphgDeA8DN+B87Ez6
X-Gm-Gg: AeBDieu3gEQXacKHFBuMI8m/FBjMBnSyaqbRuVkSxEv9459eEjLDgGeZb3g3gMXPi1z
	C/kbAz5+83OHb3idr0xd7yu6cKUMuaMZeyA/rNcRtGQD0K/JjpSxXS1BDSqFJa/8cBGqlKDJZ+n
	2XqiBUqoKPwSs88vq3r4lZguPhy0uE0WVjLqx8+kUHAKLCXUyK338eRAZ8AJJKMlUuirJSzfYPs
	sTLVsruILMnYpxgqc2A2Z2XXMEveP8wjdqPxTL1eCipKUB4tPrVf4OfHr5IrfV/jby7aXF0dhmI
	keh/N7yoNvZDd/Rpnw0HQ8eO7iuuyzI31ltCVlC13hG1Cq5RfGutJ3oZpUe6bGENZkSKFbb47jz
	fnZfhwPELH8+E56C781AOg741fnnvyBFgvKG/E3WNOnxKEieEJ+IvzRIlRxc=
X-Received: by 2002:a05:6a00:b908:b0:82f:559d:ece3 with SMTP id d2e1a72fcca58-834ddac6945mr6775422b3a.15.1777444860087;
        Tue, 28 Apr 2026 23:41:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:b908:b0:82f:559d:ece3 with SMTP id d2e1a72fcca58-834ddac6945mr6775364b3a.15.1777444859203;
        Tue, 28 Apr 2026 23:40:59 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb78esm1048478b3a.44.2026.04.28.23.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:40:58 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: kodiak: Enable 4-lane DP via QMP
 Combo PHY
Date: Wed, 29 Apr 2026 12:10:39 +0530
Message-Id: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOen8WkC/2WMywrCMBBFf6XM2ilpbGNx5X9IkTQPO8Q2mmhQS
 v7d2K2bC+dyOCtEE8hEOFYrBJMokl8K8F0FapLL1SDpwsAZF6zlDJ3XJN0lcdQHyYTumB47A8W
 /B2PpvbXOQ+GJ4tOHz5ZOze/9q7QOU4MN9nttlRBjb5k4+Rjrx0velJ/nugwMOecvCjW4xakAA
 AA=
X-Change-ID: 20260420-kodiak_v2-d7a06d50db5e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mahadevan P <mahap@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444855; l=2256;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=erY0kQyqF/hdTAswYgm1+uOgS9QTVMfy3EgzOqMjSto=;
 b=rTBjehIQsTN43ccI64AZ3+63W/lbBtXV2VqanJY40Wy+Sc/irQZkGttu3uPIHH+HJGTPQgLcX
 u9ZXCd4voYuBRlz0cO+SR3mUxlluDTvoNBG6Mu3KKfHD+bK9Z0ZCs34
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1a7fc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=q2dzgMnl55gs7i4ReAQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX6/LJH66ZDGo7
 CzPxued2gFsAmWOyS5IL+2BVmQOpkN+WV7RwSLohMP/svx4GJ3ODcmDlguDhKLI6YmcLgTjRZLq
 HIZmNHHnY5vdJLodIRHK0s6ZmZWwse99NpnAoEPL+yfwrOolk+cWmhRoak02k56jLjLwvcxwGCy
 CmVtMQK8osuOBvI+ceMPE7wnDQ5x7tsflvyheHS9Km5Oj6iWiAvUz+9nhN2wE26xQ2VrzcXFqiW
 ADClcJFzaWBqVp22tCvAoP7h937k3QBWbPrqOrcX1tybeb/MFlZDY9MVR6oMCvY3FlLvwuYhdvc
 e3Jiq3DVrJccscCwjCGHS+Z0mdU6kUbk/wjbmgbMwIoCXkOPkuFiMYGeAnAxBdvvdvQer2mMp3V
 xCHvVgZu3L6jrcZf+5TRgcSHK9NUYCn3ZyVE3peazqERi3PBMDpQuHBFJ0bJdWz05Mtj1iT8GTt
 LbIgQ/6qjfEi7RTiXhQ==
X-Proofpoint-GUID: mitTFAgpxZlRx0uFnpLNP93i7K3Pr8Ce
X-Proofpoint-ORIG-GUID: mitTFAgpxZlRx0uFnpLNP93i7K3Pr8Ce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290064
X-Rspamd-Queue-Id: 0F5ED48FD7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105116-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

This series enables full 4-lane DisplayPort operation on SC7280/kodiak
platforms by wiring up the QMP Combo PHY correctly and consolidating
the DP endpoint configuration in the SoC dtsi.

Patch 1 adds mode-switch to the QMP Combo PHY node in kodiak.dtsi,
which is required for the PHY to respond to USB-C Alternate Mode
negotiation and switch into 4-lane DP configuration.

Patch 2 moves the data-lanes property from individual board files into
kodiak.dtsi since the PHY-to-controller wiring is fixed in silicon.
It also removes redundant remote-endpoint and orientation-switch
overrides from qcs6490-rb3gen2 and qcs6490-thundercomm-rubikpi3 that
are already covered by the SoC dtsi.

Patch 3 updates data-lanes from <0 1> to <0 1 2 3> in kodiak.dtsi now
that mode-switch is in place, enabling the full 4-lane DP link.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Changes in v2:
- Split single patch into 3 patches.
- Move mode-switch and data-lanes to kodiak.dtsi instead of board
  file (Neil Armstrong, Konrad Dybcio)
- Remove redundant board-level endpoint and orientation-switch
  overrides now covered by kodiak.dtsi
- v1 received a Reviewed-by from Dmitry on the combined change;
  that tag has been dropped pending re-review of the split.

---
Mahadevan P (3):
      arm64: dts: qcom: kodiak: allow mode-switch events to reach the QMP Combo PHY
      arm64: dts: qcom: kodiak: move dp data-lanes to SoC dtsi
      arm64: dts: qcom: kodiak: Set up 4-lane DP

 arch/arm64/boot/dts/qcom/kodiak.dtsi                          |  2 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            |  4 ----
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         |  4 ----
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 11 -----------
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts |  1 -
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     |  3 ---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi                |  1 -
 7 files changed, 2 insertions(+), 24 deletions(-)
---
base-commit: 452c3b1ea875276105ac90ba474f72b4cd9b77a2
change-id: 20260420-kodiak_v2-d7a06d50db5e

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>


