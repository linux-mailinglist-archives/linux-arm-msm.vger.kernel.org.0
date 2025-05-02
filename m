Return-Path: <linux-arm-msm+bounces-56580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9397AA7B00
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B54591C0313D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 20:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51BEBA50;
	Fri,  2 May 2025 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qFOHYF9x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0761FAC48
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 20:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218513; cv=none; b=VgLwC4TOKClthsbxTcszHSXVo0A+FC6YcdJTVxu94gaFUYt8lKaJLGSN3IgZ2GZG+TaGzEkEiKL70Tsvf3M496h6dBWhdMOdkvK7G3px9cwZsC7WaD9s4e58W3LuojsBnN8u3CZ+V+bORo3OplJMmpDK5E9O0FSl8uGTDY5+yHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218513; c=relaxed/simple;
	bh=VWpwqkeczEymfLebrEKS0c1EtjqnwsZNCWo5lpDI+AM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hINGR24OcSLhfxdNI6DQdDanDDNXQmVQf/nrvzoSlhcZpUXtoAyuSuEdKS0SpBMebFpnUlvlP/gKZQOYbWnxTfIxdeaNdASLNr71XH85IuWAh5AixxELh6t1RhUJVkQuXQWKRknncSfOreYHJIUpjSxSQa5JwRMSorPlUCqZbvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qFOHYF9x; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30d8cb711e2so1758101fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 13:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746218509; x=1746823309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z246kD9WO9fBM3v1g3qf4yYqZCkg30GwzHdViEkdnro=;
        b=qFOHYF9xa9p+oFhQadK6xqiqnabhE33hPjqfGjXPvXXtMHo8Pf+FTLxoFffpaQ0fS3
         BgYa6zUn7XdpUd+35GcY8mZPajalZ6wo81P5YG+NLpklASo8+E7K65GcTfdYgAuuhbJP
         9XuQywW4H3HnQzI1rEMsvSI6+QGRYdWDEMCpnIQOLL8q1bIvYrE5gH1o8qvS2NvxlNcd
         MxOtnc/+rN55a2Eqwf3v86Qh4r4DBC5HmuDbGX2Nro8mKb5yRWKWPCW4Hnt5xpCKRPz8
         6Y4CKztOFExUjsN1k71TiqfnSSNBtkucZXxlZ42MbBtn979jbGgSmelEEPzhEl7QQ+PX
         TTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746218509; x=1746823309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z246kD9WO9fBM3v1g3qf4yYqZCkg30GwzHdViEkdnro=;
        b=hEetkIN9wO/4jlsvKMEhk+2EOBXRkSSzMT6ABQ9piklgTDPUlqx6pFQlfQA5POwSVi
         //aG7GhsFr92x8rLtAOuNqvZ3ObKm2dL87WJYu8fWygPIb6DoESjsP8BmC1osmu0pUMI
         Zhmttdg66suxr7ngUghh4R5ffErNQONnizCczSvnYZ2W+TtSNhzjbfeU8uis85n51jl/
         wHJ0DHn1jugpwzPHrPRHNWhlrCS5LeXdGnsvXpA0yyRw315+0silm+Jf5gsqRrqVN1U9
         52c3h0h7L+xn+V5Y9/cwR4uO7Dyyt4LvzQNZPhgBY/TXp8sioGTNQPR4Cthsk7R41KKO
         Tdqw==
X-Gm-Message-State: AOJu0Yy3Yvntj8q68tUTBNC+AW4JNc6GwCHtMlguZRQdgJ4nWgs7ycAr
	IRcjat4ptWrycov9nGRdgkBpc3bINA8W+oYhwsSE24eLna5BNj1VsuYGR3qJvtM=
X-Gm-Gg: ASbGncvn1bhvljI4B9KFdnHOUyq70DgEFaI7nK3PsHtNyg/t2sJL4K/0ZB5bLd8zunQ
	pntzMQt/ZBCHV59qSWTtsrbHO4nuq8xb1K0F1TGUs9CMFc5qpqSYqOf2Kox66XWEx5G0gPfSbsv
	lKJc7pR+Ub1XMhv+Atd/vwScymWTGJHiBs8bwh2LS5/D86ZbAj5f7RIQfHH4A9HWSfavAYLisG9
	6LSZ02v8JTFA8An0bhZx+z3tI20iBN51ucQquuByBwD8aZEYCM9aKw3XujkJAjLPPyfq3nUz0Jh
	7dNQ/RBlJ3AqekmaTIrn3NJjKU7A9uHzONlIkHcR18ZE5udSVFGnURKFzD1WOkuXQbXQHEVq4/O
	D2dYhcIZt0/QKG/vDp2eYHVDdEeNLGg==
X-Google-Smtp-Source: AGHT+IFNiq628qOi+XtRBGVyUOhgnTb3NWzl5Ifvz1ocQ2BkI1t/QCLD+7WvfFj6wyod8jbCsH18kg==
X-Received: by 2002:a05:651c:222b:b0:30d:913c:4416 with SMTP id 38308e7fff4ca-320c63b8dbbmr4457511fa.10.1746218509109;
        Fri, 02 May 2025 13:41:49 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017825sm4675301fa.40.2025.05.02.13.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:41:48 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] dt-bindings: media: qcom,x1e80100-camss: Some minor fixes
Date: Fri,  2 May 2025 23:41:39 +0300
Message-ID: <20250502204142.2064496-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The changeset provides a few minor fixes to Qualcomm X1E80100 CAMSS
device tree binding documentation, which are in time before adding
the actual device tree node into the correspondent platform dtsi file.

Vladimir Zapolskiy (3):
  dt-bindings: media: qcom,x1e80100-camss: Tighten the property regex pattern
  dt-bindings: media: qcom,x1e80100-camss: Add optional bus-type property
  dt-bindings: media: qcom,x1e80100-camss: Remove clock-lanes port property

 .../bindings/media/qcom,x1e80100-camss.yaml          | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.45.2


