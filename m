Return-Path: <linux-arm-msm+bounces-61044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805AAAD6667
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE88C3AD8DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CB41F2BB5;
	Thu, 12 Jun 2025 04:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ca/XZble"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BCE1F153A;
	Thu, 12 Jun 2025 04:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700857; cv=none; b=etHCVykDi8/yC/b4M4Avycjda4l58jP7oOwMZAdR9E6Jsr+j8P9uYnlkV4LpTvAQRdP1jS/cRmM8DZbT6Yyxx4uREVQ2pllzsR1J2LA0BPmsixCmn4IUhtTAj3dE39t3gs0aZDfegxDxAP5p2ahuxrM5s17ocoIGzJ0O9iIoWo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700857; c=relaxed/simple;
	bh=NcKly+haszVBag+//cbmwSI8Ud5H0c36rU786IZV8bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s20cpIDw+aFl92VTeBVwFg54J1wKouFW8LbkLbmXapp0VGfcPpa59dTQMR6eQC1ozuvh0XoPtM5oCjarTdBsitCbp6gsP1ki543+3i8CL3giawo03QTSqLi3x7QJ+A3EJG/D0s3lPVrWxgzzAXPA0V/SSKL877w7i7E98NnPOlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ca/XZble; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF45DC4CEEA;
	Thu, 12 Jun 2025 04:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700857;
	bh=NcKly+haszVBag+//cbmwSI8Ud5H0c36rU786IZV8bE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ca/XZble6LdXaQhedsNuk1k+sKkZSIpMP6mZebn3yezDik90CsGezOnuHqLJnxgHH
	 33/cJrA9pkA35z4KBtARAgd2PTMbViKQQ0kMYxuVSYHqFfCE7AKgnwjj4t9lHlGVHD
	 O/A2XabhadOVedG7nKCGu6QOQqVAgIxepb/udKZqM2u52EL0qggG2doHed0vAwq/h3
	 W+6UzWpk/+d+IZLhJelgZ1ESt2tpB7ub+2yc/CVGTv5Igf9HoiL9ot5dl6ulwLya2o
	 c44c7oFWzfPkJT7pDwPnD/mP0gDrMxSCjaaayJ0zjyOiffwuakOsGBcqVDgOl7L7+1
	 xlfGr6eq6dF2Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: jens.glathe@oldschoolsolutions.biz,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1p42100: Fix thermal sensor configuration
Date: Wed, 11 Jun 2025 23:00:37 -0500
Message-ID: <174970084205.547582.14874289593554743911.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520-topic-x1p4_tsens-v2-1-9687b789a4fb@oss.qualcomm.com>
References: <20250520-topic-x1p4_tsens-v2-1-9687b789a4fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 20 May 2025 22:14:46 +0200, Konrad Dybcio wrote:
> The 8-core SKUs of the X1 family have a different sensor configuration.
> Override it to expose what the sensors really measure.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1p42100: Fix thermal sensor configuration
      commit: 63350a07966f61183462c200361a8c8cc275d560

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

