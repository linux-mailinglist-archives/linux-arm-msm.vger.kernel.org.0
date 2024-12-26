Return-Path: <linux-arm-msm+bounces-43408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A51A9FCCF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB7401883FB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F7C1DED76;
	Thu, 26 Dec 2024 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgMcKKGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83CD1DED6F;
	Thu, 26 Dec 2024 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237665; cv=none; b=DHQGX1Om7MfYVKMOmbdvvlPtuszU70fhud9xSZfMxP000TWZV2Al6AYH2QKdR7woNsz6Yn0mPW9DA9ISjxkRhcfDC7MafcAh7nr4s345HwoQZU9LE4bFbO1/t1solk+iwCkJLWx+HjoASmcXcuFqG8KRJxAmy/zjGYCbIE3akBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237665; c=relaxed/simple;
	bh=rOJPynHkx4KHoeHAY+txPPLehuYdXH9077ruK+q6aQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rmdMdZh6CXBPKV23LDo9l5Qp1At5R4sytxnm4pM0dB85sJ73s28+QGa4llnSBPeRhhmaZ/WLvx6K2kX881yytl6KFaE0cm9KRjZvYUVxGKG5xarFZbUJrB7bxYwgQp81ihH61Rv/TLDIJg/L+81OCIvSY2F8/7w+zWFXhsnSVoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgMcKKGR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E18C4CED6;
	Thu, 26 Dec 2024 18:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237665;
	bh=rOJPynHkx4KHoeHAY+txPPLehuYdXH9077ruK+q6aQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PgMcKKGR0nbf52xq68WRNlIIangtS0AR98raU5VXsphGr32RsCP5GkSiJIeJ5RGyv
	 kofU3UJFCvsyHXYSk/d3p8uW/a2BUMsTRwTK8MYPYUNVSqC6ag8xNc6j0OdlSQSqbm
	 MZD4PG+mi2NIk86AFv57iRePD5MRvS0e9ipXl3HbVPsBvS9v0N1zwntymOYQm/t2Vy
	 er8JEQIJsgR2ZD4KE5skEq6iQtd321XJQB7zoRmsQ+q80rIefPqWY28yEsEnX/a2aJ
	 hnsKE+6kDcqgoVUlcu9BvO5otJZ15sjtsbJi7qC+BlZqpk4oLBn/p2T+Jr+RC4U9e7
	 PR0Gx9QH2dy3g==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_riteshk@quicinc.com,
	quic_vproddut@quicinc.com,
	quic_abhinavk@quicinc.com
Subject: Re: [PATCH v6 0/2] Enable Display Port for Qualcomm SA8775P-ride platform
Date: Thu, 26 Dec 2024 12:27:01 -0600
Message-ID: <173523761394.1412574.14418158669309248905.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241125105747.6595-1-quic_mukhopad@quicinc.com>
References: <20241125105747.6595-1-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 25 Nov 2024 16:27:45 +0530, Soutrik Mukhopadhyay wrote:
> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss0
> on Qualcomm SA8775P SoC. It also enables Display Port on Qualcomm
> SA8775P-ride platform.
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sa8775p: add DisplayPort device nodes
      commit: e1e3e5673f8d7748cdb1068ca002c1c37039d3c1
[2/2] arm64: dts: qcom: sa8775p-ride: Enable Display Port
      commit: 9767920a7a1abfbc5af69460e110c9114de2f7e5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

