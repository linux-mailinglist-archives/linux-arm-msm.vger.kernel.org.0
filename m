Return-Path: <linux-arm-msm+bounces-97916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFAvHR3jt2mzWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:01:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F112298686
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFC4D3039CBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B4A39022A;
	Mon, 16 Mar 2026 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lslEvEWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSoiwFbQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6973E20C490
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658604; cv=none; b=lMGyLSHksht7BlfKYrwXm/53SIHW+sRUoYyy3dBca6cH41CL+B3Nt49Qdix1eDhEQSXdxaHKJOpuYwsIdmrGaQKyOkyLc2y4dBPsFozBXqx7EaGz28DiVkPnssuN5ytenA71xcc04Sgnw8gNK9RKEEf4AfRxDLbP17qixn0MwVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658604; c=relaxed/simple;
	bh=ACwzMbmF9TQsZDiTKYUrOcjxzub0mvW2bqEAulbcY6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQPvITgFYnszvu7Zx179RPntOfHDrTf/XdlzsS2nqD56cFEScIys+H5uuVSmJ2iqXUaGJ2C4c/Ke3wA6k95qqxoBKNeJqAxgrI1kL5nQguU28X9+gBs5zz6olYggZ8f2j8FhzQEe7q7loG4LDO5eqenEqU/AmWHfg48lo2yKA+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lslEvEWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSoiwFbQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64aIN1066807
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXtNx8YBXyh0ulArQuEFaFKF9zsreL9yF0cLXh3jd4M=; b=lslEvEWpd4R6zosq
	5y8jPCw9UTm2ZGcfNVjoXFpPj4efJT3pbjnuJZY4ZGiGFur1kPRKj/1ANrODM5G/
	6BKwnZH9GUdEThch16Ux8kDzDBzCtrrecWwRZF2mfRuJspPEm83UH8giTw4Y1+9H
	5+3PVCl+6PClQxJ9Z9/F2F93R5wbmUz78mMxxPLlhJE/Edw4eVBcRtb6k8xvWENA
	XKPXAcRM2veWlKNXWbHl/NNFNi2X4fuyHi53Oq2H2dqZHkkSiEH3B9cvrikay/Sd
	wzRuIvY8fhBPNegTZ99zN2PPdL901ujGiIIhOkJSzG+l6SJeTSaJ4uaaMuXxUO10
	D72Orw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw027dc5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:56:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c737ced4036so2683048a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773658601; x=1774263401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXtNx8YBXyh0ulArQuEFaFKF9zsreL9yF0cLXh3jd4M=;
        b=ZSoiwFbQtMyICanO2M9h5L3NxGlQUMLmc5oqFDr+NJa0/iWmKtQi3T/c79ztomKOXH
         a0wdQ+2D+BLD3mKnHg4/21/HrrkLPsPFupbyMINfbbLG1930ueX0cpm0I/xazu3EmpCx
         wdNurU+0baycb2VLzkJm2cqgP7XUTFHmEEri2Z005NZrcjaD+R61SLg330nWohGOm19L
         uG18FcMu9xi5ogmvsvdlv7RpoztcqqhSb9vqlSSi5qCsqXPPQ5ZwjUcM535IvMZ3LJkN
         9BPTmgBAzCLUPbIaGgnKIbv+IjtpxTIAiKHSbTC+4k+dQhaiIjQINHSJL/fEyC1Dda4Q
         ka0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658601; x=1774263401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXtNx8YBXyh0ulArQuEFaFKF9zsreL9yF0cLXh3jd4M=;
        b=e2yz02oZSIFZcNQzTCWTKuQQsXjZZUGDigI7fR01oNdKVTj+H/CY8c2udIpWJH2ANp
         ypaTnjKxk7zMCerx5tTYB+8zz2OJL5j0l1RUYjDG6n2ateeRK/udIPJkYeL6qnlN8x7C
         MA4CPUOcEKhFIiP54TpaFQtWr7wTT+UVoGumf9oErjgt5AyOU/C5oRKlvfsecAJygDhX
         plUjQ4RPaevuaIwCzyDJO7oXIFnCe0CupFXjFhHCMRd7nyQWkHwgsDAs5VbMhWDKiM/r
         jc06MABri5qN06VxOMAxyItA7Sv7fynB3h0P5G5m2k+OwhfG4EwART66IgnkfZ+QDvvE
         mSlw==
X-Gm-Message-State: AOJu0YxUXIQz60DPmLTDlX7ZYC9RDjNqaTwRhibiMqhlqpGKQUn39QIj
	23h/JHeBBUg1D368hUhsCECNlV8gNDvcEgep3WIfVuW+sEMz6hZJR5UCL8W/A7GvdSoHuQvauh3
	uq9qhUD4bxkPKwzgmCdhcUY2WZOzS/XP9BiCK0A+YJOCAj6VzspGKvrVdDlYHuAoGnxBk
X-Gm-Gg: ATEYQzz6Ulyw+4vWfs9ASJwDnoftHYJw7br9veGshtBlulh4JX/efb3yf6piBSyEbSo
	Hf/TpswW4VFJJAbQHVTmECtGGWIX0o0nadPvw1kfPKZBxc5BtQe2fDv+tNGgy0rJJNt+N9uNydI
	npLQewW+TZ0f0ZcfpnjRk5EZRLf8UQtpNIMJj/f5iEMHPjtf/KalALlpwAYKZsja2iqhkaZtqK8
	PrMgBg1rSC0drOrhi3MVp2gvFWDd1MXk7ifA/jlvI5L9HONDYrrk+cxLGTBzgkNe3ciJZ5FHJBI
	L95gD3ZGWlO71YM+x59jv313DZb8ztMx98eZgCk7/iFqHaGeMs2kzqvIKx760iLC1LFL/RmUqXc
	zAhH89Zji2Mid78k5Q1FhBdELVpabDfiqO5KsqqXhpDw/bKts
X-Received: by 2002:a05:6a00:6d4d:b0:81f:9f14:ecc8 with SMTP id d2e1a72fcca58-82a19867210mr9781141b3a.27.1773658601563;
        Mon, 16 Mar 2026 03:56:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:6d4d:b0:81f:9f14:ecc8 with SMTP id d2e1a72fcca58-82a19867210mr9781131b3a.27.1773658601120;
        Mon, 16 Mar 2026 03:56:41 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0738422esm13364201b3a.55.2026.03.16.03.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:56:40 -0700 (PDT)
Message-ID: <db4fe4ee-7135-486b-bc9e-efa0777e7c20@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:25:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-sm8350: use depend on instead of
 select
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313111018.130068-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260313111018.130068-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o8bUR85zCIUshpZ1wldVVdq7lvPUiD5R
X-Proofpoint-ORIG-GUID: o8bUR85zCIUshpZ1wldVVdq7lvPUiD5R
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b7e1ea cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OVT0ipcL2cxU2LnCDtEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX3ofpcpukXW1T
 Irfx05bXR5llXVBZGzMX3tlbxN/igv8lznj4BTGs8mAd4iGlNMUI/QOBLz/EFozwDyH4gGhIJhV
 4VGKxnn9fZWeu2EhHCZhX9bLpC84k3eTvebj3IeJ58m9a5G+IX8v/55hlqljL+kmLE/IhX7RD+I
 zZETPhsk5rzJb83HsNWjnn8CGjy8wHQfdJvpXK5lUDRzBHRE3PS1IXVqDoHgySL+AvewaClPTSW
 5iFYPq7YQ1md9crUKPRbOeMVT+sfNWxerwB/bdEWiF2xiV3VZOHx9JPOFfjkudLfnfxi/VSxseX
 inPTopbNjKzmpc0e5wgQmtN4H2zwRxqlMVOg5pMqPLtvfYSph4oHXto1sjPm+C+IseshxLaJvDm
 956ioIrmKGJpoxL5HCbCEUOamdH6m8EqVltp9sF0SwqWuO1DX7QgB8iM0LQuTGsxpuA6W6OtrSw
 fyBumMbL+8DjXzYGzvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-97916-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F112298686
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 13-03-2026 04:40 pm, Pengyu Luo wrote:
> Both sm8350 and sc8280xp use this, on sc8280xp, this would select
> gcc-sm8350, we don't neet it on sc8280xp. use depend on to fix it.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>   drivers/clk/qcom/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 


Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

