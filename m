Return-Path: <linux-arm-msm+bounces-33053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD7498F8AA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8BD81C20D30
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 21:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB07A1C3318;
	Thu,  3 Oct 2024 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGTZGVyc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2726E1BFE10;
	Thu,  3 Oct 2024 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727989922; cv=none; b=dkvFWlgAZv/d1nB+sFgSkKawuU3aQvrObJcjI7u2UfTDn4IZt2uBX6I6TtYQojsNa4k3vNOsM7T1LDdnMMWzeGlQ5jUuS6V4DLRP8BZelptAiY6yVkt3wmt1EAS/+4cRucWQQFjpMvVzfV+JiK8HSWsaPM8LX1HpL9uZIobQMT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727989922; c=relaxed/simple;
	bh=FKbBfa5nWuwUeKWTGfrIRMDTw6c6Eiy/II3+Pi6LG/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PCG6tUTKitdlrZhyY5jelzZjBL5AM8qYQnlt0jCjruhi4C1ks0Uj92cnYBnMoXhMlH8RnEBMsfVDqy+eg0cd80y4qED/nhN70wErqN/nyijbwoyaBPYP94VMZtdk3gw/nLQFY+0UXjEx0kFi4BUAYzJDNE5XcD1XormmVw/1FD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGTZGVyc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37cca239886so910290f8f.2;
        Thu, 03 Oct 2024 14:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727989919; x=1728594719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kvsl+mJ5AxPK6gNd8JremgJMBsl2w2tbgQhXl9+zV7E=;
        b=CGTZGVycJZa9ncBnujlqrqs4UcYiYag6kjw/JXpUyR/OHwawI17voZpvQW9GXFD0Bw
         KJzXQi2KsNM2vM14L02Aw4IKdFsnE9F8WVCFRjN2KxN2Stn69C7oKRByl0RLdbtFR4H1
         NU16ew/PIlB9CEeAfdVp7aDq9oLlAox+XopNwWlPWa++9BWAyaunsVwWuxgc4TYzi5wJ
         ZcIs8vYW8j45eht1Q0rxf0/Uca5hOEabMKEuaSc8DfarpnVBNp1rEiNWeiR1VEgTkZ3E
         8zwKFwXY7Qfw3ls9nAv+msYFzznY3krx/j95T7o+F6FPVIoUaKVpfOZluRnLMQsiCVo5
         VWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727989919; x=1728594719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kvsl+mJ5AxPK6gNd8JremgJMBsl2w2tbgQhXl9+zV7E=;
        b=FmTCUzQNgnCPxqUNUBUs7vvJ8ys5bo7SbVBkwW74ZbO5t1vVgLJ4i2jkSwi/j49lTZ
         kG3qvado9adRDiOP8B1xUiWewxsqPtXWKkM/IidAIsyQcREUtl6dA/Z75khtacEFXqM/
         tg8TeFvI4awa/xSwxBACGnuj3G9B5vRjj9R/YZKHFccgTi/18tME55woP1u0y+Ozs7c4
         PmCzBZLe8jcbJXpFe8m5pDTDLZ3CkqIJOdNd5BN6E2RHqLxJ2+BuKgvxOcUHQAV5IMSS
         1BZlkC+qVpi/sfhAWnJCYW50ZUOzMkVAUqy1XrOvKEjQGEWsrdHztDJVsPdFO6mQnt4F
         BKVA==
X-Forwarded-Encrypted: i=1; AJvYcCU4fVMKY+uhXSOQWTndDmv76SS3H5J4QSzKwap/YXw89vIuAsh5HsqismKu8DVeAuMvNdjfpiFx2RdtDHj5lA==@vger.kernel.org, AJvYcCULWM+wqUSOYBE21yMIKMdRioQxw8tEf57woHj9fNlHYfsNcITw2KQLHTjICefjf1+5R9NLTaUpvOEA@vger.kernel.org, AJvYcCUhWcDBCIH6x4ay3K5l+RBtUphxtsoYwezNKWmc6DwZ/HOsVPQOavzXzQwcvioCaJAhyOM5YbWtR7lMvkTY@vger.kernel.org
X-Gm-Message-State: AOJu0YwAKppHlSgAMo9xjJmHklZ8YlLIAMs31qBLQYRTUP6hFSV25c54
	Z6d4Mtk4Qvty68zmt568XQyGW0v3MV9PeOFACsPAPab31sE9qYY=
X-Google-Smtp-Source: AGHT+IG6M81T/g6CEr2ummrZyhLccWvBjy85toU7l1irh1AiIwY9aw4gapv4rEaymR4h1x5iGXZNfw==
X-Received: by 2002:a5d:6ac8:0:b0:374:c2cf:c01c with SMTP id ffacd0b85a97d-37d0eb0b8d4mr396400f8f.48.1727989919117;
        Thu, 03 Oct 2024 14:11:59 -0700 (PDT)
Received: from localhost.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082e6dfesm2002073f8f.117.2024.10.03.14.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:11:58 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	robdclark@gmail.com,
	peterdekraker@umito.nl,
	Bryan.Kemp@dell.com,
	tudor.laurentiu.oss@gmail.com,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v4 2/3] firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
Date: Thu,  3 Oct 2024 23:10:08 +0200
Message-ID: <20241003211139.9296-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003211139.9296-1-alex.vinarskis@gmail.com>
References: <20241003211139.9296-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow particular machine accessing eg. efivars.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..2495c08a52f5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1731,6 +1731,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
-- 
2.43.0


