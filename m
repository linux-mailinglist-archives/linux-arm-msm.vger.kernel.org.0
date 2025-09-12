Return-Path: <linux-arm-msm+bounces-73236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A41B54469
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 695535854E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906E12D595C;
	Fri, 12 Sep 2025 08:04:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350A82D3EF6;
	Fri, 12 Sep 2025 08:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757664278; cv=none; b=p2KxYgUxG3ToxifkAIwT7ojp0h+hBtfDHV8zCXTy/Mjs5ZgKKRDAG29dSvYZL+wuFc8XY3JvPwCcaf/DBstvVUbnP2lOJaq+urt5w7NIFlUiqo4pn7oa/0fLUKJCODBxkP4fB6zvVMZ/bHLTsw0quxNnvYcxvWUCsvVdTyd26HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757664278; c=relaxed/simple;
	bh=qio0UgqqCiVlwo/iotJR5Jswa+50RwT6XpwD/Gsmz3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfo5pKONGsu1Z1pW6eNDAlmr7+xl/c1GvXJ4eCMTc8IIyUxd9A4oI9bDXXmerJr4+7QDy4zaDgNBXnwPmviszhzvpaI2x8gLzQhuKe3u5pI94RkrWWy69aG/FkrT9dOTdC46Elc3k1TDPyupw0yS0sgs7vkknV2GH8SAhiaw5CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1757664236t834c71fe
X-QQ-Originating-IP: jhVYbhvFGzYgONTpQJQh5yssDPWy/gomue/4E6PK6CM=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 12 Sep 2025 16:03:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15272649383679166477
EX-QQ-RecipientCnt: 12
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 12 Sep 2025 16:03:29 +0800
Subject: [PATCH RFC 1/2] dt-bindings: arm: qcom: Add Radxa Dragon Q6A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-radxa-dragon-q6a-v1-1-8ccdbf9cd19b@radxa.com>
References: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
In-Reply-To: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757664226; l=857;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=qio0UgqqCiVlwo/iotJR5Jswa+50RwT6XpwD/Gsmz3A=;
 b=deD0zGERvHRRT5r7tFEe841uDvgXGxjdpGVeG5CVxCydoNx98lqgON9oefV4ETLSNdjxK8jsd
 WfauGTV6JywA7ue0NbjHsIX/RTm5CK3u8B+69h5HWh7jZEFdgp8aXCj
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MCphk/HbFC58iptk2ge84uPvCv4ijt4aVfUnssiXjqJrS3HiQodTewTP
	UPNVOwSikYIjdfVc9EkwOHg2qd0jk/Ee72rCewuwwyEZwZ3B8blK4rzCYWIbsImXzNJAF0C
	C+2DAFT2xfwCcLtseAQeowizxIf/NI7Ywsb7GSwW/wG0GeOduDH/FyTFxoOSd7IZMCyfXDk
	ryS3ihDgUxElpO/PvflH4VCN7JoPIUyE2NTBgrqTDYpCbmi6SE+1veC1Ma6rBbycxmcFG1w
	eghxsEeVzb/d35AhxKPj8bh1DNHKnh7YCHNW9hMpIh9MTlKO2uiRSmuSd9e9edflQGelY8O
	IEghxLTWnz1O+vyt3fQ+3s75U4HYzpjQOdbn47ziXDpMaFIa1TyMQqZc273xgJ7aJYfd7lr
	A4YsM9lIw+kByxfP9EyYY8ACWwOf0B3whaAAhao3zLvM/dqgqkDaKL6abPXd/V+Up+NXTGs
	9tGxvscmbO/jLb2CUrS2W3UYPIUZhmXFWGt+yH7MuMndl6i2mkOxhw2ge9mrsoutHaqwrXl
	fsz1bBG2JiLuq2yqvOGdu8xJKhapJBhaK9AktD6lU6NXQidR2afI0/1paWjWvDlGDY270t7
	C/m/2IlkuBIoO8RU7LyC/zaG7LGxpnkmIotKxsDh/uDzYPRKBd5lH4q+foCLynEQB3N5QEc
	PGOEtHpRLXhdpyAby0E2PRoigH//fF2k+ck78oQs/IyAGQEr+U5u8y5ZdtP+411UY2BoLgD
	/En8dOedzPxMvEKbheyI3Utbf2Aa5RlslCgsfYRRm6Qekq4rWue2ibWkjkxxQFZ0Mc8LjvQ
	PmIkLTx7VepzzbUxvIbOr5pxA0y00HpVqdZcoM/BdJkptoS1ZkluU0epI2PN95U9LgYa54h
	gPFXfZ3d6LHyICao3++6P0w93MHoQ8YlXJMI94L0AI2SlHO/FBHepS6JdFbQ9tkWPQ719ZZ
	s0A4Dm22vd759u42LE1C3isHG1tPbB3HixRQDwymPdyztN9yVebESl6DLrgtmf2DNXHY=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Radxa Dragon Q6A is a single board computer, based on the Qualcomm
QCS6490 platform.

Document the top-level compatible for this board.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0a3222d6f3686f1647b9e2ea192c175b0b96d48a..a7469a51adf0d6ebc1bf25acce8f125a844dcdbf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -339,6 +339,7 @@ properties:
               - fairphone,fp5
               - qcom,qcm6490-idp
               - qcom,qcs6490-rb3gen2
+              - radxa,dragon-q6a
               - shift,otter
           - const: qcom,qcm6490
 

-- 
2.51.0


