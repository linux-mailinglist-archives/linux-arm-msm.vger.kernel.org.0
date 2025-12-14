Return-Path: <linux-arm-msm+bounces-85165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A49CCBB7B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 08:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 842C53008FB2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 07:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BE9271A7B;
	Sun, 14 Dec 2025 07:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ZpeQbYZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DBC21D3CD;
	Sun, 14 Dec 2025 07:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765698480; cv=none; b=mBvz7pNNZdamuntrNJxqIo87409+xtwsOESeP9fAJBqurJ1TTVCGLxCVUeHGgiKiB3DTi0VNK8+eMg3P86hbMErPqTaKCFFdy+mWq+W3orYBo3KY7GisyFg7h3yyUTH6T/gYBbq0WuNxcbtctMXu1fXxz5pwbwPsN+qTIThe7Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765698480; c=relaxed/simple;
	bh=ROTGzyfuiMBGAMSYOlNep8OvVSvit2dYTA4kwQD4KUA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MXWDbBvd3itdOlzKHm60PpTe3VbsQdLLpeTJ4Iu9p4W3IQhy6aPMN2LZAnpXTu3sCD6ip3LvG0Mgsp2Pi933GHjlqDGFPl3HYxj1pfKC9srTuAFuV7dpgJkI0yEGR9L8QXZrjEVlnh5NVeXo6xyuLBlxAlUl3UKSak02F3r1kac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ZpeQbYZv; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1765698470; x=1765957670;
	bh=ROTGzyfuiMBGAMSYOlNep8OvVSvit2dYTA4kwQD4KUA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ZpeQbYZvbxX199bGqyFndU3wirv4cUXn07YkZ2E1RVIZkBpGghGktonY7oU4aMgSE
	 czO/ok8TfEpKMTThJSFzMhLRY1L5HtJHlGhAY4tMCx8cQdJqkaMhuUF/5vzaVyW40y
	 6NjaKfIu2MOy3L26O65azetqDDcdyFZk1x4g/97jqeo1WLxcl9thhhS8/uuGhkRm+Q
	 LGFx5tQLohIccVbDPPtML2MdFO+cJ6xQV0Vfwtew+5w7Qniwka6a61rI4mgsrz7Y40
	 U7FkEv3FzZ/3yLr13J4c+SVl6e5as7mOefc62iSQooxl066uHExWRvMg/ks2ba0Mqp
	 gqBKgawWT9NOA==
Date: Sun, 14 Dec 2025 07:47:45 +0000
To: Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH] soc: qcom: pd-mapper: Add support for SM7635
Message-ID: <20251214074736.2147462-1-akoskovich@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: a14da6da8ddae64cbb40d7f5e28000ac6eb55c27
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add support for the Qualcomm SM7635 SoC to the protection domain
mapper. SM7635 shares the same protection domain configuration as
SM8550, so reuse the existing SM8550 domain data.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_m=
apper.c
index 6384f271953d..7cc7f261f6ba 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -552,6 +552,7 @@ static const struct of_device_id qcom_pdm_domains[] __m=
aybe_unused =3D {
 =09{ .compatible =3D "qcom,apq8074", .data =3D NULL, },
 =09{ .compatible =3D "qcom,apq8084", .data =3D NULL, },
 =09{ .compatible =3D "qcom,apq8096", .data =3D msm8996_domains, },
+=09{ .compatible =3D "qcom,milos", .data =3D sm8550_domains, },
 =09{ .compatible =3D "qcom,msm8226", .data =3D NULL, },
 =09{ .compatible =3D "qcom,msm8909", .data =3D NULL, },
 =09{ .compatible =3D "qcom,msm8916", .data =3D NULL, },
--=20
2.47.3



