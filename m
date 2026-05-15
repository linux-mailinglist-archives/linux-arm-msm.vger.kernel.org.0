Return-Path: <linux-arm-msm+bounces-107844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YACQLf0CB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:26:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A96E54E685
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CBE753035BD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCD747DF9A;
	Fri, 15 May 2026 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lmf/tbEz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hHuBQZIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025447D92C
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844227; cv=none; b=IimuV5LVbofduiay+Pcxy4yEm2645HRL5qXY4c6ZRYXG+n6POMg84MoJ5z0Vgwf2Vrc4wNIPFOsK6CayTyXtJiYr7wj59HrEv2LQKDcDX73BGo+8crD7hiDXCC76qYHtT1QVMoqL+COvWcEL6xAG6uHKBPOebRAamy/30CXlu1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844227; c=relaxed/simple;
	bh=I+FhCbobG6kZdRoyaisDIn3UKwT9sap0kLYTO9LJWVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fC5UPU/HwocBVgbm8jqd3SkrwnmYO0ZJH9PtlpLK3JegHS6TwvSbxihz5xHBteyT4spzSLo/wzzrC8Nw02B9lWXvvRO7LlEO+d8NMhCFW541a6HY5AvU+XcNC7iVotKnO1Lpg0cAG5um8Tu0S8wDc0jxBJFrHiZR3pyYkKxS9ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lmf/tbEz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hHuBQZIY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB1xem654908
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uSFq1izJ77a0VhXBlRZJfgQFGF3dtNG+x2g54MrIho4=; b=lmf/tbEzdF6ICGA0
	SPWcXYO8JX6BNlrJwrCrW2lc8dT89Qmygk2pTLtq+pnuITqDOLQ1BR1y9kCYCqgb
	Z1Z8s2JRCfGMw+8qVQxfexqCTiUNLDACJoAEzlrE2qpsmYQSOyv2ml495Bw8ZI1S
	onVTTym3WrjdoaHcHOE4x6P3YE3zgKv5TEu25WjmjIYtt9QtFfHZaPqljJ7DiLpU
	qoJJD3zw0HH+aCErebn8sEedhlHk4nEt/vwVW7JYlC7To/jWEnxTMJQhILmdsGhF
	vKLnZcpW06rWkqF0KbNsBtSXRCSBpzp2W6lmcJ8iSiQqCCFb8he8wOhumAb7Rb0Q
	hWAhhw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu2wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:23:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3662990c03fso679812a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844225; x=1779449025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSFq1izJ77a0VhXBlRZJfgQFGF3dtNG+x2g54MrIho4=;
        b=hHuBQZIYMIdnbVAvEL7BLCTWV3Gak1S58z+VpdBO0duIGnUwn0ie7rwlinRedkHiwV
         8Il3W/fQj6m+KrQNxu5GQDvLB92VSP6hoxrARY5w3G7ahSyY/iAvH+yECy2jpah0m/y9
         hQbCVB0Y4RJzUS1LnS/KJXBca75Ufzo7cJ5XgSE+U/AqUIsML2Dw6o20rnIOb6yVYx5H
         GH8b6l0M2rygQ5NPVghOD35EtZCzhC6ueF79VwxXzgBgfuumaggbG7sHiT4jZLd13oF0
         NDslHwc2qLjWVbsyOZhI/BB4NpcVp20HRo1pov2DouwlNNHLG+cPlMZ8BEiEk6kikIOf
         zMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844225; x=1779449025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSFq1izJ77a0VhXBlRZJfgQFGF3dtNG+x2g54MrIho4=;
        b=QmKceIKTCuuz3Md3jPIvImqApCzG2prWkCHPIr0JfpeKAVAuIbbFggJCXOKbu0qwJ+
         TjgP7m4mXgvwpbLRyCuA+tR/qH7/aVw1mGuHnMkR0A8Db4SXqq8F5tzQnbCEzkNdOsMs
         dUfqNqjN0aJH+hNTipDQnEffIqJAMz0JdegtbRIsBiSWPjvaP/0Lwf/DA6c3BBa32/Ke
         BX2yJ9hJBZmkP6pDi7ZrQSuU2/+Qbddm4bmhDWD54UsXrosmhwST6y9ZoAAYOlMxpNb9
         xncikfUA5JbCRqDKCj+FfqrH3/+88ON7T34z55IyijwsvrVBBP8kEdp01aXyy6IeT7X5
         sOMA==
X-Forwarded-Encrypted: i=1; AFNElJ/2QxtkEPb5rwwpoj6F4bKX1ly/hoY/UilXPgVdxsgAuIir99aQNTe+P+IVPfAFrpEXiKDRtMKnDITv4wo7@vger.kernel.org
X-Gm-Message-State: AOJu0YyDvZeAYEkiVVRBMvMJzRs5HVpU5fZU8Zt9aqIxkTBM5z2+xYRR
	Aa/ciyQIWx2l/owsEGAwNeMC+bnPIqszIpduxZ1A04Jq25q7JEOugY9UW2zO4CxuuHI5PDhzCyF
	JEyzJdbxgEBTzL9o7H2Bvr85lw5e2AUubU43guxEwkAZ6rHa4CrtR7XaujSS7dg/k1SbQ
X-Gm-Gg: Acq92OHeqW7a5g3Yrm30Zsz6NwVPjU+GvV0sRDjKyOcbAClBIZU9Pc4wnyeNuOIjxHp
	KAWJ2JvnjhxBcaK2kYEK/XbGAQhxey/WcSAzODq6ULjY6QQfMEON+OBHstRw8S3tlWHa+mLefxN
	VzWIIrpvrCegBF7UzorK6UNK29/IMQwSwJdLku0kmfH94ZiU/OAc+1hedp6qop1h2Gi4R0FjvH2
	1QEHFi0C7+a3sW1kBxiVBNbmoA0unOsQx4TRN+oUBetPs3L2vHxUaeX1WuwDJQ3/snARUPDA9OO
	vbjJE/H6TzCGvsj32ht2R2QmuNeWiO/HbmrwIseN0OhnZ6XxcyNgLhxZ+ByzaM70Hhwbyh5Hw7T
	v07rRGt960LyX7bmvdbWrTJ0IHltk4HR3Z9e+STrMldIWYG/vPlHM/l43ChF1nN2AhQ==
X-Received: by 2002:a17:90b:55d0:b0:368:2832:34fb with SMTP id 98e67ed59e1d1-36951494a98mr2924752a91.10.1778844225026;
        Fri, 15 May 2026 04:23:45 -0700 (PDT)
X-Received: by 2002:a17:90b:55d0:b0:368:2832:34fb with SMTP id 98e67ed59e1d1-36951494a98mr2924726a91.10.1778844224541;
        Fri, 15 May 2026 04:23:44 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:23:44 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:18 +0530
Subject: [PATCH v6 03/14] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-3-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=1678;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=I+FhCbobG6kZdRoyaisDIn3UKwT9sap0kLYTO9LJWVA=;
 b=yJSdrJ9U327Cl28LdY+SOP62A7gkCxLZelqSbuJRMwwdlMsr9bwa/rishfpbzasDkgnPXhnQB
 xWl01CKrnjUCS5apq/6NmAuVWSZB2FxH8R6nmdrWj3Cj7pW7WHPh1Ly
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: vPeYScgT478Bkd2qMzy6UuA-i5yWDDFa
X-Proofpoint-ORIG-GUID: vPeYScgT478Bkd2qMzy6UuA-i5yWDDFa
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a070241 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G9EXm27dpV9j85VmElcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX7GNz+NbolDFW
 Qp58a6/z3pBd700Szy5M5y07YUf6LnT+v3dXsqmV1vbf8eiN4o4TJMDkw3Qa1UQeWWZ3ofno4LD
 Bdv/DTLEcuZMSRgchujSlMqvMLTTll3R3awFs2E36Mda3Qk1t9sB0qUHnC0OVM/gQUmg3C7Yf1f
 cmI7Z4GulEspzG+0uAIn+NrQ58amo2V9UiEIUzgcyFs8W7gmpO8yOOHAK7AZEpB0t44OCuMD4wa
 qHyC1TOKGwOSYHKZzZz/TMQ9U+3719UQUSKWMTnom6jlN4toZ1O/wfDVQt/Xr+G68bI14Tbptea
 BPf+RhsLxq+PkB+lndXkWUI1OoIwXcT/FUqmoKZonbykxf3cECzwIRP536F/LclTCBcFrfTnNb5
 mtsDceQVRCYgeosLbSFw2zSD+0bDFsTSvo426fS6Xj8v5JQV3tDlOiJSJ4iRoWdDP2z9jnyw4un
 9hVxVFnHjWk6M4sC+/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: 5A96E54E685
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
	TAGGED_FROM(0.00)[bounces-107844-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 7bba3b6209c2..df76530be809 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -26,7 +26,6 @@
 #define QTBL_ENABLE				BIT(0)
 
 #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
-#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
@@ -78,7 +77,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);

-- 
2.34.1


