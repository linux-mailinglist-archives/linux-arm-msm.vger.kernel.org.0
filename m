Return-Path: <linux-arm-msm+bounces-68191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37602B1F3DF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 11:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 414C318C81B3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D8223B61B;
	Sat,  9 Aug 2025 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="twPPd4NL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD221FF39;
	Sat,  9 Aug 2025 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754733173; cv=none; b=ERiyaAg9XGOExJEBghQPxUC2eWJKG1w9ZqM6JquRExXx7sO3ncN4rK2hk+AZ8Z63Eg55qfiu4ic+9X85vhg66/TeA0wheajgWSX/WrGpWT8bHP+9f89wysj2pHRTLb5a5X4sdhvwea9HacnZ4fixqNqNls2Ln0HJqweyH7yMT7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754733173; c=relaxed/simple;
	bh=oHVQXmRBAA++NXqr9t3dx50x6NevTdJRolYpqlxUE3w=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=lDJKQ71P1iJKZXm2ZmotVBW7XZX49lbu6V0S88pjcdK8a9aWa22ePuFp3tZYKTQp7SimdxmlwGtefxhx6zZG65ZdOUqObeI/TIclgtzycE5Bh1LRypNBOY/Hs+8i+ziUtmcC5b4ahtnIPYGZkCtT+7Q0LzHvF8elZIwfFZnO48w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=twPPd4NL; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1754732627; bh=oHVQXmRBAA++NXqr9t3dx50x6NevTdJRolYpqlxUE3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=twPPd4NLPQ+b5WO/eLRJr58HS7syi0zyuIo5N8/dGAVZdy9+BumS9UmJO3MPdJ2wc
	 GAZsl/y6DWEt/Jov+EIK1qA3Obfqdv/Rwfb1GcGmSKLmCKL3k5K1kPOM2Jh3WC4zOp
	 LC5osuyqHUHAyvui8QyQTJdpH9XD+GmPcdJiObU75143nkQDX4jEW7w7CjDCGXWvRQ
	 ffukPBcbPgjw2uoz+GDQkEW7W9mZEHeUp6bVH/cyBWhLvqsYwec7GsEMcI0hz697u4
	 Rd5dVN4oIuFHPbsWMkdHIL7k0cNy6qg5j9mTTbD7/eHE64AXnAI5Xkdum+Da6qxjfz
	 MMgDM/6veaQMg==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id B80E71F924;
	Sat,  9 Aug 2025 14:43:47 +0500 (+05)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 09 Aug 2025 14:43:47 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Describe on-SoC USB-adjacent
 data paths
In-Reply-To: <7bptwqmqimkuixgo3zvwfafktx7sj6a5xzfcedip6vuudhwmqt@ey7cs7x2ucxr>
References: <20250808-topic-7180_qmpphy_ports-v1-1-718d7c52921a@oss.qualcomm.com>
 <7bptwqmqimkuixgo3zvwfafktx7sj6a5xzfcedip6vuudhwmqt@ey7cs7x2ucxr>
Message-ID: <4478d71458f7ae1501de6cc1a65e98e3@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dmitry Baryshkov писал(а) 09.08.2025 12:49:
> On Fri, Aug 08, 2025 at 11:20:45AM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> 
>> Define ports {} for the DWC controller & the QMPPHY and connect them
>> together for the SS lanes.
>> 
>> Leave the DP endpoint unconnected for now, as both Aspire 1 and the
>> Chromebooks (unmerged, see [1]) seem to have a non-trivial topology.
> 
> If I remember correctly, on SC7180 the DP is still routed through USB+DP
> combo PHY rather than having a separate output. I'd let Nikita to
> comment though.

Per my understanding SC7180 has only one DP connected via SS+DP combophy
(At least this is the only thing that is exposed by the QSIP module)

On Aspire 1 the SoC USB0 is hard-wired like so:

  sc7180        USB3 Hub             Type-C DP Switch
--------+     +---------------+    +-----------------+
 SS_TX0 | --> | SS_TX   P1_TX | -> | SS Tx           |
 SS_RX0 | --> | SS_RX   P1_RX | -> | SS Rx     Out   |
        |     +---------------+    |        (4lanes) | ==> [Type-C]
        |                          |                 |
 SS_TX1 | -----------------------> | DP Mux ML1      |
 SS_RX1 | -----------------------> | DP Mux ML0      |
--------+                          +-----------------+

So, basically, the SoC combphy is assumed to do 2+2 DP alt mode in
primary orientation, and the actual orientation switching is done
by a separate DP mux/switch (Represented under EC in Aspire 1, there are
multiple chips roughly governed by EC that make it tick)

Currently this is represented by merely connecting the MDSS DP to
the EC node directly (to represent the link between TX/RX1 and Switch)
where the EC node implements a bridge injecting the HPD signal, which
I assume worked out because the combphy driver so far just hardocded
the correct 2+2 config by default.

However if we want to rope in combphy into this (which I guess we want
to actually configure combphy and not assume it works), we'd want to
connect mdss to combphy and combphy to EC at least in Aspire 1 case.


Nikita


> 
> For the patch:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
>> Take the creative liberty to add a newline before its ports' subnodes
>> though.
>> 
>> [1] https://lore.kernel.org/linux-arm-msm/20240210070934.2549994-23-swboyd@chromium.org/
>> 
>> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
>> Closes: https://lore.kernel.org/linux-arm-msm/175462129176.394940.16810637795278334342.robh@kernel.org/
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 48 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>

