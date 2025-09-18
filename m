Return-Path: <linux-arm-msm+bounces-74032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843E6B83010
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 07:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47BCD4A3E4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 05:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4FB29C325;
	Thu, 18 Sep 2025 05:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTMtazp4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06398217733
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 05:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758172989; cv=none; b=dXRLNjP4I79X1zxNp6K4Z/yyZxQYQ45EyeaDa4cWxoQdP23RNNtJ3nEZTm/PHcTez9n5Y7feJlcigI2dKcWrgaHzKv1mlnaPq7PJFevA1fhjije4QwFOsXH5C/qMe6LxOgaKDwHuSVx611J0UGSJ5XvjNjKreRTo1mikmkVwDtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758172989; c=relaxed/simple;
	bh=TLOVWO8z3YKEVC/nG7+rCJR0ydpCskrgzD5ovtmPwE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NrttBMQGz3rrZAnteK/n/51P+Q5QWztb6I3aLIH0jC2ZyGstF/s3AcJ30wvvbvwJDd/saYo3tbeiuGXl+Gqic9Yg++6uNSJ16g9djKe7F3dcdv2mK5zy3VYVYYKcdznniuKCvjnGbRwzXwKRBUph9ravDFQZP7+U+kz6zHNhVaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTMtazp4; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b5503438189so153694a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 22:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758172987; x=1758777787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLOVWO8z3YKEVC/nG7+rCJR0ydpCskrgzD5ovtmPwE0=;
        b=UTMtazp4XYHPTLcZ0zHHCcpO0xHIRSB2lMJPxIoGzrvIt9EoD96ld88ffOtZgirzuD
         ZD5KbZbNZ9a/L2mqKGWCHxw22nWAy/BwQYf69/jnVi7F764hg+b3pOCU4aP6e9oOkNMw
         cmhR/HBpzMnsq1Nweon1AxOgBvXoWtxUy3msrsuKeGYbVLA5cD++CM9tg+Zt3bg2ajHc
         XspbdBSW97T/9Ef1jzffWN4ZwzX1vQJBHe7WNzDScnJISR0AkO4TlyLozbZ+pkxZE2Re
         VmQBX7wt/fjsmIyFlNYk25ZSPXyvoIDlXGzx1xthR9h8NT9IBPWhZmjQ2HFZRs5oDnkx
         RtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758172987; x=1758777787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLOVWO8z3YKEVC/nG7+rCJR0ydpCskrgzD5ovtmPwE0=;
        b=ogSEdcWSEUgEJZZhDKdwwg1N1UYTNGIe/GBlTmaezDXj5e7Ss/Il/RWndat6Te4PtN
         383aKsXfszRtERzHjSoqhTMSFr2EaBVDtFHUmSGOsW4CzIdPNzI2tt8Cp7w9MerbkuHT
         QE4ecjtOSxMIT0YwtXePnccSckDHvZqYIn3euSQM2P0NGR9lcuINDZYb9HOjhO8ky7jp
         c5MoQ0CErCTCWRg4PEgexwSEv9fbj3zR4M/Xv1cCImY7G7YL9fCWJVzvF7vkcZNTiw/u
         dUvVDausbiPcoynueAfHGeY3NRNt9b4d3XgMtN3anvZMhHGXsFE4HTPy3hc4d4fIWpYW
         wMQg==
X-Forwarded-Encrypted: i=1; AJvYcCVIiQ93pSGthlsNvXRRDYt20M4Gc+YlWPRiGLFzIlIQGSgtCoPlOGFRC9VPjZ8i9vDBfh7ltafw41zJZkL7@vger.kernel.org
X-Gm-Message-State: AOJu0YyjEubdOGM5q6ho7Imu3eM59MhldVFDuBTdI/8SX9oYKmDK1EJq
	oH+tmUbo8EgDf6qHLUcCdp9z5iw8VRx1wx07I9DdR1b6bJG0rbNrhhFX
X-Gm-Gg: ASbGncvZPjXaz/qdmFRlET7bokzy29w2IlX/C4KXAOgDwao6MV7HQYFcyINiURjY2fP
	QWPElfzB1PD10AOTvkEwJzjv091a9UdvOEeT7BEKMXMJT5zycRSjjA4oxbIn3VVdzyX22wYWqke
	Kkfkq39SMxPtmMunUEpF1ZtV5GkC5ymQYHkil3YdPCEFu8E4pzRzcJIN3kQI2oOVnqDm4yw7ips
	7ouciKE841y/aXT6bRg6L4Om9sfwggKZsGzXUSMCGFcUcSYc7QZSpzFR69pw/yMpxI6btrDOiP9
	Clz7mPMfm0padn45jKJH/+HWQvBkhcJSmeYd7KEehvGtkDkQgXZCSH4T7bfUj/yFMQ5IvJxYOmA
	mlSovCzVOf5qaS5CHYcGfeFKBchTEKVxYDxRUslb/343eAQkDyAv/lwI0uWTz6+ZI
X-Google-Smtp-Source: AGHT+IHrJelkeadXxxJ309pMmd78F2SZWNn8q0FOA+TBRg4iz1HVjQgFNx8SwnfeBgb2w12a3cnNUQ==
X-Received: by 2002:a17:90b:4ccb:b0:32b:6820:6509 with SMTP id 98e67ed59e1d1-32ee3ef0a33mr5635940a91.9.1758172987275;
        Wed, 17 Sep 2025 22:23:07 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([49.249.92.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ec9e66b02sm2118449a91.10.2025.09.17.22.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 22:23:07 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	tessolveupstream@gmail.com,
	tingweiz@qti.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for QCS615 talos evk board
Date: Thu, 18 Sep 2025 10:53:01 +0530
Message-Id: <20250918052301.2583623-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f3y4ibzkyfdub6gszoliaenuiudfrtqfr5u4zqpibfdr44hr7l@z5ap4odsoiti>
References: <f3y4ibzkyfdub6gszoliaenuiudfrtqfr5u4zqpibfdr44hr7l@z5ap4odsoiti>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the suggestion.

Sure, I will update the commit message in v2 to mention
that the QCS615 talos-evk uses a Quectel AF68E module
(PCIe for WiFi and UART for Bluetooth), which is
different from the RIDE platform.

