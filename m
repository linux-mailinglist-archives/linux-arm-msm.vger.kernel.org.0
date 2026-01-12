Return-Path: <linux-arm-msm+bounces-88587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFEFD13AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 16:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 55D3C30DE5B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 15:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DE92F618D;
	Mon, 12 Jan 2026 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsipyrCd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5D72EB840;
	Mon, 12 Jan 2026 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768231050; cv=none; b=SktlBu4tgF6hbcEQP3XS5IyEmGuNLHanOsWAG/HooCd6yV997HN3eYyy2OCtOGA1JtRZZXi42GjvQxWfASJdYbqUNERHJZq8gkFvdxYqPGP/EsS/Da/+/PjPJHVS08uXaHH3ryD7mBLlPuBqoo8Df/x8rOse7aKkbnq8haW5fiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768231050; c=relaxed/simple;
	bh=NBGdaApS/TZ8uPzB84NAlI3wUVKRpiLAFwEHpxMGq9U=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=aVJYDP3P4O+E57HDdlpj/EOZNbC/v8k6PfNFjQ0tvQkqcuNkNBlXi6MGiThoYk+b7dyxQEDo/sNLJwIYnwsfmfACnF4npZ8mkvQzVT6yNqxIid2QTcBGEg55GfXC+ouxhjsJugsd0Da7ztTJmXZFZwIaOi18upovd4KkO9aAdhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsipyrCd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35BBC16AAE;
	Mon, 12 Jan 2026 15:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768231049;
	bh=NBGdaApS/TZ8uPzB84NAlI3wUVKRpiLAFwEHpxMGq9U=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=NsipyrCdmCMqUcKHsJfoEATa/GB9eJsi7CPd2RwhN6QaBbmpca2GIGdmtlWjX1UHO
	 42LZbqYlLIk3+GTet/H9VfqjewOf2DREHj3jzbubzZtnVgiAOFcurXUB9QdQ2Mi/Jg
	 X0nNN9vg0iY04n1olcnzim4k43GIRiv1fzNC1S/HN3G6w485PCkOWtDCty4Earpo0L
	 e0MXEpLoWpPwGajmrU/TFeyfk6BgixanKZOLcvC+4jrupDGE5gYKmwNkx4vmza4fux
	 L6c5/ul5ZjM76HKd1zCZ6SfuBV7/y11eSq8qzwvuGzATgHoEaSDFh5hhZ7UxmB8pg6
	 RkrL8EULdYJvA==
From: Rob Herring <robh@kernel.org>
Date: Mon, 12 Jan 2026 09:17:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: conor+dt@kernel.org, andersson@kernel.org, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org, 
 linux-clk@vger.kernel.org, konradybcio@kernel.org, 
 devicetree@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 p.zabel@pengutronix.de
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Message-Id: <176822994163.7632.12745088048671276646.robh@kernel.org>
Subject: Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574
 support


On Thu, 08 Jan 2026 22:33:35 -0600, Alexandru Gagniuc wrote:
> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> driver. This firmware is usually used to run ath11k firmware and enable
> wifi with chips such as QCN5024.
> 
> When submitting v1, I learned that the firmware can also be loaded by
> the trustzone firmware. Since TZ is not shipped with the kernel, it
> makes sense to have the option of a native init sequence, as not all
> devices come with the latest TZ firmware.
> 
> Qualcomm tries to assure us that the TZ firmware will always do the
> right thing (TM), but I am not fully convinced, and believe there is
> justification for a native remoteproc loader. Besides, this series
> has improvements to the existing code.
> 
> Changes since v1:
>  - Improve bindings following review feedback
>  - disable clocks on init failures in q6v7_wcss_reset()
>  - review-suggetsed readability improvements of qcom_q6v5_wcss
> 
> Alexandru Gagniuc (9):
>   remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
>   dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT schema
>   dt-bindings: clock: gcc-ipq9574: add wcss remoteproc clocks
>   dt-bindings: remoteproc: qcom: add IPQ9574 image loader
>   arm64: dts: qcom: ipq9574: add wcss remoteproc nodes
>   clk: qcom: gcc-ipq9574: add wcss remoteproc clocks
>   remoteproc: qcom_q6v5_wcss: support IPQ9574
>   remoteproc: qcom_q6v5_wcss: support m3 firmware
>   remoteproc: qcom_q6v5_wcss: use bulk clk API for q6 clocks in QCS404
> 
>  .../remoteproc/qcom,ipq8074-wcss-pil.yaml     | 268 ++++++++++++
>  .../bindings/remoteproc/qcom,q6v5.txt         | 102 -----
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         | 101 +++++
>  drivers/clk/qcom/gcc-ipq9574.c                | 378 +++++++++++++++++
>  drivers/remoteproc/qcom_q6v5_wcss.c           | 398 ++++++++++++++----
>  include/dt-bindings/clock/qcom,ipq9574-gcc.h  |  22 +
>  6 files changed, 1082 insertions(+), 187 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> 
> --
> 2.45.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.19-rc2-7-ge190ecec2fdf (exact match)
 Base: tags/v6.19-rc2-7-ge190ecec2fdf (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260109043352.3072933-1-mr.nuke.me@gmail.com:

arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml






