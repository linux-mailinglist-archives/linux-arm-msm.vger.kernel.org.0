Return-Path: <linux-arm-msm+bounces-109587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM4/OcYJFGrVJAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:35:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C455C7D26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59C3C3005587
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A55C3E2ABE;
	Mon, 25 May 2026 08:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+vCMvkX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brx304EY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6104332621
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698114; cv=none; b=BRlaLZA75YYkd2xUwC5PA5ROf0fwmW8dePBoy0fMhpptxceCXmR8TJfHWVZAQkO0EavbCQY1ViUmQytrTvTwaujZeB3vyP8atIkiRoVSxrljpaa+cJO3s65vmhhRYqL5Pby2ijfSRV5QPTdmVzNcMOxVIwwVJ9gFcEDW51tufm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698114; c=relaxed/simple;
	bh=Y+3n8jIuDzVA+Lypx5YfLppuC/Bti6Rgo6cllyQC3LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDW+Ryg83ix4uJD0mIMQPyBvMBu6a6Vx3RdG/CF0/RJvSDjXM5y5EoFICBQH8WmgZ60JrlK9qRlXALhVHBn6RQlW5DwXOf2F0ebpxIcHXrDOL0DZZnW7uSFCQleyPimYe5Ukg99Q68vf62LshR3t0n2A+3AUDaIxQ63fdVHQBZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+vCMvkX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brx304EY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7QhZG3063969
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iJzfxaDzkqM6VgHRcfCAXDJC
	gw+Fp/v1dA7ABLX8i0M=; b=J+vCMvkXZ8RlIuuDHkUkVN83mBOcQk/negMfehdE
	4peBdKYMSH9q2I/Ru3Kw1rrRY5coXglEa+GZrP0A8Se+V9WfU7cooT8RdqqZwPo1
	OvKHFQ0+NTx2EeC/hM+mo4XWVvYcgtMYFPAy6MFZ093agRnWkwAO5rmqUAtSNwDQ
	P9oMhMyQ3EqjvD6IfxiSywXoHHLcLttvbV9MSNr2qxSkSYayFO7bJ/jgeZEVZsMU
	HngZP7OsvFO4y2yqCBc+24fdwQV6Ci1BHoLOtkbUjfJeNOpEPognU3U7taEv/NIz
	BBRL/oU7qyJb2MqRiHL2mcdDKziOgVENp1zDENbPKc/Bhw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1gg8vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:35:11 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95ccfd9b58dso13439379241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779698111; x=1780302911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iJzfxaDzkqM6VgHRcfCAXDJCgw+Fp/v1dA7ABLX8i0M=;
        b=brx304EYZxxc4vvKsnnO8j2hZ3snxWQAxFvbr+a6HLmB3FmNwvf1gDeMTAgyAC/6fK
         vMDctTRXcZYQnfXQ004Vy3VPbTUOHx6Uq8yXruPn65IA1uJi7Veg6LLrSzVZXKADT4yt
         K4MRiVTnwaf8iSTTaUOD4IXOS7iQzg5z56ukllNVkWtwLgICFeRFrBQr8NzJSHKvYqFw
         q1uLueUUNjCKWpmtoFKvwP/ESmOuWNEVheiWH0EmA4X0lD/xO5LIas8wbnbglzHSyZD5
         aRjaiUgh9yoqv1QL4E4B5/u6ZvYgPbxy7Rvrcroa1HJs2W4+Y8MzFCk/+IS1GpOTjFI3
         ioZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779698111; x=1780302911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJzfxaDzkqM6VgHRcfCAXDJCgw+Fp/v1dA7ABLX8i0M=;
        b=oTFICcvOa6WEmK1Stu5Irb35AbDR4ScLmzypymMSPPQMMzmz9tPzejmI+7imXZvHZK
         Oz9Yt4RNzG9oVdjqduMwGDeIIjbNLdTBytsIGcti86mamp8swCpz/BGk66WafHpRo8Ec
         NT+/fLj+EpdPxF+oI/Zm2c2Ffckn1F4f8dqELWEo6Ts129+HJrzdhygY7wx98gOEdRgu
         5jPGf4fSBe7cRHv+aA4tnzS5VAqq9ZsiwOUtlfMfJjH44LaFO+ZM15DJk8J4lG/jDyiU
         UjtXMXaxAO1Tj8UCPs7yN5aaoBdikrGc2EteHhcpC3CcZyZhTPy0jWzDJUkXx79O8hlM
         T5yA==
X-Forwarded-Encrypted: i=1; AFNElJ/DW+At/ivNZC0qCDIFMMWy7u05Mk/6ubmSXm8bWstLuFcpCOexzYYQ06o8OzCpMq7YoMrSj49YsADZPgbG@vger.kernel.org
X-Gm-Message-State: AOJu0YxcY/uQjcWA9OoQyL0iSkcJg4B5GCvmvSXB85fTk1uwnjNo3QOR
	yDZSMS93+iLmq1q0Gnooni6QQdWfnDtfETIHA2BBMTSJlcN8ZXSnuNC2qHJdV+dgqqqBe84TAjH
	6qu5ZNvd9xIpvn0wp8Wu3pBxKb3XU+YUuEGtDyxhux6envsNT7XFuGTZMFTFxB1EeuHAr
X-Gm-Gg: Acq92OFZH8O6VPVIeZXt0+ldeuJui9npIZGojwFUFJpKuZynA7jcusYMYSvoYRaRFuH
	zB7TYJW8wvyvMYF+GXvByLsD6nmT8c4HZx5BDE5uY+LSaEddv2QJachakWs7UuXZbFjmDrHcfjy
	xFEMyBHb6klWkb0UrcblWYXhG6Hry5Mq2awU+2/WPusgVETnT0uiFHPh6pAUPe14PYhMFPlisei
	l3JC7jrC+vw7T/2Xyuw+/gsrSndfJOYnFPsYa6qWHGasb1UCdaEh4mD8TN8Err9OwKS7lQclWgQ
	XH7afc43M4qfQLSJxJ4Hx3pGkhggfakdkEh+nhk4+jAaJRXj/arVSc5cqftVKfcKZuZN9VDwA3d
	CcyFBz32yokedvJDhSrd6t0cgjW0ClrrjYACZ1U3/veyGzt7lyT6AGyf64UCfD4n8udaMCATinY
	+OhxDhztX+x6b5Ne3Su3qARVsT+ONYeVI4wRw=
X-Received: by 2002:a05:6102:8651:20b0:697:8b50:5949 with SMTP id ada2fe7eead31-6978b506c71mr626170137.19.1779698111242;
        Mon, 25 May 2026 01:35:11 -0700 (PDT)
X-Received: by 2002:a05:6102:8651:20b0:697:8b50:5949 with SMTP id ada2fe7eead31-6978b506c71mr626166137.19.1779698110912;
        Mon, 25 May 2026 01:35:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cbabd1sm2466936e87.34.2026.05.25.01.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:35:09 -0700 (PDT)
Date: Mon, 25 May 2026 11:35:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] Bluetooth: hci_qca: Use 100 ms SSR delay for rampatch
 and NVM loading
Message-ID: <foqjrfyu7ahktzhpnzv5wgxti6bob5d6rza4tv4mhwdvdokqxa@twdr7hts35b2>
References: <20260525065156.2213123-1-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525065156.2213123-1-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _dwXC3VK_NUh0xLNkErCPuER7fIv_KWE
X-Proofpoint-GUID: _dwXC3VK_NUh0xLNkErCPuER7fIv_KWE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4NiBTYWx0ZWRfX+Ssq+IYFEp2Q
 gNAdNmYHBcTPtgHs1eaJBM2gBMmNdyY/pZVI2ChAnP4+TXLjvUR6VxRyvv5TlpuZZwnPMDseBls
 2nlymq21b1jxy/6q8hcLtu+9wtKhDyKwVjLXevrH1NKxUNhi+rhm1YKW0Lzivk9vjiqH3Pu5Ttb
 Rsoq+rHR+oIHxJvLc9p8GtWVtX5fe3icwDLOMpQUkHhfzMRsMNzhXp3wZw/4Em10f0ytCSmyBg2
 A/bwStORzJyNefQye+TpktwZuA/uMffnbE4dxkFudnmDvpys7qYnUVOnNfrbu4qnRou851C4XcX
 lwxqDzhZOp19L0AeIjxjmb3c/HeAIhC7NF3aNP2Q2Z4n7Y2n/Y8EiVLnjvZpXZw/dXCJRX60wdf
 DskfNj2CDn0B3xiUcOaI0/c5lTf9Xf0qqnc9QmaTk7kf+T1AvLUKJzQ4W5df0zQION4Td5d6vne
 WDmMpFig3/4fltXSc0Q==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a1409bf cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lKc13Z-neGfXDhYO5DoA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250086
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109587-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88C455C7D26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 02:51:56PM +0800, Shuai Zhang wrote:
> When bt_en is pulled high by hardware, the host does not re-download
> the firmware after SSR. The controller loads the rampatch and NVM
> internally.
> 
> On HMT chip, the rampatch is ~264 KB and the NVM is ~9.4 KB. The

What is HMT? Don't use abbreviations which are not known outside of your
company.

> loading process takes approximately 70 ms. The previous 50 ms delay is
> too short, causing the controller to not respond to the reset command
> sent by the host, which leads to BT initialization failure:
> 
>  Bluetooth: hci0: QCA memdump Done, received 458752, total 458752
>  Bluetooth: hci0: mem_dump_status: 2
>  Bluetooth: hci0: Opcode 0x0c03 failed: -110
> 
> Increase the delay to 100 ms, which was confirmed as a safe value by
> the controller, to ensure the controller has finished loading the
> firmware before the host sends commands.
> 
> Steps to reproduce:
> 1. Trigger SSR and wait for SSR to complete:
>    hcitool cmd 0x3f 0c 26
> 2. Run "bluetoothctl power on" and observe that BT fails to start.
> 
> Fixes: fce1a9244a0f ("Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw")
> Cc: stable@vger.kernel.org
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

-- 
With best wishes
Dmitry

