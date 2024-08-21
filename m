Return-Path: <linux-arm-msm+bounces-29207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A56D95A04F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 16:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 314E8285667
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 14:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692A61B2533;
	Wed, 21 Aug 2024 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9zfONKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EC51B252F;
	Wed, 21 Aug 2024 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724251612; cv=none; b=Fi1bohrtV1+RzXKdS82Hlyt4Zoa5OXIixpDXAgat8cA5fOrlAqWavY/GDrLCr5vKPFdyeRdLwASY0Hp14siotfa+Ts338KRx7IDCR0IUT7edIqyRuaD8Dd9oht0cDl0pt4nUKAnQyQw2j2N6GT7Zt0G27H/eFwtnh6VKBIcQ0Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724251612; c=relaxed/simple;
	bh=JLqeMdkcUluS9z+EoNmZiXjnAya/MNbuLdmQCL1Q8A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j4svImjceJpZfA+dBvUN8dITzD6nFBUgSu56XpqfXG5D6wuE9FE6o/PiEFPwv8Vq0sDnLKT86Ah8z2pME3cNoyYFjaQD8TLYTP+HvH8EvQwBYmcOQ5f6zSrhVSFfrZAsCm0yGtwL9SurhGCfkn1DFK/qGBow6u/DWmZ1yajtvPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9zfONKc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAB3C4AF18;
	Wed, 21 Aug 2024 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724251611;
	bh=JLqeMdkcUluS9z+EoNmZiXjnAya/MNbuLdmQCL1Q8A4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O9zfONKcmf7EqGA1w88J10iXTJqFgK7P3vJaWA0HNpv/qdkzXjgK/nPKq+MkDC4o2
	 qIg1Lo8Qdu6wN7JahWCRj/8HYxRQxO2OPY2gKTg6OFrm5wtFs88o/eu8WXQrFFG3PH
	 OnI57P7huL9OVKn45h6HGGrtd+9ErcY88jb5OQFw2bqwZUUWqtKZEaJvHgii/V17eN
	 4WJon4WPPzheKwLsiYkt0Gt9rR5VaPRaubltoQLHCdo4qadcyId2CaGishXlD+UXHs
	 HMpwdL3DQTbarqTHMpTz+z21CEF6INdKUsK8B4w5uo9GdrmAn2ueexNG0gT0uws3y8
	 xeByK4j2Aj9bg==
From: Bjorn Andersson <andersson@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Ling Xu <quic_lxu5@quicinc.com>
Cc: quic_kuiw@quicinc.com,
	quic_ekangupt@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes
Date: Wed, 21 Aug 2024 09:46:43 -0500
Message-ID: <172425160167.1359444.11172735158933522137.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819045052.2405511-1-quic_lxu5@quicinc.com>
References: <20240819045052.2405511-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 19 Aug 2024 10:20:52 +0530, Ling Xu wrote:
> Add ADSP and CDSP0 fastrpc nodes.
> 
> 

Applied, thanks!

[1/1] arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes
      commit: f7b01bfb4b476ce87a35a35c671f37114344268a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

