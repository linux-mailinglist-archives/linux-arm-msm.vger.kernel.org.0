Return-Path: <linux-arm-msm+bounces-94763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBb9I7iUpGmxkwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 20:34:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E81D15A6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 20:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D23C13013737
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 19:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECA12DF13A;
	Sun,  1 Mar 2026 19:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVPauTa9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF7019CCF7;
	Sun,  1 Mar 2026 19:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772393651; cv=none; b=fzbIKvOa0MBHiX7gtDznUMSSJ+M4ibD0awgawwPGKTeaNzrJ9c6HMdWnnUEeshPufF2CHhkretUQkkR+/xueJZrcq+Z2NSa2O2/MDZR9DmJPw9HHJgKjbXs8py570d4+I57K5fB06cgE5JfYEsnREkyu8R8FR/1PJQ4GXwQlVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772393651; c=relaxed/simple;
	bh=7rbVOD75vPzOlqdIY0xNu9uaaRvyRGffFSeHa031auU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Cpl2VsFLfGkAs3l2B8cwb1UjpOHe+1s/Tie2n9x0rpl2gq9MABRq3n44h1vHgCp+TnnjMAiR7HdZtokboVtXZvASo4McReT6E/yHuztBhRc3dVuTzdXtpzyKSNGbePbMG3W+sSoUwDPlzcb3a1MbFSSEzWxEBCiKg45nZjwfETc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVPauTa9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D72C2BC86;
	Sun,  1 Mar 2026 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772393650;
	bh=7rbVOD75vPzOlqdIY0xNu9uaaRvyRGffFSeHa031auU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qVPauTa9GxT9y6KpV/kICjl+slqdqbPZ8z6sTszN2ExQwwLOSMFkdXAEkRrcMk5v+
	 qlBiyS7UUMcdBCqjM0hdH1czuXF+PC2BkXKMrXoGcfTgeTppbgdT2qNWKn+hThkZLI
	 0aU0xSo5SL3TxiyiuO2aUJXC0dMkhQA2nHUpxULIXqvRdQJW8GoJHklahpKIxElcXs
	 mg5QoJeyGrq237T9nfFEaGg+/rjNKy4ePKPIacVuU7L9PB9i7OGHL6Xov5W4FnAwvD
	 iupM/vdrhb16pAF+U5s6lmoOZCUyz8V/A1Z+mz9SsYHTZSC9aMfk2NokYN1c3GPz8e
	 kgfpfmXa8QeVw==
Date: Sun, 01 Mar 2026 13:34:09 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: David Heidelberg <david@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
Message-Id: <177239364971.730877.1130326937114423321.robh@kernel.org>
Subject: Re: [PATCH 08/10] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,kernel.org,bitmath.org,gmail.com,st-md-mailman.stormreply.com,foss.st.com,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94763-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 122E81D15A6
X-Rspamd-Action: no action


On Sun, 01 Mar 2026 18:51:22 +0100, David Heidelberg wrote:
> Introduce more recent STM FTS5 touchscreen support.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/input/touchscreen/st,stmfts.yaml           | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml:58:1: [error] duplication of key "allOf" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml:58:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/input/touchscreen/st,stmfts.example.dts'
Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml:58:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/input/touchscreen/st,stmfts.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


