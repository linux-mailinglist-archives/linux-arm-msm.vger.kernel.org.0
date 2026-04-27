Return-Path: <linux-arm-msm+bounces-104780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIlwMtqe72nwDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:37:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B79477BCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B909303204B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373D43E5EED;
	Mon, 27 Apr 2026 17:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBKosTeO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/Rqkd6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BB6369970
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311350; cv=none; b=INhfZKmYaTrkAWMMkVftj8D9bftrcau1jUAsE8C8Z7x25UxU/giL74tcFElkJF8ONn43VJjoJz0Hc5OncIwQdodpYM+P4FKsHSP67dEW+1flb54kaY0X8T9s1wgX3v8CAkTdrgfwlCwXaszT4wZQX1G7zW2eGWDBMUpcPL1E5fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311350; c=relaxed/simple;
	bh=EC3OzX+vlwTXZBvlIcPgyWjHlhMJkLSif/QwxZigrFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQ8kkNJe6aXzadPt5dJwNYktAlKuuM+QohmUBwUfRrF6cT8DmWPSJo2HyYcLSjeZwcdhQxgdokHegeUuxp5/aYPTqsjnOdkpJPYGxvVAjWWhMZm1kvCansBvXIAeyY/21ZxHTgamVgfljWgGZm6puWt/GiCVlydSLcK6Avw7hoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBKosTeO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/Rqkd6o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDkD7K665665
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxZRWFWfF2A2YEPPEjNfyo8rVBY3ZeJbdzkncV/rJ3s=; b=QBKosTeOF71N9QCt
	kLy1Efm3v4kFG1+wh8nkNK/kyONRsZ4ZbzHnfXfaLDMkcJKzDiF3b1XvZGzqzs1r
	85Zbj1DDir05ZpezCuH5kpZEX18cmOpIwQHSAuzYFX8p4kBVCcy4izHAFjRttx4p
	OLktxLV0QltuiBGEVbonzR0iTGZk0UsQ122K+7WXxX+n+nGL+qw5c4JdCSFKqzBY
	m+Kyq+EgrM/7b6GBSXhRBhdOkKs7keHAPP4VQl+rHBhC/baj0vZKK+QpjP/t1Bfy
	gG4DV4ITl5TpQidR94hNWp87dvZaMvqQD+CA30l4/GfH+W9rE2oQZ0WIMDYVqFOP
	0pI4zQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n2j6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:35:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24af7ca99so144250805ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311344; x=1777916144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxZRWFWfF2A2YEPPEjNfyo8rVBY3ZeJbdzkncV/rJ3s=;
        b=Q/Rqkd6oEKSpjtHhzSn2iaLC/Dd+NmWW+ZMEh49W7Xx3yvmRVDSjHuy8KfNZjgVvth
         YaGv/KmuTh7t7niz+SYFp7JuEtwwttnyC7BeqMiv09KRyKfBekolvYTZn/EoZsFChzQV
         IIgIncZzHshyav85VfkSLZimFuDQZLQaLuXETvESBAJhBCJl9v+bNjn0lF5ztGeQIODb
         VbJNIZdhwAOU4caCX6rNYRkJgX1H9k1bRSdyulfnCNBkzP7TfVVoB5tYfox94fc/H3mN
         VfrkHxa8dkes856iWcfkAa2QppaqtHmejEn0vznyvKjdOUKD0vLH0mvCQhMWUru47zhL
         GjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311344; x=1777916144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fxZRWFWfF2A2YEPPEjNfyo8rVBY3ZeJbdzkncV/rJ3s=;
        b=DpYsvnKo/GRuBQS1eN/WR3hJX0mbESa9p5BpolNYlQkjBYpd+cXfpy9E9/cgOlJv6Q
         fkRC0cQW7rcXhG2Kr6raKud8qOCHOj1Q6fKML1fbmN/0TfNK/XbMkzxkxoiP0R5tdN9S
         0lqRA9kGIBRrX85EJzaSovYt5u7Hm6jyBuVGrg3DArhWT7T9o4S7KneRSTg98zc6tAfk
         XvbKbp80geTExyZKM7JfgD0PRALbgY0BOb7+ukrJOvYJS4mY1KnH0jYjvMgHIe7SE8wU
         lV8+Y/5N5L0eGXS9VGvV5ph38LigZxzQDZlKqBoYELJ+e+/Nxnk031KEDAYwsRO2LtNz
         Kwrw==
X-Forwarded-Encrypted: i=1; AFNElJ+m2Hmo8200l0v1lyWRG6fIW7exCI7dmxaBK3zEzPnFa5S8XhRyb71P5sAZfsVQz2C9zaGN6ksT9wr0ePpw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnp2UI7s43PPNlfl+NcIKSSa+KbgVwCvY5KP0pK2Dk3xOeUU2E
	LoTxEJ3l4mVitssnHFTuiBUD7meL+yIBaLitIu3SU5w4xhZzJP7y+j+LLUEIypggMUfQFlh2ara
	eHwr4hZDoCntq14SIbl3+sWxId23jFHyKkCdr1VG0Bhub3TkAR/C5yB5qmHiwmHWnLg7G
X-Gm-Gg: AeBDiesWtzkzM82qiUmx2XGHaEuKcJY6jFRsxsa+Bv7QnS96tViplHSuGW4+iXvdmT8
	9XnV8EN8nPG12DFqhRwcyUXRraK713MUwPTo1w3TABxDpPEIvKwh92S37J/qpVJXO2h/xELIKnt
	81TBjLVPzqUb8tczlazbmmJO84dWkK0cdoThBVXkLBejKwoxFr+C3EWn3ae+YMRrq8YmLpHBqEQ
	Aa9KH581KQ+awatCD5cmekCN2p/cSzWcX4oM4YanM7nlCQj6xLGJ2i15H3TfPKpRbHmAUTCzwxx
	7wfeetcF8ZnihNYKAq/Bbv7TEopnBqYlMWuk18Wcq6DjAvmDoBjbklb99rtRpM9R+B4ZRPF1Ixw
	b2FTRc3MLUQHPdd6Guoi3fXaAnZPozYMdUnUcjCzD2imfBZ4FYmjflaWIMVsQDm72kXNF
X-Received: by 2002:a17:902:d701:b0:2b2:45b7:306e with SMTP id d9443c01a7336-2b97a78f4d7mr1241885ad.3.1777311343946;
        Mon, 27 Apr 2026 10:35:43 -0700 (PDT)
X-Received: by 2002:a17:902:d701:b0:2b2:45b7:306e with SMTP id d9443c01a7336-2b97a78f4d7mr1241385ad.3.1777311343260;
        Mon, 27 Apr 2026 10:35:43 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:35:42 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:43 +0530
Subject: [PATCH v21 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-3-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=6644;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=EC3OzX+vlwTXZBvlIcPgyWjHlhMJkLSif/QwxZigrFk=;
 b=v35u8Vt9MgTrbyAf/bRq2etw0DetCOIumFaOM7bzxAKqnOpnWiOGSWotj3nmrczUNvz4EL1BJ
 duqswEM53jlASaft5eijjxAoyI6ICnmXloH3LZyieplndeuH8v5S8Wm
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfXy9NvE3/C8R3q
 2UOJ+lrY5ht3ryZviIeiKiYCAu82pwRZuz36wAqXvd3MAM9EyE8/kRT22HFs0zFLoebxV1QtXQh
 sw+TQyP/qkmbgiYjP8UZzR7jXrqlUFw7HveXCLY85ccwMUULF5VMjJ0AoSn/VKzYrdIFL3hwt+U
 YoTio2zzapsU8AlHUcPVcUyU/NSIvVEvFXuQUF8phfjB9tA/Ojm8R/DiujY8q/QRNYTnkN1JkBg
 92sQoB3hT4ovUoL8qQeDL7a3n/uEO6LAoKwdTbX8Mv2mYce4V6ONQ/EtL+UJuwTJHTNqEhQ9HOI
 EOhWGUdXiKuYPBO0QTLDipU8wFc7r+PYrcUYdHbmzC816wGh6zJRYYVFs6mtWcN/xqpDCk+klyK
 HEPNWnEYEtBb5L3QLAa+GFDMgDAO+KtarOS81SBPqK/jp/RuD7XScAks5NO0/T34wq+jJC0Mq4j
 WJrtQHP03TR9zGkMiKg==
X-Proofpoint-GUID: APQ-dCA5ERwC_zDvK0WSYbEyjrUzYYYj
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef9e71 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Z8KYaV7TWDb2btNTYxwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: APQ-dCA5ERwC_zDvK0WSYbEyjrUzYYYj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270187
X-Rspamd-Queue-Id: 70B79477BCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104780-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

reboot-mode based drivers can define a reboot-mode by adding it under
the reboot-mode node in device tree. This limits such drivers, to define
any predefined reboot-modes statically within the driver and creates a
dependency on device-tree.

Introduce a list for predefined modes in the reboot-mode framework and
process the predefined reboot-modes along with the device-tree defined
reboot-modes. Modify existing reboot-mode based drivers to initialize
the predefined list-head as empty.

This patch enables a reboot mode driver to define reboot-modes through a
predefined static list, in addition to the device-tree based reboot-modes.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |  1 +
 drivers/power/reset/qcom-pon.c           |  1 +
 drivers/power/reset/reboot-mode.c        | 66 ++++++++++++++++++++------------
 drivers/power/reset/syscon-reboot-mode.c |  1 +
 include/linux/reboot-mode.h              |  8 ++++
 5 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index bd05d660490c686b43134f82f1eadd7665403d20..83a8d80fd7d1ccb1b736aee5f2d675246a63b8f8 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -53,6 +53,7 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
 
 	nvmem_rbm->reboot.dev = &pdev->dev;
 	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
+	INIT_LIST_HEAD(&nvmem_rbm->reboot.predefined_modes);
 
 	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
 	if (IS_ERR(nvmem_rbm->cell)) {
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 57b36e6186f80aff947fd7f5aae5ce280c65dc6b..9d0e3fc621a6173438c6da4cce38394199451881 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -73,6 +73,7 @@ static int qcom_pon_probe(struct platform_device *pdev)
 		pon->reboot_mode.dev = &pdev->dev;
 		pon->reason_shift = reason_shift;
 		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
+		INIT_LIST_HEAD(&pon->reboot_mode.predefined_modes);
 		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 		if (error) {
 			dev_err(&pdev->dev, "can't register reboot mode\n");
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index f1372dc700e48043320812c3d3619ab1539e1854..a84f7c67a4746d4d5c932d4df018aae10bd5518c 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -20,12 +20,6 @@
 
 #define PREFIX "mode-"
 
-struct mode_info {
-	const char *mode;
-	u64 magic;
-	struct list_head list;
-};
-
 struct reboot_mode_sysfs_data {
 	struct device *reboot_mode_device;
 	struct list_head head;
@@ -116,6 +110,33 @@ static int reboot_mode_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+static int reboot_mode_add_mode(struct reboot_mode_driver *reboot,
+				const char *mode, u64 magic,
+				const char *name)
+{
+	struct mode_info *info;
+
+	if (!mode || mode[0] == '\0') {
+		pr_err("invalid mode name(%s): too short!\n", name);
+		return -EINVAL;
+	}
+
+	info = kzalloc_obj(*info, GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->mode = kstrdup_const(mode, GFP_KERNEL);
+	if (!info->mode) {
+		kfree(info);
+		return -ENOMEM;
+	}
+
+	info->magic = magic;
+	list_add_tail(&info->list, &reboot->head);
+
+	return 0;
+}
+
 static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
 {
 	struct reboot_mode_sysfs_data *priv;
@@ -180,9 +201,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
+	if (!np)
+		goto predefined_modes;
+
 	for_each_property_of_node(np, prop) {
 		memset(magic, 0, sizeof(magic));
-
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
@@ -194,26 +217,20 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			continue;
 		}
 
-		info = kzalloc(sizeof(*info), GFP_KERNEL);
-		if (!info) {
-			ret = -ENOMEM;
+		ret = reboot_mode_add_mode(reboot, prop->name + len,
+					   REBOOT_MODE_MAGIC(magic[0], magic[1]),
+					   prop->name);
+		if (ret)
 			goto error;
-		}
+	}
 
-		info->magic = REBOOT_MODE_MAGIC(magic[0], magic[1]);
-		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
-		if (!info->mode) {
-			ret =  -ENOMEM;
+predefined_modes:
+	list_for_each_entry(info, &reboot->predefined_modes, list) {
+		ret = reboot_mode_add_mode(reboot, info->mode,
+					   info->magic,
+					   info->mode);
+		if (ret)
 			goto error;
-		} else if (info->mode[0] == '\0') {
-			kfree_const(info->mode);
-			ret = -EINVAL;
-			pr_err("invalid mode name(%s): too short!\n", prop->name);
-			goto error;
-		}
-
-		list_add_tail(&info->list, &reboot->head);
-		info = NULL;
 	}
 
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
@@ -226,7 +243,6 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index 9f4b18c5e46f6a8bf197773ceceb80b250f57541..0218b71541a0cefe1534e306f956ae51ea9ee870 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -48,6 +48,7 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 	syscon_rbm->reboot.dev = &pdev->dev;
 	syscon_rbm->reboot.write = syscon_reboot_mode_write;
 	syscon_rbm->mask = 0xffffffff;
+	INIT_LIST_HEAD(&syscon_rbm->reboot.predefined_modes);
 
 	syscon_rbm->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
 	if (IS_ERR(syscon_rbm->map))
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 2ce189fdfff4b396d7cc6f175b30016781ae4fe9..f4518528fcc1fac49209de91cec7e050088ef8ec 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -15,9 +15,17 @@
 /* Get 32 bit arg2 from 64 bit magic */
 #define REBOOT_MODE_ARG2(magic) FIELD_GET(GENMASK_ULL(63, 32), magic)
 
+struct mode_info {
+	const char *mode;
+	u64 magic;
+	struct list_head list;
+};
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	/* List of predefined reboot-modes, a reboot-mode-driver may populate. */
+	struct list_head predefined_modes;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };

-- 
2.34.1


