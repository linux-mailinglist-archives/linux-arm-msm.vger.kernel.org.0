Return-Path: <linux-arm-msm+bounces-100020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JKGMSK3xGlf2wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:33:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8587932F103
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 524353042D4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3737B27AC45;
	Thu, 26 Mar 2026 04:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cioFQFg4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L81YrMry"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AE3212566
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499612; cv=none; b=aJ4TLIHT+w8yeegeVl4fH6UY9KFAh579AuBw9omeuc22dGvgLTT3qpTaaA2cN+6SQm5mzGs+HG23ZXI7vJyXhkWJCuvt3lzr5z7ghhOaC/d3tsomEQ+p1OPASBsMYwTZIUsidCsJZm6V4thRA0Zf3JCd/X+uaZmOIiU2lsEe0FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499612; c=relaxed/simple;
	bh=9godXLTgZ93xDiup1AAXvr4yCJUVryT+oPn3hsPULVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZLiOZL/G1MKcf7U89Ung2hll8omf/imIqpnsfvXXt+qbuOZjxU4dFVHohyzKq8QDrB7Vqt2ImSt5MpV0t6msb+1GJD055h2H/qay+ozNL4yEnIuBA2EXy5VWiO6sHdnL7tqi7bUmZS1KNmUUIcomym+zdb36nRZu0s41COdO924=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cioFQFg4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L81YrMry; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0pA3R779741
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Zm4NDBy1tKbgQwT749j1IGZcL3hX51NhEY0
	ZW3KtYEo=; b=cioFQFg4oXJLoC/Kh2mzp+q+2YgXhKiAsKBCnGrgZLqeI5gu8lP
	vmjsI066qyZc6PKYt6mCKipCOenyoKdWasPrWWxjYNuHPR6gSj6DbwGS6iInHpH6
	lP5r0KBL/nluWeym0ffqwCJASAvRs1YXXIhL1HJ0l08KbPd61LYHxY4HVSpjgKTQ
	1qLpBwrmUM/v4DfQBeptHISds69DBi4twW9U7retnxaYlU2UUrOlrdPIVNRi5QwN
	po+XYtNBZ3CLMDuKwNw3hb+O9KC4PVxMWS3S+ITk91kAWdKJ9FHBqZ0txat7TLgL
	Mn62SWuUtm5RwQSl/JnrfvIN4BJm0ajLsYA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp3nvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35641c14663so885764a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499609; x=1775104409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zm4NDBy1tKbgQwT749j1IGZcL3hX51NhEY0ZW3KtYEo=;
        b=L81YrMrywkaR38mX+B/6fqS2YAxeRJbKi+whJ7/nyGxAfGBpchAWMIdB4IfTedxFYt
         UjErV9/KA++n7uSzrHVqNx8Fb0D0d8ToCFXY2JNMDCB7vcSHpM2nIQkKIKuxkCSfgy/r
         80V16oS9jHxigYzGcj8baYiM3SR9tRT/HB4DTty+FGX8YPV1BzjCgBTJKv3e565fxAse
         kdiHjvqc2lOo1ROK5IF8OGX3RuVAadDyzCoKnwQhoYRC3iqeH4IrR99WVCMKfIizqyCE
         6gr2obYyjaV1U5knQ4eA4JEJiF4fGG6f5xMfE3qiQ605TBK4X73weSXPfL+d2O6CF9kf
         VDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499609; x=1775104409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zm4NDBy1tKbgQwT749j1IGZcL3hX51NhEY0ZW3KtYEo=;
        b=IOKQFUEUFORtqhdENP6f1QO8XPUDB6WCUIJ008+3eEcsrG7NecKL0ymgX0XLf5L2KM
         37lyDw4hsj4nuUVpq+WPVIMbiZvctx+u5BtM6ZxOKoVtfY6N4xyU3ac1nDSwfsV8IDYB
         QH0h43U69Su7FFRiZ9XbtZ7teh83atqVPHBxj9TS5iNMJ6GjFkoMrzG3XiYtkz3rs2/Z
         ptboSaAmc+spDbGIKEGRVYWdTq6tbj8ziYmHJSHbWiP4B0nvyYm905gffv0VVH6X2I9p
         k9Nz54zmVedP4m3Ba+cqf0zaUxg+o647LELUtGuEnnWDUxN6thw1HMu+Ph/GWajSWrRP
         QvPA==
X-Forwarded-Encrypted: i=1; AJvYcCXcv/PwKv063QWdMs39uJOzp0cpHNTeFeJgZRh2d/pjayf9GwPocKFEd5tgPDn/xxOaaTZS+dlr+E32OrvR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj+ePYBphWRTpwIrpwgjUS312uk6f2QTZ4RNihfHMs8PaLaR61
	5qKEfsVnL8PKnBuFZqrW/B0a8t3bUTettvWf0is3ddqgRCGRQHZAD/7p2OImdgPH4kcGgTUkW/p
	ffIajgHt1mBdthDoVSd4g65raYjMjqQH3YL0CQall/LTnU4XIi8bSIrwNDTOTnRQGWPmt
X-Gm-Gg: ATEYQzx8gPh2m55fuqNj2EjaCGbr09CY5QnXZrMNC+/JImMQcj1JoUsJtMWLKKys9J1
	USmguJBW4QaeNB512oREnGRo3z4dLlnqMJ0NeY8PTAO7V+GnAVuZ+ve+UU9m3Z6vZ1+QEKT2VT6
	bN4vhH5ncMs0Nh6HlLLtDsIeLm6P0/bUBdPKjJJAbohea5IzVQfd8lyVLB3sycBshpYfimbfyuB
	uyRE3cEMxRCHZfHvHBH5IznM117RyB2SJ0cd1RZ6FGv8pkshkLpnc8yG+f+MIrgrvZPhsR2MGyx
	p2lg4C/e9ML6Wox/AsiYdKTont8HkGAyMqPmrgKNKEW6tNOVnULBqcnfw3YMnIlE+eS6JbW7bXt
	9TDcJ36YnpxgepQa0lJ4WX2i1HunwgOMNnnLOhvhp2B4RaaNtWRsbJX3kuSLmbTlG8wGwANLe1s
	DTwHxO83RZhNMGuYGBeq5qTSaJMnbB2lCbfNo1JDs2SD2Jakh+fY8=
X-Received: by 2002:a17:903:37cd:b0:2ae:a95e:fe58 with SMTP id d9443c01a7336-2b0b098b3e9mr62330995ad.8.1774499608404;
        Wed, 25 Mar 2026 21:33:28 -0700 (PDT)
X-Received: by 2002:a17:903:37cd:b0:2ae:a95e:fe58 with SMTP id d9443c01a7336-2b0b098b3e9mr62330635ad.8.1774499607898;
        Wed, 25 Mar 2026 21:33:27 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:27 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 0/6] Add new driver for WCSS secure PIL loading
Date: Thu, 26 Mar 2026 10:03:14 +0530
Message-Id: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y76t0Z_gFyzBSOmuQEf-XwVKqgokERzl
X-Proofpoint-GUID: y76t0Z_gFyzBSOmuQEf-XwVKqgokERzl
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c4b719 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8
 a=RJCUFTRzgs7Fj7gX-CAA:9 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX524FQwZcPA/C
 mKHiM8GrTyvEzmATw/Vr8pRlU53hY8q1NDAxEyFGgIYnVXAEkv7tstJkQIEk1Jqzio9XN75QM2B
 vbZv/yijvg91kKgkowWgVzI+zF1P2F/OE14rGhD0YD1hmUyUNdCk+NW2rxQGXp4HGwGnZ/vE0VI
 KDRZrWC3FiLpfnX98e5NyOGV4gQ2Dpify0t0EcQn7zeOdwBEjWMXCmQKBZppgfT+CTdnvsnPldO
 RWWWbn3gbjA7n/o+JXIy9V5CmhWpwqxnB/C1pWxzMgHCqQoF1yJr7/039iFFrwD6Av7wqAxHBiz
 PHCXAvqB89HaAZSsHfHQso2YYDRhOR9aTuoasT4asneDnozRPUKnN4nsYvetUE/OgLLxQtl7yTJ
 gwiAYx+nKqR+RXLtrOB/ihnvnYjkvcF0mBFNjnGgpcEi4CpMAvsE4/GMpJB1O5szzDE0Dxyy6Gx
 wSHJAhvAq/dsEkQ5y6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100020-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8587932F103
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As discussed in [4] posting this series after dropping IPQ5424 support
to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].

Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.

Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
I've resumed Gokul's work as the last submission dates back April 2025.

- Secure PIL is signed, firmware images which only TrustZone (TZ)
  can authenticate and load. Linux kernel will send a request to TZ to
  authenticate and load the PIL images.

- When secure PIL support was added to the existing wcss PIL driver
  earlier in [2], Bjorn suggested not to overload the existing WCSS
  rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
  This series adds a new secure PIL driver for the same.

- Also adds changes to scm to pass metadata size as required for IPQ5332,
  reposted from [3].

[1]
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/

[2]
https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/

[3]
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/

[4]
https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/

Changes in v11:
	- Add R-b tags
	- Rebase the first patch ("firmware: qcom_scm: ipq5332: add support to pass metadata size") to top of tree
	- No change in other patches
	- Link to v10: https://lore.kernel.org/linux-arm-msm/20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v10:
	- Add R-b tags
	- Remove unused fields from 'struct wcss_sec'
	- Remove glink and ssr subdev if wcss_sec_probe() fails
	- Link to v9: https://lore.kernel.org/linux-arm-msm/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v9:
	- Add R-b from Konrad for dts patches
	- Renamed qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
	- Restore clocks & clock-names in above yaml
	- Fix DCO on two patches
	- Link to v8: https://lore.kernel.org/linux-arm-msm/20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v8:
	- Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
		* IPQ5018 support added in v6
		* IPQ5424 support dropped in v8
		* Updated to use IPQ9574 as example
	- dt-bindings-check and dtbs-check passed
	- Dropped IPQ5424 support from drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Updated copyrights of drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Change 'qcom,smem-state-names' order to resolve dt-bindings-check error in ipq5018.dtsi
	- Dropped changes to ipq5424.dtsi
	- Link to v7: https://lore.kernel.org/linux-arm-msm/20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com/

Changes in v7:
	- correctly sorted QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 by command ID
	- correctly sorted smp2p-wcss nodes in dtsi files
	- Link to v6: https://lore.kernel.org/r/20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com

Changes in v6:
	- added patch to fix IPC register offset for ipq5424
	- changed phandle description for mboxes property in dt-bindings
	- updated bindings to define the right clocks per SoC based on
	  compatible. Ran make dt_binding_check for validation of all
	  SoCs
	- use of more descriptive match data property (use_tmelcom) and
	  added a condition in wcss_start to not error out if tmelcom
	  isn't used
	- mitigated potential off-by-one
	- adopted use of of_reserved_mem_region_to_resource to acquire
	  memory-region resource
	- added driver support for ipq5018 SoC
	- corrected size of reg properties as per Konrad's comments
	- added patch to bring up Q6 in ipq5018 dtsi
	- Link to v5: https://lore.kernel.org/r/20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com

Changes in v5:
	- retained all the patches as in v3 and addressed comments in
	  v3.
	- reverted changes to dt-bindings done in v4 and retained as in
	  v3 and fixed firmware format from .mdt to .mbn and retained
	  reviewed-by.
	- dropped 2 patches in v4 that adds support for q6 dtb loading.
	  Will post them as a new series.

	Following tests were done:
	- checkpatch
	- dt_binding_check and dtbs_check
	- Link to v4: https://lore.kernel.org/r/20250327181750.3733881-1-quic_srichara@quicinc.com

Changes in v4:
        - changed q6 firmware image format from .mdt to .mbn
        - corrected arrangement of variable assignemnts as per comments
          in qcom_scm.c
        - added scm call to get board machid
        - added support for q6 dtb loading with support for additional
          reserved memory for q6 dtb in .mbn format
        - updated dt-bindings to include new dts entry qcom,q6-dtb-info
          and additional item in memory-region for q6 dtb region.
        - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
          Kconfig
        - removed unwanted header files in qcom_q6v5_wcss_sec.c
        - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
        - added required check for using tmelcom, if available. Enabled
          fallback to scm based authentication, if tmelcom is unavailable.
        - added necessary padding for 8digt hex address in dts
	- Link to v3: https://lore.kernel.org/r/20250107101320.2078139-1-quic_gokulsri@quicinc.com

	Following tests were done:
	- checkpatch
	- kernel-doc
	- dt_binding_check and dtbs_check

Changes in v3:
        - fixed copyright years and markings based on Jeff's comments.
        - replaced devm_ioremap_wc() with ioremap_wc() in
          wcss_sec_copy_segment().
        - replaced rproc_alloc() and rproc_add() with their devres
          counterparts.
        - added mailbox call to tmelcom for secure image authentication
          as required for IPQ5424. Added ipq5424 APCS comatible required.
        - added changes to scm call to pass metadata size as required for
          IPQ5332.
	- Link to v2: https://lore.kernel.org/r/20240829134021.1452711-1-quic_gokulsri@quicinc.com

Changes in v2:
        - Removed dependency of this series to q6 clock removal series
          as recommended by Krzysztof
	- Link to v1: https://lore.kernel.org/r/20240820085517.435566-1-quic_gokulsri@quicinc.com

George Moussalem (1):
  arm64: dts: qcom: ipq5018: add nodes to bring up q6

Manikanta Mylavarapu (4):
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bring up q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         |  64 ++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 +++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 +++-
 drivers/firmware/qcom/qcom_scm.c              |  14 +-
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 325 ++++++++++++++++++
 include/linux/remoteproc.h                    |   2 +
 10 files changed, 723 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c


base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
-- 
2.34.1


