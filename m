Return-Path: <linux-arm-msm+bounces-67220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0920B16C84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 09:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D533164BDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 07:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886D229DB92;
	Thu, 31 Jul 2025 07:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T9KgxBo4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C93824DD1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 07:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753946167; cv=none; b=hIu3o3XpqlTZ5AYPQriWK6SNw39SrOuaxYJPN5tn1zhsM2FAdmrM7Lwh6WvE0cRucFq58r4PTpynK9r7B9zWm+ojS5+o8H9yxb4CFaEp26Cd3JY+eJfFBvH5ESTeMY2ktiGSmieMZcJ3t18J+s4wWCn6RWN7NMLHkMkGjyThIDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753946167; c=relaxed/simple;
	bh=XaOUtYSONJrTy0Q6bEJNjC5S0oSCG7wZ1egPDTT29Sk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HyJ58gHC5Vveu+0C8ZUpOyHPr2fKGQuvF/TAd6U4Pf3HbOQO8NEMpLiXvcTjAErEieJRfF4xhNeVg4cb457Hqrb5CT2JWYbVKl61VJv/XM0pZe7l1U2vFQazsQ+pjLWUcaIchO4xdwpIg1VmzWa/RyyuiR1l4WDO3oJuY+Wt17E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T9KgxBo4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b78110816cso14351f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 00:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753946162; x=1754550962; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3p1o+9EUHGsPhY1wwdj7Mm5g/NuTdzZcqkBi+ANheQ=;
        b=T9KgxBo4i215pLOmoirrDb4K9CR4evkAxpUpIL1z175iY9V9p2sSfhKmtz6H8IuiRZ
         FXf5ULhvhWDyVlYhTu078gh9b8vOE9+l5DOkgzsPQQQGhmuuw0fbVgCdcE4NU1mtf8d9
         HwQbjRxpyLFQ6AvtD1tWofs2xKgk2hjG+p4pq3TuE4MmLG/Y1kHJzTFeH3uyEdBpU1vB
         xdfs27UoNqLOJ0f1ljPQQP5vyT15kPvh6v9bb+vmYS8qHTmS10+xQFZXM3Wl0FieULi9
         u4cj8hSZP09kXSNtPY2KC6Y5oObfW9x4bw9fB3N7Pl37Gw1Bbjjh+Up6De9PXAG0TYkg
         UypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753946162; x=1754550962;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3p1o+9EUHGsPhY1wwdj7Mm5g/NuTdzZcqkBi+ANheQ=;
        b=byojoFjto4udSLDFMrV40YondCkUniyDQBzZDSH49j7SIp3liziwU6TxFcts8Q1sVX
         SeVaLJ72vPrQ+gaJgSugNGqHawKoI0nG97C6RDL75xeNjRTAe4cH1d8n6Yb5Klc/iT/1
         aQrjnloPEbs5wVaeyb7NOoCGa7SeWm3bhC3DMW+VTMfeDiZ0EYATx1RGOVTP1OIdd3LC
         bQJCVD3WmGkcaAHrgz9LILuu38mQ84jhwiOgGzb7opD6fFGP73tOIOUE0SRAaYHB5Z4w
         2AVPRlOA4fJdWyWvLO9DzWroLsdS53zEWp1G155cZOEShd3OwwcSGlaXUIr+FBBkYOeT
         RgaA==
X-Gm-Message-State: AOJu0YwOsrl4O9Envd3b1GTU+k25NRIR/Byq+XkWL3RZ7aggG6KEHUT8
	IBWf/AfMOWLDpFzpSw1gc6fVjyQp73Oj9A7Y9TtoDEE/BtgJruvFDPMvAF07ka2GcE8=
X-Gm-Gg: ASbGncto5lQHE7HQF8SS4lvfqmy0STGDz/5cLCzPwNbcV9G2ZV8k6JOAi2PzzcJGgvl
	Ofn5BxAfQVqj7YbZ9CeMWuRcSTK6u3GF5BXasdDJmE1OxiZ0rfJa4VTkvbz8zimB6KLYfI6w/wq
	O277CP/zvx9mXAlJ/YJrHAdNo9ygu/ff3Jbus/oO6A5CjHokZ43vuGuQri5uHtQxil1e2aqxop2
	aGJpMqD8plTPknQJoGPtU4ZFErEMgIabElSxGva76REiqaL0nzAWHbeyuZpQxYJ/JtoAHrcXj5W
	aE16sJzS7f0qSq1AQNbv2WhSVULyA8+2yUlNj4xy4VzVASWIA198KHnHmUgtHGiKCwH0cgsAXu2
	JyudBucHBzICbeWItRyKNAwm5XYdM+GFFHRaqSi0=
X-Google-Smtp-Source: AGHT+IG1Le3YFSl8WgpQdlVnifZaakoaYA8N7HkzTkmvAh1UT8hZ35WzDec8WEmxrqpJex38HuvlLQ==
X-Received: by 2002:a05:6000:25c6:b0:3a8:2f65:3751 with SMTP id ffacd0b85a97d-3b794fc07d6mr1912873f8f.2.1753946161762;
        Thu, 31 Jul 2025 00:16:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ae8esm1353483f8f.61.2025.07.31.00.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 00:16:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] dt-bindings: ufs: qcom: Split SC7180, SM8650 and
 similar into separate file
Date: Thu, 31 Jul 2025 09:15:51 +0200
Message-Id: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACcYi2gC/4WNQQ7CIBBFr9LM2jEUbWpdeQ/TBYWBTqKgUImm4
 e5iL+Dy/fz//gqJIlOCc7NCpMyJg68gdw3oWXlHyKYySCE70R8EmgUn9oa9S/iyCZ863HE4iX7
 oaDJCKajTRyTL7017HSvPnJYQP9tLbn/pH2FuUeBRkx6srU2jLzf2KoZ9iA7GUsoXIaJ0LrkAA
 AA=
X-Change-ID: 20250730-dt-bindings-ufs-qcom-980795ebd0aa
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XaOUtYSONJrTy0Q6bEJNjC5S0oSCG7wZ1egPDTT29Sk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoixgqj+xe3JxFrpHLF3JoW5lg0SDN4swxJjndp
 vFEvLIebYmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaIsYKgAKCRDBN2bmhouD
 1wXdD/sEl+GBP50e8xDxLCS2Atjz2u0E/kZjptL2U97ecet4JClxa4nnnp9S2MMiS3tyQUQ8ctz
 PdKoOXtuVgdt4dXPebEWt61ZA2AOJA6qpkdHZD3CXgFsJy+E8kKXR3keaPX/D+YINETziKRIA25
 VZWs+CHpYY1KdKoLrA/C2Gi0C59/O5p1tLVyeLN8/P28bM6cf+GXn2HmBMvgzvcQR3jBkEftbnT
 0jRlovAAnyIbuLDPaCkDhJNvtWhYiYU9qrukcm3mkAwqBqLzJUMiOZ/HWsBcFym/5n3GCvEG5X7
 WkYtgIWtiviY+UuW0O23JAgoootPhVUwMOxQdghRi1SF2PwvKQJ4Omr2mG7A3H/kY8tToF4XNZs
 J7D39W8Smb7UgS/BCfF7gSkwKgxB6/M4QutDsSXp70cQ3n1K50+cZx+lqBLXtIYIw+hqlyOwOrM
 eIOwn7WcwHpbIjONTEaJJ7dgdcUlrvA3ACOwYheC5MrGGXscZaERunn+uQDOl7Hg1muI8JJtI0L
 qXMhgB6lQ9xpOpEQSGz9R5g+yUcwT611m/uQGmu3xFN26CK+99iQLiQ8TOiTWbxYclR8tSJjXCn
 Bxm2K/pQQWR60A3yvf5oTFnk7s5i7JYm0UPA+4es66mALgWAI7kCfG0BECLNCxGMK598n4f3wFY
 TcE9SHT17brJtLA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Patch #2: rename subject to SC7180 and include SC7180 as well. SC7180
  has one clock less.
- New Patch #3: Split SM8650 and SM8750 to their own file, because these
  are first variants with MCQ.
  Add also MCQ address space, to fully document the hardware.
- Link to v1: https://lore.kernel.org/r/20250730-dt-bindings-ufs-qcom-v1-0-4cec9ff202dc@linaro.org

Description:
The binding for Qualcomm SoC UFS controllers grew and it will grow
further.  It already includes several conditionals, partially for
difference in handling encryption block (ICE, either as phandle or as IO
address space) but it will further grow for MCQ.

See also: lore.kernel.org/r/20250730082229.23475-1-quic_rdwivedi@quicinc.com

The SM8650 is first SoC coming with MCQ, which was missing in the
binding. Document this as well.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: ufs: qcom: Split common part to qcom,ufs-common.yaml
      dt-bindings: ufs: qcom: Split SC7180 and similar
      dt-bindings: ufs: qcom: Split SM8650 and similar

 .../devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 167 +++++++++++++++++++
 .../devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 178 ++++++++++++++++++++
 .../devicetree/bindings/ufs/qcom,ufs-common.yaml   |  67 ++++++++
 .../devicetree/bindings/ufs/qcom,ufs.yaml          | 185 ++++-----------------
 4 files changed, 446 insertions(+), 151 deletions(-)
---
base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
change-id: 20250730-dt-bindings-ufs-qcom-980795ebd0aa

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


