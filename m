Return-Path: <linux-arm-msm+bounces-3212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3180300A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AAB0280C2E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCDC20320;
	Mon,  4 Dec 2023 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="h8Vf8qTu";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="qKmkwMwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE4AF2;
	Mon,  4 Dec 2023 02:21:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701685291; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=b+HyazTPNVzckwREw47xO2W+5XlGhZAn8V2HVeKO2TiUzP7kMCLoL77u6VArhKTNZD
    Bp99uzciG6+m4TUO8cTiwdMl6s6W+ACN8Wa0AoFTp8yLPw7NKORF7tEWO3BfpsdgS6W5
    mUD873HkLHZK2ay/MGpS8WoLsPk3NUZdkYmeiPBnP1QFeKUB49C2rZ9zEU9gAsimhXBL
    iyNGkvADMU3hxJ3JOCQ999nqy+VdlVShnnVqOFwPwEYSmqcn1LzCDdHs46ahal7EIkuW
    NCSsAVSLysV5lwL3iB1h3Mor0UDjNvB+FvaKuddCPyO3ULneCV1QNMKjg6UfE0Vl9gqP
    t1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701685291;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=5iAsS5XB58/f5cNCz7T2RBsklGCxCrx47QuQO5tkpEE=;
    b=jZgRzl6eiMaVMtx4crTj8mr1Ce3Yb7i5S1B49HqWUgD1Ira2Y4gXGTOPlDHTJL/A/p
    VFFwUk8TqEV3Wl0M5+TELgkzS20mbTI7C/dNdil5acdwlV3l4d5ZLqXw4zNH3zxErSz/
    3GjM1ZA9NbLDqAvxH23/Exii6MyE59nHvKmOI6n7RHvDpxOdRm5KZMeYwrQu72UetIp5
    0qykm+aomVoL4iS+Rm2cbbt9OtIJXZkOOMIE2qPzI6DQadZTXF1n8aousvrNvB3pLnBx
    OzOsuTHckuKhIbynMi8N5HLJQYOPx1cg9s1ListUF5l82n7/tGbLsUYSD921Hi95iICU
    9EtQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701685291;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=5iAsS5XB58/f5cNCz7T2RBsklGCxCrx47QuQO5tkpEE=;
    b=h8Vf8qTuHU5vlVnXkVH0RgvMrOK7AT+b6DWrjyLpIsn4F0pJsyU1UFu2XGc+Ykuwl7
    og0/CqHN/FHfyrhpc+xTmkx2t2qAHdE0kDoE1u+E8UsN7RoW8hTBAN01ynfwet/HJqA0
    ahh5OQe4pPtv2cDqfHvvJvdLXV5J7lJ3F5uCMW1r+oZpnNWzA+qCOs6FaPbSwAJy3QgU
    kAckF5Jzg2Lv+EfSJMUPL+kBMuyryJ41NvVkg1Blt5G3oHTu6fOI40BlW38rfcY0nOu9
    lDwcK7HCKWX8Ebi3z1hdeqT1+yWztPDKf07ClbvQm5xEwddPFe2jB/T5jM4ja6ua1KUj
    QpaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701685291;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=5iAsS5XB58/f5cNCz7T2RBsklGCxCrx47QuQO5tkpEE=;
    b=qKmkwMwZro24yl69YazgJWDTsVr7txPj+OdCB9sebKYroROyxnNqueurDg81/hYS+y
    89ZlfhXjmxyHKihdQNBA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQjVd4CteZ/7jYgS+mLFY+H0JAn8u4l+/zY="
Received: from [192.168.244.3]
    by smtp.strato.de (RZmta 49.9.7 DYNA|AUTH)
    with ESMTPSA id R5487bzB4ALVA1w
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 4 Dec 2023 11:21:31 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/2] arm64: dts: qcom: msm8916/39: Make blsp_dma
 controlled-remotely
Date: Mon, 04 Dec 2023 11:21:19 +0100
Message-Id: <20231204-msm8916-blsp-dma-remote-v1-0-3e49c8838c8d@gerhold.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+obWUC/x3M3QpAQBBA4VfRXJsy6ye8ilwsO5iyaEdS8u42l
 9/FOQ8oB2GFNnkg8CUq+xZBaQLjYreZUVw0mMzkZLICvfq6oQqHVQ903mJgv5+MJVVuqq0dS0M
 Q6yPwJPd/7vr3/QBoeMepaQAAAA==
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>, 
 stable@vger.kernel.org
X-Mailer: b4 0.12.4

The blsp_dma controller is shared between the different subsystems, 
which is why it is already initialized by the firmware. We should not 
reinitialize it from Linux to avoid potential other users of the DMA 
engine to misbehave.

In mainline this can be described using the "qcom,controlled-remotely" 
property. In the downstream/vendor kernel from Qualcomm there is an 
opposite "qcom,managed-locally" property. This property is *not* set 
for the qcom,sps-dma@7884000 so adding "qcom,controlled-remotely" 
upstream matches the behavior of the downstream/vendor kernel.

Adding this seems to fix some weird issues with UART where both
input/output becomes garbled with certain obscure firmware versions on
some devices.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Stephan Gerhold (2):
      arm64: dts: qcom: msm8916: Make blsp_dma controlled-remotely
      arm64: dts: qcom: msm8939: Make blsp_dma controlled-remotely

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: adcad44bd1c73a5264bff525e334e2f6fc01bb9b
change-id: 20231204-msm8916-blsp-dma-remote-516df8aac521

Best regards,
-- 
Stephan Gerhold <stephan@gerhold.net>


