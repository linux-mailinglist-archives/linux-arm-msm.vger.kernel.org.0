Return-Path: <linux-arm-msm+bounces-101519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC/XCI4+zmkImQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:01:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 469C438760C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A761B30AB8F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86043E3DA5;
	Thu,  2 Apr 2026 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0Q8IE5r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C8D3DCD80;
	Thu,  2 Apr 2026 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123650; cv=none; b=IUfufNtHwnWo7d3VZJQ6LR/qXVoYnA8k7H89F9Ig/JvHIaxC8NTGdwt9LGibtEbABWASgIN1ywAxqrhs7ekwL6WvFNlZ00RtZh7PoEJvBY/yMxTrejxH4q7J0+BsOK21myVL+Frifl6/RzGrEcilqNoH8jn/nDrTT5Mlmzu6wfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123650; c=relaxed/simple;
	bh=g8X7jdbCgWRJVgbstnTrfuS11/pgXSaoaMN5ZccW5G8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YHemcUIwaU/19T0q3IDnae31AlsbzyfEweDXReZhnH9kyf6a3fck/E7SwLcoAbVUyOPesdFtuEL+7wlh6Fn3dr1TGMHcMlwePb+RTZt3o49T8DVN0QIb570ZjlolV0liR57caos9/1ShuDpSGNBjcP9q+JOAWWd78ZTpfXppjEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0Q8IE5r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75A08C19423;
	Thu,  2 Apr 2026 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775123649;
	bh=g8X7jdbCgWRJVgbstnTrfuS11/pgXSaoaMN5ZccW5G8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=C0Q8IE5raY66RLgtk/htIln0tWdIfEVazxwz+tH7oSRyXPyJVO+37TOQLvRbw5A/l
	 FafXDtIWcZgZcgTsgZFgxLqHLg9QXykFl3GhOZOa1S+hWkauYgrJKU+mJXIP4o/vNy
	 ZsFNQNP1Fi1xqvfNPAOe0B7VQDXrZAwkym+tXOGuHMa60PWbQdZQVPXRkyI97ybhLZ
	 UlfLjG8JqX6U45WPUCQEy4uqqvvsyj9DO1AxK6VqRJH7GJpBjWNacRX7facteTZ9mX
	 FvZsRUmvtvqvAuhJzhdocO4FGQtRMkI8CUfyWdMa/wZ4BruZ+lh7PEpBFHWKDMCWeS
	 uHe5JdnXsnIvw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A78D39408;
	Thu,  2 Apr 2026 09:54:09 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v3 0/3] SHIFT 6MQ SD-card support, improved responsivness
 of touchscreen, and codec
Date: Thu, 02 Apr 2026 11:54:05 +0200
Message-Id: <20260402-axolotl-misc-p1-v3-0-8934e9db6831@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL08zmkC/3WNwQqDMBAFf0Vybspmo6I9+R+lBxOTumCNJBJsx
 X9v9OKh9DgPZt7KgvFkArtlK/MmUiA3JpCXjOm+HZ+GU5eYIWAJEoG3ixvcPPAXBc0nwUsQXV6
 BxqKzLFmTN5aWo3h/JO4pzM6/j4Mo9vV/KwoOvKp1rQqjFZamoYXmq/6wvRTxtHMQvzYm28rWy
 ipXShVw2tu2fQHemk386gAAAA==
X-Change-ID: 20260320-axolotl-misc-p1-601d480c25df
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Alexander Martinz <amartinz@shiftphones.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=g8X7jdbCgWRJVgbstnTrfuS11/pgXSaoaMN5ZccW5G8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzjy/pvCpctAMVvZY8W5n9dTG/nudXwKmeTXHn
 nL+UMXqjIuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac48vwAKCRBgAj/E00kg
 coJjD/4uCUKkiei3H4sL5HGCOEslH6+dfqYlpBJOdXAX5M125RAh6AjVsldTUClwWP5JsYabSDA
 HlHP2CrERCZ5gE+adrPCvcRB1bcMylD3GgYIu9mIHIqQQ9P1Ep98Yf9jrqneIrximq8YwrEpP5Y
 vr+XXWrNjxVHQZDqodnoL/lebmBwGGVb1w3GqUwMfd8rQYMi7v07hm9X87nVxRNVs8zcOT7JLXd
 zT0AX9fkNe8pZlS+q61n65kU7J02L88Od4s8QloelzLZEHvREPP8gjqFSUJk5WDA3pEy0eox9cd
 ZofYqRSelqvEGHG6o2UpaW6DIH5hBsIbnZJMhxoW/3AnkoXGJ37vNx0wGEWFbmSupPfGISVQ23C
 E9LjQsCSnjkH7fpQfpHW/q0GPHPa462JdXNQg1a/6Mm8X7hIV6eLALL8qCRDts6xregdgkkPlK2
 91Cq1Ju7vNrD6fUC4EXfjrsn8xuv1FqeaTs3anMZWcTiU+Jmo+nnMJVok3k4AxavqYDbUCgIcjF
 nxHxoH6UMZJY0Qx4b8LRNaDNsW8hq+h8yM7EayjMu1ZjF+rmZ7wuEKCpYNXr1MlVIaasguz7uFo
 eRdSuhHXK3GWoR9hP8ddzelZyQLt8bsAfFxBDNwajNbVaqrpQTUwQuJMzoMK+lsjNqVl8r/k58t
 ylTa7v5dVyitv8A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101519-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,linaro.org,oss.qualcomm.com,shiftphones.com,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 469C438760C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I've tested that SD card and touchscreen works well, the codec does too,
but for complete enablement needs soundcard support which isn't fully
finished.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- sdcard property sorting (Konrad)
- Link to v2: https://lore.kernel.org/r/20260401-axolotl-misc-p1-v2-0-f3af384bbb50@ixit.cz

Changes in v2:
- Changed bias-pull-up to bias-disable for SD card detection, since the
  mechanism doesn't work, we can just save few uA. (Casey)
- Link to v1: https://lore.kernel.org/r/20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz

---
Alexander Martinz (1):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable TFA9890 codec

Casey Connolly (2):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable sdcard
      arm64: dts: qcom: sdm845-shift-axolotl: Set higher touchscreen i2c clock

 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260320-axolotl-misc-p1-601d480c25df

Best regards,
-- 
David Heidelberg <david@ixit.cz>



