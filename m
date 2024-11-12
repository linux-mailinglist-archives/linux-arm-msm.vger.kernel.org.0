Return-Path: <linux-arm-msm+bounces-37697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF09C63F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 23:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B6082821EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 22:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61FE21895E;
	Tue, 12 Nov 2024 22:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJg+zzBb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB9DD53C;
	Tue, 12 Nov 2024 22:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731449011; cv=none; b=tei31FdSttuPHKenDrmUtugLNnJFNdbbNtxvLnDXW6VrjrGe0Du3QszbBGHkAIJNqJiZPf/AHyMiO3e1dArVa8d864R4boaBoSkQCTw5G/tfrldF6feF53ZEEIJDKx9rXBSyx8GGkWZ75vlTJCbESbP91iPc1UngWUSxu7hs6GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731449011; c=relaxed/simple;
	bh=jADG5RW2/RKMOV71ysIQvjB+TTDj/n5JQO6e3XTjVAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KQSzP4GxwONhBfPR+5bDXkC6hTvTmv3oU4HNCmVtV3G5lDV3DIQazRAB5mWpRauKsHMM4yYKqFrHWXaR5bYpOSi6FbqOUsjcD6YDw4vIDBrdUMXTQeIRZlWsLWevTw3QhOP0SaHAO6OKzLFToZ9Z4zzhiUeBqg4kUFk0DM7KYrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJg+zzBb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58367C4CECD;
	Tue, 12 Nov 2024 22:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731449011;
	bh=jADG5RW2/RKMOV71ysIQvjB+TTDj/n5JQO6e3XTjVAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XJg+zzBbrCZm8BZFClcJI4wcQaqATPEPSAaWhKPKPM6D6yO6Ek/muoDX0ZaE9v9tu
	 37kwMgbiqXeVsXXDUlcHJu17E0pfBXnStroZC+IxdmQ2WnnTgGnv4xBF3GZippATf6
	 JdW3qfej3BJAQh/7qIWtvkCe/PyU+bvOkBOGpiuTyealiQOVRpcZn1TaeTJlkwmSUo
	 z/agt/nBrtjABjJ4B/9uUjZ3TyIHd04zIcPBwbivuNmVuQqOjFJQjM5q+OMTMR7Rf2
	 opdJFD5htnVZ01E20NRPi7647mGBjo2VlHM50UFGD3zkemVILpbgKn8oHQ9a8wCjOn
	 Z+NCLMjS0ZDdw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan.Kemp@dell.com,
	tudor.laurentiu.oss@gmail.com
Subject: Re: (subset) [PATCH v1 0/1] X1E Dell XPS 9345 Improvements 2
Date: Tue, 12 Nov 2024 16:03:24 -0600
Message-ID: <173144900027.331728.17862590936507928028.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030182153.16256-1-alex.vinarskis@gmail.com>
References: <20241030182153.16256-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 30 Oct 2024 19:19:35 +0100, Aleksandrs Vinarskis wrote:
> Describe retimers for the said device. At the moment DP alt mode is
> not working, but this still allows to use USB3.0 in both orientations.
> Once msm-dp is fixed, DP-alt mode enabling patch will follow.
> 
> This patch depends on [1], which is still undergoing reviews. As it
> appears to be close to its final state, sending this already so it can
> be reviewed.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-dell-xps13-9345: Introduce retimer support
      commit: bd2dbbb1f35af9d53b1eb5facc84c35443562930

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

