Return-Path: <linux-arm-msm+bounces-98179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDzxMDteuWnYAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:59:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 285F52AB517
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E5D2301E979
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67063D646E;
	Tue, 17 Mar 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHvg/9fM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrsZXVyG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9EC3D5247
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755893; cv=none; b=lkazyaNq9c7regjXj86fl/1DRsuNPee0rqqLcu0lO3FIHza6qGkUYjXjGtLs/7t9ikSLM1zo8qqGwGlmeycKBVzwDkttW/FAuuXOKnOLb/W8O+NGBfCsNYlKpJOWZwuIm0Ommb+YGaDQJtbB249tYzJDD5UIEgWCB2G9DdKPpkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755893; c=relaxed/simple;
	bh=WaxUkrcgefqUcF0bI2gimZQYQvRllURqGdWwvyMntEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfRuKMp2f5JHSo5W93htpKLAfHfEQEvMRqh6hGLZrVgU03RF/hicGdTFoJ1mJigfRw40rB3mDGxL7OlmvwxpxDPR1iNTNMMu9ObX8J2+cHV4tfK/7qFTxCGzvbptBO2FGLKMScNFjSeoan7YUkYTuzaRte8gorJUIU0nlyIC5uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHvg/9fM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrsZXVyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HD01TZ1639402
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 13:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MokF80me7tXSqWsIgtIcUUI5pdqXPofc5xpgp1OSmy0=; b=cHvg/9fMjIpvRu7e
	xr4hkVicbS+f6Tfle+nbmKH983KceGfbhqKbEvo9nuGoxPeGTZCdywHoUTva09Kl
	f5Lw5uD/SPLt7CbZ9YGyvF3f066XRH5DP3e2VoP4mYfCn9rOQgw//LOV2iEnTeAC
	Mvs/ipSpMf77rYXs3xIDOR/oqgMkU2Mgf49xOlUbVydZIqFQYHWjsSaCahijIgHA
	XjzIu4XDk3CagHfZcaf4cx5vWMntVUAciPk8yrYn043IX8G5+TYM9DwXrKoUCcwm
	1rhJi+DCmoSlU5TLbq24C0MYJ724N8/YsnbbSyGJeBK9hEoyhIjECfQPCqkrq7sg
	ozwBSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0cghu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 13:58:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8e89d19bso381501285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773755891; x=1774360691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MokF80me7tXSqWsIgtIcUUI5pdqXPofc5xpgp1OSmy0=;
        b=XrsZXVyGhku7x+dNwYn9qvVmNgKXTwSu0Baifmk3vfVDWXvEp6L9CK392xHjDuF19G
         W1tksR4PDp4D/bjPG31b6FtVgYgHHpStdwERBdRnpFWRcGKpvsNayi6qMlqEY0MNp90E
         7hBcZ73ahQfbR5fXldCA0XDhqU+BSUjJlOv3A3Z8Gyqd71an2ftkGQUF+yXdH5Gh+mOP
         7fJ2po7C/8Lj01Ho0JDtHbILT/irBM0lQhFsA1js+1Z8Zd+TGU+JKNWf2r6nMoDLyJ2Q
         BAzBvExubEq322+VpLiew2k4EbIAlzFRmnJg3hGZiy3gsQJbB/TWeU7xYbwLSp029l7x
         hcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773755891; x=1774360691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MokF80me7tXSqWsIgtIcUUI5pdqXPofc5xpgp1OSmy0=;
        b=Vw1unRd6hjZSqHlrcEYcg8PSqcFhAHB8/CwOiqmdEu2vWGXgmUejYoh/3h9wiU3FGg
         Oog6rXafynozGwYbh5uW6FXm04OOB7a0Ljhe+nNw4HsTRo4Wq8Qp1wmLD+ej4mzi3AXK
         ooBlb1qkYyDOmCpHSmq2vshCRm9y4dg3u1dI72LY3oK4uc0ViVt1rGaKn3h8KQY0wanh
         CbwkHDc1ljYblK7IbiMX1s/VF7aTt14MtbyEeIoRcwult3KHHLvdkHPOlU5VYLCVZReR
         sEEZvCL8O6WpzUQQOYF3M8sR1pghgtjqJj+pTM1hHIMOB3nablH23cH0d5jqc+xpC55n
         ZrcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+CUDrFcFe0KEEK2SQtcL0klHaiJcHn2LSc8KdZdIAVbgPbpvi2v2hwNkWlqtewYKamisjfbEDIBoguj/t@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlg+dYOBZjoOfurllfR4ccxlEx9oSnZOORFpixKWaki7aoFobw
	wuzaQihTcstW/OFsbTirx4jN12gZlGXb6ItL9NywIVZ/YH81kaqILJd1zAkZFyN9kZhhqnvBbkG
	GM4kRmYcZfWCJLXXuC17dPdcWVBOQwqh4+OfW71RwiNpmVpTLnEXmXHPQhyLKwQ0xbUO+
X-Gm-Gg: ATEYQzwX1LVwU2tFGRm+ogeFqPK/ZaGeXO5sZ/Q8JtC8mJ/MaUwfCEkVD9CxH1Qio6E
	TR0A+rPmq3Tg0Bhl8caNBkl8TdgcAUWEhr27Ov/7hBHHryPrB/tRzJ0jHVnFl8A6tDwPUCCKZcR
	5zc1usLeYSv4nYnY1oK2/rfs9edfQKzDJW4a6ODxdYOCjqFlom/Bldl6dSWpQfjwMWJ3G2P/Z8O
	bACFyUjpmAnT1GIFAsz7qW+OckXh2M6WaKyCBa0kNHpbb588R6MZsO0vipu/xXBOpYsDW0v55TG
	lO2VJJl1rt+8Hc7MH8z6tVu9q5EOw61pvC9gksp7DCNWuPNJtjsJAv8iyAdgeDVqViT6uoIFxmb
	hmNrmwtUHhDx88WmzhDP9sBkNw8nnX0xJXDiC+JbaxHqNVOPu7PMawJiE9EmB8yVROpthbcSJ8t
	9yNmU=
X-Received: by 2002:a05:620a:46a9:b0:8cd:b2ce:2934 with SMTP id af79cd13be357-8cdb5a330c9mr1737992085a.2.1773755890909;
        Tue, 17 Mar 2026 06:58:10 -0700 (PDT)
X-Received: by 2002:a05:620a:46a9:b0:8cd:b2ce:2934 with SMTP id af79cd13be357-8cdb5a330c9mr1737988785a.2.1773755890403;
        Tue, 17 Mar 2026 06:58:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba6eacsm762134966b.14.2026.03.17.06.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 06:58:09 -0700 (PDT)
Message-ID: <93b27d10-26cd-4f5b-8571-da965f997ffc@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:58:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru
 <vvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
 <20260317-lt8713sx_dt_for_next-v1-1-8195fa931ff1@oss.qualcomm.com>
 <8ba05ebb-d1d8-4d58-91f3-554f3de7dc20@oss.qualcomm.com>
 <ablcwpT3BSnT9+In@hu-vishsain-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ablcwpT3BSnT9+In@hu-vishsain-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7DEvK_vjwlGKrPTMEabcYZr-LTsi9Xsp
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b95df3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zeNy_F3JxkFpdNDQXxAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyMyBTYWx0ZWRfX36WRPLkZk90K
 ++e1Z43wwt/K5j7u4VnrjpD9BM7hXnXr3ZTYd0efUu8WC49sNGpiPM2+lnEaLBFb73WC1fh4jrI
 mxGar9cNKmzjNIZaaSGIqaNFhPsFogNwwL0iJTWbcTH1wGe4q8IXYT8TaGAXTtxNdTU0VCbkYf2
 ulp95WWv13yu0eQEB/GtPUym1or09pVpWWCQiHdEFlkwtGx2HmgiXWsbKDLdChaFNRALJTKAbKH
 U4nmEB1h291KiuJSHcgqk4+c9fL3fgl61sr+q6cmuCK8sEq/r2GvtXd2GsT0Bkdf1k0m2Sn3qIF
 Pb22ueLy24rpGRu3p0gViaxLBGYwg3/yBo0ZCxqDnqNecgO4CaTAfNtgplImv9NnAtgZP8yYTLp
 y5obXuX+oS7xf4ViE5D2dRchEVrnHnJHwyhqGYpgiT7e+v+r0q5NfgZnpmrG0Kii32PVs3ckw9f
 77ls3dxfM2/bptwaWuw==
X-Proofpoint-GUID: 7DEvK_vjwlGKrPTMEabcYZr-LTsi9Xsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-98179-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 285F52AB517
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 2:53 PM, Vishnu Saini wrote:
> On Tue, Mar 17, 2026 at 10:22:04AM +0100, Konrad Dybcio wrote:
>> On 3/17/26 7:03 AM, Vishnu Saini wrote:
>>> Monaco-evk has LT8713sx which act as DP to 3 DP output
>>> converter. Edp PHY from monaco soc is connected to lt8713sx
>>> as input and output of lt8713sx is connected to 3 mini DP ports.
>>>
>>> Two ports are available in mainboard and one port
>>> is available on Mezz board.
>>>
>>> lt8713sx is connected to soc over i2c0 and with reset gpio
>>> connected to pin6 of ioexpander5.
>>>
>>> Enable the edp nodes from monaco and enable lontium lt8713sx
>>> bridge node.
>>>
>>> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
>>> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
>>> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
>>
>> Subject: "s/monaco:/monaco-evk:"
> Will fix this in next revision.
>  
>>>  arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
>>>  2 files changed, 95 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>> index 0b26cc334a69..0ca5615c996d 100644
>>> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>> @@ -52,6 +52,30 @@ dmic: audio-codec-0 {
>>>  		num-channels = <1>;
>>>  	};
>>>  
>>> +	dp-connector0 {
>>> +		compatible = "dp-connector";
>>> +		label = "DP";
>>
>> The labels should be unique, is there any silkscreen or similar that would
>> be a good candidate?
> yes, the connectors are marked as JEDP0 and JEDP1 on the board silkscreen.
> I will update labels accordingly in next revision.

"DP0" and "DP1" are fine too, and probably more obvious

Konrad

