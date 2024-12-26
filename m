Return-Path: <linux-arm-msm+bounces-43405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A060D9FCCEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0DCC1881991
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73951DE882;
	Thu, 26 Dec 2024 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ferhNrYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDA11DE3D7;
	Thu, 26 Dec 2024 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237662; cv=none; b=UO7pGP9dEFfD4D00RoPiqjGJD+nqxMw88rOfTJTCUA01Yh0MR/6ZI3d2Q3oW1poJWFPYBzeDLsLeCzFg8thle0GTpOaJ1xLVEk9bYVBl9jbOAtYCbubEQf1hqd/ZTz3+M0D5mSvtpVnkqdAj77kAWXcB/cIVQbXWsFXju1QNTsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237662; c=relaxed/simple;
	bh=J50wgV/HLMaFqdq5LYjpBBXDQ2yPaDmTLx07dLVumr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GW9jKlq8YoaSh7FzkpUofUFUksaIlRF2aiV9JvIBk27yWCdOdzEB79qgCCpLa72jmgE5LyzxrQXc6sKKWXow+MNV/h9FW443P2f2GfYG7+duCvtIPForACOVI1CsbuOE0z6bXyGJ54FCGFlUaV4rHDl/VdNG16t4hNNXWbo25So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ferhNrYt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45661C4CED6;
	Thu, 26 Dec 2024 18:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237660;
	bh=J50wgV/HLMaFqdq5LYjpBBXDQ2yPaDmTLx07dLVumr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ferhNrYtR2pvU4YzYcEBZiASWIlcgL+5KiwTk2o3N5wjnZ1yZKyy7Qew0j6CaNcWY
	 Gzgnlk7oYcGiSCxFqGoEipuaoeGny4qQUINrmSmlrtFV+fCdU+tj5YGmY3SP5CJqcr
	 1XjCGoBrLgVsHTwNB7KWPMAlad+fvIMP6snbOq229RW2Z0z//8pI7wRuSL+8v5DW7D
	 m6thMnmctDrFCpXzFGhYtz1fUMaNNdZYx+KHz3MkUuA6qsYFpmcP7eM3uG3Dz/lntE
	 8Fy9YW94UZLAiqnN0Cx64QUYPo4aZIni1NpVJ6s44/Oer0QF6bBqrwhX6SH0/+13l+
	 LJzM1GvCKKRMg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ling Xu <quic_lxu5@quicinc.com>
Cc: quic_kuiw@quicinc.com,
	quic_ekangupt@quicinc.com,
	kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: qcom: qcs8300: Add ADSP and CDSP0 fastrpc nodes
Date: Thu, 26 Dec 2024 12:26:57 -0600
Message-ID: <173523761391.1412574.16466466021430371214.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241119120635.687936-1-quic_lxu5@quicinc.com>
References: <20241119120635.687936-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 19 Nov 2024 17:36:35 +0530, Ling Xu wrote:
> Add ADSP and CDSP0 fastrpc nodes for QCS8300 platform.
> 
> 

Applied, thanks!

[1/1] arm64: qcom: qcs8300: Add ADSP and CDSP0 fastrpc nodes
      commit: ac92750c0395045023d9cfe3de5dec3c96504edc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

