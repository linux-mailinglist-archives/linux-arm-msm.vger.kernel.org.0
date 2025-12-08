Return-Path: <linux-arm-msm+bounces-84616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 187BFCABF0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 04:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85770301A700
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 03:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D470113790B;
	Mon,  8 Dec 2025 03:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="b78iWWm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EE421256C;
	Mon,  8 Dec 2025 03:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765163726; cv=pass; b=r0kiqQMl7C0MNcYe8hAqQlHAALjtMragSarUIb+7j2fRF1oJJ5/4ZxuMKKRfpXVnS8Jq7G7ylXfHl4VEGw5JUWY6eIfQuf4j89Ouzo+kK4kF2FokzySJ9UqhUmKIYYpxmBeocpbMf5Aww9yXG76QzfO/VXSubelO3Gw/JmpDA4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765163726; c=relaxed/simple;
	bh=R29zQQqyR4sjgmeSyqYO84+gdTwfYd5E6FhfaHohttk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EBWNfQmQavym/6HR/jPCdaK5elwCVJS1wo2N9LHoEU7TOiXachj7eVhOBSps0VBXtztXUJ0glv3uY8H1krmm3T8CswDvCX9UQkw4VqJ5LT0ryP71U5rwiO4zk04PJIVNvS18oaVmLD8CWvIQ7FknumvwmEyGAwxke7J2B9tx0XY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=b78iWWm0; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1765163720; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LHtAeNHyz7puvB9uxaJqV0b/yvvVQvAe5KgvmnlBFV4RVK1IZ7k7Ls8KweUwxG95ZPlHnMr1Vea6KmGz6Vau4q2Dl8hFAvpSh9rj9isiGNc6tL0TExTWtVj+h/RKEuvgFQ3mIUs9lHq0tUAoRSQ2l6zinFsM2z2DQfrz48yHkBg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765163720; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qX51rtxgMdqPYoYjQmln9yOMKgTN2UVb9U/nA7bC1w0=; 
	b=bhc/ez4Z8v7WJ3KlPcSB1HcSf1Prp9LZwzZQ9Fq6WGo9txCcOZ5tCJL8aV0btS/BoNj1f+Vb1bZWOTx7l6dfeSNqiJ4PBkgcUhpcchORpUcY8C74h3M04UOoxafbYTY388ZlwwhKaWBcnO05asxGYQLD6Wfst6TM+HB0P/lT9mk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765163720;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=qX51rtxgMdqPYoYjQmln9yOMKgTN2UVb9U/nA7bC1w0=;
	b=b78iWWm0XnOvm9DVXMv4uE9sWYLF2vsGpEd1v7kY7iEjONdmbFysuOELwAM1C+b/
	JHxE7bPGroh7A5Ore5YQs3XcrQB8Yq2XNOnZjCNM5hfxbiZHvWTlUrWDKMl4emojkQ8
	CvJP9aPfN5SaWR2WiXc+kYNVtPlpvcpBqffKtu4k=
Received: by mx.zohomail.com with SMTPS id 1765163719904860.5452612907364;
	Sun, 7 Dec 2025 19:15:19 -0800 (PST)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingzhou Zhu <newwheatzjz@zohomail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Fix reserved-memory issues to enable IPA
Date: Mon,  8 Dec 2025 11:15:09 +0800
Message-ID: <20251208031511.3284-1-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr0801122724e8c2c61ec6c84279928deb0000ebcb6b8aa8d7d82afeec904ffe5c8c6e63eb8fc7b7a6ed06f2:zu080112273567e4aa733dc1b1073110360000945b7b9485a8fdf8b7b26508be080631f41395c1ce0115181d:rf0801122c99c2704e8475b3d848a2baec000075c545847e709ed51ee97ecaadede8e321b849673b2713a0e0dd7e729dba:ZohoMail
X-ZohoMailClient: External

In newer kernels, the reserved-memory hinders some drivers (SLPI and
IPA) to load. Correct some of the nodes to address this problem.

Jingzhou Zhu (2):
  arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Remove duplicate
    reserved-memroy nodes
  arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Correct ipa_fw_mem
    for the driver to load successfully

 .../dts/qcom/sdm850-huawei-matebook-e-2019.dts  | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

-- 
2.47.3


