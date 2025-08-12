Return-Path: <linux-arm-msm+bounces-68625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D2B21B4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6ADD467422
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307482E54AA;
	Tue, 12 Aug 2025 03:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/To2Qb+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06750256C84;
	Tue, 12 Aug 2025 03:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754967901; cv=none; b=K1nJ46TNbj1dm7cITa2TzCqeuSbrro1KuPmH0IUWOAYYvMhWuTFv2vFDVqp7iybH/zg90rglepDUVkG+v1qQdriSI3GoDLJ2UdqT3WZvEJHC1PNf/ziM9m71jZXptAu4Gvw57HVLy/cQ7hY+Rr1baJDZdYJIjoSl/Vi+m+HNWQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754967901; c=relaxed/simple;
	bh=jal1r2ODednPkjyVamwxs8obImbWoUqVaMNDNV0Iz/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rJbSDkixQQTKtXurM8ivIph8v9Q4J1Li2CHva0Gv3MJE3GGy6e4CzzPm9Mcq6rf+vpGzuSTLZmAdrLFKVdYtKPvDSgmLnlpcBab5WIATP8iLaP5ATHxpyquMThTBdJCcN+kMfwZnFF9Xkqk4S8xp1gmbLGzYW6XwI7HVyDssOvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/To2Qb+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDECC4CEF5;
	Tue, 12 Aug 2025 03:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754967900;
	bh=jal1r2ODednPkjyVamwxs8obImbWoUqVaMNDNV0Iz/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C/To2Qb+71ED1FJqeVKyQ15vw33dKPkx+EQbaE66aykQkFLRke4scFAI/AqfiMTij
	 1/4khnh1tLiTDr9RDP3noU8zV7aQvqOWat8N2d6iRdt4lV8o4WiUumE9Xg93EfsjVc
	 QD6cPEkIOjKOUJCwmliX/CKD+44/a04byYNtlnr7MXd02bMbDgxSJ5G79jGFvN2YV8
	 kv3Hwy7jEKj1It595tkZ3vzcp4k+o7YR0A8xaYeu2yT+GMIzIw2gpHq4LBnMVj9C6E
	 WPZIpZbi3FI1r+kAb2metYt+jayv61VaieVhIuR37aONX+tkGABkDIU3F93qe0rBEA
	 PMxkKOCinzr7Q==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ling Xu <quic_lxu5@quicinc.com>
Cc: quic_kuiw@quicinc.com,
	ekansh.gupta@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sm6150: Add ADSP and CDSP fastrpc nodes
Date: Mon, 11 Aug 2025 22:04:50 -0500
Message-ID: <175496788915.165980.6862378710869668869.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250729031259.4190916-1-quic_lxu5@quicinc.com>
References: <20250729031259.4190916-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 29 Jul 2025 08:42:59 +0530, Ling Xu wrote:
> Add ADSP and CDSP fastrpc nodes for SM6150 platform.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6150: Add ADSP and CDSP fastrpc nodes
      commit: d15cb624a60ab0119ec1b92d0a94f1cc305019e5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

