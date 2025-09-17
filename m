Return-Path: <linux-arm-msm+bounces-73986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5F6B8196A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 21:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 096EE1899014
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 19:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5527C3043D0;
	Wed, 17 Sep 2025 19:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcEIjs8e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2417D301715;
	Wed, 17 Sep 2025 19:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758137003; cv=none; b=lLyp3h4+EFotPZkvVEcIcsFWMhrZ0bNB/bDq31bTPtMxqR2B6m6ajuLv3sst+mgFkEItfHDHwUUdQ9n7Ts5ZUTO7SacixCSai61v7wc7srLD7RVrpMqdxbdLIMw/JgD3Anl6+TnlktJyNwN0nHAr5RGRROP55j1VZ6/Xoke8MDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758137003; c=relaxed/simple;
	bh=VbYuT4eimslG2e4iLpbUc1+CLllNv9ySnfQZg6GJ0Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TwlmKGxaUSBk+GWcmEPiVwWn0llQ/K1Uk7+pf9/SNAFZkNVBGtiGV1PsBbAjUA2MEOLVtG7VXwVRzsvdP1lkq7JPixElfUH+qKcibpaM5TQCDdwPH9PIj6SIGC4DWiRMOEeXQa3yJseHvGxuxdO8B1ABNB7Wd3D39MEqDlZgD+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcEIjs8e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5623EC4CEFA;
	Wed, 17 Sep 2025 19:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137003;
	bh=VbYuT4eimslG2e4iLpbUc1+CLllNv9ySnfQZg6GJ0Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rcEIjs8eTX+C2mnGhC1LjZmPJVHKPAEJAEbBnxnY+LtbkkOMuu+LlDef1ke6poPk/
	 otshpNkEl50zx0ZIiQcFxFtVRZkGUNQfoC5wPSEMClJ0fRWhdDH+yiO4Asbm6ajSyv
	 hA1ASoXA8K6k9P8/KgxY8BVvtoc/tSI8qZHyhVapGVLdPyL0QtFxo+HcZqtdh+yW+W
	 5uk8/rok7vz9q1WaqGq5lOz9YV3S01p1eOL4lUN+nunDGskAijBc2x3hPshmkDDOPr
	 vufGI2C4KE+cKFUeEm4BxXpWgVNR3LOe1dFOosaB7ogcj5zB52r6BaDj6QDm9g6xOU
	 ZafYIe/Bwi0pw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Flatten usb controller nodes
Date: Wed, 17 Sep 2025 14:23:18 -0500
Message-ID: <175813699401.66282.3103305628321781310.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917123827.671966-1-krishna.kurapati@oss.qualcomm.com>
References: <20250917123827.671966-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Sep 2025 18:08:27 +0530, Krishna Kurapati wrote:
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach. Enumeration of ADB has been tested on EVK
> Platform.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: lemans: Flatten usb controller nodes
      commit: 6e5c4c093c7215198ea9fa83dcbc47d3f961de7a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

