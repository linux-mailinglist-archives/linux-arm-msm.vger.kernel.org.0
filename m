Return-Path: <linux-arm-msm+bounces-101523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DIpMxNDzmlQmQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:21:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18085387A00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82BEF3005783
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 10:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1413DD533;
	Thu,  2 Apr 2026 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0Prmfeb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F7C3DB64F;
	Thu,  2 Apr 2026 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775124969; cv=none; b=sqtKjXp2aey+PKmJCtYua14CUFkkuQ6GXX6hCLzqHJmTIQ1oJrPPJjY/iNDMarlUvEUfucd6lCSN1HejtRcYyK+vMxVDcyV+fEEvvYvYc5UFYKTkmSyGruS5RKyI8BeVdo0llx3qg7NANSgzvhWPVxdOYuXbnwIaOIMfS3+c14c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775124969; c=relaxed/simple;
	bh=GuHVOjt1yqvX+pZjIhLGmSdFnwuAJKg7OllaNp94qLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzpmPZa0ncmPwW7Ig6qatANMkh3vR6fZ5vKqFmjCvFc0V0OAbkv8mMCmFlbOYfd+2kkAZdlt15NRyiXTsvLZYv+L/NG3oDLOwL+edWT9dwlP+ysc+9BeiGrjlLS8PX03YFB8CkMlKPnpIQk1hpcJR5HhyoA3jP7nq3HgZYvL5CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0Prmfeb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C0CC116C6;
	Thu,  2 Apr 2026 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775124969;
	bh=GuHVOjt1yqvX+pZjIhLGmSdFnwuAJKg7OllaNp94qLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0PrmfebYrssxy0V3EVRd5S4hc0UAVIHSGpBJtafBVo3BS02Ey0XH4TKc+Lrlw1N0
	 yvromKgwR8Y6AraKZebwFxgplnLWN03j20EED7mpuxhr4N96w20lZtFGSX9QdYdP5R
	 Cux9IV3o34qtNagoUhBOzVrsYHUZ7XP3c4dD3zLIVpmFmTt0IZTkBu2+LSemNLH4rk
	 gYUf6woUxU9ekMXBQzJzgoHNg7AF0bhKbgTvzc8nnBGPLlLKa1DDq+JJcGk6M/Si0u
	 8dKYzxu4Ni6eW4O7KICjq+OInZJVyXbWo/dy3U/SS1M/FjgEq0qRl/iAOIHt6WPWc3
	 31aSAI5CN/PVQ==
Date: Thu, 2 Apr 2026 12:16:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, prasad.sodagudi@oss.qualcomm.com, 
	aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com, 
	jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
Subject: Re: [PATCH v6 00/13] Enable I2C on SA8255p Qualcomm platforms
Message-ID: <ac5BiFn28inwixCi@zenone.zhora.eu>
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
 <873425m329.fsf@kernel.org>
 <3d3f51e7-02c1-4628-a381-5a1ba67b5bc1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d3f51e7-02c1-4628-a381-5a1ba67b5bc1@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101523-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,a90000:email,gitlab.com:url,0.13.148.144:email]
X-Rspamd-Queue-Id: 18085387A00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > Note that I used a downstream device tree which has both
> > i2c11 (i2c@a90000) and i2c18(i2c@890000) enabled.
> > 
> > The sources for that dts can be found here:
> > https://gitlab.com/mkorpershoek-rh/downstream-dtbs/-/tree/8775-upstream-i2c/qcom?ref_type=heads
> > 
> > If this is considered useful testing, feel free to add:
> > 
> > Tested-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> 
> Thank you for validation and Tested-by tag.
> 
> @Andi Shyti, Looking forward to the series being picked up. Feedback is
> welcome if anything further is needed.

Yes, I can take everything in the i2c branches, but I need
Bjorn's ack here for the Qualcomm part.

Thanks,
Andi

