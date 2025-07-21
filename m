Return-Path: <linux-arm-msm+bounces-65846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 179E9B0BD02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 08:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7544D3ACB34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 06:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9F327F72C;
	Mon, 21 Jul 2025 06:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hZ4+id1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BEC1F2B88;
	Mon, 21 Jul 2025 06:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753080833; cv=none; b=OJ50Kn0frAvy3HEyzvkprZOneqCluEr6qJ24yBKBRWKetuITitZ5aGIi+bjJs1qCqM+LVQz/6b2/uWlbrLc4YTndLTEzfTj3VcocX4nclcmJxKV23qvFyjiqzb1eOtPEkoEekzgVU6nwnpla7cR2BOatN6dy+oH4XWU8FdRnrH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753080833; c=relaxed/simple;
	bh=BLrfXbwanftgU995wrz+bAONG7D2POOPCtK5ReR07js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMo/1hSTIik1PvY4PMRkDr0py0qIkDHFl1zwrjSrVgUYdWlCHjDmZ4Sb7gP1WgNYG3Sm74PA0Ulv3+D4SdSXOzNurLLncZzkxlh46iCiF7pg3MsGRki9Z5iOKjpvwnCSPYdb8oK0+rBuzU/TDCZGjIbFlwUGhamkIzvJo9r+uVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hZ4+id1d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6B3C4CEED;
	Mon, 21 Jul 2025 06:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753080832;
	bh=BLrfXbwanftgU995wrz+bAONG7D2POOPCtK5ReR07js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZ4+id1dpM8pxx5lNZaMLaC9gA9G53fpU03n32croZ7A4yrOe7fZqLLGAhBtqiCMd
	 DdSq9kB9ZIgs93N8xX+8qjLAgmewSw4o97b9rC+mqPWlnbd8K1iGMKMqz91TN4dvLJ
	 8vCsrFiiFUDvKLBSAW+qu6klbs+dkqrqySaki7BY=
Date: Mon, 21 Jul 2025 08:53:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Melody Olvera <quic_molvera@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <2025072141-anointer-venus-d99f@gregkh>
References: <20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com>

On Mon, Jul 21, 2025 at 12:08:41PM +0530, Komal Bajaj wrote:
> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> as read-only for HLOS, enforcing access restrictions that prohibit
> direct memory-mapped writes via writel().

What is "HLOS"?


