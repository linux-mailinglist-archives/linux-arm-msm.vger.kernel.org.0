Return-Path: <linux-arm-msm+bounces-109479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA4HOhx6EWpImgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 11:57:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4F85BE6CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 11:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F3E430C64AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 09:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6EE385D7B;
	Sat, 23 May 2026 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWASsaYA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4000381B1B;
	Sat, 23 May 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779529537; cv=none; b=PREWrRppLW54+GsmolnWZtRrAerGZ3WvXmJg651UoeToTfEwQoxW0H01dsp1H+870MOrj96CVMYfDLBSp1ijEnvX2kvyIaB/C3I7DJpfEKf4jzlERMt1AhexPDy2sfRbSZS4Z+1Bf3z+rxxd2B7A5X7TePTg0Ah+E29zHZe2FZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779529537; c=relaxed/simple;
	bh=0KtWD3IPpWmaEU9h6RkZwg+0yU/vLY50Z8txmH8tMi0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D2vxiO0axELc5ie0wYNV/xb8g81AKZQmWfjr4TPf9UKiP3UEvvdC8+AlsRdvIaxkLANhTKmoxk2KFs5lmu4u/SwfcfZImr6ZxiKrW6ZfIMQj0RR9Vjx9p2nDkQMoNDbCt4TDZ3Cc/ne9CWNXlK1rpLQnrdhsgDzyT76+OSutR6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWASsaYA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8392FC2BCB0;
	Sat, 23 May 2026 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779529536;
	bh=0KtWD3IPpWmaEU9h6RkZwg+0yU/vLY50Z8txmH8tMi0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OWASsaYAs8ye8wuwt1OYX7ii2WFDZIslAWOeBI4P7MtRmz+6luyGD0UdQCfy+Qe1u
	 gWchgZg0L7YjGtx7OhNV8otAqX7w4gGMhwQ2CzVJGTOlJNYR3G18XrA+CrKRqUQcen
	 1+ZUvObX85cLtKj5j9TKEUoR2lDZVTTosIQBDelyaxeDr0IYk+ZonJN5NFTmbpNvzv
	 Nm0t4PfAFGc0oFYkcUnLTkP14RIbEWogzOYmPqwpkwlqpxpPrs7qpMJi7ZIP2uVXtT
	 nwVXSV3PH+cZHSPvEu61y0y5Qa5hPoxq82e+sd69AFIcfDzybK43fCw5CqP21yxnII
	 N3EgpSjSr7E8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E76CD5BBF;
	Sat, 23 May 2026 09:45:36 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/2] Introduce OnePlus 6/6T touchscreen compatible
Date: Sat, 23 May 2026 11:45:33 +0200
Message-Id: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD13EWoC/32NQQ6DIBBFr2Jm3WkQjNqueo/GBcJYZ1E0QIjWc
 PdSD9Dle8l//4BAninAvTrAU+LAiysgLxWYWbsXIdvCIIVsRSN6DLvTa2QT0L+5QRux1zROqu5
 uwhoou9XTxNvZfA6FZw5x8ft5keqf/VdLNQqUVslRG0Ntpx68cbyaDww55y9LC2BXsAAAAA==
X-Change-ID: 20260408-synaptics-rmi4-dt-8aebf31790dc
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=0KtWD3IPpWmaEU9h6RkZwg+0yU/vLY50Z8txmH8tMi0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqEXc/xpQXnr5nOblpMjRhgj1pTYITEyEbfR/sr
 iTHshRVgBeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCahF3PwAKCRBgAj/E00kg
 cshrEAChXOxLaXHSe0L0BcsBrcmGr6IueyaxyN9B4gXNJ5nC/Yr+Td+wgqnjF9YNeN7cXVnJDQx
 hMXYy+VVcoqtNNjy1rb3ywS6AczBDAQXembyaOFoHApv907+3NntepIRyuL6sYL41lJHzPmvx0J
 oIEF6omKTE4eqOmcKuMn2WITPrNDwYSS1BY4g4PWz0ldBEc8D8FfhmobVOlWIhnXZs6LzyezimO
 qem4Ue4NDoAAJBtGxWMegRtAQhWVlC88fzHwWNKpQSfnmEwT8qBwZjvTvEVbJqHDcwX/J2QJiYz
 +JBeZKSNCBY7qbt3OpBdeCw+5Ouy1ZZND+TskuXnCxny+EWc5gSwL6lIf3puKW8ARyADm1jpoOc
 IXNdUcyIV1d2Bxx5cNvgkv9wx9VIyIk5VSgI93bYV4ZAE901miY3HBmd0BkzPO1bWXreJw/XiVY
 itT0LbLExJya4iIJiTbf+rOQTYU9ww0YndN7xfXoDBZjcFhod1vzHbt1Rkqy0kFSPCSkFW6q2hX
 Xk6IzFZQaLtkbzFOFM31mFsty77uO5Z8nixrZ/EsVj/LD5e9sdysgxYj20miNzFzvA+pJ6JXaW7
 WYWskth7TjbX10NvN27KNJLItqUWajroB3At7pB7UOtOMO2KhLOtTK5kT7MXTxDmnqUhM9gyy1i
 QkRfKBUs748ZfMQ==
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
	TAGGED_FROM(0.00)[bounces-109479-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,zx2c4.com,ew.tq-group.com,tw.synaptics.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 4D4F85BE6CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mostly related to the
  https://codeberg.org/sdm845/linux/commits/branch/b4/synaptics-rmi4
series, but independent on other changes which I trying to upstream for
more than one year.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Add R-b tag.
- Link to v1: https://lore.kernel.org/r/20260408-synaptics-rmi4-dt-v1-0-2d32bacce673@ixit.cz

---
David Heidelberg (2):
      dt-bindings: input: syna,rmi4: Document syna,rmi4-s3706b
      arm64: dts: qcom: sdm845-oneplus: Update compatible to include model

 Documentation/devicetree/bindings/input/syna,rmi4.yaml | 11 ++++++++---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi    |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)
---
base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
change-id: 20260408-synaptics-rmi4-dt-8aebf31790dc

Best regards,
-- 
David Heidelberg <david@ixit.cz>



