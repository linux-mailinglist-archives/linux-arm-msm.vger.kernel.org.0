Return-Path: <linux-arm-msm+bounces-43432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1440B9FCEA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C98DE3A037E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882B91D54F4;
	Thu, 26 Dec 2024 22:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWLojLEF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AF11B21AB;
	Thu, 26 Dec 2024 22:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252747; cv=none; b=Bj+WmZAfoE9JYEz8UPwvfeq4nIm5o5/WDhUBvDxOdCR4hDCNKuxGXP6td/SsCmrgWueR8wEefK2JufOJnfcVcmheM0CztzPoOMeHHRjlvnUQyjJzIFqBieybougIlSXTyrUplEch0ouBRXSDM9jDgZkcanrqA97xnzSibEG5jGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252747; c=relaxed/simple;
	bh=sgN/I8NAvChJySX/9fgdtVSSjB1bwkDhwzRlRrtVlfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tTp+dgMykCMg+1VSkr7B/fidKe26US8xksRGR7WdwWnJFNS7WDTFbVzA+zO3QD9B1ambS3iwVU05b8Mq+n2XJcQSp0nOdMlkShLmkSE37yTJQlTY6O5+Ee5aoYbaCHLYbXi6bjynyyZty51lE5MBnYEnpiZv6SWrGMVBIE3fe/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWLojLEF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA60C4CED3;
	Thu, 26 Dec 2024 22:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252746;
	bh=sgN/I8NAvChJySX/9fgdtVSSjB1bwkDhwzRlRrtVlfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nWLojLEFRsUA2hzyZxAxkPI0TEiUqZa06kVh1J/1JoLvF2o1mzBiLVzjSzSuYdfye
	 S3ZqdfLqCS7p+qVpv/+mwg2Fp9K27UOZ/rQJukmlJojGZTZiL1FzpiJAR+LYH6cyJy
	 c9Ed3mkWxFKRO4Skfu9tr1HNzq/7/O6nOPgt1bpiEL2ovEqBZTj3WL7XPKNCBkJG1H
	 vnV2fpMc0OqN+qfRTQJYwBoHJF6Xglx/S808ExivSb9C4OFJmwGxosvDgG2s8HtEUs
	 94LTUDnbGtlNdah804Awhmwp8DZqPskgAITap8THpOSX1XzR4pRlRR92Lszn/XlqCV
	 6zHkB1Giy+zpA==
From: Bjorn Andersson <andersson@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@gmail.com>,
	Petr Vorel <pvorel@suse.cz>,
	=?UTF-8?q?Kry=C5=A1tof=20=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>,
	Alexander Reimelt <alexander.reimelt@posteo.de>,
	Dominik Kobinski <dominikkobinski314@gmail.com>,
	Harry Austen <hpausten@protonmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [RFT PATCH 0/4] More QC DWC3 fixups
Date: Thu, 26 Dec 2024 16:38:36 -0600
Message-ID: <173525273248.1449028.5463368821621810712.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241129-topic-qcom_usb_dtb_fixup-v1-0-cba24120c058@oss.qualcomm.com>
References: <20241129-topic-qcom_usb_dtb_fixup-v1-0-cba24120c058@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 29 Nov 2024 23:12:44 +0100, Konrad Dybcio wrote:
> Squashed a couple more warnings, the remaining ones I'll try to figure
> out soon.
> 
> This is all based on what I was able to make out from docs. Couldn't get
> any 8994 or 8996 boards I have access to booting reliably :(
> Ccing some folks that I'm hoping could help out testing this
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: msm8996: Fix up USB3 interrupts
      commit: 9cb9c9f4e1380da317a056afd26d66a835c5796c
[4/4] arm64: dts: qcom: msm8994: Describe USB interrupts
      commit: c910544d2234709660d60f80345c285616e73b1c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

