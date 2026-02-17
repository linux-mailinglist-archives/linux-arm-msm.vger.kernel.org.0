Return-Path: <linux-arm-msm+bounces-93044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNzYFgYBlGnH+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 06:47:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D98148DBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 06:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AD1C301A533
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 05:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6B32882D6;
	Tue, 17 Feb 2026 05:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEmwO+hU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHacB3dG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704E8248F68
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771307264; cv=none; b=Nhinl+pXz5lBhwLLmkTpT1oseHpUXCOu0hYiEoMEjcVgHg0/3RJ6c0+vdl00AaxOmUqAOf6VMb4E60ZRKj65seNx9i3jcZnNcoqs1ooqzalmislniNM5jWJF/cEzUmmVvYYYYFaiV0L+23KAXSSoBZyNF7VIONOBfAHsBR8mCZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771307264; c=relaxed/simple;
	bh=LxYqMhSYS/MAZWI7YVw2U141yZfeBCuS2fpIrU1nMqo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eyXW5W3iEFtdnN40+98XCv4vaYxvn5CthL3J0K5URl0bQx3ynYM/fxg22fhI5cXXHiW+ccU4/bkfo4/kJhUVRD5G3vygO88Mdi/zByKmjC72kmbYyhi57jMTn6YrrtQ+i4AHxB43MZNU5uMe1rOPDXLR/+7sjl8lBKKxikEY0n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEmwO+hU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHacB3dG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GLsFLk1728549
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LJVSnaT9aLHnBjg/uviI6W13C9foF2N7E60
	7XixbRhE=; b=jEmwO+hU1iVJJuS9+Rje3yLKjzMKWjQ5A0dDawRYvkwkYBPK8Qe
	Bii+DaE+ihhHfWKgKJ9GMXl/dJ/e/u58KxnX752iqwbt76PomfZxHxenWmInpgrU
	zdL5as/K3IuIx2SF8iN6GDvCC/boQchz84BS7x8hrF+ZEK3nxzhM0UsJx27QfY6Q
	U0NMZym6Y4XcnYG6Sq8+LDSHHw+INA4TqTWXAhequYw7S/e2Foj7DctXU8kf+5ZY
	P1wb5NyfwSq0lgtPUqJSWkx6xi7Yw7xqM1OICa5iAhuBufcyigmqR3L/Yq4Fob56
	cOPIE8trJrYi5WstxLGfx0IMvGcSyMe4TCQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9kejc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:47:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aae3810558so44366325ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 21:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771307261; x=1771912061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJVSnaT9aLHnBjg/uviI6W13C9foF2N7E607XixbRhE=;
        b=WHacB3dGC68VjfZzw0bP0f+vqipP8vPTVJ5xkZ6m9vwNwSHiI+TLIJcvHK9qJFy+cR
         Fk9y5GE0ln7O/5qoObFu7shM7tXDS60dZsjFSfaBvjXOg8LIjkUz4+DU8jrnszhVybJI
         HwuEcyxFz85ybYM9cMdHp2zIQY8GWmhoz7wwrvQFr8e2Q4tlhmtrmAnGoDA6Jzzp2NqZ
         SoqNnpNv9oP7n4644POm68KI1X9utAURlDp0IQtwbMp8DTkdOI5KmyeulbQiNdLFOPYo
         FhX4sXcikRQpdpz8idiiNrZgQx/D4yWc7tFjT7WgKDRMiaGPG1k9dtXm/0pak2vE6O66
         aYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771307261; x=1771912061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJVSnaT9aLHnBjg/uviI6W13C9foF2N7E607XixbRhE=;
        b=hmEr0Jfwam/Pz9ep6UCVrg3afNb457vkffm+12pywEKRuZRTKYrjrNzXbqkcD78Q9W
         naG5UppeI/X6bQVPdOi3BPllWgl3ao22H9YEE+Bf/HPRkm6S9MRxbT1IUi9NavNzOTEz
         SFjVuMAx0yl+rcwdkoEJzgMBqv0dSQz5exmkR4VNj6swielmDNGvsuB1A9zXX+gbovMA
         zg8Dd9h41H2s32cJ7FKN1LLLpVIk2usUeieZTofE1XASrvHoP5jLkurzCy/MPpe1vBjK
         kMO77Iby5+MuRgietLZ3Gm8uIPQShjwBBME5H+oIMzaONslo2M+sCbOhZy1mFTjagXm8
         1v6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkfs3LXzR/1f+aw5dmOVq9de8tsIYLogGSEv93QyfjU/zV+7I5W9eRHNvfLKZTQIAM6kCfnuOzg/jXGaZF@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ6ZXj1ShNVvtuuf9hp1Y0trP1pHIMS6kRTBzsH+o6WxjrjsmM
	dHbTu160zOxBOIop2fzYsRXafir+m0YiidS8xpszqUWlFGmn8PNjyxgf6X4zYGeOX3p0EWgMgn5
	pRIsxFYNRQhYfY29CDQaYZoCYO6m1fDVooj/sqJYmJ2sHy7VKGOA3Xn3jppDL0JpBxZ1k
X-Gm-Gg: AZuq6aKh2ouvu1N+vCqup+E+kc3woaUMQSfd00tK4w6ZtcFzqrrgxbv2nO5CnZC3Ecf
	tK96DHei0SKcjm+PYls4hQS2UnG0A2bYSEWXV34Vrs5+QwKQpZVwm36EGbXF8xpRg3i4nZEm/R2
	j9SlqmEVn9Jn6xngmGjM6834kiKf4irlEBH315vlA5xrVhmWvDgZkT9WzEY//wQKkBxlH0RCtw4
	ZI9IQOpjBFr7fZ6idOLG0oSABvO0xU239GWGPryuvmxOF5AX8GECxN/kQ03/8QfcyAyGszgxBhV
	phNVyexTF6x82gopmCGkb8JAPhz7ixTFVjYgDEGGgx6agiGc0OvtELJzIRxQNYvpyAFuzMOa924
	0fiF6CJnUsmXNjfDJeB0M/Lw0AYoYLqi04Ls8JwbVKS+topp0cQc=
X-Received: by 2002:a17:90b:55c3:b0:356:268f:4fc with SMTP id 98e67ed59e1d1-356aaba0093mr11858769a91.11.1771307261305;
        Mon, 16 Feb 2026 21:47:41 -0800 (PST)
X-Received: by 2002:a17:90b:55c3:b0:356:268f:4fc with SMTP id 98e67ed59e1d1-356aaba0093mr11858751a91.11.1771307260843;
        Mon, 16 Feb 2026 21:47:40 -0800 (PST)
Received: from hu-vivesahu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662fac3c1sm21429775a91.17.2026.02.16.21.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 21:47:40 -0800 (PST)
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        janaki.thota@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Cover letter QCC2072 enablement
Date: Tue, 17 Feb 2026 11:17:29 +0530
Message-Id: <20260217054731.3058567-1-vivek.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FsDys1TFp_bUMfdBgqbuiJT2UA_X19MG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA0NiBTYWx0ZWRfX+Du5FGkTD/Z0
 x7lDL6bXODnfeWIWz357LXXlQoXtZsvF27zplbL3LTgklAOIx1GGN/gr8n6lPVQZYQ5tpOljaes
 cibxQm5SXuD1OfLsPFDOuA6BUuMvduSz9AYk+JzYiJ+PX1lvGS7N3jlMDM4iFX7zpgiRyvGx/ut
 Hlt27eluF3Or8Sdrv89C0J6Xn1tkK7h+wDVmSVSp6m7qDuL7LEP5w5IohfgNoze5ENPkX62uxu0
 nrWjeSJ9rDJk+QMgKYwctpBI8t0bLXnSdq+hZDPSPrCkJNpnetyKz1t4siTXz2UDewa0RawkhIo
 R0v8eg0QUKZGpjPUlNZvuDEgdh63UZttUmvK1NutnSIJa2Q8CdnF23viJCEMuwWBavj81LYM3rj
 P4XO2oNaS7mvxbMEFxRuSVFZrJl0mGcIBceGjds4Y3PlXci1pPbgD1JCZ578BXAsjmUi9Zpl3HZ
 noXSPrzY5cTtqQ8oJzQ==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=699400fe cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=cq3e_Fw05WLFSlW3opoA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: FsDys1TFp_bUMfdBgqbuiJT2UA_X19MG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_08,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170046
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93044-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8D98148DBE
X-Rspamd-Action: no action

The history of the patch set as follows.
v1: First commit to add support of QCC2072 chipset
v2: resolving review comments to sort the chipset in the switch case
    and other files whenever possible. "qca_btsoc_type" enum in 
    drivers/bluetooth/btqca.h contains all the soc type which need to be 
    enabled for BT enablement on the target device. There are few places 
    where logic of framing packets transferring between SoC  and Host 
    depends on the which generation of the chip it is, refer api 
    "qca_read_soc_version". So It is not sorted in btqca.h file.
v3: indentation fix and "qcom,wcn3950-bt" is deleted by mistake.
v4: made a separate change for sorting chip name. added new schema
    for qcc2072 dt-bindings

Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>

Vivek Sahu (2):
  dt-bindings: bluetooth: qcom,qcc2072-bt: Split to separate schema
  Bluetooth: qca: add QCC2072 support

 .../net/bluetooth/qcom,qcc2072-bt.yaml        | 48 +++++++++++++++++++
 drivers/bluetooth/btqca.c                     |  8 ++++
 drivers/bluetooth/btqca.h                     |  1 +
 drivers/bluetooth/hci_qca.c                   | 18 +++++++
 4 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml

-- 
2.34.1


