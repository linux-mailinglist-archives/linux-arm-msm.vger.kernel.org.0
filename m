Return-Path: <linux-arm-msm+bounces-108484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHXlD+1KDGrjdQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:35:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D272B57DB88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FE4130642AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F69492513;
	Tue, 19 May 2026 11:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlPDoPfX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhqdoxWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711D849553C
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190075; cv=none; b=NWekHNPjVv6xfLNGG37zisuAprfOU+tC0ALsyFjpuWvFpSEZj6q0nm+eMlbipaRhblBgiN1OXIMC2OPlDxBBxRx2RWFgXW5uhVao2Zqv2GAyDw5ArM7rNrpu/uaGtchnRzHIXDTxp9oe5t4IDT5LeBHSuKoxeX0RpHB5XWE/xbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190075; c=relaxed/simple;
	bh=o8d25J2khhRXl66J/BsGcm24W8v/vKfxRKzSLM5m768=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5jtNuydK+hyqXZiMm0Zke4S47fFPjqbYaT1M9k+F1uofU5oHP3nTivrSiBaKnqaiIMOSkB1e79p8k19Gli71gEg5l2KZ6DNJikA7jHGbanUOX98Wr7XXzxPHkt6YoJm4w8xD9oQWN3eFnThDX5W5wlVIVwTY3mg4PQPyDujtvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlPDoPfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhqdoxWS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8Hxh61146715
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=; b=jlPDoPfXjw/yjVIa
	Eqkxkk808s1uvIHPltfS5L3uRkmudsdFOUfDvhgcs4bv3ZmmkOg7HYEmKNap5CNZ
	qsOmNgAP9n7cNy6LAAqDg3LoSmGSoO9EP/P9byTTv+gp2/7qP8pnh0Mz5uqxK+7h
	SC7/jjXBva+u6rpfH8gNcOmK7VPNwBLDFXV2p/G866t3z6N4MGELwVkGpKzIp4cn
	EWgvy7SB9JMRA3ApXKRUHn0SU4CmyX5+gzien6OVbmsfTdKyYR/mcmo8DmYmR/Qv
	jsyPLyLeGbgRblL/kH1iYW6OcaK7FqFW4GS21V2aXy/lzGqS1OBMVh/B3AxWmiNn
	da5yng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ej855-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:27:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f1b94ac9dso15800491cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779190073; x=1779794873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=YhqdoxWSJMnrfLk8AQyDjUh0ld1g8oFq9PqSLaD5LUObUmFqXlg2AUyjFuFzHaFq5K
         zHtFT6C1E+d0eXcEN1ANKRXVqJvLHISgni9I6q0TFDJGa6uxxWfFwS2YNaYbDHEoBHlJ
         TtH4f61WO8Zgx57nJWPIgPVfrJ430awJ66A7ktdlMUgFALVDrex6TG3GCiNRGonWaQsK
         J4HlhdqzyDmlTZCwIPFOfZ/rlVxfLx58kDdXf9Yenzs/9sbK3jvZDFv8ULAKLYV6eTTx
         KXvs/rtCZJlMcDU6UFnlIvfiUvQDoi8am7lf/JBnJGXYDCXh8widmvdhP9LJelpgb9ly
         2wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190073; x=1779794873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=KpKQiX15oS48Qnpvf5Vu8qMq2hi4JDBOtd3YNuhWzHjAwyLupeq0a93ltCZUerO9vk
         NSbcNDo6AToT+JicUA5T7yPrlOjJixDNpXOLETezZKvGYPjnDNnLSxTU5+oh59ouMfwj
         fRrVy/axH2+MNwNJDJLYp607suCgDeP68IjsuJoBBuyYwpUsdmi9PcbK0+0it2eLtTxm
         FcesrIi12XKEoPktD9l53Ded2nT9rabXFgtlS/gEqGHHPneRM9JdhmPha72IiiOvmizS
         E3nRH1+iBwfL2+H0f+Bwi9Y+6Hibg9JCeZ6ZFuSv51DOrFUzK5rCdQVGM5YOHuZOLDq0
         CVGg==
X-Gm-Message-State: AOJu0YxG9/BxRyVbX8n9KTPiMbjuo3hFD5g4B8csxvMm36lUZXkbHSEX
	bIWLaTU/+r4DTOlgQ20zWvMIDlwldPjXm67gc8LSs5je921q6DIXBdZhLf9JUu4V2Wtw+kQWAiJ
	qpCw+E2PMfnhMSQxqayDiqUHyhJ2V+C50i/OOXuGJKiwEoSSoR6pgqjXrE12p8xwIy8Rs
X-Gm-Gg: Acq92OG7SKnIVqHCrz1s3Zmg/jwx0X7FC7m6VrEvlVPrMgcRzVmZuv6oMNk6mQ3S/T/
	irx9iDaWZKyHYpUvdPSfseW/CbSDe3BLIpqK75IkXPpXfTkZ63ICK533H9I8rqExaiUv//24hyW
	uMN/rPeEu645HOsLEeLLt6pVeOb2Z1uWfuXZ14+Jbi+l+ZNrbIP8XwPwobCouj0FJfBjWCpUP0v
	EPyHFlAA2qeSIxK3fouomYj3tG8PSjWTUewR7kvbREDruuPVcDEtQWM5MwfCzK16ClpbCxec3D3
	SSTkbTiFWjf7WJooCGcPbnM01Jg18L0NS8FaMHjpXh8j4drjuvTxTIacqTWX5m6Gi5ESfJSobdp
	jHT/EG/9SrZ7Mf04M4/YWh62XM0efy++NXWsbNL/g3t54QToWzoy+EnnPKrZZ/apUJ8/00nMfFO
	c4ajs=
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr197561571cf.8.1779190072874;
        Tue, 19 May 2026 04:27:52 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr197561211cf.8.1779190072396;
        Tue, 19 May 2026 04:27:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c631e2sm680570966b.28.2026.05.19.04.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:27:51 -0700 (PDT)
Message-ID: <d0fda636-b755-4ea8-ae1a-f57a4ce23566@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:27:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: pmi632: move vdd-vbus-supply to
 connector nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-6-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-6-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c4939 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6_Sr6spSlTavn73YIB8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: mSelSLYeCiymXO1p8S0GSmc-NR2xWHf4
X-Proofpoint-GUID: mSelSLYeCiymXO1p8S0GSmc-NR2xWHf4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMyBTYWx0ZWRfXwUjdOU2uQ03/
 SlZGhQNK15vNWqtW3k0tnc3Fie2Q7uRCtEMzQpskLkCyRsDl0qa3fykyLfFfzTiduB5TW/6YsCv
 5hOsEgyHnrGVl91Vdhy79aKty5jrYZ8YRD3zK998FACECEJTXfi/dsCOdqHtj3vJHImt3OEWdCg
 XFj7eoICkl3DRxzI0MUcVaZVNySHNu8/scmGrud8FreaAexRkgnsr1sHGs2/VAA9nO0OIAdm9K+
 QfOAYzuYdg03YcvbHvs+n14WMWFTutF9Q98kKDS1DHgeLl1y0W2NNwGJ4jVpsUHcF1RSM/h0uTh
 PXhtXCFPwvtGCXljdRfeqAGtXCZwQ09PhW9hZwXSi3WqhFvCjcYbs+1U3lBlEqwbFbtMelcL/bh
 GIaV4RT4V8TiHrje96m7S9sesR7x0xUM+QxEdBhwaU33VWHLvRCSu65AFKgk9CDydN43gF3To7D
 yzKFjI4rj53t3e5NiLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108484-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D272B57DB88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:48 PM, Dmitry Baryshkov wrote:
> Instead of specifying the VBUS supply as powering on the Type-C block in
> the PMIC, follow the standard schema and use vbus-supply property of the
> usb-c connector itself.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

