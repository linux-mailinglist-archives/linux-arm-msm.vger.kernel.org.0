Return-Path: <linux-arm-msm+bounces-51767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D622EA67851
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B4704219E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4711B20F080;
	Tue, 18 Mar 2025 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YIKctc1B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5754320E309
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742313051; cv=none; b=F7Ktj3pOzCB979pveUw0a3KP8SlOYr+wWABh4JaqKY2ruqWEZd6ROdKMutUHmQ8Gd7iiUVe79PdO9lb56lbSwurJYtVCMtX0Wwy0qYK67jPDXMQGhxPKQumsP0sx89gnQ6NP+OQk/RvuTnDWcL60rFtj1qadWpnvGKqZF9DSZ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742313051; c=relaxed/simple;
	bh=jTH2WrbnBbQ+egDlbRSrLxqBvblOJqGCERFwMmJWqDU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YPuj2Cs4J08dH+hsHNHNRihQDqrsKP9E9ILZfzvyQ1UZTAORHNtjpUkQ/aNz5sR8HmzYCc3O6ud2mRPpJlZa2h6p3JMGAz0iijH6YT4Ced/VDnUVmEHdijAtXn8twgXA0qw2dM3TWEvKPA8FNRrQy25lf2hFni8Juu1qUdsUYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YIKctc1B; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso9642497a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 08:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742313047; x=1742917847; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IfvWKJMde9o+IkABs0RI8lpum1QExrCI9eSnJDVH1fE=;
        b=YIKctc1B2YdB2PjZi5CR4YStZfXLUOw2RBCyfShjp8L+8hhDSwZrmlkdA9Sketqcm8
         EC6+4phfJqWrJDuWZwnafmuA33CxAbFrQPyikHNrILm0xkaumu/ZXB3qM9U1SLCB4pH2
         cskOo9HK887f1SF86iJq+52Jqui43AaEP9M3KprlOEb4zd6sf41h/ys4gpObP9Aur01T
         LnoTrv5GrdxyuK597wzV9PqxoVQd0309FvyqyzHErGdwNxb9Sm3BC2SaDkn0wAAtQC7W
         wHJiapNyQaeExkC7H+n3cWHLoJDT6uAHENbXi2l1BzlUudXqXWYp8ubtzH6sPUU1/NwE
         aKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742313047; x=1742917847;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfvWKJMde9o+IkABs0RI8lpum1QExrCI9eSnJDVH1fE=;
        b=gcbMIV2BlHZDXrZIgb/zDviOfVMQozOyN4yX55DaqOoptcX4JBoEXAV2r/+MZKFQRV
         eOvTdQdjLBvhJ6nP6ZDOomx2R+lkhXYvTFFeq3HxfdWSbvLlXGiCFvi5HRUi98aPs78D
         M3FQtDt2q86lLe3Lb8/LAjG5oDCYPY2Bnd3eq4XPUwwZI09m31Cs/orL/+WRpQzsM0+E
         f+Rf6LRq4ZkRySirNc9gb2QGPKfD31jAqhW4sPELrLpOLTWwg5xtPZ8ACBFBHXtV301O
         K4aUPOVn9RrWrpEoXNI4pK9rMQTk9Ko8z8VTeGqEy+dH+fpaZaIOH815M2rK45dt8Ns5
         t7qA==
X-Forwarded-Encrypted: i=1; AJvYcCXZp4A6I9GYlQxRK2jbVp2isIlmCCj5sdgqNNgUTBGTwV0xuw/aUHzADIs/5vrThO3vrolx4234GT9LSEwZ@vger.kernel.org
X-Gm-Message-State: AOJu0YysCw8ocmOeZM3k7VizKjOcnIY4WsTn1Q7q7CWwkY1hvYYg/6Yk
	ZkoXaBxyTst1XSC/gnHXBSMZhTkYx8O5c+l17QzBCnoMz+QI4MoHV3gEdrdxjrQ=
X-Gm-Gg: ASbGnctEusqZiQfoeKOTg1lHvygx81KCyKbkUu/14v2/Ki0e4vhbJghQlpXoEzvatbj
	glVTk20B2Gx0K2E099tLUdGM7rHjlqQhPtmCnkQLOG0+1UIVpyce9lggLIA7aKm7Fdnr33mo9xy
	+M07Tv351B1rwT0T+6G0CPe1/wS7oQY+V7ZTmMntOvrs5JnOgQWly262gkI6EieUlCJ/L2z1gF/
	D4RKPONNR1t/5RVzoHD8/XyqmpVCKpp2JfemRoOjq/kt/PHEgJ6KTgWcYb/yV1xYQHMyEjj7RfS
	TjhafNgtk/JsP6xwd9PfxnhFNcHyOIo9J/kck/ELKFc=
X-Google-Smtp-Source: AGHT+IGoiGaMMvLdvCNbl4oN1jAZOiN+aUxBKf5IrKehClPIdc/Fl8fuM7g07f1BaR9y5WCLJoRqyg==
X-Received: by 2002:a17:907:d7c8:b0:ac3:8987:5ca9 with SMTP id a640c23a62f3a-ac389875d4dmr495893766b.19.1742313047366;
        Tue, 18 Mar 2025 08:50:47 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149d0077sm875615566b.93.2025.03.18.08.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 08:50:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/2] arm64: dts: x1e001de-devkit: USB retimers related
 fixes
Date: Tue, 18 Mar 2025 17:50:33 +0200
Message-Id: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEmW2WcC/x2N0QqCUBAFf0X2uYVdtbB+JXoo92RLpHL3IoL47
 118HBhmNgokR9Ct2ihh8fBpLKCnivrPcxzAboWplvosjXa8KkTUwIbl65ktB7995YTsPyQeZp+
 CX7Cu0cu1Fe2ptOaEIh2f+2Pf/+tJH+x3AAAA
X-Change-ID: 20250318-x1e001de-devkit-dts-fix-retimer-gpios-bed83169401c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=747; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=jTH2WrbnBbQ+egDlbRSrLxqBvblOJqGCERFwMmJWqDU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBn2ZZNfKSUqAC8rhDFUbrmlhH+B9Oczz7Xs/ce+
 v+0PuG1ubeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ9mWTQAKCRAbX0TJAJUV
 VmN2D/99jgLljP/op0bui+kS83hAOi89P4Q32M7a6y+Vh3PqkHIG6ASRNbiZ3pEAhB+foJBBFg5
 8UKI5BEZ7fs3N9RIQKvObMH+/km4kHlFg2A01boUF4pTweeanPcuQBxHP4mUSp2mFFqhu0RWrM0
 eU5T/IC1IIIlVVMrvqJOFkOv9Rzdx+nfC4DWpDAUA8aESw5bDbWlaS6bIjBzwDQZudAUcZfi/u3
 0u0AmPyzz64aO324/laUnYWBB65LHl/2ZzOEwa0VZov/JZ2Tj3ykHdRhUlYVL1UggiBVA3LIj0m
 s29MnNO9Qa/UmQk63C8H9Lhx/zsQge7MJHmLiuNr+bJEDZX4Xn9CILf7uEIRl3MDzGjlV+UoT4V
 8GhUNOwXnA+Eqe5t0V1vvZTgifxxp5foQgEM8rfwIMVt05zRpR75CWNcxQYxO1TInY/lfMaouNi
 7SrjBiurceN1yiyPIvLnJzakahtnWIVWdKVQDMPxTNVS3Y0lkxoLvAolUcPpqMAAKKnZdKq4eTh
 DMNSzsVBHZw2RfuMUj2JaVjawBzVRv8+RtP8QZHSJZB3eMJ4/z9p0Mq7hGK+/0ttnPFPTR33q1n
 MrQkt0bOBsceyT0hE+8NVKBQbh32ul692bCGuvBG+EZ1vXcIbelWa1c5sKf2IcjWtAvKP3YzH1K
 qqN6zR6BtFx5/mw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

These fixes align all the USB retimer related nodes on the Devkit with the
CRD and T14s.

This patchset is based on Johan's:
https://lore.kernel.org/all/20250318074907.13903-1-johan+linaro@kernel.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (2):
      arm64: dts: qcom: x1e001de-devkit: Describe USB retimers resets pin configs
      arm64: dts: qcom: x1e001de-devkit: Fix pin config for USB0 retimer vregs

 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 44 ++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
---
base-commit: 571801ee930e6061456a14ded670006f738d05bc
change-id: 20250318-x1e001de-devkit-dts-fix-retimer-gpios-bed83169401c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


