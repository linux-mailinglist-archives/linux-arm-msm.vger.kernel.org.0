Return-Path: <linux-arm-msm+bounces-81931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BE325C5FF83
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 04:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 664A934AD2F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 03:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA8B219A81;
	Sat, 15 Nov 2025 03:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fYqCKu7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3439FEAE7
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 03:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763178372; cv=none; b=r0g6LcyfYU4AAsZsTsy65idi/T56D4fyH+swKv583Tnnob/OI5tUBXtumVx+2aEDVKcbFdqg1Y7wlbJjqJqTnmUQZoU4uzUXOZrriTD8UegoGOexZZPToi28TPs2yJCUerJ8llpe/toMYZPPMoRqn3u8ijSvEDlW/bpTQWVVPos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763178372; c=relaxed/simple;
	bh=+j5wbe7YjB1a0hotxpowwguyvU6nExjp2FExXGquiXk=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=rd8FL1bjNE3hrN2ehkK1AOHA7PYL9diuWd7Wi3zWYN0pusRZaPjDbDFJA8SSORfEF6hhe6SQSgTfZMj4mZtfOABGELhj4Ewcm7RA+kyPsZkfKkK2k+ZNlbt60s1HiFxKJERr2CWlZYx2wuozrD0CqzvoOUpIkX6vnrgDw/002aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fYqCKu7+; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251115034608epoutp04135af472ff806a35c521d725cf974c69~4EWJZFiwz2005620056epoutp04Z
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 03:46:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251115034608epoutp04135af472ff806a35c521d725cf974c69~4EWJZFiwz2005620056epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763178368;
	bh=iezP+plYmMt5jcJgmzrY9aAxgyLRNZkWdBeBYsojFg8=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=fYqCKu7+cdH4XbYqUOP6kUsrEHgyY3SbCc6MmgPl67uLD7ff1SqeS7Tce5eJbPQH9
	 41xnhza+C0uRL5npDT55v1QvIG7hFkYJNL8ZiJOT4UcfS/h+C6pJSdxgQVqdaPY3B/
	 Fj+cjv+evKV2xl/aSDUVjsGDwrr/bX7dXRQgNt6M=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPS id
	20251115034607epcas1p34f9f9576203c8a0e3dda95c01d1505af~4EWIqO2IQ2030020300epcas1p3R;
	Sat, 15 Nov 2025 03:46:07 +0000 (GMT)
Received: from epcas1p1.samsung.com (unknown [182.195.38.109]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d7g0G5tG3z3hhT7; Sat, 15 Nov
	2025 03:46:06 +0000 (GMT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: RE: Re: [PATCH RESEND v2] devfreq: move governor.h to a public
 header location
Reply-To: myungjoo.ham@samsung.com
Sender: MyungJoo Ham <myungjoo.ham@samsung.com>
From: MyungJoo Ham <myungjoo.ham@samsung.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Robie Basak
	<robibasa@qti.qualcomm.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <cdzlgnun7kpn24hziut23njsnlnzl465hdquq4zfmur7ylt5id@ioaqt5ilixwt>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20251115034606epcms1p8e17db2609c72815e30df17ab4c895afb@epcms1p8>
Date: Sat, 15 Nov 2025 12:46:06 +0900
X-CMS-MailID: 20251115034606epcms1p8e17db2609c72815e30df17ab4c895afb
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-361,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251030182636epcas1p2b332b417c1c42fb559a6f34e9e9f408c
References: <cdzlgnun7kpn24hziut23njsnlnzl465hdquq4zfmur7ylt5id@ioaqt5ilixwt>
	<20251030-governor-public-v2-1-432a11a9975a@oss.qualcomm.com>
	<20251107005809epcms1p5f33e9560755367f0ba4b7df82c87fc85@epcms1p5>
	<CGME20251030182636epcas1p2b332b417c1c42fb559a6f34e9e9f408c@epcms1p8>

>On Fri, Nov 07, 2025 at 09:58:09AM +0900, MyungJoo Ham wrote:
>> >Sender: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 
>> >Date: 2025-10-31 03:26 (GMT+9)
>> >Title: [PATCH RESEND v2] devfreq: move governor.h to a public header location
>> >
>> >Some device drivers (and out-of-tree modules) might want to define
>> >device-specific device governors. Rather than restricting all of them to
>> >be a part of drivers/devfreq/ (which is not possible for out-of-tree
>> >drivers anyway) move governor.h to include/linux/devfreq-governor.h and
>> >update all drivers to use it.
>> >
>> >The devfreq_cpu_data is only used internally, by the passive governor,
>> >so it is moved to the driver source rather than being a part of the
>> >public interface.
>> 
>> Hi!
>> 
>> Could you please direct me to the governors or drivers needing this?
>> (Qualcomm drivers?)
>
>This has been prompted by the Qualcomm KGSL driver:
>
>- https://protect2.fireeye.com/v1/url?k=f6bd3b8e-a92112a4-f6bcb0c1-000babe598f7-61920f21ff9de708&q=1&e=8591e0e4-db8b-428a-84a2-250662bb2f1b&u=https%3A%2F%2Fgithub.com%2Fqualcomm-linux%2Fkgsl
>- https://protect2.fireeye.com/v1/url?k=47a092b9-183cbb93-47a119f6-000babe598f7-7e1401a14df18a21&q=1&e=8591e0e4-db8b-428a-84a2-250662bb2f1b&u=https%3A%2F%2Fgithub.com%2Fqualcomm-linux%2Fkgsl%2Fissues%2F11
>
>But I think this issue is not limited to the KGSL driver. Other
>out-of-tree modules might also implement device-specific governors.

Ok, I see.
It look good to move to the common include directory.

Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>

Cheers,
MyungJoo

>
>-- 
>With best wishes
>Dmitry

