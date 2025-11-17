Return-Path: <linux-arm-msm+bounces-82115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46836C64727
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 313CA3AB984
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC492331A4B;
	Mon, 17 Nov 2025 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvTTemdf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xq9NChBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3673321D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763386967; cv=none; b=GRIWwlZl8A7iRVxojk0HnIEReTBzPzo1rgQ9uS9VAgDZDecq7YATktk+FlD7nphpnHJX9/xT/hQO2GCLqvphhq4AhCfCngfXbloyhR77MoXqvRInn66TvZIPwHN4PCqKPnIcKfMnFPTZBc99/qix5dz5DXjS111/Nt3aa331gHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763386967; c=relaxed/simple;
	bh=gy11IKgOL+UlbRpko9UqZx9q5W+Ik7+z6gmhhHDAw1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ox8qg6IC67i3MIvxmqDzF1hoPfqouP1dFUOsXlxshYrA+GJtrcuKEbZdZgr0NlJZdlkPxq4bukRqJTpDzaguVcBcZal06wnEfQltCdrKbu0d9jofGRHWR5Fozq6r1FO/J5yZs8UVA9vffkqoKA3UYlzpEL3pGg8hiiCvSDGC7lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvTTemdf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xq9NChBA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAC2OQ3571473
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDdOnrkpdc3gXVQILER9c4Fw3e8FGBAlyX1NwMN37io=; b=mvTTemdfoynidzOY
	y24M+IU8dkBaJi3ZhyUwKV0J9wXCzTi2wZXloiqAcbNUickK+gDzBzMMM8GPcqdL
	CxUA6KoPj8+zgpnNmd0wCJK+hVamFLrwg4fvqzN1Y0WkfVlie4Et/hLNFY9mr4QQ
	IZbEOAKN5GEzgcKbkrdDhe8/YG0zhEzfp+YN9yDlMO4UM5eRRbvFY+GMmGtiWBlL
	o2WQ0kmwJv2X5Qa5P0u56qdNaMMHyxDRGO33Np2A6gVXLCmELUUDJ/6yrxDsgnjA
	bTD23T6lilAPAAynJZJRmMa9mC5box7Q9MQ4aUsIJtNs02FJzVVy+njQk+OpO9Ud
	n/CvGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbrjeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:42:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0488e746so49270131cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763386964; x=1763991764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DDdOnrkpdc3gXVQILER9c4Fw3e8FGBAlyX1NwMN37io=;
        b=Xq9NChBAaZBVRbVGBT7Ps/kV1N4dnb82czFhSzcp4ZZay5s+RQkK4qHhatfs5RX1Yy
         H1U+JiVbFtioOJvFDxesOzE0Q2EGZxl7bkkQByvJ+2zpRaVN51R7Ia/CWtDKg5Ubmwln
         K+nmi6Spgl+i/Xc5go1pwUY/3bX7805o/EsUww/MV59AohISPgfmHZOLTaVYUfXaQP7v
         7rU4ZqxcY9WN+V3OYmtSsqCNFiHvej/7se5pNP0Z1ZHCkEy30v8IX6BCfDt+HR76M/9a
         qFSCDcmozmPFMgqRr8XITd136DneuNrXvOk0cj6AK6zg5GqH9bsKUaNvMkx+AgKpCIWB
         Shdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763386964; x=1763991764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDdOnrkpdc3gXVQILER9c4Fw3e8FGBAlyX1NwMN37io=;
        b=Lmb7WiYaSshG+gPEBoMLP9UGgMgdbd5Y+UV10G1l7gsFDVgqG9nmSsc2iPm/tkRZ5Y
         1qKSE/B9tD+7DA8cprQ1jzTJub6eOsEgsoR8MJYqGWj3G4bpRdt2U5mAQlsoX2a6Q3ON
         xF1E8zxU3tco8SI1v/10OlN7R34HUiqIiiavbQiY30D4LAiEkYK5OSw01WmOLH3DVqoo
         BzDMIPKk4gE7X0ZEIk97Tz+YPdsAofJok7GLcwMVX+HyOvaAqBtslyNMjZ5R38mYalB2
         Tyk2ua5y6SF2V8nLho37FfbAURBfXSOZAjNBA1mzl1DIzjTmQMOrdjZJO1NefdXtEnUI
         H/xg==
X-Gm-Message-State: AOJu0Yz/cG3efocKdML8PaAdxqg673ccLyalglZBqCQiQIVf+61khdoT
	7Y+EeDt1HzCl2i/OH/Zk3rQwAYy7XUPUUbnG8Zr4OSg2a8ihRvu8d6m5DchLHvoR6Su3dkKs4Pv
	IZgi61jt/XX7UM2VmhQDXUstmQWLuSZ+nCSRQzVRMogO8LA8nSXhLAFKw1ai46+oFxjk+
X-Gm-Gg: ASbGncs3vkcInYLpCInLmD9u48yoVNSEGWhRq1iNUOlVn9v4l3hXnhHfhvpLvKrDrDA
	il9Bo/Hr3G55EML+4F+BZlARcsetq/DeDDE8N9GXTBTzItapFxQtcosb67jPS5yq3D920NpGMX/
	RTk5jsoqSt2AzuWuRo0izLFJNfPtQEUmRjwT3BQtZ0n7b0MOM5VbEio1cfToOwp6+6RNmhUWclp
	Rnkrt1VaUYuIeAHJ3vKZSGG8B3xyHM+oY0mDapat4tZxVuy88a/fHl+GVVuUPzAXiU8qlBkyIb9
	TendjB+NOHAhJR0RlR2QlIXb1irkWSHq/0YvZS3A1WoO6wwYQg8fjJhx4ejZVHMZbpkFpcW22tr
	zfgYGTwXnrSif8OhJaCxqlNm0rYGjqen5cwtQ
X-Received: by 2002:a05:622a:290:b0:4eb:a715:9aee with SMTP id d75a77b69052e-4ede6fa96a4mr196606261cf.4.1763386964141;
        Mon, 17 Nov 2025 05:42:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4YLKAmHqlozrjLfgMSObdu68SutHjoJpyoH3v9svlHe0C//FvOYf2CNMPyTtM5Utjid8wCw==
X-Received: by 2002:a05:622a:290:b0:4eb:a715:9aee with SMTP id d75a77b69052e-4ede6fa96a4mr196605941cf.4.1763386963698;
        Mon, 17 Nov 2025 05:42:43 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477a7cb24dfsm15633775e9.14.2025.11.17.05.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:42:43 -0800 (PST)
Message-ID: <9ddcc6ca-724d-4c2d-8aec-ff2d0715fa88@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:42:42 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: soundwire: qcom: Add SoundWire v2.2.0
 compatible
To: prasad.kumpatla@oss.qualcomm.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20251105-knp-audio-v2-v4-1-ae0953f02b44@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251105-knp-audio-v2-v4-1-ae0953f02b44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GstJXmkhTFiPIVnAjwbPEST0sv9-pFaC
X-Proofpoint-ORIG-GUID: GstJXmkhTFiPIVnAjwbPEST0sv9-pFaC
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691b2655 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=h_yHOHNfR4acK79r6yIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExNiBTYWx0ZWRfX6XIIpnP28o4A
 Cfm4JbC0hvv7H7ZnsWAeQZwEXFnKGlsmIr6RmtNbvgBunc1261oP6GT6JHEYYr6s2R358LBkgL8
 v89+B7aHXIfEdJAJmJLcWCMe0g+ra7+aguxqWyI9VuTy7WQSnd5A3X6U8EM05FE+FstXEWX5wMD
 98c39hu54ioJrxoImkAnwDqTBX130VXV7hFuOkc+r5ZxD1giKSQGIChQCMVU9pZSko9wpGIDNg+
 DWUNT1p5NvEZi3XsDUBkhAhamj0YaXfb5DzxSSKb/KLWXIRQvHQSoqhhlT14omY18j8zqkFqSzQ
 OcFIa2EB9kZm2bmsU7yYO83cPQnsvtyCuk5kphi8oyHrBjUQEYkKmJZ/UhPG7oTrH56SB+zWIys
 NFaHi2No1rZ/IoPNmYDqZJ4NrAjrbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170116



On 11/5/25 12:19 PM, Prasad Kumpatla via B4 Relay wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Add qcom,soundwire-v2.2.0 to the list of supported Qualcomm
> SoundWire controller versions. This version falls back to
> qcom,soundwire-v2.0.0 if not explicitly handled by the driver.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
> Add audio support for Kaanapali MTP boards. Introduces supporting
> dependencies required to enable audio functionality on MTP platforms.
> These changes have been validated on Kaanapali MTP hardware.
> 
> Changes in [v4]:
> 	- Dropped merged patches.
> 	- Link to v3: https://lore.kernel.org/linux-arm-msm/20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com/
> 
> Changes in [v3]:
> 	- Correct SoB chain, comments from Krzysztof.
> 	- Link to v2: https://lore.kernel.org/linux-arm-msm/20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com/
> 
> Changes in [v2]:
> 	- Addressed compilation issue for lpass version check patch.
> 	- Sorted compatible string in machine driver.
> 	- Link to v1: https://lore.kernel.org/linux-arm-msm/20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com/
> 
> Konrad Dybcio (1):
>   ASoC: codecs: va-macro: Rework version checking
> 
> Prasad Kumpatla (4):
>   ASoC: dt-bindings: qcom,sm8250: Add kaanapali sound card
>   ASoC: qcom: sc8280xp: Add support for Kaanapali
>   dt-bindings: soundwire: qcom: Add SoundWire v2.2.0 compatible
>   ASoC: dt-bindings: qcom: Add Kaanapali LPASS macro codecs
> 
>  .../bindings/sound/qcom,lpass-rx-macro.yaml   |  1 +
>  .../bindings/sound/qcom,lpass-tx-macro.yaml   |  1 +
>  .../bindings/sound/qcom,lpass-va-macro.yaml   |  1 +
>  .../bindings/sound/qcom,lpass-wsa-macro.yaml  |  1 +
>  .../bindings/sound/qcom,sm8250.yaml           |  1 +
>  .../bindings/soundwire/qcom,soundwire.yaml    |  1 +
>  sound/soc/codecs/lpass-va-macro.c             | 90 +++++++++++++------
>  sound/soc/qcom/sc8280xp.c                     |  1 +
>  8 files changed, 70 insertions(+), 27 deletions(-)
> 
> --
> 2.34.1
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> index 95d947fda6a7..1c4b0bdbb044 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,soundwire-v2.1.0
> +              - qcom,soundwire-v2.2.0
>            - const: qcom,soundwire-v2.0.0
>  
>    reg:

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini>
> ---
> base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
> change-id: 20251014-knp-audio-v2-9a37752cdc15
> 
> Best regards,


