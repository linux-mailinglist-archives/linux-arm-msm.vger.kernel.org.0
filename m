Return-Path: <linux-arm-msm+bounces-88358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3099D0DB22
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCE50301E595
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC992D8777;
	Sat, 10 Jan 2026 19:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJw2fRM7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B760D2C2363;
	Sat, 10 Jan 2026 19:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072304; cv=none; b=TUd2l2Pp/83idU/2QvfsNOLOFVPZlAqFZlxXmlOBx6c8g4UDQuN64Zsczhzozh0jYZOIHnMPJkcr2i5jZMyQhJvUnpRTS3dQmlQvAHS7uxcvBgEqOZ75j8Kzv2aLmR57kT+vXMBm6ewdcVj5pJklM8yTpOlWwATQObxuCi91jYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072304; c=relaxed/simple;
	bh=J86PBsFeO81EQ66VrG3YQAxgsGmACvGP8ROrusc/yWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lRl2Mk8/z6qFxFd/eHxwXXImEy64mJ65KnrliWBKKyQnhCr9KVZn+wzEAT88BB9ip8Qlh+w/ZywI3IDFmUpH+1WaRAl6i1c9HGPAvJ2xE4thkFilFNWCDWgktzzfiHdNvoxh/ipSALfIs5OgqAy0qRq2YYsf9GLmT8Q7a/6m+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJw2fRM7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E426BC4AF13;
	Sat, 10 Jan 2026 19:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072302;
	bh=J86PBsFeO81EQ66VrG3YQAxgsGmACvGP8ROrusc/yWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJw2fRM7o9NyHm6o3eHJ7OUYjRJ8GJ4Nn8oyLJVKOa95/HrUx+5U8m0nJqCFzNrWY
	 aeFYjJNz+3W/F00WRBTfgNCAn5WXAxuu/zyWllBdlIPTuBSgVPvTljNK7ipz/yZGSd
	 V0Ep7ouqiWpiB+rjN6OwHA2M2TW9mi/7wfSt5wBQo6/SS/4LxGUIXBzvxFwCb1WdfH
	 ko2/NnSsVK3JsX5z4uRif7Iwq1PeoZDl2jwGg8R4w5A/kCqIGoeQos/NhgB8fiV7qL
	 DTBEXWlG3XGUJ9JHhMpOsfgIE+6ieUdM2cJmLQ+SqRapzM8aOcFgJ5fP4Dw3BAiy+z
	 laUUyvLx1iqtg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: talos: add PMU
Date: Sat, 10 Jan 2026 13:11:26 -0600
Message-ID: <176807228460.3708332.11446653632510693023.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108092542.1371-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108092542.1371-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 Jan 2026 17:25:40 +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Swich to 4 interrupt cells on the GIC node to allow us passing
> the proper PPI interrupt partitions for the ARM PMUs, and add PMU support
> for talos.
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: talos: switch to interrupt-cells 4 to add PPI partitions
      commit: ca25bb421bdc81849dd527641cd7405fb5eba8fc
[2/2] arm64: dts: qcom: talos: Add PMU support
      commit: 63a47fc13cbef0a4fc5e011f07f47a921312fc81

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

