Return-Path: <linux-arm-msm+bounces-91522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAXcLSi+gGl3AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:09:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B478CDED5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2150A300F137
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 15:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCC036C596;
	Mon,  2 Feb 2026 15:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jt+KJczA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOg1g0DD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD9C36B062
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 15:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044567; cv=none; b=WqQoU9vObu2PlBXSX6bPr3qB412exeaGwCag4l60LlpnYu+5aueXjXhCqqEttJ6/JPceKOeN8YjN/vTPCGwynpt0zOfAX1mJ2K0aZ2m+t4GHqSQJPt9xlURuU+VFy6z4KV0f/JPgslQCGKLQvnyp1s9bH1u7O5lG8WOzgInFdMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044567; c=relaxed/simple;
	bh=itfRJHDz9lJeyAF3mgUM3enz69pJ0fTjxJlcJ6nTLZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MEPCK//kdGyY55kDTklPyS9oSLtDVBESSlFQ528lnIc/f01CbehJccRZVDoW8lXKulKJxP6MQMM+24//CbcHhCazg9oZNsADQYtNwplPKnkdxFh/pz18g9WgevQw7liFV3J8sUBvPWMjoiAPDkPiztveTY+mK7rGkFBAo2DJ0m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jt+KJczA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOg1g0DD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CJYas2884449
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 15:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KMMiAEvQ+clJBW6YBPI9jpod8sif0Y2dqJxSGpD68w=; b=Jt+KJczAajZAU4n1
	xu8n9BUY7xx/RloDgMhmM7MIkMYIkXz1lQKXjFf0pKZ0BZnEK2ZewblbDCGD9Nju
	0U2CYEdLBT/cN98E8ALqgI4eKGBKtlwJLr4tXZMCA4o/SjBQsHvEXoY2L0yTtM37
	3prWcVbyIv42e26aZ8W+EQUaoy1+TRPkUnajqJb7f5h+arS9nOSTiSF6ymX8JKgo
	chnyULMK/O2wZ6qLKU0/t22jV/oNm30OE8MrQncy/bJ9RVNuLSzVamLKNZSoPYWf
	l6UhwPy7k28M4qpj25vM8YZNnHQoskcz8Her+5ZtIDSqjfoFNYvPYMB3GbmH5KRf
	cwQACA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3gef6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 15:02:44 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7cfc9ab2828so1625673a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770044563; x=1770649363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KMMiAEvQ+clJBW6YBPI9jpod8sif0Y2dqJxSGpD68w=;
        b=iOg1g0DD30f0yQGm/nz4mRtBTjivx4lYLtNd//hf7JikGpNfmxwZ+99kvOezkK4jCB
         RadNQ/v/QbutXyBI8MRYDph3bB1BxgcJOtxLCJjTRmSjJ8HlneUwaI6Rf7qEiDizukYv
         Wr4DR6PqES3jChKRlDMl0I0HfWc+AsyqmYcYsohqCM408Ve6UjXOez1iUXJ9GVllX+c+
         q6swA3PhsjCRsVBegoqsA8xWJgeFh9XnLWUkW+FwiHxLL6uKXUH4AKrSmCTL8YqYpT6G
         UGTcXJbMaQtV0h2tmRzFxH67Y6411dc7kCwtZaHiSg4l/rg+uZIPkeTozw5sIAs3Wr5d
         bOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044563; x=1770649363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KMMiAEvQ+clJBW6YBPI9jpod8sif0Y2dqJxSGpD68w=;
        b=uYLg4f1+Pxk7zSJmvYY5YvkVmeaIpdf4dhGgq+7xaSa54iRpyZEgAd3DrKduXxpNXf
         FyL4BeuOCbym2RjDubO+Y5CO4WaDKSoYWFRjXIIx641IeF1HCOO3cDUa5Qcvq6LQJVN3
         S805KO5o1hijIFKUs/ZTlKLz+f7rqR1RUXVrbIDNg9Po5bOTu69pj/9xWjZmBXwTBEwH
         cvgQAC1KBORnnxWHBN/f4P/qP5C2IcuOxTGlNJZyt/WJOnmkqQr5A1WGcxojNQ6hl22f
         zoO6ALqNxHQrF7Iizymd5ddw1jDchL9aJz50fIjgq4XAT943pOVfsoXs1PWjKnW5KtLt
         XhHQ==
X-Gm-Message-State: AOJu0YzYnvAvcXl6osO//rs+xtDRUCALAYX78qlIjciaWcN9IAjdxZr2
	9htYfTmOYpEWUJyktBgfc8gF3bWxFEZLMyx1wbccdgKScf3Z9BTT5RVgiZ9KEyhndLId7KcL0xC
	EtJ2zeZUr4MCZdstx/70V78x+hhD05qddo2gywK5E7kuqPnAuv/D4ab7BBCEteOUQJUrO
X-Gm-Gg: AZuq6aI381hyCdaorsZPtDkpz13R9fUC2z2yBwcgMzXqiw3OrgC+5IkD5JxY92Tp35Z
	kFqkC52zjQdthp00HIslEi+NB523pXF2lAk+96ZmmqXsjZOU2vLEIFOCpwd3ba4mIp0toc7j3sr
	4A4bdJ8n4NjqtFXDwsQ5WHOwOL7Ha0iAM1tuSfJWuhMUV+H5zxNdpAvSspYNG9a3HgJWhztqZ9f
	6yaNGlZPr0Tca3PZ6t5PVFSc0zwUlVPfXJ7s3/ATIYFws9kSdjBwGxYCNYYb3KMWE4EJyIKfA8Z
	vBCcaLpU7s39pVU8bM0t4cylkW07z2Fqjn+bfbWJLi0z3qCVXDiPX4IE85XHdBI894NfbroJ5qp
	9/6wQ9JyYnTj7V5KaUM/ILZHBSWRvZ8heB/VGfYmzDqF5Q7gul8s4/loW0Yo69i7cRdE=
X-Received: by 2002:a05:6830:43a1:b0:7cf:da36:3d3d with SMTP id 46e09a7af769-7d1a536e341mr6027179a34.6.1770044563593;
        Mon, 02 Feb 2026 07:02:43 -0800 (PST)
X-Received: by 2002:a05:6830:43a1:b0:7cf:da36:3d3d with SMTP id 46e09a7af769-7d1a536e341mr6027147a34.6.1770044563018;
        Mon, 02 Feb 2026 07:02:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc655csm869765366b.19.2026.02.02.07.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 07:02:41 -0800 (PST)
Message-ID: <9d53901a-7ad0-400b-9952-ad502ea803a8@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 16:02:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: YijieYang <yijie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
 <20260202073555.1345260-4-yijie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202073555.1345260-4-yijie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5ss7d7cQUakoEXV3XdumIhs23sjJO_GE
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6980bc94 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TSu30AdjdkAtlEphcj8A:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: 5ss7d7cQUakoEXV3XdumIhs23sjJO_GE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDExOCBTYWx0ZWRfX9j8cu3bgjtYK
 11c3WSGhgMHl/KAFpZJCcKqHjA3YxynAnp6lhznpT8ay9XSB0z+lIrciCi8Qfv69O7u1EFQ+Evn
 qwPbZgyB+rlLAMjp1YgDAJOTVhKoampkWf+JuZz1Ss4r1UG+gv86nDBcgOQ3Qpc8SQs4Y2fHszp
 8k0RA8hT7OhvPDhokmvTAi6l2PGqTcjydXwrXopoxmSBnP68MX5mHZyLoAFd3NhFnz2Hu+HtAbD
 quKp39HjgxJiEGSaxHNYzF0KK8tZO4kgqYdGgwOmKFbzPt4iVA+kAtLxm/V1l37qDihc6p4y8r4
 EuE2rMotquqKm3Jl7GB8jlJsazca/haKAX36f1xltP/e/zj2JGhHtnjAT39eOeaAUEhSdtBpBkq
 12W+sCIhYBtJtdsdmxEdwTaYGhcjahzN8vuA0Ltkf/fnhTwL0ZOzi1UM08UGaPDFebk6/nmx2Bn
 RYjjNbwCEqweyQFGl2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91522-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B478CDED5
X-Rspamd-Action: no action

On 2/2/26 8:35 AM, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Purwa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.
> 
> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
> Meanwhile, USB0 bypasses the SBU selector FSUSB42.
> 
> Make the following peripherals on the carrier board enabled:
> - UART
> - On-board regulators
> - USB Type-C mux
> - Pinctrl
> - Embedded USB (EUSB) repeaters
> - NVMe
> - pmic-glink
> - USB DisplayPorts
> - Bluetooth
> - WLAN
> - Audio
> - PCIe ports for PCIe3 through PCIe6a
> - TPM
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

