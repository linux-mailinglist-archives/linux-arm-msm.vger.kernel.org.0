Return-Path: <linux-arm-msm+bounces-110590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CbxKR2DHWqcbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:03:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABDA61FC14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5E5D30AFA93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 12:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A86837C11F;
	Mon,  1 Jun 2026 12:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3W2EEyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dg8DhFxu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9237DAC2
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 12:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318529; cv=none; b=S85uPsvoEy9JP+oiKc0uNxoM/w2hJv64U3hhW/21qHn7DdLbl3/UIbWkRtjmS2vYVL5kKUftqve5J2YeKcW1msI01g0P3RKWlp9UTCtI7d5L5rBhEHj2B8MH9iZiTgkyQ8FA/rz6UJEuKMcM2GLhWhfPxjHTU0feJ+Uz2bcqZyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318529; c=relaxed/simple;
	bh=mjrd/5WRTtizVxAileTEcsI3Pcwm5BCTvACtsLVlxwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=La0jObam4HIT9pkglFw7HB+qwCHAUOnVXmV1bMq4M7vsPNVNid4o3ZqEeExoZbDrnR2HWmTzjtwtshG3jLW6cBmxSnKygYIFcAdG3WUwl0PLf0WsQZin0i+quM0UJIYHm1U1NhEmZ7ZvMcI33nF9G4uIqcilxNwDqn3n2z1XvBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3W2EEyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dg8DhFxu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BM3jB622090
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 12:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=; b=l3W2EEywH4eumlFf
	+JtME6yhCjU88SpknDnysTzaxerik8WioEnysNT3e4pIOKqOO88e7GY5JOrGfakQ
	feMtEeGBE0dGgQWNRVMwjbPjnmjA8TwS2LxMfm74TD0oQNnOhgBreGZRloguEz9V
	EDahYCUOf8jIheSpdrosz7n3yw0WCvhPRq+df/dnd78Ds1CZDv9fh3d2+SsQdMrz
	J81QxeSIVRLYqWRDOZpyjlWrU3BDLEGwPqha9OX4Xv0FqDX0yRwnxedAVfRwMBpA
	clPDuw3rHkZ+fd84LxPRtJoWgmjAhP0Rf88Z0j6iLPTZDe8iw/Mediv7Kh1Dgw93
	dyBO7w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954gbpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 12:55:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32faa62so25025345ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318525; x=1780923325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=;
        b=dg8DhFxuHiVtj+Vtaqc20hopSbe8OaCbHZJ5BQGxja3waT2srMdCpG3c4Ru4XqRSC4
         lmbMJ7yjyx+xAv9XROYT6k0WFcRFwJa3FnHGutQ/ZwpTtethDeZJ1u4/Fh+PIx7mT3Hi
         bek4NX2h99/iwt5UFcQYdM339KZRAEK0R/Hq92396b+rELMy4Nyg0CStgtIVOSa8TkJt
         laHqAye29xyaOzUWpkS+5JJMa0EIjwPzoJRfv9Ve11aM/HR81WfRtLyqypJ5Jm1rxdFT
         s8/pyuPd4H7z3mgszadljxislt2epJ0I2Y5G6rY/DEKToyCly7WQgkB9aerRqiqNv6Wz
         YX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318525; x=1780923325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=;
        b=r3bPEasn8KAHrtBzUtTZldH96Ka+W/1nZVom1OjQriSpfnuDeicZnA64qbPKXZ/aQl
         Hke00g3mIOqsWeE3vKR2RZshN9YE+m52B/58kJwyGVUxmLdZlb+NkLfaH2kfCnf2uAjF
         yB+M9b6QFd4kbbirIC3Lnzwr2Covti/KwCIWG8NimDJmO4oMwme3ruklqb1XYQhI+5RY
         /UH1mdqXiA4Owi4Bl41Ctx6omOUHx8yXMBnueWatfcwLG4iYagB08uKniYhbaZmbVZZ+
         W8snYvY8WqpEqGkffciv73zwx+Lb+8qmwybOh8pHyUmgtdv+a4PmoBpH6+4ZZgGV7/Nq
         8w7A==
X-Gm-Message-State: AOJu0YxjhRkNSf6z0jQuwH9qZcy04X+Mvn5PxDg5llRI4N1pYWN4GnHO
	y2cUL2b94K4ojVKoHSHOolraDimuNFmqHiW9JQMZVt9/DIGZfuaoKELDvoD0jQkFffl+MXUA24F
	5FIi5b0o8v/KFcr0FqWB4qUQ9UPCsA5Yj+RoDYYs21aggDJ0QKem9x0X9LGBo3ueg0vYG
X-Gm-Gg: Acq92OEJJoad5Rv2t1F+6050nc6ZMj2XNfho0cGX6Z+QqWW75nVGKmFL+Z6CuZ/Dl5F
	kBFIlbvc7eBlomNwu/VKzYGaS3PDkL7ilyJbZY/97B5kpIWMumjh2+IvMJPh6HNLbCh5gqzobU5
	5qRY561Rt1OsWHHd/1UqRlUubgqO1B4RJ9BV+sjpxpdeCit/3VwmXdaejdd1CpyRmeLTnKRYfzD
	xg3S2zSOeKC5lrTUCa0PJ4pDPjmdB5oo92HbrHEXC089K3iX/4rzljJWWNo1i9J1WR3ntE8/kaz
	Q1YZGJtivi1CNy/3V0yXlx+Wa9RHiH/eHLayQ4F1P3foSZGm6LS/QY7w0pUgccAkE3WL/hwgOx8
	4a0NfY0+dcx+dYXNIhN4WKxCcTyga/QCo/sbeH99QqxgCY/A=
X-Received: by 2002:a17:902:ecca:b0:2bc:f1ef:2e65 with SMTP id d9443c01a7336-2bf367dbbc6mr131392015ad.17.1780318524726;
        Mon, 01 Jun 2026 05:55:24 -0700 (PDT)
X-Received: by 2002:a17:902:ecca:b0:2bc:f1ef:2e65 with SMTP id d9443c01a7336-2bf367dbbc6mr131391395ad.17.1780318524257;
        Mon, 01 Jun 2026 05:55:24 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a21f0bsm98584135ad.34.2026.06.01.05.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:55:23 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 18:25:03 +0530
Subject: [PATCH v3 01/10] dt-bindings: dma: qcom,gpi: Document GPI DMA
 engine for Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dt-m1-v3-1-0fe3f8d9ec48@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780318512; l=857;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=JRwNa7gj/V38SNuXulP2MlFnweDp961hhJdbueICCwE=;
 b=PJGykc/8otHeCXe9kKzIIFTmtdyPt3eYq+7eAlJXMGu5cmG26SuwKenbdaF6UjwkpDxwV1StS
 s6lxCjxsHJRBZ/4THsyhk17175p4NnSgUAKdIJ0BAlve9s0LF3dcNTb
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: p-O1q2z6UCzf2_rEmWcPl5fBdL9f3dMp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyOSBTYWx0ZWRfXysF6VSes2BnA
 ye7UuEaqmL04/pM9zjTEiGH6ixGkDjUGxT7JLmDxRirJ2iUMCeRnqw3gT8htR6ATScdDrqVFtRU
 et3bLYXwti1Huvr2C5kdh5s4C/61aInGgIveuLZ+qoDTIQ7TXc3UCfG07iFFjeUPVmRqbIkNKFT
 8gBmxwigQiHrUMxz1b8aFifGCh0lL9KIbm+ZijV4O9nZRsIGzudkD7r5KxnZFtdPFSEYV2kvR4o
 VfFkP4ESv0hwodkbC5XtiooH5Ni8oouGsgG8Zr2XRsEwHp9GMWBVI7S+14FmpK971aI/FR+ZavM
 6lMQogjQxHSJKWhnUit/FvrlEqIdkhKB2fnKvc3i/WzgdhKuhf9JjQ+6C7UOSyvx54Z+078nEMq
 vZjcOKrGwGnRIAoHyxTpwBaKAIUxjk/inUIKjvlck3JidKklF0FjUwaDBfxi6JfQtg0Ca3eYXF/
 Dw04fLgttidI/3MI8rw==
X-Proofpoint-GUID: p-O1q2z6UCzf2_rEmWcPl5fBdL9f3dMp
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1d813d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jyTGefxJr8I4-3Pae4IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010129
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110590-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0ABDA61FC14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Xueyao An <xueyao.an@oss.qualcomm.com>

Document the GPI DMA engine on Shikra platform.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 8f9a552fe30e..54dca623223d 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,sc7280-gpi-dma
               - qcom,sc8280xp-gpi-dma
               - qcom,sdx75-gpi-dma
+              - qcom,shikra-gpi-dma
               - qcom,sm6115-gpi-dma
               - qcom,sm6375-gpi-dma
               - qcom,sm8350-gpi-dma

-- 
2.34.1


