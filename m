Return-Path: <linux-arm-msm+bounces-51502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A2A61BD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAFF518962AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0375822257F;
	Fri, 14 Mar 2025 20:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AczZUTwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6542222DF;
	Fri, 14 Mar 2025 20:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982524; cv=none; b=n2jr9k9ZxS3i9jcTugsYVI+QEuhHl9OKP1MbprXr1CB+LlafGF+eTNry6yN71OLHLeFLV5I+hUi+cZF5eaQDZD+eFMClzB5UpwViz56KvnjICHEmujvXQpzlscFLHwKLfdwMJYcehQFbppqWMuYT/2zjoUfWTAfXzj5SU04CMoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982524; c=relaxed/simple;
	bh=B0I2UR5bJ0bUy2B2afwpeun+oIu3OfPx0zK4mQ0Ca30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CWREvdHM0w/1ox3WvXvFO26HVK1Idb1CT7RQM5kQuecPzEucGxfhQ7p+oKK4fLh3vd1up2Joe/Bn76Hr0Havl2XF03fIFSAUEfdRLFcnI845MVbMDo5CN0Hk/MPC1m3RH6E+akPqt111NWcJzofitPpDxU9FM+2p7YiTvcooK3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AczZUTwE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81648C4CEF1;
	Fri, 14 Mar 2025 20:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982524;
	bh=B0I2UR5bJ0bUy2B2afwpeun+oIu3OfPx0zK4mQ0Ca30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AczZUTwEy96SbkOAHiE6HM0IJK/8h3UftlQEkVPJEABLvKmRP8b71MdXCw9EZS4Pu
	 gKObCETMziXLTqUJjzv+aAtstoggmXPm9HaqSJuqabrmAYn/hojziv9dY+c1qFx0mX
	 IfWvm7ULhl04Hs42sIuuqOQbER9u/+M4IrSH6Fm3po89wgB6eL4+oMbJ9XTLB9SGnJ
	 yZYatI5orMFl5SsVE7XmITvCyf20vVF0wycJGPJatd7VUOV/H4n3J10AKRkK2qXs30
	 7/ylJIsJhU6K6zCj/7ygwIMvvqw4OJw+UTWs76nerV9jg01e65zKbK4Q06G6Id5Dk6
	 7kTuC1LkQHqEg==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: drop video decoder and encoder nodes
Date: Fri, 14 Mar 2025 15:01:16 -0500
Message-ID: <174198247887.1604753.2110662446344009711.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303-b4-media-v2-1-893651a4b1c7@quicinc.com>
References: <20250303-b4-media-v2-1-893651a4b1c7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Mar 2025 18:07:01 +0530, Vikash Garodia wrote:
> Decoder and encoder nodes are already deprecated from bindings. Update
> the venus node to align with bindings. The nodes were deprecated with
> commit 459997e8990d9 ("media: dt-bindings: qcom-venus: Deprecate
> video-decoder and video-encoder where applicable") and is part of
> v6.14-rc1 and onwards.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: drop video decoder and encoder nodes
      commit: 37bd695c16b1b443e357eb37c09ef30b401f8b83

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

