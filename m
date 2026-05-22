Return-Path: <linux-arm-msm+bounces-109403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JpWHfG1EGohcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:00:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB66B5B9D29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46BAB3058FFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24778379C55;
	Fri, 22 May 2026 19:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn6a3tCz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ItDcxg+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A558D37EFFF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479658; cv=none; b=JyvH8f1G8OUcq9Z8YtK/rzCWQDKGKbVmhl7ylQzo+pJApjA82WbJWZ3QfAdwEOH9TCcihnLDNni+OVoEZObeSVUQ36CUgv8tbFZTGzdEpH7Uv7kdstc4cmFlJFh715tAW5uk/b5SPYljkZElGF9FqVaPwBnvdB0hrAPEVNFu3z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479658; c=relaxed/simple;
	bh=MCragVeqWGfwwLMtO1vbVTdRFf4q/FyUz9Na6DMFRdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xt5hObe3ryCCTcUuvvtNX6y/nYkGoknZn/mckZR3i7LWZaVD0Wtg8Pwb6yOJsoRVryoBOSjtFX8eC+tDUhEzmIWXQ8fS9NxUVY5Wg2nmV8LcgSpZ5GMOyAwgh/mwZuktVsI6ZzTf/q9NwlutBInNe2RLGKEONRFSvChVmeYbjns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mn6a3tCz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ItDcxg+e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0bLn3476962
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+J0UtrHxFLw
	6ZMOq5E+Alm1lz0ZEDn8wjg09ZAPN87Y=; b=mn6a3tCzAP7WBViZYz0o/u8Fgue
	y5eFgb0EtTgVQ7y6mtl/2hypXTOO5MfyQGdnfEcbpofEQHpSJCDYnt20wmDm4hC/
	vmpQp/v93iy7WzUIqBKgQBv5cnSWbTMwRz7tvIa49UJ+vzDTPRV0murSmh+VW6Gg
	9RbMMiG9Sm24dyUvXqabYy1yufOZGGFnCtd+v4s4unEb4Pik8Spqg/trnfOSueNb
	hXdrKwCmnlyzSJyo8tlT4WYuQ0rpT2mCJU4Nidj3f3gD+dd6Wcxtoy7Hq+BOGS5/
	m2s0pEBvFdymiSgyyaJz+O2YAmhmIKu8+81kgghjpgf7hdccx2potdsi4xQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r8t1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so129253095ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479654; x=1780084454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J0UtrHxFLw6ZMOq5E+Alm1lz0ZEDn8wjg09ZAPN87Y=;
        b=ItDcxg+eLhfXkX7Bzp1i6U9OreTAoYXS/jlWdBh5/eN53mvFmIQKXROoj5vOt9yPD3
         l3ZqnCp4S/7TU3jM4f54V6CWLfLjQXSCfkSMJE4Saey953vEOeiZQBe2Lzc8u8vfKndZ
         I8vf0cIE38sI+7oUxxlAKemH6FOWv3WSTZMz9QkbKIAbBC1hbQlzAXy21EP1vqDIdruR
         4aW48UlFm5OxE89hm9i0pvALwqb40JsYogLs4Kq9AWLmAqMw414F/zOY9XsMeu0M9YM+
         k3lmZL+F5M5hURa2Yzx7sAqBWapsW0qScwhYynUk60kiV9sE8GnoArX4Uj1itegU8itu
         nSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479654; x=1780084454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+J0UtrHxFLw6ZMOq5E+Alm1lz0ZEDn8wjg09ZAPN87Y=;
        b=EKjt2rlKE4GzK1yLQktLBVhpzFmq++99xJJXb5W853Owne7Lz4m+tcJaHiWuYeo9QF
         61slN+qoIQcb3tXCwZJJaep+27qC7/tF4iv6WUxaaaVDkwqqtMcLpk+J7pmuI/j9lTKG
         KBD9i40HGLL7ZrZo9WEhB4raqvZStTj9F46tLh0M6UjNH6NtkpMvvEHALiSpIrRKe4IR
         +o+0rI/vPFJsm5wKEOf4YbCNqhpjps2Xbr4kwNvMMBWpkjiZYbBZVwKYf8c+7KZYCPQH
         x1/K5A77hdROipD58/+zKCTeEqLplwKdkWKcqXfsjHRxVupoI8uDYJlkhUlB+dTvUh9u
         MGiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PEKiJZdZTzlb7Jai1a8McsFq942IOKMMAAHx5PPrITcN5PciQQudRXwgCifB6VWtmpeXY+3xylp79lB21@vger.kernel.org
X-Gm-Message-State: AOJu0YyOjQSLLucWpqvrecbnTWQLvLyhNpHRpuqJDw8TqRzK5dlwkT7h
	6RSAezYBfuUPDWbJyFIzS3ZaBOHGZ/ZOjlgPx2byWd/cRrm9IBlCytN3zWGdTvw+IMs4dNKS26B
	C/Fahxc3x/dWqx/LQMZmd6yyImoo3W5E4Z3WermCcyG/9xoSixGXe+qUms38qpkLA7Rw9
X-Gm-Gg: Acq92OEiKLuoBy19vg/rUe7uODr5GQMPA5sBMQeQsq0a5/inQ+0z7zWFL/lEova8JnC
	/6WFlb/wfGCJdXFVvYC1HvrT+rcj8PQCsgRpzb+ag3ST8Bj/9gThu5W9twNuXyxTr9Jw9+ffcc9
	XIYSg62rXdq0yAY1JBzZmwR9uccPO+I1C7ZnHZtTvPOwOmAa5lI15BVOfIzb6iEJ7l1jg7mZ9ST
	OQAwnMmjuH1YTyYA7PxMfHOMZc7dbpy2qv2iMKSF2V26h1+MINQfDOnpJnq/KrR8tlFF7oZ5ryd
	uCg0jK3VbNNJoI/P/QwyKI5Lhqg7wJVZGEn3qavpFOQTCNxLF0OwCMQpGh1q/zfPQK5w5snlVAZ
	5/wiwFktFIe4lYvSvGuI6m2gZ31PdE/UIp//WBSmO/ajxIOqg
X-Received: by 2002:a17:902:f650:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2beb038f177mr60344075ad.1.1779479654335;
        Fri, 22 May 2026 12:54:14 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2beb038f177mr60343705ad.1.1779479653866;
        Fri, 22 May 2026 12:54:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 03/18] firmware: qcom: scm: use dev_err_probe() for dload address failure
Date: Sat, 23 May 2026 01:19:54 +0530
Message-ID: <20260522195009.2961022-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a10b467 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GEQWD5Nhug1BhVu3dP8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: jgbQ8WAJbd-4MDvmw-2c0P1OhQ3g46y7
X-Proofpoint-GUID: jgbQ8WAJbd-4MDvmw-2c0P1OhQ3g46y7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX+q1Vv0wV2ErD
 zFjOFpHjMaHPaDvohCN92VBjaXi2/NPn8ptSXt8on+XHWy2NR3erQDdiJQUwp5NwzbgjRJANXSZ
 U1xZDJyXkV2wqo6sKgALW+a9nlzTHy75/QbOvNwCbVGfETdaT0KhtCp/SmMwBgijR0pyw7juPBS
 EM4T/mn3uCggKjH7ONfHe7oyNLTu+uwlSIegQrugLw+glZX2+JSgBFE1gaGiR3NRpkO11Un40wH
 RBHOZW3CyBzYUPXRzaAA5yFJQ1gTucOuM4W5PqfwzuQM4R7KeDR0XeZH08SPPe5rPiQiOsykue5
 8DJ5vfKrAV3qk97KiBYLNhBkcNKH4d2uEsiv/v+wBU/MrWsaQBYTvqFRSneIcbhm7PU9P+1ixg1
 90dDODZae0U5pm0EiFqiqOE7KBF6TM3SOJW4rgmf/xEJh54xX+g6uk/ihQQvbLfSPwV0BGjce3o
 S+/cz7qcwVVOXG89//g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109403-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.987];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB66B5B9D29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the bare `return ret` after qcom_scm_find_dload_address() with
dev_err_probe() to produce a consistent, deferred-probe-aware error
message when the download-mode address cannot be resolved.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..52432469badc 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2747,7 +2747,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	scm->dev = &pdev->dev;
 	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to get download mode address\n");
 
 	mutex_init(&scm->scm_bw_lock);
 
-- 
2.53.0


