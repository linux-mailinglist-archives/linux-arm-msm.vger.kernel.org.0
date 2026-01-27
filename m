Return-Path: <linux-arm-msm+bounces-90819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOKcGRvgeGkGtwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:56:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFF797353
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7B34301158A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9ED1E8836;
	Tue, 27 Jan 2026 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RfHZE96P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBK/ElDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3583435CBB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529348; cv=none; b=dfL/Tch1NHeKgm5B8GwoG2Jild+O5EeVNst/uMdR2gTcTCgZGj8WZuhcEXXEM0S2Lb6naGKiSlZQ6ZrJgV1VFeqIKZC3iZTgOhm92QmzcvPqC/OaI/XANsFezjo0dLlHas0vevqbjBVD+Rae6K4c2vomM6EyXlUI4YetSB2EAok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529348; c=relaxed/simple;
	bh=DhMqZ1IOAMNI0s8TpNDJ6Na9ilMlUn4q1WtX0cQ7LX4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mla6DxOCunYU0BSX4vaDG90a93X1pWqdkMxRud8yaM6nmmsXAO2BQNLwJlK5wXttAsNWyUx5gxURjQtM6yO6PAqRe4QEAKspnfDcnaQxOgVrq1MRdd+a5T7Sr4+N1qgq3LbYFg43hvm9qI24kkaW31dwH6j0UHGF/fX3d/jAOPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RfHZE96P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBK/ElDZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60REZmXK1066162
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XvW8ehfNE9OWd7zQM2i9DzYPJQ1l8FVl2Ca
	OTIFKZ0Y=; b=RfHZE96PJHUxssL9FuCovdQY6C2i7+qoRe4j5eXt/ASaRFNGhhj
	OnZk5R1lg0hRZd+Qx6n0D400E0CAFB+F2H0c+n2iBHYRBMKoq1ffurYYE+07rquG
	Wl9a/TvwGFF1+Lh4BTzroYtcPeiCpO0WauKRSTbffnspK4Xf0QjF4mfs253CLdzw
	+f8o83Sz1IwIktHTm1XADMXGfRJTfo8qsOzN4TYnLB6hl1JnGTGQ9U2HEY/AFgpz
	xfRrnTNAbySoY3ymCQrTpOpGcY6MvhdVvuSYivkxLyGcy8kgsND+oRBaCNLNW6Rs
	hb0dABvXLW03ba1xs9GgLJV2qS/kUE2R8fA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxy8x09fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:55:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so6042051a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769529346; x=1770134146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XvW8ehfNE9OWd7zQM2i9DzYPJQ1l8FVl2CaOTIFKZ0Y=;
        b=iBK/ElDZZcC2GD0O2QXblEqOpeVU1/BNG7flSiZf2cv7P08XxPjTD1uhrucfFmRl50
         tmyJmAEOyZhnzMMpWR0HVDq6vbXFok38AGUj0S/ssWDfXd3dbCzJcpSBtZeyDRyT2ruB
         3tVqxcfQKG4VUQgSIyf2sjpRNqhzb4fg0Q5TQbez/gSIETzsm+cudHR4O5a/KnViwmwr
         h3NarfpL4akzIyB5Kr6xFEJiikOKS0qs0QkgV1+10nYVM59qhGKpLnycOEyeaCdO6yiF
         jdCjPhZ9cNRbsDta31a1cVc58fljRBvqHfWLmXkVdjZDhrUZa+gZbb/Mhf7Xjn+chAR3
         WS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769529346; x=1770134146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvW8ehfNE9OWd7zQM2i9DzYPJQ1l8FVl2CaOTIFKZ0Y=;
        b=gXNZdtyyyjKTfC8iYVIYz5267XwORYiZq4dgdH964ojYN1Ii2aXbBCpNDt0ACOr3uA
         gZCSF2sHOJZGdELjJpzkdPse4gApy9lbM7Hzyhxyg7buXNMMBeSF21kfWKdfG/lPWLWq
         UHjbP7RMImdv5EzcNAU9dqI+xSMpdvFtAl1mJ7L9MHz3avZ/pgU0W1JKTr4661n1Cu5b
         RV6gyHooYR2MxzabSXWRuzuhUcCAfjbKjwRejX+/FTl3C3h5S4lkLpFaE1O2sHp1LxEj
         DSjZJWHlzM+NWTthKZ+giGPmfopz4m28EpyVnj+nEZBlKkrGbiETrbUtoXqAAHgp1UWO
         nt9Q==
X-Gm-Message-State: AOJu0Yw+osqMRCrBCeis+vvAJqAbyBuHl4+OsJ0wTA1BF6l5MZiqdUnd
	YyMnSgIpKAiH7hoB7Yy7mSevpimw5fJLvLOaOTsKnzKU4g4+9MW55Ye1gYreJ/CRv8BkknLUX2/
	w7kFacksHM+aIoH/npN+Cq+U3VoE2Y5Ife/y5Vn30BlD1TNxKUoa08Mhowd3kmkeh5BIk
X-Gm-Gg: AZuq6aIgSAoukqVBwNSfyYenjIgu9ZwG+0nBXsSyyrjRQi1BsqCkB/uYBEo8GjbTy07
	a6O4OcCEnBFb5niUgBdmbAQajJvYbLazfA9SsV/Cfjrg9/hbfNIoQ1YF5xtIBuqafcpQkSbYUDE
	z/k9K0q3IiPz/hO6DorhQlaEbU/4PFUjRnEIAvvm+WtwE4r2RZ69eq/TnjvBvXjkQjtIwS7GAnv
	OEWFm282STFZ9xPX/jzircvzLcBVAHHWtte12lQP90OrXB8CdxqdlvGHTOqfuvloclxl7zmQ6Ks
	B0tBm6zRQJMI1J4ZKhl2fyNK0phAtdRy80ZVbkOCMT8gbi5KTHhaiX9Icut+0dIKUe2mdE8sAm0
	3yaIKzHJTlWvaO/En5IqHIKByvBZ0ZRIarHBvGW0CdiUepf0=
X-Received: by 2002:a17:90b:5208:b0:341:c964:126c with SMTP id 98e67ed59e1d1-353fedae2a1mr1957946a91.34.1769529345753;
        Tue, 27 Jan 2026 07:55:45 -0800 (PST)
X-Received: by 2002:a17:90b:5208:b0:341:c964:126c with SMTP id 98e67ed59e1d1-353fedae2a1mr1957921a91.34.1769529345218;
        Tue, 27 Jan 2026 07:55:45 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536aed7802sm6131475a91.0.2026.01.27.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:55:44 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] Flatten usb controller nodes on Talos
Date: Tue, 27 Jan 2026 21:25:35 +0530
Message-Id: <20260127155537.4088709-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pkK9bbGH9uUGL-Z1_79dhmKYERiVJhka
X-Authority-Analysis: v=2.4 cv=OcWVzxTY c=1 sm=1 tr=0 ts=6978e002 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=wwCzRCD4zyfo-UnKcXoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: pkK9bbGH9uUGL-Z1_79dhmKYERiVJhka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzMCBTYWx0ZWRfX8EOFYvstEvs4
 Wwdbqth3pRXoUdZOz1SznQ9nWwKnryqmv3kj/wQ8F4MIcAS68tKPGNYBQyTDxxogpJq8W7OVAQ0
 vruDiwddkW7wP0qWsqI5XOPFAdZsUt2m/GJ7BGOhiR6hxsc6fMbUE+cLvb7ycltaogyzcGuGaeE
 +IfVPAVtUYBRjD1b5b9oP3+j6AJEMKEEav/WpRpfVORXmT0THz0Kq+G8rlP1zLdVIbN2AmaUvxQ
 qzG2/PeQz6VuPduyLrTLACgJgP4H9yJIU1jVTW13HOpT9w1ZTPjZxD+CNQ8Enb+rJNmnShWZFdV
 9ZbsmwrljaEtlAX8dhiNkR3FGZwkzF5/Cttb3Vm1kFJBIyX4KVayz92VP4BzBWU1g84yz8ycXAl
 6pLkplZl/s88h8d7TwkYPKgD9tiuAky74kjE+KVk8+yuMGdAIHyiwlvbWFwQagt8ikR7jfuz5RU
 xNAeNbdtrC52BDppbWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90819-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCFF797353
X-Rspamd-Action: no action

Flatten usb controller node and update to using latest bindings and
flattened driver approach. While at it, add the wakeup-source property
to usb controller nodes.

Krishna Kurapati (2):
  arm64: dts: qcom: talos: Mark usb controllers are wakeup capable
    devices
  arm64: dts: qcom: talos: Flatten usb controller nodes

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 +--
 arch/arm64/boot/dts/qcom/talos.dtsi      | 97 ++++++++++--------------
 2 files changed, 46 insertions(+), 63 deletions(-)

-- 
2.34.1


