Return-Path: <linux-arm-msm+bounces-109841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIxOGGOjFWohXAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:42:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CC05D6BB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B737301285C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB19B3B9D8C;
	Tue, 26 May 2026 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX67yvdg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="St1MLkVM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0448533FE0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802792; cv=none; b=jy+LHo244FDk9kreXmS88P3bNg/uvSvEnjVryCfZb5CDIa+moLgGcs2z0n51QkWtW3cG5zOeHWLCq6iMCFG83UQy4F62+I8vUfDMthcsgY6qBqD/InIUOSMlA4JsS61BS17mKN+ilda2TxSzOEvb4CLxhJZM6VCueTU44xo6Vjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802792; c=relaxed/simple;
	bh=LKc7E4xyh/YipMFv9PN7qqgfG5S7nb//eEcppSYthyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWpJvB5H0scyEKe+GTWwM6EJOAPuOSMdPjpWndrilTbPTKTLX4fuVsx8suZn1B0+/akRuvVlQi7X8IhbHJFb0K7ZEXCK5jr1N7hApvQZT5i7ZAOErPCV3VOYW5VUZAEFoMAcw87TPv0g9kUI+Emeo4cjipxPIJfOWPybYG+E7Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX67yvdg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=St1MLkVM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsYD41430528
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HYokdGbi02H97EDVnPIo/4aG
	E6yDYmZQWikQTVVIxw4=; b=CX67yvdgBUDc3Y/9wVk5s2x9pcn2DJWoMO8MjsUb
	DNWtkyFvdmRVVrj6hKtEXsRCvR/U91g5gsw7uLkhsLNPOx1jQP9r8FocYh5K/1UE
	QMQ2u8W02Iip9JaZ5qDLqJrE5XhEO1dhQJmdaXSr3u5Y7rTPBOx+Akjo2w0AmEjX
	4GKLuJEP/eSdKWGNiwPlARIayE7euznBQIZ9m4JZvVCg038K+ZnU4PAFoQB0TLog
	Q3cBTQNmGoDTPKofS3WOlMWYgvqw7/p2p3ul/Zyv5pds53j0GccR1DcCO0EcpbfB
	3s7/K7jdX3jrvQETdnZYdmqtqvalPBRl1XlYmDbsqAbLDg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv5952-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:39:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95fd51d5c22so18340277241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779802757; x=1780407557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HYokdGbi02H97EDVnPIo/4aGE6yDYmZQWikQTVVIxw4=;
        b=St1MLkVMfScLVtctRO/lWQWhSd3cfNUegXLFlmyE2mN1IvFMjoG/nioccz8aKqGg0y
         n+DGzC0MS0kvv9XE+AZ1zl7wN7aQPo+Hb8rxVnXKpORNyKZ//wjqhkq5WuhC1uFALYBs
         Mm5+hQn6q6kBpEJZk2xyaxbe50A+MQtWfGLcmJmWKyIawcsh/tTFrxwqRU4DjkE8PA1T
         8dk7b3y5n90uuKgvZuYNeTQKbQvQowFJfLkajlttJPqjZ1BCNpl2PEsUNW7DOHcoKA9E
         kgpN4fQXj7Zbjcbmp1YzjgvgZ729xkm+tgoNhMa3pLK83k5wilEX8qEqCSvf/3g+aPwK
         bHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802757; x=1780407557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYokdGbi02H97EDVnPIo/4aGE6yDYmZQWikQTVVIxw4=;
        b=faMZy1D+AmPSxVejHBdgnGhDivAigg/g0vD2PnTMxJq1sKpdWaz93z6mHibNhf3aSw
         s+uwchmcb2oKbFvYUmslSP349BZb0AzAm23FSAo6XMO/7bG6oFhE/D1zKpJ3H+AOPtij
         PtpgfOz5k0fJNpuQrGQmz7YcMr1wiqfeRIwkkdXJwMuVxyGUlAPqqEhA+v3+P0nPA966
         +ZvLZ+Uo1h9fqaytOhheVpWZz8CJOqVpsUmkjSjAlZ/WXbfi4gByMT0GcsYr58+tXwwm
         YnV6CRIQD/ARJcKrmhyVJgg6VKQ/xeqOBvgyUKhIMqCHY82Grdav98s5pRmJ4uC7f8r2
         7iRw==
X-Forwarded-Encrypted: i=1; AFNElJ/XwdMhNl06lbKMj0SXlQeCxURh5W8tL4thJh+J4CC7B9K67HHxbswn+YamUSvQYzWhFjXZLds55YUEMtfS@vger.kernel.org
X-Gm-Message-State: AOJu0YzisR8tduI+yaQ76q4uIvQD7ET+Xg230KczzVU6SZcF5T3NLyxc
	8IqcOJb0YKnoKHHMT+yRbIkmqU5yekvq+o07eUmVA5GJp7yAsKzawKW399IScl73ZpgBb3CjhbC
	Jh/FGYF1wTYjoeDws2kAGZZVOD8sG7r9yaqo5d2Cc0f7fEOHTk104psEfHlkBdI3OQv+W
X-Gm-Gg: Acq92OEHrMiVCwmcwhDmoFir4vgR3M9DuS7QxDzIXCqCINKNdUJXtFwwOcRX3NxgvnL
	XV9HKT5Vb1YMmByFjxopluZ/Jm6pUgPAsxSmEnLw88f1Vv8nO4ZBTvoVnvPe/VZKUXVYWbb+hsq
	dB22ZRI5xW7nJEaAZHuu+fAskeDkUBP1hSYaVfFw3EuoqJS4ocnFGUXdNZncTItemsJL/MdtcsN
	EqIPYbg285Cnec48jaYdhhqI2v7dw++L6zBBikb+USm/buTUZSMQ+12VCiu3RCjKGHouiCGv3p+
	Dfroc19rqEAehng8+6GCRjdcZxO2bFShq8j70bwAo9GZLn3gwERbVVYPVeB2TDLQ/DvKaR8O3S+
	lJrWkwofkZSJCgRt2qCRpPZik0mGpEI0lwrviHNftnApngLb0F5OrEjADVvprw44Rsr7qoHcjnV
	FXUiljrTH9QmLAReRLr3mPfjzvjrC4A6i5m90=
X-Received: by 2002:a05:6102:b0c:b0:635:420c:9b00 with SMTP id ada2fe7eead31-67c7300c912mr9734165137.10.1779802757134;
        Tue, 26 May 2026 06:39:17 -0700 (PDT)
X-Received: by 2002:a05:6102:b0c:b0:635:420c:9b00 with SMTP id ada2fe7eead31-67c7300c912mr9734129137.10.1779802756554;
        Tue, 26 May 2026 06:39:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca7bcddsm28672771fa.16.2026.05.26.06.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:39:15 -0700 (PDT)
Date: Tue, 26 May 2026 16:39:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: Add support for the USB3 DP
 PHY reset
Message-ID: <hxrwzxhsp7j325m4eqslcgprfzcake52kr7kbae25u2oxucfpe@urnoctzbiwos>
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExOCBTYWx0ZWRfXxou7yoWNVDqn
 VhPp27etpX4xW2WUOaT50QJx/eAvQsITwZdLtqGgLFGViNEH9ZV6GyC8cKFbiiPSAK/fCACjU7h
 PFBckmYan2kSI7yGeiFVQBiF6HsnkRkvP+lxv4tozcXKAAA0oWyhaMzPCsM++/pc1hJgJD7fZ65
 WRtyvWaRMOPeXmnab4ixtAUzr6gykrqFeJ/nkY1zf/QNJBf5zg2WyK4Jf1oNGSQ+UMTAb1vPl24
 6hZpiOM5L64rc/R/pmwJYEaTGbceUOAX5j9vntQptsb8g6/BUYHQZOmAgeaTD4GFv9xJU2d5ACW
 scjUbWv3vwyTwq/qM/Nx7uy3ivItz4q3dB1vbEGRzCeSX5GEkRGbg1IZ7S4zW1ghit6NSv1zW8V
 rfRUPf6ayNxj9zoIAVsOTGfN/n/3tJVJi6OqG3pXQqAhVIree3JL6rzdpcfS3WlcDN+bwAsGkUs
 /AJiT3Azkt74nQGBYpA==
X-Proofpoint-GUID: EUxjXrHeitb3DjJd_lJI0lU2dOsqh8uA
X-Proofpoint-ORIG-GUID: EUxjXrHeitb3DjJd_lJI0lU2dOsqh8uA
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a15a286 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5L6ES0iTLAyjbOlHcnEA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260118
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109841-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63CC05D6BB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 06:24:45PM +0530, Imran Shaik wrote:
> Add GCC USB3 DP PHY reset support for Qualcomm Shikra SoC.

Why was it not a part of the original submission?

For the change itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-shikra.c | 1 +
>  1 file changed, 1 insertion(+)

-- 
With best wishes
Dmitry

