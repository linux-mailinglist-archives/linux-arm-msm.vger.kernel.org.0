Return-Path: <linux-arm-msm+bounces-49365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5A8A44A5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F12423B64D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FB920D4FC;
	Tue, 25 Feb 2025 18:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8XWFPib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFC820CCF1;
	Tue, 25 Feb 2025 18:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507509; cv=none; b=YD13etFBy8SrqW4DvblsYvHk2hWc2VWQGavWl0EU90jrfbDiRjD+n5wiqmbQM8zDeL8Y0r2wOWFcvuryTy5sLtiZqKijCNLzCuz6DTvQF0QpQgmxbCVidtp5doCY8GZjvw04iBslZ7zFK2jDIGTXaxr+IhoYVNQ/KYxvnsn/+mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507509; c=relaxed/simple;
	bh=R0JsbmlRl1mCZ4wHR54uRLWjDw2813YSJaxnEcvcPhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HAx7okk5vSa5tAsjJLD5XArxhgZk7b8YaViW05wR0dVCX5jGjdwCbk8IeNDopfmJptqMHcClyTnw7CPYk0yroIYEnoG5a5kBu1k6F9n2CKuBXNfEDb61m/1LQO1Gr+WT/OsSuXz82ONM+HW8Wis3YztFvw5hc3qjLIkwd+ykMuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8XWFPib; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D320AC4CEEB;
	Tue, 25 Feb 2025 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740507509;
	bh=R0JsbmlRl1mCZ4wHR54uRLWjDw2813YSJaxnEcvcPhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f8XWFPibyKK3Qt6AoY6ErIKUHfQFlx4O1V4kt44d5gVvu8ENRhGb5B7qHmYhXzUw0
	 lkFNp9F0OifLicfwlyvTFXQci8uS0TLA3H2rslOMjB2B0wtpO2oCgqMUmtZzTIa1gw
	 caGOdruSaZAIJOJzhT7exgrnlNihxR8insCTie6xyoY8iFkfHootlH8ECLxojR/172
	 vPfKx/yGlnvNhthQbHmcgtTvWbuo+moUY1LvyKvUmxI9cY6NA4GKKrJP6uQYjUbsa1
	 L6mlidLfVDLEYEG9qYuq5LEGu+S8iLG7VlVHZYggwcEw46I0afdqhWTbSuZl7nue76
	 S3bi1cp7Yl4jw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	Rakesh Kota <quic_kotarake@quicinc.com>
Cc: quic_kamalw@quicinc.com,
	quic_jprakash@quicinc.com
Subject: Re: [PATCH V3] arm64: dts: qcs6490-rb3gen2: Add vadc and adc-tm channels
Date: Tue, 25 Feb 2025 12:18:09 -0600
Message-ID: <174050748687.199016.17625102573920194412.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212113342.873086-1-quic_kotarake@quicinc.com>
References: <20250212113342.873086-1-quic_kotarake@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Feb 2025 17:03:42 +0530, Rakesh Kota wrote:
> Add support for vadc and adc-tm channels which are used for
> monitoring thermistors present on the platform.
> 
> - Add the necessary includes for qcom,spmi-adc7-pm7325 and
>   qcom,spmi-adc7-pmk8350.
> - Add thermal zones for quiet-thermal, sdm-skin-thermal, and
>   xo-thermal, and define their polling delays and thermal sensors.
> - Configure the pm7325_temp_alarm node to use the pmk8350_vadc
>   channel for thermal monitoring.
> - Configure the pmk8350_adc_tm node to enable its thermal sensors
>   and define their registers and settings.
> - Configure the pmk8350_vadc node to define its channels and settings
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcs6490-rb3gen2: Add vadc and adc-tm channels
      commit: a9ca8e5c6379f00efbfbccd873ff66b0f0c46873

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

