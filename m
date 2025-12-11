Return-Path: <linux-arm-msm+bounces-85076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65763CB676E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 17:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EA5D300F5B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 16:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEB32D24BA;
	Thu, 11 Dec 2025 16:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6GQuwIG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7xbAHxc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F355628688D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765470538; cv=none; b=L5cY/d4tmWo/GYripaQsdZUPxOfwj2pg/6IX+YH/Pcq543YCT7eUuEdYnzw5TICNiYR95MmG7W1qWX4m3Wr1LXKy7dKp+D1vL5hbMGYcK6ePFNBQodFbZk5YcVgeCy5dtXWvCnI9BAAs78SrqX+ZlWmJP7TGUTDiyb1jFHEMTKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765470538; c=relaxed/simple;
	bh=kLeoDHbd4Qlk0/LiRA2NYxbACsWRIziEVCq3nv5dbHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQKuW0nQJmkD2Zbhhv+Ohn1NEKPTZ5u8fVJHwSTo2lCaVBEPMYNPk3OIZ1bFlIDcBhdhmr/BID6RipuEBSm5ch4wE1BPHJf3AczKy3qSut5qJsRhwL1Z5JHcdxQhbzxLmDkCYkZ08/ip3tQESp7vp4ZIPj76L2/YFf3/hhkGaEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6GQuwIG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7xbAHxc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBEPHAU1525444
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 16:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hxkxHZZbdgiYUD1OXr0gwL5s
	lpolaexa8OxkS2MADcQ=; b=C6GQuwIGytOKGVLISmcdpbINqRr+/Z29RF2AooPy
	d4lopIxw6FswWn4OsCoCOB1AvGX7D6D+HqXTANjzqOTyFd1pRh6MRdiTJfiSK2OS
	sSopqqqVJHDFJT9LZgZOK+rf/soszdZKHHnbVqnWrcSTkk+lrLoovnCQr1aJKlVv
	XlaaeZZNPyRmgsTc6qJ90hdabYYAgnLtmNuCAUaqqVb9ZLICWi8uSVvORtL2h69C
	HxF9tie3tlLvaXyjC1ZMuCAswfhvHxAjByB0iS9MWjQVdEDBLL/FpifU088SCTpA
	d9GOrpucKXe/Frfsq6Ew96slV1zcp1k420HwXpnsCj0snw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayrpahxbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 16:28:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso8759331cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765470535; x=1766075335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hxkxHZZbdgiYUD1OXr0gwL5slpolaexa8OxkS2MADcQ=;
        b=e7xbAHxclYziMUyhPFp339ISsP8hMHqM1tR7BxcEKFftiFYmJgTq5TqBjUkBXEZhIu
         Pc6RhsHdjjyRbTn9FTlQN4aXR6IFAurEzoCpinaXX/AQ3sn4waONbFbvtURuQ3tkhzUC
         rYx7MTstZYIIt0AqWbfcnipnVQANghyTY1VG0vKDTPVbR8VHQfEfrgitZz7kOiCf0Izg
         II2JYUQyTT/IyjSuY2QS0Z/rejlaZm4i46X3VYAvCZxKohoVS+3iekQtOsxg2OWveenP
         8OKr3bLja/9KsW1twbGiTtM+vqmzxben7uVjWniSRZE7DUByYZa6J5f2QITZVh3ihrkI
         H8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765470535; x=1766075335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxkxHZZbdgiYUD1OXr0gwL5slpolaexa8OxkS2MADcQ=;
        b=OFnnHuqAG6p4lDWJiAn7UcfJlIrwf7FxlOSlfleo8WaviCoS3exHbKgtpLYXkl65kv
         XU8yTixEAZYI1RYgG23NIKVkoMXpVd3/yHtsr7WEdI23sEo/vXwM0cMIdXBR7Yro7flu
         IlZTfo0Z5XH3vpofJqwhfBegnGvqpYcjvJdiggYhBKqPTveLDtKMZ+wPYgZjSZpLKS+a
         FCTemO30+PncMusnT5LLuKg7dnQZi+Nun/uKn3dhViB1B6snhp8MYpYtmmBvpD3BgcBt
         oThgpMCOAGNHChdm2/FtlIzYHRs2aB7UEH2d2yx5bj1KGDArGdzfZtCsFi5IVMzqfxcd
         w79g==
X-Forwarded-Encrypted: i=1; AJvYcCVq3Jz3gr/U3z4JietGKjBGZgz4eDELTmS8j+TdQSM4b1CKB6YPUM5cz45o36eOYVgnF4KPRBdEim/BWbjW@vger.kernel.org
X-Gm-Message-State: AOJu0YwstdtWtGsdoewkFWewkTPEXQwRN0nWW5cdFFZHKBtEM8LJ70L8
	xrJQ7IC82Kl1kGwwkk1B/SC1PE6YhmN7EWxOm2BZrt5hKNUAz9lxmXwhKLrd5TQ3+5EM8Ik8D+L
	pDqRZwc4Zq2w7SEdSKvcLJc/3YptbFwF5lOxH7AbHCMlRT22GN6WRD3Gjhts+J4ZMiPHG
X-Gm-Gg: AY/fxX4itj+rsu9ms56B+k9SFRnzmThGoADiqCc0hGW/sTR4bWs2V+SQ/ezli76600f
	8dgW02ZVwUh+uJT0pwTPuuNhzGOnNrq2fBsjxtpmX8O3ip+jMvT2i3tCzRistrrW2XMXu11nIDl
	i+pjoXkJpbpUD1rJyNVKRu/HgW8vNr86cuWrZyCOBlZqB03GEwvx25Nmb8lrJwzUhOaPu4MnO+q
	fgcO9VVnZnUQrUg9kJg2NDBHQ7kxizVCR0j6OHlcNXrPThti41R1ctUFZLrH5GpF2xLtgBvD8f4
	oNFYzHY3/mUTTmIdT9b082cG40nyVG+zUGVV8MvcZ9uuYg4eOCltRjykH70pas4x1gzoJykKy5a
	GsXH5jqxDoNdlkGw9ysqcjA==
X-Received: by 2002:a05:622a:22a8:b0:4ee:24e8:c9ae with SMTP id d75a77b69052e-4f1b1b20b23mr96195901cf.53.1765470534741;
        Thu, 11 Dec 2025 08:28:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSiYoT2q/0E+BctPmBX9pFsraw2ImC+AAik+lVbdC19SIB1nNBrccTqXD2vlttYF0lMCwxpQ==
X-Received: by 2002:a05:622a:22a8:b0:4ee:24e8:c9ae with SMTP id d75a77b69052e-4f1b1b20b23mr96195411cf.53.1765470534214;
        Thu, 11 Dec 2025 08:28:54 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89ef9768sm46854015e9.11.2025.12.11.08.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 08:28:53 -0800 (PST)
Date: Thu, 11 Dec 2025 18:28:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v3] phy: qcom-qusb2: Fix NULL pointer dereference on
 early suspend
Message-ID: <pks5jfir4rkopllzmiij2d5keiqyxxk4kqlkdeh43iqf5ypngq@k2t4gc6rtmss>
References: <20251211153536.1880258-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211153536.1880258-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3AvVVBJ3iLXJuMncWOJDnxmq7muhpT2S
X-Proofpoint-GUID: 3AvVVBJ3iLXJuMncWOJDnxmq7muhpT2S
X-Authority-Analysis: v=2.4 cv=G9sR0tk5 c=1 sm=1 tr=0 ts=693af147 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=01En1cxxkT8w_nZohiMA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEzMCBTYWx0ZWRfX8i2M0Aqy10T+
 Qn0bszTqadAdXtXzZTA+VruL9/TbnifGatX8O2HMfDCUX+JVbJrAiSoq6Y/3uGXNdEwxlt5GUku
 6OMlWyH07+nqI1cFX8GNmlkAgV44z5gVn8NZciugrcDFe0gvu/dBifXj9PYSkAvXqZsZBy2zUNJ
 oZdREN7JpU/FOxxoxgtkUtiNIvtIEJeBahMOKNCkSaSPHKMAFpOzYQZcZ92t76zBHmViYsqzrZi
 qY1ArLvD2zYIP/Ga3TmvAv7Fcqx3MBGZ6vefLzu51Bt6CVJr9u2/NsjW16WYXJGQ9KHcTb3puWu
 9TH9uZF6/FJJph2qnZ3c8QBYr070+NsKuMfRJkQfffp0/Dz4ftQayszL59YTQwbfdgGI8QgwBKL
 n+cNKK1qTpCfDRe7FkA9i0sr5jgXkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110130

On 25-12-11 16:35:36, Loic Poulain wrote:
> Enabling runtime PM before attaching the QPHY instance as driver data
> can lead to a NULL pointer dereference in runtime PM callbacks that
> expect valid driver data. There is a small window where the suspend
> callback may run after PM runtime enabling and before runtime forbid.
> This causes a sporadic crash during boot:
> 
> ```
> Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a1
> [...]
> CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREEMPT
> Workqueue: pm pm_runtime_work
> pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
> lr : pm_generic_runtime_suspend+0x2c/0x44
> [...]
> ```
> 
> Attach the QPHY instance as driver data before enabling runtime PM to
> prevent NULL pointer dereference in runtime PM callbacks.
> 
> Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
> short window where an unnecessary runtime suspend can occur.
> 
> Use the devres-managed version to ensure PM runtime is symmetrically
> disabled during driver removal for proper cleanup.
> 
> Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

