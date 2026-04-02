Return-Path: <linux-arm-msm+bounces-101510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNPgMvg9zmkImQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:59:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DACBD387557
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EBFBE3025AA1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C333DA5D8;
	Thu,  2 Apr 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6e3DlTm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MmmM2Bsw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8101736606C
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123168; cv=none; b=XCeIGETkY/ZWXNk0LOH1rYv1nELnb86n1GFFPihWFqq5e8Xa4C4N/lUB3D0+IhGInmxz1mD4ic3JbLjpGJ26z5RBvt0ncdQaUGzkvY5l3m1Jj5VMlnmhpNR2js03KPNWmvYwFlkT+uvm5sH7yyw9uB/10NzyFRTlFN5wmKGZg88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123168; c=relaxed/simple;
	bh=Mfd+Qq9kOh/v1GVdwWuBvllZlQjBdLtcEia0O51e/kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4dr+fPnRNFS42Y3cmzq19w5K+ZTSOnG94bU5ovjdSCQ/zi3WCUNpPl6sxgRloUewkcdYranbJHfWOgox3cTU0hx7OvH4n2k3+v3CGCknNvLyx3KjVbvvoGL50N/EY5KZh5tOeBqwtT+g9rdjhpSaZeLAzIcxzfHDKE6Z4/PP5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6e3DlTm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmmM2Bsw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328Rp0B351773
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PW394LL7WiyVppb3yqX6xaB+fIkBISkkCqkC763mnp4=; b=n6e3DlTmJD8K2YSn
	F4bRWatSdrlpbofRzL0aXwBLHoFsrVaElC0yRpUy9T9ZOoySfb/y5bf7l6syNePc
	xq057NatrOTa1d9fcSyshrWVfphwY+iEIF19j1Xtx8TpKB1cUdnvuzRklCZV7+pO
	N+gCCQPXkHx8qQZJnvtBipGGIqUZxI8JHyMBgdmx9ns3M1lfVnyKDpptsRcrzmIq
	MmryVSJQyxSfCp98oAnnsm80vjJhm7WiNUiDhJnQjP6J0yZzHqQoyOWaKSwPCEyH
	PeN6W/1WL24t7xxx8OcEY4tvglaw4Lq2MP00c5owTn2pygLUI0IPv+WoGPyrTBEI
	b9KnLg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myh8a0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 09:45:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89f3e41fc17so2868916d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775123154; x=1775727954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PW394LL7WiyVppb3yqX6xaB+fIkBISkkCqkC763mnp4=;
        b=MmmM2BswDhEmIlnx2LCKgVyeZiZxnLYrqcbVkxo8cRPTo39CIyT2V4ZRityejC3JSr
         wKDDKW9xVkc+WvRSEfrng/Pey6mz/HrMPhE/nAQm4kqXpWaUEX0x8VMeTCsT8YJ9rwV3
         qlAR0ajiIc9O02l3QMzbUep+4g9BYrmJyUT/MDoyzhkD/yT/dorrRPKqvIWmYEjAInu2
         EltkvcIidFUHlD8R84HkI093cJD5MQq7M82LAuKptLqAS2PjBiaYa4WbOWXHbreu8UuY
         TLRF5wZkclQGRP/0H6JxnxvMaA2E2CALRGvGvdFcUy0FJJw/twrslJxCbe+BQPLrXlcT
         lc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123154; x=1775727954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PW394LL7WiyVppb3yqX6xaB+fIkBISkkCqkC763mnp4=;
        b=R/PlXKpA1RDFYHVOS2QRmJo4MkRImn9YgGiBIVf2DT+NZVOESnm6lK5S/MJy79V5Jq
         eBuvzB2ejKub+wXRr3QRUqzMSMerwT25MKirOP6JFPG2fZPu+bShOutN4Oe+LkjcCyZV
         gTk8DKNDHeav0T7+DyTX8g5WiJfKf9VhMtIvBsVhEy5rhMd6S1a3tKqEFdoM00aIGtBg
         vwTDpGIdYb98iqO0WSLCM/xf+wZjhM/fI0iRvlMi9b2PW2/LrHB88mr9MmycSYHaRSlw
         /fX8KBF9q6tQrvrZaX7Uq1PMOZln/+CHMaJNzoW8BMJrnNQCLCdT/wiPmh85Jf8PjI+J
         9OIQ==
X-Gm-Message-State: AOJu0Ywfb9xrfukb3D1k1B7acSShHXj3yHvTuQgZ2xdjlXYNU1f6HHdD
	ppIRydFIaJcbss3mLo1jKBk5JjIUgNHjMC5KRvT31T+j+WZLoZRect6coKC7FUlSVUoknkq6nf/
	elJqOt+Ey4Mb7tOOPP0R+JsUB+SDVQmlCkt9+8QyYHo+/lCz5YJawOdjnBkakF4+NGz8A
X-Gm-Gg: ATEYQzzw+TU3XlWCIMaTdy2EnOtsaCZtn4O6FkwEGCUHawBTIU4wfFJpv/WACTgFyAX
	DAiv7oRtu6z6Ypo7ABkFUGz3RiOblOuLUyKz1qkzfSRy/xqgcqX2ewKp3NXIjlFGONK403kkqfQ
	ZQmbppTfA8vjKvHiTMb9tEi7NwuSUF06D3xvcOyg2Ul8VmNP/qWpOjfdd5EIPbOrJVydRbKCtsq
	KvYPoiEecJcbcCs9/Tm2EqfwELB0kLcUVaLPWW1W93NHQT3mZnHg1nsfS6qGudUIG6v3H4vhPma
	CtbmzR76HYbWSLVNLUEzUSN7an1pmppxJtBdSKgBwb5Kzk3cZj/DnPXSteDYaZ0p93Ea+8DVGb1
	wNQPBmKR+YFRH2/aUaiVlRF+7ZYEpCxBHUYpv+urznODOX9zkeAB3eR5X+SKjJb/iN2R0/eXDmC
	QLsnY=
X-Received: by 2002:a05:622a:1985:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50d3ba26cbdmr67168401cf.0.1775123153602;
        Thu, 02 Apr 2026 02:45:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1985:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50d3ba26cbdmr67168231cf.0.1775123153118;
        Thu, 02 Apr 2026 02:45:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c9721b6sm73265366b.10.2026.04.02.02.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:45:52 -0700 (PDT)
Message-ID: <d7d99d3d-bbf2-4822-ae5b-b18976953543@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:45:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
References: <20260401-beryllium-fb-v3-0-ec7d443402ab@ixit.cz>
 <20260401-beryllium-fb-v3-1-ec7d443402ab@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-beryllium-fb-v3-1-ec7d443402ab@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zzLg0SSse7DiZ4fYYxz70OIeARsC_xct
X-Proofpoint-ORIG-GUID: zzLg0SSse7DiZ4fYYxz70OIeARsC_xct
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69ce3ad2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=6HfXokFIjMK-uoYlQTEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NyBTYWx0ZWRfX+uqLggEALT5C
 YuPpOYX1mjw6+fZxbwQw6ADDdYxQ1fg9G1FO89nvEvlB9+ntIBvu0MNe9QzXcoVhstVCilZLUCa
 fYBz7ZimUlTqVBv3lglorXs14AJiuWQPMA8sBl0Ij3DVZsUhDKPsC2o2wQ07pna+QXx93xBIySw
 RYrJ5PxVlBMT/CY8V4HU+Se0SUUaOZ4xnXcL3B5YVdrMyTM26NISe9+VempcpDqIxYGCSfQpx8j
 lJUag91RMlYV0bX4eV51ERSad8piG/5Z2r+Me5bmkK2eBoNR4o9foeUefTKHcTvp3iw6fXl3ly9
 i1Y6uZZ5GbFJUkYBsX4i8m4E7fF2MRJq96s0cXXPnYfte+YaccCJLKR+fPD+/Qbkg2PBdqAFz9c
 jAILTJ3aPgw1v9V/LiRXNV3VuBq6pHmGbSISWU5A0+9CiBQlnOmWiCuIlW/3136n4sfPMbXYdos
 tnA+98isHB6HLtCn0TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101510-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,samcday.com,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,protonmail.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DACBD387557
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 10:40 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add framebuffer for early console and u-boot support.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

