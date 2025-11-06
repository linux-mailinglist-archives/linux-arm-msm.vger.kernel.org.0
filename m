Return-Path: <linux-arm-msm+bounces-80529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D12A2C39837
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 09:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BD243AFBB7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 08:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8663009F1;
	Thu,  6 Nov 2025 08:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="db137QY9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2A23009DA;
	Thu,  6 Nov 2025 08:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762416439; cv=none; b=QxBG0R5FO5W40tgx4kOTJqn22sFTSmaor4sfy76hDntKNsZkeWyn0kQhFX7XVCeHMgAYwJ2x03ZNpQNdeH8c+L1rdYEhFowcIKRALqsy71e936hgNpMUsb2amnFE0LpkWuDlw6cVObfMxsibNua4Fxfsvw7+TlDyFbEOYMPSBxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762416439; c=relaxed/simple;
	bh=hL74P79EdWpNV4O8NbxwXeTRUztCSFQXZ+iOTEHWZRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noZCjQGihcmV3KQHgqHQgEKOC377M/X+sCmwQL3sMZqGjsH4V8Qv9+lNCvbCN07gyhbz515WDYbskNno2zPSt6M11VBDSKM0DRPxkL978SX57TbcxLVwpl6QWf1px62HUv1QqQLin0PYQUZH3w80zR9VDRMwlxaheexHD931cDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=db137QY9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E62DC4AF0B;
	Thu,  6 Nov 2025 08:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762416438;
	bh=hL74P79EdWpNV4O8NbxwXeTRUztCSFQXZ+iOTEHWZRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=db137QY9b0uA9ABajAH0MnAZtcpenBeYsKjc9cX5aNXFFGQ3K7RaWkloQPahGpUC6
	 RRB0ChR2/TrAcPUd/9JkIz/pw8gSwDfdgRKgiEWCP6MAobnK+7+WYih+xN6nyP/y2c
	 w4/QzxBQDmCTaVV0ennljYXmaVQeIW5N0FfOYCevAxjr1llu4nH7SctSxBmRqZgbNx
	 jcjt8nAPRzNo/D2jPyyHmhYmA+mIxE5NqzwqOsqZ23jRtFVjhmRb0k/uX5n6xJyow/
	 YWPQftrTpVDYpm/IvLhRATav5c7vI7KQ758rEMHktyO9YQtDxRLXnGAtWq2IT8jmjP
	 zphdb/Fwho5iw==
Date: Thu, 6 Nov 2025 09:07:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ettore Chimenti <ettore.chimenti@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	stefan.schmidt@linaro.org, stephan.gerhold@linaro.org, wse@tuxedocomputers.com, 
	cs@tuxedo.de
Subject: Re: [PATCH v2 1/7] dt-bindings: vendor-prefixes: Add ASL Xiamen
 Technology
Message-ID: <20251106-utopian-malkoha-of-respect-9eee71@kuoka>
References: <20251105154107.148187-1-ggo@tuxedocomputers.com>
 <20251105154107.148187-2-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105154107.148187-2-ggo@tuxedocomputers.com>

On Wed, Nov 05, 2025 at 04:41:01PM +0100, Georg Gottleuber wrote:
> From: Ettore Chimenti <ettore.chimenti@linaro.org>
> 
> ASL Xiamen Technology Co. Ltd. is a Chinese high-speed interface and
> display system chip design company. Adding it to the vendor prefixes.
> 
> Link: https://www.asl-tek.com/
> 
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Also, incomplete DCO.

Please read submittng patches.

Best regards,
Krzysztof


