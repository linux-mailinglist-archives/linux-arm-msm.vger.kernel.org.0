Return-Path: <linux-arm-msm+bounces-54398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F6FA89AFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D26A53A3C95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC14428E5F4;
	Tue, 15 Apr 2025 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InTuCRu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE7328DF01
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713951; cv=none; b=QspIijXasaSFY/bBZFcmGaiXjzMenQ9LJiGS8SwC2fMPY1F5hHoxuBRmYxnSjwp93LtSL8tGKRJYN1Sz86+i6vrJoK4ARdiXIZbLbHkYl/5zgmc9MDzDVJwkuqK7sT2KwDfY6UPMGDpvw8AMrLACcT91qnAeL9bdjD39Qeq2EKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713951; c=relaxed/simple;
	bh=MkCBu/XB5S4UUYAmw3Gyngrhm/WGqXfyy/Hj2WV/rQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZ0QE+ogYvST2oAZomfOwb2m5Ptrk9LIh+PLznUpeBfcZw6Wdouvu6gq3GPaWTkPN29Q3i4CV8qxlZDa+gYWdIn4EZhrVuFfxNeo6P7P09b/KKT7Xqa7fQ6Bdfm2tvhzq3DxFz97PhGeJFT9L2QcLFqO41zIaFVtupMCZcjzCXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InTuCRu+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3864896f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713948; x=1745318748; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfLErGzwKv4hpi/TJi9E3D/+txmgLZVczCQXE26h5hU=;
        b=InTuCRu+3SX/lQAxKFv0mXZDuqoOH2r1OVTXc7UJn/DTOPEuFlDT28J9+hpgHOhYDv
         qcbI1LW7C6rtPWPqQGtaKMn2vlRSyLlmsIZFjUDI3uw/v6G6J5IQ3fCYyFyUfVAM6wOa
         QPYw4bCyMKkUySYLRISRq/9vPP1mqzYmvTR/k6kS4Uyt7LRuBuh7HxX4LIjbrolcAJCI
         VkHJKoRlxR49QYtNa/c38Zyk8szu7030Q1UgMmv0Mwn2n0axiXoV2DJo1KCN/ytQ/sO9
         KMYChaIObe2IArzW8/Cm2hYlZPqzLMeHYR/2suDXVzPPrq+wy/4EZPH2BFldhkbTJJp6
         vl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713948; x=1745318748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfLErGzwKv4hpi/TJi9E3D/+txmgLZVczCQXE26h5hU=;
        b=gfog/Sy199C4Z+CzN1oMxx0MQd5gb4eEVqYve/CvVYqjruOh568JzVTqfni+IRBP10
         SfPVhYHHiSiKs8Vp6QrHu+F8IAYpue1188I+QWxQ9EALZ9qacRvcf0BibZZkFAJhdIJV
         51M5A8okXNs26UMCCED4lWO4+afP/M8sb0e0JGvFs0KFqDD1w3QsrcEj1AQPB/3AZZ8z
         RjutHPDDtVugsk8f6NRgzcaw4E5rXUSDp9MEp/LaaXKCxCBbMCBcZ+dXORJ4/AQ/r09L
         B0XXnLQupKyCW5TQ4I7+VkRjlEXfEH/hCS6uOKLpLKwaQt0lcan3Dk1rdoG1D4K0f4oX
         j0bw==
X-Forwarded-Encrypted: i=1; AJvYcCV7iRBqlrcQa48aCeoC0oAS8ZGj/tyGF4uij8ohsN9bM+R8cRpXz93Ko6lCmg9Bwl7t9hsM+1PBJLSt45Vo@vger.kernel.org
X-Gm-Message-State: AOJu0YzgxRgI+kwOkgNZnHGTUUiGs8OLTJpouEIf5orDVrMM10Q82HNP
	oLg+zpbl5Qaawb+Cqpyxr59MPNouyoX2PVus1ASdUFMlo+EKEPVA2b6mfwL7kvc=
X-Gm-Gg: ASbGnctv9r4z3Z5oCCQFcS2vD05R7pBJ3nngbH4em0mkT+64A0LrljC+n0VpWgKouHt
	6wDTI/aoGuV37pwHtSnbrXTHxBvzEZ/z1Rfdh72vnuX2CK7hD+c8eU6g5KTRJORYw8ozfNTUs/e
	xS5yVpYD8ZCbMiVMCwcA4l/6uOcIRjZAD7+ElSp6UCPAjE6tHIVIENKizg34onN6dCRLzPw/A9P
	G1Hj3LkU2OGy7czsaHXrszfcL8YUKiYi2ae7Tf04tEY3AK2nqJYJhTa4I/yhrgBdlBNfvqBZPxB
	ukLAQrdyiBX73kxtsbFlLZVH0oqvQzfwtpPsyfbTTA74xw==
X-Google-Smtp-Source: AGHT+IGCbFvyMPpLY+0TGJvec6wuV9t2NMPKNxUjFnVVx7rsRSV6GaToQxyKYgw2SV0wouSpipDAuw==
X-Received: by 2002:a05:6000:210b:b0:39e:cbc7:ad2c with SMTP id ffacd0b85a97d-39ecbc8a256mr7695306f8f.25.1744713948166;
        Tue, 15 Apr 2025 03:45:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eaf447777sm13613520f8f.100.2025.04.15.03.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:45:47 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:45:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: qcom: qdsp6: Set error code in q6usb_hw_params()
Message-ID: <Z_442PWaMVoZcbbU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Propagate the error code if q6afe_port_get_from_id() fails.  Don't
return success.

Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/qcom/qdsp6/q6usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 274c251e84dd..adba0446f301 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -74,8 +74,10 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 		goto out;
 
 	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
-	if (IS_ERR(q6usb_afe))
+	if (IS_ERR(q6usb_afe)) {
+		ret = PTR_ERR(q6usb_afe);
 		goto out;
+	}
 
 	/* Notify audio DSP about the devices being offloaded */
 	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
-- 
2.47.2


