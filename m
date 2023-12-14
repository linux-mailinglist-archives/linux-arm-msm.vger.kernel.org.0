Return-Path: <linux-arm-msm+bounces-4681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB1F8129B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 08:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 147B81F2126C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 07:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1686B12E7F;
	Thu, 14 Dec 2023 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9fGXx9q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDC212E6B;
	Thu, 14 Dec 2023 07:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43C8C433C8;
	Thu, 14 Dec 2023 07:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702540057;
	bh=ovZ6zAePYvXD9jRWW6q/p7/dTB87cBa34W1V20uuBAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9fGXx9qKV+vxhEP/SeePB7AsEuV+hoBj7DlvaXnYxwmAvffPiqliig3m5TJ9oyjB
	 K3tAuO+XjLoON/eUxLNlwk3qfyyzoO8UD775/diDY6n4LdvR1UIrLXlaXafvw1zol3
	 cD+FHTrpdo2Pc+RbLnwOqZKF+fvLf251h1KkAqb7I3PlUEJO2ZWe1JEVxI3yItlqCp
	 ZZPd2G3bIUF/t0zit8LI5Z4qYJtk9/myioET4ZzRiRSQUae9XWXs4VIPynMgZ2nrgj
	 3LwvbTRda5RoxkH5zWLt1ea3mWIHUHov2CK1vu6MOTCYIw98TWcvCKYYXsiBp6mtQp
	 xNdETgWmQOL6w==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rDgRV-0002uZ-0E;
	Thu, 14 Dec 2023 08:47:37 +0100
Date: Thu, 14 Dec 2023 08:47:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: dts: qcom: fix USB wakeup interrupts again
Message-ID: <ZXqzGculNm7vwUvh@hovoldconsulting.com>
References: <20231213173403.29544-1-johan+linaro@kernel.org>
 <e2ce47e8-fe27-4ca0-b295-cf7e12eae1ce@linaro.org>
 <4b73d53e-ee25-4764-a916-973674d83fc9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b73d53e-ee25-4764-a916-973674d83fc9@quicinc.com>

On Thu, Dec 14, 2023 at 07:25:51AM +0530, Krishna Kurapati PSSNV wrote:
> On 12/14/2023 12:19 AM, Konrad Dybcio wrote:
> > On 12/13/23 18:33, Johan Hovold wrote:

> >> Note sdm670 and sm6375 need similar fixes and I believe Bjorn is trying
> >> to dig out the corresponding vectors. The SS PHY interrupt on sc8180x
> >> should also be fixed.
> > sdm670:
> > 
> > pdc 9 DP
> > pdc 8 DM
> > pdc 6 usb3
> > 
> And for second controller of sdm670/sdm845,
> 
> pdc 11 DP
> pdc 10 DM
> pdc 7 SS

Thanks! Looks like we only describe the first controller on sdm670
currently.

I just sent a follow-on series for sdm670 and the sc8180x SS PHY
interrupts here:

	https://lore.kernel.org/r/20231214074319.11023-1-johan+linaro@kernel.org

Note that I inferred (guessed) the SS PHY numbers based on
sdm670/sdm845/sm8150 which all appear to use the same configuration.

After that series, only sm6375 remains to be fixed.

Johan

