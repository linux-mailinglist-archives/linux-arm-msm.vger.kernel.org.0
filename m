Return-Path: <linux-arm-msm+bounces-17951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB478AAFF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 16:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74C14B21C4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 14:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D62612D76B;
	Fri, 19 Apr 2024 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vOehAlup"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C80B12D745
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713535245; cv=none; b=L5XmnqiBy+A8/QKl5nW/o2r9SVAeOZtOxZN54qBP29LtRfN/qnHNueKtsBY1xi4j/a+Bv4ih5iRkD612jbLjSfXmOO1hcKcbQl3NoOzqgEBgRsdyf1njjRBeyE8Q75MV5BUUGZaizLUec0RA+OVZb/uY2O1M25W8uJtmtSo9AzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713535245; c=relaxed/simple;
	bh=5hXnO01E2x9fmcS8/rZbJSCLl/2FJgazSpXgDUcXmNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbGgrZadG1M11jtIjlbJGgxMwQBE15lu5IjUT/tin7WOuhrETElWmQ1hVJC/AzcIC9+KuB0+AnXgtvZwVfTJbIPv6z5R8Q9FKdm3uuM2OjBn2HaSfW3RCH3oKfK2dHHxrpkRvvtXGH38ZpppelHJkp7CK/fsTiQfVkWrF/7ugjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vOehAlup; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5196c755e82so2743166e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 07:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713535241; x=1714140041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TM1RhMLiz+lI7GOe6oFw/63N/y/J+ZLWylZ/Uc+1/88=;
        b=vOehAluptP4eMCR+ihZSGkW7sEUX6mVdce8FeMYIRcrLdO6iZQ86ii6ggUffzHEBeP
         V99wjimd2w9bgKVgjl59mGuhAa1uD8MgcGyPmlNYqmwsXqNsm99U7KT7SqbgS7QazMI/
         Zb23AYyyl3h8E94T0qsS7/89lzPrAGh9EfEWqmoOGg1U4pIJhVZ/k7XnRmJszMFlcZ4e
         ruk8gsxL0PpgaoC6Cb73J8nNRLsE28S54fHKoKxDdwKC/yh8L4MZ3tW3hdPjLiTeP9SI
         oQEvAXN4HlG+DwLNM7MCXWug6acEuUUnlxh37S8XrIONfu3mP9AUXEV1xsMZn7abUIBr
         kPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535241; x=1714140041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TM1RhMLiz+lI7GOe6oFw/63N/y/J+ZLWylZ/Uc+1/88=;
        b=VhIXYBWfAVUEN/ZBugahKDqkmASBl7tc9p8WpAD6R/Ew2f4jy4AjtVUU16SG5CPZH6
         HoR89AMg48l0gOh1Au3Rg7/aZj4ouSnXmD70XjOr4OojqTNhaXjmz9YgTO+dCv+viCX2
         0/Z5EKrdUjRTScYFWatz0r1t6mZOqmR89OMGzn2QJo2run9ydh0pAAc6bKy3F91kw8nM
         XYFSa79ndfuyx3HqWq47gNqp/Dm8IyxcU6x+r+OblxGm745ucUW1RU+rU6juAJ0sZgdb
         BjaWf4hEJFyxlHwevEMWyv3TbwMM7Krt9Poske8Dd84NYhXREOiECj+g0MK6WS7X2dL/
         Ybww==
X-Gm-Message-State: AOJu0Yx/j+rshRzUjvbmq1gJdSluQg45ynnNrR+GbsBkpacZKvLB9Ghc
	pypjZdXT8v4JgsakmiZPV7gccZfFq81e4a4R+ugwDxeaIH72XUT54RubXQI0DWa+ubhV29c6jXQ
	+
X-Google-Smtp-Source: AGHT+IHVzIG5EHTGeGvnuJJI6QCeX9IkjlUAwpW6DnN9RujgIXqknzt//juew12rrQF6U6IkwjYzNA==
X-Received: by 2002:a05:6512:2c88:b0:513:e63c:cfe7 with SMTP id dw8-20020a0565122c8800b00513e63ccfe7mr1620992lfb.66.1713535241283;
        Fri, 19 Apr 2024 07:00:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id qy1-20020a170907688100b00a558be8bc03sm532390ejc.150.2024.04.19.07.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 07:00:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Apr 2024 17:00:30 +0300
Subject: [PATCH v5 2/6] soc: qcom: pdr: fix parsing of domains lists
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-qcom-pd-mapper-v5-2-e35b6f847e99@linaro.org>
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
In-Reply-To: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1042;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5hXnO01E2x9fmcS8/rZbJSCLl/2FJgazSpXgDUcXmNU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5pSJWvSTaOqMz9mluVcNZvU8ydQaPpi/6hv7MtzmfxeJ
 zGUMB3rZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEYvzY/xf4PXqd47Z9bWKy
 7ILUI+peTI3tkgV2N3bsTGlMWji7Jk0nJ3Md0yHbyz4TJbQjUyrC5Cw0bKSypqgLftppZXNr366
 LPjEl4TmdPwPE1+mmShlwpDHFK5yXurXkyL9pHiw9Ic2vi89/sg2vuHdaRorfhi3it37wxyLjHv
 vrQUzS0kqL97Aa+b5dUX7Q/q1RNpPjrk8ZWZlrWPqfbqw5mqTr/+vWTq9TGSvrZ9woFXh0PNLo4
 FeWOXe/7NE6lJKRyVf/eqN/79xz24tz9++cc9Xf/TODaLnxpQAhxat8ySFHGdakKMwt6Vk1Wcbm
 ddAjba4XG8+pv70r/OeCtUJQiLCaGGv/s1eKwSf2mfsAAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

While parsing the domains list, start offsets from 0 rather than from
domains_read. The domains_read is equal to the total count of the
domains we have seen, while the domains list in the message starts from
offset 0.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pdr_interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 19cfe4b41235..3c6f2d21e5e4 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -415,7 +415,7 @@ static int pdr_locate_service(struct pdr_handle *pdr, struct pdr_service *pds)
 		if (ret < 0)
 			goto out;
 
-		for (i = domains_read; i < resp->domain_list_len; i++) {
+		for (i = 0; i < resp->domain_list_len; i++) {
 			entry = &resp->domain_list[i];
 
 			if (strnlen(entry->name, sizeof(entry->name)) == sizeof(entry->name))

-- 
2.39.2


