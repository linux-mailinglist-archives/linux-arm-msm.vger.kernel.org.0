Return-Path: <linux-arm-msm+bounces-21649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 405F78FB961
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 18:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDD3D2818A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1356F14883F;
	Tue,  4 Jun 2024 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="AQ4iGJ2L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1633A13D607
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717519570; cv=none; b=Qs3Gi3vGvcfERioAnBMneGCzSOL3bKaoikdmKhVDgRhNBoyzHitUZFi1QWYhQW+RVzRPN0BxCO3SzN+BcmL1Rl21J25I5uVa91t+4wY7WzHf2tJitxmUboNWnDEWQR3zInTRV/o/YpQSP4/brkPLQogAiKQdr1PL1ENFNUnidq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717519570; c=relaxed/simple;
	bh=sjUrVCVewPMi+6WKVBqLanHI9W98UentqJuOeu/CQAc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=cn1PeBhev0wQxExgzpiWn4A4Vzm6StasxLOD6uQcI//3Bjc7RoJc5d3C1ZGCG6DZiOnGbhK5toUrMECCcIR2OoAHj1E3lzXAxTpTaq6i63pfvA2mgS6j9fV/PlZGbr3jDRSn4Z9gFNgMimmM83Dcadb8T6L9fW8bYxbF0JR5dmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=AQ4iGJ2L; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35dc9cef36dso4893783f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 09:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717519566; x=1718124366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iad7um1wy2LV2KGVzAikoqQybVQFvP+KXglo1zrKD3o=;
        b=AQ4iGJ2L20JyXOscur1EewIw3HeVfXe2GLJK7v/AejPkvTVbnyts6mNU/z11IU1vWA
         lj0ZCDNPRQ7UJHDexO6x3CL9zBIaoNxbqmKpBmFbLVO+3X6/77mMp65SCZeI2HpEPAH3
         ZL8pfPj2tgSckkkCGCEBJlU3yNH4IWTWCS6bP9w/OgnrUYpzS996CWk7zoR2vv0kF8Mn
         xaVQRAgxb/bTXW9TpE0F3BXc59i1Xu4ToPeQYgOR0aFizmPL7nY3yoA/EInI3VzqRT0P
         baPEYOEl8UWNtS+rauxTldH0IamdwTsLXT00KyM9ff7dqjX68CV5IBoWhyz9ZaCEOqz6
         xJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717519566; x=1718124366;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Iad7um1wy2LV2KGVzAikoqQybVQFvP+KXglo1zrKD3o=;
        b=CTpNGPFALNCETvsrcvW/b99zFO1FXxgJ2ThIJQ5e2xY5EHPz8LVAveX5H3B8t4a8G1
         G53l/SJt+kvkHNR/Ec+StBPA6jbhnpE/oGbroK2Ur1TP8K/1lgn0QWe7RfQrfRn8xLfd
         x04LZIXgxotXOGorFjYg+UgsUMKdtwOQ9pIVgoPrjFujxcnMQ3cCzrQgWVpP720Wwofl
         gSKtqzLJEP0vcVkh7jtuLbKrPhObOtUy2NB0dCNg9bV4l73dLOGi1sVH4QrDFdDnwSBC
         jG15DkiRykP1ABoZEsjojbl0R0UUcUg27CUUzmYzp+UgqZKP3+p40uYLKAc9ACxBir4t
         UDDQ==
X-Gm-Message-State: AOJu0YwXLd5SwDrW3qWaCq2KuvMYldU5HGp2F1pWdys3cN9laESb7zD1
	e8EK/4jCIIq8K6jnFa0935Hydj+TMWhf8BlHf4DN0cxEB+7oYM85Rz37OgKjCcc=
X-Google-Smtp-Source: AGHT+IGwA4HOL7uVlsvp1kjCWTb91JKo/1LeORoddbW/2pJ14HHZ+nf7vr5NAI3DrM03hiKmtjCCKw==
X-Received: by 2002:a05:6000:1754:b0:357:7070:4fa with SMTP id ffacd0b85a97d-35e0f25c388mr7906943f8f.13.1717519566298;
        Tue, 04 Jun 2024 09:46:06 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c090esm12634482f8f.6.2024.06.04.09.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 09:46:06 -0700 (PDT)
Message-ID: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Date: Tue, 4 Jun 2024 18:41:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v5 0/3] Add support for qcom msm8998-venus (HW vdec / venc)
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Changes in v5
- Collect latest Acks (from Vikash)
- Resend to Mauro

Marc Gonzalez (1):
  dt-bindings: media: add qcom,msm8998-venus

Pierre-Hugues Husson (2):
  arm64: dts: qcom: msm8998: add venus node
  media: venus: add msm8998 support

 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml |  4 ++-
 arch/arm64/boot/dts/qcom/msm8998.dtsi                           | 48 +++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.c                        | 39 +++++++++++++++++++++++
 3 files changed, 90 insertions(+), 1 deletion(-)

-- 
2.34.1

