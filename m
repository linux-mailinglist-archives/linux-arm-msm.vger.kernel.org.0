Return-Path: <linux-arm-msm+bounces-52080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4BFA6A5A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 13:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B710E1892729
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F82121D5B0;
	Thu, 20 Mar 2025 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qdxths+v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE0617A2E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471803; cv=none; b=UdqHU6JyX89Cl9JxvTcbBXFmOY9iQoVorTlJJKRRl79fX+Dg70xOK4byxMfXxZl3Q8ZtCcfH9RzlXY3zSjdZG0ztR2VOFeA9xTm2hukaikjdheXkg7nDmRjkpep4xcg3u8hQoX0RkxRyaduEcpQSDrkcfCo2pzvS5wFFQJsUE1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471803; c=relaxed/simple;
	bh=BMShRTcWJEQSaIviUcz1ALmaZ6O0uj4o+VfvJ359y5E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CocslQuvJECu6/2Dt+S5hhfQAM9fv5KRgaWspDGK1bUymMWyMewwFd0M2mq+FcIM2wFymBsPVxYouwTwpA9BSpHj/P4heEJWMhgdiYPrkTfk6vNJIcqNA0dLmhYRwuV9ct9VCZtwbGXz6r+ancCV5kyv5Z+dWjcKitz3mH8QUE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qdxths+v; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43690d4605dso4247535e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 04:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742471800; x=1743076600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BX8azcuPUPcGmYXdX3K49oOlARId2JPIzgFIvQ9dQ4g=;
        b=Qdxths+vOfIaseJUEsulczxWszpVXnki9fEhPVxKbaTIn84YNKsgTCXEKx7xkIgs8M
         k28IWfLxjLeTRf0SOcTGf08a2AAkb6LdI+6WYWZxkTrekAP57Bsn1qV22PeNscObkjAk
         qZXVfNdMOMASggAZD7FcHcIl40E4bhW9XyT4lbpEC6F+c6+HSI2/nKLoRP/ZURFAVJDA
         +7ZCi9y/hrbqVc5Jc/Fn9hKIBF19eJcoXafVOv1degNtNiwp7+w3qML1p7wkylTgwQa4
         RHx1KHWVZ2QPFaGGpk664pUObT8zcXkAh5f6O1+iQEl5hbqgs/W5w26iy/IDPMK3Q+3F
         ExWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471800; x=1743076600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BX8azcuPUPcGmYXdX3K49oOlARId2JPIzgFIvQ9dQ4g=;
        b=Oh5eisYxMmZUyA92fiULV+KrNZLiy1PERxu+jIoqtn55Fuljiz6T5cH9xxfWMe5P2W
         2n5iGKiNP3i8ja3DbAwtiNW47TfyjY54E7yg/hFAj9pWRCacaKcz2E4nb8Q5WSyqumLl
         qr6pF46q3O2l0K9cO5ytwXZeZkpKC0j9SvBLMlud4l7Gi2u1rm6ZuRBIo/LNorAtxo1g
         /Fbzxi6L3V3/QqlqM+fc4Rhw29L9k8ET2uiHfbcKsD4OxBroQtQNLqDwjj+rGDu8eFA1
         vIO76tgk/3cbSRYBiRtgHv9is9053DmJa/q6qxkAH5E14o3Q/yzyH9S5GfwAnCP4TRRB
         KDzA==
X-Forwarded-Encrypted: i=1; AJvYcCU4KPLku8REljBn2Gk0/3h8/7YRcsKBskoKZw+CwWO7t4tiyTxtFkZl2TGx2KJhFkDWKQmBuUT1ITDGUgQA@vger.kernel.org
X-Gm-Message-State: AOJu0YyIxbV90AjHygE05k8AVHEaW6YBu089YH8IgUtFmFnM8c/g7yFU
	QVW3Gf3rH/GjGS9DHASv8PR53IsNxjUafukgMkTjf97IFk7zvJaUxIvLWgdojUs=
X-Gm-Gg: ASbGncuSMtpAG6AmFVQmGISXKMVLqSg2SQODIO69lSyfYQB2kjwu9dUnqVFG3nut86v
	eb7YasJPGCFRidRH+aJ+BrN75xkFnSiRbsB33x9Rb8CjpDEA02xjEZPu9fuQF436f4aCjN7wF8j
	/Zj94BwTuzR8lBGSro8ItuXf7N65nnf63FmLKoRRVsvMr9nHV/5qt1izbv3FYZVtAqjQXwvNWoO
	y2oqhP9w3Z33TUlv1WfG/q6I/kl5KId5E0UkTBWvlrcadfIFWl7/fzRS5wCvFXcOuZ0JNujI8F7
	y18vMxUxgIPzAn22K/LlMEN/YrhPwKV8+VSllLUZU4UHhNk3fMfL9bEEXadaisvtU5w8Ug==
X-Google-Smtp-Source: AGHT+IFuA3/VMVKcDf3fFvwvPD1gU5PkZBOsrXrba5zDC7lgg5k/5Q4hY20InWuM7OSFEj3sUpm5YQ==
X-Received: by 2002:a05:6000:2cd:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-399739bc8c0mr6784071f8f.14.1742471800069;
        Thu, 20 Mar 2025 04:56:40 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm23257857f8f.44.2025.03.20.04.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:56:39 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/5] ASoC: wcd938x: enable t14s audio headset
Date: Thu, 20 Mar 2025 11:56:28 +0000
Message-Id: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Lenovo ThinkPad T14s, the headset is connected via a HiFi Switch to
support CTIA and OMTP headsets. This switch is used to minimise pop and
click during headset type switching.

This patchset adds required bindings and changes to codec and dts to   
tnable the regulator required to power this switch along with wiring up
gpio that control the headset switching.

Without this patchset, there will be lots of noise on headset and mic
will not we functional.
   

Changes since v1:
	- moved to using mux-controls.
	- fixed typo in regulator naming.

Srinivas Kandagatla (5):
  dt-bindings: mux: add optional regulator binding to gpio mux
  mux: gpio: add optional regulator support
  ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
  ASoC: codecs: wcd938x: add mux control support for hp audio mux
  arm64: dts: qcom: x1e78100-t14s: Enable audio headset support

 .../devicetree/bindings/mux/gpio-mux.yaml     |  4 ++
 .../bindings/sound/qcom,wcd938x.yaml          |  7 +++-
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 25 ++++++++++++
 drivers/mux/gpio.c                            |  8 ++++
 sound/soc/codecs/Kconfig                      |  2 +
 sound/soc/codecs/wcd938x.c                    | 38 +++++++++++++++----
 6 files changed, 75 insertions(+), 9 deletions(-)

-- 
2.39.5


