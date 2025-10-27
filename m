Return-Path: <linux-arm-msm+bounces-79069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC14C11D8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5C3DE4FE47A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954DE34DCCF;
	Mon, 27 Oct 2025 22:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9wUdNDg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6867134DCC9;
	Mon, 27 Oct 2025 22:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604537; cv=none; b=keK+kknnK/MpUH3DeQPhruxdLO2xkE0wd3erxGo4tcfkg04XpeJJxa1LwRDrBrfrx5W6sr3i8GWPDdIP5QVnYLDXYXGqeHrAb6PYprKVgZ/tjIFM72Uiw8SFfGGbC+Isl5kUfD6ndNl4pDIp140TrxgholSJGgiRQJPAEFyyd0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604537; c=relaxed/simple;
	bh=Qw64W/dn+nr39Bn8vkDZZ1kuh7mE7U8DxYl+9e2feyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GAZw26035hozIN/UBUAR2+fKB5T2XRBHBeXoap8rVvSfZwq3wg0TrHJB8KdWu+htAtJ98I0dSLVghfZQj/7U0z6hZP+EdfTMZ+KDe+c6UebSGS8TAUfEWCsm4YhN7YIMW27LM9AdzuPC0MQXjlDcfkbS0c5lPYxU6n9QNcDwKoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9wUdNDg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D8FC116B1;
	Mon, 27 Oct 2025 22:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604537;
	bh=Qw64W/dn+nr39Bn8vkDZZ1kuh7mE7U8DxYl+9e2feyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z9wUdNDgraAppiGjY1TyaPhk5TnWC15ucFJHFInNoVSY6/Tra/vtVIJWC0GPVnjcH
	 Uw+TjH17Z0T6kWTEsb9L5OOCcMKz55TXD/xtBmpcPBha5+AGrcdXJJ2fcWVqCnTQ2/
	 w1JGWqxHdQw8qcbsp0WX12QmcGP4bJC06RTDUvKkUUwex/hZ85sBCX/Nty8TNN/MBy
	 T2pUc3P+vBkKM4o2bbBauSIgmHxa0di23XHifBriF7H2sxfAAgdzm7ipMdthmg8qdm
	 1LJmstfg7CbMgBE+MWJJy6Dt3i2Gen3acZPjw4yeQM1TxFl02wA0UYGWnO+kLl/c4d
	 rs/Ri4hQsirzg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: mukesh.savaliya@oss.qualcomm.com,
	anup.kulkarni@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: lemans-evk: Add firmware-name to QUPv3 nodes
Date: Mon, 27 Oct 2025 17:37:29 -0500
Message-ID: <176160465192.73268.2219350727698101788.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924035409.3976652-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250924035409.3976652-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Sep 2025 09:24:09 +0530, Viken Dadhaniya wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: lemans-evk: Add firmware-name to QUPv3 nodes
      commit: 3f9fa03b7eb1f1105ace0f5981f97607e0c35b59

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

