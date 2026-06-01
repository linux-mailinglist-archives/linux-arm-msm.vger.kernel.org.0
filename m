Return-Path: <linux-arm-msm+bounces-110514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLI8HbQyHWqtWAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 09:20:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DBE61AC98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 09:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E6003007B29
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 07:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476DA38399B;
	Mon,  1 Jun 2026 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nafPpfUt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blFyrKim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BD43603C3
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780298412; cv=none; b=c+OvXGhrx1JWGERvCyZwAaFaLs3MTHetZaja4WJ3EWxVIn72FDEKunGCnxu7YiUHR4M6P/VpIqFP+PIXGdZHOMYndE5Akmr2KtoROc2s6lGftVO+n38NcjaExtgCZIqCLDDy3bP9KU1lbPinRW0oGgKPFci6CDOodGiQ+A36ca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780298412; c=relaxed/simple;
	bh=shKWeWBNqVXhBY78Tf+SHIB0H6ZMVUTB8vM7G1+QeCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asKLEedqiRy8bh0IE8RcjWngqedrKNCSgck3zDcWD/cgkqBK81WN5htSXWIVmqia0gsqyaZO2CS4+aSem66yk6WGCOETjdQ2XtJbhvaK/sdHc1s1P3oE3z8SJFwWslE8KWiHnKwKeO9QO+ANexzVYmU8vQddZHT5VXiuSs86fEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nafPpfUt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blFyrKim; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651131cU3134299
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 07:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J50RySh8GMKgXOqEW4ylYPugbxEDez5rKbb4C33+2zU=; b=nafPpfUtEhCuDlz5
	bq5pFqG1HLkseLeV/aLNDNvmMm7bdEhNaeixMXhfqBe84PdCisO2PhhUwiWqqUpB
	QL9WWQEhs2mj0BdupbqOR92Nd9lacVoKVMeuQryfE/pckDTRFxhsV3vcvuEqni9m
	p7WwZdlwdPIVdeGuXs3dwEQHvT1hZF5IkLV2/2e4WTP0pwoE1p7dUrXTH4RH4kK1
	hJTQyc/o/glDcyuSoYbKGPdev54egoOjxMAk7dH2K8n3ZQBHOF+DiwfOBq7ZqBB3
	Xjq59lvyeYxfyx5opbeoVdZQunz3cEjAqrHoaQbaKjcBJ1SLm/G6Jqav+/h1129P
	14Fvpw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7pdfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 07:20:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8424aac207eso753198b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780298409; x=1780903209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J50RySh8GMKgXOqEW4ylYPugbxEDez5rKbb4C33+2zU=;
        b=blFyrKimj24lqv90wkcSsHHOfuAmat846ekSdLrmhtkUz3d8ZFbj4UMdjsAYIYk0tL
         dn09vlh+hK3H0iUl911El1mJzz9qoO3E/4TPpGD96/ryajupZS+eHxXzmgt1ZZC8dIx9
         33OrlOSeqBoETQTmRjEY9WBlUrTTF2Bo9Hopwtl0B4mqCrY4vq0Kobi9fk9ME6kCYhEe
         9G6WP0TOPdAUKnXeUimBg+zoCI+dOrdi/4WjHm8+0AjCDkyNfnkSPp33Q79c5QPf+O71
         t/klz4sfzwtJqcv05Hvb6Rt51zMuumfFX7vsiDsfLSGLvaE4z/VVBDuu19ax3Hhj9Rsj
         +WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780298409; x=1780903209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J50RySh8GMKgXOqEW4ylYPugbxEDez5rKbb4C33+2zU=;
        b=N6tqCboWkdxCtoANSakL9twpz4Cdh4/+0YLrLmQhiwgQpLqXLAFXFTD8mDyylIk2Ep
         TEnBksZMoWinH/vlk54co757Y9jQcEMABs0t6Fd+lVjRF4LQNUAW7JoB6E7IJ892uGeU
         IQiQD8jAHv2w8neFaaYwpyu9YD2ZXcLRtM8iwflN6s1+ug/oclaX1VJdzTXyveOOkqY8
         3crGJXqXD/vujEXgL5LeEqMlXCNc26k5F8eXKnxvdLhMp99VoARx4Wg4IiPUdgdt3PVG
         LbfaQ9gEHfEhlEMa5sMhf0P0Z1BnWHesbDC2HtvM3Dtqkgg5Wo3TGK5NWh3WhmfvAZQU
         PvOA==
X-Forwarded-Encrypted: i=1; AFNElJ/6UG8bN9YS+h79VrW0AypN3zeIdmbaP5Kbq3XNcLUQEW7Y6sNvJX712j5w4DftdiQAAs8lufR8USwdo9lL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz12DDK5tdxq6VxltqVaznLBsagqhgm3US6H9b7YJCaiUJvnqYL
	V/c4QrtARtHa+l/TxTsAfdlsaeqbcb8NRqh90HfTuYbnGdxkOl8mlDtkV5snUv42Walko8WQX7X
	sUW6T98jb2r55ObslELrM0R4BF5hrzoo1h6mHdQ3aTHDEEIBEx37cilKBRiB6ZiKCyZYA
X-Gm-Gg: Acq92OHzSBKaIY3FVTuVn8vH72TK7Wo5n1XZ5HdOMZqWXpCR8wy/Memt6ZGbRIbmKVn
	EFzpUq+YZFtRINA8+lHx5JQQTm+cBD6qaltCmWTh2+ZKHjSlluLisOeUSzz836hiQfIHWeihBfb
	Jcvm7vp6gfG7MNQ0qgXRtIsjI8JD1seAGYBr4cuh+cF0l3P7gN8ip8/RXwtNivRitczBxd1tV92
	FuSgqoYI/fik4MADrMEvzi++fu8eVDdzCaykfTQaeIiRBaOyQxN1qi2BNhB1nrCcqFUdtl90Bg9
	MHk4HfTb13RgwxrORPXQm/w7GM+sBQLnp+7HaWr0Vno0OVFxV+JR1Br8RHSAYfsc7LsYLAxscx6
	4E8fe4Dm9cO/RO06brSojXi0cqE5Ei6/OfaiPZZm8T5tBlGMXkMr4aJKsnr9p
X-Received: by 2002:a05:6a00:a223:b0:842:5931:7b8c with SMTP id d2e1a72fcca58-8425931803amr1870528b3a.1.1780298408614;
        Mon, 01 Jun 2026 00:20:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:a223:b0:842:5931:7b8c with SMTP id d2e1a72fcca58-8425931803amr1870478b3a.1.1780298408142;
        Mon, 01 Jun 2026 00:20:08 -0700 (PDT)
Received: from [10.219.1.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423bdd217csm4479368b3a.49.2026.06.01.00.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 00:20:07 -0700 (PDT)
Message-ID: <6c06e372-85b4-4207-9bb6-270bd654c287@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 12:50:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: bluetooth: qcom,qcc2072-bt: add bindings
 for QCC2072
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529175342.3363935-1-yepuri.siddu@oss.qualcomm.com>
 <20260530-funky-mackerel-of-current-878e2a@quoll>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <20260530-funky-mackerel-of-current-878e2a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LGW6X-mMx6bG1909zy47QXT7myA5p18I
X-Proofpoint-ORIG-GUID: LGW6X-mMx6bG1909zy47QXT7myA5p18I
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1d32a9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=Ey0t84Mziqqm43UOVh0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA3MiBTYWx0ZWRfX4XZ0sQfpJiBR
 NaMue5FfNYIKQNtMHT4hwoN0mu3CWpsqaJobOekyhoya3gxGea3zHohPGh3r0prOP/IqFg2Atmy
 R/TERN1N3+RsMuMCxsklCF0Hd6+IC6XVszWoxwIrFPhc0wVESar3KtDIT58bEfxc6/GBVuiIMz2
 idd+bofMaMnjBRF4DI5rdd5ShIkXfsLtuaph0gzKuMaNcYLZCwgKKEqGvzF+bwisDv7LPbEPreM
 +8e24ENjAbwEfFBnSddjzoKgsd+nAVrZ7VMg52Mdw8SYeqV1D5i8ZPDiFLjxclKSA7i1pGNjPz+
 emC9Gd+6p8xrxHSYlSn5kV6iqzi1G6znXZNvdaD9//wZxhM2fFkSFASKW+qmCGm9J+oHmAhCxc0
 NAqqQZ9h8mWUeQ/gwpqaxS6IDybcpp6+ExkMdiiSlAEAfQlvhzGR7My+ycJ/P/WkCNx/+diGUKt
 qApP9laAbkk4+ImUlBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110514-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,quicinc.com:email,devicetree.org:url,bootlin.com:url,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0DBE61AC98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/30/2026 6:04 PM, Krzysztof Kozlowski wrote:
> On Fri, May 29, 2026 at 11:23:42PM +0530, Yepuri Siddu wrote:
>> Document the YAML binding schema for the Qualcomm QCC2072 UART-based
>> Bluetooth controller.
> 
> Where is the rest?
> 
> Also:
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
Thanks,  I will update this accordingly and send a v2 with the fixes.
>>
>> Unlike other Qualcomm Bluetooth chips, QCC2072 requires no external
>> voltage regulators. The schema inherits common Qualcomm Bluetooth
>> properties via qcom,bluetooth-common.yaml and serial peripheral
>> interface properties for the UART link.
>>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> ---
>>   .../net/bluetooth/qcom,qcc2072-bt.yaml        | 38 +++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>> new file mode 100644
>> index 000000000000..8e2f15a75d62
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QCC2072 Bluetooth
>> +
>> +maintainers:
>> +  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
>> +  - Rocky Liao <quic_rjliao@quicinc.com>
>> +
>> +description:
>> +  Qualcomm QCC2072 is a UART-based Bluetooth controller.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qcc2072-bt
>> +
>> +required:
>> +  - compatible
>> +
> 
> Looks heavily incomplete. Devices do not work without power for example.

The module receives power through the M.2 edge connector and manages its
own power sequencing internally. Unlike bare Qualcomm Bluetooth SoCs, it
requires no external voltage regulators, enable GPIOs, or clock supply
from the host, so no power-related properties are needed in the binding.
> 
>> +allOf:
>> +  - $ref: bluetooth-controller.yaml#
>> +  - $ref: qcom,bluetooth-common.yaml#
>> +  - $ref: /schemas/serial/serial-peripheral-props.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    serial {
>> +        bluetooth {
>> +            compatible = "qcom,qcc2072-bt";
>> +            max-speed = <3200000>;
> 
> Also incomplete.
> 
> Best regards,
> Krzysztof
> 


