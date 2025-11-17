Return-Path: <linux-arm-msm+bounces-82102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C1482C64461
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BFC0D4EF69C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8D7325705;
	Mon, 17 Nov 2025 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ec71H1bi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqzobvzr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C2E32A3F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384306; cv=none; b=lCLvOOagQmwwnRdYP/hgvfMke7OM4fMsLFVFXfthmKnq+lVpZlLHCaxPcD5K9BUVfGcM48AsazIABfSy4Is1+MzBzBV4LDMAHGA265XjHJqloO++6t8QO05sX7Ee/G3C86/qTM/LJ5YHB695gmZo3qtkzgoAKt0o7NkjDaqryNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384306; c=relaxed/simple;
	bh=M/vV13OR5DiGZcbssDcxkDu4hqqj1l3nFnyjuCAyP4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ummhDPKXdJZifW7k6hlghNWFk5MwGR2TP2mO+1iwfBCjN2wh3+6N8VI1+dIE13IgPM4aNRu0R4Hle0keuJauhIxYjaWRNjVJML/2Js7iqKIOvDivWEwM+YzubbBH+dkwDLEK5sHNJI26cinA/Lh6FsjUXapGlcXvP1LOKmzkWg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ec71H1bi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqzobvzr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB62G84107434
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8spAh8QNxCgY7oAIc47unleOf4zNEJucX6DkSxfwz/w=; b=ec71H1biUeJNSiVp
	0mpJKbliv59z5ymVBJVkn1Qr4Jn07Opz8g/xCSzlMhrkocU+AA69Dmw9diFFbdCs
	T1Ky/YmB9tgJjyWob12fMuwH7uERMtDx0GNbZeBqojnMLRjW6r1bATuQO4VnzXZQ
	mp/4encYjq9IE8lljNfcD/SGXF1CqkpxBIyP72nPjlJW/m/BL+iFj9QNq/ocQwWR
	uCa6+pTafmh5I6iqWPCTxXi2BX5d3i0kDMEgwrFFXbhWFiE/QM9p/flKJuwbnmRC
	ndJ4LXHH8dwVawb2+Zee8VwhPACrs1sPu0jMLCIITAZfsE+jAk0ngCArf3qHrwu1
	GoAeVw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hp89ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:58:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee00f2b7d7so8922311cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763384302; x=1763989102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8spAh8QNxCgY7oAIc47unleOf4zNEJucX6DkSxfwz/w=;
        b=aqzobvzr0UelIj5KVoANcrI7ZpdgAiRtMNVWiQuUn3CXqDVHxIX3+CYhSvmNXWGY8I
         BWj/4rvTtuG9isPEHwkA9wVHIz7NiYbAtE449e31kZp1Rl/QyhQJPnh7/vkXRVbwZX/z
         AWuBTmCom2Ith5L3gfhZ537Ts0pkRopAvJMCr1KzfZ/Gra9CjhJ6R03MBy9H8G+NqSL2
         XB6BAP/+6vuCBDZV8t2lTm0dPbgOD97yBI39MP/N8BMJ+fZWfAUe1/gBHku1dAaiAY3X
         8KKp+2MftIatEiHs10LdL5js0byhnvwQBCC7Z2+rTfXhG1ZzZQC5ET0o1o+LMHJeRE7d
         Y/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384302; x=1763989102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8spAh8QNxCgY7oAIc47unleOf4zNEJucX6DkSxfwz/w=;
        b=ORSE7vNghtNaxjRfjwDAnvZUfXZIakR0YXGMhPEXTmDsEsX3Chc8aqRT17Aod9N4po
         rAe6IIa15rnyKlp20erkWYFnVCepo/1EB68pIg/5zsPpAPZ62UkLqo6/rOaUhE61E+6b
         T30pxrTuZiL9Sph21GA+62xQQ2xDrv9LQr9BupqV4jU0xuVYKBVsm//LZ+6+Pvz1E8W6
         I5t5jlarsQvgsypR80jm356KEb5aFxifKAGKVUZ3FoyTiyVsgLajjZkmxmeKM5cETXB0
         jvFRaBolV/fW5noPISmqG4You9tq59AdWEP1A6GYGqm9FDQg2RsKSlravPAR/mrfSgl/
         jT4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIpFWz2+aUnBFNjiiuHethdP2Hh6saqp5PZAicHTj2axW4FN0s0JR7vvBXH1CukSes+kE4tEUs4nbcoiSR@vger.kernel.org
X-Gm-Message-State: AOJu0YzpHWSGo4IkJ/bS9yQIkU5UFFJsMIa1yv88O18HU3hExZf2o+9B
	VyGVV/f7RQUjWH7cPLcUc1yBgGm+At8zYDhs1FpSPo3QWFQ37dVqJEHtSWMIoGTp8t5rhnEESi4
	CaUNhBuLB/9Iy3wjpzHorcTtLMU3sWMuNBpDQ9+PcGaaHaWpsTs6fSnD6qfcjy2ujbBUT
X-Gm-Gg: ASbGncsBtoy4vhlgezeEhc4enSZzbV4xODfgx5fuEtbliewW127raB8v7td0+mmicWG
	ewGw6iVGdIuERuua6Pdr+Pqaq3jJejuzOk9h14Hx8nzd7UBkjPx7XOakUjmOpi+amSEsHS7vO7/
	I2FtZEzIO/XZOznGWr+Y4VNIBqsingPXIWA2JzoTCtxfdbTTjRYoDIDDXWWftHcXVOxrQmQNFYq
	fi1GQJWOYTG4LyhhndwCU5Q703p5NsxXSRTi8WiSjzPO7c61Ks6QLl5gtNI+K23kgvpGCs4DVpx
	z7fJo8rdBF9qWVt37JoyDwlS1VBF609lzLTzuHEeKvVCVsIctZ4l7cFptuUVofZeGsaxmLjx0+J
	RjQz5ExmNiNWnM9+loY5TAgNKTH1ArfFZ+3aL30U1Bk3McJ4qe638O4hN
X-Received: by 2002:a05:622a:4f8d:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4ee087ee1c8mr54870321cf.8.1763384302464;
        Mon, 17 Nov 2025 04:58:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIuOszFQnEdTG6xywYiSMgCVRX7PV/UsWoBbUQgI2HNhYueQciRMR7ZQumion8Vv8iYdd1bA==
X-Received: by 2002:a05:622a:4f8d:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4ee087ee1c8mr54870091cf.8.1763384302086;
        Mon, 17 Nov 2025 04:58:22 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed9d38sm1086600966b.67.2025.11.17.04.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:58:21 -0800 (PST)
Message-ID: <5a0c9cf9-6f93-4216-8f98-7a492dd20f51@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:58:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: x1e80100-vivobook-s15: enable
 ps8830 retimers
To: maud_spierings@hotmail.com, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-3-cc8f51136c9f@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-3-cc8f51136c9f@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QJPVdItTSAlFvKfjnzweGzEg4DsQkOOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExMCBTYWx0ZWRfXztYNFM3pE+Fz
 cwyVsvmjEXVw2n0lqPU+/lK/5Qhi8u92oKeEYzfB/5+fHnYqu6Swo/f8S026xHXBqw3LpdD73Ro
 gPM6mWdA32ykiza57CNSZdPyo9fp0s5PTDAnT0sf3VbNiqIDlu3gjQVTcLl5AnRQEeg9oaRNxnd
 eIdXQMNvdfcPC8EIOs/wjE3EDcxyYzhsZLJ4PqoWkZOA7X9YfmRdwiM+S5KROLvE5MeqUw5D9qp
 gSIdYIVs7Fb8KnxDjGwzMz4HE+0OwzmaZUBuqg0DN6BvXB/RGkPOlNXOKr0U8Woc223JjyG23MC
 MTSQBVNNkGtJmhH3xT02HtU3mkhDhy5LdszWzVTGDclsxgKLNgUz0HQAVK/1v88bwMu1THOs23n
 JDX7ojJeLViYuhe9SRbJFprgRzIrlw==
X-Proofpoint-ORIG-GUID: QJPVdItTSAlFvKfjnzweGzEg4DsQkOOb
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691b1bef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8
 a=ucDlCoAaIB5v6D95Jc0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170110

On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The Asus vivobook s15 has two usb type c ports on the left side, these
> use parade ps8830 retimers like the others, enable them to also enable
> dp altmode
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

