Return-Path: <linux-arm-msm+bounces-53817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E8A840D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 12:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FEF01B84684
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 10:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B143281368;
	Thu, 10 Apr 2025 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tiJglv9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62C527D786
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744281447; cv=none; b=kqi1Su+j4+qzkfk3oSi1tAvMJkAeXnYuGnb101GZCmx/MSg8j45JLEvVYVW1PFdNzcaU8SMxHe2WuASBd311sAYh719hzcauiGo9S6F+hGkE1HIRcpIrUeTaUhejbkhMpL1Lro1Nr1XQ+BDjtelujogUxmsofvl0npIiHvGx6V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744281447; c=relaxed/simple;
	bh=wSoydyQlm6G68USoMznwRosFCC6xPTjIE05opbWT8Pc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GgIgwHDiu++o7rmIvbM8HsHPVIok+Glv933udyy4rlIXLKovvY/cFPxjE0sSWgku3HEArqU+OeiELffJCLyJvsoS//kID2g5qe/8vX6EkYxSW2Ge8Nm9UTXAphRb4rLutxrCesktLy2a74Gyn9SM6kmxa0p/TDFG6YbcdlEMNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tiJglv9F; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3914a5def6bso306604f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 03:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744281442; x=1744886242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9EVV1Ec7k3TH3dY1WUPdLQRnNApCBxvvZldU2uE6sg=;
        b=tiJglv9F7THb76uazpWl3uy9IqZfUs/vJZ4HN1qtaeKTbk01IVLC4hQcL6+0Zrz00+
         zVJaUDi5TSVtOTen2pn87JlxbGuNtvvPBef+tMB5TI+giaEzHotN8A9hkxkblN9H/hcI
         NvQjWyT96KKVr4B+xbqcLoV5nvKbsSkGZxqvZr369yCqbO2I5lniezuFvFR4dzQ3tEOQ
         gUHakpu13zBK2p/7wVfPK0l2fj525WMmyj0WxdjmSnPHfHjhMAnwcWzUDryFEpgLkaP2
         tfDchJE04thHonlb3cQ5IjDO/eM1x49wohq43tgGpsFn7h628PFokeBZ+2/QE5IB1xUA
         L2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281442; x=1744886242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9EVV1Ec7k3TH3dY1WUPdLQRnNApCBxvvZldU2uE6sg=;
        b=LTMdJwf39UWVdCfqxKgxW6eh+4er1YKWXgHpLOEa/NBRtDoIKOOsA4QepjCxieLiN1
         mcY8XoewHXZyWcjoG7xG/hGQjaRI8KweVSPdHzX9EUZrwXlwwiAqF9qfi5s2FI+XmHDl
         hNiR1JY+bm4dfbcbKJSb2047ZYqKmg68vh0HE8jIo1PnYbH+QF6RBc8niRySbTvZscv5
         CQ+hjagSRuj8RAaqPUV/C7DswXrCExWjVTlf7geqI9cJb0OtIhIsnNAZPlPx58D7nXqK
         EKX9frqUQPbdUVMjWplodMMYLSSGR6FT3Lw3bVJcC9aVpBdWO+g9mW1z3TiPgexATM0h
         RWHg==
X-Gm-Message-State: AOJu0Yz78LWtTcGy7uUHq1lXgFBYBKTZPBI2FXCK1DQ7SzAJg+f7aaY1
	M4nl6hbMymlxiuTl77bawk091HPwRXYVE7wiT6yOjiSrOmHDh+8UnOxOeuerHZ8=
X-Gm-Gg: ASbGncvKfGSG7mw3lcleyK5SVZww4MV+RruU19gmMMWAVFvnhEVhNI/42IflNqmnB8m
	yXDeV858hHOQqrLGMuH4jSbucZINdjoxqjqT717jr4xSNLv/X0ACgqeGZeo/4Rg2LCOADe0NcZ9
	STe8CNNFVXhwsYA8eWYfZXJr9vUFgnB5D928maJGVK0grRvantqDYnTkIvP64D3AQ9lVANdv+HR
	NZh9jtjw31gPps5ysgqr7B1mopGBWI8TJlWFiX2cG2ZBCJf7DZiI/VMWjM05vuIKY+jCdntjWx4
	xkP6pU0snXOvkmh+g+lIyOXD634sixJIpLvg44AMP7N/SLi43W2Pr517eZhAdDy4hg==
X-Google-Smtp-Source: AGHT+IGkeEI4UgKz0JuWqCEhtgjSvbu9U+eFmkqEWX/tS80WE+jSM4C5CfOpaNBujEMwfFmabhy3kQ==
X-Received: by 2002:a05:6000:381:b0:39c:2665:2ce7 with SMTP id ffacd0b85a97d-39d8f4f3461mr1543583f8f.53.1744281442157;
        Thu, 10 Apr 2025 03:37:22 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893612dbsm4309388f8f.1.2025.04.10.03.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:37:21 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	srini@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] MAINTAINERS: update my email address
Date: Thu, 10 Apr 2025 11:37:11 +0100
Message-Id: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=421; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=8qFbEEYlqyqgMAwNvBba8Rd1eK7Pf1l8so2JmRuG/RA=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn959YBmrwcaStKI6QyXZvaW289Ghy10STyn4dB cV7Njm3f4CJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ/efWAAKCRB6of1ZxzRV NzEeB/9AMFa6xheHkfhJH2rJy8dCoPZI3IaOUGU9NaN3c60Me5Et0Ax0iyOwHJ3It3vhc0o8poW hfD7usI/odUC1plQbFinU+pFZHv7NIEHgZ24cN7pW4GgncDug8fXZRvd4OrxsX3AWrqPGqAXq0y FArPY086qlPKJcqkvWcyb/m3dVGIXgdNAttvIuG5MIj4MuqOP+fb4xiPU+FMzaeuGE70CQOm1F7 dy42y95kqNBkiMltXX0/TIsbhv0KtlN7qlE0vMZxO/8mwivwppxpt+J4RiyC0j46MD0nt/NCCzU DWia3qVa8/rNZpWgmwHxTR676iXu2gn9sTVWqVDdJAVeap7W
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Update .mailmap and MAINTAINERS to point to the @kernel.org instead of
the @linaro.org. Linaro address will stop working in few days.

Mark or Greg, could you please pick these two patches?

Srinivas Kandagatla (2):
  MAINTAINERS: use kernel.org alias
  mailmap: Add entry for Srinivas Kandagatla

 .mailmap    | 2 ++
 MAINTAINERS | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.25.1


