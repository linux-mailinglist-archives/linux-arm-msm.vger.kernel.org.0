Return-Path: <linux-arm-msm+bounces-74062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA16B83EA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 11:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14EEB527BD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 09:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDA72BEFFE;
	Thu, 18 Sep 2025 09:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m2jk1CNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6721E27A927
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189048; cv=none; b=uVwZmo0otjpCkl51SpLhse0KKckOvZoH6xMtnwDnPFRy6YJwuZYEzWMhIch00rGWdUFtsCSVWJMki4Buw+xpqqZY3vaWiYWcuACIWqIORC/53FQd23bqwBbfaOTaGoHQvWXJ7UhjKDK4H9LRBdMxuSOBSGu38EC44qaVke/tRlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189048; c=relaxed/simple;
	bh=E11JmRyH7JUTZes1+yw1WAAGyPZ3TxFZUkiSIuE1MFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVxQ78hU3AHcWf6488CO7XXhGV/MFR+BeUXpSCX9ZxhjrDzwnMlMoRH2KByXsxwsxkQ+95e2Ko3lPdFUwIhfnl4QqTK2Sj2Ou3+zUGn6NtdDr1N+Sto5JU3D/NGOWY2HArTL7Nqh09sPI1YcUsFwfTfg496UUDeaHoTkkVfk3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m2jk1CNL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3eb0a50a60aso467964f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758189045; x=1758793845; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/T2Fr2QIkCHSSj1+Ut/Hdbp7X7o/yIWkxiXRdzpcpk=;
        b=m2jk1CNL7QnqDVcFP0J3CkbRBO0VtJeqhAwO4JAfVIt4iWrNh6RdWqPVaIVCc9Uoec
         gXofYCONp2hyw4qbguwkELRdpTWR4sHKo9A2qRWL8cfPwqh3u7/yN+c0OQDabbePITqo
         iY7yR9ab7vk2K6ohOdtaafOpsdlbll7CX2jgELowQrYyojISRFG9Gzsw1wpydCJKyoah
         bs98BYTjb2RGB3kC7hZI2Q5wgvUxcMkXuDeqNsFYX5mkUWT2Xh19V+zsC4rqk8RaGRux
         f4McG3R/QIgR/R3snkGkJAPjHsF/ZQ8LWbregbZ+rJP1Tbuk01dWcLh0GZi9W/rd7EUt
         A1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189045; x=1758793845;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/T2Fr2QIkCHSSj1+Ut/Hdbp7X7o/yIWkxiXRdzpcpk=;
        b=lTqhhj67IWc6e8WVo4PQRtc3MRgmjtAzLILBtvAMfuXuJjGU/lIe2B3eY42YDLoXCk
         DtvkzmIzq3z6isDsXBsIVu9aN/HJMAdDOEwuZQO734KHummihGeT/h0ob/NRjZfnt8EH
         K9yrrcdAgIbJ9JrE+tSKgng8E0B/O1acqSf0du0ReQ6237odOtg2yzWw2NaiMT7teZ1I
         100ft+ef40xfVOsa0qrI1X5zBJQNVW9+/2DhYBE7qOYd5VjOAJ4CBbi6SoH/4uTyjpKu
         49WHM0Os0b/8LamDZZMzpl6QcGkG3SyblDINC1VZdPm8grveypzL1O194FBeHnICQmQz
         q8qA==
X-Forwarded-Encrypted: i=1; AJvYcCVp7O5e4pxi0oyqBoVSc1Q+lDuHVoeSBLlTjnheCvwHP0HgoNLzrO+LMZGlWEhA/3tb5AGjknZBs1AVdHrn@vger.kernel.org
X-Gm-Message-State: AOJu0YzNSSIcKoluaNX0nCSIc7hw98GtgRAXTmveh1O75P4NZRdq8jim
	8hmncESdn1SU7nB27l9CgS8l7A7swy0aDZEpnlSuTnQyS65dzvEUjh1ykio/gWXdFEE=
X-Gm-Gg: ASbGncvUy2XRv9SZWzwhvFJLVvLsYUYvvzist9iLP9W8bCciXsbxgC2GhpuU3A+grQY
	bxJW5Y42KM4WUOFhUNo0j7JJzOV+iUM0q1k7d2t5m6KSSvZGehNZHyQarLkDMIuZOs57fuC89EK
	hQA/iG0LMwxoFSyGgd9t6YLqA0XwqgEpZHTSFGjJOVwdXHMreLFPq+6UfwtJQKbOnqY9g5/cy45
	HQzvOUfn5nTjAFDzIGXUawYlp7kNmK25JlaknNoosc0k6jau9T+q/xRSgmWsJTlJdOs/v3lF7RJ
	rwCYM9JB757UfAuvUw8w8eo8vOQUYvr0LpwoHZw5kDoZ2s3Gq7O00IVak7La92b/aYpM4CvJ89H
	hwrhoB9dkv6k171hhafbrEJYhImlz2jqotthPwVfRR4wmWQ==
X-Google-Smtp-Source: AGHT+IF/P3JGmGE10PIfdHqwzm4/ifWKYQ/MXC5mVGrGtyVgrjAOWjLFRwF4sj8gaNTy6XhjFE43Bw==
X-Received: by 2002:a05:6000:144c:b0:3ee:1233:4673 with SMTP id ffacd0b85a97d-3ee12334885mr1189394f8f.16.1758189044856;
        Thu, 18 Sep 2025 02:50:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f5a286edsm37363195e9.16.2025.09.18.02.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:50:44 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:50:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] tee: qcom: return -EFAULT instead of -EINVAL if
 copy_from_user() fails
Message-ID: <aMvV8WIKnqLN3w6R@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If copy_from_user() fails, the correct error code is -EFAULT, not
-EINVAL.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/tee/qcomtee/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index 783acc59cfa9..b6715ada7700 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -424,7 +424,7 @@ static int qcomtee_prepare_msg(struct qcomtee_object_invoke_ctx *oic,
 		if (!(u[i].flags & QCOMTEE_ARG_FLAGS_UADDR))
 			memcpy(msgptr, u[i].b.addr, u[i].b.size);
 		else if (copy_from_user(msgptr, u[i].b.uaddr, u[i].b.size))
-			return -EINVAL;
+			return -EFAULT;
 
 		offset += qcomtee_msg_offset_align(u[i].b.size);
 		ib++;
-- 
2.51.0


