Return-Path: <linux-arm-msm+bounces-73594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0355EB57E5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 16:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DC513B34CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 14:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CFD202F70;
	Mon, 15 Sep 2025 14:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePsbBEj7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A582926281;
	Mon, 15 Sep 2025 14:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757945004; cv=none; b=tiCtImbI0H7cM1B2Q3ghGDiKygvKrqHugzgAPlcqx9UrNbMZur60UspnwC40WG8h3TBAbHXWcSsd8FA4BXlrMMTg9+I/GXeNjSTr8rpI5YfIW0P++OKpOMzwV/m6owaTp9aoyq2XxQmnXBc+dJoWyK7+NAK5b6ORg0k/3n8VTrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757945004; c=relaxed/simple;
	bh=3OGpAD/DchUR1g97RRHzHWYq+4uUvSPasPeyQ225Wbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGn9TTW6QtzjJT4SW0Y02Opy8Of434puFnmI8RNTQFBBSBg8x2GPzBmt6FaIn5yGNzZsXY6wMo5/tHxhX4+G9nHrX1MyLqU7ighMBxToY10Y19zdpCIrbxczWELDhq4xn0vO+Hl6ISPrLyfnoC2F19rHw98/8lsoKhiCu9/ookc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePsbBEj7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EDCC4CEF1;
	Mon, 15 Sep 2025 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757945004;
	bh=3OGpAD/DchUR1g97RRHzHWYq+4uUvSPasPeyQ225Wbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ePsbBEj7Xnja3jcodWPE9dWOmMn5QFEarpYbh77+opI5UEfW4s2diz9T0dmsLgpXH
	 7hex+7mEbHOw4A6gcLtg+2YJLyfFsOxm3oNAYi55mbDGYGvEzjSWZEBqfbcFJMv+TZ
	 cFVSWimnCfZai8Lji+z0GAuK7XR+pvIP5ipesFhyp/iU0Qi+xovpCcj7hzTj4yladf
	 Jqk9hrb19xKTnctrFPfpuoZ5/nWiQ2td4pwFxDHLkftR/tp8+RTrDw5ZUh4qhC47WV
	 25nGeIUReGZB9erzYXtEiEnKvwgdOsNbYHIEANFg9/KbyyBH4cxAnXA+xFsuIoorrB
	 dJraCaCEONZVw==
From: Bjorn Andersson <andersson@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Apurupa Pattapu <quic_apurupa@quicinc.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-doc@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kuldeep Singh <quic_kuldsing@quicinc.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v12 00/11] Trusted Execution Environment (TEE) driver for Qualcomm TEE (QTEE)
Date: Mon, 15 Sep 2025 09:03:21 -0500
Message-ID: <175794499686.3800302.11326605409469132909.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Sep 2025 21:07:39 -0700, Amirreza Zarrabi wrote:
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.
> 
> [...]

Applied, thanks!

[01/11] firmware: qcom: tzmem: export shm_bridge create/delete
        commit: 8aa1e3a6f0ffbcfdf3bd7d87feb9090f96c54bc4
[02/11] firmware: qcom: scm: add support for object invocation
        commit: 4b700098c0fc4a76c5c1e54465c8f35e13755294

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

