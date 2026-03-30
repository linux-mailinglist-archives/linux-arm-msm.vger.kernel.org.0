Return-Path: <linux-arm-msm+bounces-100839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG9vHOKgymmg+QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:12:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ADC35E821
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 630543039C9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97003876CD;
	Mon, 30 Mar 2026 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="saheumd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8566338756F;
	Mon, 30 Mar 2026 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886520; cv=none; b=adGDLW9aQsLL/PMwnjIH6ojZVBxaB8R2O+emvV/MPH24GkX3kAPbUe7BWN74+ETdzaVmXepG1djq8n8ALWmXNOKdoycl4EYzq2IB/zyHh+Xl1imv5eCiBBf/j+jBLlBx9YAIsrPNYD03I679jsGnmtJUFfmpEysOuIIeCY+v2/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886520; c=relaxed/simple;
	bh=ImQnVjbPJvMmbif1QYFwxS11qI4uldiw+HgtcHgRAhY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FopijjNUU9wNzaIe/tSNH7KiEzPaYZDhwN4ImakERSoB2103J9Ogf+SQwc2HyABG9Q4IvVVQpPDqCGm3WftABD6dtghQ+0rbvyZRmRT9Bibj1oKhjNB8xpXQ7mGwJPCpyP4Q4O/UHswingDRaFOUkGH/ICnZ9Q+EzHB6VfC8J48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=saheumd+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D882C2BCB5;
	Mon, 30 Mar 2026 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886520;
	bh=ImQnVjbPJvMmbif1QYFwxS11qI4uldiw+HgtcHgRAhY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=saheumd+jpKIN7ekP8KXeI+NCthVMH34sakDCDpzSKf9+OlP6uaE+H5pUekQ2qDUj
	 TPA2lj3IR2CVklJjio4RJdZcfIZP0uA0Dz/Qko/LHI9c2b7LXWkogMxGIE3lkRyyB5
	 abmRVqMs8UE7GIY3p2UEiiFG9GiCtjogR8ZudOjdESI4g6JCUjWAqPYzYot3L/7DiR
	 Tv6YpB3QeISZW7xbF0NAPzKUrW91/vYaIyjlQksz2Vwx4EuftVn+TIHS13+cwSwdTr
	 hSrILzvTcItwUUASVN3v+UhTosSE/8F/V97GPXe+MP6z7FkOlzIVydHxmeg+nPcq3P
	 OVqeh+IKYOAWg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add thermal sensors
Date: Mon, 30 Mar 2026 11:01:20 -0500
Message-ID: <177488647767.633011.11403663969711577439.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327101225.382493-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260327101225.382493-2-krzysztof.kozlowski@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100839-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 42ADC35E821
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 11:12:26 +0100, Krzysztof Kozlowski wrote:
> Add TSENS thermal sensors to Qualcomm Eliza SoC among with thermal
> zones.  The TSENS is compatible with previous generations.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Add thermal sensors
      commit: 7f390d6ccbaa3313758b172fd8cbadc6c652c48a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

