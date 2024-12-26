Return-Path: <linux-arm-msm+bounces-43400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7841F9FCCD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B49A161EED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8357F1DDC2B;
	Thu, 26 Dec 2024 18:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcMQnyfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAFF1DDC21;
	Thu, 26 Dec 2024 18:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237655; cv=none; b=mUfk9VR8joY8Bg/yBvrKmLVf/9Vv+7SxWGtICiN5UFb8/QxTk/1kSwZiKJBI5Z0e143RtHHWqlGgIW2ta5fg4r6BKmFiX407nW/ppDhlIHzdkzmldGtdF5/yKrmLHN+J7n6jaKzqOAescdha3nv5678Ax1nlrPyVSPbuAUkcvZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237655; c=relaxed/simple;
	bh=LTc+WoUeCYnIQzjN6X4Ak9wbsCzm2YzVsqNifP2wGvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=soJmgq9GfDAXF9wLQDOB1ax1pbypwW6NnRqFiqlM/5b3knghZhozS6Z/ISJUMujzmfSsz1DJ3FwjzyijqGDv223/Jo33K4Uxqc7XYqV0TjUzXZarpz0XkXOWz5G+EECpwjxTF05flrJm1fNNNNIZhv70elPsre1sl8AN1XMBnoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcMQnyfp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEECC4CED6;
	Thu, 26 Dec 2024 18:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237655;
	bh=LTc+WoUeCYnIQzjN6X4Ak9wbsCzm2YzVsqNifP2wGvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BcMQnyfpK9pQzjKCLsJc70+U+uStZ5fG5U7/0wORiUc1qkYYh/UVR+XILxSOeWcbt
	 qXnOnl830rtgfndLL47zalkO5gC9Pjm4kFVNWFLDSnzjtHLY3dOZsAAIP6IFJ+jXZS
	 03uvSuVnOJJPxiB+9K3c4eckylIqWYTGgZwQHygLSBp7JR4IxPanletpQXpTp+StqB
	 5dD/iT7D4WjhKq86Py42ox1rwAfpWuIicm27wW6iOg7X8vgCWvGZ2kOPJg+JQ4QS/Y
	 Uk+GbfAAeSJ6EyjpAUQ7UqLCeOALZd9Wogn8JaN3GCSydEyUtS+exvCPxMNf1yIU7k
	 x6Ry4rzf1SfyQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Jinlong Mao <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: fix the secure device bootup issue
Date: Thu, 26 Dec 2024 12:26:53 -0600
Message-ID: <173523761378.1412574.8647451673427912090.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219025216.3463527-1-quic_jiegan@quicinc.com>
References: <20241219025216.3463527-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Dec 2024 10:52:16 +0800, Jie Gan wrote:
> The secure device(fused) cannot bootup with TPDM_DCC device. So
> disable it in DT.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: fix the secure device bootup issue
      commit: 8a6442ec3437083348f32a6159b9a67bf66417bc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

