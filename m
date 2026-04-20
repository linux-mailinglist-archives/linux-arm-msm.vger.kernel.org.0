Return-Path: <linux-arm-msm+bounces-103824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAjOLNNm5mmJvwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:48:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BA94321AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11D87302CD37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA473A7822;
	Mon, 20 Apr 2026 17:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNIz6hdk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/Af4/0p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE481385509
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707254; cv=none; b=eqb39GoPuWv6oI2ilGmuXDlhXhQsyqZuQxWEVq+0GirSvxkTHXIaMVqULT2u0OiovvP2Wlnry4Y6jEm/4tLo06XUeIM49R85HFa4FYCoAHOU2o3ap8vhqOyluc4atBFREuLHJvKoeWFGMKMuDYMWOuKwxh+/A7ApMnSSe4usTE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707254; c=relaxed/simple;
	bh=Kx9n3XoxEb+C2eGxfAW5ADUZqnIXKow7DegyLtDquO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dut+39NtDhNLmIjRrIWQdFMWDp5Mjjg0RyAIDQdLiW1fPZuJmLLtuWcY/vv96Fg0HRAqdkMVSp/OrGb5cd4eMboNhH2LrjlRA5h05J0/TotrHzVX3pdqYs88IpMOtfghTCE47jqPdsT/7D8tX6N84OzpgJtLDDDRyWetcZ2C1kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNIz6hdk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/Af4/0p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBWkTQ3212140
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QIAE27S4JIeRv4JiqJVx+ebt
	OvkF7hDqjRG8Zy0XUyg=; b=UNIz6hdkA2+qJFn63obwviJOwG6cF6ZvGU/dfVf8
	YddIJQAeskjcpTZEfzhdiDdAuC2ty3lXXpmAZyoLucu5Q3wWtSy3bft7YSZ4ZecV
	BMfk3LTVt8H+taJN2lTMBAMjlB6UqY5UXwNjgpkLM+fCP7Qrfa84AkHxuKbmx/Me
	ZsdFe6iihC3Rzy5j99ontQTUhUMfU0jSw6K5/PFFSMPa/cvoorvKyoQrdeij+/nL
	u172lj/w0VNV/15SIljakdb7nnFcjA0aIb00kx5e35jhQAMWi93S0nP/V/ZvVvH4
	WtN+GHONwcLzv2x1kpEDbKOssEox6F9qYoux9zs0+CHV0Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfjmv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:47:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faf1ecd1dso10509831cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776707251; x=1777312051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QIAE27S4JIeRv4JiqJVx+ebtOvkF7hDqjRG8Zy0XUyg=;
        b=J/Af4/0pfhGWkJ9nVhe4l/svOTspSv5uRY2qTKvyNSDzm+TttuqCbWjGjGpZ3DUkaU
         YFiT5FYz60FuRR1eo1Lo5qFcD8DQ40pIQqBaY6F3hEKKAZp+Q9duo5YA346h0i6AbWWC
         GJJsAqu/sanTjUI569REVDRpHBHTV1M/g4KSLpzvhLnb1trHmMe3UOPtRHbIxixEF6sE
         KOlrWzfgXn4TbjeMkuf/dzWNALqQRZuDehl+HvBwPaXISgUIawB9d5z6LAJX49X0Y5S2
         GBgxGuibRej2zI9oTLldPrstuJhPi6DyneZkeQgAHDSovQyxeEMbNXLCeqbHpIMXVrYm
         nHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776707251; x=1777312051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIAE27S4JIeRv4JiqJVx+ebtOvkF7hDqjRG8Zy0XUyg=;
        b=s46DA9bcObjTELp26LlYeYOhdE+8cPepSZhy0RqblBCGw3nbxK76OuxIc7bu17ylmc
         LQ7rKVI730iwKsSsv4EMpw43zJbeKvHAei1tgktS/YGcEEXCpRYR7zqY8vXAK27kyLH9
         R0aC4bFYU8/CgJmoMZRxdOOV2NGTePdBWjYxYLIuwOR2jMNLaKL0UalqI6R2HCS5iuVA
         jT3HqbFzU86jQBx1duKEsWUO9mSRtDTala0gU4i+4ZK3uKRVpzEo9yaYnnbwz7Q+Hczu
         8gn8kxT8nQYtHN9Y+AHwR+cR3Syh9gAkiZd3PMzKaMDdVwSr/AriD2iU5DMBpBi9jJn4
         mGow==
X-Forwarded-Encrypted: i=1; AFNElJ/qth80vQlCKfkGN6M5X35u7mu0dKal2w9zgDr9KnFvvn71QfmR8miWQUdz2vs8atoE5rI+6GSvi3MtpKxo@vger.kernel.org
X-Gm-Message-State: AOJu0YwN25Tbxn81S3aV+iA6krXQQNvgMJyM7/3w5t7s4wNSIAEr5AeE
	0xcKArBIlBa9NIbGU69V37Q5MWbqVBAmXOmXqFbtCnMVh2BKz9tvPm6F4s0m2qToNFr92yy/LIV
	7s96vjKc75I6sfBOznjVXhG6/ngbQTgjhH5cST5sBpuTZRTsKfUTynzohF4q5UerukA/h
X-Gm-Gg: AeBDiesHtTmd6hwuMEtT2N7oQJ583s9nyDZNTi914TNg5ERrXv5NtVv25GzYy17yM6L
	D9n+NSBQ5AXGUEL3QQoPolNY+H3xS1k2ANrtN2gg9gtJFOAN3GzDLg1Zv1RPkCwOZawbpQaV0Xj
	DzbQeCwa+QVP3PaMXm+R1zGWDP7aPEeckHC3j87oGPjbPCBGz3C2ScpVDvdP6jHX0Ri6jGydQEx
	WujhW1hmJe4JxJZTAehuZRuh94LnXCeA2mR6uamEc4GUZcI9ER8w8ZeZbpwVQLtOssWNyPdkAkw
	JA1TlaURvfm6jEB+ZdiSWVb7kPlKKFk0dd3Ezyf7A3W5+RwHa0xWrdMpck+kWfGyoOtQEq0jpDN
	8IjzG75bggkmzd1zr3T86IUNv+kX662DocogqmmUgvs6inszj0xyFRQyNv1MIFcA/f9M064Lj5+
	72nJIX861npnO+jJEFULtbl0Dxx5yl1uZ9OBq+t0CsgTH0wg==
X-Received: by 2002:a05:622a:1647:b0:50e:6165:11e5 with SMTP id d75a77b69052e-50e6165143emr51086631cf.2.1776707251232;
        Mon, 20 Apr 2026 10:47:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1647:b0:50e:6165:11e5 with SMTP id d75a77b69052e-50e6165143emr51086131cf.2.1776707250766;
        Mon, 20 Apr 2026 10:47:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebfd6sm3058993e87.78.2026.04.20.10.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:47:29 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:47:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 13/13] arm64: defconfig: Enable Qualcomm CESTA Resource
 Manager
Message-ID: <vvvvrh6vmgd2g2m64hae42xlc5e4lbfjkwjsq72geyhwckelxr@3n25nm7ultzo>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420172803.4124418-1-jagadeesh.kona@oss.qualcomm.com>
 <20260420172803.4124418-2-jagadeesh.kona@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420172803.4124418-2-jagadeesh.kona@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3MiBTYWx0ZWRfX6yogl95moO+a
 Y3h9oy25tt3yxwcrX+37hO1zBWEae6oJVxY1zZBhg95RHTFstpAQL58PIL5ZVsmlyWSJq/pdb+7
 A3rwGpZh4yEkkFlExyabcOsOMCofuqb3dN5w/b5vCe4a63F98z6YwUARVNjA0b9X7G2r4pFzf+k
 40SGnyICSQT9XHtZrEsuSD8rLnIJoguF1HDrMcDvbAGiDu1RFPey6Em+6OJlHAf/VKS+k+muZbY
 qOjACNswovAtQ5moeVBJ4QYEWihUHpJe/1UqFFHKXz5FXvbswGvLDbrbm0VajovIWg9zO8ra9g5
 Tk8jvgOSOTab6b/Nus2BZEYIoW+qM7VDWTNQbrhbx80oV76tXDtHLNPhvqbZFSP4jw5V2ONlVlE
 FmG+SpUf4X2PmcUiH6DPUJcbJ1yx38fLPxnm0faAwDQM9SP+X3E3seNDH4zwI4++Ckquviyrelo
 ws3Rvu3BtQWBUSWj3zw==
X-Proofpoint-ORIG-GUID: vqMSczMA7PXS3C9DgfaebWDcQQyXnlz_
X-Proofpoint-GUID: vqMSczMA7PXS3C9DgfaebWDcQQyXnlz_
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e666b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=yNzVkroMKOiLu5OKkJsA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200172
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103824-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77BA94321AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 10:58:03PM +0530, Jagadeesh Kona wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> CESTA Resource manager/CRM is used for local and/or global
> resource voting on Qualcomm SoCs. Enable as built-in.

Which SoCs? Which devices is it going to be used for? Why is it a
built-in rather than a module?

> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index dd1ac01ee29b..94d226693004 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1658,6 +1658,7 @@ CONFIG_MTK_PMIC_WRAP=y
>  CONFIG_MTK_SVS=m
>  CONFIG_QCOM_AOSS_QMP=y
>  CONFIG_QCOM_COMMAND_DB=y
> +CONFIG_QCOM_CRM=y
>  CONFIG_QCOM_GENI_SE=y
>  CONFIG_QCOM_LLCC=m
>  CONFIG_QCOM_OCMEM=m
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

