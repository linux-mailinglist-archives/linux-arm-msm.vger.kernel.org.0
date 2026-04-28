Return-Path: <linux-arm-msm+bounces-104984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K1RKh2m8GlAWgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:20:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F78484C05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 314C4300D69A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E06140FD84;
	Tue, 28 Apr 2026 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5JsB3O7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOvFL5Gw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202933F54D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378532; cv=none; b=fUa4mL+rUsZXL66UlX+vdL8CCbA8jQCpbj0McvaD+92oRJn9Cus1yCEljwialrzgJj09dp8fVA6lC2QVi6ESbI55o9QQrFklkIULEnDGWUpS1zCAz9nAV+7phungrDEs7ueQ2D3BJ8zY8hWBSxfi/d76qb2flroJZxoN4B2j9+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378532; c=relaxed/simple;
	bh=uVb1Yhk0uy02Dx4uZCNATMHfkUUmq6vPYQyifB7Gwzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mnyxdehck9FGnWp6sBUyMpqFZv4Htp4z01CvuN8yq1+MH542UTkx67DFIoWUP0G6JVpjmcVy5Ic6GzRptnejtH3zNFJsJc2goTgYYU1rx0j5F4JQ0NTE0fi8WY6R7AXGL6b3YUfMXOTaFe5ST2RLFtPuThSMRynIONOWyQc7Ldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5JsB3O7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOvFL5Gw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9hXde2045245
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e40lVvY+mLJSvt7GFQu9XT
	8pO5NDhPj4xUFXGUrDrIw=; b=E5JsB3O7XdhRoj9NIF/FqZvGn2WPiJ3h8HdRAK
	+ZRtRRElY/iyD6xZV1AVRzI0dUrBdVY/mvuXhzgtoIK+zTsqDSkGwjtbFipjvbFP
	apz+LWyuY8rqPLTgPARAF1Klis8pWIU2OaYb8ducs6MFXvLxT9eQB0tteP+vT873
	UhHtoUJcKmkjeErWrMEk4oWEnHahFu7ch/OQMkSFNxr1WJwRrTTH0w1m+aXx2Nq4
	AD63TC//PAl9nPI8envgXiyrO0xxHE0NmgFEfx1gXRJLbabXUtFdWqWljKNOamU2
	lw0kW4sAc0MBoZ1+9j44CwFAnLx4avQjsD8vPUl2e9083KYw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgyrhuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:15:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fc22424d9so21580249a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777378526; x=1777983326; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e40lVvY+mLJSvt7GFQu9XT8pO5NDhPj4xUFXGUrDrIw=;
        b=jOvFL5GwZcNXPW6lxQS8cJEnCpaszZxfz24LnRHd9qYQUmkG5dTC1srFWh+4WNm37N
         mQgkc1fGtMC24iGttWzUE0NLJFZdjjKZzUTUWFnrAc/SMWFthWCfU6jC0gFF6pQRjWqJ
         Xfl6DkfjMBchlOxsfLkJJUyeuSnNSyAorMTiZ/f1ZGMvFYaRLjwb0gEw+JnVjNUJcv+Z
         D86tdffQq2d3r1QJJaX4j7qLSHS+5b257L9Eg35Zm+vTzE/owyuZIXNcMHoHYTt0HhLJ
         jSDqWR7ri9u4f6CbwxK11JK4GBZYkXsyE+j/Z9jAl30nYYzdnp3sMA+WHx0HUENOa6wz
         6XHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378526; x=1777983326;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e40lVvY+mLJSvt7GFQu9XT8pO5NDhPj4xUFXGUrDrIw=;
        b=dD0aYLY+Q74hcc/FhqYChoFRvWhzbHv+j3KnWFKSPrV7WJthyj4NcNDjgpypOEQ8oE
         12sNAEIuevIWPwUa5ho3d1osaCivpkq+kHhcTn1Txl1JsoyL4KrNWvdihPyHM4rzfAcu
         0J9t4QG49tfy+DcaMGOnf3KVNb9xeaWCIQ3Rd8he/lemDzkatvRmHcpuwfVjpM6LH69y
         YwLhsZHe+Wv1iTJ4oCD6zWTX8UeKgN6kTCAiDDkUQJLzK3yuMhsk4EzFv+MAnz0dnZn6
         wKFCgjbw2HW6eaXhBwP5pBr0gi2lbYgXkh6uCEKtyfc3U0Si9nuF/n2+VSvSQhYLSNq4
         Wiyg==
X-Gm-Message-State: AOJu0Ywq/67VExY8bHb9Ky1OM+mO75vl8+BU6aimCpQ5dPh9EBxwhVv/
	2SVNv0lGYXQAMNyn+rigpoR4tjlneTf0mvsO0YEgfg16gCgtwi/R8kSIumV71zTT5VP4/jIyk7S
	Lta0b4dDe9j38QRUs4jGdjRYeT7o6mLSXFGfmtA5EEPWMr+2oreSLHEaGJPq8CXlf2aV0Uc+DOI
	DX
X-Gm-Gg: AeBDievitcgnTqtFqAAhdvw5aRUSCHDqtieONCPz9+wSjz+z1z1cPXZNRywI8bJF4Te
	MtzlPk8cSEFhpT+3kyw25+r0JdsoRJtIETdUVC3XR5ntLepPW+sTAd2T5QRrVSSk3v+RNo+wghL
	7upRpgun4ftULYxtYjq0zep9SqswzkJ7Q5CDDBXnkulIvY7x5lGU4y3jDW2R7a1dXdRU2g/YABh
	+DpJSjUSrmOpx6IdbYvsIVF7hdjSTzWCSyDXY8qa3ixAHwIBOFTpQ4k7o2kAVgCM077wpnvK5XJ
	ujqh9u8hZq4/zRnCM041BTl4c7Nud1Vyb/IxdWQanRC2RsTQ3ARXoiEPfuQyhgqO3CCSFs9dH8p
	zpLPtltPWVU8P4fE0XqaN6WanncQxSrA1f+iP1fm1etB8Z0K1epAvFRAbUk0qhMJqwQyO
X-Received: by 2002:a05:6a20:7d9f:b0:3a2:c685:f9b0 with SMTP id adf61e73a8af0-3a39c299ac3mr3442929637.49.1777378526268;
        Tue, 28 Apr 2026 05:15:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9f:b0:3a2:c685:f9b0 with SMTP id adf61e73a8af0-3a39c299ac3mr3442860637.49.1777378525648;
        Tue, 28 Apr 2026 05:15:25 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc29b1c29sm2363588a12.8.2026.04.28.05.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:15:25 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 17:44:58 +0530
Subject: [PATCH v2] pinctrl: qcom: Fix wakeirq map by removing disconnected
 irqs for sm8150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-sm8150_gpio-v2-1-7d0e052d5476@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMGk8GkC/22Nyw6CMBREf4V0bUlvqbW68j8MMTwuUGMp9gLRE
 P7dgls3k5xk5szCCINFYpdkYQFnS9b3EeQhYVVX9C1yW0dmUkgtlMw4OQNHcW8H67kuz6dMaAN
 QKxYXQ8DGvnfbLf8xTeUDq3FTbI3O0ujDZ7+bYev9N8/AgaMCoyEroFHm6onS11Q8K+9cGoPl6
 7p+AZp73Lq/AAAA
X-Change-ID: 20260423-sm8150_gpio-6b97306811d4
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777378522; l=2748;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=O36cLJKwvVaAlDQOoTKTKA1gvcKktyDkNZkV0wsdRWg=;
 b=6OM3V1PQN4TSfjBdedYU41KNk4s9c4lHmnqlmwg3vybseQlQkjJndxHC1qAbmP5cyLkvT2K0B
 CzQcNCsfGDfC4uM7hhE7m250ujYOXE28cSzhE7M0/7vbvUyxvmgL4UI
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-ORIG-GUID: ftgINXHafuzgOnUB4FfnZh2s4l1YGz9K
X-Proofpoint-GUID: ftgINXHafuzgOnUB4FfnZh2s4l1YGz9K
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f0a4df cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=0zdWKiCgVtcSCpT9hG0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExMiBTYWx0ZWRfX8gTTmiwLI4ym
 C44Dc3/yWD+55ckLwGC9bP8qzjFeUgwW1IbgPhlb8Ql+OTbgMRIuvEyDy6oTUKMRJ3N54ydFwWv
 Eocwr2qWgQjPMC3xUTJItzhGJRn/HGG2EbCtMd1hBPtG0spBU63+l0TQl9xAQvxAm2ag1syA0sx
 H/SMDQe/PcUr5aQbw3JpNuICKuikml4/ZXzZigtw3O96nRZWGP6DbyMF8b9xZFyXQF53drSprM7
 /l7Pb2MgL3Uj1ChfKWysNZZeEy6Zut7Qy3DJTeRT4WQmx/pFEvhPk8a9LGaTZleOhNdxhIQS8G6
 tO/egFgKoB+BH4VQFyp3dWDtEitdGS/B012OuYEgweHgulpEO/MmJWmGx5M8ZNip42g63u5xuMx
 57al1+lDxuQ/Vngpb9PRL91WPtcPV/XyrQD2uVIWX/U0iO0kdbLTl+cQ77bAd84xR1NFgwFTBbt
 IWO9Vo9Ao2zlPJfL4nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280112
X-Rspamd-Queue-Id: F3F78484C05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104984-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

PDC interrupts 122-125 were meant for ibi_i3c wakeup but sm8150 do not
support i3c. GPIOs 39,51,88 and 144 are also connected to different PDC
pin and already reflected in the wake irq map.

Remove the unsupported wakeup interrupts from the map.

Fixes: 90337380c809 ("pinctrl: qcom: sm8150: Specify PDC map")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
Changes in v2:
- Minimise the diff to make it more readable.
- Link to v1: https://patch.msgid.link/20260423-sm8150_gpio-v1-1-e418613a1f48@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Linus Walleij <linusw@kernel.org>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/pinctrl/qcom/pinctrl-sm8150.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
index 0767261f5149..12713671243c 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
@@ -1493,18 +1493,18 @@ static const struct msm_gpio_wakeirq_map sm8150_pdc_map[] = {
 	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 },
 	{ 12, 104 }, { 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 },
 	{ 30, 39 }, { 36, 43 }, { 37, 44 }, { 38, 30 }, { 39, 118 },
-	{ 39, 125 }, { 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 },
-	{ 48, 51 }, { 49, 53 }, { 50, 52 }, { 51, 116 }, { 51, 123 },
+	{ 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 },
+	{ 48, 51 }, { 49, 53 }, { 50, 52 }, { 51, 116 },
 	{ 53, 54 }, { 54, 55 }, { 55, 56 }, { 56, 57 }, { 58, 58 },
 	{ 60, 60 }, { 61, 61 }, { 68, 62 }, { 70, 63 }, { 76, 71 },
 	{ 77, 66 }, { 81, 64 }, { 83, 65 }, { 86, 67 }, { 87, 84 },
-	{ 88, 117 }, { 88, 124 }, { 90, 69 }, { 91, 70 }, { 93, 75 },
+	{ 88, 117 }, { 90, 69 }, { 91, 70 }, { 93, 75 },
 	{ 95, 72 }, { 96, 73 }, { 97, 74 }, { 101, 40 }, { 103, 77 },
 	{ 104, 78 }, { 108, 79 }, { 112, 80 }, { 113, 81 }, { 114, 82 },
 	{ 117, 85 }, { 118, 101 }, { 119, 87 }, { 120, 88 }, { 121, 89 },
 	{ 122, 90 }, { 123, 91 }, { 124, 92 }, { 125, 93 }, { 129, 94 },
 	{ 132, 105 }, { 133, 83 }, { 134, 36 }, { 136, 97 }, { 142, 103 },
-	{ 144, 115 }, { 144, 122 }, { 147, 102 }, { 150, 107 },
+	{ 144, 115 }, { 147, 102 }, { 150, 107 },
 	{ 152, 108 }, { 153, 109 }
 };
 

---
base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
change-id: 20260423-sm8150_gpio-6b97306811d4

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>


