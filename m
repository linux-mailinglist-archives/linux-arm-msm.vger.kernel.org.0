Return-Path: <linux-arm-msm+bounces-49931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6655A4AEAB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 02:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C50A416EC95
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 01:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA84E6136;
	Sun,  2 Mar 2025 01:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=joelselvaraj.com header.i=@joelselvaraj.com header.b="QQ30Wmtd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA8610E0;
	Sun,  2 Mar 2025 01:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740879986; cv=none; b=CtB+m19xnJEcjSMTBqO+639Jkp8a3EZ+lorIUAhfvMGdJQ33vd3y4lpcc+lvaZFpgOEPlrbGzYM8H7JdAJv71KMYhVIbgUfZK23vj5j8ifj2CBl6HSBNkRdFYIPzEm6cYJR//uTd6ryiTnkImpIJNQ575+oNQoEyFFUSCA/x+8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740879986; c=relaxed/simple;
	bh=3GqPO31FGZWylXIBWZlFqiXJn64tDQp/uxLxEV/sSZw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hb1l2cWD+Ltx9dTQ3gyE33MUgAeUs25C6ijmKFVw4hQWwqEWq0B1JXCHah0lDUZkgekkWZQvWzacr7jX7BQ8oCpu1eFoiWfrEoPgxe8fq1GGYOxPgumsT2kTkvyygwZdggzFWX30AsI31Il6vImqNpmoDC8xNti2NW1ewI2Qs9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joelselvaraj.com; spf=pass smtp.mailfrom=joelselvaraj.com; dkim=pass (2048-bit key) header.d=joelselvaraj.com header.i=@joelselvaraj.com header.b=QQ30Wmtd; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joelselvaraj.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelselvaraj.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=joelselvaraj.com;
	s=protonmail2; t=1740879976; x=1741139176;
	bh=3GqPO31FGZWylXIBWZlFqiXJn64tDQp/uxLxEV/sSZw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QQ30WmtdBd6PGvPPx75aBwQscCiYlcCiUqkziqxVWBLmjSisKPk0yyLhX1YZ31Kk0
	 031fwvlLYUwLFlrNK6iviaWrdvhLVbf51gVC/4kLm6ahEJM/Nj8NmNz4S4kVDlmWBi
	 CDb6g+sArBGpgMfLr4/ronvpHF9p3hzS/3B0X0baOLqAi/DuOYavTyrR7i1V18m6y5
	 +kLUOECi9xwZRciq3cvqI4OkSNFeUEsGlQIHyZDB5fO38efGevctMazNcfvjI7i87A
	 UrREbXntI3kHXm2yV5Oy9lL9HSUGOonux7U1t4EuWs4B86c8o7q+oGN85J/kK/aCr7
	 IavIrxdbSaIJQ==
Date: Sun, 02 Mar 2025 01:46:11 +0000
To: foss@joelselvaraj.com
From: Joel Selvaraj <foss@joelselvaraj.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: input: touchscreen: edt-ft5x06: use unevaluatedProperties
Message-ID: <SKrYrlFtmyV2rIOqOxQhPVbJu00CkMwKn-mKlu029SA5yLk82dMfAcpzgzsYRS7mL4AS-Dp-acyx5ECPUPri_T7kIt0hgxsuGU3nLAlTLfg=@joelselvaraj.com>
In-Reply-To: <20250301-pocof1-touchscreen-support-v3-1-af01c3b30b55@joelselvaraj.com>
References: <20250301-pocof1-touchscreen-support-v3-0-af01c3b30b55@joelselvaraj.com> <20250301-pocof1-touchscreen-support-v3-1-af01c3b30b55@joelselvaraj.com>
Feedback-ID: 113812696:user:proton
X-Pm-Message-ID: 8d4e6b79038e1123b273a6307568856477e399c8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, March 1st, 2025 at 5:43 PM, Joel Selvaraj via B4 Relay <devnul=
l+foss.joelselvaraj.com@kernel.org> wrote:
> ...clipped...
> Since the touchscreen controller uses almost all the properties present i=
n touchscreen.yaml...

Sorry, should have been "Since the edt-ft5x06 touchscreen binding document =
uses almost all the properties...".
I will wait for further review by others and will fix it v4. Or if it is ac=
ceptable with current commit message,
let me know.

Thanks,
Joel Selvaraj

