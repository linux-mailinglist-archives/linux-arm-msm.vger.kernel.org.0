Return-Path: <linux-arm-msm+bounces-99629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ow9Nj1ywmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:15:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DCA3071C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0441302DFB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079293E8C57;
	Tue, 24 Mar 2026 11:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dwxT7PkG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF403E557B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350451; cv=none; b=KoQ+MMxa/KHGHz++luCymWvqOqrpI6KhPIbUaVPLxvqb+Q4gbZEJV0zAA7Cp5M+S0WUcOZV3uOHCDOVkqt1++/QyyZ1tz12QL+pftG+HF+J2n3M99cQMWe5pDyZZPW5g0840LqxazsiJfdF8PTdB0ZSLZ+/xtCxae8z/HL3Jx6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350451; c=relaxed/simple;
	bh=At+Iqd/SgYcqAiAgI4rHTyzrH73kXeFcOkiwceJ6J4s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gMFGOh/+yhDsBNnEMv8hVA9bFaPBIFrsJXyOjQtdGURdfIQiIU8wSGlsuS0Ldtl0d6mW5LD4qxgbd58lZhfsYAkK0/gDvyG1SzNojpN24WF/CUogjNY+wIm4/obdBt96fcR4Ur8LqkBhIYfCngyGXCsX4B3KyNhwCZgHT+zJbgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dwxT7PkG; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b982b0889d8so163014666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774350448; x=1774955248; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97SUz9UBU7Ij4r0LCFNkUHZDbixoh2v3NinEmbjVCXw=;
        b=dwxT7PkGiTnRWinpyBDzxZP79BO7CXEyJ0bfzXWXTiYUqKJgl84pWpiK3kvq6fXPwi
         VjxQnaefumRIGfIcelGa0sPljRTJaE0M9O2KkQbR6n9Fscp7/rQLRTfOEdV2Tl8f3BXR
         8OdNC/xodri8XQwPndNhaKoLB9yuwbDjInbnbxwnYbUtAP3f8DXoRXloEaD4j9qSEm5s
         wJTPzkov5ruwkLpu2EMPiCIZ57Up3zXoVQ9yjqdNHsYYsNrOcPYqJgQE6/GewuTumdEA
         bmsYOYCMZsNzS01Qf/I295zZ+sZEUY33sTZqKZKgS02i+R49uoGbRoEWpIGvPk9e4Cob
         20ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774350448; x=1774955248;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97SUz9UBU7Ij4r0LCFNkUHZDbixoh2v3NinEmbjVCXw=;
        b=BUgOAMLNhCOxdtIEfIMPe9qucdqKmxu/lsav3VStA2Fp1aCorrH7vB5VhiHv5sTBjf
         z9v4ghUFIcbi1qT3ILHSvNBvVbWku23R5sq7zN2tUcuo9qkKbMmS45z2xkDYVCWcVBhS
         jRWYnBpvUjZax+sYYNYkVBpgZPF/J5OQKJdBCz0yLXsLNk/4HjiTN+stk2Y4Im8vjabE
         sPnBmQqXWcx9kALhe61VQj6MRmgyytJWNnxql/3MdbMqnK4qxdMrPeYy1wu+p1y02/C8
         B/Ns0LS8DP2SrOCMFxD7Rk305lou1PhPlkBYEvqT41dWGydmZ/hUCbLnCXZYAXFkZL6Q
         NbVw==
X-Gm-Message-State: AOJu0YybrZC6GLBqo8zAh+JMkG763CjSQYn0PGupHIzv0Gg5aTG1oZS3
	pzJKE7G27qdqwYkhi7pjTHHUagQtmR57lybE7KvWfmZ/MjA4hhcWbnVJvksBZc3O36Y=
X-Gm-Gg: ATEYQzwaZjzWQCWUSV0hHwh+F0Od+4cFi1s8PUlDjpzTi+rO1wpffQJe8Il7LvMFziU
	1a1044Rz5Gf5yERVnE6LDQePlwrMos35CKH9AdbemDhqgnHhdUPN92Ca2s0qvsf2uMqmqfaRl4m
	rV5nDMd6tmV0bxoIgYcRW4YanL/HajxlD3qCLsAKPLCwyG8cqccjKQOwHCxm30DeDRFdfmeeHKw
	+Otr+yKK1xKt22hKXWxcZop6pn/F1PkEIV9+O187urAYliFCsYFE7MXIB5tLUgNwjhIhn9ub4ZH
	z7Hh098lNLC3MSUC6kxMgtUdZwYbMGG8BeV6t4PzikYnF0HB/g5bOCE68kUgezr1ohWFcV2qDPW
	KkRxm+F7dvW1kYnDJmvMuqW1CQOCRHUdzyc4lyOPUTnDAY1fvmIrK57y7Azj1/NfQZiM3O9ke+l
	e4vjLAA0z7jo/zLbKme0ApKcvti6qMgxCKbE4rOw1QohcBkkgw5+D+8KwpHpO3UcmBnzzZ
X-Received: by 2002:a17:907:3e8c:b0:b98:33c5:1bb9 with SMTP id a640c23a62f3a-b9833c56776mr1159666366b.35.1774350447853;
        Tue, 24 Mar 2026 04:07:27 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871d8asm625152766b.58.2026.03.24.04.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:07:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 12:07:27 +0100
Message-Id: <DHAYQMHGE9CB.1TTDHVA4CZJFD@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Brian
 Masney" <bmasney@redhat.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] interconnect: qcom: let MSM8974 interconnect
 work again
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Georgi Djakov"
 <djakov@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Brian Masney"
 <masneyb@onstation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99629-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: 55DCA3071C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 24, 2026 at 1:10 AM CET, Dmitry Baryshkov wrote:
> Commit d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus
> clocks") moved control over several RPM resources from the clk-smd-rpm
> driver to the icc-rpm.c interconnect helpers. Most of the platforms were
> fixed before that commit or shortly after. However the MSM8974 was left
> as a foster child in broken state. Fix the loose ends and reenable
> interconnects on that platform.

Thanks for taking the time to fix this, really appreciate it! I've been
carrying a partial revert of Konrad's commit for a while to get things
moving again, without taking the time to properly fix this.

I can confirm that my msm8974 phone boots fine on v7.0-rc5 with this
series and your ocmem series applied. Not much possible to test on
display/GPU since that was broken since a few releases ago. I will
probably be applying this on 6.15/6.16 branch which still had
display+GPU support.

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # fairphone-fp2

Regards
Luca


>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Swapped order of clocks and clock-names properties (Konrad)
> - Corrected the ocmem comment regarding core clock (Konrad)
> - Link to v1: https://lore.kernel.org/r/20260323-msm8974-icc-v1-0-7892b8d=
5f2ea@oss.qualcomm.com
>
> ---
> Dmitry Baryshkov (9):
>       dt-bindings: interconnect: qcom,msm8974: drop bus clocks
>       dt-bindings: interconnect: qcom,msm8974: use qcom,rpm-common
>       interconnect: qcom: drop unused is_on flag
>       interconnect: qcom: icc-rpm: allow overwriting get_bw callback
>       interconnect: qcom: define OCMEM bus resource
>       interconnect: qcom: let platforms declare their bugginess
>       interconnect: qcom: msm8974: switch to the main icc-rpm driver
>       interconnect: qcom: msm8974: expand DEFINE_QNODE macros
>       ARM: dts: qcom: msm8974: Drop RPM bus clocks
>
>  .../bindings/interconnect/qcom,msm8974.yaml        |   28 +-
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   21 +-
>  drivers/interconnect/qcom/icc-rpm-clocks.c         |    6 +
>  drivers/interconnect/qcom/icc-rpm.c                |   18 +-
>  drivers/interconnect/qcom/icc-rpm.h                |    7 +-
>  drivers/interconnect/qcom/msm8974.c                | 1637 ++++++++++++++=
+-----
>  6 files changed, 1274 insertions(+), 443 deletions(-)
> ---
> base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
> change-id: 20260322-msm8974-icc-0ac4c28e139a
>
> Best regards,
> -- =20
> With best wishes
> Dmitry


