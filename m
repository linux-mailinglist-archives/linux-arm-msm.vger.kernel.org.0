Return-Path: <linux-arm-msm+bounces-25621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 268BF92B929
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D53A1284C45
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F7A158DD2;
	Tue,  9 Jul 2024 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lTyz7OSJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D751715697A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720527535; cv=none; b=bt6RptfbY7RgaRlTje81TRfjPA6YF/zI5CVSA6czgbHwAxv4NA7R6hcI0Eqxdu5su7reuVVVlVA6o2fIyLqTtK/b2WyfT38ejjYPg31Q/qnzmMXQYGFvQzNfU7ijiVb33s7tnvWL5AKkgfkF84WQxPFGA+mi2yMb6jS9Bn88DJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720527535; c=relaxed/simple;
	bh=Pe0nuXqG3qP9nLPELvk5z3cBGnZDCYSeoDY6GZpeOIU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lzLoNeOF+2dUmqxFtbUUEfkyeM255/zdt1e7Imie4ju3XjpbeZYTulw8kTOJFPSe1SzuYpvwUNeGXNhP/vB3nsV0XlVDc7Tyv82CzIALQI/jfyub9mzLNuRNX7dA13hOWJKniBtu+oT1nPSo1rgZGhlPWVvtvg9Coc3q9y5m8ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lTyz7OSJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4265b7514fcso20983215e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 05:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720527531; x=1721132331; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ysEM+hrdKThykp695zr35/1x4O4LVJPY/Rqf0Bmph5g=;
        b=lTyz7OSJyg8ev2XYo9RRC+daZOa96XSQg8GdTdVqzGLfm4T95YEM62wu28NkJS4ZAB
         UJeUc1HQpdW84UhFY9JR2NWozVmizZZ5NET4Gzj+BnUTcypbFhEKMbPr4/svnUJ0LrTH
         /bHKyi16pfknTefc2mKlCtkk5o59v2t4VsZny79tqnYUFzeYkPH8XesPt1j2XQSONuvr
         uMNR4C31VOUfSG6Ldd1ExCoI5SJfdtjyoKoJGKb9ITJ6a2OkcqtAw0l82DC0BQCzUIqS
         Cyt90lVIMEYsfA8A8VyDHH7MtC4WISFppIvylWzVzLpCpJdOBfTESBuB0+weJov/lnv2
         OS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720527531; x=1721132331;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysEM+hrdKThykp695zr35/1x4O4LVJPY/Rqf0Bmph5g=;
        b=oPyHIDVXezC17pmtICIl0mO03iriWAtrrMbGj1cSd9CLe3ZSBSabEwacvzeEShoHhX
         ztpXeDhke1TTzmBpFQsdVz0Hi5I8UDH8J7PMa3qxB3526BKYrw15SJoy45wZZ2OrEgFz
         OLfZpcdY0ouq5tzGTQ+FyGvfKUcLxow49W6d3ePzIZZUCyzEa8jgryUOqICfId1pfXdV
         coub8xYknCxZ33fgoIYldUS6xHbxa+6bCvy6Toi3+LJUJO6fGGHn8yHXdKrYLN9798j/
         y2fHoWLB3t3RxemArA+xjlZNQmZXENJC2MxMp4wx9xT5RZcvyyEeZRc2vNcnGluUT+Un
         l08w==
X-Forwarded-Encrypted: i=1; AJvYcCUfEIfDpgaD3VKJMOpI8WpuR1YcIc6Oa7aTVbnbeZ1FvhcYzEZ/oEO3tHRlRpfQghOBk9TV3kvKEwb4zlTbfcD2LdGAStmEOaOhSUKw1w==
X-Gm-Message-State: AOJu0Yz5bipa0mmiDcIHjQE0ePtjwNdPGFAn97RIdikIRntr21vnIhPp
	8A/5OfR9iTmbx4PSXIKhlNmbvXVcvO2LQqrMbNqm2u10FFS8kvCv6oF0ueXhu60=
X-Google-Smtp-Source: AGHT+IHZqA6anEaUxvluLqhHtquDSAPfFVSC6AkG3YhqfqCYXbLaosYjdF2vSTNVQn0Mv12gBK+1iA==
X-Received: by 2002:adf:fc90:0:b0:367:89b0:f584 with SMTP id ffacd0b85a97d-367d2b3bfc9mr1848241f8f.11.1720527531141;
        Tue, 09 Jul 2024 05:18:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c270:70c:8581:7be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa06d3sm2390574f8f.75.2024.07.09.05.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:18:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 0/6] Bluetooth: hci_qca: use the power sequencer for
 wcn7850
Date: Tue, 09 Jul 2024 14:18:31 +0200
Message-Id: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcqjWYC/23N3QqCQBAF4FeRvW5j/0ztqveIkHUddSBc242lE
 N+9UQiKujwzZ76ZWYSAENkxm1mAhBH9SEHvMuYGO/bAsaXMlFBGFMLwwWF9c7YO0Fl394GLohB
 QVVp2jWF0NtEGHxt5vlAeMFLtuX1Icp2+sfwXS5ILDsoYJZV0UsPpiqMNfu9Dz1YtqU+h/CMoE
 poDlLrRrXQ2/xKWZXkBGCbsA/MAAAA=
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Pe0nuXqG3qP9nLPELvk5z3cBGnZDCYSeoDY6GZpeOIU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmjSqgThn1FoQ2q1tql7cHOyBujUj6JtZWCp+i6
 xYbJR5eBPWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZo0qoAAKCRARpy6gFHHX
 chhAD/9xRk3Cmaivt1EJtu/W+mojaURn8DrdNpKpDqfOH2VUr2ykQ19WjySd1r/gC1NHxr6Nj2Y
 EnvUG3oP8bZ1yycrJ9XAZAM6dZO8L6+W16idVDVNPczf3s97yjEyylp4WTDwy0RuqfQKxD08xDH
 RKxrmzvOWd3pGWHbMmkrA+mvYQgxMoBXxTevQifWaP/MMyR2BcOGHO26msrbF4CO7i9N/EfDONH
 VM16aIhq0G2SpAXAdmJRTAlKGognvkSesaOHoEhgQhvAs45J/hYPjoryW8K9B7MBQwH9+xCBMwy
 IL9jIe7Rx2OILaGi0xsIqE6xFVM8RBwOtybIww1irIVDG9nMlEKCpie06L46gJsT65YOCzkOV1x
 ldVbjPIkU/DMOgsHdhbvezXoQIbDUeQH1gIQKJ2Ph3BTm/lGp7jQpKdBln8wMs9HgmV3cy8JAAe
 DNTeS4WLxHHKB0HSKwuXCiW0NuzJ+RnVei5IjhEe/52pJyrivJOfpRAwTq6sc4jxhPXAbWzJAiE
 shZSmhcblYNYG/gkRCp+/NVLrIQrGaJe96YZFGE2ivqU7S6haSrhNtpW2LlAx8JpNrH0W9J3IBD
 kYhXURpuImkJVbRRCq5czJPrhst3nDOWP2Dvvrpg/hDEbETINOK49IonQTK0ndBu81Fo/MTNXFK
 70VS4vDxmhe1zbQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The following series extend the usage of the power sequencing subsystem
in the hci_qca driver.

The end goal is to convert the entire driver to be exclusively pwrseq-based
and simplify it in the process. However due to a large number of users we
need to be careful and consider every case separately.

Right now the only model that fully uses the power sequencer is QCA6390 on
the RB5 board. The next steps are enabling pwrseq for Bluetooth on sm8650
and the X13s laptop. To that end we need to make wcn7850 and wcn6855 aware
of the power sequencing but also keep backward compatibility with older
device trees.

This series contains changes to mainline DT bindings for wcn7850, some
refactoring of the hci_qca driver, making pwrseq the default for the two
models mentioned above and finally modifies the device-tree for sm8650-qrd
to correctly represent the way the Bluetooth module is powered.

I made the last patch part of this series as it has a run-time dependency
on previous changes in it and bluetooth support on the board will break
without them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v3:
- Add a missing break in a switch case
- Link to v2: https://lore.kernel.org/r/20240708-hci_qca_refactor-v2-0-b6e83b3d1ca5@linaro.org

Changes in v2:
- Fix a switch issue reported by the test bot
- Link to v1: https://lore.kernel.org/r/20240705-hci_qca_refactor-v1-0-e2442121c13e@linaro.org

---
Bartosz Golaszewski (6):
      dt-bindings: bluetooth: qualcomm: describe the inputs from PMU for wcn7850
      Bluetooth: hci_qca: schedule a devm action for disabling the clock
      Bluetooth: hci_qca: unduplicate calls to hci_uart_register_device()
      Bluetooth: hci_qca: make pwrseq calls the default if available
      Bluetooth: hci_qca: use the power sequencer for wcn7850 and wcn6855
      arm64: dts: qcom: sm8650-qrd: use the PMU to power up bluetooth

 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 18 +++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            | 28 +++----
 drivers/bluetooth/hci_qca.c                        | 87 +++++++++++++---------
 3 files changed, 72 insertions(+), 61 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240704-hci_qca_refactor-0770e9931fb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


