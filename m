Return-Path: <linux-arm-msm+bounces-96619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKjPM4wDsGkWegIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:42:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CCF24B588
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5DB730D31B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7503B38A70A;
	Tue, 10 Mar 2026 11:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dU7zo3nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBqjeAcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3794338A727
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142083; cv=none; b=Ngv/TBbR7caNzV95y6W45FuL3YgaALREpIeNlJrOhDleq8asqvQPFmUz0DjgZ0LSRXODeyLc978OhHw5GzFhmVc2OtuNMlnBuW0MECEVOG/n6XGsLX47Rzz+VxrNOF3f7Lenrs/YmySbWglw1rJHLmJ0m332UtRXGTHsWU9zDig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142083; c=relaxed/simple;
	bh=oeit43/noQ2g34pqMj7PtUuZKj+45nXsjrICH2+p6Uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P11UbPSFBIymlcZPLJE7Ecj2CHbicXnsl3cpXZE4CjQLcQZrfAbXUop/o2MF+hvCh02xchODEaxV18qtV39N5Nf7oIEpzvRDVPpNilH0w2o4bu40vk9UKLyxztiEBcu5YgvcirebJ6R0EIK2deTZt1C88SAr24aEk1R6UfITxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dU7zo3nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBqjeAcG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wJbs3124459
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+yPSoOZk6Bqu9Ld3D/94jytpoG754EO2GFj1PLE2VDQ=; b=dU7zo3nctFM3hzOg
	zlyrO5me8U4OaLoGduvt4qdoX6U+Ehne+aEjfe3ipIGBLEJK+wM0fqzDIzOlWyTF
	YnUedblx5zCXZlIEum5BpRWt32m8H2dwJ8xb/MuIRwAPRizeJkbqmlyfw9hNTSGC
	gZxoHFzI9Oto53srxuUmiF2+g3YWluqervg7Rb1KOEOoPfb3Tq/U4gLMlu0Oqtk9
	CPf7aKJXtJ3w9abMFZRV/q49XOPcsftkz+qmvDEDHb9r3Z0VvFRzE9BpsRzfGD62
	4w+wFOf8bShCrDsFwGy4YK1DslabruFJ9P8ZN1G64+rDU4jq3MDlXMHT7F8g5gPm
	PtbiKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj0u6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:28:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb456d53a5so42430285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773142080; x=1773746880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+yPSoOZk6Bqu9Ld3D/94jytpoG754EO2GFj1PLE2VDQ=;
        b=kBqjeAcGO559VRfDRi8IgBJC6WF8qhdoMLOhx5gMiPocwWIqm8Zinc4ZCL+E8BHz3F
         JYNDL1WQSeczmNz9zr1myJKaqBh3TJi7WvmhXfAIs3Td6kKPzC9c8dFwyLRb0Qn9mRXL
         K+/W+Ywdc8WMCRNg2dv0dD/BoEL+FP8TL9d1cs/UYWxZYgCYJkeLMOhSbfkCJF/beCQg
         sAxThASkl0ifNaICqiFBkKcepyYLnuihMydlADLgVLNWrVE1rNi+BKP5KRNO60nr3j8O
         KDcM13bCFj5tYExhmYwouXqSVcEJ43zx3USPq8MpuZDWLDaE1DA6XwJJwIWHyK0nxUrt
         lAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142080; x=1773746880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yPSoOZk6Bqu9Ld3D/94jytpoG754EO2GFj1PLE2VDQ=;
        b=JtZD4zuUOw04D1nT6SKj97jZ5RgZAQYuS5dWV8P92yfoX3PrfL1ua8lryl78wjjlzP
         kfiM3iDZDkY42QT8hSXyjM+hydrQbgGskbb/o+JrDZHbCxczDDyt3zrP4FvxU6ZEcwhq
         mVVi+zw8yp4NyOhBn47no9JLs1yJ/4n+98x/a6vLIStD/Jsg1FUCLfJn/WpjMy5ELKc1
         kJNGlxIjwQP5H2SeXsTZunKNISqZ+kaU5JMAc36UqZBfbooLT3oci7j6FlconBvkx4IG
         gMCScejjnGAoCbAVkwnJYYVTYJHi+huFvzX/BTIa3JfebI3W+wjyCVpUnmyo8HMTECXR
         Y/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuRAJA4NBgi+0ISCchx7e1IKZIfcJMLui+bBl4bANYuDjbur2oYAvly9VvGK1pNGbjxlZ0lJCq9XfM51Dd@vger.kernel.org
X-Gm-Message-State: AOJu0YzubKqDq9KkvSjTBJGi5J9jS6X7XlnBZUjaikN8U8jvcbXlBt5d
	y/gO53MPhEi3WHs2MykQcp6dbwLSmWzYJlLojMcayZedwTLIWt9Mo1LQJhXQg3i4PZARann/I/M
	mYolwqQcMZVz4wmjIB8VddnMEZrOH32tGQ4SvtL6vBSgV3iX/HwoSAZqy4e7IhzraRQ9k
X-Gm-Gg: ATEYQzwHRPyVGskFFNKEcgsxiqgrf4FBEV0yqpNwI+D94RPZdZK9tVxLiGdFyi0m627
	RaF+WhxdLr/O94wzDwXDpkVhs9j9OPGS5mcMJYvLc22syPga5/zkDyKQhMxh8Qw4AIC8UDixHaT
	9tlgYoy1uhST2HqX4EgCZ6w3riI8POGBazRcprTwrj3+3RB7IWhEpBr+okOb7Ojx6ticv9+ABo4
	OcGXd+uU1Qk0yJURLSTnKi4wB3tjxxIKCTxKvZFfosAUQyoZSRoc16qZd22+TjUJo29ad+6qNqN
	4b5VuV7o9GIO4Hn4BDopA/lcuMxFLWq7AVObiF9xgRsDIiXoD8Cg+cuUBUsYCI/lwKh85MNGOiU
	qv9zXycXI6tPU7IzqAGDIDmYJUJC0xXoN5m8WBivEtSbTMfuke41p8PdCIUGauDsg2gvBnhmJ/D
	a4+Eg=
X-Received: by 2002:a05:620a:890a:b0:8cd:7271:65e4 with SMTP id af79cd13be357-8cd7271686emr1109672485a.10.1773142080637;
        Tue, 10 Mar 2026 04:28:00 -0700 (PDT)
X-Received: by 2002:a05:620a:890a:b0:8cd:7271:65e4 with SMTP id af79cd13be357-8cd7271686emr1109668985a.10.1773142080237;
        Tue, 10 Mar 2026 04:28:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b7dbsm458129066b.24.2026.03.10.04.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:27:59 -0700 (PDT)
Message-ID: <d92f942c-ff87-4829-bd21-8b37b4fb2d1e@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:27:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 WiFi/Bluetooth
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-4-aa2c330572c0@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260308-rimob-new-features-v1-4-aa2c330572c0@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69b00041 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=TiCh2U2r927ZuiwL-uAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: wD5lIQM61m8TUU6lYcxqNpy45SX4_xf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OSBTYWx0ZWRfX9LIO3dwqWLbn
 AZIpYAqrtPWW4qfeSALcZmNqAsITOaKKMBglLkuc8UaoUEkbWArq2tCVP0GSz0jKaaE5xIFVb8n
 nLbrXt8xj9vfqEwDmminfz83INVhBugCR6LGpNCHH5kLgnTjL7PCV1rPSdpgQpBV0vO9pJdizYb
 zyZE02uZbSslBLog3SujT6wHRBS7UScaKhOTPjuO3yoQhVcfFDpbn65Xd9fsbyPYdj8Z8iPH9ix
 DfZkEVoMua/bqtpDgflXN+p5ieadPAFe/TrGvs8llJ/oe/qZjjxtlYDEvmovxaZPDHI5cbHgCTZ
 3RgRympf07/NumVNZ7J/7gPgr5gHRHjM0O9iQPDIn/8GE+ze/B8LUTRlIcI2VussZVqWNbI49PJ
 dK7C7/lX9sTNOdUvjORhS28fh9x1a6qiYzTe1AMfGeGicYTLfC5p66MzQGRHy6kRgGHXTepzbSa
 KNjC2/anFmOzwTh3I0w==
X-Proofpoint-ORIG-GUID: wD5lIQM61m8TUU6lYcxqNpy45SX4_xf8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100099
X-Rspamd-Queue-Id: 46CCF24B588
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96619-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[protonmail.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Configure and enable the WCNSS which provides WiFi and Bluetooth on this
> device using the WCN3660B chip.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

