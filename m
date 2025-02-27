Return-Path: <linux-arm-msm+bounces-49649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D145DA47859
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75EE4188E372
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 08:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC9322759A;
	Thu, 27 Feb 2025 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qEKVX7GU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD62C1F16B
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646535; cv=none; b=fYyj/F9BATKX6sPlNx+B3Cx0VpP0ABui4QvoFcpuqtp4XpcgSNewLX7fsBc3xC41nVpUnAyxcHU0IioY80KI0tjhN2MXD+duSy7SdZLMclqqA3JHjFurZVGCxPqulFQG3czkL9QWYIeyy3fYgLDdV0mhel7Ot8AQCRlWzoUfMWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646535; c=relaxed/simple;
	bh=qNgIC2FnRrugkxHLXlWczBYeMHDnrxLnYyjDzOh/e/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g4i25+OdoiWfNsnwBDrKarHSEptqjN6HcwuYMjTBeic9pQWHCN0D2UoKLc7jEhQ4JOtZo4MRK4mwdGb+qvE0B81wnv/982ZO7n2TNrycF49YXeuawx/w+S/IS7CylwAInOBnAty/UT52TxWDkOFODGeOf8CZqfNxZFcg0kkDfsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qEKVX7GU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so426387f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 00:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740646529; x=1741251329; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JLtDbzo8LLREI5D8Qr3j4PdI+2XrXz7vh87gZyNjgzc=;
        b=qEKVX7GUBP1HRnOll4pTEal87HOSzRCMw+hwiwGt1K00ssljDAxchLl1n9ziCIZYLM
         WY7PThUeaCfVnis96gj8XfRjtqFPFSHCnf5RQ+nlOBsKgXdxlKEajfGZmGgGus6A7waS
         UX/A2FOho0B4hpqsWirScijqkIMGS5C41I/mK95ZskZOb67UAa7CCi0mQ+vj9Ba37kpm
         gPSJLT8rAa4cw32n37u5liX7D+PeflfdwxtvSlvVQrvw7Ll6T9WHSTZRd4Y5HxwbS7Wm
         Jy4PxKpmT2Ixqcjq+YzvqJi7/YqlMHni05uzbIs4Ahvnp9A1Km3zU5g5nIaU0o2TOWwu
         Ondg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740646529; x=1741251329;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLtDbzo8LLREI5D8Qr3j4PdI+2XrXz7vh87gZyNjgzc=;
        b=wg5K8dMeXFnfWUGupa1LDQj6pBexoowZ84BRpX/n81xLKBGyv0i8m490o0wHYP1phn
         nhtY2KfiDg3WuWLKVmDQlGF8sUaTracODQTGZVPgt3ugk59kHl68NaScsn7Nk1tNvuIP
         GJmjmYoGDJyo9rEqJBX2zqFOTxaRnP08y8BkaWebFsITbR7+34nYKOzIFA8i/SrrHjG5
         63OAKy34piKaZZvM8NMmiwMo+PxIycfuGHwP3IyG1MM+0hcH7v33jgjFkslSWaxs/DNI
         u8zn5wHeTt51+xUkWvWvMV1Wu2sLdOMwpSTt9OwSv7f8oqLsGW5i00lFxvtuyx0W/Hdq
         gtoA==
X-Gm-Message-State: AOJu0Yy1pPUhU6KM2ZjVzuxq145yTIGwHNdAK+CjsWsGORZa+Y5Otd5K
	kqYTOi1LOJ3ZnzNNbhg9+ngmIRfzok7AO7OIPl1Zn0MNHm+oZqjYTzMTADVo0QE=
X-Gm-Gg: ASbGnctQ5C312aVPKYjJ9OryiSNaQyvi2Mm3M+2Ei5nEjy8oKPGnMFUZvOnlxUD2j9V
	zqOdP6kwnVDMWEM81Y75b/2VT+HTx/TjIQnR8ghEsRUkL7b5L58o2RrBeSNVimmIFODJzImX7Re
	dIBh6SapD0ND0nCYcGIBb2GGmg/6/H/AgrJOiPYphioB3pdXFxyHRPMPkYFnufzpScta5YPR/3s
	MhEfWGNS2IBy44+UGN8gI9g7WrSzogIQin5iNTfodIez8TPuNNr6b7PoGC/daR5pjauMdwS7Sd0
	6q7FOJiOXsp3uj4m2wWnubS10//te34VuwbRbA7Uh8TLfqk=
X-Google-Smtp-Source: AGHT+IFGyBdw1uN4kO4fZf28YVGQLgfiFXm1KFszTDlzXhERuKneFgreFOn3bqFSMrBt8fBlJvhmsA==
X-Received: by 2002:a05:6000:186e:b0:38d:e572:4dc2 with SMTP id ffacd0b85a97d-38f70826839mr23613426f8f.40.1740646529153;
        Thu, 27 Feb 2025 00:55:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485db77sm1300701f8f.86.2025.02.27.00.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:55:28 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 27 Feb 2025 09:55:26 +0100
Subject: [PATCH v3] arm64: dts: qcom: sm8650: add all 8 coresight ETE nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-topic-sm8650-upstream-add-all-coresight-cpus-v3-1-48ae516be0d5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAH0owGcC/6WNSw6CMBQAr0K69pl+oFBX3sO4qO0TXoK0aYFoD
 He3unOry5nFzJNlTISZHaonS7hSpjAVULuKucFOPQL5wkxy2XAhDcwhkoN863TDYYl5TmhvYL0
 HO47gQsJM/TCDi0sGq2rRaa4vqqlZScaEV7p/dqdz4YHyHNLjc1/F2/44WgUIMNoY7VXrrx0eR
 5psCvuQevY+rfKfuix1p2VTG8Vb5OKrvm3bC+8bRa1HAQAA
X-Change-ID: 20250129-topic-sm8650-upstream-add-all-coresight-cpus-a3418606b354
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4469;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qNgIC2FnRrugkxHLXlWczBYeMHDnrxLnYyjDzOh/e/c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnwCh/l54yA69j3HeDSahdM7RfrGKkg2FbSMunOWk8
 IMZOVF+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8AofwAKCRB33NvayMhJ0QyPD/
 9Rh7fE5tpP++MLS69ZqyOLlzaQJhbvhx3QaE+hiupZAul7QgI6zrrjJf/Uneu3vfZkIjqM2r4qxcuU
 EW5Ep+ep2l13voSM6vwhzvc7Ef2givJgjX6IiqDZGHZsgGwFHcPN76irTWEp1Iy6CZwI4ufOc2SXLW
 kG61kPGM7sCz9m9zu7B4w2aHGP9JG4OQ9vvUgmaBcAwua+NoXAonrHQJRegYH/xq6RY/j26nmcvNVs
 gHUopHs2N2wXAw7bRPFBl118w09TgFxiWrgFnxZ2VCwrArgG3pXJOZrIaRA2niio3RrxsxntAs3Zyr
 L45i/+TOUzGHemZMkNv2G8NhYTAiLaza6Y1U1neQeYscWHRxdwT5xNGDk3F/YNEToI0CsQss/BKg2W
 19I9C8i9bpT+NCjSPu/ddKayiKDtVZ7TtpTmdteh/vucLi6de9G1HpblYdmnyLh9pynXWBobj3GeJT
 jPI6nXxlW1uKfT3ZK5VHuYj8xENLujRoJCQY5ul9hA9qY7d7e4aPHMNQqcHIZku95ac8rwDuXPNJr2
 vk2+C1W0u99/y68jSTz/LaC7HwYlQ+3qN6Ui4rORdQ9W9sNQgEK0c0cnroTXsgaBnzlHnlztvcBBZf
 jRZUkcPScQBJfXlYyNiALyQz3QtFHuEiu58EbI+kLdyYrhLAXErQxQnMJLvA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Only CPU0 Embedded Trace Extension (ETE) was added, but there's one
for all 8 CPUs, so add the missing ones.

Fixes: 256e6937e48a ("arm64: dts: qcom: sm8650: Add coresight nodes")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- rebased on linux-next
- Link to v2: https://lore.kernel.org/r/20250129-topic-sm8650-upstream-add-all-coresight-cpus-v2-1-c62549307e01@linaro.org

Changes in v2:
- fixed the 7/8 cpu wording
- added the sm8650 prefix
- add review tag
- Link to v1: https://lore.kernel.org/r/20250129-topic-sm8650-upstream-add-all-coresight-cpus-v1-1-96996d37df8e@linaro.org
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 163 ++++++++++++++++++++++++++++++++++-
 1 file changed, 161 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 09cc884f0969432c53671e804ec6a3f7643fc0a9..c5fe5b88183f19d5dd9aef7f898e0badc192011f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -438,7 +438,7 @@ cluster_sleep_1: cluster-sleep-1 {
 		};
 	};
 
-	ete0 {
+	ete-0 {
 		compatible = "arm,embedded-trace-extension";
 
 		cpu = <&cpu0>;
@@ -452,15 +452,174 @@ ete0_out_funnel_ete: endpoint {
 		};
 	};
 
+	ete-1 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu1>;
+
+		out-ports {
+			port {
+				ete1_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete1>;
+				};
+			};
+		};
+	};
+
+	ete-2 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu2>;
+
+		out-ports {
+			port {
+				ete2_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete2>;
+				};
+			};
+		};
+	};
+
+	ete-3 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu3>;
+
+		out-ports {
+			port {
+				ete3_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete3>;
+				};
+			};
+		};
+	};
+
+	ete-4 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu4>;
+
+		out-ports {
+			port {
+				ete4_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete4>;
+				};
+			};
+		};
+	};
+
+	ete-5 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu5>;
+
+		out-ports {
+			port {
+				ete5_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete5>;
+				};
+			};
+		};
+	};
+
+	ete-6 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu6>;
+
+		out-ports {
+			port {
+				ete6_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete6>;
+				};
+			};
+		};
+	};
+
+	ete-7 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu7>;
+
+		out-ports {
+			port {
+				ete7_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete7>;
+				};
+			};
+		};
+	};
+
 	funnel-ete {
 		compatible = "arm,coresight-static-funnel";
 
 		in-ports {
-			port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
 				funnel_ete_in_ete0: endpoint {
 					remote-endpoint = <&ete0_out_funnel_ete>;
 				};
 			};
+
+			port@1 {
+				reg = <1>;
+
+				funnel_ete_in_ete1: endpoint {
+					remote-endpoint = <&ete1_out_funnel_ete>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				funnel_ete_in_ete2: endpoint {
+					remote-endpoint = <&ete2_out_funnel_ete>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				funnel_ete_in_ete3: endpoint {
+					remote-endpoint = <&ete3_out_funnel_ete>;
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				funnel_ete_in_ete4: endpoint {
+					remote-endpoint = <&ete4_out_funnel_ete>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+
+				funnel_ete_in_ete5: endpoint {
+					remote-endpoint = <&ete5_out_funnel_ete>;
+				};
+			};
+
+			port@6 {
+				reg = <6>;
+
+				funnel_ete_in_ete6: endpoint {
+					remote-endpoint = <&ete6_out_funnel_ete>;
+				};
+			};
+
+			port@7 {
+				reg = <7>;
+
+				funnel_ete_in_ete7: endpoint {
+					remote-endpoint = <&ete7_out_funnel_ete>;
+				};
+			};
 		};
 
 		out-ports {

---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250129-topic-sm8650-upstream-add-all-coresight-cpus-a3418606b354

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


