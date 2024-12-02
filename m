Return-Path: <linux-arm-msm+bounces-39919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 360D79E082A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 17:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1167416ECDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718DD1632C5;
	Mon,  2 Dec 2024 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzCj7D4I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4515B15C14F;
	Mon,  2 Dec 2024 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154676; cv=none; b=W5jC/s3s6JJFWLbOlYR3CNpGqI1oP2oHev0fpIs/WzenaCuvgCun9y27HbwJVchjKW5Go4YmBOjrdIsSMrqLTklh0ws6XvGA9qw1naK3KgIxVGOxvnn79lyGedK0Wr7DAmSxG1SNMwSQAI8xAEpkZN76Gb+fmpycukS4RdsNh5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154676; c=relaxed/simple;
	bh=AcITv8v7xwO3OcPABb6z0A8v9LpEl+qK/t+N2ODkNrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jd/CyIkBOdSa0rLtDtq72apmmVNR69Ohe6QBGiE006dMSmgURjZW4Y2LfMpVXdpV7feC2PbOidTmbxTH5Ka1y0PmIePpXHq7KSTiXmUUOooRqnzZQpFZi10V6pOWq2XQBzZS5C47ILyv/9EJi0NhCeO5svUh0YrW29Py9N55ok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzCj7D4I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FABC4CED9;
	Mon,  2 Dec 2024 15:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154676;
	bh=AcITv8v7xwO3OcPABb6z0A8v9LpEl+qK/t+N2ODkNrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fzCj7D4Iv0UmlDFLVKF4TSbNp9g7i8UYQjML9it1xvog2TWHy/3P+OkyjrigfyV1q
	 AlmT54s5sdmZU2Yt5cQpDTAKDKgAZT4JB1QoJTot2qqjrSCNK+um/EGQkyGA6WP6rY
	 iYEqdYk1ww8D6TTTaYVNyVk205RImiaG9s3J4Ko+lYqES3JrN7g6nXuFM2CjazzWWH
	 FbatlltOpHAT/1Lxqt01DXghJOzXf1ES0b5ezzROO/hOy87qdQi/6fMOZVz6poSkxl
	 4oegBzcpha5WOzGrYW/sJ6aFQcpoaWxqIWnUJfzi7ZZTC5k01BrlhX7ticcFVVjLop
	 pv91zCgpNTb1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH v2 0/2] Add DT Support for primary USB on QCS615
Date: Mon,  2 Dec 2024 09:51:02 -0600
Message-ID: <173315466532.263019.3718496755521104621.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121063007.2737908-1-quic_kriskura@quicinc.com>
References: <20241121063007.2737908-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 Nov 2024 12:00:05 +0530, Krishna Kurapati wrote:
> QCS615 has two USB controllers. Adding primary USB controller support
> in this series. Both the HS Phys are QUSB2 ones. Although the HS PHY
> is a QUSB2, it still uses DP/DM interrupts for wakeup instead of QUSB2.
> 
> The primary port has been enabled in peripheral mode as it is intended
> for debugging purposes.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: Add support for usb node on QCS615
      commit: 4b2769c7d7ce47a64f874eac92b324f3561339ab
[2/2] arm64: dts: qcom: Enable Primary USB controller on QCS615 Ride
      commit: 5c66811c9251303b2806caa04b278b4826e7a408

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

