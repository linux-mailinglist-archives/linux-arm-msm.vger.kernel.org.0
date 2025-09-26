Return-Path: <linux-arm-msm+bounces-75327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1500BA43DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 16:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47F527421A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 14:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622B813B5A9;
	Fri, 26 Sep 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MD9CK0xc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A08472605;
	Fri, 26 Sep 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897342; cv=none; b=otAKeDIOwVdEQf9GmBM2u2vSQ7jN7mvrgAqpUVBjHKlHggnpB6cPJw8J519S4DZx782MlSCt+kE492FEU4qewb0bnOtvtcdzc9zr7KJT82jcsGCsOxoySUSwsUsyMP1uUb1vB9u2juyS2jUEPMNOLDT0qQ9Fa14pYHh/UyCLrfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897342; c=relaxed/simple;
	bh=oiEOV4lRyZ1voqJs3v0XhnlkLvdUTrwnzDJnp+ImVZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9VtJUXjD7SBULLY5/4CNbfmubITCgl97buXJUZl6h/bybbSDeVQYF2XI0fvKE6MupB692rI4Gj7CXCn6AdicJglRzyq6wVgZp3lzpSWbQb4T0qcJe6b+yyPdYTv93ukaq4YJki6zYt5LUlcubvazEi7leoB9IjCus1PWd+7CTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MD9CK0xc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8572C16AAE;
	Fri, 26 Sep 2025 14:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758897341;
	bh=oiEOV4lRyZ1voqJs3v0XhnlkLvdUTrwnzDJnp+ImVZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MD9CK0xcxJajlpiNl14IWE/90rnALOcYhExoNMzA4D19rn2lF6HA5rUrjaUhEEiU/
	 chjymJjw4uKSyrp0ZdVgoqf8YDa2RleEshsCZAU32nGcAd6hPcs6ErVGgTy9iB1lo6
	 2I+N9+iolhr1SY0BP2IND/QNoUAhfz9qlkxizidODHJokxg9rj1l8EZJBuDU7N/7Ma
	 p/zQlkpjKEFl6Ogxpy7dS18ErneLrtLOm2ry0TKZrGE4BtXLCCWGYMt+ObRfI6TziW
	 exTAS8fov8l3L8g31A4pD1dADwOciNChul+pF5DSPBRIz7mLl+pkpVIfY4O6wICNDm
	 UD8S5rL+TvbrA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v29Xr-000000001kv-2JZP;
	Fri, 26 Sep 2025 16:35:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>,
	Miaoqian Lin <linmq006@gmail.com>
Subject: [PATCH 1/2] soc: qcom: ocmem: fix device leak on lookup
Date: Fri, 26 Sep 2025 16:35:10 +0200
Message-ID: <20250926143511.6715-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250926143511.6715-1-johan@kernel.org>
References: <20250926143511.6715-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to drop the reference taken to the ocmem platform device when
looking up its driver data.

Note that holding a reference to a device does not prevent its driver
data from going away so there is no point in keeping the reference.

Also note that commit 0ff027027e05 ("soc: qcom: ocmem: Fix missing
put_device() call in of_get_ocmem") fixed the leak in a lookup error
path, but the reference is still leaking on success.

Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
Cc: stable@vger.kernel.org	# 5.5: 0ff027027e05
Cc: Brian Masney <bmasney@redhat.com>
Cc: Miaoqian Lin <linmq006@gmail.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/soc/qcom/ocmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index 9c3bd37b6579..71130a2f62e9 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -202,9 +202,9 @@ struct ocmem *of_get_ocmem(struct device *dev)
 	}
 
 	ocmem = platform_get_drvdata(pdev);
+	put_device(&pdev->dev);
 	if (!ocmem) {
 		dev_err(dev, "Cannot get ocmem\n");
-		put_device(&pdev->dev);
 		return ERR_PTR(-ENODEV);
 	}
 	return ocmem;
-- 
2.49.1


