Return-Path: <linux-arm-msm+bounces-109419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNcPN6i2EGpDcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:03:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBEF5B9DA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C77C309089F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313E737DEB7;
	Fri, 22 May 2026 19:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKvIAoEi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PgR0KEEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C6E37DAA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479761; cv=none; b=lSPfCQWSQ7rDjTEmnnpnIwozhTFNqAqqp5BedphyupyUBWgY4pwvqauLNp/wRsYUaokuH+EZZwVC8JCpxERusFR9Pe+9tIm6FSLrJ130M1gRy43Hqo1F5AcvfI9OCLDi+WKhGD9WFcCvfiQD0DFH8/C1Ch81jFd7kLcgYhi2MvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479761; c=relaxed/simple;
	bh=IYqQ5p0U5bEuc78RlMUT3k6dFqYxkC6LK86NxP+Q4SA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gJwgIuF3u/KVoCvyYXDekbE/pKM6p8/4y7WXQLPEyqh/sAdmCowMfndSDt+nEuihal62S+vFj4YWKa1WAeEJQQmIP8x/447XhiGCfYdHI1zLXSMusm9ABIQsNqHf7zmxh+hKqzw2IHZ2AE30a4KMYXoSOZ7O2VUySMOdCD0/0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKvIAoEi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PgR0KEEJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG8dNW3005101
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4OpADcIGGFtxfAlOGVA5Pl
	SKEGlVjoTzChsWECE7Ecs=; b=QKvIAoEigEhru1UvfkVmDyJncdbv4wGsZiAy/9
	zMj07W6FekIb0RWnxsOo3G1iTilLhaWA8n9WwoRZaI6rDxi5RhHjb66a5c/aKadj
	MkzOn3hvvNKCmjQbiGXsNR5XMexiTqPvvC9rnim4P2GCzuwTpGmsmML7lQdipGX5
	BJzsVZMwWgTGdSYyp5bGx0i1poyfld7kiz4DYSC8W5vBmMncT/XoqYgRoSmiDGSb
	GdgzkO51Q0wZ93CLBrc5vqCRysb/IAIDvas36kUofbzt9i2XGn2U88RN+oRLV9xF
	l1HAxU7HfwOs7MaKi/1MqkI7rDKrVb/qFekPBqzQrGqzBreQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtbpyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso75665655ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479758; x=1780084558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4OpADcIGGFtxfAlOGVA5PlSKEGlVjoTzChsWECE7Ecs=;
        b=PgR0KEEJXbS3QumRVC7EnePimcIPfu2xHeVt9An7y/V38PwMdCatcKQFSKDLdBX17H
         rPo0DW9c7s2Q3yMSiZuvigaPzqkDizR+1lacV+XX/0/xlgEN9RpoGZf7i9qfGM0OoCxa
         CiWWGA1Ocawb78keId5iVFWhJKF3pH9u8UBIJ1tlGJa6CxLYyyFHt+ym77dfqH0Uo4RO
         5IwT46b4O4vTf14YnO4ibvtgm6yUMj3toH9ZeIrMpL+xbJ0k9imOogfP9JZ91E8t2jM8
         QBsX+5keUgGNnAQM6FHrc57ElJrviI7BBTy+trpWpgUNWkOYpLwf8WhW4OsLDq9tHsHo
         M/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479758; x=1780084558;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OpADcIGGFtxfAlOGVA5PlSKEGlVjoTzChsWECE7Ecs=;
        b=dE+DWJK5soJjdw/r+qiQ09e1j93RGZqxNjxXxJvKqbBfdJhlXauBPOCrlq8mroxsac
         1VE/X8cXk4OD9QDCXNnjbeLwQAf9TP0HH1lVJ+4304DLpgUP4MBFhD+QjZk1Q1R0UbCm
         VPlbAwTWmmIOMBJ17NohC8/Aodf0rAC2eCxbPO9UZIAhjDFbV8U9R+QNrsMIj7+l1qGY
         SpQhaSrvv2zCj3pJUSjCl7FLemHExsvjSz+tF/NADbuRJIl52VlATe7c0LWlDmhvUVxH
         6Dpvzrdc8Z8yVPbqJeQB2xmfPcfoI7j/YW73ZpzZ4g81gj6iIU/O5f8fKYADZVM9+myq
         Ghyw==
X-Gm-Message-State: AOJu0YwGe6vlpCZxmQlBJKxm4zgkIizIx7aL7Q8wwCmqQ/5z/Qzvx+/y
	2eoPZc69Ax9Zi0pknrUkTMnzRu7s3ltCOjp5POg5hQSrk7pGbahQzhuU00KCeWMuo2TXgUFuNrY
	iQ6FSNQffEabQjb8YGR8WiuLMVHFs80nTODtBwR2fgFn2o7SlHozExvynkMYUvm0+YG1A
X-Gm-Gg: Acq92OF3wO5bUv1z/6Yz5h9Tv8LpIH73gL8ewzuMTnJ/TZ5NLKVKVxA7c+MRlhJrLvb
	Px6Ts+uXSeBUhALIlg8zsKeQLSZHXst1ENGg1z4hDYj/gcbDzYamUmSNY+/ikiODjPETkFtsU2v
	5Qt228Rg9hV5rNJoAAb4rMD8reeiNUcXClFPhoRX8EzeApak0RRa5Ftk0xzfKK94lQCueRRdIVf
	h1RejNpaNzVwKchDSmRFiOQyKjhqtojTz3XNGfOceTmBABlRfro6Xe1NWdesSiAjSPiLc7XbX/n
	tPGDGN8IxPJLhwWnb3b3apsh49p5GFTpZVViYhzUue7Od5M08Id4eiyYwFiG0/PRVwt7vJCb4+C
	ZTrd7e0cPiaCNmX7N8VkIeOyWJeKHyuNJ2a7DO4y4UbNteqlb
X-Received: by 2002:a17:902:da84:b0:2be:b09e:721f with SMTP id d9443c01a7336-2beb09e7439mr54089055ad.31.1779479758305;
        Fri, 22 May 2026 12:55:58 -0700 (PDT)
X-Received: by 2002:a17:902:da84:b0:2be:b09e:721f with SMTP id d9443c01a7336-2beb09e7439mr54088825ad.31.1779479757828;
        Fri, 22 May 2026 12:55:57 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5914287sm33389355ad.79.2026.05.22.12.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:55:57 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: glymur-crd: Add reset GPIO to
 touchscreen
Date: Sat, 23 May 2026 01:25:36 +0530
Message-Id: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALi0EGoC/6WOQQqDMBREryJZ94umamtXvUdxEZNfDRhj/49SE
 e/e6BUKw8CbxcxsgpEssngkmyBcLFs/RpCXROhejR2CNZGFzGSVlVKCIlcVYAJDN6xuJtBkQBk
 DhIwBusl6CIdm3bMmxBHKey1bNGhk3YpYPBG+7fccfTWRe8vB03p+WPIj/WtuySEHfavKay0Lp
 Y1+eub0M6tBe+fSaKLZ9/0HEK0HUPsAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779479752; l=1395;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=IYqQ5p0U5bEuc78RlMUT3k6dFqYxkC6LK86NxP+Q4SA=;
 b=j4UB146eitqI7kRXl3rgvOV+hz8zROtEkeNmcooQs0UccMZcBAwQSSXafRju07osJIr21GWZ/
 mCeqtNw1jFHDLzecbmxIWUhQEe2T/YkHN0lrOWt8HEbuGqkWUKu6E5U
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10b4cf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D8AMBb6HiunKfoW-LmwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfXwq7nZbSrvsOM
 EvreLnuCp2ukxlj6fmSqQiiV2NK/0hOCEqH/DqU1u/4PY6dOJDMu6+95jVEEFy+6J43RdyKpCjL
 Nj/NSiYYZkfhZkCoSeOPtAsXq4w8/vjHiOMp55ug5gKOR2hswN1M9e8jEG94a6c2JzUzFm8EBRz
 9JhpMLTonhFweXOdMtd551wIrWsZ6FclCoRnbGR8QuK503hykycflj0AMe1icwEG7bx3A6Uq+5z
 eNAiP7g6Jyb9soE3901ZuqSOyhRm1e13Q1lefIm5CKo/yhsaDnqVUb8YC6mPrvnKxwMMKFuuX6B
 kfR9nQB8urnmaFfNGPGKx7Dd4gsLHnyCgFUQZno8EOQZgmLrslzr9WaEIXQUu5L0EAbPTBHjrhk
 9X1QhqUvlIHuJ23nzSBlCHwdKDkd4DXvIMSUhjpfmnGbgW7tt9h+rCum5s9X2LKaXY/gQwyqM+T
 84jttKfsHtovgue845g==
X-Proofpoint-GUID: sTuYyfn4ANQSG2GIFel6bK1pFgLPStt_
X-Proofpoint-ORIG-GUID: sTuYyfn4ANQSG2GIFel6bK1pFgLPStt_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109419-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradyot.nayak@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FBEF5B9DA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The touchscreen on Glymur/Mahua CRDs has a dedicated GPIO reset line that must
be explicitly modeled in DT so the i2c-hid driver can deassert it on resume.
Without this, the device stays offline after suspend/resume and all I2C
transactions fail with -ENXIO.

Patch 1 adds reset-gpios to the hid-over-i2c binding.
Patch 2 wires the GPIO in the Glymur CRD DTSI.

prerequisite-message-id: 20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com

Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
Changes in v2:
- Add dt-bindings patch to document reset-gpios in hid-over-i2c schema
  (flagged by dtbs_check on v1)
- No change to the DTS patch itself
- Link to v1: https://lore.kernel.org/r/20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com

---
Pradyot Kumar Nayak (2):
      dt-bindings: input: hid-over-i2c: Add reset-gpios property
      arm64: dts: glymur-crd: Add reset GPIO to touchscreen node

 Documentation/devicetree/bindings/input/hid-over-i2c.yaml | 4 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                  | 2 ++
 2 files changed, 6 insertions(+)
---
base-commit: 1d376e58cb4a94f89de0fa9195d583ad6b86eb89
change-id: 20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-5892beded29b

Best regards,
-- 
Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>


