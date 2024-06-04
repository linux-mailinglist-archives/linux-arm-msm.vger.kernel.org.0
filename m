Return-Path: <linux-arm-msm+bounces-21579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF18FB0EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 13:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C22AEB222F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8F7144D20;
	Tue,  4 Jun 2024 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bW3GE3IB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AA7145B03;
	Tue,  4 Jun 2024 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717499847; cv=none; b=Ws7nKY3q5UpzNcB1LpjudIQuHIRIh+J+Haza1LP+mlq+tVvqdnve8QnYGN4J69kHVMfOpjM1RDwf0Yx5ljAZLPf5vpigTRCGyPwp5tqmBUKClED2zulwzdfaAbyG1DAofJvbxP+GnElGo2di2I7MT01X8TmZdVcOlQbF8/tBPEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717499847; c=relaxed/simple;
	bh=ry3W4ejMvdfZDiI2lwHOaYBPQIP4mzzcKeBIDGzh7fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLzfp89WtiQYed57kQJ4Jd33Sfj5JjNP1p2/GnHSkBv7iA9WgORFCGvGMXJ3HuL+M42G4ncEEMqxHAz5l+bNMlk83s7HRoaVfW2XwpQMaUBrmH2E18EPBkJqggnJ6rkd4j0IdBE794Oww5BNihl+aCtcshoc9nBb2YHo8wo8d+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bW3GE3IB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC69C32782;
	Tue,  4 Jun 2024 11:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717499846;
	bh=ry3W4ejMvdfZDiI2lwHOaYBPQIP4mzzcKeBIDGzh7fA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bW3GE3IBaN63Sd741SnX4WqI3Iaqp+mpW7gs8SFSsYkqB2Ko4GSWwZhsvE7+AE/bQ
	 7yRIp1E4/Vr93IoprQ5Hjn+1ADEBLqlHvxtx+9El+tcOi9fUg00VILyBpD6YRLdL5N
	 XCv3e3NVV84QvXqBfZh3Xw1jx/RAQ7XM/0fWoOYVvHm+F4R6vK1agHJ0eBeI2ENoGd
	 zFJTkwiiECReaDb6l7j1MH3USEqln700STIHnpmN3ufjQwChxyNo2CXh1AY3dTeIjk
	 2UoVak7g26TJ0Wzn191eKZJUFimUxbBWHtJBanbgOyacdxJoW+eZVfUhFav+16LVvs
	 WhVnMjExq57PA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sESAP-000000003Jb-0Nm6;
	Tue, 04 Jun 2024 13:17:25 +0200
Date: Tue, 4 Jun 2024 13:17:25 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the X1E80100 QMP PCIe PHY Gen4 x4
Message-ID: <Zl73xRo7JpAZ5ViO@hovoldconsulting.com>
References: <20240531-x1e80100-phy-add-gen4x4-v1-0-5c841dae7850@linaro.org>
 <20240531-x1e80100-phy-add-gen4x4-v1-1-5c841dae7850@linaro.org>
 <Zl26Y0VklPmiirem@hovoldconsulting.com>
 <8e5610de-8091-4a08-a3b8-a0eecdc89438@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e5610de-8091-4a08-a3b8-a0eecdc89438@kernel.org>

On Tue, Jun 04, 2024 at 01:00:35PM +0200, Krzysztof Kozlowski wrote:
> On 03/06/2024 14:43, Johan Hovold wrote:
> > On Fri, May 31, 2024 at 07:06:44PM +0300, Abel Vesa wrote:
> >> The PCIe 6th instance from X1E80100 can be used in both 4-lane mode or
> > 
> > nit: s/PCIe 6th/sixth PCIe/
> > nit: s/from/on/
> > nit: s/both/either/
> 
> That's really nit-picking and not helpful in getting things merged.

Writing proper commit messages with correct grammar is in no way to be
asking too much (especially from experienced kernel devs).

Also, the code does not work so it should not be merged yet anyway.

Johan

