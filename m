Return-Path: <linux-arm-msm+bounces-42581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 708B39F5217
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 18:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3661A16E234
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 17:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508351F866C;
	Tue, 17 Dec 2024 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqS5blzl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6AE1F4735;
	Tue, 17 Dec 2024 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734455574; cv=none; b=nb/NDfvTAQD1ac11ZK6X/upCcazbMOog3IfQSyGyKKsGDNBULneAjFERaPySODYp5zl+AtVsQcAfpR1QQMG3kR8myzvKMPXHc8fKhVO/dWHMWlEfCjRwARkr+xiSueW05cDlnxpWWZOfBS6x30egcxdg58MXoi2XhMkBMGe5Rnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734455574; c=relaxed/simple;
	bh=cF7o9F9J8om2/yKsO344CwdD5FDj0djBgNVEMiYMls0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERXIEIuvHmUvUEfPdxmj6zAbHsp0jr8PYDBcvkFA4Bq58Ck7Db0IDv8XkDaSl128YnWU4MCtTrTVk5sqxHMBbNhzAC7HsaEou91Bw98CFxWcqqqx0bJGl4b4NlhGSDgFjy1fqItFr4t/Is+w+jbvn8iXc/CXo+dC7r+DVXsZcag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqS5blzl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99BCC4CED3;
	Tue, 17 Dec 2024 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734455574;
	bh=cF7o9F9J8om2/yKsO344CwdD5FDj0djBgNVEMiYMls0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VqS5blzlMIV41JRUsRQRjAZtFcImCMXXOJlY6XXmrI/N6DLHNR+1ct6NlWLv9guG5
	 2HG4HeYr4lYNt3v++IgvlVxqotuECulKPhZZRF6OAUA2beePcHbKuiK+fiBvY3Qowi
	 SshIlWjh5/aVr8XqVRbp98BY08xzqQY5Oqy5NJOyr1lsoWWPaX1EC9VdtKWWvQDxCy
	 4Z9b3MlmFxkdBmiQTqFCfns67pq5sgr6pMWY9CEVQCczXsixsy7Wwp9N0HxYjwEngk
	 uBCjlpjFuQ/SNwh0rqswat9IZeoTiQxONC0z33r6PD/JGesx+E1sWQVm5KnCmsoHo/
	 Qud28MG39LGPg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tNb7w-000000002kp-1mG3;
	Tue, 17 Dec 2024 18:12:57 +0100
Date: Tue, 17 Dec 2024 18:12:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on
 usb-c ports"
Message-ID: <Z2GxGJTrBJ6Md80b@hovoldconsulting.com>
References: <20241206172402.20724-1-johan+linaro@kernel.org>
 <173445353301.470882.1221462093815662513.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173445353301.470882.1221462093815662513.b4-ty@kernel.org>

On Tue, Dec 17, 2024 at 10:38:51AM -0600, Bjorn Andersson wrote:
> 
> On Fri, 06 Dec 2024 18:24:02 +0100, Johan Hovold wrote:
> > This reverts commit 1a48dd7b9ac809d1bd0fd2fef509abba83433846.
> > 
> > A recent change enabling OTG mode on the Lenovo ThinkPad T14s USB-C
> > ports can break SuperSpeed device hotplugging. The host controller is
> > enumerated, but the device is not:
> > 
> > 	xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
> > 	xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 3
> > 	xhci-hcd xhci-hcd.5.auto: hcc params 0x0110ffc5 hci version 0x110 quirks 0x000080a000000810
> > 	xhci-hcd xhci-hcd.5.auto: irq 247, io mem 0x0a800000
> > 	xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
> > 	xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 4
> > 	xhci-hcd xhci-hcd.5.auto: Host supports USB 3.1 Enhanced SuperSpeed
> > 	hub 3-0:1.0: USB hub found
> > 	hub 3-0:1.0: 1 port detected
> > 	hub 4-0:1.0: USB hub found
> > 	hub 4-0:1.0: 1 port detected
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
>       commit: 1fb5cf0d165afc3be76ec754d1b1013515c3896a

Oh, you appear to have picked v1 here.

We need to revert also the other two patches from that series to address
a suspend issue and to unbreak UCSI and DP support:

	https://lore.kernel.org/lkml/20241210111444.26240-1-johan+linaro@kernel.org/

Johan

