Return-Path: <linux-arm-msm+bounces-100001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGv9Nx2nxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:25:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B4732EC5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C23A3051879
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F813939C2;
	Thu, 26 Mar 2026 03:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSoSjXrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28063932EF;
	Thu, 26 Mar 2026 03:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495175; cv=none; b=fN8UPZFGkxBM4FCnIlDoDrrFTVp9cYaZknKdNJ/6gxM752m4DUCAmKMn9YI9rvD48M2pyjEgaoknW1M3B3XXkayvDaww0PfHLxl0DBSNr21pyVBo3T3OBVjh7EDfA1IRBCgu0Uy7kf0YQ3vBMaOqRdB0Tx4vPY3DbCPrS0nm3QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495175; c=relaxed/simple;
	bh=BIYxWY0MypFymISpdje/gZE750/SPCzLGSTXlPLhjZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FBcfweJwtjuY7LYi+2uV7mLuTaW7bQYLnvpBXNszSkjL/RNLvigKZpOrE7V7wkrf84eMSs8NJANqQLyFQeOvpVRIFo8VVY+Q6NJR+NQq20kaiIBQvPscu3/1bJycOiDtv6DYOlHBQeJIn7LLJNkZQHVXjwMMsgkHZZiiueIcmUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSoSjXrh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8972C4CEF7;
	Thu, 26 Mar 2026 03:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495175;
	bh=BIYxWY0MypFymISpdje/gZE750/SPCzLGSTXlPLhjZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FSoSjXrhreBF9i5F/JJA+p12WKpnpyhPXWDQh+gu77M4AMtGMPpQjwHsv/4KJz50s
	 8VdGlCJX+HNCBlEOSFHF1eu8I003B8RFTUHxl50EH697Bmad8Q9k27iOok17kI9AKY
	 nQySYAIrXlVOpfUKGxU/UPbCSI2TryOe4qLTk2C7Rs2m/NPsYUU6RC0vWQslERKFXw
	 jAw2uW0bTDtn9u2+s5nLpM8HH5FeSwOE/jGAom9g2fZE1qT8wc2FxZG7Hx061hlRrZ
	 TTxVVGRbla+qgWxbE5DAXgGDA/JQtIfJ+OPJwCo1iE2gzKZj+8Kk0IPFQ140BTQVxz
	 p/8qJu5n9SS1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: patch mahua thermal zones by label
Date: Wed, 25 Mar 2026 22:19:17 -0500
Message-ID: <177449516616.60308.12279202845018940024.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320-mahua-fix-thermals-v1-1-8957bf976c90@oss.qualcomm.com>
References: <20260320-mahua-fix-thermals-v1-1-8957bf976c90@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100001-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 46B4732EC5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 20 Mar 2026 04:51:00 +0200, Dmitry Baryshkov wrote:
> Updating DT nodes by the full path is fragile and frowned upon, it's
> easy to miss the rename of the node in the main tree. Add necessary
> labels and patch thermal zones for Mahua using those labels.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: patch mahua thermal zones by label
      commit: 282c1df469d0c0674785bd1427838c499807505b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

