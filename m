Return-Path: <linux-arm-msm+bounces-101064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMAAG57Vy2mILwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:09:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D1436AB4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BAF63145D46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 14:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D9C3F7E8C;
	Tue, 31 Mar 2026 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tbdLjbws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F45366561
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965722; cv=none; b=LylEktI8uMC3mXrKPcKuUJ1toaxPWlqz+SQCYh0DZ8L6W99gQhq1ZuvR3hxfr46atrqOVLekJJVdsmjtaaxQ+31q1JlE3Kr89Ii1nawGUVUsTIXT539v/4+BCyAtMLyKFDswPRvAHbOeYfV6JMdzUgjxM10BVmrqUyTdt1SxDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965722; c=relaxed/simple;
	bh=yAUREE9KXob3siMEqqlaveFtX3vU0mvtiy26uw8kM4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DtqSQN8G4rnw/OpUvA7taItncyQOpVWv7veuNDvxw3AFVjIQWEK9lOV3v5QsrawqEbEVBeGJ3/ndL+06+eNL8OjlLkUBbOmSwSGl7RAUUt2vSgEBrqZqMxN4SfrBqWLoU7pdDIqwHunQ3HKXJxOh27i6jQpUz5tgz+sbYWDzgbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tbdLjbws; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a284984dc0so636078e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774965717; x=1775570517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcETWGUFrYZgRLtRBP3C5Ptd5x026D08AAjZHrtbcUY=;
        b=tbdLjbwsUVTHmOSDh3YcPx4SmTNlvwV09ZQFh2QgpfmFX84zWs5zdoxX9V+Ina7Ciz
         s/3NWeXU7DO2uZISLdGdKFIdpRort073B6R8Z5mEkwDT7kxHtR4YbApbKSR6of9xmAJc
         gcDF2xPEe0BL4yydiMf4YxliSeNZQGY+4+YDMoWyrBB8hbyPWl92xNNZvgaQFH+PpoZ8
         ocW03X1/ZUg3GIt92KrVtf2t/GViV7qmPyphfdvi/HozLudv0LcrMlAe7/GrlzIZLOod
         B4Zy5ztLI21h8dKYJmlVcoHFxq51QwyB/QpgeyZmH7rNJ6wKPYMLogVPox7kjSLKwzky
         qq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965717; x=1775570517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcETWGUFrYZgRLtRBP3C5Ptd5x026D08AAjZHrtbcUY=;
        b=qN7ZNpBe6nkXJCqkslmcGnkS+4ajXN51pb5/6P1LSH6OktNhR78e7inbPEncmoP+E+
         rMs9bCTV5gojnOhF02f9fPdZ6bwJmBx7Sr75FQPW7HM0kTJBzZHl/TxXubbIt+6MPqrN
         eO+J1e5H+PvyVSgmj6x0XVRLwHuITFmGiDGWFA6x7HapS8b3CSN2EO+BPSeuYCWipOCj
         ctO0z/6YPfo4Gzg8WaColfSw+fvHx4aOuHNQwB/Cou1/r9IZb4nZjnZlRbJoKhxGkncQ
         Sy8kXhIM6B+7MauzKHKurxfBBYvWs3NBr9skFE5RBKKmmiXgOerzSEak5tJoTOWkqV/y
         RRtw==
X-Forwarded-Encrypted: i=1; AJvYcCUPq31Czu4dJmokOVx1HSy+l8TPhHu42e5Pi9S810uKLIx6n5dmJT8blnkqtVqsvu9RjZpPLMq3u7Zt+BN1@vger.kernel.org
X-Gm-Message-State: AOJu0YzdHdfNS/cgEANXNZhnnaTlRNA1TMbbIkVun7edOcUZOx3Pt9CG
	EVgtvcUEHkYlt4FWlyacraxAC8XRgipWKzUM0soYrTFkCHoeO6SoKrfbKzdWdn618ik=
X-Gm-Gg: ATEYQzylAuCoHoP6HKaWqUDBz0wquVq2amo39NM89rK+N+oWO0J0E1JSPRKzFq2iSia
	40Ad/HJjVSa7fVWAAr76utcSdGKS3Tuo6yBthBqO2JwHNT8niqPGOYRfFbPE2kKpAJF5kE3wZTQ
	CneXWGh9lmCChTI2W4qAISsRWga1Ln8XjPBIg9YMj/w3tYr79IkDogCJtj+4e2PW8OrbJFYBoHY
	A26Vkm0UPbE1buIokbTFaeFZz1REK58Qb7UjUXMsjQUScGnbPEXlmQYg+0HvCMFXkfWs1yr4g04
	mv/unhgS2+vHbXCP+lBTC/aQY5yBtR70NmJOP21Q6tG/Qb0c9JllL7koWe76o4WtwcgMtGZdqsj
	sqec9AB48WIVz0ufH+zX4q/1MvIQJ+/M/N3E9kmpV0KukEFubei21bUTtWsY8NL+/JchH8Tknpa
	RPz8itGTVTM6/FEI+zkqtY0Vk3T4Emuy0gkUjDc/ycWh8mX/jjmtdTM+4d8vO3puiL7g==
X-Received: by 2002:a05:6512:2308:b0:5a2:78e2:504b with SMTP id 2adb3069b0e04-5a2ab92cc38mr3048709e87.7.1774965716356;
        Tue, 31 Mar 2026 07:01:56 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1456aa2sm2434745e87.68.2026.03.31.07.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:01:52 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: camcc: Add clock controllers to Titan GDSC power domain
Date: Tue, 31 Mar 2026 17:01:40 +0300
Message-ID: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101064-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: E3D1436AB4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Starting from Snapdragon 845 SoC CAMCC device serves as both a power
domain provider with a special Titan GDSC as a top power domain in
the hierarchy and as a clock controller, where the clock provider
function of the IP strictly depends on top Titan GDSC being enabled,
thus it makes the CAMCC clock controller to belong to Titan power domain.

Today the formal hardware dependency between CAMCC power domain and clock
controller is managed by runtime PM in every CAMCC consumer device driver
like CAMSS and CCI, however this is terribly scalable to any future
CAMSS IP device drivers, and unfortunately it is not scalable at all
camera sensor drivers, which are also CAMCC clock controller consumers.

The change adds an option to describe CAMCC power domain to CAMCC clock
controller dependency properly, therefore runtime PM management can
be simplified on the CAMCC client's side.

The series touches only platforms with CAMCC drivers, which marked as ones
using runtime PM (see .use_rpm flag) but Kaanapali, which formally has two
CAMCC IPs, on the opposite end e.g. MSM8996 can not be covered by this
change, because camera clocks and GDSC power domain are not separated from
other media clocks and GDSCs.

Vladimir Zapolskiy (2):
  clk: qcom: common: Add option to link clock controller to power domain
  clk: qcom: camcc: Make Titan GDSC a power domain of clock controller

 drivers/clk/qcom/camcc-milos.c    |  1 +
 drivers/clk/qcom/camcc-sm8450.c   |  1 +
 drivers/clk/qcom/camcc-sm8550.c   |  1 +
 drivers/clk/qcom/camcc-sm8650.c   |  1 +
 drivers/clk/qcom/camcc-sm8750.c   |  1 +
 drivers/clk/qcom/camcc-x1e80100.c |  1 +
 drivers/clk/qcom/common.c         | 16 ++++++++++++++++
 drivers/clk/qcom/common.h         |  1 +
 8 files changed, 23 insertions(+)

-- 
2.49.0


