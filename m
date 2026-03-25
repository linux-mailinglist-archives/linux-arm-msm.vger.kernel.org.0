Return-Path: <linux-arm-msm+bounces-99853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKZbAw3Mw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:50:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B21C3243B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29F3D30DBF3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6473CCA1F;
	Wed, 25 Mar 2026 11:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XD8AaTHP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0NdPenv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B13CCFD6
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438871; cv=none; b=d/JoqyTRwTzH+0CtRa67cZWM7KnaGif9y33lfTVHvPvCxLdMUh8BMYqJsM3qn0Ua7Qbl8Ja2Y2eaJP8kxC+RF9EB2Avb96qc+kEFGBt2X/LZO5OTaWbTmx/vw6yHyVnPceOcB1aPCrWDMk3TvHxbJXlBeUIgvzk2Y0CYOb6OF7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438871; c=relaxed/simple;
	bh=Bd5Zj77Afrbi93itSgzz6wEhq6AlpqoXaZTn89LMFxU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MKVYm090wSx/2/p8lxwYovnZzC5Jlp9MkKtaki9HjX4su7giwbw3LzMYa2dvB4W0Ck1XMF+TJJ475bCFHOzfkf4TOsF0NJFNmgH1oxRSxyj6jvfdC2ctDP7BrmIkp14QTmlU1nl2jBOsXezFOKXJUaywDACX04+1HKfTHlXGOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XD8AaTHP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0NdPenv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBG8Bx3091054
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8Rk0S0qJQ9ZApg15/6SWOG
	zu/ILkOd8bT0S2MPoJzU8=; b=XD8AaTHPe3xClz6y2T3KZKZbSAB8WaPpp/6jd1
	YzWjejsL6aubMfPkNR+MkH6jo3WMtjsf+RioPFOwtWnarbjwkXg/N5Xak9uiivMI
	6Odg9CoD4dVxR94xqVkQkh+vaVQM0uqnFpmVZS9KJ9w8KE0g8wXYLuV7q9Me+9fn
	lRRPbruNot1IX2MiwGmPBImQi7blvRqu6IDok+r3AIHKaADyIze9+AQO6Bk72DoX
	XXs2s/yAV+W5lYRrs3ZNdU+Dewj/FmXkeKaxIFCXH3kxIslQTvOjqYQCthtP7FzB
	94U6pMvm3C8Ys98HoMcx1pcoQOQ4c8/cppbIRHu3Q/LhN1dg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmprbua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35c1874336aso1171a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438868; x=1775043668; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Rk0S0qJQ9ZApg15/6SWOGzu/ILkOd8bT0S2MPoJzU8=;
        b=R0NdPenvNGj1Aa4tsLSDI2z0u+ga8meLV++oxKJ8+QmaKPPjFaEywNYTKKnc7W0TrG
         TrhuFFlNN1ZGDnbqk4UJ5uE7/YzK3Kw/pVri/pzHCXULm2A/xU1010I8hVwaudoqoi7g
         f7Pcw9OhoztJzvmDYqob1TnwdfOAXrXEhatYQBvlTmNrpluGl4t7QrowcrofKuGGflth
         x7xdVrnUsIjbazzjGSDje19XGXJD6Ussk5PWuUzaXNl0mklDbTNXOHUDTXTrm8CRxrlQ
         +HXvK9Uxa4/CGwxINoQG4nEk8yZrK/YABVJh0y1hyntu90yvfHOZSOfoi7Tap9w0ali+
         Konw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438868; x=1775043668;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Rk0S0qJQ9ZApg15/6SWOGzu/ILkOd8bT0S2MPoJzU8=;
        b=gtILUwZ+MUaq7oACSR/Psd65QD6vG/leQt7BVD/rrUAny3Hm+jKEd/2wZiuAaAHmCU
         AOP7b0ZX1Sn++6ol8JcAbTDMZbZtqF38Gu4cwAGdKbtRVwERnp/uh5YJWFt98bCg2qDY
         lXC/InXvi/moLrg81qzw42Qj+mlfi4MiMULdaQ5WFrma2V+/CFscWBoqXLQmOL5C8+0c
         eDctl08zwhPzx+x/IM0PfIKDIhWuMyKKw202oVVHHwkLy6GYp7rbXC1/q3SfSTIB2N0L
         DZSfqKDbdvzYJvUqxepLeUZ4GsXuL2A6i17JzqkmGIWbv2N5j6w8e2LMH1eofE+rkV9J
         /V0A==
X-Gm-Message-State: AOJu0YyvyU6cjzG4q7zYKvYkaHWPyEb8ZzSQys+jGVqDtcwSpMo7MrAU
	p+2npDKAz5jCy9AGJY3ZUsjunnrkHx2iSzGDfm8Z+KpysXBf8ShrvthHjwoCXH1WpXnmPphqlWe
	PvmfWzBX6LDjXy1OaOzk5dE7KMylUqdQxwor5qd61dq88HhJ32NszF3Yx4hHYhCb+PK9V
X-Gm-Gg: ATEYQzykgXNluswOxKXTvuSHHfKL1TcRD3aP6KaYT0aOi1LdGs5avev1zJPv8LfbLfx
	W/Lx+tW2Y5pvwvfnJMhjMh/WqqkJAzhrmJ1oa/eDSUw/TCPL5L4l3rixSkgaP1te+BWqw26vJ2K
	HleiNspBRyy7oWNhvd/frxTK2VkZ4NYz4KkacDKkU2LlnDfZ3yeCPUNRuhJITyj36aMG9TyCVgR
	Ox97s1jXtg2E+lgfWsuXQTP0Vy90QtGQ9ba/tb6aDDYn/KHSqn3IugN2S7B8hQiSTZeV1IN8ifD
	XqYeF0McQiJ2q8EwfZcg4P/vvpe4O9r7sAEmCr4PPng2a2dEAefgxQx6g1fZgkU8stx2cxqK431
	AhH8VKHhA4DgMfEItXa88NJ3rSaHfGytcdHeU8CAhYGguVdnsDmLR48mD3FcZSLG4HNGw4eK4HP
	XY+JMcfbp/PsKpStLz3qXFuPqDrVWdyuJMHQ==
X-Received: by 2002:a17:903:3b84:b0:2b0:5bfc:8af4 with SMTP id d9443c01a7336-2b0b0a8b337mr38312265ad.34.1774438868522;
        Wed, 25 Mar 2026 04:41:08 -0700 (PDT)
X-Received: by 2002:a17:903:3b84:b0:2b0:5bfc:8af4 with SMTP id d9443c01a7336-2b0b0a8b337mr38311855ad.34.1774438867917;
        Wed, 25 Mar 2026 04:41:07 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm38152015ad.16.2026.03.25.04.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:07 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Add driver for EC found on Qualcomm reference
 devices
Date: Wed, 25 Mar 2026 17:09:50 +0530
Message-Id: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIbJw2kC/23NSw6CMBCA4auQrh1S+gJceQ/jommn0kSottpoC
 He3EBcu2EzyTzLfzCRh9JjIsZpJxOyTD1MJdaiIGfR0RfC2NGGUKcppD9pasNFnjOBCBDTAnRZ
 t55gStifl7h7R+fdmni+lB5+eIX62F1ms25/WcMhU7IhZAAWje0vRWcW0PoWU6sdL30wYx7oMs
 sJZ/mPtHiQLxDvbNE4y0Um1Ay3L8gWkdHrMBgEAAA==
X-Change-ID: 20260309-add-driver-for-ec-3fa478f264d9
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438862; l=3978;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=iUSkW9hF1tQARLQxRvW7sWeXseefe6gqwXUdgAco1n8=;
 b=uMNig+xsNAZnVO8SY8k2NiXFydzPtPOLYwXCQDRyxaWz6oZV2I4Db0BDOyDoMsALmnrHEjp1K
 w3V1e7NnTamCwlb/FJzqhPCP2aF0skA2qAkk25i7ng40mJQcjKIxeCN
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MyBTYWx0ZWRfX90fLM/e/8djA
 pl9rOzfaNztGRXQcWCnv0FAunZAWBPeVY2BKUqq3CqGZeCI4GQh9q2YEn3qZDQpxJWcVet947Q0
 4R5CUmJXYI42h/VyIFRbcuTOlAPvXuV3Lv2B9fpixRrPCmH7xfKJKk19Hq3ohvaMiCmmtmhvrMf
 VCD8zQDr/t7yEGE7rCCK4BAdS9WdVs4/8h2xJB6O5CqQs+j6iVKUyl8rMxdm5oIRfK55K12EZ5T
 YRgf+rKKx7YWZiShicqag8lP7pqc65xFMA1E3FBp3P8591saQrJbKit8Rivnj4xjQVO2KzNMuWw
 FO6bvhrSJJUlzlIIVsraybg3QuUh68XfXzejLHdBLfChzhaaWfAz5+mAdUVoux5SNNuqqkmEo+X
 S8FrTeMF3ugiCpvGvc0Mlw0Lfn8KZShliuxP9opTNhMcJAuc/H7Mad35m0HpbTtn/dZOMTEk/Hj
 xP4d7J3DbRuy8E3wiRg==
X-Proofpoint-GUID: TtzzsMWPw1W-mrxfs0VUlsM6IsQkP5-h
X-Proofpoint-ORIG-GUID: TtzzsMWPw1W-mrxfs0VUlsM6IsQkP5-h
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3c9d5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=N25LjsP2d8_K3VcmG5IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-99853-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B21C3243B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
reference boards. It handles fan control, temperature sensors, access
to EC state changes and supports reporting suspend entry/exit to the EC.

---
Changes in v6:
  - Add missing includes: <linux/bits.h>, <linux/device.h>
    and <linux/err.h>.
  - Change the thermistor_mask format specifier from %d to %x.
  - Change loop counter to unsigned int.
  - Replace snprintf() with scnprintf() for safer string handling.
  - Use sizeof(name) instead of the EC_FAN_NAME_SIZE macro directly.
  - Add missing braces.
  - Link to v5: https://lore.kernel.org/r/20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com

Changes in v5:
  - Fix subject line and commit description, drop redundant
    "bindings for".
  - Rename binding file: qcom,hamoa-ec.yaml → qcom,hamoa-crd-ec.yaml
    to match the compatible string.
  - Update $id URI to match the new filename.
  - Add <linux/interrupt.h> and <linux/slab.h> includes.
  - Switch to devm_thermal_of_cooling_device_register, remove manual
    unroll loop.
  - Ratelimit all IRQ handler log messages.
  - Promote unknown EC event log from dev_dbg to dev_notice.
  - Remove redundant error message after devm_request_threaded_irq.
  - Simplify qcom_ec_sci_evt_control, resume, and suspend using direct
    returns.
  - Add dev_warn + early return for zero fan count; driver stays loaded
    for PM notifications.
  - Fix thermistor presence bitmask documentation: 1 = present, 0 = absent.
  - Fix snprintf format specifier to %u to suppress -Wformat-truncation.
  - Remove unused cdev variable from qcom_ec_probe.
  - Fix typo: "exluding" → "excluding" in register map comments.
  - Fix capitalization: "ec" → "EC" in error messages.
  - Link to v4: https://lore.kernel.org/r/20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com

Changes in v4:
  - Fix fan count calculation to use min() instead of max() to correctly
    cap fan_cnt at EC_MAX_FAN_CNT.
  - Remove unnecessary mutex lock/unlock.
  - Disable fan debug mode on ec module removal.
  - Fix issue reported by kernel test robot.
  - Consolidate hamoa-iot-evk specific changes into hamoa-iot-evk.dts.
  - Add board-specific compatible strings as per review comments.
  - Link to v3: https://lore.kernel.org/all/20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
  - Revamp the bindings and driver to support generic ec specification
    that works across Qualcomm Hamoa/Purwa and Glymur reference devices.
  - Add ec nodes to Hamoa/Purwa CRDs and IOT-EVKs.
  - Add ec node to Glymur CRDs.
  - Link to v2: https://lore.kernel.org/lkml/20241219200821.8328-1-maccraft123mc@gmail.com/
  - Link to v1: https://lore.kernel.org/lkml/20240927185345.3680-1-maccraft123mc@gmail.com/

---
Maya Matuszczyk (1):
      dt-bindings: embedded-controller: Add Qualcomm reference device EC description

Sibi Sankar (4):
      platform: arm64: Add driver for EC found on Qualcomm reference devices
      arm64: dts: qcom: glymur-crd: Add Embedded controller node
      arm64: dts: qcom: x1-crd: Add Embedded controller node
      arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node

 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |  56 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  22 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  16 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  16 +
 drivers/platform/arm64/Kconfig                     |  12 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/qcom-hamoa-ec.c             | 451 +++++++++++++++++++++
 8 files changed, 582 insertions(+)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260309-add-driver-for-ec-3fa478f264d9

Best regards,
-- 
Anvesh Jain P <anvesh.p@oss.qualcomm.com>


