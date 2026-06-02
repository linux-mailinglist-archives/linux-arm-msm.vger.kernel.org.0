Return-Path: <linux-arm-msm+bounces-110711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFNDDRVmHmrCiwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:11:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE19628731
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E3A2307A054
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 05:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B138A2F5321;
	Tue,  2 Jun 2026 05:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xymd8kNc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B47BR8b3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F6A2DA759
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 05:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780377000; cv=none; b=r3eckzo1DxCQRy7r226mszcme1M5AdC7HFYubol2L2jMoSTn24u9wS+zJDlgT6gkcTPagg61JfARbyOhK0djqpaHyp1AAPVLoziJ8VDScCx1dVhxu9ANAep2pcrNUB3v0x2YvkbfQCU0lVZD3keYLmJa+I4Zb66VFsy2kg+/CZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780377000; c=relaxed/simple;
	bh=lUZ0yxw0K9cFDd8RwWixgRi3GecTBZHFRsBOtXVGEts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fmolv/64ULniKQlLiGERUUIOE72lDEQ0Zyz6OlQV9Mn43xhnUdj1A2077v4xcYnVrqUvaP7iNB54SQ9TQoh0MPNp2S+0vELQiC8Ec2Cze8XQRiMNhisJU9RKtK7Oagr+OKffIEEPJKxEFUd8WWc62icvdd+dTBTjNe1Nb/WZQBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xymd8kNc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B47BR8b3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6521885h334617
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 05:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gwWS+yzTNGK7wPQGaAYmhFsF2LOzNHchl/pnT8WMOUg=; b=Xymd8kNcXIirpa8Z
	DSr4UYLKhMAOmmDjrSfgrDWIRc+7wF1tYjbIVPA18basxQlTL3pe5g/OghBexEHD
	5dGXkkhs8j2x7SZJ15F6w4489m4Poo4uauK9PK9DOMeqpwpIqDqVUmOUlWqcpJFM
	kwmfdY2Sw7lErQagRZbekhwB3BD5weLdTdcEVD4oAIztlY6MubG7aZNBZAvg2RjE
	qRKhGHPZWJwyTX8Wiu4WTzLgmXfBRvXfs6gMgcKyLto8ar2StpiNXfFer/o+FnRR
	/77BAfYsX3RYBve39s4LWfTZq10BhvovfeR8+3P/P4bXikxpldrrLI2NErgi8CwS
	WLxOZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh8tfv52t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 05:09:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1dece2ecso44224225ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 22:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780376997; x=1780981797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gwWS+yzTNGK7wPQGaAYmhFsF2LOzNHchl/pnT8WMOUg=;
        b=B47BR8b3bzusvyiptWUSKvBeDfUd+Y804/stK6JgZ6bg6R48L2JDI8baKOr4CTuD2x
         66EuzETcpnPvIkZrhFCx/5yV1E4fFvlIKHThnap5nOAbg77wcuxzCzawIJzTzyUPGj6w
         SEI2fBMT48/w0EJrdhlP9S33m4H7BZNNRNbHWj8dE3rIfuC9CV3R35zUUfFsDOuAq531
         lQop6m4qtUklQtftMvtickHz/K6E1J7j1B0urbrxC4qG/m8r4GvGhFEPUu2+1R3DOn3b
         dXYozR7sgergo9QjcPhGI0xF7WWhRDFpqcJu3lKUfVWdS3ip2VoTdz5Gzrbnq9z6WZVK
         3Tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376997; x=1780981797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwWS+yzTNGK7wPQGaAYmhFsF2LOzNHchl/pnT8WMOUg=;
        b=roSWzvlKVmjM2LQdAhT7ciOwvJBPionF0vdK9g7pSpVTbbIF6WAnQ/7wy3ertE8YPY
         1XyW0mQUS/N1OvVNh1PH9DEU+BV42dyKleOENlz4TWW12lBOf2GB4tYUnj7eWlLXcDvu
         cgePtD+t9tns+MH63NWTl/FtzVbdOmrgm4/rRwRU8YX57uakTY044q09oN3e9M33YCyy
         x2pdpF8iz+d0Hubzi9Bfpiq2fgmgsUd7lCLfvmEbensGpRj3dk26Giq1qm0+nu02G1t/
         gfyeo65qqvfynIqOiDKPbRw4JfHeSIrMF08NnFCC8dqUJtSFOEnFISAERQnJk49p469q
         1kTw==
X-Gm-Message-State: AOJu0Ywgwx+/j0uhU505j4RV4Twl2mtOH30iJgYCxGMIS/H1B5PQqbj7
	mtTzLztYLji+Aplhw7BvKqrNZ38cBbbqbEQshZkgHdhwptKwicBceBUi9PjNAaiRViCUVuelSd+
	vi0OWSAi+rAF+ZR8O59+Gfo9I0qAnrR9rSkB74TW555bbgPCfWKFPdEz4rsMmqilF8Fso
X-Gm-Gg: Acq92OF/t3Q7CwaeFW8uTZgW29yfiIpKk+CLzhGMzV6ng0XJzYGsAftF3JpKWqE9qxS
	WxpC6AmkY7Q5GaFYWOHQu65wCi3IHlsL/zgKNrYift+AfqAeVm/x26LxSEgp6PtMfEHyowIQFU+
	XR+ozOiJAsPZjOejEacuHdnMM3jTQ84A5HtSy8rfR0ERmXc+JgAZMS8CqjXGo1NnYSylFHldS9w
	4ViWnoDNCRVxML8L0oU2Q59mij54uhxhcsrCgF8Gi1en7m9TDGBZgSNVrwjP/ra/PZ+AJquf61T
	/DLhiJHiDZpiFbYjAM9AJkoJa9GG0/6a+3BkZ66+ttLaBkcROfPwI/JN3/4xfwsSKZcajqpiEul
	daD6MfA4BefO40lLiL73QisjLqen8Zog6vAAxQazUHfbNcGKmlTc/KtvQP/DDJMBy0hbyCz8PSQ
	sQ
X-Received: by 2002:a17:902:e88c:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2bf3687d396mr167800445ad.35.1780376997441;
        Mon, 01 Jun 2026 22:09:57 -0700 (PDT)
X-Received: by 2002:a17:902:e88c:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2bf3687d396mr167800155ad.35.1780376996973;
        Mon, 01 Jun 2026 22:09:56 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd6edsm149314295ad.18.2026.06.01.22.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 22:09:56 -0700 (PDT)
Message-ID: <1ab3a88e-29e6-4e24-be83-7c8891addc9c@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 10:39:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] Add support to read the watchdog bootstatus from
 IMEM
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nYurUPkc3WaAXzgaRCmuV-tB7dkQjdyP
X-Proofpoint-ORIG-GUID: nYurUPkc3WaAXzgaRCmuV-tB7dkQjdyP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA0NCBTYWx0ZWRfX4pLNkOV1hoWv
 qc18DTee+Mo/V5t8+e/JEppx4IPEHMZBHcRKgBovULpjfL6gI4VieTd05mFxD34ux4PV25Q945y
 oeO++Docw+FuskhGWjpT0NTjbXl0TIyGDPmVNr3kkEftOWsC/dhUnMfs96bBxtW3bAAu1nIDol6
 3vE6dC5fX2STxlreUbyRmCSUtBY7sqwRp93xzHOtWg5Ow3j01G6mX/tzUJ492rmZuujwGP24O6O
 KwCjG9FOZTVCb8fFCLdkhWEB/CWi+35KOlggqMGaNWkm65Llhm+HninZuNk+GaazjMuAxJJC17g
 73p/dmXJnpiHqd1anYnTMVNYrhOaFwq8AR53qx65mRVcHk66mtFiOAKGUeVUWLaqKja89CG5lFk
 aQ7ERRZB0M80cowBm/G7eeFpfeMQainTht48FtyFgEi4VHXmWDIVcXvvqP56uk+xSb85D+KEj4c
 O18o7La51iWjjWRDO7g==
X-Authority-Analysis: v=2.4 cv=P4YKQCAu c=1 sm=1 tr=0 ts=6a1e65a6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-dwDhdSHjd2LX_HmtBEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020044
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110711-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DEE19628731
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/13/2026 10:30 AM, Kathiravan Thirumoorthy wrote:
> In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
> timeout, there is no way to identify it. Current approach of checking
> the EXPIRED_STATUS in WDT_STS is not working.
>
> To achieve this, if the system is rebooted due to watchdog timeout, the
> information is captured in the IMEM by the bootloader (along with other
> reason codes as well).
>
> This series attempts to address this by adding the support to read the
> IMEM and populate the information via bootstatus sysfs file.
>
> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
> as below:
>
> cat
> /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
> 32
>
> Upto V9, this series has changes targeted for both qcom and watchdog
> tree. So V10 was sent with only watchdog changes and it is picked into
> watchdog tree[1]. For the remaining DTS patches, sending it as V10 again
> which needs to be picked via qcom tree.
>
> Since the watchdog changes are not yet reflected in linux-next yet, upon
> merging this before the linux-next gets refreshed, below DT binding
> warning will be seen
>
> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: watchdog@f410000:
> Unevaluated properties are not allowed ('sram' was unexpected)
>          from schema $id:
> http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/log/?h=watchdog-next
>
> Signed-off-by: Kathiravan Thirumoorthy<kathiravan.thirumoorthy@oss.qualcomm.com>

Bjorn, Gentle ping... Can this be picked up for v7.2?


