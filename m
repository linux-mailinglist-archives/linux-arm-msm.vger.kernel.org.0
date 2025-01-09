Return-Path: <linux-arm-msm+bounces-44650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7883FA07E04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 17:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB0093A491A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD8A176AB5;
	Thu,  9 Jan 2025 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DnX7fWhN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301CF2B9BF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736441197; cv=none; b=Mfy+OwA1bZGkRwr0yyWOCFBI8sLB0gHyD5qk4rzoET03SZsWQTJ8TdOZ7GCQN9n9UNhNfzvJS8WUWBG++QBAgf4QiaQdkojMZt2Fhb22S+k7xqckWlrV4nqukfo9BIkZDPN+g+hR2tVoFP6cAGouZ6/0XWIYp833JATNToSeVmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736441197; c=relaxed/simple;
	bh=/AVkzAOPgvwiIL72WM70n4JqKgAHKLqN9FFosiKbAGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oCweo/32bRURS33CSXQ7xZutkQiHOYo3N3kc1iiFLmCEa/gqsye/BvdjI/+rSzca1wmNNBcN5q1pUywnCXl0AriZyXzJIzc3BR129unqU8ejo8vs0k8D2k/QYmedYp+7B7gKNRgNVfmRcX3TBQenhFalMyp1m2Wc6ekO9nLUous=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DnX7fWhN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4363299010dso1191085e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 08:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736441193; x=1737045993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OgpVdFnlAMFP7IZEUrXDNkQEO8OUBXlWJUJSafg68dA=;
        b=DnX7fWhNPYTN2UdvBEABXJVe9VIucTgRQm39VtYKImRSTuWqmlrkoj7gQ1+PuhuvHg
         gGDk1dfmT3qvvAK3knh4q6W8d/GQDY/d2aV6wreYo7C8UPM9Z6SWSSto0m/oK+OhSNd+
         c5XNFN7KA1vTmF+joKF00LwL9NqetsYw0L626dEgn/977VDCp2Erqjh1e/3fFWw6z1/K
         zVIJ6e1+eSJvXfZ+wvQe6Iabab0Ip79idZxaq+CfOmXAVdBmp6hDfRhE9Ag/UJwMteDx
         kVSgLXy2LiVHTWo1ycclMl6BRa/w1TPmATofXRjrPE8RIT4nj1GwgA8YD81XqE94lA5H
         91Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736441193; x=1737045993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgpVdFnlAMFP7IZEUrXDNkQEO8OUBXlWJUJSafg68dA=;
        b=Re3Is3xmR0kwoXfK/ibMWVnE/9xrqzah9X2iiGJOogvkfhO5/NcAd/YeOC5NKto+ck
         DFM6hX2Gsp24a1+eM7XmPkZDzRiZt87V2/B6ulmwN42x/b7cio9fLSKicigkYmlUowSM
         117Yi7vAa8HjTOgMPlzgt/i6EI5M2FeCRhegHv8MHTM2+f5Ku8JG+Te9dBqW+GFbiE+u
         rYgKpus7yF9zQ959ldPi7hKKFQqjJBxWiZabRRf4IacvgEeUQUXdwQ71upVjYvfXOzsL
         rKoaZR+uPXntF3H7HJ52nOBc7DKTK+8rc9hOQjbETMFpg9ut7tAGanv8bk4J/M7f+yyq
         5USA==
X-Forwarded-Encrypted: i=1; AJvYcCWc32nYur7xDVSZUTA7Adn8LqwQI3F2CCYwx2HpzRhpKH7ZEG4AZWCFWWXXj+v+00EVY98amJOuh+WJbs0m@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9D31HQkL6du8FCrZ/aK6io/ZCH3eAA65xEXkBmRWwaCtJKqc2
	qNZgz1uuQxmoGY/GzXnY+o88GvOI8nDuAZlgkzUnKYMd9iAaFdqIsMqQIaIhGBM=
X-Gm-Gg: ASbGncuMvVzTP1PTzqD81YJTZuycKNilb0HQYvM8EFaB3hIGebzZz0uTR87MtiYCVbZ
	8gdKRYNVtapDpeTG2IaOse43c2ZILkwFQXXGpc441WGrOGnVFo8I3dgVtdVj3xGe0IBURRKgQ3T
	rTJJ2uLETcbUz/lZNBuN/cjELzM1W7N2Bvdwy/oQRHvr9rnx82d6WxxaQBNzts/awfkN17wKh9w
	fl3NjzCSHD3j5QThTUcJurtmCloPFzRqmM0uKwfSXBVFmJ+jv8RIffPUIc+VE+EiuW1cFI=
X-Google-Smtp-Source: AGHT+IE+WxYdSw0tgeTlo9L4RMFe5gBH7TrJwlo+GrMX0RpJZXbWeXObf47j1mNDBYIiQ+vWZUDZOA==
X-Received: by 2002:a05:600c:35c1:b0:434:a0fd:95d0 with SMTP id 5b1f17b1804b1-436e26ef968mr28966115e9.4.1736441193526;
        Thu, 09 Jan 2025 08:46:33 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddccf4sm61179515e9.19.2025.01.09.08.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 08:46:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Georgi Djakov <djakov@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] interconnect: sm8750: Add missing const to static qcom_icc_desc
Date: Thu,  9 Jan 2025 17:46:30 +0100
Message-ID: <20250109164630.175093-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The statically allocated 'struct qcom_icc_desc' is not modified by the
driver and like all other instances should be const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/interconnect/qcom/sm8750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/sm8750.c b/drivers/interconnect/qcom/sm8750.c
index 59d8bae1097e..69bc22222075 100644
--- a/drivers/interconnect/qcom/sm8750.c
+++ b/drivers/interconnect/qcom/sm8750.c
@@ -1485,7 +1485,7 @@ static struct qcom_icc_node * const cnoc_main_nodes[] = {
 	[SLAVE_PCIE_0] = &xs_pcie,
 };
 
-static struct qcom_icc_desc sm8750_cnoc_main = {
+static const struct qcom_icc_desc sm8750_cnoc_main = {
 	.nodes = cnoc_main_nodes,
 	.num_nodes = ARRAY_SIZE(cnoc_main_nodes),
 	.bcms = cnoc_main_bcms,
@@ -1518,7 +1518,7 @@ static struct qcom_icc_node * const gem_noc_nodes[] = {
 	[SLAVE_MEM_NOC_PCIE_SNOC] = &qns_pcie,
 };
 
-static struct qcom_icc_desc sm8750_gem_noc = {
+static const struct qcom_icc_desc sm8750_gem_noc = {
 	.nodes = gem_noc_nodes,
 	.num_nodes = ARRAY_SIZE(gem_noc_nodes),
 	.bcms = gem_noc_bcms,
-- 
2.43.0


