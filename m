Return-Path: <linux-arm-msm+bounces-101376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHsDFqhNzWl6bgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 18:54:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C13CB37E394
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 18:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAE7B30269C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 16:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7875347A0BE;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ve/DKWcJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B13477980;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062309; cv=none; b=qccQjccAXy4w32N0wfvGKIYv4TkTZM43yS97oaOYP4ONDtZ6BxgC/qWNy2cGm6EPQDmgmeLgciSOyJk/wD+SZk28Ah+Xh+53PD+H0U8toa5i96nu9Ac39Kpdek3KE/y99Lpyr9/fl8qYyK8P8Ks/eTyyFRVqNZ7rmUoUt/tnevA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062309; c=relaxed/simple;
	bh=FsJz6Y1jrRhN+ynwVx9vj7KUeac32cCBJTfbABnR1WY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TlbmSnUhB93gq/Bq2A2BeRdyZi4cQZy2W6G7UK7t+PF9LLfWXM6RAasNpTf1fM6O5s4Q+EcZmdjCUQuS8HzLTkx+nDT1O+DvGYfK5FIcZbQ9Oh3wPHUS+sVTGfmF5Gmn55gxakBHq6vL1wvneElfVOqU/TKH/nXfT3JsWrKf4jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ve/DKWcJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0EB3C19421;
	Wed,  1 Apr 2026 16:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775062309;
	bh=FsJz6Y1jrRhN+ynwVx9vj7KUeac32cCBJTfbABnR1WY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Ve/DKWcJ4ZJ94klwMC12JzOHRH/ORKBKBcA3Ir/a0WHpvFnJxv7DFNDhTrry4+U7A
	 bzQpQ0AQz0nmcvO5gpwtwcQPn/X/pdW/RosWUKuIHcCR789AgKNDLboXK+NaoUlNNf
	 bTqAiZPVOWEYrcQakNaWcd5RHGLImnRMeVlYxUHZwzIdb1BqWiIqlFziyY9sSjnWgl
	 9cb1cKgsbddu/RitehgjybeUAnqOtkoRoqv1g0D7UGScwvt5x3iqvTCCs5eaU1efpR
	 kgR5s2JhlPOEKRRS81skE5EDja1+Qmw4bWejcIunVz1VXm86hcpuJodmkQZdlvCV8z
	 JuQGOMoNoG+NA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F0610F6FDE;
	Wed,  1 Apr 2026 16:51:48 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/3] SHIFT 6MQ SD-card support, improved responsivness
 of touchscreen, and codec
Date: Wed, 01 Apr 2026 18:51:42 +0200
Message-Id: <20260401-axolotl-misc-p1-v2-0-f3af384bbb50@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB5NzWkC/3WNQQ6CMBBFr0Jm7Zi2SgOuvIdhAe0gkyAlbdOgp
 He3snf5XvLf3yGQZwpwq3bwlDiwWwqoUwVm6pcnIdvCoITS4qIE9pubXZzxxcHgKlELaa+NMKq
 2I5TV6mnk7Sg+usITh+j8+zhI8mf/t5JEgU1r2qEmMyhNd944ns0HupzzF8RQmiSsAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=FsJz6Y1jrRhN+ynwVx9vj7KUeac32cCBJTfbABnR1WY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzU0imtl4V2NbNr/u04qYY7qqupwkyMb1rtxzv
 1pQe+ECRDOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac1NIgAKCRBgAj/E00kg
 ckUJD/9DQYZLYiGyqpcxIzN7GcI31eYZwOliWB1/A6I6AwBFUDememBrYcaRI6CjJMmqh6qT5uA
 uJq6JHJN/75797xKtKJ0oHVK4YO5WT/rsbETJ7Wq/9y0N07/mmhCEZgxa0BI9qnxrzSE0I9mgiZ
 rKuIPh9MDdEe16co2wGy9D/IP3dOgEELPquFXDnVWbjofBmvp1AWEGVLmkTDFUwXBCMdIufqSf6
 SuSabZx0WjVK3RP3cdew46y0QOyWDOLGpTApLADgTATdJzudd+b9r7+XhXRWcONaqsT23E/DkUg
 9PlIzXMWTy4I2WV8wJppxzilmigTyDxOV+aBxul2gGls0QshAi67isu2uF5HafKOKA6j/7gF7zu
 c9DjoB9yznvpWjlPAjtg536Ne8EMOucmoWwkNulpcUjVZwpudbwiqfUnndsOVavVasl/lC4kMzK
 lasQBAd38mNthFNs3SqCNHoGqmxMfES7AWWpft6iVXiSWRC9sdgBZqgWZS9BtSSSv/mI06nJaIh
 Tkkrq6aJg5gn304C+UqD3DVjBvyVaECISGLilOW2azYnhPsl0NQUt0sp859y1Tp8a6tyf3Oval3
 uWgs7d4kcJDYdI0EJr7IuUxn74rZAU4zuXK9ibnUJ9s7exdtkk36qc73Bhki/SklA2Qbqxbmzlo
 63hszrO3Mn3Vrbg==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101376-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,linaro.org,oss.qualcomm.com,shiftphones.com,ixit.cz];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: C13CB37E394
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I've tested that SD card and touchscreen works well, the codec does too,
but for complete enablement needs soundcard support which isn't fully
finished.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
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



