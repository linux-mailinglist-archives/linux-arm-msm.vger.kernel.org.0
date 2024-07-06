Return-Path: <linux-arm-msm+bounces-25433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 363DB929583
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8A231F210C5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3935C144D22;
	Sat,  6 Jul 2024 22:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4zYhYhO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4D4144D1D;
	Sat,  6 Jul 2024 22:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303302; cv=none; b=Dj0yf5ze6lQD+X6py8q0fhvlDlnOxIS9pdDTP6lqWhWTYXbLjUK/LOLR+IxhdrP3JpCeAMHMAvka6SUyPOyhK2HhoLnt3vv2dbPb3ENTDZIxCARqnNHQ+TbDd4AiQx9SWVTtBdOE/HCOGdEegzgw1Hg+76sOANdM8l7zFuz4Nac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303302; c=relaxed/simple;
	bh=vk/Cvb7kD79ksF6Cfvk78sTu/Roq1tjpCW8NeoaxwdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0JHwbbpWCsD5u36tWfaY4G1gp6Zy+m4T6y58wAjwXFeQ/AbzSGTWPW7TCETYn8CB/wgAss3l66eQo4p07IFsPBDgVb5j6xhWpt7AKVnwPBbVnoJ+9Z4mGO/oIgqrBsRnbkR/PmDIzXPNFpYTfKt0L/cFYF+haO538ryEM2loHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4zYhYhO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A5CC4AF0C;
	Sat,  6 Jul 2024 22:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303301;
	bh=vk/Cvb7kD79ksF6Cfvk78sTu/Roq1tjpCW8NeoaxwdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f4zYhYhOPZM6thlux8OdE7JFdRWcPQTCbT6es+wAX7ekTMh4l/P7ieohxg4Y6yglt
	 dJRneo7LMqdsVUDNRRuQT8oZlWam78vgzpiSZlB30+EC50Na4Smfza8eyFOBcMYkxh
	 Ud0k94DvYTdIPAqlZFMzDpamflV9Dxf2EpEhlWbTojU6oho0Jk5ke+Sj7u2pJr7PdO
	 T2Q31ve7/O2UH8nDvF2A+6gWyxFIykVrkx0RPv1NsiADDszCA1vxuidHwY4rovXtr7
	 JlZP2yIcmHSMl0RK/KE0u4lKsMLXGh5ggOERh7BHNPhaZqipH1+Lakqj3kua72qUe1
	 dGZOAJnBk88iA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm6350: Add missing qcom,non-secure-domain property
Date: Sat,  6 Jul 2024 17:01:24 -0500
Message-ID: <172030328809.28909.14419610576118929541.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705-sm6350-fastrpc-fix-v2-1-89a43166c9bb@fairphone.com>
References: <20240705-sm6350-fastrpc-fix-v2-1-89a43166c9bb@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Jul 2024 09:43:11 +0200, Luca Weiss wrote:
> By default the DSP domains are secure, add the missing
> qcom,non-secure-domain property to mark them as non-secure.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6350: Add missing qcom,non-secure-domain property
      commit: 81008068ee4f2c4c26e97a0404405bb4b450241b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

