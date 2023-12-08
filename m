Return-Path: <linux-arm-msm+bounces-3963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACDB80A5E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA2BC281C62
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916541E53C;
	Fri,  8 Dec 2023 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpgiesEX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA9E179A7;
	Fri,  8 Dec 2023 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FC2C433CA;
	Fri,  8 Dec 2023 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047066;
	bh=QRMVM5h4+fVEvQ0BvMG0bbOAh/7k4oCayZJfWKA4imo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YpgiesEX76rqOf3Umuv4sB18o2BP4ybYBXCgiIQNXubhSFpzd8lrdic4ClTuKvjtV
	 MwjxSYgio6/nBIqQZXUf8/MuynMefNyBJItd2ckY693B/oTFfnRBZ/jkUCdbz3staq
	 SvfaL5UIHvIHXWRU/bEtGKRF9UkMzBD4f7bJh04C2RHndKZf5hQC+JkDvtm/WLNVt1
	 Hngt//7K4X529PdtDEKFZH+BFNxSKhcfyR7SQSW5ylpqRIZt7T5o2xAfbiTZ+uWSI0
	 qM359snqYkzfvLbg/zWaYVnVa8BJ/REZKmeBSI1cdnrqDta6Hl0ASV1PvqxqU+CpHg
	 +IE1b/dEv0Rtg==
From: Bjorn Andersson <andersson@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] usb: typec: ucsi: add workaround for several Qualcomm platforms
Date: Fri,  8 Dec 2023 06:55:16 -0800
Message-ID: <170204733611.342318.16716488555248581167.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Oct 2023 14:49:28 +0300, Dmitry Baryshkov wrote:
> The UCSI firmware on Qualcomm SC8180X, SC8280XP and SM8350 are buggy.
> Submitting UCSI_GET_PDOS command for partners which do not actually
> support PD and do not have PDOs causes firmware to crash, preventing
> further UCSI activity. Firmware on newer platforms have fixed this
> issue. In order to still be able to use UCSI functionality on the
> mentioned platforms (e.g. to be able to handle USB role switching),
> apply a workaround that completely shortcuts UCSI_GET_PDOS command for
> the USB-C partner.
> 
> [...]

Applied, thanks!

[1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
      commit: 1d103d6af241dbfc7e11eb9a46dff65db257a37f
[2/2] soc: qcom: pmic_glink: enable UCSI by default
      commit: 4db09e7b967b905ba3036a4d96e81c06b896b1bf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

