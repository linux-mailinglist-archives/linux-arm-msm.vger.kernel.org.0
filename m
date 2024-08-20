Return-Path: <linux-arm-msm+bounces-29157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB38959048
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 00:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB5822847EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 22:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B471C68BA;
	Tue, 20 Aug 2024 22:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLgU1H7P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72E51E86E;
	Tue, 20 Aug 2024 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724191934; cv=none; b=MJouwE1kx5X6dJfIaZNvbvOF72WUQf+DUqiWtI+Iqv5Kb1t6o4wa8vQQ8Ec0zrCBmquKdT2kZgoVF4uwWuxCGXd6BmZ/gZQlC3ZxMQRr5rxhEQzuW9yId5sA4tfA6v00x18s0++xZoyALoI8nJnP1CjpmGTSiwyEnN5z0wwh3oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724191934; c=relaxed/simple;
	bh=TzKsLBDdEU6d0Kd346qtlGqwFuT28InRvFRbMnitnVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmN/ioBh6NAOKfNLye6f8Cd1ooIR4j0fdOVMijc8H7Z5IYRwu05jnCjrYWc0DQ2PphKpjNIWMCKJsa6Mu/rqDAdujpjZtUAPHvWdG8W6RA8+jlgEnmW1tehMajvgeDn6h0a1OI36Igj1KtbGDmVFa24aAG5rZvKbcyEz1Heejeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLgU1H7P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A127C4AF0B;
	Tue, 20 Aug 2024 22:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724191933;
	bh=TzKsLBDdEU6d0Kd346qtlGqwFuT28InRvFRbMnitnVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RLgU1H7PsO41ImQ+YvqiX2vvvzM2mB1um6vV8r06hG0l2lNYJVOfytShNjchPz+9v
	 VUdueqTpCcFrzITeziKXnBCW4WFpk1c/pqzd8kQsb6Uxc+gAwtZUiln58rn8EfpkYG
	 oE2SoZfrAlg02eH8d4mBjp5ajigbI9uM0L2E/rkfZlxbCVd5EynfMjNyDo5XdXt14r
	 LoG9aNOWS72NR8hktt7sJpIv6FoK75sD5pppwn1YYNlX3nXXXOgfNhe1xqoW8SjHAz
	 Ax+gd/AQAFEtKHqeh1tWSEWHJENXH7xJ4agbygPJNhjngUDfdwzHoeKCQu8mWjsUY7
	 +jRIB+o5HInxw==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: misc: qcom,fastrpc: document new domain ID
Date: Tue, 20 Aug 2024 17:12:07 -0500
Message-ID: <172419187794.1319438.12108857589542156264.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240816102345.16481-1-brgl@bgdev.pl>
References: <20240816102345.16481-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 16 Aug 2024 12:23:44 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add "cdsp1" as the new supported label for the CDSP1 fastrpc domain.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: sa8775p: fix the fastrpc label
      commit: b45af698d5114f9b666c7d8b58a9111d0526d7f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

