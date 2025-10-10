Return-Path: <linux-arm-msm+bounces-76797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E85BCD9D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 16:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47E013B24A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 14:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B460B2F619B;
	Fri, 10 Oct 2025 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="K3NZHCCU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender3-pp-o95.zoho.com (sender3-pp-o95.zoho.com [136.143.184.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4612257AC2;
	Fri, 10 Oct 2025 14:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760107961; cv=pass; b=L5UKqre+5Hb8bTwNGikvVdcPqA6CWgRIGfemSR+Y3T2yuIMK43+aWuoyqBWAWllm+APH9HewyvJK0fY6q8VXgy2Z7U0eFWVms3ugH69fTgmXjUhXNaXNopCsXuNG83xDLc4MgqIYmUBL6yhl948yQ2SZOxu8zs4voI3lgR3rhKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760107961; c=relaxed/simple;
	bh=OlZFCQlrsBiLFI9zG9MO2jJAXmW50RchoDXo7r1HAwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DOiwSZ4dwf97irNZWnH/WTQ+YNDD2lzAYfDarf1aO1iI3MclMp7iPtJbd1vk3Dqt6Ma5o8l63bXmKQf+tgBYK3BnbSgex+Q6t6e+S6OutbO1VgmRc/I0I5RI8IEpU2dUGH/c2EYYPIbITUbB3VcX5PDN5h44Yla1bm/6D9C9pjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=K3NZHCCU; arc=pass smtp.client-ip=136.143.184.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1760107952; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dqGPjNuo5ZZtIN9nOIILuOGnf49Xta8kZ2iizr85OQowudQ8aViC6RF1q358umTp4K3MgjSRRcLjnBfCUpysipTmAR2y65QHAs0YePLPz37q/r/6XFW+hXt3QTZYlCYcyD5DaV5ndrsQNUGbAbRm/IUNKJ6NbaZ2g2nk+5SGDo0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760107952; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+D/q0yqYEcI5+/j+FWZAKWs26Jry2gcs554MhCZfAKw=; 
	b=C9Re35InSS+O836ZVVR7Hx480acOudJf8ZpcHEyWdpqrGwm4+DE2pazvY8NH9jWv4iamgFZ9NBFt+CVXk96Qr5Y9vrrN/d2CXedIzUc9NMDfHUO4BuEsH+faU4YRECNstAzyxNs3Jc0CCXHmtD4d4Wt44MMbr0CUOAdaGolN9Ck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760107952;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Feedback-ID:Message-Id:Reply-To;
	bh=+D/q0yqYEcI5+/j+FWZAKWs26Jry2gcs554MhCZfAKw=;
	b=K3NZHCCUvNNCOKzm9TRnqS2qae6bszrDO4ufXIJHpOjQJfVCB2/XhGuvXUMT1N2+
	xrCvDuOXvbVyNIasBUlq1/BhUczOmVQDGFsdjYK9UzcGv8oI7tZHPMnHgFTilBeMbM6
	iY+E8GoEvBg7T4yE8JiKLvTm0X1kRhTPgaDPKmnU=
Received: by mx.zohomail.com with SMTPS id 17601079497071012.9082767786626;
	Fri, 10 Oct 2025 07:52:29 -0700 (PDT)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v6 2/2] arm64: dts: qcom: Add support for Huawei MateBook E 2019
Date: Fri, 10 Oct 2025 22:52:20 +0800
Message-ID: <2386127.ElGaqSPkdT@debian-vmware>
In-Reply-To: <c6880fe5-029a-4f8d-a08e-81a066a79450@oss.qualcomm.com>
References:
 <20251008130052.11427-1-newwheatzjz@zohomail.com>
 <6199698.lOV4Wx5bFT@debian-vmware>
 <c6880fe5-029a-4f8d-a08e-81a066a79450@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Feedback-ID: rr0801122701d70a39a7fed5b45a08173e00004d767b6f4d7ed0933679a3a94a2cc61d65bb4359a1e4c4ba2a:zu080112277ad0ba977e7612494309121700005cfe3b6251fb207be6a0c3f9787550d5464a1de7785d3e642c:rf080112288d72baffb822b3774010c57a00001efc68c4cc5bc58bf37b51fce2a715f261396f6e59d14f75eb0c:ZohoMail
X-ZohoMailClient: External

On Thursday, 9 October 2025 21:58:29 CST, Konrad Dybcio wrote:
> Please refrain from resending if it's just to apply tags, maintainer
> tools do it for you
> 
> Konrad

Understood. This is my first time to send patches, so I'm not very familiar
with the tools. Should I wait for the maintainer to pick it up, or is there
anything else I should do?

Jingzhou Zhu



