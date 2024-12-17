Return-Path: <linux-arm-msm+bounces-42550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3869F4DE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 15:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACAE7169510
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 14:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9351F5402;
	Tue, 17 Dec 2024 14:36:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80B01F4E3E;
	Tue, 17 Dec 2024 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734446198; cv=none; b=puZnPdZySNT6p8VNegc03ffGuqyYUaHwS2lqalDKpTqFO2vUfKMkUJiZ3kM92S9toPDC6EyrI6kCMFURTmbM4yToUqWEKyrnBABgqdWHwh+0UMjqd8N6P2hCwyJ1T8XAIqHs27XtLPbzMzEf4fkV9+NVSh7umrAtQlmsN16hF/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734446198; c=relaxed/simple;
	bh=3nulv3yKN2RES20s6LiSVXCCu4z/W/uaKoXdhKsgh+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TDG4r4Kmt2frmogf8+esJsfWLXteFC1RPGDXC97Sc9v5ViWP9Q1c/+pFPOyQ+Z5fzxvWJPmwRd33WaJp3UM4QwNIr1wV0TBgyqD4VudaX4fddfSRB90I93q+BLLoI40iRnodQpfvi6TJpAnmku8JHogGfv84PkUwYZBk1yBBx2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44EE5113E;
	Tue, 17 Dec 2024 06:37:03 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC5B93F58B;
	Tue, 17 Dec 2024 06:36:32 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v7 0/4] source filtering for multi-port output
Date: Tue, 17 Dec 2024 14:36:25 +0000
Message-Id: <173444598114.864570.18416527651218850484.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213100731.25914-1-quic_taozha@quicinc.com>
References: <20241213100731.25914-1-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 13 Dec 2024 18:07:27 +0800, Tao Zhang wrote:
> In our hardware design, by combining a funnel and a replicator, it
> implement a hardware device with one-to-one correspondence between
> output ports and input ports. The programming usage on this device
> is the same as funnel. The software uses a funnel and a static
> replicator to implement the driver of this device. Since original
> funnels only support a single output connection and original
> replicator only support a single input connection, the code needs
> to be modified to support this new feature. The following is a
> typical topology diagram of multi-port output mechanism.
> |----------|     |---------|     |----------|   |---------|
> |  TPDM 0  |     | Source0 |     | Source 1 |   | TPDM 1  |
> |----------|     |---------|     |----------|   |---------|
>       |                |                |             |
>       |                |                |             |
>       |      --------- |                |             |
>       |      |                          |             |
>       |      |                          |             |
>       |      |                          |             |
>    \-------------/ ----------------------             |
>     \  Funnel 0 /  |                                  |
>      -----------   |     ------------------------------
>           |        |     |
>           |        |     |
>         \------------------/
>          \    Funnel 1    /     ----|
>           \--------------/          |
>                   |                 |----> Combine a funnel and a
>                   |                 |      static replicator
>           /-----------------\       |
>          /    replicator 0   \  ----|
>         /---------------------\
>              |     |      |
>              |     |      |-----------|
>              |     |---------|        |
>              |               |TPDM0   |TPDM1
>              |            \-----------------/
>              |             \   TPDA 0      /
>              |              \-------------/
>              |                    |
>              |                    |
>              |Source0/1           |
>           \-------------------------------/
>            \           Funnel 2          /
>             \---------------------------/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom,coresight-static-replicator: Add property for source filtering
      https://git.kernel.org/coresight/c/2a0bc219272b
[2/4] coresight: Add a helper to check if a device is source
      https://git.kernel.org/coresight/c/62374ce1876b
[3/4] coresight: Add support for trace filtering by source
      https://git.kernel.org/coresight/c/ec9903d6cc34
[4/4] coresight-tpda: Optimize the function of reading element size
      https://git.kernel.org/coresight/c/56e14a21cee4

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

