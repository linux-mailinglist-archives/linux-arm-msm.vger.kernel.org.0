Return-Path: <linux-arm-msm+bounces-91338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFQ6DwkzfWntQgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 23:39:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D5099BF2A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 23:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04DFF30041FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 22:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59DB38A71E;
	Fri, 30 Jan 2026 22:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KaSLF/93";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGXiBpIx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFB138A732
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 22:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769812742; cv=none; b=H/7/IalPt5zFWHbQivtluJLOWCcX1xX9CAQMCDVx+N3tZmHv6v8+SL43f1rULLda9TzurS4IPzTGdhQdsPmPjZUgt1ZzvSs0Jd2nd0l/PsKrqTkMqFYIZ2cdvicZzTHPW3L1zcFQs0RNXu7vxYX2qwmOR711Tz4FUICecRPRVQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769812742; c=relaxed/simple;
	bh=aEpkdzaw+QsOdopyxUTcxGofpnjOUlbZXZ2nukqu9WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A95/+Cshp52j9ZClTCMmWlRuD9KoxtbCTeIOQQzft/l7dZL/UkTEzwWCWv62Wex4H4nlgY8dPOjTtplaPNd+YCsM+6zKfc1zufp35tXl5dqrb2p7ijF74RoYb4FTx4fEB8Zu+yZ8ZUdwEZ3BQbN/okv/ZmvT1XTNNCtzH6VkkNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KaSLF/93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGXiBpIx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UKMvVq3042688
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 22:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=epBBXCbIvXIY/ucim1KjtcUq
	CxZn1kZ7yDcawfqvDxM=; b=KaSLF/93P7M53l4MOzib16sMiYxtEcJeU09p+XrC
	1hiZm6IBYYvf4JAm3pnwBDkGYNXxxyiiXRbFLhgjwOKOkJPWtb9X5eFM3G+KAcdE
	FlGr8L5osXega6D6IvubY4HmweeNT3y6hHEcnsV4m1Kp/1HQFBJdr4TK83kiWmyz
	O/w0Y/SBjXQWLI6y7wGbM4eHiXS99oxCFGnu/R1aglxW5E3UVkLyJcWFZPvgNHGR
	LJhDz6q4Pi5EfCsC78EVd+X4ur2ynvjThhoCJQA+W9leG2x7RxccGaTuwgmEvJkJ
	pvNzArRkP4qPo+x0qTQn5aGr99pPWQIxgN39gQRK1o7wsw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1332gex7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 22:39:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b708fa4093so480764eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 14:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769812740; x=1770417540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=epBBXCbIvXIY/ucim1KjtcUqCxZn1kZ7yDcawfqvDxM=;
        b=eGXiBpIxchtl+hUEbk+ybdc8XPVRmaYNqUP/K/z/l9I6mHVv8GwxiM26J7x7or+9IQ
         S6+Ly9FgvDKfnOj1tbzZw+ABFaF2f0yEvkw/RC2KjmQsEy6dEDNnPLDqIOYVxeKSA3Id
         eVhpZP3skIBLMI3+iCqmLReXiuR/ntQWj5MI2Rt7we/y/r+QT9rpwFwtHjDUQeiiqP8k
         saa8gFLRGBenRxtmFsO10RrhvmkFl7/eHKJF267jmJVv+UWJUzJI/zzc1tvJHev0QDWD
         HM7O+dSjj252sj3lzVMQY7cMBhlmB2WXm8gi/sRj4wnSNIL+Yldnb5xhxKffNw3ZU452
         vZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769812740; x=1770417540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epBBXCbIvXIY/ucim1KjtcUqCxZn1kZ7yDcawfqvDxM=;
        b=N46ZLtXdlRyeJqusIW8R/zm/ax1GK0y1XDhB7f1EdYe4BFNwR5y5yLFgjBlAHmGbOc
         3tky5w7xNSfyV5CJvIuHVJhilqd/Y/ADSUZ+35XIRejiCU7kD0S8hJPF1jFXFBONxnrP
         VcFqwK9kByu7RS/JEedYp1JWUQC4+M47x+P2OvvE3pTUUbo9hzNvDrfNpcYsuIdJy7y8
         LtVK0rByMoiQyV9aVl/KRGcKdfxAsgcxS1Wz6zeTLemeBdDcR9Z8r2pfOWKLRpNmewH/
         N26AESrOj4LdQfHUqEgc83iNoBRJAtSx1tbjrr5gOKs1sp00jYi9XKkLn6JZftvKgYLZ
         BOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGcW3H4XHVkeq2XtLJuBjMkmfd9iLdNgN65JY0x/iafIhQuXyq4ZXlZuN1PgUascsZcvycisDBEBSe91Yk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+LP9X2J3CKqN7IAfWXZ848hvLRbiMWJswL3IJNh1Z3whLdmZ
	uS6Fvh/ExZJKcKLRsxKW5OKjIrRPZeEJ44NaVkdSFJ6O/a0E2lpkBMJiyuZwgRD2LckUvGiCpFs
	nfiEk/UlXDe8NyAmQAWkqJwfuQBQUpD5tsAl+T/DlW+YBPgQGYcdo3camUqxKN13ZXnJL
X-Gm-Gg: AZuq6aLAv33eL3jGdVFtxfeAryOF5dimrjLH4ZMJ5Nf+Bf2VxXp9UGlmtBsHUc3QOfL
	nQatN6FmWZ0vnBa7sP2nj9muh1geAHWcXwG0WO6GMWsdLtie8XP1oTqyvxd9Cn/9CIKok5fueD8
	v8mWG7jrknv7mRKKqHZKwgQWT1iJFigpHrb9ZKTw0paWXsGaEjW2SW2uo2g2tYyOjvSv60M5lkk
	2pSLYQoF0l16zo1Uk6kkJFs21US4t4tBfkzHAlcbUQDDBbEHRWuCx09ukVVVeZegKdO/wT/NyQf
	+Tn5ZHiUqTT/mbMVGEp8NGSagtI6ni/W4u90UyqsgeTqsh9ODYgzCsXpCOyt9daU7qULtUbS8U6
	Zsj8qtBpZEyc5kSYd89ZD2hPUu+bBkJw8+kJ/5ah+h7XAybJ968vFXRUv
X-Received: by 2002:a05:7300:a903:b0:2b7:15bf:91d1 with SMTP id 5a478bee46e88-2b7c890fc64mr2840094eec.30.1769812739930;
        Fri, 30 Jan 2026 14:38:59 -0800 (PST)
X-Received: by 2002:a05:7300:a903:b0:2b7:15bf:91d1 with SMTP id 5a478bee46e88-2b7c890fc64mr2840078eec.30.1769812739347;
        Fri, 30 Jan 2026 14:38:59 -0800 (PST)
Received: from hu-jackp-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe714sm12977854eec.20.2026.01.30.14.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 14:38:58 -0800 (PST)
Date: Fri, 30 Jan 2026 14:38:57 -0800
From: Jack Pham <jack.pham@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH RFT 3/3] arm64: dts: qcom: glymur-crd: Enable USB support
Message-ID: <aX0zAXwZVr6qRLrC@hu-jackp-lv.qualcomm.com>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-3-98d6d387df01@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-dts-qcom-glymur-add-usb-support-v1-3-98d6d387df01@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V8dwEOni c=1 sm=1 tr=0 ts=697d3304 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DlwQrn3afoSJOZwP7sIA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: _5PifgysyGWg3fJeeN_mCQSxIXGAJgkl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE4NiBTYWx0ZWRfX2UdFgrRfQkco
 CkJ5kRp2Z429wkKzyXqlZMEkCYslQIIbvoqSI5s0rW0S++Rc3r/gElaRk3N2TH+sdgB6N0n3j4L
 U+1j0xDL2jhAb1SiDzrYuZzZQb6G3gujsrbJlkRbkr/Kpbxe4eNQOPsC1Cz0mhIDxqOgxk74sFT
 PYwyo9dlI0YLXmFKCe2g/R/XsTEOXcCvpkbF8NSTSA63y0B1ZlV4bjIJJX/pZHED1jOySx7B5Hi
 xhEHvi3bnjJElqfIyxQTu8mFkGxM29OjmHK5dN9aw9JMMq5rFwZw2uGPlmlhRcVbfkl2QrNWwh8
 gQK1He/HLt3ZKx9mWUc+mvg/Hi8EugmkBVkzXmop+m01o15i88+bhzsbMS/lWNOUFfOXzLeBACk
 hbqvjTGnl/CRo35HMFwq69Im/gWHslpEUWJ0Cd+fgOq0xKgZOuCUSULa3cFosJ0lfVdTTGtE+If
 WcbCmMvCruw/OxZ30lg==
X-Proofpoint-GUID: _5PifgysyGWg3fJeeN_mCQSxIXGAJgkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300186
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91338-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack.pham@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5099BF2A8
X-Rspamd-Action: no action

On Tue, Jan 13, 2026 at 02:33:06PM +0200, Abel Vesa wrote:
> The Qualcomm Glymur Compute Reference Device comes with 3 Type-C ports,
> one USB Type-A, and a fingerprint reader connected over USB. Each of these
> 3 Type-C ports are connected to one of the USB combo PHYs and one of the
> M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
> via one of the M31 eUSB2 PHYs and one combo PHY. The fingerprint reader
                                        ^^^^^^^^^
Small nit, this should be USB3 UNI PHY.

> is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
> eUSB2 to USB 2.0 repeaters, which are either part of SMB2360 PMICs or

s/SMB2360/SMB2370/, as corroborated below in the patch.

Thanks,
Jack

