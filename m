Return-Path: <linux-arm-msm+bounces-59575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 327D7AC5335
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 18:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C30DF3AD390
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 16:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188AB27FB02;
	Tue, 27 May 2025 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kuruczgy.com header.i=@kuruczgy.com header.b="jCPrRhHs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C229A2609F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364187; cv=none; b=rUpIdKNsY/7aBg3Xcsv+cWlaK/WPw8a340LjogNZomiAv4XYms9Rc3hpOos1kN8t/1eTCWmFEfUeRnkMEMBHS5mehwyBjg7+rqPPzgGIbndezOvrzDE2vzC9w0edhvCfvTqitaZ7pYyCPeP4G8FXioS+KgsQhnRa6SeIILxz74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364187; c=relaxed/simple;
	bh=ku/v7ji6DT3u6PEKUyFFkZRVwekFEnBZYNw8htFk6Ks=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=S5ZXlba5XLjVmwrMpiCB9FaeRFcSj7n3MP372ScX46xnr3+9aggmU8kfNpnGHi8BuwL7nlh849f2Sjsh9QmO5ma+crW3ONCUk6wxaJ0MG/Q092RJc+8jUHuKE341MD5mKfb3Dhp/5E6TK5gF3vNfAq61qUn3aN2XcIg/Sg8wnBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuruczgy.com; spf=pass smtp.mailfrom=kuruczgy.com; dkim=pass (1024-bit key) header.d=kuruczgy.com header.i=@kuruczgy.com header.b=jCPrRhHs; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuruczgy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuruczgy.com
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuruczgy.com;
	s=default; t=1748364170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ku/v7ji6DT3u6PEKUyFFkZRVwekFEnBZYNw8htFk6Ks=;
	b=jCPrRhHsmM+bdPCaHZ4TMonT810h3vyJwzZx9QatnZzIqXa3eyerbghb7Z6Uab7rl/AgoJ
	SlCsFYRL0THSaorzI5ELgK3TuOOqmqxkYBa9LxyrxMa+8kWBDKyEPis9NR806Syi83nR7k
	saVh8NSj/CZDQMMuAcls44Fx6I8leVU=
Date: Tue, 27 May 2025 16:42:46 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: me@kuruczgy.com
Message-ID: <a6ed79b329492648a496353db1462e7a7a09597b@kuruczgy.com>
TLS-Required: No
Subject: Re: [PATCH 5/5] power: supply: qcom-battmgr: Add charge control
 support
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>, "Sebastian Reichel"
 <sre@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>
Cc: "Subbaraman Narayanamurthy" <subbaraman.narayanamurthy@oss.qualcomm.com>,
 "David Collins" <david.collins@oss.qualcomm.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com
In-Reply-To: <1b1c4617-0e5b-40c8-9a66-d243b48c0977@oss.qualcomm.com>
References: <20250523-qcom_battmgr_update-v1-0-2bb6d4e0a56e@oss.qualcomm.com>
 <20250523-qcom_battmgr_update-v1-5-2bb6d4e0a56e@oss.qualcomm.com>
 <db0e40b6-22f3-46aa-b35d-7a8729370ddf@kuruczgy.com>
 <1b1c4617-0e5b-40c8-9a66-d243b48c0977@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

> No, sc8280xp and x1e80100 don't support it. So I didn't add the support=
 for them.

Hm... From what I heard charge limiting works on some X1E laptops, e.g. t=
he ThinkPad T14s on Windows using Lenovo Vantage.

Do you happen to know how that works? Is that some vendor specific soluti=
on? Or does it depend on the version of the battery management firmware? =
(AFAIK this is part of the adsp firmware?)

Thanks,
Gy=C3=B6rgy

