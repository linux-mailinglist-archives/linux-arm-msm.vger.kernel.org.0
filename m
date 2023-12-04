Return-Path: <linux-arm-msm+bounces-3213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F9C80300D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D353F280CED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F1220DD9;
	Mon,  4 Dec 2023 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="UJPPDA/8";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="/b8+AmJ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.169])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C8BF3;
	Mon,  4 Dec 2023 02:21:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701685291; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=AyvJ6jYRFtDQIWlWMGeO2vijKT0bbAVc5Zi2Myf/0/vysRh6Hd9Lly8u9WwDjfYWxd
    1sHGZCESVQuyHhyJlkHA+bCEku2QjMO8tPvCl+0ERzNsC0MF8WFSqocuD0/W5FPYopbr
    mrWxoJ+pwXN9jA+ZgghCK3Er7KY3Me02a5s4NsWpyDOT//1Qf7m33ekDXKbUvsZ5jWR5
    o4JDGcTfviH8agYvhcHce6iLO9hwT+gThVZuR6zxhFIdM40Ec5ZRbCBL93szmMK3vw86
    uvNaG7SrEHcoZ/C2bLXaLGX3xBJ8qnTBJSotzu2Rq9Y7OzI6mn06Mcr8QMwdxiSJSKjP
    VZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701685291;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=uj1QzN6J5pFbgGdmuZdH8PeMQa0Jc71qDrizP07VFLg=;
    b=SBG1zuzr8U4YRptKR7yoWIxW2jK3TSjTFsAkdcYcsZQ5oh0Pk358XD6g6ORivKMAIS
    Z61S0et38J/PD7LagsSACq+mg2XO5qbal8pVZOn5wQ90VVhIG/4NZNSfBaR5Ypqt6PDy
    52Lt9QSEkAq15Ixu7//beHADX+1LQgoNqPChj81V3578Xczg8qLrY5weLqGcXO1/+iOI
    j72ULt0TSgcKGZl2svA5kbHyQoQDti+QJSqENjtCDCsesBO1cm+8aUjWUVdaK/r1S5/K
    4GsPBOaQ4KejJqcY16RW9cougFftGrv6qmnNJB2gRDiIEhW+NbaTgy9F1Zj0jz3WVhie
    bh4g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701685291;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=uj1QzN6J5pFbgGdmuZdH8PeMQa0Jc71qDrizP07VFLg=;
    b=UJPPDA/8j3b6Dt23C41dFpc9rQkNkpaKSC27i0nL3ZCJ1jVWoj1ZE/Vp5rdeMtK0KI
    DL5hPdwpxjGalBpXUVo6W7v3idhXb5LoMssIhKN1e2FcS+Xd2aBflGpzIjXKwB6/O6+I
    z1H87xD5O2RlOmhfJ4Zc5sf2Z1pkuiVnPd4cSnXPA70fw5lweV6e8BTlbptQ/oU1L8xy
    mRzrlW0JC4+jppR8Ip7oqhe78W+fV5klEuP951jkbxaoqBi4e06Xo1DgckMbwpHW9zw8
    LASiYMBJ83HHNXvEahdK9zgwm1seLXetZTT9600wvj3V00NNAPj0IjWbgNKWGOJ0GQ3q
    2oig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701685291;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=uj1QzN6J5pFbgGdmuZdH8PeMQa0Jc71qDrizP07VFLg=;
    b=/b8+AmJ2mdBGRGmg/8TZ0kT/6Wx9lOMWDBmN2wCDzW4z7VDEDN6PY+lTyciWn5mPnT
    ukQSOLBTE8C/g0D477Dw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQjVd4CteZ/7jYgS+mLFY+H0JAn8u4l+/zY="
Received: from [192.168.244.3]
    by smtp.strato.de (RZmta 49.9.7 DYNA|AUTH)
    with ESMTPSA id R5487bzB4ALVA1x
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 4 Dec 2023 11:21:31 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
Date: Mon, 04 Dec 2023 11:21:20 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: msm8916: Make blsp_dma
 controlled-remotely
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231204-msm8916-blsp-dma-remote-v1-1-3e49c8838c8d@gerhold.net>
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

[1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BR.1.2.9.1-02310-8x16.0/arch/arm/boot/dts/qcom/msm8916.dtsi#L1466-1472

Cc: <stable@vger.kernel.org> # 6.5
Fixes: a0e5fb103150 ("arm64: dts: qcom: Add msm8916 BLSP device nodes")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
This should only be backported to v6.5+ since it depends on commit
8975dd41a9db ("dmaengine: qcom: bam_dma: allow omitting
num-{channels,ees}") which landed in v6.5.
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e8a14dd7e7c2..7f8327b0dbdb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -2155,6 +2155,7 @@ blsp_dma: dma-controller@7884000 {
 			clock-names = "bam_clk";
 			#dma-cells = <1>;
 			qcom,ee = <0>;
+			qcom,controlled-remotely;
 		};
 
 		blsp_uart1: serial@78af000 {

-- 
2.43.0


