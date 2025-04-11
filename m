Return-Path: <linux-arm-msm+bounces-54012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4F9A85CAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 245168C4655
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B431B29CB57;
	Fri, 11 Apr 2025 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ar+4GRpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B47329CB4F;
	Fri, 11 Apr 2025 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373457; cv=none; b=Ns2gcwZVFW3gnuXJXs17wpONzjAM4nx36Abyx2/0lKz72p2kujqp+GmipxXzhySQIGTBhQgMjwj70u9b4JB4ETyT16lfn7dJaKlqYzsHDplXBMjQ7jN6GwDl5fTrz9YILclLhF01TIpMryD6HXYqAgtOK5wKoT3T5NoVjnRwOPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373457; c=relaxed/simple;
	bh=nCd+LxvQeLmdA43kSoXh5ev8ecysDHuHXJVPakAAHjI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tLR9MhjeARYeA0JtJiCMsxLGp4ngxSoOJ4ZWEP21hpvxw1+JkT0+E7XRed9nzUNNR6lbD6eecfIW4/GUaJyT0AWAfEsdQ99Y36idlT15fZZCaTA8Mi1hhsqsQx89NQJ3lQr2m6sg6M2hFQPVa+bc669vNozZoItWQxrSP39sK5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ar+4GRpT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA33CC4CEE2;
	Fri, 11 Apr 2025 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373457;
	bh=nCd+LxvQeLmdA43kSoXh5ev8ecysDHuHXJVPakAAHjI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ar+4GRpTeAqYMKcU/c5Dqk3FMPwvg0NZCgPBERlfN7tXkgNh2H8pp8Zl6PLjVLRqh
	 eNDhazxCNgGmHFXXIrSt8m1DstxnxjbSzELyU+Jsi6WwVDEnDbyAgyHoEzgibljQQX
	 fIiZWr8PDMhmBOuUCv53yyGz9zqo+Y3UyeRJaGUowhRpHWBM6ztvSXIBpVYwlbnUrT
	 X97dEjSmDN9g8h9xCHrY1XL/1TauT/WLwdkNxL0JYOaztlCxtiigSC9zd06+2bfJH4
	 9mM/Zpn4qX7LNL5IgFbUWuj5rr/pnXeX9bJNoe6hc0vHMiz5XezNhBXhyX27RNXttd
	 tVADpNGmtDOlA==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, p.zabel@pengutronix.de, abel.vesa@linaro.org, 
 quic_qianyu@quicinc.com, neil.armstrong@linaro.org, 
 manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com, 
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>, Wenbin Yao <quic_wenbyao@quicinc.com>
In-Reply-To: <20250319094544.3980357-1-quic_wenbyao@quicinc.com>
References: <20250319094544.3980357-1-quic_wenbyao@quicinc.com>
Subject: Re: [PATCH v6 0/2] phy: qcom: qmp-pcie: Add PCIe PHY no_csr reset
 support
Message-Id: <174437345339.673939.1810630369307364941.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:40:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 19 Mar 2025 17:45:42 +0800, Wenbin Yao wrote:
> The series aims to skip phy register programming and drive PCIe PHY with
> register setting programmed in bootloader by simply toggling no_csr reset,
> which once togglled, PHY hardware will be reset while PHY registers are
> retained.
> 
> First, determine whether PHY setting can be skipped by checking
> QPHY_START_CTRL register and the existence of nocsr reset. If it is
> programmed and no_csr reset is supported, do no_csr reset and skip BCR
> reset which will reset entire PHY.
> 
> [...]

Applied, thanks!

[1/2] phy: qcom: pcie: Determine has_nocsr_reset dynamically
      commit: ea57d7fe4f5af517b5ce91fdff96cc33be932690
[2/2] phy: qcom: qmp-pcie: Add PHY register retention support
      commit: 0cc22f5a861c3149171485349dafac3047212a5d

Best regards,
-- 
~Vinod



