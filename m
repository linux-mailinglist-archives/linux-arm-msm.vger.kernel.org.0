Return-Path: <linux-arm-msm+bounces-3978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A780A60F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFD301F214A1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AF8210EC;
	Fri,  8 Dec 2023 14:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I05Ob8SQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE427200C7
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 14:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E26C4339A;
	Fri,  8 Dec 2023 14:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047082;
	bh=ezbXukdznbtF2XxfnidaejPJUCFYZ2riEOg86Xf13xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I05Ob8SQrW2PPukaGFgdb6zTlKSGUWUXDFDnBy0xMVb2h6mAx/72J+yUhPLN91aPd
	 lNn4vI/ltgK9UcFMa1l5jxty1YTC2cIij79/3OhPnsWYiGtVworXL2dv/XLK8fXzTL
	 Bvv4CEOX2f4oB8lgnjUCSPpSxPk9xWDF7meGRxoCM/T/aaS+xJtbuokI50zfkBhbfJ
	 7kAk6FhC2bPJv2l4KdJFaKzuARfO1FXz6eoJmapAZ1jIcRfIs6IuO68nTzF/b0t9dd
	 zBC4T1Bwj+ykhPBD2fp7+nApTV3ASWrFXyraEN2/sHNzEA3jvNfNaMoI8nnY/xZFif
	 RtNnz0+ybFj+g==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] soc: qcom: stats: Express AOSS QMP module dependency
Date: Fri,  8 Dec 2023 06:55:31 -0800
Message-ID: <170204733605.342318.6755050556623880114.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205-qcom_stats-aoss_qmp-dependency-v1-1-8dabe1b5c32a@quicinc.com>
References: <20231205-qcom_stats-aoss_qmp-dependency-v1-1-8dabe1b5c32a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 05 Dec 2023 20:38:40 -0800, Bjorn Andersson wrote:
> In the case that the Qualcomm Sleep stats driver is builtin and the AOSS
> QMP driver is built as a module, neither the implementation nor the stub
> functions are available during linking, resulting in the following
> errors:
> 
>   qcom_stats.c:(.text+0x33c): undefined reference to `qmp_send'
>   qcom_stats.c:(.text+0x8a0): undefined reference to `qmp_get'
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: stats: Express AOSS QMP module dependency
      commit: 70b139a7af7106b59ca5ca77673a9c56982b3089

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

