Return-Path: <linux-arm-msm+bounces-51479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2CEA61B75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88D6F88207D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0316F20ADF4;
	Fri, 14 Mar 2025 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUdcvo3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC39E20ADCA;
	Fri, 14 Mar 2025 20:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982499; cv=none; b=dM6/QygRPm/sgQ3gyfGSkxVgSqGuarROmxwwa69ERdFo6Y/HrTrKuclSqUm15xFDtcWbqATqys/hB1xjtIBxec9iDqD5O00Md6ce3cM8F1bvYg/MFAp6q7uXBPyvBlUchlxBw3+QeuJXPJSKGy72I5mjD5uoVB8yo/9PEShzTaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982499; c=relaxed/simple;
	bh=LoXzvxKv63lMosw/0mzu5pRBsjA6XrWYHcufS2MIBuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lUgHIXeZfz7PsOOJV1+hoN9yvVIMKNnfJDHV8/XmYKapgOyDLglGG3f8fZTWoxXs0cZ2OkR6n/fgoY667j9FCY4YCzjXlM0BEH1UoKW8OBXpSZh3WxeiLtu483oU0SoCXDTuznRQjh7itd2qJSjcaPdtI1wFOFGCKHKqJiYjfGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUdcvo3u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873C9C4CEEC;
	Fri, 14 Mar 2025 20:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982499;
	bh=LoXzvxKv63lMosw/0mzu5pRBsjA6XrWYHcufS2MIBuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bUdcvo3uYXk6J7Acos6XKMzKnV2/eoSQInSVwDXOlrCNvssCdJVp9oZXu2pAhBlMz
	 4W0uqpIUDkK+4pmDzGkZif4npq9CL7Dkfjzo42P5Xrf+Wm/q1lgYQCbDW1tcKcOUTG
	 g7SAQiKkXuUlmV/Kqs54ce/ymHbyGZCBh4CcjqjHseY6xKJHVaaHwxePk8TB//0HHM
	 8axAD0Qi9MuEVSenlpBLKMI6DY173tz1UgaIU/iTp+mLwNMuUYuz8FRErMArCROtJS
	 mDlAPPM05tqpbPsBPMTp5qS9dX8ribTMRcr7yD70/cdPeDOSAs7u5AqQYBjE6qqzPx
	 akF8kmpMvaMQQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add orientation gpio
Date: Fri, 14 Mar 2025 15:00:53 -0500
Message-ID: <174198247899.1604753.5871076212469203336.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312100544.1510190-1-krishna.kurapati@oss.qualcomm.com>
References: <20250312100544.1510190-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Mar 2025 15:35:44 +0530, Krishna Kurapati wrote:
> Specify orientation GPIO to the PMIC GLINK node.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Add orientation gpio
      commit: 7a54680f192f3fc0a6bac8bf6f91ce7bd63b8907

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

