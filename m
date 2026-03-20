Return-Path: <linux-arm-msm+bounces-98959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Lw9Lkx4vWmt9wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 17:39:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED42DD947
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 17:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9A1931470B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49CE3D47D1;
	Fri, 20 Mar 2026 16:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otAfZQ4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F349C3CA49D;
	Fri, 20 Mar 2026 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024148; cv=none; b=j09POWrflLBpchxT+uT47Riv7kSWywjJUf2uY1YBvokcj18iXgq6p8/2jYQHvKvj0Xj7phQzrnaPMiIw5KOFQosIteRrSrtPwE32TTl7tlWtvR0S6Dz6XsmNH5mwSjI2ncZhfg9eHp8u+X0Dpdg+fzVObfGgpjMlHdGpEJvwc6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024148; c=relaxed/simple;
	bh=doCFxmNpKvuUGePPN9SMPEgw8akhQ9Xe3OPFaRcrB6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQzGh9tgOq1+BhUxR5CYBTfNmQkN2DczkyE+bIhzmRY4RvVqhDOsJcOwnAUup/RwzxVQt5+lYd593Pg0uJI0lBKTiQ9e5IEpqKjvVmslSD/xsOv0Eet+DspQ6zeg1sRoHTno+04rAIfJejAIOMQaIFd2QQcGP63HG6V3CuK7+AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otAfZQ4R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9499AC2BCB0;
	Fri, 20 Mar 2026 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024147;
	bh=doCFxmNpKvuUGePPN9SMPEgw8akhQ9Xe3OPFaRcrB6U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=otAfZQ4RBvOsn5SLwPelWwPydQH/XvUQa3TBfzFvF6MNV2eRdovCFl4w0b+ci6ZI3
	 EvPGRipjs2T3TSUh4MEBlaXdqakqI+eCqhpABASxC9eN1JAhs+dR0xCdoWd1IVDI0Y
	 9a7PYQRJD8/DvNlnAgq8wlvkg8Cb0pQRlgT1PUZvv2lBr3MaNWbWok/0Wl8g6ruPEX
	 itJHIyLbaO65V5e4dvN9RmwlM6u/GtDfn7tYx60FPhgkBrLp0HiGcvgpVUte69hV0r
	 8yi6mjgGQOn5iuWDJ+kgdMPHVsAgDKtoMXwZltUFeiKVp7l3le/j8Bv8w1djHWEt4p
	 DN3vhJpCQ8qwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4FC10987A5;
	Fri, 20 Mar 2026 16:29:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 20 Mar 2026 17:29:07 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable TFA9890
 codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
In-Reply-To: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Alexander Martinz <amartinz@shiftphones.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Ov8oJIG4M8hmwoQmv1DzA7EPUBix4liphXxxKjQuoNU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpvXXSAMpVqP+hZkPnDy0Q5QUS9B9CUdop9254Q
 y1WAMFu00WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCab110gAKCRBgAj/E00kg
 cpiYD/0UGwtF9lcrdulCQ5uWch/L17jw1zYjmBUP6VCrwbb7elp6o5RhCPwVh7oZVMD90ivShkt
 7jyGd8iR/DCwsGUgXVRRWUrJlXypfsyVVvSYmJph033ldNwR5bexhXNcEe7Sn/ibLWkqJ3v4HEF
 An7oyoPI73pPacOlfdixDe15B8goJAc2wpKnY9JcKJDcz0PT4ZqB4Po3CwldAGK6aR+Os3THy1j
 Esgy+COP2bAMiLXkY/X7fhjmGfd39wYvow4SxeYTBS5DP1ttpFqyK0dCY1ZxsfaHH/ztfGfQiup
 VIEeSBWbxaHLnufWN6sxcHuUVLqhFEszxVt4bR0cNFuRDW+L+jNY7oOW9sJ8tq2ke7DpPcfeKy+
 yREvtOAwBgUCa1+4qMxrhoXFTlW5KK+nd9j1LU/z0rzoWeuJMxxSOP5gQrfIDfD+STpL1CsjSKS
 pmlZ8oKiJu3I7MQ5Jn4DIxHNGJCgzIuNMkpVLEoMgO/+oTRdiVyBBgQp1tGbJY2RSv8jJgJ8K33
 DLMEchJey5IkgbrdtAQN5iOVihLOSkgNVOZnYiG6k++nx4D5Ea4yOBb3Jo2wJFRGyfYJDDc7bSn
 Ir/XqX+KlXL1U3ENtDfjdimJvK7P/bgCNLGZ4pXxa2tD7IiW520BGq44j7ET8YaEdwS8V16qqXs
 mRxG8tE0ckikqow==
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98959-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,ixit.cz,shiftphones.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,shiftphones.com:email,0.0.0.12:email,0.0.0.34:email]
X-Rspamd-Queue-Id: 36ED42DD947
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexander Martinz <amartinz@shiftphones.com>

Audio amplifier TFA9890 is present on the board.

Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 8d4bf858b238b..80148ff9c3788 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -459,6 +459,19 @@ &i2c10 {
 	/* SMB1355@0x0C */
 };
 
+&i2c11 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	audio-codec@34 {
+		compatible = "nxp,tfa9890";
+		reg = <0x34>;
+		vddd-supply = <&vreg_s4a_1p8>;
+		#sound-dai-cells = <0>;
+	};
+};
+
 &ipa {
 	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;

-- 
2.53.0



