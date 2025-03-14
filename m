Return-Path: <linux-arm-msm+bounces-51490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECADA61BAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96AD4881462
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9079D2135C4;
	Fri, 14 Mar 2025 20:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrOBWgGF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E872135B1;
	Fri, 14 Mar 2025 20:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982511; cv=none; b=Tuolbx1YOnRwBlVtLr2Rt4Ah7ZtXL+Qtr5B+ymnbriNbM9kvootseE/2gvUPrgaU1lXMd5lHyzV3u5n9HiIx6sXPWUFjo/iKVPZB6KuYYVoI2g1q/0HL77jvslkCVdYNb1wUzX3hMTDDasmYxjq1BuNxBnU2ggLhexhekOXJxww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982511; c=relaxed/simple;
	bh=ppUAsRSvHExMfRkeFOeR3qgfyzRUuJFSE+Bw9/CHGmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AlCe3+e8RASyczdFU6aHL7AGoCIyu3Fj5ajP8NyWLRB5RdfA0bkeGplU+oEo6N9io33vHAzHHegktWUwDVCyvPavAjUi/27XEb63ffvp7ZvddNx/UntZ5TMstPHEcnOnkjbZZY52VSwhAgU/jInDrNfoX/M6fDCF0tlYqF2DmVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrOBWgGF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A96C4CEEE;
	Fri, 14 Mar 2025 20:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982511;
	bh=ppUAsRSvHExMfRkeFOeR3qgfyzRUuJFSE+Bw9/CHGmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RrOBWgGFPKzjWdXc8FsAw/k4ndhS2Um3GFYk9fkh5lIu63jLwhuIqn769HgWkJ17N
	 mjWGo4Yzcdh6MGHaMxodhHz8+6DqFIy8dRTvGaMG2dLnHk/Bph+VlQk5tFhM08aHKk
	 S73ThbjCsgrIRD7EX3paDcHh3obr8gEHYu+xbY8WkOFPZrCS7Dt+NlUMWn/6jmwI0a
	 DjDKzoH3Fm+bOJ+eyQ0YSBWMFCLlWKvNygzTvFNUbbJqHgyvdR1TJxTBgI0nxkcpyN
	 lxBnduWeywKlFMjmlh3zoGowQSodJptpfaK5HKC5KKLT+hFyXVjnGtzsn4J/TMBxJI
	 DBx7SIT1iYemQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Jinlong Mao <quic_jinlmao@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v16] arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes
Date: Fri, 14 Mar 2025 15:01:04 -0500
Message-ID: <174198247896.1604753.10488977797606481991.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310095625.2073735-1-quic_jiegan@quicinc.com>
References: <20250310095625.2073735-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Mar 2025 17:56:25 +0800, Jie Gan wrote:
> Add CTCU and ETR nodes in DT to enable related functionalities.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes
      commit: 05ed68070d7a061f62f502d07f883c05dc666990

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

