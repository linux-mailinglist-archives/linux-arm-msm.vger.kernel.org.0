Return-Path: <linux-arm-msm+bounces-44189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 781EDA046CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 605223A6118
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF22C1F9422;
	Tue,  7 Jan 2025 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FunJouHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BCB1F941A;
	Tue,  7 Jan 2025 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267965; cv=none; b=khdou8b4lKzbzWRS/e+2ClSoNEDhRLQBRwGwVssB4Wo9uybstCPPACiHYlLthUQ2pgiXLQPX3Nw/TK75e75pqv+d66tOYlowh2TQMdLD7tskbj0id3D2ByB68ZWiAJwQr8Nz2ZFgJ41WeQ+DBiFV3gZkDyHsgb2ib/JOI5aXsLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267965; c=relaxed/simple;
	bh=r/bghTInBIN1/MOcuc0i7ljsTzree7QSTVuzJfBm4bI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3C34CLbu2EeXXTIljh/hqduQ0kmmTMXippbcXNoDUpzygwc9+pKhT5OHWNXUTkZoxQfbeCCNNdIpcAeRmN37e9Jm2rIZlUgduYYIfinI9S1azcuHmqFw1XjpSF5brXCHktyXB757VAVpC/dayZQmOjDhhMNa83P255WTlW5YVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FunJouHh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312B5C4CEDE;
	Tue,  7 Jan 2025 16:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267965;
	bh=r/bghTInBIN1/MOcuc0i7ljsTzree7QSTVuzJfBm4bI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FunJouHhMjgQtArku2Y4RMHiE0TEkT8BHEHvdKG3DNEtNKJ4p4cUOB7VFr04CCgZo
	 awe2gT7aj/p047FeOTSEi21bYItQsVOqlWJfrijnfLSgjX2/OnlG8rwQq347vIlDCj
	 4/IHaDl3lhCZwyof2LpM0w1yB449Pk+l1V1gmTUd2z9JLHpqbWpqWXd5EwnPjkD4ys
	 s6qzDhECeTi3CaYbYibvhbDnsg8jWeIL8+J4LsQRief047SzITAdzEtXlgPTigSYWm
	 8TW4lTMRE2SF2swhRXeN1DEYm5H8szAyFeQc9GKGO7I1Ap62mzuj2B66f/JrBeKnCl
	 BDqBCPT3payWg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Yijie Yang <quic_yijiyang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] Enable ethernet for qcs8300
Date: Tue,  7 Jan 2025 10:38:53 -0600
Message-ID: <173626793414.69400.7457166955353227086.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206-dts_qcs8300-v5-0-422e4fda292d@quicinc.com>
References: <20241206-dts_qcs8300-v5-0-422e4fda292d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 06 Dec 2024 09:35:03 +0800, Yijie Yang wrote:
> Add dts nodes to enable ethernet interface on qcs8300-ride.
> The EMAC, SerDes and EPHY version are the same as those in sa8775p.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: qcs8300: add the first 2.5G ethernet
      commit: 86d32baddc7bac85f42eb917baff9914131dd393
[2/2] arm64: dts: qcom: qcs8300-ride: enable ethernet0
      commit: 787cb3b4c434adf117236e0ba23280264e73f90e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

