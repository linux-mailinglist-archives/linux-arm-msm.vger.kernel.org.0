Return-Path: <linux-arm-msm+bounces-100710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCCrAHA+ymn46wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:12:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D1D357ECA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55BF430547E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00F73B19A6;
	Mon, 30 Mar 2026 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5RNbTQG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PVG+Mf7O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC4B26B098
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861568; cv=none; b=U0Aq1YOQUj0jFPOPOzpWQUOZvHv1jpuEMMqESuiXdrzLyeEr45hpB5kCKfSxLpcEZJzL0BezvU39pre0+d2AvszxoPRnJoEQydbd7urCXfqs9iSOEmms4PXCvjHcL/Hk5spHdtBEw04a/ApbJPb+jXxVFioUlT1FODX4R8bkqBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861568; c=relaxed/simple;
	bh=Obo8urS0LbfTKU+HQ/PJDwdmWRXP9ejwer+HCyf8Bn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ueEOlIxzEEw/wHBJzZnDw0RfVj0ey+MHqLt2NX33zkJG7ziQ8cwo3ZdKv2MaVpu6Z4+1iNVjFOVBleMi8qOhSVqnIaFcjm4tj6MQr5ZIS4jUtDZ1ebmXH5Gj/DbprTlh2uDdWlYrU38Tajtc9eI+OhsX0uN3VGX/riKD0bAKmz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5RNbTQG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PVG+Mf7O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7BIIP2224414
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cMipK/UwAxMfAPwa9yteB5iqHHVJPr2rGBR9HQPnHk=; b=m5RNbTQGoa9Nd29D
	Fx3ROKtAcu37AjwKpZanidVgaZPI7qTYTuI7tsr4gaz2cdRlDDBhW2ur+Dq6p9Go
	1PkwLonY49XT+lSuUuzSWPWUifFywf+KfDvXkv5SW/D9ngWuynRNAuJpPzqRKqLH
	tgn3bFyVxWDAnkIav4/oWxQMHZah0SXMUL4LkxDJmePKdcnYId5KlptE3SXXs0Qq
	xapB9Uh5bICthJNIRAsycdSoRKoHWppSWP9PooJq3VUjNnOT4ph37wfubNlXWrqF
	j1YTTR66tR5/pUwV9vvpftvIQzmqJI3bNyEgXdITCgePqK2SkardYBmNZ/8Ghh57
	LH2TpA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hd9qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:06:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfc4ba4de0so122679085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774861564; x=1775466364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cMipK/UwAxMfAPwa9yteB5iqHHVJPr2rGBR9HQPnHk=;
        b=PVG+Mf7OcjIo/46K3+orAmqeHoQ/RHVv4uSryJhTofyjZ5E85Ls/zTw2Gs0QzCC9WH
         AwhJ/1lL8cxdYsC5Si8alkEYfMzRTjAoO7CpCy2FBW/GoXQifLsuHuzlCX3f+B01WRru
         OoHVFdPWWKYZ05TsBgXhgkUYsWzj8KY29of+s7rMYzY68N6Vj98LljoCaQf9ityBfbvN
         wQap7drAM7T4L3sA2pDAJDDxeHBZ95MEF4EM7IgtN2LAmD+0HYbGLg1ein+/Nmcb7OoA
         0roMroZJXzFc5TKpUC12tgS3qiwXPSlsU4gm40OcITjN65r+XuZKrvfcrl4w21TGANrv
         yd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861564; x=1775466364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cMipK/UwAxMfAPwa9yteB5iqHHVJPr2rGBR9HQPnHk=;
        b=A9oXpb9bgTFE147ZIh8Jw52a42u/jDoY/6fJa8/8xVVl0MHrHyjIa5qdoK32PmyWLh
         o2ofuG9s8/IelCY/uvs0Gh4/Vc/hII0gNIwB/qamQIfkXr7u3LjrLdw/pg+VBE5b/vVj
         oNULYyjyR6qqV/e74P8EaKC5MJddUKF/dG/TWWhdAIFDzrHQpACFH2bPY6pd456tlWQJ
         rWm/3J2mTiF2R0ofmBhNMgVY2DJAeGwmMZpc5y/2BmZvQvVmy7jWaIeGSOwy6E2JX0vz
         +PcqUOrQsV5jg14lizX8usDJ/Gl7h4Qf7MsOC0m2MU0tdJLNYmILUXJ9ZlXA2N0Espdi
         l86Q==
X-Gm-Message-State: AOJu0YyVKZqp13uUDh23wefnvkWDYGVnyHCpRoZQFmcDa68fUmLAhwxY
	fbbKn4s7wGZCwtnNDIt3LO5L1LVyRzlDcVRGPPLFQV5/A76h6xw2KHwrvXx/uQm2LwJQxGugG9Z
	dXAaWzzSlnRRX0Rvwz1FMPIKZo5/EWuJtoU/2rYgHoi2FxjQbg7sG0AXnZ4PxS2Og04D3
X-Gm-Gg: ATEYQzzK+D/pcjAhkuv6TgjfDGwgVTw6Qk5IBlNiGr14zlvQdhTVb1f3ez54A++aMwO
	Nial3j8q9zGZua4m1gY50olasmA5n44GXT3X9ne4DYH62ubM3gt9AZcEtpBOO//aeydmRPGVsMG
	/6cysColTyA9S21WoGx047JJtd8NYGJmD1RWOB+WmZ9KoAVP20ZuLAmup/FrGXO6fjy295UDznh
	gqghOIwSYshHadx2oPkUxIRc1fm4/25/0HKEtYi2z2HRiuOjs6oBQSNqXGI7kotAbuJhpjw9GLA
	XZMouMo3PBiJ3cjwQT27GEWzn1mng7leiY9AIPfv69hL+kSv71yHqm34ZvK0OdXjnvPG8wTjbK+
	e3cBoCiTZXEqzZ6WTo6000mx0TBKvWSpXxJFXTs0mwJ9qVH71LkzYOwXDxVJ5pJkHstZNeEc9OA
	7QmkE=
X-Received: by 2002:a05:620a:17a1:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8d01c5c3eb2mr1047716585a.2.1774861564555;
        Mon, 30 Mar 2026 02:06:04 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8d01c5c3eb2mr1047713185a.2.1774861563989;
        Mon, 30 Mar 2026 02:06:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c07ab1634sm208039a12.16.2026.03.30.02.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:06:02 -0700 (PDT)
Message-ID: <90d8fa65-a05d-4514-931e-657451a31842@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:05:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add regulators for
 ambient light and proximity sensor
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69ca3cfd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0DFV3Fus7tF8Oymfmr8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MCBTYWx0ZWRfX+7QqY8AEHlX5
 /VTXucKKWzXPrigE9sWqJ2U6pQANcX37TvTaRr2mDxxf2oCQRbkO0XC9KZNsQgfIcoi35NFPmJv
 hy589ooERknl8Bzvpv7LtmKE3HH9Slue/OxsqRTkNCsgWPDudXVMPMPIO+wFdYvKJVJX/3vdMuy
 7DP2Zw3+yZUceZbb3j85ShIm8lzQweRMOvvoSVzhAVbVX1a+Ag6No47QftyLachL/C5KZvd8t03
 TyMm2fq8lmOJgDy+fGOl+OhcTaqp54wJgYf8ek82VbEQR+mhGW15rc89CBI8bdo3Fs+O/OZwBuC
 1Q/eB8gGhePi1JZIlWbBWW4J+9M7WM6bV+gaQ1ki3amRpUFGlSoxAKgEd9y80sPrkEbpBwW+8ui
 kYTlSoZjmUC9C0BRQAWZ+fqPhwPBWbdvugsMnOCXPydmqPUxUilwGAIDLlf02JZcOvmOnMN9OH2
 VahfCrV1dLqA5dB752w==
X-Proofpoint-ORIG-GUID: aOY9GFTOdLsUO--_g4duoldpfEP2gqWO
X-Proofpoint-GUID: aOY9GFTOdLsUO--_g4duoldpfEP2gqWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-100710-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77D1D357ECA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 1:37 AM, Erikas Bitovtas wrote:
> VCNL4000 includes support for regulators. Add regulators listed in the
> downstream device tree so they can be powered in during initialization.
> VLED supply is missing downstream, so it will be powered on by a dummy.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
> arm64: dts: qcom: msm8939-asus-z00t: add regulators for ambient light
> and proximity sensor.
> 
> This patch series describes regulators needed for the ambient light and
> proximity sensor.
> 
> In the patch series which added the ambient light and proximity sensor
> for this device, regulators were missing, as they were not yet supported
> by the sensor's device tree binding. Missing regulators for the ambient
> light and proximity sensor resulted in it not powering on when a
> regulator supplied only the ambient light and proximity sensor. In Asus
> ZenFone 2 Laser case, the regulators were shared with the panel and
> magnetometer, so it was not affected by this bug. However, for the sake
> of completeness of the binding, we add the neccessary regulators anyway.
> 
> The mainline binding for the sensor also includes vled-supply, however,
> in downstream, it is missing, and we have no datasheet for the device,
> so for now, we'll have it being supplied by a dummy.
> ---

In case this isn't AI-generated, you don't need a novel-length cover
letter for such a simple patch

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

