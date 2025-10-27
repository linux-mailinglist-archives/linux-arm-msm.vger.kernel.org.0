Return-Path: <linux-arm-msm+bounces-79073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D13DEC11D61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7A737353E0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB51234F484;
	Mon, 27 Oct 2025 22:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cM5A2Yoa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A9C34F482;
	Mon, 27 Oct 2025 22:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604540; cv=none; b=LYMquGhqPTWtb4vEnvQsq40Zlg5Wwx+U6/fHv6szy754JaNhmN/ee65V2FgW9AQexGn4rldkvk0bAcdN05p0VRut2+8Rq5QUCKUIoQOIceOYCYmfoUn+0nBbRjsPD3ODSFyXnLtb4itHTtc/bBuZTRb04avkLfJe1IlHKN8F3L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604540; c=relaxed/simple;
	bh=MMrcN0wI+ucYsl6GnqH5HDjP7snycQh/GDxnc7xCIns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rBan2qS/U/gyD71SLHdWjd2autkd6s4d2r5cnnghbwPLTk96ri91D0eu2RnogyGzYe48myrNW8t1roNQCzr/KPwuOAuV0mWeSh3sgDuQmXDHZ2qNS2Oa9r6LO8b2wBH7sBvDLtdhWGjebdoROK2Sbr3Xe1br3wtcpW8Yl8oVu2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cM5A2Yoa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003FEC4CEF1;
	Mon, 27 Oct 2025 22:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604540;
	bh=MMrcN0wI+ucYsl6GnqH5HDjP7snycQh/GDxnc7xCIns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cM5A2YoaEtLx+yVb1UsCtcH6TexFPWJomGYMdHvxacA9nPubmJGMuoBTDgrsRheyy
	 +CTk5aPghVo/A32fYxM6++Qc/I5/BYEYPnxBKxeVWE9gbeifKju8E7HecSLoR0a11H
	 zj+CfeUzexIUMDW92WIVk0+id6HjD5Ry7Yq1YE+AJeICgf0UUeHkukBYz8mjYx0po4
	 cY97u1huKWheXqenoAKb1s+WAa9qaKPZNmL24Xup8y9h1b+EHBHitvNdreqREqvdve
	 eb5XODa3VuHKBDsKirH/eHXbX2lfW9TbdGq8yHaAaPTWnHtUIiOM35+P9e60jyKUHZ
	 GcgA4shOzXg6w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Add uart1 and uart5 nodes
Date: Mon, 27 Oct 2025 17:37:33 -0500
Message-ID: <176160465211.73268.6368335507849227435.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009090858.32911-1-wojciech.slenska@gmail.com>
References: <20251009090858.32911-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Oct 2025 11:08:58 +0200, Wojciech Slenska wrote:
> Add nodes to support uart1 and uart5.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm2290: Add uart1 and uart5 nodes
      commit: 89e4902ac7262f368dfb03afd76d71e6bbb4424d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

