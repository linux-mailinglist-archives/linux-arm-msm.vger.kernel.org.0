Return-Path: <linux-arm-msm+bounces-60058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BC4ACAE12
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 14:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B5C23B354E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 12:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BB021ABC6;
	Mon,  2 Jun 2025 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZT58MRLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F69218587;
	Mon,  2 Jun 2025 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748867212; cv=none; b=dihKPH4s51oQ+YoewLAQtTGqR4luFZ69NdPXX/8NBlxdy9yO9rLxhDMGfLx3CCtfoD2st03esaTl7ezt2OH6hXjYS8VVPHPGLb1PpgTPn93OGhFMmD9FxSO5Sud5wdI1vPLRPGU6VMjOL8r6HaNoayfMv0krSvUro/GCYjFThqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748867212; c=relaxed/simple;
	bh=/PZYx8ll6uh4he6w2FYjTUh7JwhdyTzmnqOqsDpEF1c=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=CbGwKlUjy/BxlDKXdPzd2HHVq5sshyEvRyHxf1ADjOyZmDKC3TZMd+WsRl9SnmsE6ixz4qE1xrhz/Lb3OpFMTIKXdFvA+kwT/gv5hDB62Bo+bjoHS9tP0QoIb18TKh+ZiM/RgeiY4EJ0nKoMFc93lIYBzHcXhdXuc9aAhe4LcxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZT58MRLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CAEC4CEEB;
	Mon,  2 Jun 2025 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748867211;
	bh=/PZYx8ll6uh4he6w2FYjTUh7JwhdyTzmnqOqsDpEF1c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZT58MRLZTr1mVtKnshm6AgMrlspFGPFg27qOlBAMdzS9TeLDULQCyNX1jvTzjgErv
	 Zryn0kDVTEGp1htDcyX1h5snFqn50H8ehqJ68nhcF18JTcn1iVesNOWuPRgWnXch55
	 v7UVOGz0fPPBRvJjXcgC62tTsHQtCdbJ+d/engsMNuw7D3wTz9lsZdSeg6G9OGHHIg
	 a4iVgSgvyD5GqcQZbNsyhfrxNqDItX2ECEaWXp61f9z0lgo3pq1M5POI/A9tFN8Ny5
	 FYj5sDWC+ql2pW4iwekugNciYgWv2Tt3I4AXumpFhYVDA6xwktebCf9DSdvg0VecZj
	 cCQjU8HgXTV2w==
Date: Mon, 02 Jun 2025 07:26:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
Message-Id: <174886710496.952780.2272262350593905866.robh@kernel.org>
Subject: Re: [PATCH 0/5] Add missing OPP tables for Venus on qcom/arm64


On Sat, 31 May 2025 14:27:18 +0200, Konrad Dybcio wrote:
> Sparked by <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
> 
> No external dependencies
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (5):
>       arm64: dts: qcom: msm8916: Add Venus OPP table
>       arm64: dts: qcom: msm8996: Add Venus OPP table
>       arm64: dts: qcom: msm8998: Add Venus OPP table
>       arm64: dts: qcom: sdm630: Add Venus OPP table
>       arm64: dts: qcom: sdm845: Fix Venus OPP entries
> 
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 20 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 39 ++++++++++++++++++++++++++++-------
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 30 +++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm630.dtsi  | 35 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi  | 24 ++++++++++-----------
>  5 files changed, 128 insertions(+), 20 deletions(-)
> ---
> base-commit: 2a628f951ed54c30a232230b5b58349d2a8dbb11
> change-id: 20250531-topic-venus_opp_arm64-378e98bf6071
> 
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 Base: using specified base-commit 2a628f951ed54c30a232230b5b58349d2a8dbb11

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: video-codec@c00000 (qcom,msm8996-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: video-codec@cc00000 (qcom,msm8998-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-e7.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: video-codec@c00000 (qcom,msm8996-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: video-codec@c00000 (qcom,msm8996-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: video-codec@c00000 (qcom,msm8996-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-j5x.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: video-codec@c00000 (qcom,msm8996-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#
arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: video-codec@c00000 (qcom,msm8996-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: video-codec@c00000 (qcom,msm8996-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#
arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dtb: video-codec@1d00000 (qcom,msm8916-venus): Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#






