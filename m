Return-Path: <linux-arm-msm+bounces-30153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FAD9657EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B496B20A5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 07:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882EE1531C2;
	Fri, 30 Aug 2024 07:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mf7pgy18"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E8B13632B;
	Fri, 30 Aug 2024 07:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725001346; cv=none; b=roJkrTdq677r67wP1qMD4YLSb+q8NHl5+FCf4QnQG69ivPXXZmPS7721D4km1KWvPz1c7UvmdsT3BPsl6DcZ63J36G4gjLkEW+wvUe7VrHUfPLJT9WM/OCCsnYI26GLAOobEfaBSsy0bd41n9t5/viCog65m3zzoq/gVT/PQKOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725001346; c=relaxed/simple;
	bh=e7xlw6l/apKeXFx69GdTklnR4Cj8sE4nAxQVfqOlJQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWrCRKgHIiEbAE+8A9N0adbXVXCGksrUA3/h1+9w4ZkNaHbXD+CoURW9qCMNFKj4GDn4Fw0y5Xl0Gh9bZgKG4GWf0qB4KKnhLn6qaGqZl9SFl+Monbc4TIGJvYSJP3pn0BgGPm7XkABBs4+isLiQ3iPncss45YyJfr7c5GYikmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mf7pgy18; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7D7C4CEC2;
	Fri, 30 Aug 2024 07:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725001345;
	bh=e7xlw6l/apKeXFx69GdTklnR4Cj8sE4nAxQVfqOlJQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mf7pgy185Mln6f06yY8mICXyr4Uy1VM/Oc5bvpoFl1i63PlvVfOwfkVJcoXumuDn7
	 NzlfIURZHI2kObk0LgGEevXDCk53fFfZE2z0kvS7U58meWx032JgdrzWCJbJGjevOp
	 46/N0x48xJuM4UuTqHZY0rqtibQALiky35eo6wykDkMADXT/mwWFogo44TiZT2QUpY
	 mMAaYHYfEh5gH8it+8ZpciQYOH2yWs8z6jbREto7pNl2WsfK/Ucs11DWV/3PoPClUk
	 w6O3Ew02jHt6qynydWHOo56i/Bvq3YJPfwVpgGQrIKY2ptGisfd2LkLdPoLgNm7u/f
	 FX3lz/uSBQt5w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sjveZ-000000004jx-2EIe;
	Fri, 30 Aug 2024 09:02:39 +0200
Date: Fri, 30 Aug 2024 09:02:39 +0200
From: Johan Hovold <johan@kernel.org>
To: Marcus Glocker <marcus@nazgul.ch>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add UFS node
Message-ID: <ZtFuj9Qswmgg4bBu@hovoldconsulting.com>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <g5vlxrttgvfqkktlkhu4uzhtvnp3qtjcbr7l2uztapzqwhrsem@wg574xldh5ar>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g5vlxrttgvfqkktlkhu4uzhtvnp3qtjcbr7l2uztapzqwhrsem@wg574xldh5ar>

On Sat, Aug 17, 2024 at 10:38:39PM +0200, Marcus Glocker wrote:
> Add the UFS Host Controller node.  This was basically copied from the
> arch/arm64/boot/dts/qcom/sc7180.dtsi file.
> 
> Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Also, when respinning, please add the missing "x1e80100: " to the
Subject prefix.

Johan

