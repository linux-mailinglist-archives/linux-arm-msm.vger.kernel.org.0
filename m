Return-Path: <linux-arm-msm+bounces-51565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 004E0A63C5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04D653A9511
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47C81ACECE;
	Mon, 17 Mar 2025 02:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WktgQhH/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73BD1AB52F;
	Mon, 17 Mar 2025 02:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180179; cv=none; b=duxcYarCuouZRL6yVeDtkGicRCRyM8fALvK9w5ZcMfMT+3whTLQ5hchZ//YsqGkO/MOSjl8BOjNOj6DCEGqUw7oyN3C2cEY+eOURu+PAK8BNDL85UuFyztHx+cL7yXEAYN65WkC4xtmsGAWXSRCV48g5QYosYlPo2InfNkKxF60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180179; c=relaxed/simple;
	bh=mVOnmRQi3G/9HZMHNt4Pv7yUGYnqDsRR8pQDjcat0bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hEMRKGjgauXs7wMn013ZveVm2XOzm/PW/7qoaXtzGaC978EYEiIc/722giLo35KiZRvQbz6B8d97R6zDPw2TTkaZAD4HOMUQo34IB+rJIuWBTiAy5STMxqsL6IgPTEDdwjlgkXcMUFW7I7FKmS3ekcK9uqV8hGDrkXFDat8+SD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WktgQhH/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2B1C4CEF7;
	Mon, 17 Mar 2025 02:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180179;
	bh=mVOnmRQi3G/9HZMHNt4Pv7yUGYnqDsRR8pQDjcat0bo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WktgQhH/Ir4RwN7G43NWyofuw1z92D6c2mly6OKbsGuvsBlb+NpfeLl2Yodj62HVv
	 pFYXF9ZMaaAGBXZ/8lORG1GZ7ZeFzQepJFg1IVETqIB7FkR5HcCmANc90i3oZNLuju
	 BZRoFauqZJy7pB9fRZTxMwr0I0iqfGA+VvVRpUX+WH7XwU29mMBFABpT5WRoKwD919
	 FvPzYW9rb8RQC8zatJD6f0u6cLXJHasdLoZec6OJEu3Bdeax2QVel30nd/JBeh6IPp
	 MLuOfDbc9L6hGCQh6Wplrz9Y5QN0HpXIl4qOWOXnGI852SJ/qlWkJGXIFJLVLVOHU6
	 Q4ERQf2d3+Hvg==
From: Bjorn Andersson <andersson@kernel.org>
To: quic_fenglinw@quicinc.com,
	quic_tingweiz@quicinc.com,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs615: remove disallowed property in spmi bus node
Date: Sun, 16 Mar 2025 21:55:58 -0500
Message-ID: <174218015898.1913428.10971664496627843212.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117-fix-kernel-test-robot-unexpected-property-issue-v2-1-0b68cf481249@quicinc.com>
References: <20250117-fix-kernel-test-robot-unexpected-property-issue-v2-1-0b68cf481249@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Jan 2025 11:24:31 +0800, Tingguo Cheng wrote:
> Remove the unevaluated 'cell-index' property from qcs615-ride.dtb
> spmi@c440000 to fix the kernel test robot issue.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs615: remove disallowed property in spmi bus node
      commit: 54040a3e3da67ef0e014e5f04f9f3fe680fc4b55

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

