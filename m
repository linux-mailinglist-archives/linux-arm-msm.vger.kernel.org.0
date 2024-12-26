Return-Path: <linux-arm-msm+bounces-43439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BEE9FCEB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBA3D1635B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FEE1DAC81;
	Thu, 26 Dec 2024 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ID7sG55Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3461DA632;
	Thu, 26 Dec 2024 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252754; cv=none; b=JBXg7eZnoKAgBcCGMXddXi0nJ0zwkUlL1LM8OjY+CNGRHcrMw89Oq/zmJmulf24GpkeAuUdJrPSOFUZl5laaeMnr3eUCViSLsJQ2ye6VkAdzgFr6ag6Grr+1egf88hgFQDtUkrK4VKFiJG7H7bh5sczYt5VPY5k9DZwG6rYk3RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252754; c=relaxed/simple;
	bh=7IsAmQdhceuUAN7oPdCA6H/ErAuYo5q3mjnfI7KigM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t8FTC3VUeM5NV87Nv2zuXPu4ujVUne5LjT9S9tmq31iS8M4J4jStibTvdwT0fSqS2XX4bJkjSR6T8gbDEDjjxtwsfWjEriiZhUE1JY+1cQ47LR0tukHr/wVFcwIHDmQ7a0JklqFHPWmw7MrIv6SHARf3jk4g8O7fLDlZswxcFgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ID7sG55Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B813C4CED6;
	Thu, 26 Dec 2024 22:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252754;
	bh=7IsAmQdhceuUAN7oPdCA6H/ErAuYo5q3mjnfI7KigM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ID7sG55Qm59v7eEsE3FaWzblhvzhkeeVmhjY+FyK68oDv4beEFBHjy3bLIkp2o+7I
	 XhTmDZvdgiZNPdsN/jvu/NFPzwFkhhJfpelvkdeb2Q5h1AWex/1dp30VLjtYZ0wuSw
	 F+RuHASOLA4v2UBpqoPhVcNrfeoQhXMGeXXcDyCkRCnOn8DAzCtylcIxqpA2EyYGIL
	 +exGZMXmIkuoWSEQsqgyxYw6lEWnj/sS96yTjR/+Z1bITAH1Eo9nia8RY2KTadj3kb
	 jd+A+Tt7zdkLihdB+D8AeoXh1ZgpwFthYHxdXfV269srWa18wUp2olHk9uWarHsXxW
	 0yy+vUN8gQbZw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Maud Spierings <maud_spierings@hotmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v6 0/3] Asus vivobook s15 improvements
Date: Thu, 26 Dec 2024 16:38:43 -0600
Message-ID: <173525273255.1449028.8281563129822244980.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204-asus_qcom_display-v6-0-91079cd8234e@hotmail.com>
References: <20241204-asus_qcom_display-v6-0-91079cd8234e@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 04 Dec 2024 13:26:36 +0100, Maud Spierings wrote:
> Improves several parts of the devicetree:
> 1. The eDP panel bindings
> 2. Add a lid switch
> 3. Add bluetooth and describe wlan (depends on [1])
> 
> A big part of the bluetooth/wifi patch was copied from [1] as it is
> mostly boiler plate regulator definitions
> [1]: https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: x1e80100-vivobook-s15: Use the samsung,atna33xc20 panel driver
      commit: 9861aefc51102c8f4b419b57af451b63af0dd79c
[2/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add lid switch
      commit: 235aff9707ba2fa0761ebe6d1b886fcd39869583

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

