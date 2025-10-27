Return-Path: <linux-arm-msm+bounces-79036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4BDC11C41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC1321A647FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E439533769F;
	Mon, 27 Oct 2025 22:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OM9pllXF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB35337699;
	Mon, 27 Oct 2025 22:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604503; cv=none; b=Tee8B5Z9mgN2bXKfuZj6WQWTfD3BHRqwSBs8d7QRbhjyZFhBOE7WvW5StciZ6PnoKXL2fH/chdohS7zMN8YKDjC2vaEj5st0OTaaUh6+hZaHBzta5wcEVG+pGannqnk4Y9/gcrI8BHAgj8C0yYl3kpx0OJSkwVXQ8a2ASwYiFAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604503; c=relaxed/simple;
	bh=LU9u4SZQ7FmdsoJiuuzptQTSRZue0KhQB8i8mHOHa+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WXmqjt+XQqIhIciuy+TZ+86NlHXzk/5IZiJ9NnTMIcNJEntT0e5cjMqYaVlmV/iQosfjcD9KO+kj8fv0lYWrc4olH9NyFC3B0iBatyKUi613Aebvpp5WuAGNp0jf0duvcTd8TWan5iunF1xMW+Hs9JYswUAKJ8G1kyNyKTk+Jlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OM9pllXF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB14DC4CEFB;
	Mon, 27 Oct 2025 22:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604503;
	bh=LU9u4SZQ7FmdsoJiuuzptQTSRZue0KhQB8i8mHOHa+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OM9pllXF4e7qiDTX7+UKFajfGD9D+79R7CW5jZwm1qhXK8hzytTwXYoFfvbBtx50N
	 ihucd0IesEvsE28ZnPw6ovWMhL3Eg8vr/fhzfmIxq+I7+wZabjp1Ys5Jpf3mDpOscq
	 Zfu7ooOn7i3Kh6qblP7Cy0W8/UbwF5X2PbmBX+XNqBgPWggZ6BDO+SvPm2ona5ocyM
	 Dq9sYfZgr3GB4Iit1wL/udV+q5IfDB8SUsUxzkhhXGRNEapF562kP3yeKrk8zD2KoD
	 Q5Ge63j6ztZRyxF6GSFB4O+g6g5W+UeiIXX8XvjI1c1jTptaHiaKr0alCOJwuq9JMA
	 hyHb6t5jhT8lw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add Qualcomm SM8850 socinfo
Date: Mon, 27 Oct 2025 17:36:57 -0500
Message-ID: <176160465253.73268.8337337022344681881.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022-knp-socid-v2-0-d147eadd09ee@oss.qualcomm.com>
References: <20251022-knp-socid-v2-0-d147eadd09ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Oct 2025 21:57:35 -0700, Jingyi Wang wrote:
> Add socinfo for Qualcomm SM8850 SoC which represents the Kaanapali
> platform.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8850
      commit: 457129aa3610f46bfa6f97725de731345d4aaef0
[2/2] soc: qcom: socinfo: Add SM8850 SoC ID
      commit: 4648c70f2ee3636585d536d8272279e312180798

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

