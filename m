Return-Path: <linux-arm-msm+bounces-25449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4098F92992A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 19:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0028282235
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 17:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5964A41C7F;
	Sun,  7 Jul 2024 17:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNt+GxoK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38B71DFEB
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jul 2024 17:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720373051; cv=none; b=VTrrVjaGqoSAhihY6N9Y3hiqsR2Xj95G6sCcX5MjXsqDGzYM2TGMXJBGB6JnrnLASyTpjonvcWTK0shsO0ergFUb5gX6i2nSFTWUEBFv1DHQY5617hezBey666R1P08RaZZPF4m1oSTxbauYExfjVD5XJAKEF6PvKkNd5yjSUvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720373051; c=relaxed/simple;
	bh=Hx2xM1rqGHMvir/V0U948DENMy/SkXgdbxG8XNPdwhQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=a/28R32dL/G5J4wQNW4QzNSYhFm7xmbV7GOGkBNHVUPqbygZDiVsagdQ0hUEB0+6WWrekQUGxAVIQTsTUIl5AMuVbt4vHRNi5neMXaLnZYlsd9/VBjUFwdcwUQvv4HagSOBkJi+AF742EysQXj9e/u7j4SDZodydWTPTAQzUke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNt+GxoK; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-64b5617ba47so24481127b3.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jul 2024 10:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720373049; x=1720977849; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hx2xM1rqGHMvir/V0U948DENMy/SkXgdbxG8XNPdwhQ=;
        b=aNt+GxoKcigRPuWPivHY+mnnBo5GJGA0nE9QWe/t32DIVbk60tjjs+QVwBiiIF9bZI
         62kOC8s6rjW6ytkJWPcnGCHxxrSdqTeVpsVGzlqp5A6rZd592aY1U9ZVRgaBCFPQF6GV
         TasbfUgDela9iMs9R4FepS/ykIxtRZH6FIfiU9fVH4VaeWcx5FSkeyewWjlnG3n7FPxG
         f2Gc/Cy/MzQn2WdPKG4mUaU4RnGgS/V34NleHMkDe5X7BoKezmCX6hOhC60bs8HRBeFg
         lzObZNkurF2ZKsY0cYBmxqFQS6VnVrHTKEy8ftZCiIe0ux1YhDTsnJfnTbF1MFV2Zm7J
         Q+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720373049; x=1720977849;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hx2xM1rqGHMvir/V0U948DENMy/SkXgdbxG8XNPdwhQ=;
        b=fKtIhqkPqC5pQEku5vrVSpSpIcUXHXp5zJN+gBkcV8iKNXESIAXnj0ODKChqE0dSGM
         OjF1QlEpiIBnW3CWMkOqE/Kw6VMEDiZpomy7mMc9dM8OiekPX30DyoAjTuDKO1s7vlqE
         gX3WpBUFauXeQiS8if6gVa/niRq9iG79gfDnoxc43MTBgEfhkR49BpqkLvhfY2RayABF
         d1cYaLp6ADHC6ZNNiH6a5IdTq2GE9rIQxWLjqwS8I9U6n/oK/F49ndQP1vZ1MM1IoPZR
         pT390n+cgOP3z2hFxwDJ0jO/C8N6oGcSfMZcAyWeYEjawqMgxd41KLZAmxsUDOvOIkXo
         NYww==
X-Forwarded-Encrypted: i=1; AJvYcCXKXi6taQcKYZr0kBE9K6lCdyv2nvEbZTlGr9k9FrpmFAcXhRz5lX37z3s4SjA3AyOZCR2khC9Pb1y8cNeC4ebfZL2fIqM6RQlGX1lXgQ==
X-Gm-Message-State: AOJu0YzRGMCyn9vSpOyDStZ3ABngMpvuYbwp3EbHB7qy9oKOWpzvA9JS
	Wep34o8n1XXiXapqtLRSZpURcOONs3MrfXTHuQ8XTTdIwXB9QAiOfp3AXAYZHnmWUoungERtF1U
	JnTeq+tNhu9IZMUcrA8wnl6uUEmGC4MYCYag=
X-Google-Smtp-Source: AGHT+IHHYn2FQi9vOvfTfC5QSAfkJxOgfmkEfW/y7UcNAv+LsU4FB4ia5IQykmBinzJqEwyWDHY83qYkb+wM19wu2HE=
X-Received: by 2002:a05:690c:3511:b0:651:8337:f094 with SMTP id
 00721157ae682-652d5dfe018mr97451947b3.21.1720373048814; Sun, 07 Jul 2024
 10:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Murithi Borona <borona.murithi@gmail.com>
Date: Sun, 7 Jul 2024 20:23:57 +0300
Message-ID: <CAHCJQqFdDRz7ZyxoeDd1FLu-yjCCHy=Y1Sq2wMDFFH12G1625Q@mail.gmail.com>
Subject: [PROBLEM] bus: mhi: host: pci_generic: SDX24 Channels
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Module: Quectel EM120R-GL

This module does not appear to work fully with the default SDX24 configuration.
It appears to be another variant of the EM120R-GL (Also FCC-Locked by default).

Issues:
- Debug ports are missing (AT)
- It only works over MBIM/QMI with Qualcomm's RMNET driver.
- In QMI mode it's really unstable and unpredictable with the QMI port
freezing up.

Are there any missing channels in the SDX24 config or is this a hw/vendor issue.
When using Quectel's drivers (and blacklisting mhi_pci_generic), all
the ports are available.
The configuration for other variants of the same module brings up the
AT port ( with a recurring warning/error).

>> [ 5074.472791] sequence number glitch prev=1 curr=0


mhi_qcom_sdx24_info
==================

lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
Inc SDX24 [Snapdragon X24 4G] [17cb:0304]

ports: mhi_hwip0 (net), mhi_swip0 (net), wwan2mbim0 (mbim), wwan2qcdm0
(ignored), wwan2qmi0 (qmi)


mhi_quectel_em1xx_info
===================

lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
Inc SDX24 [Snapdragon X24 4G] [17cb:0304]

ports: wwan0 (net), wwan0at0 (at), wwan0mbim0 (mbim), wwan0qcdm0 (ignored)

