Return-Path: <linux-arm-msm+bounces-97909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id K1/ZFbbet2n7WQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:43:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3723298183
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 357303028C02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C712539022C;
	Mon, 16 Mar 2026 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJs9mvC5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5zgdly2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC6B38F636
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657749; cv=none; b=EwTVSw7oNWJ7DtrYvRY4ocTVIgXY5iHX+zsH07j/MpIY5vPZpu/ukOQLYsL2EdbVsLRsxjCYZnlEUGECQXDJFHDXYtp1E+a1AG7ud5gDeCcScCq15t+XwiJlaV4Leb1HV91gjf4DKUOxVLB/KhaboDIZCdr12KirGg4yT5eP+Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657749; c=relaxed/simple;
	bh=+VX6yr36XSuJ+T2uuAMUjlzRmJztzlSf9KUHwc32IDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZr9T4e3lKN1pS4tY6TdbHiD8pF7ShlqcwJ5/pwb/BFTTyzHKr8zjcf3On+tFQRSi5ODa8T5wRKhA+UeDaSUk+rAozFj1M0K10zGgzZ/4RWBEYIX3RnTk7Fz5xXwALrKfr26orw7u7ojyBwMDEDvdSGVYxcJVlXK/C3VK0ve7Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJs9mvC5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5zgdly2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64dRe538832
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXFgbdW5bN3sPwSAvwEroYOSWs95yTwVoniyi5meEto=; b=IJs9mvC5Td2n6iaN
	1d7+4tHZ6jRZtzDU+iO8UwsAvJPNeUPpLQwS5ykMos9ko/B/m1GMC8oTPEPZA3zX
	URsFeXqCJM8LL3edvRq5AeRR4VPeS2ILkvQRrDRWkr2nGUXhsHGoClKjgGTsBcl2
	sgTAwZTAglNju95kME2c2zjewjNJDEVoNrJl6nvr5sRzTuM/dfx/+SYqCVXQOHOq
	6vPZXgrK+B0Au2//VcGO6QPuCNWTZxUou9Kjwy32YmvvGBdd4AgnFWyxK88CI8XS
	JJ8YDyoZXRs9QkHOz5aYSjYLKD7aRAs3GaFRO7b1R1wNNMfZkGkS9gPLyZq+tUZ/
	XQ347Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5n99y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:42:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091c7384edso32058351cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773657747; x=1774262547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tXFgbdW5bN3sPwSAvwEroYOSWs95yTwVoniyi5meEto=;
        b=b5zgdly2s8hEab4TjrPgpLe/5pGr2xUfMVfc8eeJMpjeHVL4pMkGEodS6gnxBMKOIm
         N4tdqPgfqhQlO0ibrJxs0zvTSYwj/Dm+1aa6wpY5RfsFsDM8Q9c4r/4U9Z1BFLVFCmAt
         AR9lMf0b/vPQS9ebf5Vrk9itseCEHT79SeOjtTim8+Z+Mi+FqNXrewTlw6j/Wi3YIfav
         WnlV0rih7amBtvxD3uqepI5H85PjCmyE3qjSZsbeIxMDdsJ+VhKBsi1CVPP3QWCmIPUR
         6Bn3jyhLzVKfCNmUvhyRGvJd8cVUfltduaDZvSOCgqObPjdGY/Krw+fnlmCRWXl8BoIT
         Sz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657747; x=1774262547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXFgbdW5bN3sPwSAvwEroYOSWs95yTwVoniyi5meEto=;
        b=b2ICuqE9Hxvn+KL6ypt1tr0/nOIdbtg6Q4hggG0pGxIaS7oFqOnxF7NDKybdS0p8yE
         tEyalkwCEpvgCiQvQ8OcUQfMVqelVPtdCGIw739xETfYq8VkmldHR2a5ch28OpYWvBIk
         SrNuzEguzYG+jhNXU0k6hN/Hyw0RPp7i04DO4KBX19f/vXU3kXwcRss3uXcNRXeYJGnB
         +qkORpHC2F0Hj8ANbJzKewvIKbUQIiGNJunxWgNox5XDAUAc5oEYpF4xAuh1IrBcXayC
         3QOd7ObHVDOXZLFeBJdnJy53JUF63l1DTjrD0Yky4IZ0RvR1zz2gtALxDFdoeDe5D0qB
         PJvg==
X-Forwarded-Encrypted: i=1; AJvYcCXEldp3LaGpUQ3MmSz1MO1l9hfAQ//xa0yDRZbENmxl8gNfLs3nWED3NrxsRpix+OFst67xHOEKqjcqVXFm@vger.kernel.org
X-Gm-Message-State: AOJu0YzFhGnlJDkqHQYXDHZix9tR3jLquZji6ktO3J/9qWgaXCEi8ewl
	Zh9xwOmKHYx0zwsoWcld8O+gkoSIekR3Da8NKpLAW0/sDBFc5x/0u1H3ceSJvFD1CwcGKKPeDjc
	GadroOYGGZ/TtqXQHPdgyK7BHVX8tCl8lNxLMaDUOnaDMp/MDWKTHqj5Yq6bDjbCKhBGF
X-Gm-Gg: ATEYQzx5AYzfleKfLskVliY8/0Pul0qAxQn6MU6Gz1y7pGvx7gr1NuL3rrWWNNUTnQE
	NRCvELooNvnCd4jT5EK6Y1CzpJ+k8DmNmIR1JADiRWS30RaGGR5gX8I77igKZa5rjd3GITdgVS2
	2cCpqZRrdfhjO/oZG/VwzLIVhiVCYn/pkixBj08ZGVr/pOvpim/0RUaBMaM/w6edfM/FL7643Fs
	WHgqGztIC9u8Xyi3Bva87GTDuGhAiwF+vhplqQYfItc5y/BinsVT4UWESJ1p36PWGCQrE8yRsLm
	hdleeXgQZO6uxorP4kPVFNOtqyUARVihgqFXwTcVYFCwXWf5Fqh3pT3JjXW8Gg3L4XsvCgHngt6
	V1xuAdWmTdYt7D3L+5JVj34PKJ+hD7/Op97QVCwthkZVv80IfqewL0p8AtlxKjSQiMkNO6Hm0vt
	Xo2z8=
X-Received: by 2002:ac8:7dd0:0:b0:509:9d9:e19c with SMTP id d75a77b69052e-50957b90577mr132597081cf.1.1773657746679;
        Mon, 16 Mar 2026 03:42:26 -0700 (PDT)
X-Received: by 2002:ac8:7dd0:0:b0:509:9d9:e19c with SMTP id d75a77b69052e-50957b90577mr132596711cf.1.1773657746247;
        Mon, 16 Mar 2026 03:42:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9791c113d4sm429381966b.6.2026.03.16.03.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:42:25 -0700 (PDT)
Message-ID: <5a3e70ee-abf2-4ce1-9607-877da7fa45d9@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:42:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: Add Monaco Monza SoM
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, r.mereu@arduino.cc, m.facchin@arduino.cc,
        geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260313103824.2634519-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313103824.2634519-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lOMNhqYQaEYz5FRuQp-kq8W5bUCmraQc
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7de93 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PhgHo22kut4TJJxNvVMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: lOMNhqYQaEYz5FRuQp-kq8W5bUCmraQc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX/6/QnPA9IA9z
 D/DcmKNzKVfKPmS3ljp3urZfZdLXJOC75KaJEtCCDP7SpiR+kghON7ko8zolGeoYCiNf/7ybuIY
 joNX6PVuYcdUzF8G8fejhwHt40I+hivl1JZw9C5dzsUM7xDEjKc0kGyCW2EfoV+NpjnorkCt0C4
 pvp5TkPd9Yh1yftu9D63yOy1sbRUGyUryQJ1lNIARV8XxNowGxljuDG945lBNVPybsEd5PyDz6t
 Wq1IqOkegiNNUtn+CCwFxMWGFYn5rRnu1si4MlzkHA65BJGVZpki8ZSffEFN80FxsnyRqAMED4p
 /NRtKrulDX62dan+o6dpDhF/y7NXPYPkKFF2YPGnsvodZ2KtWHwp83dHFTqXohp8jrtp14DdZpN
 JbN/+B5zV+HFHouQfGOC3cXY1oj9YTSZHyqKgcYlkEnL1fAVJoNNuEnZIGJ5AzY6zMjzlHdILPO
 i5hvoqL8E0+Ld2ZqiRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,arduino.cc,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97909-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3723298183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 11:38 AM, Srinivas Kandagatla wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> The Monaco Monza SoM is a compact computing module that integrates a
> Monaco/QCS8300 System on Chip (SoC), along with essential components
> optimized for IoT applications. It is designed to be mounted on
> carrier boards, enabling the development of complete embedded systems.
> 
> The following components are described:
> - Fixed S2S 1.8V rail
> - PMM8654AU RPMh regulators (PMIC A and PMIC C)
> - Display subsystem/phy supplies (DSI, DP)
> - Enable GPU, GPI DMA, IRIS
> - PCIe Gen4 for both controllers and PHY supply hookups
> - QUPv3 firmware declarations
> - REFGEN always-on workaround for USB2 HS PHY
> - Remoteproc firmware names for ADSP, CDSP and GPDSP
> - Ethernet SERDES supplies
> - USB HS/SS PHY regulators
> - On-SoM eMMC
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

