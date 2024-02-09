Return-Path: <linux-arm-msm+bounces-10410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B82D84FF2B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29D8F28D024
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF39336AF6;
	Fri,  9 Feb 2024 21:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QVGy0zik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72341A71B
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707515439; cv=none; b=LxvqjCUlDYYnSLfylZICFiqgSw7Gk8h94HTT/jpqRff+3hfHDaUJ0TAhhFWyhqiEATk8jGdQ9y7zMLhvpG7m7n2tFTJD26wsf7+pa0BK8eLvISCbz0hxhxKISkRlq7ZH82Q39/uZhVQxHIZLHp6d0qX91Ozd4fgUySDASDjzzeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707515439; c=relaxed/simple;
	bh=sny/m9wJ9i9gQI3uK7sG9rC2WxbHvJ9BZkJpg0lVtPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjTrhLXgaj8bILvl+QzhWobf/jeLrUQqKSJRJxKZm+9PH5Z7ft4PJsH3p3n488BtZIOJfsm0cvL8gIQZuWHDliBUxfSzf+i5csHESqSx0L7ZbBV9nzxs/IaxecQRDwWUS/XxTNXE/0TvmEqigORQ7NQvU2+OHI8Lbs92fyYH2Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QVGy0zik; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d0b750518bso19925281fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707515436; x=1708120236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T82RS47xunOM7WFJBNZcxWFRq9fwUSzgHkN5K81v/tc=;
        b=QVGy0zikpqjNYUwhgdWj+BRC04thfw0cxh5hlEQ9lYz69/2L4Bq4B/W1bF+gNHavxj
         WEWynKifG+VwZrI/KZCypXZnV1DdvXHpISNAIg58UBrqru2/6LelSgA7k3csbSqnGnfT
         cmTGLy2D2i2e97PCLo1XNEmBbfdLamZ+Rtx+iylVpP+XgII1gUsn2adUzc26c4yFJuZN
         hwXipoQY0loIvn065yHoXfs2Go4mhVRxWr1k53e9GV8ssaz53Ktv2WwzYV8OiHnLofOY
         FpivIJfkGjmqOO46jfgETHjKqxiqR1zBoxBzENw1FHc19OU2n+gVkp0DpQ27BwroBFh5
         nNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707515436; x=1708120236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T82RS47xunOM7WFJBNZcxWFRq9fwUSzgHkN5K81v/tc=;
        b=FfKX5ATLggckYtmlAJ++pIJGbF8lXSPT5nqO2H720J5vecYEXnJotMb4mJxDR4+5/X
         5ed1PFGoJl9jnAeHqBcnWvv/CdRJdT/u5Dc+8jG6kWou6naBQqbTDMuZtil1IO3mT0F1
         6NSG3YZz6XAi6UwtHY8ccHzu1dQo2ZAj4Mu0vrB93z7+sWtEoXjP35JCD275kqR+V/kj
         pRe8QkaBSqbtSlSDgWboHMrEmni4gCkHlAhTLB+pvdVDt8+0+FBPwgLSguI8F3i8yZax
         0JxNEM7oMD0iblX8v3TL+sXV/7XJO5w2/Jzg5p8jbs/iLbPbQHNKAYw9bhYPNm2SfoMo
         onGg==
X-Gm-Message-State: AOJu0YzH0/dImewkoKD6G+bY+vNvG+MEdZIaV+KqC605spl0yKjO90tk
	xqXIYBt7GdCesOlY4Zbpo98ZYIKAjEdbSLmbxyn/66D8NgsHKh4wUQpffZdEmRE=
X-Google-Smtp-Source: AGHT+IFRFvaEb4IuOfosae049gbrIkO6hFiXlA1DBHk2mi4U8sRAN37hA7fmSEKOtksS77IlR72vgQ==
X-Received: by 2002:a2e:8904:0:b0:2d0:b6c4:2180 with SMTP id d4-20020a2e8904000000b002d0b6c42180mr130316lji.53.1707515435881;
        Fri, 09 Feb 2024 13:50:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTCIcmQq3wSjinxParpmNgW4o5UnfKgcj762fmorevMXyj9QRWvYHT6yst9ZE0jKGotmfBbOkz1zKpnMS+Muz3g3RlOZHiuZR+O1inFKCZllpxtQKT/Owxdz2146cfBEXu8aCbG/N4gvG6fX8FlBk0vajA1swMaGuAyPKeXhaxh3ciGnf3O07YGz0+Jykv07Z/aB24k4Yj5XM7QPjdOKLcwOiqFpstKglQKyrU4l1fSQVtmCrdQcLJEjJuUoUsV9t4epT8Ru1iAEfmrZD8oRct/oGEd2APSrdfs8ZTatmjAm3esuvo9k4e5mCjSso3ozO5OWR2oJWHOKKb17COoWNs/BDbG00EzSA8aT9v/CA4Wi7YgqnMy21pL4yT6+zsWXHQXjtNgE6sK5MiuUwHLwXvFiMiEaP55xCSZxO/lbxSZXHDjrh95HDuuatdQo9WKvUf5SSjWz4pB+I2l9K3DwekBlc4oGRS4xEuDVfKCttj/HfY0IZrD0Pe4ZhAoNO+6wyk8PJJs3Ra+UwQ3FLreQL9NeTy6GXlBxuHk7eVbUHmNFtpkM8Jtl15jio/aLMBqd2JDaWWcwFefRDZjegJ4yLURLiEAH/Cxi0=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t1-20020a2e2d01000000b002d0ac71862csm391162ljt.9.2024.02.09.13.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:50:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 09 Feb 2024 23:50:32 +0200
Subject: [PATCH 2/8] scsi: ufs: qcom: provide default cycles_in_1us value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240209-msm8996-fix-ufs-v1-2-107b52e57420@linaro.org>
References: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
In-Reply-To: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sny/m9wJ9i9gQI3uK7sG9rC2WxbHvJ9BZkJpg0lVtPU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxp4oF/udIPmh25v9YaVBGF8zomk/oAgu82oWc
 4qjt3F9Vo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcaeKAAKCRCLPIo+Aiko
 1fqJB/9MX9MZSLldZwM1esOwZZgWaY816oeEp0Kz6LtZi4kAPH483880Np+n7VHQz00nlQTGwMa
 IGHIxyL0OV132G+to0mZ68vDXrPlIiecUxo5fUADw5Dl6QIyp0cLW8ewj91Rzp3b4fI3TM8HOBC
 Y87B+sdiwznm3ZENyUcd89xkUaILfIO5xpMsd0aweNTjiwTbpNgG0AufCvU8WldZgMF+rwwd5A0
 VlzGssDcpOiEWB4+4Jg6GfS95/0XgKn5tmhDyX+LFrPOKR17CTJ7f6r1DQOFQgmuO0BaP3e9uqE
 mCjM+v3umfKHqUMCWfOFKaVLnzbDXn00pzmPmeXTh823Fean
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM8996 DT doesn't provide frequency limits for the core_clk_unipro
clock, which results in miscalculation of the cycles_in_1us value.
Provide the backwards-compatible default to support existing MSM8996
DT files.

Fixes: b4e13e1ae95e ("scsi: ufs: qcom: Add multiple frequency support for MAX_CORE_CLK_1US_CYCLES")
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 0aeaee1c564c..79f8cb377710 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1210,8 +1210,10 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
 
 	list_for_each_entry(clki, head, list) {
 		if (!IS_ERR_OR_NULL(clki->clk) &&
-			!strcmp(clki->name, "core_clk_unipro")) {
-			if (is_scale_up)
+		    !strcmp(clki->name, "core_clk_unipro")) {
+			if (!clki->max_freq)
+				cycles_in_1us = 150; /* default for backwards compatibility */
+			else if (is_scale_up)
 				cycles_in_1us = ceil(clki->max_freq, (1000 * 1000));
 			else
 				cycles_in_1us = ceil(clk_get_rate(clki->clk), (1000 * 1000));

-- 
2.39.2


