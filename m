Return-Path: <linux-arm-msm+bounces-50892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C21A5AD3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 00:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4A7E1894DAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 23:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F4122156C;
	Mon, 10 Mar 2025 23:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="D3VztlVi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1CA1B6CF1;
	Mon, 10 Mar 2025 23:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741649304; cv=none; b=f3UpRivAzAQO9LnOOuflTcK1VJ4WlIK+yqZpNMZg06amb67XhvN9r3Nb2Mw+QMgZpEDCnOc9GtlOO0ksSyFIXA+eH7lGhjngNYL6lPLsJlr7G3XgjuGvVUf0pjDBhOoGR4jQOh+vyPunEqg01EEFtW6XCwbOXSiR8SxPNH6WosU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741649304; c=relaxed/simple;
	bh=YgtDs42GP3+hQVvEJ5bZ8+W8RlDBquC/5yK6WJ9VOeE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=or19p7Vbi+VYLaGq2dSOyK9PDKvjp29PT1ZFTMEXvGm8O0864cncc1jVzUFnAVHnKi6k+I3toK4d52DLkjdPwiC5NW6na8tzutg+As0cKOSSunPMdiWnkBkPBUIduij/SPZ5JVtHBJYXUty2wnfiZsb4c8nzpD4cOZk425ivHvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=D3VztlVi; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4ED3D2523E;
	Tue, 11 Mar 2025 00:28:19 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arNFgvqEY91e; Tue, 11 Mar 2025 00:28:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741649294; bh=YgtDs42GP3+hQVvEJ5bZ8+W8RlDBquC/5yK6WJ9VOeE=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To;
	b=D3VztlViWhYZRVFOT2knHCNPNvKqkQnK2SL2SkfMU6y1cXM+1rZLG2KeXKwdek/XP
	 QTVc/edoFIne15TLRmKZC6ogwrasn/B9LORQiMcMlZ9EKF1rZFyQcf14TfU3OaKj2n
	 LQSTlwKCFnsZEkPKCsM6oFwZsM/+VQnUtQgQjbdgIMpxR9tPEhEivvzd5Vgezlbrqm
	 LR6nbtyVfq97NiktQv7oVL5dRQXw4+F6P2qsDxM5DZRFsVwaibt4Wzb1vklBthMbLy
	 FLfkb9+di+thL8nZPyG8NLDB6LB3vx4d93P9SK3KFGcfG21EVYAJy/DflVBhXSuPNZ
	 o0mgkETyui2ng==
Message-ID: <69f26012-e71b-438f-ac58-e0a3faaf4d43@disroot.org>
Date: Tue, 11 Mar 2025 07:28:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 gpiccoli@igalia.com, kees@kernel.org, konradybcio@kernel.org,
 krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, semfault@disroot.org, tony.luck@intel.com
References: <0bcdb8f9-9a3b-4d6b-bf7e-55a22ffc5df9@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm6125: Initial support for
 xiaomi-ginkgo
Content-Language: en-US
From: Gabriel Gonzales <semfault@disroot.org>
In-Reply-To: <0bcdb8f9-9a3b-4d6b-bf7e-55a22ffc5df9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/8/25 23:11, Konrad Dybcio wrote:

 > > +&hsusb_phy1 {
 > > +    vdd-supply = <&vreg_l7a>;
 > > +    vdda-pll-supply = <&vreg_l10a>;
 > > +    vdda-phy-dpdm-supply = <&vreg_l15a>;
 >> +    status = "okay";
 > Please add a before 'status', file-wide

'a-status'?

[...]

 > > +&tlmm {
 > > +    gpio-reserved-ranges = <22 2>, <28 6>;

 > Would you happen to know what's on the other end of these?

Unfortunately, no.

[...]

Gabriel


