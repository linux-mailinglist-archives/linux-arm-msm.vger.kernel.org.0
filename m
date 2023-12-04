Return-Path: <linux-arm-msm+bounces-3294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B8580359E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5C021F21151
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6543C25748;
	Mon,  4 Dec 2023 13:55:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E4C690;
	Mon,  4 Dec 2023 05:55:20 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AF88152B;
	Mon,  4 Dec 2023 05:56:07 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E9FB3F5A1;
	Mon,  4 Dec 2023 05:55:18 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: cristian.marussi@arm.com,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_mdtipton@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	quic_asartor@quicinc.com,
	quic_lingutla@quicinc.com
Subject: Re: (subset) [PATCH 0/3] firmware: arm_scmi: Miscellaneous fixes and opp count increase
Date: Mon,  4 Dec 2023 13:55:14 +0000
Message-ID: <170169805641.32343.17556834929598900222.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129065748.19871-1-quic_sibis@quicinc.com>
References: <20231129065748.19871-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 29 Nov 2023 12:27:45 +0530, Sibi Sankar wrote:
> The patch series includes bug fixes identified while testing the
> performance protocol on the X1E80100 SoC. It also includes an
> increase of the maximum opps count to the next log level.
>
> base tree: next-20231129
>
> Sibi Sankar (3):
>   firmware: arm_scmi: Fix null pointer dereference during fastchannel init
>   firmware: arm_scmi: Fix freq/power truncation in the perf protocol
>   firmware: arm_scmi: Increase the maximum opp count
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/3] firmware: arm_scmi: Fix null pointer dereference during fastchannel init
      https://git.kernel.org/sudeep.holla/c/3cc12bb83e67
[3/3] firmware: arm_scmi: Increase the maximum opp count
      https://git.kernel.org/sudeep.holla/c/c3f17d5f89fc
--
Regards,
Sudeep


