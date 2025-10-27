Return-Path: <linux-arm-msm+bounces-79071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C4BC11DD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11C0B3A5281
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDA534EEFB;
	Mon, 27 Oct 2025 22:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBmHPsdE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2366734EEF5;
	Mon, 27 Oct 2025 22:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604539; cv=none; b=l/MtCg/ddqpOVBBVY+hqs9NGL5LT/1iSUEpY7L+fvJyoZbThgpwN9pQUaaXVTdegmEfL95IderF1+d2nsGEbrPzSX1WfikOaJKhIvkqRSDsmn70XWcLsYKHsc0dO0Vb2VWbJ5Arpkcf/Z9RvpKQj98F9DptRj4pTqYsBFJrcH2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604539; c=relaxed/simple;
	bh=4hZxjw9hTVJwN7eRbm2f8QhxFCjKK69ub1xTCfd302o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pASVsql7qkPV0WUOFVyPX8nhyX33w/ieBSlDiu/rmatzs+C5AzYbzLXFRCJxGhTiVXBLxe+zEJS/jbgniApPQrlvFULCf1/cDgnz5VrElKz8VRt5njhxjpLlTCGJa4X5/CY6KiennPjWLPwls5tOlq7zp4QbcyNZrfUBlyf7k58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBmHPsdE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B054C113D0;
	Mon, 27 Oct 2025 22:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604539;
	bh=4hZxjw9hTVJwN7eRbm2f8QhxFCjKK69ub1xTCfd302o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uBmHPsdEvRjPjZNHYr5eAsnlfKBjQ1aCbKrbrQKNTLJMUcTp/bII4C7OxRaAwSqwe
	 RGxyQSz53VXsY0zgo+6dnost6vnML7KWDN/jYBSY8DM5NiNoEAPB8zla5dPgIQ9G+1
	 h5aX62nyy6reun1cHMzdQUcfwhEy6w9vjESqrZxEKM7sg23nh9sJwlbgeUr2M+2BqR
	 x3KCqTCSwDWju7bbn631vcum5g4E5gHEaYNCZvOlSPXdh8zEoahkCO82M+0ZbV1AOh
	 RbDgiNbBOgl0CIE8BljAwNDrKbM9A0C4u6bGYV6Q87tBnCDKd/co1uL/vLuOfQnq0f
	 XRZfS4gBoFBSg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: mukesh.savaliya@oss.qualcomm.com,
	anup.kulkarni@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Add firmware-name to QUPv3 nodes
Date: Mon, 27 Oct 2025 17:37:31 -0500
Message-ID: <176160465191.73268.12812879194194737096.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923161107.3541698-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250923161107.3541698-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Sep 2025 21:41:07 +0530, Viken Dadhaniya wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Add firmware-name to QUPv3 nodes
      commit: 5af8a9e8430ce62a4e12e58c687c43bae0d5863f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

