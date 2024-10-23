Return-Path: <linux-arm-msm+bounces-35509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A469ABCC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 957121C22B1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9CF14EC77;
	Wed, 23 Oct 2024 04:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCPgPHE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B405414D6EB;
	Wed, 23 Oct 2024 04:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656980; cv=none; b=ent9zCacGpZImS3FD00j/zlYH+VtXVqjVfL9dQlG208RoXm4dlX9iQBmSBE/7/qi1wg0yzU/Cp22iYlMDB/5nfaYkkmW0ClRJQ560tnM2vGy1PgYwgFaU0nW0iCgkYCrKU6dr2J1ZG5lExyJWrPgiQRa1ihNGHlnfeU2B0tmau0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656980; c=relaxed/simple;
	bh=N14KHiijB3PmI7LnNC3AS2DmGJh6+HTTE8Srpn+ssjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nHzv8GRNmPz6R90NrAMzgyCX7LCqxlE5VyYTdXQ7HgpEpfCJinE8ElVMg+YEqNIKWfWPsQbI3/uyJpkcfcSBm/QdQWQxAxT9vCfuMmdcqBXDPrd2EoGi0IrTOESjy2qNYpsNSjtiK+TarP8l4uLt9xJOXQt7Nc6w71EF1KP7e08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCPgPHE9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93DCC4CEC6;
	Wed, 23 Oct 2024 04:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656980;
	bh=N14KHiijB3PmI7LnNC3AS2DmGJh6+HTTE8Srpn+ssjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DCPgPHE9Zqe3vSC9W6fWlVSzPMAbvFeiSIklcnUp5i2eHjrP1unFl4X/nyaU+NgGs
	 Zd4SrvojYfMoM8RjFBNzO8xwIcvijXKJDIhtWQvphpm9H6gFRplRz8wxDTKemt85VN
	 mWdoouXBHUL0/nwJSFyd4MPQ10ihZDwgeu7DM/gF1HvWCRbkN+tczZUwDbe5dspGkM
	 p/q2g23A8why8dyquEhn4iC0FsVHe5XV3a39wyGZ29TpfBAaQL3sPxjQhlq0BY3yNY
	 JwLrihzfvyWFoT6KB4yrgQqCB6Y/+z1W5u0sQIjritRdgXdHV6BzNvGyb8dZ9Vkd3y
	 rpo5N+kOV1ioQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-crd Rename "Twitter" to "Tweeter"
Date: Tue, 22 Oct 2024 23:15:57 -0500
Message-ID: <172965696397.224417.6555387602908598104.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241019190214.3337-2-maccraft123mc@gmail.com>
References: <20241019190214.3337-2-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 19 Oct 2024 21:02:15 +0200, Maya Matuszczyk wrote:
> This makes the name consistent with both other x1e80100 devices and the
> dictionary. A UCM fix was merged already and is required in order for
> sound to work after this commit.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-crd Rename "Twitter" to "Tweeter"
      commit: 787ade24cc3af4a8ec9498c9cd8a6d47a4d86485

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

