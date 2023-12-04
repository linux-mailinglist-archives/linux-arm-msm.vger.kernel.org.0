Return-Path: <linux-arm-msm+bounces-3218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C076A80302B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79C0F280E36
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29EB1EB4F;
	Mon,  4 Dec 2023 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="csUxHlaz";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="V0mH2p0h"
X-Original-To: linux-arm-msm@vger.kernel.org
X-Greylist: delayed 185 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Dec 2023 02:24:39 PST
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0FAA129;
	Mon,  4 Dec 2023 02:24:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701685292; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=mt2Sv/Pql0jiqXPCAUjVkHPemFANe2vQ70e5FrbhPNrqX5H36oIMDgkgoSWFVQdyYQ
    Cbmxog3KWk7Z0ZEc7CYH4DIFTquu6Ch9Ot/dr5Kl6B8AS0yvZPzt2sbb2QZ+uiywzg4V
    pbEphNCQKUA1ofzZxfR6bUmh04J/ZJkhRzvO5NJRyUnuPCXeC2q/63NCU3lWjuRhhlMB
    S6EE3c62oVNxSdOoY3B+D8z8u2iPLSJt7hfCjhJRmbb/vDOfLQyAnwkya4LPehQ3CkFt
    hPS4eXBLo3eBgp84oxf+S784FWhslxR7yWtikjAT411dILCPxfzyFOmPHKXC1s9xkTVo
    Cg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701685292;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=xEB0wIQxDD7Q+oCC+SxhubyPvyNdktr5eK2L/lsv3xc=;
    b=Vg1G3ULwHtvFsUQsStCW6mRp6U812dBh23GMWJgq9K+Gl1k59nowlkF1g4hWLb4Vit
    AeQ6Ajx57Wjz15s2qL9ruIIHTqVS2FUpAURPC3aqFeAVOJpZLtx2tMbXB9CSniNHeBAc
    Mfpg8xUC+eYYP0v18ZwP2LnG4DxzEZNh/2/11hFe9CNQG2jmqmkaRKyGFtY8bVIeiRtx
    0tZD2PcOtshcUaw1cmyi6yEIASQ+1lTinpSesW+YZDlDE4EpHXRLgeRLnP8jIDrHO9ZH
    Lfi+fGgT18VNqiNx+IMVz5qAydyKKpkt0kRCdDwcjWqSjjmyaHCjBOhHPBnLfWdcHWcg
    fOuA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701685292;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=xEB0wIQxDD7Q+oCC+SxhubyPvyNdktr5eK2L/lsv3xc=;
    b=csUxHlazh+KuKR/3CC+hIPDU5F7X1c3zmMlT+ULMD8WY/LEtEb9DTAJrpxJJMbhe3u
    7+NCVNE9LJEaQ/tyji2JbE5Jc0wbr44VE5tUT+K5ekZgQ9ZreV5bLO+BlbB7FQ1FBgkT
    FZAscyS2VClPFvN8PVBU5z9Nqu7uW/w8r5oKfR/LeTw3V3/HzXqbGPVSSJnh4acMWkxL
    gOU83nov9ynH433mF3bUF+H+vekuSQIzlr2UrxgFrQz7E/kOOFaoiZN0hXCabH06o+85
    krjLcMFgUn/JcplNFBbscvtNnCC8BMi26XzV1frwp6LghRlSecd3yeKBEvukDxtaDLib
    QZHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701685292;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=xEB0wIQxDD7Q+oCC+SxhubyPvyNdktr5eK2L/lsv3xc=;
    b=V0mH2p0hBCHZhrkE6nDSgeWPd3zsS2k5LWzFtJ3wN0l1EUbgKaVzXvC8F/VGadLQBr
    CfrXMmKL/w6f1ek6JnBQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQjVd4CteZ/7jYgS+mLFY+H0JAn8u4l+/zY="
Received: from [192.168.244.3]
    by smtp.strato.de (RZmta 49.9.7 DYNA|AUTH)
    with ESMTPSA id R5487bzB4ALVA1y
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 4 Dec 2023 11:21:31 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
Date: Mon, 04 Dec 2023 11:21:21 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: msm8939: Make blsp_dma
 controlled-remotely
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231204-msm8916-blsp-dma-remote-v1-2-3e49c8838c8d@gerhold.net>
References: <20231204-msm8916-blsp-dma-remote-v1-0-3e49c8838c8d@gerhold.net>
In-Reply-To: <20231204-msm8916-blsp-dma-remote-v1-0-3e49c8838c8d@gerhold.net>
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
for the qcom,sps-dma@7884000 [1] so adding "qcom,controlled-remotely"
upstream matches the behavior of the downstream/vendor kernel.

Adding this seems to fix some weird issues with UART where both
input/output becomes garbled with certain obscure firmware versions on
some devices.

[1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BR.1.2.9.1-02310-8x16.0/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L866-872

Cc: <stable@vger.kernel.org> # 6.5
Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
This should only be backported to v6.5+ since it depends on commit
8975dd41a9db ("dmaengine: qcom: bam_dma: allow omitting
num-{channels,ees}") which landed in v6.5.
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 95610a32750a..9eb8f1ceee99 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1761,6 +1761,7 @@ blsp_dma: dma-controller@7884000 {
 			clock-names = "bam_clk";
 			#dma-cells = <1>;
 			qcom,ee = <0>;
+			qcom,controlled-remotely;
 		};
 
 		blsp_uart1: serial@78af000 {

-- 
2.43.0


