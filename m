Return-Path: <linux-arm-msm+bounces-107795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNMhAZL6BmpsqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:50:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C354DB56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C21013012226
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2866346AF16;
	Fri, 15 May 2026 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJ4o1Wco";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwQL1qgc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7946AF25
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842026; cv=none; b=D9sCRzWYOz8GMGNH6EG1Za4B1X0RxOYGv7qkLG7XhW1OA2Qltrk41lgAguXvwolEO/gUsH5L3wo3/hHtWMu3EI9TkpukExQ5wSDjWjBPqZst5kpy67ngcv/za3qd+uhbPLVVUOKK8xGsL14YYPimGbIvFK5hp1KeBM3Haaa26RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842026; c=relaxed/simple;
	bh=3c9jJo9IJrp9sWOsuUD1RvROCzMlnV278lk3snD8igU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXYsB+6sFxtlvSbVXqL6F9fQnmQPxjUxriReG6yQqJS4VfDPBCyjiK3f3QsyWNd5/+9GjqheedQMzEle4zCsFIsYK/vfmA1X8EyIsf97D+Vry0sAanHDbg7aygQjvXF2JBhqnOx2xYjKlPAX3CrZQAV+uDJ2k/df7qRQKxqFY3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJ4o1Wco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwQL1qgc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4s7nJ3219663
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81p5ydoFPW231xvvdkFwIFpCM1HRBly2VHFug59OTKw=; b=kJ4o1Wco5ONyaQfl
	Zd/KmvDvDh1YuTNvueGlNyPIr6of2b5HKCv5XbqrWx1+C5uJbA5bYcrw0z7S1yEc
	XkP8oeRK+5jcDmxHx/95cCPHktNgNio7f83X82OwytYEHfmLCH/2l5qIEDnNfMCc
	AIHurFN0Fh4pv6wGphr7mZAD2rckyqprtuNoGxzg8WQ8l7D0rmLjgElRdWH/GNE5
	HofWp9m1M3SACIy7ejJj130cZX2SE9ztljx20jPndvaCwfTwrLBske5SnSVIb8xM
	d5Aj780NcTDmQBTjkuh3VXvGTmA1Q9GfGEtrQaLZ74uHcp/T/+YzPSY67cBs62//
	NQRf5g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2vne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:47:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63132c52758so459113137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842023; x=1779446823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81p5ydoFPW231xvvdkFwIFpCM1HRBly2VHFug59OTKw=;
        b=FwQL1qgcHhW4AUqU32qqwTQSK0S10Ho7pcLq2IeYCIbE0x7cThUwy1MKnkdKXoIVqa
         bLlCMq3DZ0v/1XzRtqk1oLnQ92Vry16MjYaXXxXiZaMr6mtclnNkpsyXczmQQfSa1hLa
         /GvRelCdtOU6dnf4Mcy5QfLJByTLH6JP6Ne8g9pfAgdyA0c12UQWCWDlqDka76DFD/8B
         GqgcqDz40zIvb+PwyS1WOuBAoTclAn3vVbSWZfeaWvSWX8B3hWo3oeYF/lw6SyHAnHHa
         qdU2u5A1RtzuG1K7jEVNlvQz1YyPW7eYI0elzkKnLb4vVuI1kF4heJG10MVXG7P3R0NY
         msMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842023; x=1779446823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81p5ydoFPW231xvvdkFwIFpCM1HRBly2VHFug59OTKw=;
        b=T1aVja9hzmVhZKMogjBjVbvl3W93rN6t9fVwQAgVbv7pP6NAM6OzGpSfhoXf7wbnzs
         E+/HEgfqDxwCKRky7NCSrvZj7h566CJIKJkZd3uqh2M+iRcGgEYLGYyF1m/toci1YBrQ
         J7zpsaYEi00GBf+EVt85DSOF0FC2KTIE1LX3E44qQmEU6w2a2tS9ClMH7wZIkO0qLqyN
         XsRhFAwRGe2W9VsRtxQN8UpaeUhp1EORelyd3Fjo1xvxs3D16j11+kp/coVdoHMuDJw/
         gUcH2K+Q5VHaMmgyaJQybiUA2WkAuOi+cNjVJRk/xZgizNKNfFDTUpISteqTrEPIRIkI
         kBJQ==
X-Gm-Message-State: AOJu0YzeZCG+WqUwy+cXygEMZ4uT1YshIR/1JIXWHDB54TftedggwQ9l
	6QuuK6w8gTtZMDRBBqpg/wMV7RKSPgC2M7o00P5XpF6FaIL/tl+D8agl+GsLBen0/fzqOQu999y
	pR+pmbhfOFtpHK2u3XPdVGW9OFYB8ebILKUcTtk96mj3QcZ5heHsXo+3zGOKV2eTqz58U
X-Gm-Gg: Acq92OHEoRQEr0gt4VGmGg380p/Rcw7MwV9qu28NXvQR8W/8mR3XJ5TUaEaIe5Ahxvj
	2QQHu5fz8AoK6X43OkpjGEpv/zLKTmRYs3/51L8/cFUg6JcAz35NhyGGgyRtxdZoaixWFVsDNxF
	DaDXZk12Uwoj26AqBhQgev3xJT4nMRyT8qt4uMDu9QFSyjbgaUIun/YrLUPmSFb314okvkj63q8
	6I1gnVKBeskuvDoxwl8Pq34wGczwcwNcLr++Jn6eQsJ2Lb3MsdcDMr4sA9cR4cmpugb4q6AlNvn
	mDYMSGwdz5fZRH3aFVj7nOThRsxmSRRwVXOn0/jj5A5qxsqUKAs8RwaqlSAsgXFblAdUtKZ67v/
	fBTJvwejtVJ5NBHlSlwa0kBQ03g5wY++T45bgiAT3GK9I0x0BS7BpLVyyrESA4UHJcuvP5Pf9MK
	Go09M=
X-Received: by 2002:a05:6102:21d6:b0:637:25ea:99c8 with SMTP id ada2fe7eead31-63a3cc0c981mr450996137.1.1778842022999;
        Fri, 15 May 2026 03:47:02 -0700 (PDT)
X-Received: by 2002:a05:6102:21d6:b0:637:25ea:99c8 with SMTP id ada2fe7eead31-63a3cc0c981mr450987137.1.1778842022537;
        Fri, 15 May 2026 03:47:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eaef0asm208520866b.57.2026.05.15.03.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:47:01 -0700 (PDT)
Message-ID: <33d3ba72-7d3c-41a8-bf24-baf325ce823d@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:46:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp: Add more thermal zones
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-thermal-zones-v1-0-33d4395b1be9@radxa.com>
 <20260507-sc8280xp-thermal-zones-v1-2-33d4395b1be9@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-thermal-zones-v1-2-33d4395b1be9@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX9FFGQIxoBpjU
 pAbiRQyhdbaRvP01qzJ4e+IJ3zSsD7UtYzB3vzebjtv7QYfV3eXX+j5eytSq9vD29EXzqyjWvfS
 Aji0KiZqlZwVeIv8p/8oSZBV+/46J07ils0RT/3941pDGn4m6TAcfeuOiW+lrjdhL2vF0BVOtV6
 z4eN4Bf+1yAknAzIDAsP1hTKrzlSDS/hUBLtxyrldpNGGkx431TSr/aSNoRrg0stMrDqcSPkmX3
 SxKZSMTQvK1X7airrCua+qsgvdDX3KfiewICGvCRdnEuny9vaZ7f3ZUBLJ7Wo723Ktj2bcj6+GA
 lKMZce6xVnFhaesbjo6knOe8DteVqCig73dvTyqqREUQjgGRdfULXKjNhcpJDEX4E7x7M4TBiVE
 3yumfrE9CvqlTlLR/3kIcQ5vqzhCNnfGvE8eLl/akBSrjVt1WVmQntUvK3Ic19zjITBAW9UMSma
 dPC/A5vcedtT0jugqCg==
X-Proofpoint-GUID: U5gDDMowg664rK2Wz3WY-iRe-sESY5hT
X-Proofpoint-ORIG-GUID: U5gDDMowg664rK2Wz3WY-iRe-sESY5hT
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a06f9a7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ksxQWNrZAAAA:8 a=sHlhyO_EBmxH7abWSvcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: B98C354DB56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107795-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 4:34 PM, Xilin Wu wrote:
> The SC8280XP contains a lot of TSENS sensors which are not yet described.
> Add the thermal zones for them.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Very nice to see, just a couple nits:

tsens0 11 -> NSP1-0
tsens1 11 -> NSP1-2
tsens2 10 -> NSP1-1

cluster0/1-thermal are a little inaccurate, let's rename them to
cpuss0/1 as they are not really bound to either cluster

and please change mem-N -> ddrss-N 

Konrad

