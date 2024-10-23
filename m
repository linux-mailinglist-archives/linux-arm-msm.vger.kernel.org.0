Return-Path: <linux-arm-msm+bounces-35511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A9F9ABCCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E28FB1C22A55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05A1153BF8;
	Wed, 23 Oct 2024 04:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOnMd4Ex"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F22153BD7;
	Wed, 23 Oct 2024 04:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656982; cv=none; b=Rqpj0MiVyKTUnCyoHMKAYpO+LKY/x/CwLuVz1q7CnXFu9hfOB+hWgIUhfpw2AM379U+DMDDZxAXPUSfeodKdMg1Ibf498c+9iz24QxrBWIdU+jfQcvPhPN8lrNriX+81ZH/4XAP//0c5Pn+I0j8d5Bgpx/0KdVEbgyCyHtvlCYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656982; c=relaxed/simple;
	bh=Grrx9KZ90tgJBvR35H7x6Po/nQTWGAJoQ8XcbKsWDVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VDyY5Zk2m4hM8OBURB+2USXnobjm9r3XJMez0/9h9FJ/hm9yrBBNjKIYbitgaOQ52otrRD9SHoc+iB0QBSAvFYZ1adN+Rer/sk2kSj3+VNJjAL9FSrnWh2bmo1FKKeIU2CLhTNuouhA35EZ4IWA6JPrLdl4OKusP1EdBXooWHk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOnMd4Ex; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD42C4CEE6;
	Wed, 23 Oct 2024 04:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656982;
	bh=Grrx9KZ90tgJBvR35H7x6Po/nQTWGAJoQ8XcbKsWDVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DOnMd4ExHLbIK8oi9igZ1odR7V+V2Xg01M/bHi4+Rs+Mxa7bl3rBlnNxeXUpPL34j
	 arz/+noIPyrm99sDDlPPHLCCoX+uB/waawZjPxq1mqkRXqvVqjkEZPYf/J+RxcNz/p
	 uITg3Z0IKAmCag0BwnUaoDHfJL80onQ8IYMA1bj3Z0Pu4PxrwQ1oR/1QvdCWY9t21H
	 xl1evLJLnXjr/RDztu/kF6GsZs4XPBsQBb7CjJOTyTng2NOz7XsNy3GK5nmL3SGGQR
	 I7EeJYUL8899q9UE442GNt3Avg8KY9pspYqmV8V7jzMgIuS5ICekaVHtLGBevaSoO4
	 H8GN3g+MDa26Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingqing Zhou <quic_qqzhou@quicinc.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>
Subject: Re: [PATCH v3] firmware: qcom: scm: Return -EOPNOTSUPP for unsupported SHM bridge enabling
Date: Tue, 22 Oct 2024 23:15:59 -0500
Message-ID: <172965696408.224417.2033308332604008573.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241022192148.1626633-1-quic_kuldsing@quicinc.com>
References: <20241022192148.1626633-1-quic_kuldsing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Oct 2024 00:51:48 +0530, Kuldeep Singh wrote:
> When enabling SHM bridge, QTEE returns 0 and sets error 4 in result to
> qcom_scm for unsupported platforms. Currently, tzmem interprets this as
> an unknown error rather than recognizing it as an unsupported platform.
> 
> Error log:
> [    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
> [    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4
> 
> [...]

Applied, thanks!

[1/1] firmware: qcom: scm: Return -EOPNOTSUPP for unsupported SHM bridge enabling
      commit: f489f6c6eb26482010470d77bad3901a3de1b166

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

