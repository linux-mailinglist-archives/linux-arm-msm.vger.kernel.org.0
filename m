Return-Path: <linux-arm-msm+bounces-96950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEe2L6BFsWlCtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:36:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B15A262517
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ACC8F3001037
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8DD3CBE93;
	Wed, 11 Mar 2026 10:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCif0+eq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hIDyn8hL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E08A3CEBAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225374; cv=none; b=NEgAq2UANjimikfWsUEzCfLGPC0uzUpx/0er/gvul1sHjf1jJvdT9mCjIGbCWDd0+WpxYWKIKtHpqMLQm1Hz2JiysrraSwbdzv//s5Ge8lfZU03cyPP9aaMmphR/1x/LVLTLo3skOdC6HHtzI0Z/VLyZJG2k0bx2cV0q7va72UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225374; c=relaxed/simple;
	bh=V4X7SQOiKwWP/Pa3MnE0/qdRZc1SxulGZjvcaX8/aAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AwWiBi/rto8StolecQOlCMeQIIfUHCxyLs+RvBx6aHV8rQVrajcWPFgj7IJmpksUM1A8ZilXtQQpqB/FTEpFkt93f7XFwXlv9GBx2GnvPBFwuYHvkkJrY+A18hpyUH/ViUJDXO23NIM+aqw4nSGsxyPBaD/LiID0gXNNEjdsuRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCif0+eq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIDyn8hL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7Px4L2030768
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tpHlvfxHMXkkRB+NxUG0hcSQhE/rKGHsEhV
	os89NpKQ=; b=XCif0+eqM2oNx02Y1VJxOBs5OCZ28od8dKuytWK0Dieo9Ggq480
	mznpFLMNYUabdFGnEZ6Pj0q70O/EMgdbdPdPW5WJpEymTT64Er+XH7fZrzTO0AKt
	tayaIZrifKaBkOMGLVnskvrmZTqxJX2W9WPf5jbsIo9qdhlpunuHzDjr2qMtw/le
	HRjyR8BBDqurcLPRz8Z8dMDNWpe6jR5dj4kHmGr+rbI77LijC5XZWOUMRGO2CaGb
	ijrA08AQpi6fW9orwpYvfQnu7WolfPe3tbQNOY5FbhPkvlhm0BdLn+O/YMn3Y8Um
	AR60ovqbxlT9oTysmyPXSPYY/WUW7+J2NTQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h0rta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:36:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adef9d486bso128609625ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773225372; x=1773830172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tpHlvfxHMXkkRB+NxUG0hcSQhE/rKGHsEhVos89NpKQ=;
        b=hIDyn8hLvv7MFFcaUUDJdeIpGXlJX4aE62ysJvt3j8a1WQ+31MHSEsYQ1svPSN3rw1
         Ww7qCC9rVV5jCC+Ak8tOVNTtvnk/wO2GVh4zXU4UezpquXbZeAPECpxG9+ke9Uh0DGJS
         +lTz5mx2zzz5tO3UdKgW1OxH2wDn0jZTdZ/DF1NnUOsz1N156sNCaMy0/XXmJOaXcFs/
         WLheANabRVXEA8nXsvPJpc1XMpc1KOZRyjzZM2dRBqINh4ooYVLAql0T9hh51awe0gGF
         qH1WXYhJZ5T1jVJXjHwv//z8yVqrts0BMGzXdpqe2ELPE8jEvkamtB1kF+ld1jqRyQJO
         S9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773225372; x=1773830172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpHlvfxHMXkkRB+NxUG0hcSQhE/rKGHsEhVos89NpKQ=;
        b=IYNZ9RsGrM+660meOt1Ga8MnuKAuJCWX4FugixT8IdUp+hAOdMd/8HP7n6dNXq8SX4
         Y2prfyJdhMO6Ne6iEaQuGhy/YkUI0yaa8IJdGpbirDvN7SMYypStr6dTOuUcTKBhcLRU
         e+K21QcQ8zntSBQr2h1CMqh0ICozEnKBZeUViuJvrAKmkHqolgFBYr/uNrUXbI3SL/5h
         Pdug5nqAM1sWlZWd0G71fO09o+NIkxLz3YIzVpmMc90xZCk4HYdvnkJ8yYBJ17TBjOH5
         pU7ZUCNMD6ooO0MvLwGYmsSEh6c0sjZf29cgMmJkXE76KEGeN2oCPP9OLzhncNHVRgXm
         NhRg==
X-Forwarded-Encrypted: i=1; AJvYcCX2eMeJ5WwBaKO2vBdcqwfnZa6CpyoCUG3GeaCHwVYI7kxKy/pfeAN68PC+QFLWnPP2E4ytocjS0BVBqbL8@vger.kernel.org
X-Gm-Message-State: AOJu0YzazrPSGxUV3ubFEfvS521G8Jj0BZ7/XIu64DJtJmO5MKrzT4XS
	3l4aOniX1ACaTKemNo6UOljhuyBpxYy+6pQz6ousopLa5Yuzn72SWxoXHvRJanHW+1coAFab5qC
	CIPjEDp3YtgYV3MM1dZTKIoqgGzn71eMD/HpiukmGn0tNtBZC8nhLRC1wTUMXijVNJNv+
X-Gm-Gg: ATEYQzw5W6L6U0nDR4tJBktJO/tIcG64yrSSycJjMd+iIi4ejuxmQY1FNPRZ03VkStH
	KpQu2Ha1ijJucDh6kTIAAoUUI6U4LJkp35Au/J/3tZxWIeZbnIRajhjfnvUOOdZK5UwAMuM5k5D
	Jisft/vVMIXivbJpAZFvOxk6aSD3BB2iJNCenMyfXG2d0H24ph2J1e1jV1AFtfjbXQKfeuwcbRm
	5xdZn4H151F3M9F9S4ymh9BvwQECYuK9vt4FYzCm70QHgJqWEHopZTPUY1oYVug9ehkpIie48N5
	K8wgMn/2BlEKzTIcHn8AGbKi9EeQH4z2pr/spqW3o/DKNpUn3gHpnPNXIGjHeQCWVRoUZFDUZk+
	UwWDTL1kEmQDM/Xz49JUoIp3U/PLpTrqnmSfp/T7DKwdecmQTDRK577s=
X-Received: by 2002:a17:902:ec89:b0:2ae:55bd:1473 with SMTP id d9443c01a7336-2aeae876b3dmr19743165ad.31.1773225371998;
        Wed, 11 Mar 2026 03:36:11 -0700 (PDT)
X-Received: by 2002:a17:902:ec89:b0:2ae:55bd:1473 with SMTP id d9443c01a7336-2aeae876b3dmr19742895ad.31.1773225371465;
        Wed, 11 Mar 2026 03:36:11 -0700 (PDT)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae378a28sm21042925ad.88.2026.03.11.03.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:36:11 -0700 (PDT)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Enable QoS configuration on QCS615
Date: Wed, 11 Mar 2026 16:05:45 +0530
Message-ID: <20260311103548.1823044-1-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4OCBTYWx0ZWRfXyoiNiUwzxXv4
 QIodZ0khcskaryZfhVcgAS2gtr90K54lfM1Q94gKpVu2UkZsekw++ia2/yxcGqt/leMTaR3JvRG
 Nk72k/3XcaqUcbSQ+Jfg88FhJXyskgW7VGtXxGpRXDkW8jq8l7E1kN/UVAPfH0yHGoxGAJ/2JUS
 EGUlFvOahJFkukJj/3RBj+ZQk28kKhPVbh104UHazsj+7IvAOm2SyrxHuKf3+auGlulD0bpk9Vy
 1iqfMJJATAjDHzBfkXWrRvjND+pmvCJysU7OtdQOADbVNtyl/aY3hxWJn7W3yG1+gvTobnP7m21
 wEhPTz9RD9tJvzzpc42PxUHHVFV4QlK/D1itO6dX3DBtf1H4KpAlK/CyD/tp9UgSLsrTT+io97p
 9cpOC20WkYnmUm2y4Ix8Rqm6A0D20M1IcYoll+G0ks8xMf7mspLiqnOmIhYkML1AvMgtcn8Dajo
 H93e+f3pIBF8Md2SSGA==
X-Proofpoint-ORIG-GUID: _uLEOadbF2H8_8b3YViMyMJPhZ1uBOpG
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b1459c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=hqR9uRmBdb12yu0oCjwA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _uLEOadbF2H8_8b3YViMyMJPhZ1uBOpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110088
X-Rspamd-Queue-Id: 6B15A262517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96950-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[odelu.kukatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series enables QoS configuration for QNOC type device which
can be found on QCS615 platform. It enables QoS configuration
for master ports with predefined priority and urgency forwarding.
This helps in prioritizing the traffic originating from different
interconnect masters at NOC (Network On Chip).

The system may function normally without this feature. However,
enabling QoS helps optimize latency and bandwidth across subsystems
like CPU, GPU, and multimedia engines, which becomes important in
high-throughput scenarios. This is a feature aimed at performance
enhancement to improve system performance under concurrent workloads.

Changes in v3:
 - Refactored the schema to define 'clocks' in the top-level
   properties block as suggested by Krzysztof Kozlowski.
 - Removed the conditional logic that strictly checked for
   'qcom,qcs615-aggre1-noc' to define 'clocks'. Instead, the property
   is now defined globally but explicitly forbidden for all other
   interconnect nodes except aggre1-noc node.

Odelu Kukatla (3):
  dt-bindings: interconnect: qcom,qcs615-rpmh: add clocks property to
    enable QoS
  interconnect: qcom: qcs615: enable QoS configuration
  arm64: dts: qcom: talos: Add clocks for QoS configuration

 .../interconnect/qcom,qcs615-rpmh.yaml        |  34 +++
 arch/arm64/boot/dts/qcom/talos.dtsi           |   4 +
 drivers/interconnect/qcom/qcs615.c            | 247 ++++++++++++++++++
 3 files changed, 285 insertions(+)

-- 
2.43.0


