Return-Path: <linux-arm-msm+bounces-209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C35F37E6189
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 01:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F61EB20CA9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 00:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A54610F1;
	Thu,  9 Nov 2023 00:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TrFXn2IJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC5310EC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 00:43:15 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281B71990
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 16:43:15 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32df66c691dso134759f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Nov 2023 16:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699490593; x=1700095393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDS+AzSQ7ROcFvu02J9hTzJvbPaGYAH/Q9+ic4s479k=;
        b=TrFXn2IJB9BzBPTbBfIVZGxgzQY4wkQJ4nq470wCFh05oOjFlGzglPv1y7oWjWLET1
         LHhTxbusTBWIXqFsBAGr5naSEMdcvzmUVyjRmO5LtvsfmlInElC35bWiIIaole7yx3yW
         2IROsqAccyEdL2NlLjZn2zMgXB18ArRdcTCpy9QNNh/tQFHYRS6sNR8k4llzmTRm82nR
         IdwjMYxGBrK8KQfHhnckMPKdb4NcHa5oJB3I4vDHsaCCQvkVnRtDvS4Rr5oMsI2EXjQN
         7ReaPa0OUqGQKnzNvWtooFwbxKGnqRztJcY5h/HnEM0qMMZbnkT/q9QWeJvK0I0gG374
         d0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699490593; x=1700095393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDS+AzSQ7ROcFvu02J9hTzJvbPaGYAH/Q9+ic4s479k=;
        b=H/p7eDrA+yNSI00L+wLii+418TnNa6gsqRriIz3UW0HAQSJsi3WlK6NfCahrsXtFLv
         jcBRhel4gG2w4+J3WA0BEs2A6A/mc77qu2qEOCq3gtH0dU6w2hF4o58sQav5kPXio+FI
         mUVu1iZCXGihn9qtG/GbDtonkoDpCaw1BBP8ZozkDEY6aTcTv9Rot4w4uDlklRlkLTND
         6jWT7krD9oM0t4d3KC4iFEq0Lw2bQswuJXUr9oh/5VaJfwNUNeDA/hKyv1FGuoMnSklz
         ICf+NAagca90MVOQmfco+hKdYLA1PZNfDzf/rI3I/SviwCbrJDNpaGWrjwlNeACfFusa
         VT0w==
X-Gm-Message-State: AOJu0YzFq4wWnOejmA1NO17zeDIZBTHXfeqEG+v8X4P7C1crP/4HWlC4
	jwfqhyo8Gg7UZt7V7B84y8E+6g==
X-Google-Smtp-Source: AGHT+IFGDuWjTK1PWl6WHmyHh8Yqh1u9jcFcsFPyVsDFPvbJo81Vs/TkaKWzTniqYq/XUzGf8Ju97Q==
X-Received: by 2002:a5d:64a9:0:b0:32f:7f09:160f with SMTP id m9-20020a5d64a9000000b0032f7f09160fmr3211448wrp.12.1699490593540;
        Wed, 08 Nov 2023 16:43:13 -0800 (PST)
Received: from sagittarius-a.nxsw.local ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d4ad2000000b00323287186aasm6099238wrs.32.2023.11.08.16.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 16:43:12 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	dmitry.baryshkov@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bryan.odonoghue@linaro.org
Subject: [PATCH 0/1] Switch on USB as a wakeup source on sm8250
Date: Thu,  9 Nov 2023 00:43:10 +0000
Message-ID: <20231109004311.2449566-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add in wakeup-source to both USB controllers on sm8250.

I tested that the rb5 gets into and stays in s2idle, subsequently resuming
when a key is pressed on an attached USB keyboard for both Type-A USB 3
ports and via the TCPM controlled Type-C port.

Bryan O'Donoghue (1):
  arm64: dts: qcom: sm8250: Add wakeup-source to usb_1 and usb_2

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.42.0


