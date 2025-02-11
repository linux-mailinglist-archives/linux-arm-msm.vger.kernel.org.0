Return-Path: <linux-arm-msm+bounces-47570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F2A30C16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27B1B3A521D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 12:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92662144AE;
	Tue, 11 Feb 2025 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SJq348vP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21AF20C47F;
	Tue, 11 Feb 2025 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278508; cv=none; b=edMvi6iqpS8bdZUlD9VOJnjo4u1l0e1c4cR8silAYY/2ITc2pDh6yuONv/69rU8UOdiOHvkhdCBMZY4FWzcrJiLXZL3g5PAxx/xYAwTp8eEHkJquw9JL7uzC5Elgzkym5Mmn+u8SLB05O2W1OVSl2gUJQ9LbBlWXIJM/+RHaQ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278508; c=relaxed/simple;
	bh=E/D4r8Njpis3Lv6czODLlg8GcE73pPznWAgOjZkvmMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nTQN0NUgGy6qYjTYrik/Utl7jMrgNVtyxIVi1uuXAg2IbnFkaj2SDiJDgy19FHJMeygb+A1wzfFIJIWEnZtNcEm1t7ilGtIYiWxJ4hTDZZ9SWmlPqtLIcIi1W/iS6z44czSnVbBeTjaVNO0sW3yBdSiKLcjttJbA9LFML+M+Vuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SJq348vP; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A4EE4318D;
	Tue, 11 Feb 2025 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739278498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LCp+sFwjp6X53Xy6vUp3gJOZ41+nmTUyiZmaz+Sg4LQ=;
	b=SJq348vPQLBZmcy3A5kV8BgiAobDhxS8qQOy+ZMAe2bNi74xWjryciNfDqrAHEXGjTS9dZ
	p8H9vVx/ArmWe5WiyNrqXQAwPR37GY2iYjXKxQApVBG/B5rc6GTHJSyOiFl830kk6U8Wr7
	AmnqKnpoyJ/7hOj3r/vpbfNP0DO4DCCAKEWQrIn8ZcJS3B38HkAHnZV3u3PZzQAUFzlpde
	4yIK1B836k+RUeK7+BUXkYKhtdxDy88GBylg82VbCksyyo39L0N5RPtKenw4GgLr2qT8HV
	INeFOoRYZ+C5B84vCQ13mdKFOkQNSFHaebILSCWQkiHWg1BQ2PmkvMrxh/VPag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>
Cc: stable@vger.kernel.org, Robert Marko <robimarko@gmail.com>
In-Reply-To: <20250209140941.16627-1-ansuelsmth@gmail.com>
References: <20250209140941.16627-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: qcom: fix broken config in
 qcom_param_page_type_exec
Message-Id: <173927849590.126930.12542924757341380520.b4-ty@bootlin.com>
Date: Tue, 11 Feb 2025 13:54:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhou
 gdrrghtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehkohhnrhgrugdrugihsggtihhosehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegrnhhsuhgvlhhsmhhthhesghhmrghilhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

On Sun, 09 Feb 2025 15:09:38 +0100, Christian Marangi wrote:
> Fix broken config in qcom_param_page_type_exec caused by copy-paste error
> from commit 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")
> 
> In qcom_param_page_type_exec the value needs to be set to
> nandc->regs->cfg0 instead of host->cfg0. This wrong configuration caused
> the Qcom NANDC driver to malfunction on any device that makes use of it
> (IPQ806x, IPQ40xx, IPQ807x, IPQ60xx) with the following error:
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: rawnand: qcom: fix broken config in qcom_param_page_type_exec
      commit: 86ede0a61f8576a84bb0a93c5d9861d2ec1cdf9a

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


