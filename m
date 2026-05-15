Return-Path: <linux-arm-msm+bounces-107729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FCANkLJBmrynwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:20:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FF654A793
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B1253069620
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1B53DEFFB;
	Fri, 15 May 2026 07:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ooWc0SkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1B3231829
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 07:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829299; cv=none; b=i+71yR6QEdf6urKMEOqufoEkxK0DL6jMZJbowurPoG+FDcBq8VFtVqI9wdSD8jx4f8Rod9dlvyIjKjsymfMl2yp7IbHB7GYqdq55Q6X8NgFMRnKvMidpILlw17RwAMU5pRfW9FF5wyuCemAqUU38xBCmrSCWiMqm0wC9Dzbkebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829299; c=relaxed/simple;
	bh=wm1t/MamZDvLoG9AAjK3zm3gT9jofrzZ0WQKLcRgIZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Oys/i4WZGuYIJePUrwuDAMyxpoWKyAf95D/wQs3eJqw0bWDikkGgybaD7r5jBKHwGsPCO5ommmcVGzLxSTFHAe1kePasWWNTwyQRmbz02UImkreZ+soOJAJ6KOWcesxV92ZWygVLt3eriV4lweY/xKZ7XG19hm7dEK8Fd5gwrr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ooWc0SkD reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4nTvW3670929
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 07:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KV7BPkmiPjq2GSzg+WC6IPndCyT3y3e5po7
	i5xcaGoQ=; b=ooWc0SkDmvFWayVSMHb7QAEYMyU0HK9dcEsR5AsMk2mOHZKa8HM
	apLxqKM1S6n0zRYVeV2RqKoXecsujahDSWrqH9WbBwDqjcd55hE0z4phm4J+GDN5
	yzfKFmPuVxQ0wzHy1/XSDf1iETkb7WUejbhaIUd5EYSd8aHftwOkYBEla5gXZ6fQ
	jeL3TEu8s6hfYgKKqSrqmYoiYb53fow82z5qvw20T65wdzXYAsyObdTWFUOngCaG
	R70y7URfQIgmbRu29kAdpIEPvaPhxMWiAh1UhdPRw7lIsXiSpPwNKf75Ho5fDPQY
	FphxlOxFQ25TPbfGJA1EUqTbqb1AfhW4Elw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s24d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 07:14:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8353fbc7ad5so5267996b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 00:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778829297; x=1779434097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV7BPkmiPjq2GSzg+WC6IPndCyT3y3e5po7i5xcaGoQ=;
        b=LwMKa4mCaJ5GVPgSPzYLKJYGjnFaecPnuDRsqnMueLACTav4smF6x2fCy3LKqTv2tS
         XsFSwcEcE9fQ3+PBUooTlb/O6+LRzAyEBAloa1fKelbzLrxYkcv7ybOsWXhW7My31C6O
         JGTFHhO0MgURhAWaZtGw3uMuB2uIm7vf7kwjxlTUj8FomDyxrTFjBtWzPdNQFigWgFcn
         KRo1oCI1WP1aZMXgE8/Zm7PzWP9si5nE5UZwXyRTtrj60HdA/Ut8HtmLrD1IDOmy6h0w
         AH/qGe9D4XomVzOyopWn7Gm2AGPJUv4cTjkG5vrtyEeO6DUPvENKjtPG12uC6AX2YS68
         jcWA==
X-Forwarded-Encrypted: i=1; AFNElJ9vsar9Orcl3S5j7gtgjOfGtdfOPL1ZsVLVOpdXqdPJ4rsdgwslDKpIR15wruwIwHRsYl4/oCoHL8dXEwVa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7by3Y6xPzBoRIOlW3fmlPpcd6B9Qe4KCMMDNCXJebZHnzeHDf
	dTfFTCjd71eVtDetrpvVYOypPQrjPgKVu8xG5w9ibec859tGydsb8oFjZ2hLh6bltgyC8WvRrvf
	9fEptBpvkcdrPCVPvyD824A9/fOpEpyRTlRV9zjG6/3iebsAAnYvmdVDxVlEguzjYQuIF
X-Gm-Gg: Acq92OGHI64437rqJpuM671F5R6vlh137QjUByPioMC5xoyiwVlAhmeNHtx3X9Jy01D
	6SaeLXSjZ2QL5xW13Niv3U/4xxeVkZJKdk+jzxVmU7ZuRp+szepwF7O7d5iRsKYpUwZAMkelfnb
	eQWG78NG2vBEg1YMIRRyuG2Vqzk17VvTJlAdGMfmxER3TQAnaM2tyJE3XCcLWrlVg1cGAqGAgDv
	qEsiy6I3KI4K+J/gl8CsuQN+ZK6TLncIqZAuDLHoFWabzNZ8PvF+OEh7tMSwwTFTYHvaPyuYvfN
	7lKzA0Xd79TCSuc9LATXHqnjPlhuh230j7xBgFDgf2wx4lsmpu0Tunxg5fU/EV/s617botubNQ=
	=
X-Received: by 2002:a05:6a00:98f:b0:82f:6e7:1527 with SMTP id d2e1a72fcca58-83f33cf0266mr3228666b3a.23.1778829296595;
        Fri, 15 May 2026 00:14:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:98f:b0:82f:6e7:1527 with SMTP id d2e1a72fcca58-83f33cf0266mr3228634b3a.23.1778829296071;
        Fri, 15 May 2026 00:14:56 -0700 (PDT)
Received: from hu-sauana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2875f0fbsm4030170b3a.57.2026.05.15.00.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 00:14:55 -0700 (PDT)
From: Saurabh.Anand.saurabh.anand@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
        mchehab+huawei@kernel.org, masahiroy@kernel.org, nathan@kernel.org,
        nsc@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_mkuntuma@quicinc.com
Subject: [PATCH] arm64: dts: qcom: sm8750: allow mode-switch events to reach the QMP Combo PHY
Date: Fri, 15 May 2026 12:44:48 +0530
Message-Id: <20260515071448.1845500-1-saurabh.anand@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA2OSBTYWx0ZWRfX8qO0osjPNpYa
 P2K8EfDj22sVxFAcz59VNrhW1PVGbWhwah0zuCJhlNjw5/a+lXdJeB7JFYoWT9fhyZKQzyqqouL
 nUsAI43nVA0+e2G7M0lurlVQ7or+lxFFI0NS2uTaXsz6UJfHjSJXg+Rfg++AWxFjl2UQq2TNPuP
 85AXhgAdgOZEzHg/blagnzBlf7EKJQU9+yP8/wjhBaM9QlTRx0rtghrC1Mpg5dvqFVm0i+b2Xdl
 kBfxZUH5jDykNcwKibS1SVmbYy628nEdGW4UonyTzm0Bh2aem//r2+JfIZ1w91ZEL8l3zxRV4h+
 4zFtFvnxZsD9vpYnOl3P4yYWFyrWwKDHHGth7RMD3zbl5cBdKS8jn6J3Vays89VCiuKXhE/LXmC
 Jc6Xg5btfEG8+TNSNf6HaQZeigGM8dEkhkPV9TvLUafJ8j/vNQQ2uc/tM+QO+inuhI9+wxrM7+y
 oTxpPurVXQb8Wyf9fVQ==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a06c7f1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=v9DuS4k9Wl8IPVb9zO8A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: TRgOgYl7FR0Qc1tlE-rjbMgqLWQDMDoK
X-Proofpoint-ORIG-GUID: TRgOgYl7FR0Qc1tlE-rjbMgqLWQDMDoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150069
X-Rspamd-Queue-Id: 55FF654A793
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Saurabh.Anand.saurabh.anand@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-107729-lists,linux-arm-msm=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_SPAM(0.00)[0.951];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>

Allow mode-switch events to reach the QMP Combo PHY to support
setting the QMP Combo PHY in DP 4Lanes Altmode.

Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 417f28d8c919..254b94aa4a94 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2771,6 +2771,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
-- 
2.34.1


