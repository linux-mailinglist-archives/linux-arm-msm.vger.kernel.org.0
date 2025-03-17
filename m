Return-Path: <linux-arm-msm+bounces-51566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2227FA63C63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72C2C16A412
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8F71B040D;
	Mon, 17 Mar 2025 02:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEP1IacX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A661AF0CE;
	Mon, 17 Mar 2025 02:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180180; cv=none; b=V690giRBFeLBfKB6M4uhVvKV230wnQmWQ/9PbOkCNgrgjlZYMr7X/8SlQv2UbJQUBvU8pVCTv+FawIfScnULwegLO6dJkxvO07zIVzht2Rh/JkhewSaWqYjDRiTNwOf990X276FG9F94xoIP4gKqZ7U4aO07EZ56XbVKwI4eoeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180180; c=relaxed/simple;
	bh=QjrZnLXCD4CHGqxzSJ6/0vy7n9vpaTQPlZHAYwlEIR8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GIzXqM5J1SQwxyALwb9Der9ELo+pHN/HbiXCOaWQMkJy/85TPFbajjTUvDKiOxtp0LxY8IFjFFPMV0dqYqwjmJ/OhM4kAEi5GqjcJ1JRHHpAlX/m/FKAzDXEP9x+DzBJRwBUWoRdCxz5GXNu9x8ZTj+NlsVexVjRkOtipYYyrhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEP1IacX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2F5C4CEEE;
	Mon, 17 Mar 2025 02:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180180;
	bh=QjrZnLXCD4CHGqxzSJ6/0vy7n9vpaTQPlZHAYwlEIR8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QEP1IacXm05ECKbtH3arQSItloVQ/jnqVD8y9iHVWJyAxaRj1L7IHqMdzIWxOsza1
	 B85QfnVD4EzP8S/a7SwKqJGqM7NrWoUQo/8/XHM523eaG5ZrDWz/xlWisFJIwlY0rC
	 SmG/PTfNgRy81yX5SJqiMjlKenmJeTBysLSIhWy8JmOzVHklHAS7qTsLNSKbDbYvJS
	 lQzXX1J7O/6SSKqClDXmvqJL8qhsaTlKMG1/NSOlz8qsgsMqsAJASXDI8htvpszhxK
	 1OC1m5tdZjNAAevatQ4K7CvWmhzds8Fr7QmxbKstoKjyY0JIhjvwhO2POFUuYdZGrl
	 /JCKEJUfo5mgw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: Re: (subset) [PATCH v2 0/1] Fix USB vdd info for IPQ9574
Date: Sun, 16 Mar 2025 21:55:59 -0500
Message-ID: <174218015889.1913428.12204389155389247962.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207073545.1768990-1-quic_varada@quicinc.com>
References: <20250207073545.1768990-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 07 Feb 2025 13:05:44 +0530, Varadarajan Narayanan wrote:
> Use correct regulator for USB phy.
> 
> v2: * Skip the first patch as it has been pulled in
>     * Reword and fix commit message formatting for the remaining patch
> 
> v1: For some reason, the dt-bindings [1] patch posted and Acked long
>     time back seems to have slipped through the cracks and hasn't been
>     merged. Including it along with this patch as both are related.
>     dt_binding_check & dtbs_check passed.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: ipq9574: Fix USB vdd info
      commit: 4f4c905e6a2a4e884f4e9b7326c94fac3500e0f9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

