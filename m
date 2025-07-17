Return-Path: <linux-arm-msm+bounces-65362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4496DB083FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32D11A47EB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4579221F01;
	Thu, 17 Jul 2025 04:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOOEBAyb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E86C221DB9;
	Thu, 17 Jul 2025 04:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726696; cv=none; b=WHk5gJoip6y+11m1jPRnflH8Px84NSL4YdSEdxMLRp501jtj9u6lqdHI71gcFhSbT6D38sj4HV6nIuBFwHKGdhy3iZqKYPITPs07zdFZGKycX1LSs2f9VniKP27ezIlXykenC8zIgYpeYQAcmqWRkTDncBayueGhsmr/t8ysJ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726696; c=relaxed/simple;
	bh=7UpDNyycFCFs64vxw9dIIigR2yDWpm57vOPRr/C3piE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f18FsUtjHInow2HtC4HN/gFvLE4nC26vlvd4YhQVBzbsVL7ETTMJALkt5w5w0S0ue2OmuTvtCPSn8pd6cpFalPaixK5/d+tqprH+iJAvmQEuLJnCDycMRiqPCaL9GvsRxndVRAYWzJHRRPz7b7xQRIOu1fQyOQaIv7m921jccf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOOEBAyb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8031C4CEF4;
	Thu, 17 Jul 2025 04:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726696;
	bh=7UpDNyycFCFs64vxw9dIIigR2yDWpm57vOPRr/C3piE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YOOEBAyb8uDLKdbHG/cZ0KfojpVg5w7ifZagxeM/X8vQr0/pJR3iTew3sSKT5AVD7
	 vxHuxdXHyoYZYjdo8MMyBuVE/cvfThNRJ24jvDfMNmEmK9V49KD365ltakfyfS3YjR
	 9H5P+Bg4yXS8h+65Gq3tE6QqA7+ilmvsyxgcsuI2dalFyTU8ur6Vr1rgXZ0gwWS9lW
	 H9PF6ttpTQkbStqhskI1wqA+k1sBBY/yM7/XgKn2RAslKr7RFcEuOdrUC/5iKgp7oJ
	 V9dHasbHnR3yHTx24z2IqN/MxeZtT5soeNY+c12qVRx/75sQjZpV3ouHFaaVhkoHwU
	 CPm2vqNfrmtcA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Add RSC version 4 support
Date: Wed, 16 Jul 2025 23:31:08 -0500
Message-ID: <175272667127.130869.4628853191003535148.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623-rsc_v4-v1-1-275b27bc5e3c@oss.qualcomm.com>
References: <20250623-rsc_v4-v1-1-275b27bc5e3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 23 Jun 2025 11:19:43 +0530, Maulik Shah wrote:
> Register offsets for v3 and v4 versions are backward compatible. Assign v3
> offsets for v4 and all higher versions to avoid end up using v2 offsets.
> 
> 

Applied, thanks!

[1/1] soc: qcom: rpmh-rsc: Add RSC version 4 support
      commit: 84684c57c9cd47b86c883a7170dd68222d97ef13

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

