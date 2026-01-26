Return-Path: <linux-arm-msm+bounces-90527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHVuBT5Dd2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:34:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5D9870B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06442300F9A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C44330660;
	Mon, 26 Jan 2026 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULxdXg8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P2Ye9Ik4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B31314B96
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423574; cv=none; b=r6Pa1N8zDLblMAZatKi+v190TR0BzPOR/ayZEAe3uDOYLoACiNY95MfPClDhBdci+eCzUUINKIoTDbq6HpwyFNAuiaYZ+okpnPAlqK81Pq3k64Kt26E8miG4ae1hrVdgXxmdaL8Fr9a2mMvccVz0twmeXwyU4CgG0oWLU01vXKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423574; c=relaxed/simple;
	bh=eWAdrV6TAtui1MJq3ZE1m/+gDAFZQQwdZF81DH6TaDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lq0fzFuSXNzkoXS3VZ3TbcHlxE2dNBgGze+cFn1a+QSSIF0TS10pzXr54VzbbiC1SQkoCrYsV7ikwqrhnWdMuqZlWW4rL24a7UCffhsU9fZE4ZRyADZQO/+Gb5p+s827GpeuU2WqGLK1sDNLKsGEBiq11lxIlLry5JoBnp9rGLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULxdXg8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2Ye9Ik4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q7lx9v1879494
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JnGQa+VppXSpGH8Db51uvFUmO5TW2cub0y3XamdlXbo=; b=ULxdXg8GOuwlgBJL
	TgivDwLrLmZGDQj6b7363AGK+1t5pNEoyeTBAP87E7bO8F2CRgksn+JM4V6iF9cB
	TedXI5UGCAgtChJkpTvInxkibW3S4B9oS0ie3qbqr/9ZPIBNoFfHFVPBH0gEVNJv
	psl+3qIqHyDB1Cq2MC2Jml1UuRptrNf+O8xs0i8PvvpOaIG8OMNVZRvzoLG+7WNE
	by8je9iU5ZEYXN7AOcZwUAzF5w0ZE5onMXRLIA3zWu1cENk2NCxJqQKBeunQF5eH
	WWqv+SowYjxeCAV/9/TqfcRCP/sVgmS7djm+h6GeMps28Y84192T5UWZr4/Hw4Z5
	oeFgOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dm8uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:32:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so116148285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769423571; x=1770028371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnGQa+VppXSpGH8Db51uvFUmO5TW2cub0y3XamdlXbo=;
        b=P2Ye9Ik4odT779cWRZx9MNfj6C5UiKjmLzLr1mUpsim398DdW0Z7mkemBDTXsQO1oe
         TLMC6Gm8GRMhq1ljTdKi97t0U3eN5otDK/l95HD1ODgKxBpAnMbFOteW3JwXdJLu7+Cb
         BabdhPA95Bu2727JvLVrCHXrsoFnNktL9hC30DG1/rw13xXD5Ls2cJNlt/ek+kdqv6rs
         aKp03KfhTosReC9gTgIWGln3saBsS/kiSNG2xERzNViLWw/Fa+jr/iQnBVCIcBG6mxcy
         fOMvFZ2k83TIysT+6w54wHj4fmhBT3Xu+tIfXzBKk/rKhWdyHxA3o8fMPhBWK5T6KPLh
         00gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423571; x=1770028371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnGQa+VppXSpGH8Db51uvFUmO5TW2cub0y3XamdlXbo=;
        b=NsHwNTFJRaUl5R3qr05Um8nLxUMx0bJK7A42+LPxBX+dqDygXYPaL2hHF1VK+lA3Jj
         VSq54Leg8/ofIOzTV7WF1m4b3CljU6biEXAgD5rFkWoiLqhqbGtVlpZ/9b9L86CS5I5u
         LKnxRqzCAV6Zwj08ecX+SXprG6KusgcuAnUbFFSTbX3AHkf4Hk6dsyWsEe2cy0h6sNBB
         F/FqZe/wwgWl1j+H7Eki6p9IjNjVknoKbAeD/vcBBBqYnBnihfCwbHulUdKeu4ykc+pk
         ofDxQbBcremQrY2tIHKb8O8gnflt3LrR/bIg8wOgqOlcOnifC/sGObVgi6EC12jwCsd3
         P0IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK35mMqgf2oFX6B6GWODA+clVbSaru0aEdnJukPvT/WkYRcQrmgTD93zLq3EQRz3LvG5EBjJliWjmRCFfj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4dd1JyLQvykSKunEPbhqg9g1aHMY6Yr+WvI7fetU65tj7IMSH
	PkIImxKNUi7xVurXLIoPNl9XuR7mmyqDOjVovJ+sn654LEEnq2WT3/atXCUvS+1HWfFH0EePcM5
	a2HXQGGRUbYz8af+s0OXmeSJsER+XOXdFaFNbXTiLKvRJSaYGECWE0e/Zt+lOOZ5mUib0
X-Gm-Gg: AZuq6aL0DklhwQ12LmHYH/qZr01nPLQamLx3L4G/gFqHKxLwfspW9vBhShUtG6ORwQt
	RoN8ezaXz7+NsPbSD0yWjISiVDQ9ltTv+cDuGucNkjLOb1xVj+tfCjW3Ws7KoRStr5Ny265MKUf
	KEO16mMl0Y0N5nkOVF03Cif8FKboCpP1EpKHNPbm49mXFPsUeb/56VN+emgrms2nTFo8e/xWUi6
	4wQCRjLnDhJyHUTNK9fG5twzsL53q6EgjSzXfV6mVTYd6JOgGXuogIjF6MbKTJP19q9Kb81lvYh
	3Dop1dUnAW8Z5aFCUMfHEOTu8N3ckIyk0YXc+EGzgBE4vzr1nvjfPKeRp/8J1dOH+XAhUw8JZp7
	1WsKTyAqGkbF7/4jdYoaWXZjznlSghGDBD6QcA3SKhurUvKlxBqOmeogQQlEC+dCY4nI=
X-Received: by 2002:a05:620a:2588:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c6f95790c0mr358639985a.1.1769423571052;
        Mon, 26 Jan 2026 02:32:51 -0800 (PST)
X-Received: by 2002:a05:620a:2588:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c6f95790c0mr358637685a.1.1769423570661;
        Mon, 26 Jan 2026 02:32:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b7d7d89sm606513966b.68.2026.01.26.02.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:32:49 -0800 (PST)
Message-ID: <291206cc-85e7-4251-9507-5848f721a708@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:32:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
 <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
 <e0e6f248-3d82-4b0c-9ee2-4a655b7bbbfd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e0e6f248-3d82-4b0c-9ee2-4a655b7bbbfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA5MCBTYWx0ZWRfXwzP6Ro6Ww7E9
 VP0GgR3gK2uDG6+wcA7y1xetsviyvUSDoDIpBCm8A2hj9hFbDBlVEBRK644uAHNn1dIbdGrz8Zw
 ErOsIP5M7S8XF7QngMuLIsx/hwa8gVN4g0RYt+E4XbWaSJ/Tud/7V5WUT02Z/1by4rtqftC0jOu
 qCdvuPJjXQ19x0RmdMa4nTuXpLuUBDWKkTCxkrYoYZOSkIipAlpJIqTD6FtBTdyg3f6rPijT5h2
 dpoOOzJom1jD6mMvvaza9RSXSiyWlhW3MWf/sxgd5NEIOX4wudgDbI/iVGpco2pwtPLTX2kX/P9
 kRXePRJCW+35lBtKkKB1fECDrvv2K5B60ap2qgMSQDctuxFFkvKDQNRuQ9t0y1kX3NY52LgD+oY
 x5r0oJglZ5xafTbT7YLKhf5WzQ5ovP4dxhllkCtSsPqOnqzK0jf6ayPg9rrG6FZjSNb+trMAPGk
 eiKQApUrK5VlaN5o2Ew==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=697742d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qa14B8Bdw_gfn3ERDOEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XfWE6HBj4PH7N0aVFK6zoUEsId0zHux4
X-Proofpoint-GUID: XfWE6HBj4PH7N0aVFK6zoUEsId0zHux4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90527-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,1a:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 3A5D9870B5
X-Rspamd-Action: no action

On 1/23/26 3:30 AM, Wenmeng Liu wrote:
> Hi Konrad,
> 
> On 1/22/2026 9:44 PM, Konrad Dybcio wrote:
>> On 1/22/26 11:48 AM, Wenmeng Liu wrote:
>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>
>>> The Talos EVK board does not include a camera sensor
>>> by default, this DTSO has enabled the Arducam 12.3MP
>>> IMX577 Mini Camera Module on the CSI-1 interface.
>>>
>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +&cci_i2c1 {
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +
>>> +    camera@1a {
>>> +        compatible = "sony,imx577";
>>> +        reg = <0x1a>;
>>> +
>>> +        reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
>>
>> Let's define the pin settings for the reset pin too, otherwise lgtm
> 
> The reset pin on the Talos EVK board is different from the default. Do you recommend that I define the reset pin's pinctrl in the Talos EVK board's DTS?

Certianly not in the SoC DTSI

The other question is whether to put it in the board or mezz DTS(O)

I think the latter makes more sense, as presumably a different mezz
could use it for different purposes

Konrad

