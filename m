Return-Path: <linux-arm-msm+bounces-49829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7BA493C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 09:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD52A3A84E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 08:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424872512F9;
	Fri, 28 Feb 2025 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="txAlaoK+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653A6250C04
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 08:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732033; cv=none; b=f3e8Ya+tHb9PX3hqKNxcBtTfEByYyXaeXW+AE3th2X1WRzZNUq+cq3sz7VU0dh+BhWE12SquAHnoNARFw+vkEIBeed8FK4iNhoQJ1h4OFQMc60Sk2Y/ZAsItpZPPDfc1C9Qhm+S3K2DhuxoJ+m554SvzCrEnowkXi+3oF5AJAH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732033; c=relaxed/simple;
	bh=oiDvj9QiAqrsM4lotaSywdXXyDCnp/Jf1pacByWrGR8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l5WfaGy6gm61WGthWwItJsvrl9i95Rqj92cdl4aH0p82QkEeLMi6J/HhBI13OR5oyKTub0fZEY8EPeVN4v7+ESZn1+DPt0h6VuHGngzHp7dE/z8Ab3F1++h0Xn13KVVBPA465deaalz4i5uGCmsRr27DeSRx6z9o0deALGqfv/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=txAlaoK+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-438a39e659cso12704595e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 00:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740732030; x=1741336830; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kq3rJW/fr2XEnPhpEsQoySuVKCSH10EmaDpoWjLP0+U=;
        b=txAlaoK+B159lhSpnyPwy9bi/mHF8e876fsf961q+qKUeo9bSrO4bZSa0O21YQb+Kj
         ofDsMcECHHuutoxR2iRBR6PEH5Vvp4aDKhFCN04f+/SaWSm2N8TC99c7MMdhtZ1osDnX
         3j5UNeyfMRvDySmMt1ZLPNtL6dUKJ07zqNm+1So9F7P3eYW2yH3u1qmF4V70wOZdp7rB
         Dbb3ZwnDZJl516pchYwd40msorWHQc2Rq/yiOPDPe4gqskWkugQjkqxYkec0zuG4YZti
         0a4UX7nw7wCdynPJUBZdqxLYLVl9lRien9C1cPEUd2O5n8By3Vk3pWm9kZtzDOdkvLQu
         /jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732030; x=1741336830;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kq3rJW/fr2XEnPhpEsQoySuVKCSH10EmaDpoWjLP0+U=;
        b=Yvh/TWYTtqwt5qP0Xse1ks+Kst1qerLImm6oVGOcunC42fWdy5WQRnpUcY6RGHZOgT
         K2WOABF5Lknm4uJTgHl3M9JUe7rIMmLZ+ntxc7tYiZugxNFEzUy7zfbxqmzqX2ByLF6m
         rsNNswKC3B1fDYfl2ou6rsouPvZO/OM6LIjePosrKlbPrgLU2yt+Ozo9GwvCzByjXSFJ
         FapxzqIlBsaeSUmpnYfpYWHiekWehIRZ4QXhEl7OI96rXZCsBCMGFjdXZSxrIGKWOgYi
         zF0rpXGWETD0gLDjTw/9ew+XfpqMMO3eq7lhElDaPvmoz82rF91I6t5is2UUyW3/RhM1
         LAZw==
X-Gm-Message-State: AOJu0YyoAoszTtNRBl4SevSFvkcz0UCJEKVWcCeVaMC9c6b2gYWC2lkE
	SFF4QLpxp61t8UEy5wQVrYo/cm5XlpBGBxCBQB+wnjti/sZYuFYx25kfjNE+CS0=
X-Gm-Gg: ASbGncvszoa762d/HJ5puI54gHiSxiU5nlmaCG/32iF1rQ5kLghgYppUsipHYQcXZSy
	3fRsBvmBqgDZJ4y3xjd5OMw5e6TPY1K+xXK1VvbqEY6FeZZKpVXoD+gC57kPB3DPw8tHyZuDGoE
	SoeqKuXbXfKbpMSMi2MIl7IBdFeBqkuv0LnsF4UB92FRSMowU6GLvauy8N5Bk7iVW6C0lb/AHYx
	sCKsfCidt0OdA84HKW3GkUqYexaT29bndjLxq9bl4RTpqq7W/BF8tDPjblP97rvZ0eQOviwkDlW
	lIoKqMt7H3u7P7DmiC5h28siHoBEN0voVMiaz0HssTQ7skE=
X-Google-Smtp-Source: AGHT+IHcRlVVDWlnFL5yRxsldf1dOqh+foyeb+BmOlWccboF8iZhG4yNiSE+EiIk6FIftoYh9OXWJg==
X-Received: by 2002:a05:600c:3ba2:b0:439:9a40:aa19 with SMTP id 5b1f17b1804b1-43ba6702c05mr18144045e9.12.1740732029669;
        Fri, 28 Feb 2025 00:40:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a27aa85sm48096605e9.28.2025.02.28.00.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:40:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/2] arm64: dts: qcom: sm8650: switch to 4 interrupt
 cells to add PPI partitions for PMUs
Date: Fri, 28 Feb 2025 09:40:24 +0100
Message-Id: <20250228-topic-sm8650-pmu-ppi-partition-v4-0-78cffd35c73d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHh2wWcC/5XNMQ7CMAwF0KugzBi5CW0KE/dADClxiiVooqRUo
 Kp3J3QCMQDjt/zfH0WiyJTEdjGKSAMn9l0O6+VCHE+mawnY5iwkyhIlauh94COkS12VCOFyhRA
 Ygok997kKBW2sq5taa2tERkIkx7d5YH/I+cSp9/E+7w3F8/ozPRSAYK1qTKEbRWR2Z+5M9CsfW
 /G0B/niye+ezF6zUYiVyR9Kf3jqP09lD13liMhRie7Nm6bpAXGa5TltAQAA
X-Change-ID: 20250207-topic-sm8650-pmu-ppi-partition-1e9df8b877da
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oiDvj9QiAqrsM4lotaSywdXXyDCnp/Jf1pacByWrGR8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnwXZ7AR0NKNkaFUJDXWGfMrlSdTUNmfF2rGw+5dxQ
 TDhJzW+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8F2ewAKCRB33NvayMhJ0VOYEA
 CUXV8mgE4X4QiBkkRoe2rFL18XNvunyxVdyQT0EjEF2SfSnnYit6q0Hfyr1AeoV+bjs61cUgUI1kcZ
 lti7QqN1eR8gZ0gik9dYF+0Lvn1Ts5hptGZ58s5YU9C8vhg1Od8DOnQiEeV6Iasn3vGOzxqHnTyhnD
 k39Vmzht9Fzpa80W/t7zdKNcFk6HBv1PM4tF9RprpiiwYjfMXPTGx4v1jH9DLZUc4s49f5ZpEl78mZ
 ByDe3jmiu7RYnz4OaVVu/rwYX8MY3R+SAUCqtUXAs7VvyitxaisFOcXoFDNRoIVFPf7gmErm8qd5EN
 qeycixiaOGYXimY0IxTJOqeLJ7ZnblY8VdpkWiEbmM2R8rRtUsPtp8yQ0alKRRG7zTWeGWCIXfg26O
 6aEezlv3JNZ83pqMabAYbTVuJze0yQh82MBeJsz5RA4mqIPs0wKPw5pAxq8xXAM8OUHL309PL58ogr
 JARE9aC5Gw9LZX2WDQhar+mvjeT9N1Ht8UVQh5vYg7tiRFMnmjeYtFB78+YNJuLqeEvxgoFonF4wrT
 Cf4Ke760Twd8QLW7Yn6hiitK3fUGuW/pYcKYdESAdiuUH87zNxNWvJ9h0wg2DZS/48//h/1mDvlXmM
 nW8RXXUTt1JZZiSXZQ9XyDZAp9Y3BlPGuz1bVEZDDkVHQBHvk0UECzKjWR8Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Swich to 4 interrupt cells on the GIC node to allow us passing
the proper PPI interrupt partitions for the ARM PMUs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Drop PMU irq flag change, Stephan digged and PPI have fixed polarity and PMU is hardcoded to low
 => https://lore.kernel.org/all/Z8Cza7ZZxy3fbBC9@linaro.org/
- Link to v3: https://lore.kernel.org/r/20250227-topic-sm8650-pmu-ppi-partition-v3-0-0f6feeefe50f@linaro.org

Changes in v3:
- Add a patch changing the interrupt polarity, thx for dmitry
- Link to v2: https://lore.kernel.org/r/20250227-topic-sm8650-pmu-ppi-partition-v2-0-b93006a65037@linaro.org

Changes in v2:
- Added Konrad's reviews
- Rebased on linux-next
- Link to v1: https://lore.kernel.org/r/20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org

---
Neil Armstrong (2):
      arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions
      arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 556 ++++++++++++++++++-----------------
 1 file changed, 285 insertions(+), 271 deletions(-)
---
base-commit: 0e2a500eff87c710f3947926e274fd83d0cabb02
change-id: 20250207-topic-sm8650-pmu-ppi-partition-1e9df8b877da

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


