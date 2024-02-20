Return-Path: <linux-arm-msm+bounces-11895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCAD85C219
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 18:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE342B209A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 17:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FDD76419;
	Tue, 20 Feb 2024 17:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nJw+logt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F976400
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 17:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708449141; cv=none; b=GQY1qgQiyOfMDKkdvFeliSBDfnGwxqeYXc3CSq7VQMRlYpMOjn8XmERe0LlTfYnc0zoKqFBT69pI3Apcsd6qr5w/i4/I2vPPke8yeEgspeKfyKkaPadTDfI/K/llmgD11Mw7t84Yn6hHerC8poG03dVOOrXMVr8uZ9VB3zF0C54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708449141; c=relaxed/simple;
	bh=BnIHUEr8mYm7RtcY6EIoREgODeHWv+l5ytTt0UKBG8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=isCReClRjwXEcbSAxNi3pM4AGMN+gnOqA3ZpozreKNQ5k3Nx07DB2v5Xvj5c+OeOWvPzl9dxIUUIfe3w8D1iR/ZEgVAuY2ffh3XH9h5cwfl+HAzZ0eBSD2hODDMGdmUHHCvA+IVXYHAMGn+D+cQvY0lLn32t0Tf7AMHxR2AK4UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nJw+logt; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d23a5a7c18so26271221fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 09:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708449137; x=1709053937; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TGyEb9tL97pZ41i0EqJWHQnAWHv94eJvvrEZG1SYwN4=;
        b=nJw+logtAoBHI0wyYAEnNnhYnDWLNV0X/HihsTi2O5fujkBXaQGIfNIXq5Wfq0wfze
         uCbf0fb2UD/v+Jj1E4X0LZUbzQp/cjgHMD6TYooDI0MNLk9lt+jyiNmglOl+VH5d7kk2
         fGiSnbtRroRAbdzXh4lpEXXAutR81GuCGAheb5JleKVXcgmcF+YXbRkpJoSvUv1xj0Rb
         DVXr0ESZt+8NHZzDaM6b7RQMIeFcgI0rWPdANAvKSPBBU3h3RLwoA2JCkq2H2TrV9fw/
         Jheym4YALbYdvocbOmQlANAOKkj8buiFbeuJZYfCubrmqMFqvc8KPpfXMsxH78cNusDk
         Dgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708449137; x=1709053937;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGyEb9tL97pZ41i0EqJWHQnAWHv94eJvvrEZG1SYwN4=;
        b=M2NnzIoZfE2m3Xcx448nLyyEpR0ZxlPreO+2U5U+a/SLTU63SjNQ3txTnFO7QkwuoR
         Q/H1wwDhYmiCVi0QoKBR06ZOFwcM0kHGWlKcqc9LMl707N0nFGec5Ml0wmeIF38hRVFk
         EBrieVreBN3nhnoVby373/okiKnn51kEGlKWybsAwb7KkOhS0a7OqQ6ptWTcMnO34ss+
         dUC+KzQkJYzHua0VdIE/mFrT6JzFAdS7yEodbLWRSTCRhZSgz56olATQ23bCeJja27+H
         g07qnQts6JQ4SeNhN1dPQ0Y3x3lKYkG1dGuqkZqIp7v2wXUeFOP0LEvf04H+VN1vc9PC
         1DEA==
X-Forwarded-Encrypted: i=1; AJvYcCV+KOmcbIu/e6nT2//tbHe3br9vQeEytwrRLVkoCHKcdeNBhSMSWOCsUM4BiD8MMPbya13nCG5pxc66gCK4Qgiv219HogwgQP2FpZgWuA==
X-Gm-Message-State: AOJu0Yz0KeaaUahbz5iIyUBtezCi3T9o1U7Afdbl6CX7byK9C3KFMODo
	/L/3IBtAvszD1dMS8atgVKdK1MygXh/2Z0ft+sOy9UV7rQjMfaI+fmT0KUBPs/U=
X-Google-Smtp-Source: AGHT+IHo+GK9ZXl9LYc2lAxVTvWicxEOUKQReV4nK7xoVkyUuUfNwOLUZWdQgB6teQ4vznlTC4n3Hg==
X-Received: by 2002:a05:6512:e9e:b0:512:bdca:bb5d with SMTP id bi30-20020a0565120e9e00b00512bdcabb5dmr3907542lfb.4.1708449137216;
        Tue, 20 Feb 2024 09:12:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::8a5])
        by smtp.gmail.com with ESMTPSA id b8-20020ac25628000000b00512c8d9c8a0sm240802lff.113.2024.02.20.09.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 09:12:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 19:12:10 +0200
Subject: [PATCH] drm/msm/a6xx: specify UBWC config for sc7180
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-fd-sc7180-explicit-ubwc-v1-1-611a58091724@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGrd1GUC/x3MSQqAMAxA0atI1gZibXG4irjQmmpAVFonEO9uc
 fkW/z8Q2AsHqJMHPJ8SZF0isjQBO3XLyChDNChSmpQidAMGW2QlId/bLFZ2PPrLoqbK5K4zptI
 FxHrz7OT+z037vh92pKZiaQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Leonard Lausen <leonard@lausen.nl>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BnIHUEr8mYm7RtcY6EIoREgODeHWv+l5ytTt0UKBG8g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1N1wx/mMxixCVwdRRTD/ucyIwKcwBbXBvC30g
 rD2Iyw2+UWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdTdcAAKCRCLPIo+Aiko
 1T8iB/4w9oI2xjlbk3C6OJx+Kq76dR5a36rY2818UsGabyH8zrIrLvQ1reO94havjNuL5TOlL9k
 Rh0xKkeO8Vy/cgIVyYC9pKJ6CU0d7SXKzXfPFHsrwbBKyolMMLm99NXX6ex+FtU+ZtFcLArMikx
 XcqrbDFKFhSBGFg1KIQjIq8ydqS6XByYClfWwKkbAPcvxe+kAdjM2eXWj+IF0APg+FQSPMHoZhp
 2luSTFnVRuoOAH94mr9JC8svyYMjlDEGPX2x4kT/jvcZx/b6f2j8f4e9ytgCVVdV9/yM78Ja3Dd
 QZiKQZqgP2vFyRjC9uKtqFF2Cv7oqev6Fbh6jJodA9JRdkhK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Historically the Adreno driver has not been updating memory
configuration registers on a618 (SC7180 platform) implying that the
default configuration is fine. After the rework performed in the commit
8814455a0e54 ("drm/msm: Refactor UBWC config setting") the function
a6xx_calc_ubwc_config() still contained this shortcut and did not
calculate UBWC configuration. However the function which now actually
updates hardware registers, a6xx_set_ubwc_config(), doesn't contain such
check.

Rather than adding the check to a6xx_set_ubwc_config(), fill in the
UBWC config for a618 (based on readings from SC7180).

Reported-by: Leonard Lausen <leonard@lausen.nl>
Link: https://gitlab.freedesktop.org/drm/msm/-/issues/49
Fixes: 8814455a0e54 ("drm/msm: Refactor UBWC config setting")
Cc: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c9c55e2ea584..dc80e5940f51 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1292,9 +1292,8 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.ubwc_mode = 1;
 	}
 
-	/* a618 is using the hw default values */
 	if (adreno_is_a618(gpu))
-		return;
+		gpu->ubwc_config.highest_bank_bit = 14;
 
 	if (adreno_is_a619_holi(gpu))
 		gpu->ubwc_config.highest_bank_bit = 13;

---
base-commit: 41c177cf354126a22443b5c80cec9fdd313e67e1
change-id: 20240220-fd-sc7180-explicit-ubwc-40953fa55947

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


