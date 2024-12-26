Return-Path: <linux-arm-msm+bounces-43389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE909FCCB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28030162BE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5CF1D9A47;
	Thu, 26 Dec 2024 18:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tss6zVaG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCDE1D95B3;
	Thu, 26 Dec 2024 18:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237645; cv=none; b=IS2Wuhfwpjp959aDKVNYYhLDC33MRl67PIPDZYhZxC1erucD0xblNuKrbgcd+/7JrrC2ByvJMrY4FVv28RLvhlXr0zJc5l3dSV7M/ayyJ4krSeBJFSgCuDq80QU1fI+tueeLrBwWAl2q3zBq5Rp7qHKSzxhjiONPWfilE1AlUpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237645; c=relaxed/simple;
	bh=msGPvWfsO7CXVftOUMwhKvero+Hoo1ttpKtnVlXosmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cQUvk7SRSPNRkyvcUW9EbKsP/sAgCskvGKe86o7nZi4S7m9RaKqMX6Gh+cD56p2gLzNn7+IWl4ECFRGTsE41TkH7SuJUwwdznPoCe7N349gkSkZSJQwCp2+p1e18ZT7eVjkaHhdwmF++JWhvHMDc2762S9hGRxQR+TcUqH56IuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tss6zVaG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA49C4CED4;
	Thu, 26 Dec 2024 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237644;
	bh=msGPvWfsO7CXVftOUMwhKvero+Hoo1ttpKtnVlXosmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tss6zVaGt+sRrh8tCTdQT0C7qoOYrrIlg6fPZcH4+q/wDPpaIlzwtC6svPojKKkLW
	 l3vWPozkGe/9x7s2ikrk06CORMQp6432v09iymR/fugPTq+NaF+63hP82fOibNOZGu
	 scZyN/0PvUekK/c6fu/J1H+ui3j2YVJwzkW22+RRmnL9h9hGrzRU8oOnRwBEJLYV2H
	 A/4uKc7SpgjFNM3ATYplj6BrWqJS/6AWuujPP8QDs+OQBj5cDIBWzkDs28xe6gnNfP
	 aGi0AL7YEFii37lAJI21xnkwKIZVdmfE43zw8QqVk49MDf7xIlb9LaFqg3MJRVv0vp
	 eqNL8K/yu8Fjw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Use valid node names for GPI DMAs
Date: Thu, 26 Dec 2024 12:26:42 -0600
Message-ID: <173523761387.1412574.7197869872651859255.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241107-topic-sa8775_dma-v1-1-eb633e07b007@oss.qualcomm.com>
References: <20241107-topic-sa8775_dma-v1-1-eb633e07b007@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 07 Nov 2024 22:14:23 +0100, Konrad Dybcio wrote:
> As pointed out by Intel's robot, the node name doesn't adhere to
> dt-bindings.
> 
> Fix errors like this one:
> 
> qcs9100-ride.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: Use valid node names for GPI DMAs
      commit: 86348c7587f556d3f0a3f117c3f5b91a69c39df6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

