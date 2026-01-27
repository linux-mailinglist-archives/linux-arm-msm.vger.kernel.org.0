Return-Path: <linux-arm-msm+bounces-90675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAS7KAl/eGmcqQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:02:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 665DC916A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC3CA303B94E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF293328E3;
	Tue, 27 Jan 2026 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzyF7xrI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ellh6pu7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BD13321B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504514; cv=none; b=EdV1yomWCHV6OKwqE908UTPEMbO7rbKYTsqsE4FlEe1b1mMJBRGj9MjSkMEoGTBe4kmANrh4/ZYDIHf1pWNhluTpG+GsCuBHZ/Zyf1HObXtYxG4qcozvR/+RnJ9gQmrlwIDoOk0wgK4CzZgj7qqdfKCKM/SBfYqGlyc5dF5AaAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504514; c=relaxed/simple;
	bh=kNS3mRzR9euxc1dfj5q3SILvs7z0UTa/J18sZOeIlA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=biMnAKDexBS+4sF4X/asTMNn4wh2e/4iw/elMtVVbAvZa1CvthSd5/8BOouJR5KXIZNd8oWVu8o+wV0m9Z+buMO0rnOX28rqk5kmRMbzrtd64SEVAuX4lZ4bhCx3h+Baw7ewOZNv+30CzmYjfu/k654XtCsp0+AVJSL0qQP6Q/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzyF7xrI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ellh6pu7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4U2F53857785
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zO8uh2P7KePpposrMGLditDRhEDDneSWvz3
	+8lT2xWk=; b=VzyF7xrIJN2WxAbxMg1Bfhdh2gKYRzp4N9rdzgQUiQLM8SNUV99
	Pr0lwNvS42LjRhLeWYL9pUpjr6E/puydLZqm+VrcJrL9SxPeI/I8rXyNMsF24VPf
	4Uaid2IeUgx52d76kk/yL6Uld7+4X2eaG0KqGLnStSRtDbCPnuQouumFgbcNIBnZ
	wSHHHm85o1c3OulfbTcsVBoMicUAy8utGZEHGvVtyYeWZs/d/54cjc+Y3HoIgG8D
	G8jaPZJL2UVD73wNzndirp+QvyDdizwp0WOk8Vw+5c11q02VVWlhV2Y51i5s17uw
	NvbuYNCSiEvYwZX2exGRl5d3MTLWnZA3Tmw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs215g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:01:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c61334ba4d3so2688023a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769504505; x=1770109305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zO8uh2P7KePpposrMGLditDRhEDDneSWvz3+8lT2xWk=;
        b=Ellh6pu7MlrR/ou899M36HWzXpUVJVoYuB46/HQnVELXFAZvgrByqfZ8lYn3bQ9PBP
         DfRWh5Lt5Ds3Hslt1AxOrXMa6TKYGEj6FZsBHm8SqiqLuMn7UtaT1yTiQ7pzYw362R4y
         /5Ygk0rMCowwHNoXROpqYIfOP+LwBX7YzqTcVRfttdsKpXpsnFAJ1g4mMvqn4kNft1LE
         4pxo+1X/4/Y6darDNLn7PsaecswRLeu/I5Iwn1Sn5CdXmd6cKloccRvP8AWJVxsBY+1Q
         OzIS6ohfEvCFlo9mL1DCoHvd+MAuoqmspmOOdbQlY0+9Rp2f8aVt3eI2JV85TsQimdu3
         cu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769504505; x=1770109305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zO8uh2P7KePpposrMGLditDRhEDDneSWvz3+8lT2xWk=;
        b=jnaC+0epI0mbnL3iyEQNyDn8KAeL8JqroQtcWvyCTpZ2C+qmS6jnVNtaz809UuP/mu
         zdBElqcUyb34VEQUk3KeNRRVvghfNpcJQDrjZNKU/xQ25wQem5ysCesWLdBl6QTjrDTh
         dfTzIEWUPTIUPTCWM+woA4ZKrJvKF0GCrhL53RAdfDotHObhulwnz4+FNBMmCPIL7Ssd
         IAlt5hl5hzEweE9Jd/bBG4Ft02hQwIkE+U/3DU8t5NtNimaCpoB7f0TjCdK++oyqT5ZG
         RyKbwtrdq+f0Q+CdKuoajAQRtm+kxbdCTBGhppMwm0wrdRFyX0wZ6QiodJNgZblbO1E8
         N3eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwSt9sVt/To/ryvGA+LVmPO/vLCYKtnNinuGI+EyQofap0FVc3ecrgRzLxmcpooNo6iYYiO83sJ9lxjZtW@vger.kernel.org
X-Gm-Message-State: AOJu0YyBHNC9WyZJzQVHruWdVqeKza0U8giE1iUDWNe1IxeWHfbG8MAO
	dhGwtVtSymdc5UWg0iGrDkkjky63fYVtLrOxo/K8HtNGcoGXpsT1nG2ErAgVammt4wdWnDvFuxH
	efa/keEzytOOOJbladUTFivTZQWmwGjV3o3kiG34hhbQgXIeTw3pR/i9YHQ/bTkxlW7B6
X-Gm-Gg: AZuq6aLvoW8ij8YK++oyu4klF4/ClGfUjXChd9uqG+p3wAOPWzIHkIG9iGUxQkYox2L
	rDveirThbNgtnX2k4yYT/Ho/0ffbOLGdtft3pPp6uCogY1pdyTT6wqwMt3PXhvo1m1Q2e4y7eB2
	j8XkMiKb/+LbOu7wftxlEYZTAtixUybLujiOuTdvLzTFJ1ijMT+ns+KmrVXV+znzyyNKThuBJTQ
	Zm2WzkKiS5n+I1bpNEwxgzA9dMj7FRY3DrZWQlihQxp0Dd/oYjrEIBMUQVgy+IW5KJWbOJXZVki
	Xso1fiTuldv9os9r5hxVU2IhRvNB3bd+OI7DwKlZRiIFC8oLRUNDrrvOvLbugSfoHOUionmPtLp
	l0rBAJ1o2EiWgZJAhFmZfBMrctM8IjrjH9XnqqttFoP0=
X-Received: by 2002:a05:6a00:8d94:b0:823:244f:1f91 with SMTP id d2e1a72fcca58-8236916b19fmr1019890b3a.11.1769504505478;
        Tue, 27 Jan 2026 01:01:45 -0800 (PST)
X-Received: by 2002:a05:6a00:8d94:b0:823:244f:1f91 with SMTP id d2e1a72fcca58-8236916b19fmr1019859b3a.11.1769504504856;
        Tue, 27 Jan 2026 01:01:44 -0800 (PST)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873bf53sm11579228b3a.45.2026.01.27.01.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:01:44 -0800 (PST)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Enable QoS configuration on QCS8300
Date: Tue, 27 Jan 2026 14:31:13 +0530
Message-ID: <20260127090116.1438780-1-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JngUEwpGysDJyTLdE40sIXkPEd8URAH2
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=69787efa cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zE-JDaMYF2uaPRVanG4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: JngUEwpGysDJyTLdE40sIXkPEd8URAH2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3MyBTYWx0ZWRfXwz9G9PU0lrTU
 3C+eHhr1pAghLZqjMrWOk5L6cVgu0eGyuxjpKzrXSo9HIkPjwRYW5wqc/GkCTw/8nsnA40NSSzO
 n3MrwHZy9v9BiEleBRCjkfkH1lGsIYyRNYMgbWS2nGEenEyhpfhFNytRztgTtFgVaHP6wOoYeF6
 yzGOhc7rGFM77pSCpm7ImVmtM+/cAEEw6NqnlCPMwfkRRaKBpDLEBMpPkzFTRSGFAoEp1mTkTE9
 w4IAsHMDd7jk3+E5+32fHukecnXaR6bMNHsKhNfaoY2m5dIzYZbBhIQKQ8+7Lmxm1O6D8RBktFy
 mSsSxES9sMj8gypdDLVzqNr1gEcpLUmsFOGm31EGuqc94E1hDyi6kfK2jM688/8DL4Vr74A3CSt
 r8GDvioW2imZffgYsL4qiWXsbmcPtj3x3hoHfSR0jDRDmOcPfMVElZvDHRC81kW/k6p4DoCvK+M
 qp8Jswaz0QhFblk6whw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90675-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[odelu.kukatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 665DC916A2
X-Rspamd-Action: no action

This series enables QoS configuration for QNOC type device which
can be found on QCS8300 platform. It enables QoS configuration
for master ports with predefined priority and urgency forwarding.
This helps in prioritizing the traffic originating from different
interconnect masters at NOC (Network On Chip). 
The system may function normally without this feature. However,
enabling QoS helps optimize latency and bandwidth across subsystems
like CPU, GPU, and multimedia engines, which becomes important in
high-throughput scenarios. This is a feature aimed at performance
enhancement to improve system performance under concurrent workloads.

Changes in v2:
 - Updated the binding so that the `clocks` property accurately
   reflects the hardware and does not allow describing non-existing
   hardware (same approach as followed on sa8775p)
 - Corrected patch subject to follow dt-bindings prefix conventions
 - Reworked commit message and binding text to drop "optional" wording
   and perfomance related description
 - Dropped the redundant additional example in bindings

Odelu Kukatla (3):
  dt-bindings: interconnect: qcom,qcs8300-rpmh: add clocks property to
    enable QoS
  interconnect: qcom: qcs8300: enable QoS configuration
  arm64: dts: qcom: qcs8300: Add clocks for QoS configuration

 .../interconnect/qcom,qcs8300-rpmh.yaml       |  63 +++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |   6 +
 drivers/interconnect/qcom/qcs8300.c           | 375 ++++++++++++++++++
 3 files changed, 444 insertions(+)

-- 
2.43.0


