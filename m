Return-Path: <linux-arm-msm+bounces-113362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2W5YGeMgMWphcAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:09:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1C568DECF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:09:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RrtsQxuO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j8JrVTDq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113362-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113362-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2267030492AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1538426ED3;
	Tue, 16 Jun 2026 10:08:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873B62C11F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604520; cv=none; b=W99QDbUdkHlY4OOGbGWgchezuSUhHDE5Z5o1iHtbMtsdn36Edl/TAp47D5DgqEWvHb4QkLZOJXcAjKGKguIJaO0RNzr2p+S7pbpdPbOy2ZsAEGb1+4Ur4vKqdUw1h4VYWD0CzkO7FZTXw25jGnGcGarVe4Zd+2zB+MBlmvoJC+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604520; c=relaxed/simple;
	bh=8jcAV2yuoQt7G02Lw5FYeoUTF9xTmjUkDoeFdxT1AHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uWizaQ7ccfWR+fGPCvRVlylDwjCvcG5XK9nAQpgLZ9Qfe2p/iOfl4KdHTUVgGAXFlrT1xaT5l6b2ZBjrMkoRd7lFzFsI4LuODoVEBSBm+4ZY3jx69Cxir64/lRE6+gHyPPT6DFCC6y3N957qO4FSgUTaeXkCFuYSv/o1EoU8Vio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrtsQxuO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8JrVTDq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G64hOG2911959
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bcS/UZMaUayu08adKTpLXZ
	zntUkOKoonI+b1ydAQ5Yk=; b=RrtsQxuO7jNKThVat815pFuk3qQMlITe9Q9VOe
	bN9clA/h1seo7O7BjmP0Y2X2NXM6BAB4+fQ6v/bXKNo3/tG8TfHBqRV9yquoJmSG
	xyUpy9AlanDIu7uq2g7hd8hPOEv+Wv+yI+TjYmzAKoSzdJtV4uHh8dUU2CN2vUkV
	Wa3WVfv/UWkH67Phd/c/oq2AkU3lPvztlNsXYYcehsrv/cf8Gm+1QjpRYiUZo9lL
	K2UcmTnPv+95RwV5gvJQ/6tc+TJJYbLNM+viLc3up+VsUqRczE5XCKQoccabqhVo
	1NaasnHo4s4IBCebnZqo5h7oEpQpc9dhvcIxdxKWIZBniDMQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52segp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30761ab3483so1155310eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604516; x=1782209316; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcS/UZMaUayu08adKTpLXZzntUkOKoonI+b1ydAQ5Yk=;
        b=j8JrVTDqVS6O7l/AkGD0mlIOQVgfJbbCBDjWk+W9m7PBjbGjE2p3/LqYvCWWqCV8SJ
         AOTJ04tj98hSwvaFj+faoHiTN+J4K+Jy7Bd1wsUHybuxpD9w2gx8oW4tBqZB6UivrvPv
         XgQJa4Z88zWggkDb6htxRhB+RNG2uPj/NLIB2y4BwvA9/TTu+60EAUSb4iWENbljb5HE
         m4CiHa6jQ7L2mHFCYAuI4fY0hqbr+lzuszLwlus1t/1j5CvGvPWdIUeBDo49ThKzuCM4
         zwpYKeDGVxz5myCz7rgJU+VinwR+a/aq9QaoGKU/PF17nYvLuCiLA1KLQiWqS+CAgU/h
         lYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604516; x=1782209316;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcS/UZMaUayu08adKTpLXZzntUkOKoonI+b1ydAQ5Yk=;
        b=LYlVU7loSbAZxmSM/HYsXLBZvDWfQWsAesI9ugO2QPEnuTPDeuuY3txamSKaEoebPj
         2odNl4l7tLSnadmUVxKcPT7jw+iNYvDhQ/XCpqrYRr1CgEdaYo9OWt+S+dx4rjXWybSQ
         y/j2MPRallByxDJwQMwLMgGSxyPb+QfPDQ9/casbeW5w1Jr/nWyDHPPI+NGA2/ZBq37G
         K9yZxVj+k7o7HsDfEa9DR4jwitOh5INpFTo2AjP73UZ65FlB0z7dfXT8nKLSER/tiJcm
         nX99m8rjK+1k3euYLdLmYHqXEBVxHtw1eOXt2zh8BTfQaVFhbpWuNl9QQTmpgj4rd0z7
         KSAw==
X-Gm-Message-State: AOJu0YzYzzXIV/96CgZo5BTavd7y5xBgTUXekyAsfot8n34ckFubdi4p
	gNwj8N1Fjs0p0CfOkN2A64bOyR2q0zw7MvpGx3b2z8Ze1920QxJca/jFO0pyumTmnVsxmFI4M5F
	MnE7pkn4OGyWTRS1r8mF0W8spkXWjAWERiprfitB/h3JQOFNDsqCIA0whdc065iDlgyP8
X-Gm-Gg: Acq92OEgfiz+aujmkZBpSSl13HHXOq9mOU5tKg0+Ab7h3+R5+okQLG4sgDz3UG29kd9
	B8usT7CIPeh+dYGm14lRQEamll3yFZneTLc3zs2T0K1OTN6iHZffClm7PnyEhrSjGDcCoo+IOrE
	RAj71Hvwmt0X8zESoKNzU+foi2s63Okd8sHiuT1w6R3WU8u2FQLdc6G7n/nENRZ7vogk9HklXbP
	oVAb0hSXjJ0wwdHouMiQzzWJBwKVP3+5Zm9K7ros1rDOnoqTq25gQOhlDJLQVSDnqH0qx4zQj/y
	1/j2cCVYLvoqO4s7FNgqSzstx3bbK1yvDoH7MehNvxeeRDxES0wFPcRqxW60zR7Mxre/5ba1hDN
	f+KAkv8dH4bO8xH9qGwt2N8yR9WSyh8fTeg/LTaU7uGWjfTf/l3hAD1uatzxncQ1puZvXc6N8PA
	==
X-Received: by 2002:a05:7300:d12:b0:2ed:6f94:9d9f with SMTP id 5a478bee46e88-30ba5b0c8a9mr2034568eec.11.1781604516452;
        Tue, 16 Jun 2026 03:08:36 -0700 (PDT)
X-Received: by 2002:a05:7300:d12:b0:2ed:6f94:9d9f with SMTP id 5a478bee46e88-30ba5b0c8a9mr2034548eec.11.1781604515910;
        Tue, 16 Jun 2026 03:08:35 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48bfa7sm18401484eec.5.2026.06.16.03.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:08:35 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/4] input: misc: Add an initial driver for haptics inside
 Qcom PMIH010x PMIC
Date: Tue, 16 Jun 2026 03:08:23 -0700
Message-Id: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcgMWoC/x3MMQqAMAxA0atIZgPaQoteRRw0RptBrY2IIN7d4
 viG/x9QTsIKbfFA4ktU9i2jLgugMGwLo0zZYCrjKlc7PGhfUeMqGIZ4CilaosazH401DLmLiWe
 5/2fXv+8HsdwfeWMAAAA=
X-Change-ID: 20260616-qcom-spmi-haptics-3cc97e7b232e
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781604514; l=2105;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=8jcAV2yuoQt7G02Lw5FYeoUTF9xTmjUkDoeFdxT1AHI=;
 b=2FehIfS41N/TPc1qLndk4mWsPF80STZZkVugeFaiM+iKcjib4s97/xasjxTkpjNhdKEb8XPy7
 G6Hs9iTr0hUBhd4DQHQ+j48o2zEgt+Hp9tD/Hs+7VNXAWx7vPtj4qQ1
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX6XIRFMw9KoFw
 HEVbKUzUriOeg2HHhjhMKeZ3aLKFoy7OE/XCq0z+4THT3oLoE6xMLgHxDity+tlTbEqWaeWsJEs
 YcE+idHqiFZI1uqr7u2TY3fEQG6TkKQ=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a3120a5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5KqnN7YOGQbVWrjFSmMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX7h3wie3LhLZh
 HpYprKCaiYtCEotOR2O9h+XuyGQiAIm3tZ+ZF197ydGe7j6JwBQzD43fNocieq1e4/jNlWhwIG8
 9F2CXLATRnZU0dFyE1c+BW6GQStI5tns+6h4gEAVFbIXvExyEHSp657k7oG8TDw2M+Gb1IRDeqK
 LKoWCPah+UnAXbHC1tLgmOUBpOK9920EV9/pEl0g7s1uZ4iAAJlGWBLofHt3ip9Z9JaUTrEp28J
 ZTFJRdBii7TTPN00erdVC5s/gb57qmyqzYsHF5+RBwzn1buGJ5ONXajW8Wy0D/Iuqag+H4ZxHrB
 zgbw+itg19/zOCyI/Ut6bK4wi+HwNItb8l5Fnf2VJLTcPKYVS2pq3kOk3he861QO4cseBpgWfMe
 UQ6aSr0Wxl7Ro8DKdxYN4uY2kbKh7PuHbmkxVtMzkMik2lqPh8mlHaH2OusjZd944vGQeT5mvq6
 djLg814aobKitxT9XPg==
X-Proofpoint-ORIG-GUID: Zfa9uOS2AizMkuHqS_RhAxHeZVWYS5_N
X-Proofpoint-GUID: Zfa9uOS2AizMkuHqS_RhAxHeZVWYS5_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113362-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC1C568DECF

Qualcomm PMIH010x PMIC has a haptics module inside and it could drive
a LRA actuator with several play modes, including: DIRECT_PLAY, FIFO,
PAT_MEM, SWR, etc. Add an initial driver to support two of the play
modes using the input force-feedback framework:

  -- FF_CONSTANT effect for DIRECT_PLAY mode which drives sinusoidual
    waveforms with fixed period and amplitude, which would generate
    a constant vibration effect on the LRA actuator.

  -- FF_PERIODIC effect with FF_CUSTOM for FIFO streaming mode, which
    can play an arbitrary waveform composed of a sequence of 8-bit
    samples at a configurable play rate.

Also, add the device node in the existing pmih0108 dtsi files, and enble
the haptics device for several boards by updating the vmax and
lra-period sttings according to the LRA components that mounted on each
of them.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Fenglin Wu (4):
      dt-bindings: input: Add binding for Qualcomm SPMI PMIC haptics
      dt-bindings: mfd: qcom,spmi-pmic: Document haptics device
      input: misc: Add Qualcomm SPMI PMIC haptics driver
      arm64: dts: qcom: Add PMIH0108 haptics device node

 .../bindings/input/qcom,spmi-haptics.yaml          | 119 +++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   7 +
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |   7 +
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi   |   9 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi             |   9 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   7 +
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |   7 +
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/qcom-spmi-haptics.c             | 831 +++++++++++++++++++++
 11 files changed, 1012 insertions(+)
---
base-commit: 66725039f7090afe14c31bd259e2059a68f04023
change-id: 20260616-qcom-spmi-haptics-3cc97e7b232e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


