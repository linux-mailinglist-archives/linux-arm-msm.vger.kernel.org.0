Return-Path: <linux-arm-msm+bounces-3346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B40803D47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 19:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13418B20ACD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 18:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FAB2E843;
	Mon,  4 Dec 2023 18:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="43o/gGkg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E42FA;
	Mon,  4 Dec 2023 10:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1701715118; bh=rj7Er9R1xUABlk9cGEroopYihFMT61dNP76qORyH8LU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=43o/gGkgLpC4l6K12zlYt+pRDMhb+R1bIunqxnfaZiH+qBkGaiNt+gy3h8gB++v/g
	 XI2BqFGANYQmFHLXs7hSf36vskRWxrq2TyLFifpfwbj8BfXupkynjhAsf1K64o57hm
	 oY3nj9P4j8rHKsasN+LR1Ni6+QAaYGiMuVqPMpIw=
From: Luca Weiss <luca@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: qcom: msm8226: Add CPU and SAW/ACC nodes
Date: Mon, 04 Dec 2023 19:38:37 +0100
Message-ID: <12332815.O9o76ZdvQC@z3ntu.xyz>
In-Reply-To: <d1f1ee82-7997-4e36-a21a-7b70d2db9746@linaro.org>
References:
 <20231203-msm8226-cpu-v1-0-d18e83340b32@z3ntu.xyz>
 <20231203-msm8226-cpu-v1-2-d18e83340b32@z3ntu.xyz>
 <d1f1ee82-7997-4e36-a21a-7b70d2db9746@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Montag, 4. Dezember 2023 11:41:36 CET Konrad Dybcio wrote:
> On 3.12.2023 23:38, Luca Weiss wrote:
> > From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> > 
> > Add CPU and SAW/ACC nodes to enable SMP on MSM8226.
> > 
> > Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> > [luca: update some nodes to fix dtbs_check errors, reorder, cleanup]
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> 
> Looks like L2 SAW (@ 0xf9012000) is missing.. but then it's present
> on 8974.. but it's not bound by any driver :)

Right, I had this node before:

	saw_l2: power-controller@f9012000 {
		compatible = "qcom,saw2";
		reg = <0xf9012000 0x1000>;
		regulator;
	};

And then used like this:

	L2: l2-cache {
		compatible = "cache";
		cache-level = <2>;
		qcom,saw = <&saw_l2>;
	};

I decided to remove it because first there's no "qcom,saw2" (without a second 
compatible) in the yaml. And qcom,saw property in the l2-cache node also 
wasn't accepted. Since I'm not aware of any driver code currently using this 
(and the bindings not being particularly maintained, there's still this bit in 
.txt form?) I decided to remove it to not knowingly introduce binding errors.

Regards
Luca

> 
> The nodes you added here look correct FWIW
> 
> Konrad





