Return-Path: <linux-arm-msm+bounces-89833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJqmJwUpcGmyWwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:16:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5A4EF3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AE97668BD1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 12:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4590A42DFE8;
	Tue, 20 Jan 2026 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z7D643z6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PwC0WxGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9042DFE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913014; cv=none; b=H3Jv7LXMOa8duSZhaHIM5u1fEimSG48m7pbwCzqzn50qEIIG0IARtQG7+sfDIDFl9pp4aDYBAZz93R7zVLZ52Swm/KE7hiXoiBYxkiPrQCbUUSZIeOVheTg4ZcHt7PDCrTisTzsrkBBWbxbEY/CTgzXdxPxwMwEEkHuKkGlOGEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913014; c=relaxed/simple;
	bh=Bqt66FG37gQPzxXo8GEua4Yy1cjRKNOcuhnhCZqtlb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWissUPxvgUA8ssRQnieVCAaiRfExnJs2JY5Ko8cicZ39gFr2QVbuqjJ3WQW/Pumc0FBYS+cazKhkmCsJLBDCmlcoBElWRRgl0Wh39jsKrefGXEDZH4E3fYqxDLqCSKLlMIncYqWCjuuPvKJ9nJEAYoMAmBwKlG9StWaTVHOvjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z7D643z6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PwC0WxGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6hr1H428546
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 12:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vaWIDj6o3+/nwUwiV/H8Dqvr4BjKk1GgvJw43iLVUDU=; b=Z7D643z6cqtblgZ/
	xBLNFx79HvoR14QSrGHjemMePUy1Aec7iZJQmsyEjFOxZOtUUrVivAlWr6JpPSlO
	6Tn4jx6VUNR2YDmWMUj5N6K9f8crxqpucoXa5gdzHJPugKJr/PSbslQWP2rfFjbP
	h4MCi/sXv+D4nItzhsR6cYphjcC/ZRhOmC0ZYRcZZW+1Wb0QRQcyIRETdgIzlYqS
	OrtLhfp8E2GQrDv0Jx4jwF6nSgE7oE2ciiCCuItv0BzjhMZFlutp7JRK1JdHnbwF
	AfLUQvRBJhdNevCaw0PDBhhMGojTkEKEKZtDL2W8jRfJ/nNJbp7fhqgY42nYijUf
	hiEmHA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4ps11xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 12:43:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-501476535f8so18126001cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 04:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768913010; x=1769517810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vaWIDj6o3+/nwUwiV/H8Dqvr4BjKk1GgvJw43iLVUDU=;
        b=PwC0WxGlvFqlv+GJYnrxIzUNtuYodDpSmjdcd/E0I0eBn7gdNd7YwXnP3O2zi5i7u2
         cGOLyItoBl9e0qEANkj1xg4EDyYvezzpX0JugMvkxMgoewnq4u333ur2cZqY05Cv0M2A
         9q1KqqXUzi3hpMAPEj0an0sqAT3IrMzGg/ANyGBA/gIZzqlT93Mh5YBmBus2rdLtgaiU
         Hk9+w8OnYRYIEoqMPqVP/zJ4YW5EpVe3mTwbDp/YcjjyWGLBzZj7nN0ejjTbBzujmfP9
         /8sEe24o5ZytYlkqPEME8mZs57F6pk0BsVayGehHisj7bjvWDkGob3gSNq2IBaOyae6D
         IQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913010; x=1769517810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaWIDj6o3+/nwUwiV/H8Dqvr4BjKk1GgvJw43iLVUDU=;
        b=VdS2uqNvIrKc3S8cKgxIwuuMnxB2vwf8dt3yj01Eq0iePqOjPq4F3k2EhMrwUlWcFJ
         9U4kc+yw71le7TY171Q4Xwf5kJPTmDzzCI/hz/Qs6qjeu7YD9oQKyaQLIQCDFeadMkNL
         WV8KBdKG2Tw0nRuNNChR07v3QJvqR6BzSBZvZS0KokX8ZkKA8WG4PU+GKucMYtD8B4+4
         deoM9B0I8x/O+2wMIYlhqhuQR607EnRKtTZ0PzPcavvsw4UBvJ6flVaYXXuypl9dXd3W
         AfAh8O/yTLIohyhN2TFQUjOJvT+gPI40vW3XhWioG50P29ObcMT2IVzIFK4dsA9nq/6d
         hu3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwkjPTp0PhkrABoFN9/Gbw6Jx3awyedM06gopQ1aIK1pgGfd7epqeovKhOlxbEg8RWTsVOUjBluV0uAQMo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg0uJNABLdqbDggjYtJo5FtvUw3k/9eP2QaN1HBhQ5jA/3YSVD
	ba/Qk9ToV5mjj/AwhSuBRYHsbzahDbI0dQs8ZPCJ6wQWEIw4fcJkxuN8ABy8Rt4X8mCO4gKhnv6
	PjvdiyqfsQj4uXq46bWNF2Spp+wcPFB8PdHFEYiQ7BSg5QE/y8AQg42Vpul6tBHFdLSX/
X-Gm-Gg: AY/fxX7emm9fDH/NUgdrreGtx62DLf5XdVj1SAU+dl+4u2qPVPiL+sDCUOLChI7Xuvr
	LX+srvXHPpvpgmXd4szobBQ41V0sAxdfN8JvIYRiQZgBL3ErQkpIKvt0fSlM6W1nRuDh1yyMfR5
	PpNHlTnZ96B6gW3lcLbwwGhLza86VFd2Emx+xEAIrAQT5NeNX7apq0T7ainNiGSt01Nu7o2fKDW
	cjxcbc2rDVX6F20Mzk8zyLua/pxAHEG6ESTOqXGJMsk0JwgqSAmR1kkZ6zqLYGkOC70Eu6cgUBd
	1xoE3IWT+ztt4qwoTJuhEPza2Gdws4xaiLeyCI4C85XgQhIrU3VD6VdZr7JrzWUeQRwr5zdMr91
	6t+XRLaAi/pOyv6QyXTI3QhlkSnz23pUI9PTHv7T4ziLkIhirdvAjXOgBoncPiFOYgus=
X-Received: by 2002:ac8:7f56:0:b0:501:4767:a64 with SMTP id d75a77b69052e-502a16b7389mr165053761cf.5.1768913010477;
        Tue, 20 Jan 2026 04:43:30 -0800 (PST)
X-Received: by 2002:ac8:7f56:0:b0:501:4767:a64 with SMTP id d75a77b69052e-502a16b7389mr165053381cf.5.1768913009853;
        Tue, 20 Jan 2026 04:43:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49dbsm13597080a12.32.2026.01.20.04.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 04:43:29 -0800 (PST)
Message-ID: <d2888a71-2b32-42a8-868b-090f1340740c@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 13:43:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add
 Focaltech FT3518 touchscreen
To: yedaya.ka@gmail.com,
        =?UTF-8?Q?Kamil_Go=C5=82da?=
 <kamil.golda@protonmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260118-touchscreen-patches-v3-0-1c6a729c5eb4@gmail.com>
 <20260118-touchscreen-patches-v3-3-1c6a729c5eb4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260118-touchscreen-patches-v3-3-1c6a729c5eb4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z-9oAGsJDf344DxR92ttkItlvsTOIrlU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEwNSBTYWx0ZWRfX7MPgASm2Vlac
 FglVOMuDL2lnhP0poOqEyUFej9eIGkhpS6o5D+dUID1GtDiIuNrpIBXiwlE2JNHE74gRt6fkEqA
 YDHzLiek/BtHaU26/Kh4ooGMzdCM+5QIc6tC9c5l28Ehg0N9JC4yf2a9mb1BXlvvTehZWYMIzkY
 zA5jzTL+U/tC/Nos8qi3gDIyf05QCAjo1uogWrf286wZEn6UNWVCcpZYPo10w5eIn2NDYRnVamQ
 bZfvk0pI9fnxOHoPw1bx5ZnhPvMPjFKEubxXrZbQ3sFujR39KtUFnrviEzHydn7BMZigdEYziNG
 Nl1RKqyaMsF4Ry2fW2bpzAngoIJhLWa14fmTljARv3FVw5bPA5b2/cc1T67tvI5NHyUcoJYT3/9
 OD3cDeOWonUXMPlmP+uiKuDUGiNqNdND0dmZ/QW3VPzOqXFmc6UWR4LVik52qk7EkLmz3zD75Km
 ERLaxJsavejuzJRagig==
X-Authority-Analysis: v=2.4 cv=PdfyRyhd c=1 sm=1 tr=0 ts=696f7873 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Uyhorv2uAAAA:20 a=pGLkceISAAAA:8 a=sfOm8-O8AAAA:8
 a=8Y00a8MOIoAAH37gNwoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: z-9oAGsJDf344DxR92ttkItlvsTOIrlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200105
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89833-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,protonmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46B5A4EF3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/18/26 9:29 PM, Yedaya Katsman via B4 Relay wrote:
> From: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> Add device tree node for the Focaltech FT3518 touchscreen on
> Xiaomi Mi A3 (laurel-sprout).
> 
> Add pmx_ts_* gpio configurations and reference them in the touchscreen
> node.
> Note that gpio pin 83 for the regulator isn't documented downstream
> except in the touchscreen node so it's not defined in the tlmm.
> 
> Enable qupv3_id_0 and i2c2 bus that the touchscreen is on.
> 
> Downstream references:
> Link: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/laurel-r-oss/arch/arm64/boot/dts/qcom/trinket-pinctrl.dtsi
> Link: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/laurel-r-oss/arch/arm64/boot/dts/qcom/laurel_sprout-qrd.dtsi
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---

[...]

>  &tlmm {
>  	gpio-reserved-ranges = <22 2>, <28 6>;
> +
> +	pmx_ts_reset_active {

Node names must end in -state and you should use dashes instead of
underscores in node names ('make dtbs_check' would tell you at least
one of these things)

> +		ts_reset_active: ts_reset_active {
> +			mux {

Please drop the intermediate nodes and put the properties directly
under the foo-state {} node. The indirection is useful when we're
defining multiple pins with the exact same settings (e.g. 4 lanes
of SDIO)

Konrad

