Return-Path: <linux-arm-msm+bounces-103697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOtHNgjl5WlkpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:34:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB1428343
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 816A1302D954
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF4D3890F6;
	Mon, 20 Apr 2026 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3YL9bvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26997388E63;
	Mon, 20 Apr 2026 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674030; cv=none; b=Py8qxgG85cv4i76gg0I6UPMDuGoqduTM7XI/IMOoNpFNyLeUjnZylUF51DlkmDdSFKQ2PHj9Jm1qoGCIbdfbxHzOkSeqnGtol/YtBKMbKNOUMKKj3ANk8zaf4QSim4qc9qey94F+O3xIF03VVy2GmCabmdPLejOWx2KrJ3LlLqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674030; c=relaxed/simple;
	bh=nueqF2yRv0K0lPE6HVMVsDUNfaEHj81Y1pOS61JIfHw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GrdRvqRTvdS/VYDk1GA7q2aL74Jy+wnlkagr31UYcWpY7vynSLtfEZ3e9wY/XVuw30wCJ/D0V6TT6x01K4ETjxbgVUk9C84jibvXJodPSPs0KbURfFnAXCwbVmpwU5TbM4RWeUzV6bpUUr8yT62UY4lPG3+javyKwqBYPdIWOlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3YL9bvJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DBCC19425;
	Mon, 20 Apr 2026 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776674029;
	bh=nueqF2yRv0K0lPE6HVMVsDUNfaEHj81Y1pOS61JIfHw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=s3YL9bvJMrUVXWoyI9hU7j2xeiYlwaPPl3gvDYxKnvpdpplQ2LNmV+9p1F8f9IMo7
	 iqXszF10l0O3jabcEaKZj63o9vKnmshnGkbqoYW4rgj26sJNsVSi7Grvdv63yy99XE
	 zXQO2/dbmTcjW1knRfobRUKID2YwzcC+sYPB0J4GGNm/nj1LAk1EVdMtq7QaxJgylO
	 S6txJv9l0bqB5nmk4eXuy+1pCPU+Z8DV3t2OXqiYldXl9lRiweA1j/Z9/iTaquyKPB
	 xcUeD4kvW3gU/xML9zljWhDjU8KDSzeAZ4NNEb+czi2X+wJkIL3ukxjz2+ZUnzkHqf
	 pA4QlE5ljiuuA==
Date: Mon, 20 Apr 2026 03:33:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
 linux-kernel@vger.kernel.org, Praveen Talari <quic_ptalari@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
In-Reply-To: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com>
References: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com>
Message-Id: <177667402766.1199205.7736172019278854390.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for
 Nord SoC
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103697-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6DFB1428343
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 20 Apr 2026 14:44:01 +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add compatibles for GENI Serial Engine QUP Wrapper Controller on Nord SoC
> with fallback on SA8255P compatibles.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml:77:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml:80:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml:83:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


