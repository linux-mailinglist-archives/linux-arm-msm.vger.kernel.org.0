Return-Path: <linux-arm-msm+bounces-35698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 307129AE980
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 16:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E930D28253C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 14:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205E41E883B;
	Thu, 24 Oct 2024 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzLW1xOW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81021171C;
	Thu, 24 Oct 2024 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729781978; cv=none; b=Jq7W+5Dqp3MXmkn3FJU4MitsjjxFWNjN1Lo3K9yiWnExu+m4brCZ6peprAcH1WcpPy/drbDwb33BTB3jmQj8ww3SaXzK6Lc2iqOCMB/Tk/CtZoOXXpN3Klj0I8lAKWaVdUxgNUsZAnwNx3xH13aj1X3EYjzYokE9HVVqKH7ckGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729781978; c=relaxed/simple;
	bh=hJGysnbWCQ39UD4Y/bJzxUEu9yZGSb5Piq9FMUY8FmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dxf0VzVKFPmSelqdvV6vjfg186u+YCBbCE5iskJkfcZWgKyRGDo/vTKO+m1gyeZ2W+FAi1qWSjbp4/B7XYE+8TBB52M8REZF8OWVeZrcH1XfQ0yx7SunDQi0cr8jik2QQKXlrSLqAefG0OL8Y6GU/G9eT0TGv3Ija2OeEw4nc2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzLW1xOW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BE3C4CEC7;
	Thu, 24 Oct 2024 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729781977;
	bh=hJGysnbWCQ39UD4Y/bJzxUEu9yZGSb5Piq9FMUY8FmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RzLW1xOW4/mP3ujeyxaDmFlPBeRGMyB/apR/hZKFdsUiC72xmOCrGlCdxoLPAuD5j
	 +UVtXabkrxqb3TNs5m2GSdfE83CAEi5r0ZloLMrwyjxvKuWILjtJGl++iFG127xrmb
	 D2FUONica1VEupweOuK7b2NaB1xqtYBSyi2h30+RE00zQXfkAvScf5oYz5G3w/Kt9E
	 6qDvtcaYH4XZKdUTsZoSECcPosth8MOFj8x3RAXFR7s9Vi+L1oI58ZfNvm1VSxAGqH
	 /Ej9iaJ0LITdYhVed2xK5UJLlOYXSrWqFAlveJVv9rpMoRGevMYVUIhkAvBLJlCiuD
	 p8IOBvQeE8JmQ==
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
	tudor.laurentiu.oss@gmail.com,
	tephan.gerhold@linaro.org,
	johan+linaro@kernel.org
Subject: Re: [PATCH v1 0/2] X1E Dell XPS 9345 Improvements 1
Date: Thu, 24 Oct 2024 09:59:28 -0500
Message-ID: <172978197055.296432.9446476589955050893.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016202253.9677-1-alex.vinarskis@gmail.com>
References: <20241016202253.9677-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Oct 2024 22:15:47 +0200, Aleksandrs Vinarskis wrote:
> First round of improvements.
> 
> * Add experimentally discovered edp enable gpio. Drop panel info, as it is
> now documented in [1]
> * Add Johan Hovold's fix for nvme regulator
> 
> [1] https://lore.kernel.org/all/CAD=FV=Wu3vaY4Rtw4OZwgAf_b44JpDsKJhUa-EXiuu1hn3aJoQ@mail.gmail.com/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100-dell-xps13-9345: route edp-panel enable gpio
      commit: 4e9b7787f80ae366f8a62a5a28955e134e522cc8
[2/2] arm64: dts: qcom: x1e80100-dell-xps13-9345: fix nvme regulator boot glitch
      commit: 06d6fe987bda731b7c6619495aebedf638d37f2d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

