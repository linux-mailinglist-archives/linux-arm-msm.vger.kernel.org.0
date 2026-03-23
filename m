Return-Path: <linux-arm-msm+bounces-99258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFTPAiU9wWk9RwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:16:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE832F2A5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C5EB30387D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0512E36E478;
	Mon, 23 Mar 2026 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eql6VYLQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6bkvKuQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFEF1E9B3A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271170; cv=none; b=pis8+P8LJ177ALbwvmNkLc5pvfxDODdcYrMtpPck7/HfwI26OhBwekPIf+mmJg9Yg/fse8wlf82E3rB5M02z9eTsy9X+8dBArrgxFrMLFwOlrXMCUmnGKj+jnS5asHkpQ0CMghREShXggyLNiWW7YIxc7V64DLoj5hzkz1Cuoco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271170; c=relaxed/simple;
	bh=sCu3LiQ6BBeo8pTrcqgParOHaEylWJEYsSiKJNJK85k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbVXiwMqEBniw83E3fFe2O9fOxOjocAKSjWDLZHwGqoz7FsEY61+L74to13AaJYvLU6BqwmFwenh9YbkXdsJAePV96y/kYzoWh6XTvk1lxXcfnC8WQlwQc4Xc1Kt0rB0A1DnkOkTRhCI1S/8N+oqgzra5EwNGgS86NpbSNx7Tvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eql6VYLQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6bkvKuQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBLw2j2758752
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSsZlQvR1eCULORb/lRgNiwupNAmf/BLASEK6Sf3Ngw=; b=Eql6VYLQXE2eh9Uq
	80/JP0rN9ZVl+a05bwgsIA/6sd+SxtEIhEZB7KpkaAsNbgNafbaTdTuKOKkcnjc8
	sNqrX9kzr6oEB4R0vODg3HSyCz+ZeZyIBNzcEFEwuAsEncdbS5hesQDhnWd3yQIg
	Vut0UKw4mf9jhKczOM2SKp3h189DYD7khCV/04ZXnfW3J2FTyMVxr/a/vpkmSrgL
	I3j5MofmVcpu2Yd/6zlXLd/4f3fjaJFD+/AjqUeFhCO8W24aP8ANb7r1BK4f42CH
	Lioz/MXdm8gxuwexZ/1FYQwVHWYfbp7tQkcSfNGks5lp1PiFlvKJDcLA9xfpZuZt
	C4LYkQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4gap1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:06:08 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56b6a0f5391so713034e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774271168; x=1774875968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSsZlQvR1eCULORb/lRgNiwupNAmf/BLASEK6Sf3Ngw=;
        b=I6bkvKuQy06rxdvMhqX9fCDGeoqE03Zih/+6u/zzav05U30dgh9DWb8oWcfpLGj4S7
         GDl+mStMWiBPTtLuATZFA0VvFV/jYN/tSGZiyIQHVhw86PE/xog8PLrLX3DpJs4Xe+gk
         C7BOmhDH/EcEY+LAGwRJWEbthHfuf2exef54CDapA5N1x+2t/3BNb2ZNrn/9Gmqpi31p
         85+UUX73DR3Wy/6qsVS7RzbgUWAswsD1oDqhk+PyqnF0Hrd6dZ0GQcX87nIsz2FhX0zp
         5iIa12xEPGL6KVBMe0tuQPTImuTeLMtuih6HyibVUiSv0KhZlO89LGt0i4TNMzWXVnLF
         zyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271168; x=1774875968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSsZlQvR1eCULORb/lRgNiwupNAmf/BLASEK6Sf3Ngw=;
        b=KVnmP7X/L7ENzXGdNvNP6u2PPVvl40tP3d6n791BqtLxwl9fNj7ZosH8BvljuhMw6s
         GOBBcSfKbzGtj77hxWuR13Ry8QFx/FwqvEjuImiT3SVd/H3c1CF19rmqpj+lWrZ+6UCZ
         1IakLRKRFtyWP2sDcnGdbwGQaNGEm4bLF6MzCBzECLyz8EkhLHfb7yysVMsV+CxeyYdi
         j/R7FJVtYjRO8NDmlNFhaA0rnQfUmolozSVbiVch7GtHVGotnI0uIWhprQCx26N5tDZ5
         +ULqM3j/tbGjdJNvqh8xMK1Gz4XgGtujVhJGLdRt/X7ihmhqiR8IucWLSEKbU+Nr2rQB
         gClQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmGkNmZRYFp0YLn1ugyyTRkcyKbw/cZiO92N3XSY9ZxuL1coHvi5srV5uLSuEpgmiw55HFhj8pZbXQIc5Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzCJ7XuyOMn8VvxrBKBtXNfnTrtKwVdp2q2EuB6jxTvUuc5kST8
	FjZ7BLefjxwV+sp3d0Y8ZBvo7gZyqq4C4R82U70mTi5b58zjMhWfZy8fmfnhUfyO34DIjQWRjIO
	HPLnt98EUqScdBG896b0ptc2Dx0qsuyODnK/uhi4NGovQsSOzpbh+vQPTvVksKSh2aVlN
X-Gm-Gg: ATEYQzxowYna1HxWzmdqCsFwjTMI19v/zoFrtpi23+lNsQUth3Dj/2GJkbFSD50Rhxf
	CWINbbXXFn7alhDesqqBenkSlhDP1KDprUmPIZLCC6r3/tq8MJqgleWh2+bEmAnDa9KBgd8JdfN
	5SLu1WAeEXelMom0lRbZkyTsjlmI2TyoidBw9T9VdVWCgnJaz+yhw0ZbfKlkEC5WhYCZyuRiZXP
	0xEKJQXhpi9yYGbWG4D2ehpXPWkr/c+pWzpzR8A9HvgwlgNNDIrGQ2Y8mrAbYv3bI8t7Byqlw8c
	LG40gn8XjprssfhjkKz9Bm3yiylzjfS60XoGxXzIKTHKBDhLWfMoVHAIJ2E7Ptc4c//vBA9Y+ni
	dYgAYlAT13/abd7UiJmtI8XWrjPv0eKRxJ1N6X+xXLSBEYP7nDk3rv5c9KVq0+qUu5m/P6BGehu
	FjFvY=
X-Received: by 2002:a05:6122:13c:b0:56d:10ac:2910 with SMTP id 71dfb90a1353d-56d10ac2dcbmr140004e0c.2.1774271167646;
        Mon, 23 Mar 2026 06:06:07 -0700 (PDT)
X-Received: by 2002:a05:6122:13c:b0:56d:10ac:2910 with SMTP id 71dfb90a1353d-56d10ac2dcbmr139960e0c.2.1774271167149;
        Mon, 23 Mar 2026 06:06:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832beecf4sm499648166b.0.2026.03.23.06.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:06:06 -0700 (PDT)
Message-ID: <b2ed0703-e1e7-4a32-ba1f-f4532aeb9f62@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:06:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: sm8650: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
 <20260314023715.357512-7-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314023715.357512-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LduklRqK5-BRVFkHv9lPPXFbvAnhwUxM
X-Proofpoint-ORIG-GUID: LduklRqK5-BRVFkHv9lPPXFbvAnhwUxM
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c13ac0 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=R9MQUlOpTqeLH9orQUEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX1CVOxurzyKLH
 P6Q9xain4eZEUtdx75tomptuNsZRfKkY0bWYP1aXriJP0qfn7BuhKOLmHwQtpO+b1eIk3sQUirL
 +icaY+90eO9OpBRMEL3ZkC2Vy8Ab7GwQ4nHq+e7LGui3DqX6eiyoLkOlyFH0AOymM2ym9efFIzK
 mNqWHx6mwbW/dOyrbgf8m2mwUgyCmXDQXzROUdWTthDhZFdD4mafcNhKdAGHoAuWsRl6mieTyfe
 1gF437cid0Y2ZIm111+Qu1KvhmFjCp0wrivxF+uwEtLucribmSgu3d7FSz/9L2d2/BIlwDVW7Xh
 PGgUw6WEm9ja/KrBmQj/ZpfRqPAUkm/2LUZBzhLv0PyztlfZ5jFINDsmf+51691AKyKROz+Q5nd
 U43ig/csVigjwzYNkpsioID9rp8SkZX1QfnDyPPf5w3lxySDnN/oXdgSe9djGCBmdCvYGvR0IVH
 iJh+EalGEVbzKA5i1Zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99258-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EE832F2A5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 3:37 AM, Vladimir Zapolskiy wrote:
> The restriction on UHS-I speed modes was added to all SM8650 platforms
> by copying it from SM8450 and SM8550 dtsi files, and it was an actually
> reproducible problem due to the overclocking of SD cards. Since the latter
> issue has been fixed in the SM8650 GCC driver, UHS-I speed modes are
> working fine on SM8650 boards, below is the test performed on SM8650-HDK:
> 
> SDR50 speed mode:
> 
>     mmc0: new UHS-I speed SDR50 SDHC card at address 0001
>     mmcblk0: mmc0:0001 00000 14.6 GiB
>      mmcblk0: p1
> 
>     % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>     1024+0 records in
>     1024+0 records out
>     1073741824 bytes (1.1 GB, 1.0 GiB) copied, 24.8086 s, 43.3 MB/s
> 
> SDR104 speed mode:
> 
>     mmc0: new UHS-I speed SDR104 SDHC card at address 59b4
>     mmcblk0: mmc0:59b4 USDU1 28.3 GiB
>      mmcblk0: p1
> 
>     % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>     1024+0 records in
>     1024+0 records out
>     1073741824 bytes (1.1 GB, 1.0 GiB) copied, 12.9448 s, 82.9 MB/s
> 
> Unset the UHS-I speed mode restrictions from the SM8550 platform dtsi
> file, there is no indication that the SDHC controller is broken.
> 
> Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

