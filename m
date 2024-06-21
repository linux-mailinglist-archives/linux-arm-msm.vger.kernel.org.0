Return-Path: <linux-arm-msm+bounces-23535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E45C1911E5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 10:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99FED282EFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB04316D4C9;
	Fri, 21 Jun 2024 08:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kd6bk43E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C9D16C6B6;
	Fri, 21 Jun 2024 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718957678; cv=none; b=IPa25OHfkisUb2FgY4x8Qp/8y3CiOUY2LpF5ZsJwzfThJuMvIJk0auLcuOS/FyPToVThjTq3k3RNwf6IN+3Dybos8go6/gsUolUrvBgn9pls94JAdQd6gV8VVKtJyJyv7hn3C+EKXCmMzTdh2pwhtvRUGV2FNDaTbc+rKV+SSq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718957678; c=relaxed/simple;
	bh=/Uyy3pQci2MXkt89qFjkRpa1IH7Yt2lCLlpNRNBBiX4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KFMR0lWZaV0RgDiNoAJkyji7i5bcKRzApt2PzgJ0P73D3b6wcZsDs/Q1XUlQiJs6tmA4xazbMdOKob1ih/af1ynXMj1LcG1599PHurpCfg5YNaOnsGs4V/rzI6n1wCO6Dag6+kCsPJy9CY7S1rgkm0zwHFB/jTyO17Y7EEVIeDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kd6bk43E; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52bc0a9cea4so1544725e87.0;
        Fri, 21 Jun 2024 01:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718957675; x=1719562475; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Nf4bO4wbTUzhPssYWeWjAqAYft+Z8O6obVle/mFFKg=;
        b=kd6bk43EtCvoZYOJPzrRZoncdeMq+5gLAcNyj58tc24ExP7e35kOw93+V8VG9c6LfJ
         OfcVfHAAVC9bjkiLYJqCu/Sx5xyXFHYJj9mg2WRExQVANBGIVGb5+IrYObXcr2lig2Qi
         MHSPIcpmMsbDaQC+XY21+gOXTmvDw/82G1Tz5V6Vo3dawUxdujnRVp52zfDPaUtTFtSR
         vsKrLVUEbI1OvLkkH89/6uLljFMC+nckJlUtVm9y8WJWR8QQmALD3GdUyD7L7pdnO4vm
         udjOPpkUc3pV+D4a/WCBqzoG/YgJMi4Opxxcj/EVUsfX/IgEvWRnFF7v+vq4ueQTzYyz
         a/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718957675; x=1719562475;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Nf4bO4wbTUzhPssYWeWjAqAYft+Z8O6obVle/mFFKg=;
        b=QNFvpD/M2KbgLeV3zvz4bep/mpM3aHqYKhT8mzhkOS5etjw6+fhAyZJm76wT26hs0Q
         91bQdK4skscSbLmPTt9t0TMCsSep+YpAUVFlpSX4dDmogF66Nelj8lbSQqnWv0XanjOl
         gsJ9kNmWHddivlyecpbW/6xoCJP4dpzExN6RjIrV5Oh2NAjl+TZaW/7c5N5Xifi43BQs
         YvWHxHLKRkuWhR/I1TiC7wq/3Yx6al+Sb9J4Qs4Ohq6AiwgLDUT7IFXmF0PRwOmDae7k
         GfWLKa99pYymhAW0OxUtGFjgCNvwuI7l97Pb0AWYP01bai/zm598xcW6eiUmhI1gXsCM
         lZrw==
X-Forwarded-Encrypted: i=1; AJvYcCUeCspf4r66xwBO52qoclDvUV7HJyY/f6KnJeH5uA/GYkd3MYHTFtv+A85yVNdMhVI5cia/G+7evywjUva3VrWUxSuXMe/wsfzEDUzAkJXoeXDQEWL0xAKDHor7+HBvQq4e0ryuV2ij6WQpQkZ6sjCQfT7wsKHl2ysH/sd/4+oKRelAPpfX
X-Gm-Message-State: AOJu0YxwtaSPnXgkN8Hvtsqv2zgc5mosK3t3hNxlO3+5yfS8+dyD7WST
	9SNP6cBSPNepWLjkJzYFNns7dj+AYvy1eQMd4kI10mNa79SiPrAsR8opNAEFlxw=
X-Google-Smtp-Source: AGHT+IGIamlZM3U5HAK5lksuXjrRdqPqT/iL3gSFNc3UUc8sJdWbuQRcNL1bu5NwQbCjFJqJqO9LOQ==
X-Received: by 2002:a05:6512:15a1:b0:52c:89b3:6d74 with SMTP id 2adb3069b0e04-52cc47cb6b8mr3703618e87.6.1718957674417;
        Fri, 21 Jun 2024 01:14:34 -0700 (PDT)
Received: from deepthought.lan ([2a00:1e88:40c0:c300::729])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd643e419sm125548e87.243.2024.06.21.01.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 01:14:34 -0700 (PDT)
From: Valeriy Klimin <vdos63@gmail.com>
Subject: [PATCH 0/3] Add Sony Xperia Z3 Compact smartphone
Date: Fri, 21 Jun 2024 11:14:45 +0300
Message-Id: <20240621-sony-aries-v1-0-bcf96876980e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHU2dWYC/yWMQQ6CMBAAv9Ls2TXbBpvIVwyHsiy6B1ptkWgIf
 7fIcSaZWaFIVinQmhWyLFo0xQr2ZIAfId4FdagMjlxD3hGWFL8Y9gabcOlZyPPVDlCDZ5ZRP//
 ZrTs4y+tdn/MhoQ9FkNM06dyaxZ8tYWYL3bb9AJJLk0mJAAAA
To: ~postmarketos/upstreaming <~postmarketos/upstreaming@lists.sr.ht>, 
 phone-devel <phone-devel@vger.kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Valeriy Klimin <vdos63@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=919; i=vdos63@gmail.com;
 h=from:subject:message-id; bh=/Uyy3pQci2MXkt89qFjkRpa1IH7Yt2lCLlpNRNBBiX4=;
 b=owEBbQKS/ZANAwAIAQ4Juwrzgg1aAcsmYgBmdTaLSmqXjHavP6YS6sKJoZ8Ofmz6g6k+2uP1L
 9QswjjPJwCJAjMEAAEIAB0WIQT/ENLr7ksLn/+UbhAOCbsK84INWgUCZnU2iwAKCRAOCbsK84IN
 Wuo/D/wLsFP0K8AyvdA8avAViKxrqNqVtiNI/GpjPLu+oOzUEdIj6f1w/HgZJ8jSzprV4J0ZCUd
 Y2TXHxN8vlmHizCdS8/Vp5iz9hRZKyahvzFvRfg7OzFFd0c+tQ3S3YwKMdIcv/KAcXxh/AKVhYq
 V71l8mzRUoYBIzH/2DmbgfyOuY0m/jfzUV7JZ5JXtnDZGKZfrqx04PXkax1wcn+JMqJvnH6MTnX
 UoEPwqwNQ1Vvu2D+WCwSzE1emZ7uK3Rqzzx/Y+zFPuXY5s3ThDOSFvBryTN7he3ScXR3fUHTxcA
 LMyjQXdntBJ9q7wXF7oHweJkzVk/ik42EL5X2P/lJi6GBK0LBHTsXISqczADMWLy2NjftYxkq6N
 NOot92DDVu21EZM2cBCrBBMqflb2iBKpMbl7ITu0DS7ZQPBBQbtOHE8Die7J8U+5YPDBnrhpTFL
 b4qD3kcEIp6KVxlcUbvWp7zCP6cjjAVxvbF4dcEglFMeljTaz/A0EKMBgjGAezVI2+IhO1limFx
 /giJAlEMejfU90EgtrA/NZaAAEOHxVSx8VHGnH51eksdfU/BrXAGpI5ty9W7K8pmw3YYlQZzR+B
 I2ahppwMUizPtV2mh91jQqKa6vLPTuR3AsnPHRHEr0P6t1aXHgNPUUt0cIvm61UTA5jKRNhWO8p
 St/F45axuEqMT/A==
X-Developer-Key: i=vdos63@gmail.com; a=openpgp;
 fpr=FF10D2EBEE4B0B9FFF946E100E09BB0AF3820D5A

This is almost the same as the dts of the Xperia Z3, except for the
battery charge limits. 

The current on the l21 regulator for shinano is also bumped up
to stop SD card errors.

Signed-off-by: Valeriy Klimin <vdos63@gmail.com>
---
Valeriy Klimin (3):
      ARM: dts: qcom: Add Sony Xperia Z3 Compact smartphone
      dt-bindings: arm: qcom: Add Sony Xperia Z3 Compact
      ARM: dts: qcom: msm8974-sony-shinano: increase load on l21 for sdhc2

 Documentation/devicetree/bindings/arm/qcom.yaml    |  1 +
 arch/arm/boot/dts/qcom/Makefile                    |  1 +
 .../qcom-msm8974pro-sony-xperia-shinano-aries.dts  | 44 ++++++++++++++++++++++
 ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi |  2 +
 4 files changed, 48 insertions(+)
---
base-commit: cd214efd16e30bf1aa40ccfaaf9177f47dd21fd5
change-id: 20240620-sony-aries-4a5bce06c91d

Best regards,
-- 
Valeriy Klimin <vdos63@gmail.com>


