Return-Path: <linux-arm-msm+bounces-17369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C078A3B47
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 08:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FBEF1F21950
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 06:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81588208B6;
	Sat, 13 Apr 2024 06:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="J9zJhA6Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16D2208B8
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Apr 2024 06:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712990569; cv=none; b=Dw9qdub8bvzOW7ZWYhvbBNFRAajlU6btG0Wll5Ao4Gh8ODiWBHxkHYu4fIJq56yN7R+K/sUzhbemvZRMXHsgIUX5l572zMZ3SUp5EMv1SQk6iD9g4W7LrBel7Hqs/MwXs2BQfRkanvbrb3stIBaP2kDVZFJ0aWujffU5fnZRM1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712990569; c=relaxed/simple;
	bh=SBC8s0aw/XVtSUYTrPMNsE3syTSkNpxT2FbQ9YhbyWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ak8HGc1SpFRJrS9iCcnspuY2muzniEnuLnJNyFS9Dw1rUH4kfJBfi3kSMlqhe6sogZNMlv2WDa6sL/RrHQy8GSNwlXil9G1aRJU96LruDuGl/xOZzv+Q9rP7vLEYEOfWpmTFm6HnCKQRyyTBUamlOWVQP7gJhp+B5TYPttOE/wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=J9zJhA6Y; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1712990564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wOouSKr5PfyN6X4iAvsI+hn1OYTMkXlDy/dogZ2/0xg=;
	b=J9zJhA6Y0H65zl6t1AQUWrDFUA6GOFBOejV/FGGcbcLMx0HQ1KHudYGVzTEAzdTYTQH/0t
	FPZtvGab8DJV9FVfxsjX4inIQtAZ3gCnDKRXnOJCEKfK3PJhQChiRyCWh1+d4N5qJFKn9k
	5oGtSyJspYfWqd5VvEVvCxFaHLqyyi15LPrAqa9CnAH/XpS+DrybCF/gal7nC40I2GbiP5
	U6rhJdf0o+zk4a9WeS4PrT3/m82pYWD+nTGL3Jk8m4BF0o9BmKawmkU0m+b5J9cxDZlrQ6
	DA57Av6IEQTHXrGiVsnQERYDq/dYUxSxqWLjBq8W18PG/SPCOhcMUFUB62gqKw==
From: Anton Bambura <jenneron@postmarketos.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] soundwire: qcom: disable stop clock on 1.3.0 and below
Date: Sat, 13 Apr 2024 09:42:23 +0300
Message-ID: <20240413064225.39643-1-jenneron@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This patch fixes audio on sdm845 + wcd9340 with soundwire. The affected
devices are AYN Odin and Lenovo Yoga C630.

If this gets applied it should also be backported to stable and 6.6.x LTS.

Anton Bambura (1):
  soundwire: qcom: disable stop clock on 1.3.0 and below

 drivers/soundwire/qcom.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.43.0


