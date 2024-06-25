Return-Path: <linux-arm-msm+bounces-24169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BF4917325
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 23:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E996282428
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 21:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822BE176AAF;
	Tue, 25 Jun 2024 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAm8iUuM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527421CABB;
	Tue, 25 Jun 2024 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719350224; cv=none; b=Tel3SpqpIIMaRpcLzSWiJ9iaCKmLor4ZiiuixdSY8xrJ9DEDNUA9LOBaarHaD5LaBI3LupJBLeOgMTTb+HcRmSYyT68AArg8Vkp2+atEETTyd/0DHLWeBNxl70IKrGWJksCQ9cANsW2yr8iB9vd5IQRwN1dRDTKxnBf/Ypv1lg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719350224; c=relaxed/simple;
	bh=9z3yrzPaDTISgM86swa2fwCxrMwIr7mTjR4R/hfAcKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UoMxakjWh6wwwFFHuy5vEAqlnweBOB+HakEXduYPrnDLgr+6xgeZK8uce69EjRGyMx0rWY/cI1Mxzy0X1atqfa6eTpHMzmsxwC0+z1uQUSk9ZhvW9ZFYuWqeoPsX3H+1xPC2AgI6YMfWqvsVgXuylikihMOQH+uBQtmPzmVSeOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAm8iUuM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CF2C32781;
	Tue, 25 Jun 2024 21:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719350224;
	bh=9z3yrzPaDTISgM86swa2fwCxrMwIr7mTjR4R/hfAcKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CAm8iUuMiDrwPlQpjwP/G6r1LY2QYr6WX9Km0Oz+JxbRGLnIMObQlVq3puWdrE/6t
	 OUgOo/th9LeaF9Dzjw7+12SIYxN4O1yyfqTYGB2q86BHvHfWjSmduaofF+J1Jo1JWn
	 HUg5FW6FsA8cUj5DsqKVMDBXSF0e9K/G/sC2Sl4c5Arh40kTrGB54oeqs6cQIo6w+l
	 rEqdqK+QeZEjX9CsNfnQlouY3Ulh+YOhje1eHbzkeka5Dv1Kcwbu/mbqoLHh+WhHBc
	 dkrAQFyXcVRrAHpl7N4s9TxJQWOV7NcAZXRooW+f9hB3ixF5KmyWqpPqcBEKnC93mm
	 tWsc7vptapqXg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-qcp: add audio support
Date: Tue, 25 Jun 2024 16:17:01 -0500
Message-ID: <171935021854.34277.4762982422030513530.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624-qcp-audio-v1-1-323a6b5e1fe5@linaro.org>
References: <20240624-qcp-audio-v1-1-323a6b5e1fe5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Jun 2024 17:33:41 +0100, Srinivas Kandagatla wrote:
> Add audio support to QCP platform which includes 2 x Speakers
> Headset Mic and Headset support.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-qcp: add audio support
      commit: a8cce1ad72caa8ed305b40dec7c075bbebd1c2f3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

