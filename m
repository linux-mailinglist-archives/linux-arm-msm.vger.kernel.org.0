Return-Path: <linux-arm-msm+bounces-113774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q2laH1fsM2rjIgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:02:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EEC6A0465
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:02:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NHVLGIPg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iVz2LprO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113774-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113774-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6395300D1F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48293F7A99;
	Thu, 18 Jun 2026 13:02:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECD13F65EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:02:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787724; cv=none; b=r3ryRC4YyViX2fRxtN6jXhW9v+jfbFOMC/bK7OJqZdB0IBzSHQP/5iAwDA9fHwXdV5o7Ayq6Y+U1D1kTHiMwVsaQGxpINVJysvXl2K4kAJubgoe+c24BWxonX8RRG9AZ1inZIYBwH/AFCap/L1Q0zfBdulHMJN8jS+PPSEkWqwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787724; c=relaxed/simple;
	bh=OiBvJGA3rcBVkwv/W5Exjcj+7CrWvutuFaR7iOPWQ6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBUVJCLz77PhZZ089fdb0JhzrKIXK7tU4FuZun3YaR5LmJ4CpxCBiWl7qc8WadOmXrHbLXG/x00bAbnAvDBm3BlbxOatvXdFqsjw1NvOxAOMrQWuKdcGGy3hRAyF6MTOUfxN8Y8xF9xKSc16vMikdwTOvfEROwamQqkFMivoNPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHVLGIPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVz2LprO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICvV6w1782062
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drBtdZI1GgQ6oz1Wq7kAcWt1WrFzuxR5m4b03USirw4=; b=NHVLGIPgdZ+BBsyb
	fGjwFfMjLWbk4ynHrjgQJju4rivyvZp2sPxy50Y7WPlE9XIKqnAGhfgtnO8nY062
	++GAlMsL1C1fcy/FR3HdyYSYeR5Vmr8XIdnts4/h7j/GHJG1nr7dRQmTe/jYliC7
	cUJcTvh+XBy4xosXU+35p1rqdLIDJVx1mpBkgrd7mtwPf2RYK2sL9dsXbjyv+R4X
	Icy3Je4RAjq7BaTbdJvy34+5GyeORQY6O61cOZdHpVlDUZqysQ8qbZNtv9koFZz2
	OGSl043JFByRmP1BO+Jo+i52+a+YlVLH2fIO/De46CJ7EQcUOVupin4Ma7x8pkcW
	RrXjWg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a3dy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:02:02 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6f5350426so352080a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781787722; x=1782392522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drBtdZI1GgQ6oz1Wq7kAcWt1WrFzuxR5m4b03USirw4=;
        b=iVz2LprOEI+6RmbJQUuC7ng+gjU3AZqst5kxkc7Ki4QLdLdy8TzAD/r/c7Pzk/5I4r
         UO+h5oRDrygvACFfaJpzlBW69bDkJjEjoEjQZQQnOy848HfZJ8Z0HeyVAhV7nwGhQyXs
         Lu5AuBztfb6sqIU+MUCpqGw6h+QMgCxISyaE7Dru89BSLpaH6FvAHsPdGs15p42vrwRi
         k/eVbXxoBWsuKzeqX/oZuGhDzhsV3g7WrU83CGKl1vXUsa+HOGCxq4qP9+6OrGVgVX+I
         2O+H3qz1S4VWPa8i0l6Kid7f9mmRqyZmzoOIluqgl4i66dt+ZeIuCWiWbbRrIri8AvBK
         BvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787722; x=1782392522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drBtdZI1GgQ6oz1Wq7kAcWt1WrFzuxR5m4b03USirw4=;
        b=NEHhYaZYhwB8+pf8BlBgGvZjQ4X55NLodz+6XIFU+i0Xz+ImVA4JnQeeI386PXDfN6
         oavP0635pvXLctGYyay624dbwn38GvjXA6pdPjuUEoqXNDiovK1ly39szGgItxw0vBt2
         UNvjP0Xd1MyRT07tqrFWwFQBbYtCunbPGB6UHH9WlL+8ddTflOxVb44DAN8Q4kwKgHtN
         eG+xTTxye2B4up2uwpJTD5aOTByz1tZyDninCIhh/OxVMSTFJJ1MqMRfKri1xydr+BPz
         xEMYoYvIwyFHhfqkRxkDUnL/Tr2ctAfrgluAXduCVWYwfRdH4nXy96bdkuhlLTwX4lCC
         pyaQ==
X-Gm-Message-State: AOJu0Yw4ww0Qs65n0f0j0UG/l12tzKUCt5wk3U6ZF6H/IEHFD/DNhUsb
	e6i32gJkN9OBKCEw9NwQFXTFj75LordILqXxattbMoxRmy1TDFxz7HbU54AKLrFFMAMJtKT/F2l
	6T3STdWQxjcoAsR78IvRStBoUoWsXxSIrOVjR+sDKcm8DSU4jEtfd0WlVYMM7Y87drN1r
X-Gm-Gg: Acq92OFmxitRaoI2oDfhftNCzjLM9+GKVsTLe5WtTfQru+24gBYrMyiYgy2vif1sMJu
	j6e/nlSUKpox9MnieUKfqDTwH23c8x/AtIyba+jpYF8IFOy2M2cE+y2TJyrILawCuuUjSGH8K/u
	76rt/vSAMPmzuPIWHOH7u94rjy+HJUIK5Ee889/8X1mQPZSqXChhye7Pw/wud8cF0w5GPovBE4U
	TljSTKWnUSUDB5lGvkQI/lg0I0p90NN9iB+54YYq75jtILGJw9ShNgcnmns3j4H8q7DbTymX1UO
	Obxgl/+OAt2w5/ft6w/DBm0Gu3kEqdig1LIX9fy3vnCCNebDw+HBJaZoKjA4ADXf7LZT6q4408S
	VRGkZH62HwaEYgNcCrx2ET3I8y9AhaeQVmoQ=
X-Received: by 2002:a05:6830:8383:b0:7d7:ea6e:322b with SMTP id 46e09a7af769-7e91be85760mr1719060a34.0.1781787721278;
        Thu, 18 Jun 2026 06:02:01 -0700 (PDT)
X-Received: by 2002:a05:6830:8383:b0:7d7:ea6e:322b with SMTP id 46e09a7af769-7e91be85760mr1718455a34.0.1781787717537;
        Thu, 18 Jun 2026 06:01:57 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm954142466b.11.2026.06.18.06.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:01:56 -0700 (PDT)
Message-ID: <d1232243-2f23-423b-84ac-4463eac79f9a@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:01:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/6] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-1-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-1-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33ec4a cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nM57NVUx0yqqE4FGInsA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX5KQ5N9/Or0qb
 hxrvnoAjdzxHl9H/sm40YvHUBDInl08sqUIioObOiGyqQDm2vKmsoXBVcPm2DihLuG4HG8e+/xG
 9JJwyWsO2zfOmtbFQg/62XclXMhP6H4=
X-Proofpoint-GUID: cMwdB-8HT-_-RGa_q0htMrfOtDUJdJhL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX3bDGToXZoryM
 YeP37GTcdpXwsd33hZqcN2mNBJgfb1/yLQ2W8RiicUxs17errSlIkdrFlvz1dFYxBCfNGKzqiq8
 9K6Fu3WpurUkUxdGTcZFTrxnY+1XIdR7VJG4lO/wRJk2W35LR6zcWCP+dmPx0PIhAQnGNr9x3rJ
 8itOr2I2xrEa9PKBuPuF4gPcHrc6AsAHN597PSEO2oO8gWU9V7ln4P1eNihnhUeP4wfN1CCUyAS
 kUO8B1UaFvemKC27wAMMZqd4SkGYsJpokcVRgon4SnoYlvjkpNrkn+yoQrJPYdk09SREEzWqqAF
 LxbDXpqxgV01gm/geK3HDET4wvWKDkr2xCsKBlu16A+BtQ7gwmjiDbTBHPfcbm5oilGlCgAlssD
 SNIJC6rI2aFd7MPZzYi9RknifHIbyqnC5tqJpOGY2Y+bT0V2RmCOBZKWvNC+FLfBQ6F/jh30Rts
 uZ46HSv88ZmeOoXX/aA==
X-Proofpoint-ORIG-GUID: cMwdB-8HT-_-RGa_q0htMrfOtDUJdJhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.00 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[bounces-113774-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.7.a.0.0.1.0.0.e.9.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68EEC6A0465

On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> Register optional operation-points-v2 table for ICE device
> during device probe. Attach the OPP-table with only the ICE
> core clock. Since, dtbinding is on a transition phase to include
> iface clock and clock-names, attaching the opp-table to core clock
> remains optional such that it does not cause probe failures.
> 
> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> core clock based on the target frequency provided and if a valid
> OPP-table is registered. Use round_ceil passed to decide on the
> rounding of the clock freq against OPP-table. Clock scaling is
> disabled when a valid OPP-table is not registered.
> 
> This ensures when an ICE-device specific OPP table is available,
> use the PM OPP framework to manage frequency scaling and maintain
> proper power-domain constraints.
> 
> Also, ensure to drop the votes in suspend to prevent power/thermal
> retention. Subsequently restore the frequency in resume from
> core_clk_freq which stores the last ICE core clock operating frequency.
> 
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

[...]

> @@ -335,6 +342,11 @@ int qcom_ice_suspend(struct qcom_ice *ice)
>  {
>  	clk_disable_unprepare(ice->iface_clk);
>  	clk_disable_unprepare(ice->core_clk);
> +
> +	/* Drop the clock votes while suspend */
> +	if (ice->has_opp)
> +		dev_pm_opp_set_rate(ice->dev, 0);

The PM core will quiesce the vote as the device suspends, this is
unnecessary. Similarly, the rate restore logic will become unnecessary.
Especially since dev_pm_opp_set_rate(0) does not actually do any rate
setting.

Konrad

