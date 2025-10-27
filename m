Return-Path: <linux-arm-msm+bounces-79037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 945EDC11C8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0CD0E500492
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E5F338F40;
	Mon, 27 Oct 2025 22:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hnk/Ic38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9AB338F25;
	Mon, 27 Oct 2025 22:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604506; cv=none; b=lkPr0cBKKsY6HH010nWX1erQ0vIJWy4tC7jLpmKd/CmBGLEM91r5r5t8OCXX0plEA9TZMzLtuKirf0NgoTcj9IF7akX4/3zKEESh0Z15FkzNM6+L0Fict0hqtesTyraaG+wUIPkACySs/RwC3LX3x9mfZBALzCSRfnBDPJ72GXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604506; c=relaxed/simple;
	bh=9J3nbXY+kraHriI2qLOaIU0A/yHHoie3NJYUxdSs8Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lGHiiF2F09aSYcaqDXdKJy+jiP7CjuNtpyx9vJLuRg2WxuT+mq68Qerq2yHJ95IrIuERuCuKw4gvzJoss0sBlW/VtA4mKQL4KaNaostpoOKWMg5/fWP8XSSv/5K/ikqwUEy8bPxdsm+h4uE/gcZgElqSxqwAkAS1LQ9dc25pE6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hnk/Ic38; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D756C4CEF1;
	Mon, 27 Oct 2025 22:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604506;
	bh=9J3nbXY+kraHriI2qLOaIU0A/yHHoie3NJYUxdSs8Ek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hnk/Ic38Q4V6G/Wu+qJquhrZ+JHvIMUVYIy2TkZ0/vGZfC9gHfxfLaNdDISfMOvom
	 dHA2VpQsI0r22WCFkGfSD6QFoibc7CPWbTrwneFz/DuKX6pt+cYAhE0F+0zrGbuHyO
	 a8n5H8TwyYDO1RKZVjNKZo7NbFbPJKkl/DHh0rIyQRmw5hGsqwSSfD0MWPyS6R39+Z
	 ioE7RU/5uCw9vjRjGAAz4BM7vkN/1uhareHOLmSdyTjRDtJHwBKBx1DPA9zc6UmytI
	 WXVyRukQxmlvm3mKfAMwfwSfShCdbHbTKq/IyL3bKUbHc/wDzSNsK2L7Yd0puAC2+m
	 9mYfzijB3EacA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] dt-bindings fixes for sdm845-starqltechn
Date: Mon, 27 Oct 2025 17:36:59 -0500
Message-ID: <176160465236.73268.5634325802614675602.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-topic-starltechn_i2c_gpio-v1-0-6d303184ee87@oss.qualcomm.com>
References: <20251015-topic-starltechn_i2c_gpio-v1-0-6d303184ee87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Oct 2025 18:32:15 +0200, Konrad Dybcio wrote:
> Just some low-hanging fruits
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sdm845-starqltechn: Fix i2c-gpio node name
      commit: 6030fa06360b8b8d898b66ac156adaaf990b83cb
[2/2] arm64: dts: qcom: sdm845-starqltechn: Remove stray #address/size-cells
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

