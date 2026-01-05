Return-Path: <linux-arm-msm+bounces-87560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0E9CF5CF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 23:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3FBB30734D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 22:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D4530214B;
	Mon,  5 Jan 2026 22:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lg6nEOh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MmJ9MQQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6EE28507B
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 22:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767651698; cv=none; b=qoCREVuVvzk43qgVJjmbpcfqOoSbkwWAKth0uy9uXVyCw11Gyan3p1CHSKPI/ME5hv2Xi5EPd1ZNHmu6573ZQS6MmnLz2/Y2ZHVGpdCcrr2QVhB86NJahofA1LCXwXHJ8Eplkzxvs0AlAvQpPqb4mjaBy7cX6XDVh4k7hjENwjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767651698; c=relaxed/simple;
	bh=hMdb/RC73mO1tw0mVEkrOZtFcrUrwnezJ6vjW0BzLIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exYoyVgVZwjVpx5Y/lW3pUlr/zpjAY/BylRC8hwTY39UtA9Me4qHL2CGRJjl43JTlxULRqdY1hBU37AFTtqxvEUZV2fdJBCbhye2gikpoZjosI1kBhGNkyjGpU1zOzgzSZWfnr2K1GFDZGiMNoBaj3VAWx5D1Tgv4WUC6CRwL/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lg6nEOh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmJ9MQQ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605FoUKu1617089
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 22:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DqSGOonlwIxu/y9ZKyZwTYNQ
	mOPSkOo/InS5KWNiF4A=; b=lg6nEOh8o/g82Jso9JcQxxV0mDQUBjylagh6oocv
	EJvA76qyqs5DzfBMqmKleis28oWMPDq+KKmseoRhvmaMvDwfClAG8a2BlsyDBhQG
	RYX+8siwXmPq26i9Yfk53jz/1rG7MRtXp8oVphzkRB7crM3I7noDAk0A5UYjUHqT
	/pNRtvMJ5GD/u/gqn+5a2EZA/vMZFdJRPgo3uYmn1BHx15bGYamDRbCQYfGFerXO
	ck05K+BsMh0Yzz15lHvkzXZp4lV2IycCwHYXbYpDYkber6Dk1k/g4kdtahMrax9I
	562sQwJTH+gk9bvjAwsNY6bMhziHRcFFs5ywTmk6JmcWKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgg9ys33v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 22:21:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4a92bf359so9622081cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 14:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767651695; x=1768256495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DqSGOonlwIxu/y9ZKyZwTYNQmOPSkOo/InS5KWNiF4A=;
        b=MmJ9MQQ9EmmmEInBiQJtISSnwNwtme15Jxy8RDRvcfJdUSl3Ke10YwB9jgKb0oIit2
         hJCQk8raLJQ3vM+kNU9SYHG334V//IBI+ynGly7FGGgzDXACXVQqQjxFiPlWCKR0DA1e
         p7QaSGagixZf4r05iOkiWwnuhr70zMi/09BbZFl7bu+xKvMM4YcDmJwHjXzx2Ljmpod3
         inL/dx9070Qr1W3MPAGTeh75XI20N1sLpvmZ9j5WrhRziplhBz/W0HYWboWKQ2I4NLBh
         TcpkynCvdRP8pT98yD8dqQQ5OOyQLdTzRFGXRsi49qbAxkAL54cl6kjTUz+dOLQL4EWS
         xgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767651695; x=1768256495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqSGOonlwIxu/y9ZKyZwTYNQmOPSkOo/InS5KWNiF4A=;
        b=YRWgYL8W6kG5yWFyclceD7xQ2Vt/uAwmFRfksTVR34IszmuDNucNXOH4jdItZqRklh
         hEUMnvRtWt41bUwpvgpDhsDT6Qgf8XUTcmEIgRyakA4CVgnIC8aNMWpbjwbXgzvZc+jV
         GYTDybJtmnai5SrqVCnLx8OCAfSqVimcPfsX1PzbX4blDwE3D3RqJdhiOB/DBGM6lneA
         R3Y2+9bHChp89u8yjOBrtS/DjjBByNXH40dFf2nthDXHADJjkK2N4Km/IHkSyQMnVOnh
         vF5Dw1iD4fxhkSTqIlmZht3Fl9xU61D1xXTeCaZ1xkX2U15OBZiMaX6CJQtW09fcD3qg
         bVeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXphxgNdB07xbTuu3gzBqN2kmdaEE1R6ydNwqyxPrlEj6CX9zveZdEqygERsWqRw6Dupl3RkLqP2up4JN2W@vger.kernel.org
X-Gm-Message-State: AOJu0YxC8+DbV03iM1KR1NyGHyr1FgzpftqvDjb03ksv5jrGwrTC80oK
	6gadIeSftdll/fSRZ6iMBkOhLnbQwk56vzdWZU5+33BUzSr69SePHA6uaDG1A7CnS93Z9rmmGhs
	8sDnp0QY/dzTe/yZyQKeF0NWRHi2neHAWfArHbgBbtXH7OGumGFCDi4Nh3gCBAk0QkQdl
X-Gm-Gg: AY/fxX7S+GawdEMC6YNY+YBqWLuAGifE7qOPGu0l+yXWF1A0Or3citezW/uLAq9v1Dw
	sYQEwIMflh8Rt2JLWNVD8AVIVCjKEynYpkUBHDPTyWcy2ojyJjXc4DaK2buYcbVVZpgfSMScXZk
	VWiFlwM2xLWU8hcI3WT3g2Qm9cpJYBCRhyIC2culcYdNzYEQ0vv6Uh7rFJxO1HXD4n/3uo0A77e
	ac3OD1cfxJMPcugfECfbkGLpf9VvoWdWQTdm7UKBrExjcgEnFMPm5gDXR7qQ1RaGy0gSVCkjWUL
	mI1v8RdXgbL6nNzqqX2ILtTQvHuBXW8fID2NKLf950GpdNor4fBcrwgHMdd32ZIMdHpi9BkmIIf
	65R9SayWZKRzGGEcSieid8MXtu/clVCZffyDEIg8pE7luKNyd6Jc1npEWKgHmtJ73CIFBrnJc2j
	2qMO5xLQPeoArXNVrF8Xh17Aw=
X-Received: by 2002:ac8:5a47:0:b0:4f3:5367:2f67 with SMTP id d75a77b69052e-4ffa759c7e6mr15827071cf.0.1767651695425;
        Mon, 05 Jan 2026 14:21:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH00+N0VRqXqszETrRcdC7ek8LsgMDt9JgQaXbyZibMpPtTxc0rYNXBaymQh0BTx8AadbEPDQ==
X-Received: by 2002:ac8:5a47:0:b0:4f3:5367:2f67 with SMTP id d75a77b69052e-4ffa759c7e6mr15826891cf.0.1767651694958;
        Mon, 05 Jan 2026 14:21:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6973asm104447e87.74.2026.01.05.14.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 14:21:34 -0800 (PST)
Date: Tue, 6 Jan 2026 00:21:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jinwang Li <jinwang.li@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v3 0/1] Bluetooth: hci_qca: Cleanup on all setup failures
Message-ID: <33fog6pld7q3s5wfc7wariag7wwoct2t3xul746r4tsv6s3nid@5g5bwumtfaz7>
References: <20260105141427.196411-1-jinwang.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105141427.196411-1-jinwang.li@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M89A6iws c=1 sm=1 tr=0 ts=695c3970 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AuiWyYP7F7LszW4zWhEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE5NSBTYWx0ZWRfX74CJdsCYqnvP
 i3jon6+JYPPjfyTqNZvcQOl6YnSBUAr0O2DuK8OrQcGzg9+cpluRIOPkcrm1u2Wmn9cwpQJ57Yy
 ke1CmNqeRoCCnZQTmflNvJEawWAKG1QGpKhlLSg6OS8XgxsnuXPaTidFwwbrBU4QaXCkST/F8El
 2FhcpJW7Owh9UT3JbFSeKx80R3rlKEEhg/HSX/ux02HRmAt0r3A2d2j4ZzoA0V3/eLb4f5YyIsG
 ZrAWR9D8DPCjsIY12UzM5o3Ao+I7J2ujeR1/zQbIZxZKcmom8IYN/6xWB8Fy0aTLZmVL4GoHcLL
 LrO1upnc95NOD9EMKkVovviOHRAvimGIJCqMOj0IKdr11JtC6u6PVfXrih0kZZaNrqZE1GjOTl/
 1CHH+9qQ5mVC2hDcgnLeFOm7qnuRkLCzhQ7VFTjquvb7hpeh94THFLAhD7v8rtL4cRAHjvAJNZ6
 BMfqaedXM9Wq9te8QEA==
X-Proofpoint-ORIG-GUID: 2ZCioPISrSn-ITcpHyd14iFgr-D6w9Ry
X-Proofpoint-GUID: 2ZCioPISrSn-ITcpHyd14iFgr-D6w9Ry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050195

On Mon, Jan 05, 2026 at 10:14:26PM +0800, Jinwang Li wrote:
> The setup process previously combined error handling and retry gating
> under one condition. As a result, the final failed attempt exited
> without performing cleanup.
> 
> Update the failure path to always perform power and port cleanup on
> setup failure, and reopen the port only when retrying.

There is no need to send cover letter for one-patch series. Please
update internal guidelines.

> 
> changes v3:
> - Update git name.
> - Link to v2
>   https://lore.kernel.org/all/20251226102707.3449789-1-jinwang.li@oss.qualcomm.com/
> 
> changes v2:
> - Only reopen the serdev port when retrying.
> - Return on the final failure.
> - Update commit.
> - Link to v1
>   https://lore.kernel.org/all/20251222123824.3000167-1-jinwang.li@oss.qualcomm.com/
> 
> Jinwang Li (1):
>   Bluetooth: hci_qca: Cleanup on all setup failures
> 
>  drivers/bluetooth/hci_qca.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

