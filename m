Return-Path: <linux-arm-msm+bounces-52894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B95A76F9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 22:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 402A616605D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 20:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D639521ABB1;
	Mon, 31 Mar 2025 20:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vvm1+nnn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31588214227;
	Mon, 31 Mar 2025 20:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743453981; cv=none; b=jjmlZ1c+KVGq7kCH9dtfIjiUyMHvkx71/C45/qkBOBHlGgu44dIfTlvzCFcSlYSe4yXwT3Keo6EUvbvd/Ba+/W87BVItvRSpKF3jhJQFeNdbYZiRgA6ymYJtaiMkofbPLfxJbA7scObzE15zSf74qkHcvLBatkqyVeD5GCWSlNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743453981; c=relaxed/simple;
	bh=VL1BagKpR2PzlWP4EuzcW8UqstpmSVCi9M4XdWrxn3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=htCRZukEBwh2hH7ecTUqljI12bq1iCnfTbD3EF+O/u4dmz4ogMC2xd106czwUoBaAng2CbuwmxOl1E6FnjhJY6cv/ZAcJ2JDttlyyBe1TTBijEz6nUOW/x8Lw05obvTqqeOGW4jQjDVzsinIml8NwZL437hvCcwIslzHBqMEaR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vvm1+nnn; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso545137f8f.1;
        Mon, 31 Mar 2025 13:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743453977; x=1744058777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2k9mKVMicaaLXi6qOk7Jponh3pMkYt3H5iHRzaO+K9g=;
        b=Vvm1+nnnHS03tPK0fE2bROB4VZy6x8fwa5D5hGu9l/nt4J3o4Z/5FfotzmdNAhH8c7
         H+sDG7GXJER+F9Fm7eg5tWT+FiPThlfGMD1pdOOTyeINyDmwVNtMhybsu3d+8YsDaGCv
         +7VWAgDVsivs/rfJgu7fwB36e1bzaRrcNEVRb1LO48ofYagg/wt5a3gs7yLs2HBUleMr
         u9cZDLvWDOFEKHq+B8gqtBqOhs4/009NipZZVhaItXMXuzbk3lMSxlP1Sv4DjgZbBuSd
         VGxB1oGPDuL3YT4gxPPotlk0UcWSBTNGuMihkiSomgFLxuTo0sgXC/Erlm28M2y6B5Rn
         1DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743453977; x=1744058777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2k9mKVMicaaLXi6qOk7Jponh3pMkYt3H5iHRzaO+K9g=;
        b=czsy3Cpk81y6fKk7qZz16PW6JwQoYCU1NqTui0Hb8hyuv/Z16hKBCU80xFPTVWDYoO
         8Q8sjzVWe7DH+nmRUgxSYdlFssjDhQ/G9dw0kkM7FtdOfAssJg6oc2/Y3PXMfo27MBzc
         2ookU0YWht7nK3cC1L0abljokLqrwBv9tGKgp7G6wes4IQjKyMZKcGIRe0eXeR9VdFVS
         GyTEvZUa+xqrkTsDHoQnWdYFw5IF9JdMY/vv1S27KcQpPeiZZmgqbTmgzVcVGIWv0dgp
         2WOot6Y98LX7/rCm1uwIHXSTvIoqxivK0JcMPH9MNtiZis/VpqgcYrurFNzRFtoZhHZ2
         vVZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyMBVviPyTYcDzEWjA8ztEhvZxhqFiVA8TMk9eU1Ypv5cHbrHFhVqOHtqh5H2/IlAEaHw+BrJd6/wI30Zv@vger.kernel.org, AJvYcCXA23sSJvXorfhygNShg3Kq4KaapW7+xeSspnidaNFeRWsdK9sAzJ2zKdxJ8OXc2twObRcRH6xYX2bR@vger.kernel.org, AJvYcCXGsy5THKlUn76cPa7zMMNyBdx5L03KwYC/ZviUi0wz694u8y5MAbLAWBoh49TxL5XSoaSpNIjWW2cPH9zomA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwceyExyANd47K2WCAnKQWUl6oTXkh9K9Okdw2s3EH+Nonxk4eX
	2BQ/WGlxqDi4J8fxHMs9y0ozqTtkTMVUJeokrjEg4j1WynbLeQs=
X-Gm-Gg: ASbGncsFYXriMyUonVO5B63NyVT4jdg0n/EcbEq+VS834GebAEHnqYYv8aVbspmgtqP
	h6OONGH2lYoeUr4mlM+TqxuXaN3Z4U8CTlDYOeSGR5qJmYD1qT6GGT90uQfcm2Ir6/MnjvmpuCd
	uL6ygCyMaSxleUBlz71rdGCPoiOy6rcfLjw4K6WeGU9CiK3s6z7pQhc2WevJwA6Ij9Lv3eXvZuy
	Uh2qBDg1CYQY9SRwQY4ewWybb/q/XKTaPnQowEVr1vvTKGBxtFMFqfwA7OSQzbLwIMgx3XaVGVa
	aMGhBCN1oNM8ZbEFN0uW1b6/RUhtO8D5PSdmvFZf6bYs2XPAsPwrXY2ZRnryVUKmwcfGuyelZGT
	FjQrFoaIAitOCV6lKNs32d7E=
X-Google-Smtp-Source: AGHT+IHUwXQN1JEwDEcBE8BfL8c+uO3ympf5SyCdjQpEJYlefdYyaeH9vV3YZnbadue+35d7HKfhqA==
X-Received: by 2002:a5d:6d84:0:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-39c0c13b7d1mr12175023f8f.24.1743453977282;
        Mon, 31 Mar 2025 13:46:17 -0700 (PDT)
Received: from alex-x1e.. (mob-194-230-148-227.cgn.sunrise.net. [194.230.148.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0ddeecc9sm11006996f8f.83.2025.03.31.13.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 13:46:16 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v3 0/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add WiFi/BT pwrseq
Date: Mon, 31 Mar 2025 21:43:43 +0100
Message-ID: <20250331204610.526672-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bluetooth to mentioned device.

Changes to V2:
* Fixed commit message misunderstanding
* Picked Bryan's R-by
* Picked Laurentiu's T-by
* Link to v2: https://lore.kernel.org/all/20250331073423.3184322-1-alex.vinarskis@gmail.com/

Changes to V1:
* Fixed commit message
* Picked Dmitry's R-by
* Link to v1: https://lore.kernel.org/all/20250330212729.3062485-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (1):
  arm64: dts: qcom: x1e80100-dell-xps-9345: Add WiFi/BT pwrseq

 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

-- 
2.45.2


