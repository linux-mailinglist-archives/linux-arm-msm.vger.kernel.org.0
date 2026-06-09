Return-Path: <linux-arm-msm+bounces-112113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IDeyAo/lJ2or4QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:06:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8389E65EB44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:06:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RaBrytJc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CIb7TJdQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112113-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112113-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 768173020EDF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AF53D5253;
	Tue,  9 Jun 2026 09:57:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FA43B14CC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:57:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999036; cv=none; b=oOSwICFZH66eyCJEj9A6VrlF2VJNOXKrz+A9TRw2+hzsvbVzp6PhiM3yuAWo9VLqiet/Qovi4mbpWFGSetNWrWmMRGBrrxg4JJRzx+lK3e78aNZuZPX7zyPGO4mHwDx+Pkj26xFOJ+tid+h2xEYsvUG0jGnJHt7aTffXUPDQrxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999036; c=relaxed/simple;
	bh=l/exZGynhFniJ4IOReSaddSkbCSs3Th1uTqufpftfQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svq09Va0JDQylMYbRsXcWhx81MR2Zl6mH3jRvDjvfhe0/Aslouu+ON0Z7HxNqCGskqLHS8t+iUHV2fZrO5LJLCKvYfkhfccmeKi6V2WrkEKJYy6ii2XoILsDV3ZJBAH2znE+6BBSyGgMbNJdl5Ysaf6pzb0SKHIr7sqL3PJEL+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RaBrytJc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIb7TJdQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vCGE264332
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWJT1a+F8ivTQleEWMwYup4EASygHT710sf+q+SVdxY=; b=RaBrytJcs9g+wY1B
	kZZ97LmO8KApbhI5jz+LhwtIguW5xr2a7MMmqWX7vKwakyrIQMMmf2ehgleFqfH3
	rxHjkMYXGNGCDXu7IuXWoiIXD/LC2F2K0ujkXTbyp0VQvq9UGeDVLqZjanfiL+t2
	n6TOEJlCGzeDzKysLv9kF5qt4TYZPR+Inbo1ziHEn56iGSJEtcshxBJ3umA96naz
	ndnelebxxz5d78djULzJrUNw851SVfQ2TcAVFi69We/L0CPtj7buUzmVolfMr8li
	1yfLgFR7LMIZya7IuDNU9r7OVpXMkVAz+HrHd7MURpfv9eiTeCrT7OlImPL4Pp8j
	BRpzcQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0srex5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:57:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51757324dcdso10959581cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780999032; x=1781603832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jWJT1a+F8ivTQleEWMwYup4EASygHT710sf+q+SVdxY=;
        b=CIb7TJdQKCksE7WbnlYK40pVytbq5FmFJ4By/hycRagxZJk4ghoedVRmQaa1ULGSJd
         JR/jUNYHogiQpy0kks9njvz892TdHT0sdluJliqvCfTuO5V4bOajvkdmQHB3ff1SMJL3
         hlMli/nu+zI5Cwt4f56uLgtuWbV5g4p7cruCKsZi41hls/Jd5IiY7e8ZWLJYGAiCxTMu
         oAxeOcBKPW8nS6gfS5GGNAztKD0QX4pmatpJAKqeMWPFzi4O1CLhfllOkpXY8t3dCucE
         5EAo54g2J/liuaKL/T2VrkqHhQBG9TNQ45dlFUKPwNPH+AmXf4K7PLLSXyo9HuWMhMU8
         94QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999032; x=1781603832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWJT1a+F8ivTQleEWMwYup4EASygHT710sf+q+SVdxY=;
        b=bntZRgSocwwS/umGO9qTirOvfnU03NpLgdHdovppHHbQT0sf182vIRg/e4WC13B+gT
         kMPjSPt2iXmH2Ey22tXiKVXdHRZHqJ5cqjxfYXrZwRvedzCyqQ82fqPxBMrlwSttwLOp
         V4RMsjuIoq5LRS3PEgShrHyiAV1xDYLyBrEzdGrAkj4GbDpEM9NBLni7I/treWPFLtVc
         A9PbPW9WPv5N+gJRFnigncyBAtACZcxfeG3YmWHpA2DK9pogo7Usp/B9hvj/JB9F7ula
         IHvOFCFDRDBHxnf/XomE3jrs9fSjKCiHyJN0lzRH2Y1xX9iDproMZhCu99nRKCeviaN6
         FjqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9c6xGFircMGRO/nnlgpST6mCY3/Q4PmZDTOAx62SbPx3+bHeyPgwyqfCjrG+gzQZN8hSzSm3CHQwSWCPXA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+hp+0PAJn0DllGInLtyr+HNBCrPIZFuT/XoNBoveKss6bodhj
	4C6oysF+xdZJCDpwbSICzZFImg5qFRxed2MNLYcknn+aTApGtdQ8DxOdI4Xd0sEQm2VwR6l5BBr
	MCk79yTn22AA3BswsWGhTEJv3F84iEtdvweROyEtmsGjw8qLClqU0rMhJPXTf4STHkFeF
X-Gm-Gg: Acq92OEDsk+1Kn6dalrB4jjZLkrxaRoKssdCk8dkhJnvhEXlOqY+EpxtzoYdpyuFwBv
	1HM+0hrxDNPJbCmqjlQwyf9FHgL6BsVPjqsLgrrwrl6Jl2WOZfusFtNfLmjSc9M1aGclsphYsuK
	R/2opkWQf+XjYhihaeezHe8o0fbl6NdZ+Jrkd2t7qj/B9noOhwQblG/5KT6b4PBiPJY1dz+5Fq0
	i84/hZjv0FwUQXBZfcsBMq/unfqtzMOBa0lbOVn8cscYBVJu+nZQVTZRXS+fS9NgcpqanrrNNwM
	bS/NQhUC9Jg1GLB8dK38HYA0a5eyypLUP8ko1NfGP7Jjxc9bIN7xtEodjGhFDg0znKU3VUDzXE/
	j2OVRXC5WQrzcCO0nY1dLKp5mI5xluasTkzHW94S1DFjxnxsXYJvu3y8i
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr171478281cf.2.1780999032533;
        Tue, 09 Jun 2026 02:57:12 -0700 (PDT)
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr171478091cf.2.1780999032144;
        Tue, 09 Jun 2026 02:57:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051a5sm1019894766b.35.2026.06.09.02.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:57:11 -0700 (PDT)
Message-ID: <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:57:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MiBTYWx0ZWRfX8E9UXNN/Vn7G
 gyYhvJjtnM0JO+fwJbxvT8vvkEFFwiv7G3Kdoz7KZP0C+XlOCoNeHYat4GZXVHIP9tp6AYhVYQy
 JIK0b9l8q1kicK987r48Iim8gNU4vAbdbrETwvKhqGPy7vnTiOp2PvkEDIJAnsMLa14eQAUcEFj
 fi6u96464M91wx31mJixi3FVMlTebllmW9vWE7ABzfZleLV141qkgeToHCONlnxzhxYZ3ymhl3Y
 3sYUTEYVA/vTnRJwCc0Z0gdANffSQMqLH2Z0qVHdTeD+QzqZjjjBFIl0ShjK76RSUONx1O3jVHz
 5UTYYB0ssQlc0Ep+kZ7lim3VDR0lv7mBB9MfAqrfmieJxFO7tzE55kT2hHXdNTVDXUdiRkxQd4L
 1RmT72E2JQFUfYcpZr1t33vamJf25wGY0CBuO+ZnI4KlPxWCdEbVOO3HmGmrlRU/VMHb0mgJa1G
 0BPweG9U6TUR8VOSv4w==
X-Proofpoint-ORIG-GUID: B-O2Z_oOrxWxQs5fYmrjS41J0h_AOMUI
X-Proofpoint-GUID: B-O2Z_oOrxWxQs5fYmrjS41J0h_AOMUI
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27e379 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4Sww1aU327frn4sdWmQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112113-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8389E65EB44

On 6/5/26 12:37 PM, Harendra Gautam wrote:
> Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform.
> 
> QAIF moves PCM data between system memory and external serial audio
> interfaces through the AIF path, and between memory and the internal Bolero
> digital codec through the CIF path. The controller needs a binding so
> platform Devicetree files can describe its MMIO region, DMA IOMMU stream,
> clocks, interrupt, DAI cells and per-interface AIF configuration.
> 
> Describe the single register region, one EE interrupt, the required GCC
> LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@N'
> child nodes used for static PCM, TDM or MI2S configuration.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---

[...]

> +  clock-names:
> +    items:
> +      - const: lpass_config_clk
> +      - const: lpass_core_axim_clk
> +      - const: aud_dma_clk
> +      - const: aud_dma_mem_clk
> +      - const: bus_clk
> +      - const: aif_if0_ebit_clk
> +      - const: aif_if0_ibit_clk
> +      - const: aif_if1_ebit_clk
> +      - const: aif_if1_ibit_clk
> +      - const: aif_if2_ebit_clk
> +      - const: aif_if2_ibit_clk
> +      - const: aif_if3_ebit_clk
> +      - const: aif_if3_ibit_clk
> +      - const: ext_mclka_clk
> +      - const: ext_mclkb_clk

Drop the _clk suffix, we already know they are clocks, as they are
listed under the clocks property

[...]

> +      qcom,qaif-aif-sync-mode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse)
> +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
> +      qcom,qaif-aif-sync-src:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
> +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.

Should these be boolean flags then?

[...]

> +        #sound-dai-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
> +        status = "okay";

status is "okay" by default if unspecified

Konrad

