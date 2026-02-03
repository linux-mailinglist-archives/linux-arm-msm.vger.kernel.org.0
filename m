Return-Path: <linux-arm-msm+bounces-91578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE0uDI97gWmOGgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 05:37:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 528ABD4707
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 05:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66BA03002F56
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 04:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE0A19D092;
	Tue,  3 Feb 2026 04:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ie6s0gDS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8Q/cLxK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574AF22126D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 04:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770093449; cv=none; b=Eifwt+/+zh6rzWh9NWBWmenXw/h+mZ/0Hs3PE08Xw8beeRrSx5zbyoudqXJoyP2/N5+qz5cV91j2nlONKOvV2BqrlZptsy7+NbVfAqAEkL0SMPOScIUKgS1c6vdpvJzKh38nSrI5qFEK9FbkEb6O/fkEvksCDwQitTKA9QeJpWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770093449; c=relaxed/simple;
	bh=zLhE0RW0NZylYhKvTkp+IqmliyhBD4c5dP75SGCxvao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2RtnFGdR4K2YpSCz1NzHAj/k0s/PJDJvzMbBVW4VSw56+n5Nj8xGc4a99uAu0mhwIqQbAvn+bMADk27sKZ9OaXyzBC9Uc5rGo9/kkNGLTS9HY7FwRRekC9oay8fi+Kxh+StX7vkng39/9WrIZ7E6f0PjJkyjOoFgY/NnAnwohI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ie6s0gDS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8Q/cLxK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612IYUiH2100258
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 04:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9RcJ4mSwuW7170LSx3yMtgBS7L24sa3Tcu4+H5j24SE=; b=Ie6s0gDSBxSomd+R
	kgOsIoU/ICGN4OC/BlftcJptL7DVaeGdXT9PX7JntUTafzoaZMznGIj92Ov18I4b
	9QZQmESNtfx8gTatAA654rvAUAUOYAXojR5tazyRU+wXKdRGcX0Z3Us6lmvLqaV4
	N2kdXd2027Fx+UrZrTJkh++CjekUH8w6pVsFoqu+rBG7fLEwFUmR0rLqbVnX1V38
	cuIqwMlTCWAe0V0WNQCdcciPbfnYu/H+8exIfITZznOj0lCHa2/idCDxqILiELs/
	/dyLX9xdsjcJFhYrnVD4rGexlkl8vLCz5UyZTmCHq3MU/is0GMxfumePqAPcZ+BL
	7Hq6VA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2t5eb0r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:37:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81e81fbbb8cso5000563b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 20:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770093447; x=1770698247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9RcJ4mSwuW7170LSx3yMtgBS7L24sa3Tcu4+H5j24SE=;
        b=J8Q/cLxKKHGxtmKpen6bKxZaS+R4vziOXfG95GX1KBmShxtz6VoaOpZfqMFy5pY0aX
         93DNs3MoKS5+ZL/VSzi9ZCJlzOLvgr+WAiu0+Gxoytfh2aY9C+vmlgvQQ1RsYTuPW9ek
         zL5n5TUwW2hYuJ4I0gjrVcnQQOGsVW7966Dq5vDVyuYb4jXkFnvxiUv5fauQrQvPBLSQ
         lC8brS72aIDDXhZ/eemWA+TieihupSZK5ZoiCn2+36K/RnUKKrZ0VB0jfJT/Fam8U4KZ
         SpcETBd0vn/EIlyaDRxLX4Y6Q6ZJiLryD/IKfHsyUiS/lioyQdSr5HPC4xm5tK5ssycY
         cdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770093447; x=1770698247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RcJ4mSwuW7170LSx3yMtgBS7L24sa3Tcu4+H5j24SE=;
        b=qMTh6TPuF9bH5ktN00PKTORPyqhLhcwIZdeo8TAeC2xNbOBAsfdrIVMJQXmJc4jH6z
         kWkqMpJUZV3y8dvF3INAxn/iLud9YxdCnyq3LgpPdqlO6gPGO9wfQmpvh1S1MQBmeQEn
         PkoSG5qTz+u8W8XtfigN3ogbePAtxV3eHQu4yUDC/738Y9QAJAGVmRIgZQUxiFMUiuH/
         azwjYS0ADaaXv+y8fGZr7X/xFny/uKRuKHLr4+eK/3A71Bz6PyTLaxqWk14Cg6vlmdn+
         d69guw/hKHDltE41jQ7b3D3o9k0R+iAnCZkbeT2N9akBfadB8Kp0XAzQnq7rFCuNCsbO
         MaPg==
X-Gm-Message-State: AOJu0YyibPipTAlvljXb4cWPCwv6cmQKyQkcPt/0Ir1balIvq06JEnXO
	emnET2M6tpxmYsX+D/Iyndwua/kNbqOYXJxBfMdq66cdvCAKxZqxgI0mnCrJyvIRybLVACCcvly
	CEzdJFgGZdI5qgHmx7nn/yC1LMoT+Xft06U/OLbBpkKImJ5tihHphdjCZDrHmgloVkDQV
X-Gm-Gg: AZuq6aLGM5es3UJRL7Ke5TrUFjnm/iAEI7M0GKVMDmYk5/gUaeSkpXXSAkh4fAp9fcQ
	5udeeWrpiPJenkHJ4cGfr5SSCbTpKl/bjUzZdfsqgAqHsnLc5gAt4oATpy7oO1CA0xAZXmxWRJs
	YJWUq/QYfA52lFvZo7z/idmDjPoph5QInAI2+7S7UcNAVHWFYGsVSHQgClNJSUqgA3CXR1NIhyL
	w0fZQ9etrBEMRYmotzI9loinJC8ZrL/42KTALxdMHNd8hi23Dm/g8eRHEyNZ4tXGR/OPQLbjFYS
	FGhkfUQAxrUVhoRR/PicDhM+43A8ITtX8BpQGGLZBzkmQS5JkwJ0VTEPcYk1UvDXzzOr6VQxO/f
	Z+75JT3PDFom1hBWeEESK6SP55wVtf1Ic/U5kI79JY2ohlg1I3AxATj19MGPdzWZogkSiYtysxq
	FZst8=
X-Received: by 2002:a05:6a00:4c0b:b0:7e8:4398:b36d with SMTP id d2e1a72fcca58-823ab76f49fmr13627846b3a.64.1770093446862;
        Mon, 02 Feb 2026 20:37:26 -0800 (PST)
X-Received: by 2002:a05:6a00:4c0b:b0:7e8:4398:b36d with SMTP id d2e1a72fcca58-823ab76f49fmr13627829b3a.64.1770093446384;
        Mon, 02 Feb 2026 20:37:26 -0800 (PST)
Received: from ?IPV6:2405:201:c409:b03f:1dee:4ab6:7c98:fcd7? ([2405:201:c409:b03f:1dee:4ab6:7c98:fcd7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c21112sm17072133b3a.54.2026.02.02.20.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 20:37:25 -0800 (PST)
Message-ID: <62860c39-18cc-4db7-89ab-f85a39e67974@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:07:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAzNCBTYWx0ZWRfX/vJoANsDElYa
 Rv3eZU22C2Rvg/7fFnvriUZAc6vCD+OBxvtOHt63tpoJg3tGNUZmVnu9Zvc2f1463k1i12UcYk1
 kmdF0jjctT+C+RQOz2Md9tn41cdMkWJCX5RzkA4CLk28XrpBq9pH3qEZTmEx75CdoBezBSBYF1w
 uGfj70UeeK8go8o9QKFQFJyJj37kh9Goiu8kEIreyu3GDJXpxlAiIlVbp7kB8epvIhOUfl1u6on
 YRBK916u16GXrLq6btd5yUNy12y5cgYbLIzTp9I/SZsbx3FMMNB4uYMvGVPzIXUqDjeADHWoioc
 CFWoxGfPe7c4ZoEWVOVaNTUW/bgYcrCkRqRQ+j6CV13pT3KQRnGJLhWb7wPgYQu1hzr7IaNX717
 jDc3lnZ2e8PrWbRJ5DWTMDJGzXrAOTLAqqOI0VMX3Hsq9Nwot0zV+e25Qr7LDK0gJn0SBD+ZsY0
 Uwx1J6huVIhbtQLYs/Q==
X-Proofpoint-GUID: tB9--AjIDVFEWM_76jQ-b79ZDaW5uAQG
X-Authority-Analysis: v=2.4 cv=NOfYOk6g c=1 sm=1 tr=0 ts=69817b87 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sYISKGJa3KB_DH2wkrwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: tB9--AjIDVFEWM_76jQ-b79ZDaW5uAQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91578-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 528ABD4707
X-Rspamd-Action: no action

Hi,

Apologies for the error, this is v1 series.

Thanks

On 2/3/2026 10:01 AM, Sushrut Shree Trivedi wrote:
> Add nodes for the two additional TC9563 PCIe switches present on the
> QCOM RB3Gen2 Industrial Mezzanine platform.
>
> One of the TC9563 is connected directly to the PCIe0 root-port while
> the second TC9563 switch is connected in cascade fashion to another
> already available TC9563 switch on PCIe1 via the former's downstream
> port (DSP). The final PCIe hierarchy on the Industrial Mezz platform
> would look something like below:
>
>                     ┌────────────────────────────┐
>                     │                            │
>                     │                            │
>                     │                            │
>                     │            SoC             │
>                     │                            │
>                     │    PCIe0           PCIe1   │
>                     │    ┌───┐           ┌───┐   │
>                     └────└─┬─┘───────────└─┬─┘───┘
>                            │               │
>                            │               │
>                            │               │
>           ┌────────────────┘               └────────────────┐
>           │                                                 │
>           │                                                 │
>           │                                                 │
> ┌────────┴─────────┐                            ┌──────────┴───────┐
> │       USP        │                            │        USP       │
> │                  │                            │                  │
> │      TC9563      │                            │      TC9563      │
> │                  │                            │                  │
> │                  │                            │                  │
> │ DSP1  DSP2  DSP3 │                            │ DSP1  DSP2  DSP3 │
> └──┬──────┬─────┬──┘                            └───┬─────┬─────┬──┘
>     │      │     │                                   │     │     │
>     │      │     │                                   │     │     │
>     │      │     │                                   │     │     │
>     │      │     │                                   │     EP    ETHERNET
>     │      │     │                                   │
>     │      │     │                                   └──────┐
>     EP     EP    ETHERNET                                   │
>                                                             │
>                                                             │
>                                                   ┌─────────┴────────┐
>                                                   │        USP       │
>                                                   │                  │
>                                                   │      TC9563      │
>                                                   │                  │
>                                                   │                  │
>                                                   │ DSP1  DSP2  DSP3 │
>                                                   └──┬──────┬─────┬──┘
>                                                      │      │     │
>                                                      │      │     │
>                                                      │      │     │
>                                                      │      │     │
>                                                      │      │     │
>                                                      EP     EP    ETHERNET
>                                                                                         
>                                                                                         
>
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20260131-industrial-mezzanine-pcie-v1-0-b3c2905dd768@oss.qualcomm.com
>
> ---
> Sushrut Shree Trivedi (2):
>        arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
>        arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1
>
>   .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 234 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  12 +-
>   2 files changed, 240 insertions(+), 6 deletions(-)
> ---
> base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
> change-id: 20260131-industrial-mezzanine-pcie-75dd851f5b04
>
> Best regards,

