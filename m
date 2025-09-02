Return-Path: <linux-arm-msm+bounces-71554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E334B3FEC1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BDF720254F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344A52F5484;
	Tue,  2 Sep 2025 11:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nybMVs+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666252F8BD0
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 11:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756813840; cv=none; b=u7f2/fCbZlb5PgLkJMx9WwS6hMwjzN7AIJ0qlY1NZanG7Y0cJgIh5ZoX+Uwmoj8aJBNhTp/FPqTyKdRYZXn4cKhTcta0pl+MWQImD8X9EjlkAte/fEjtw2bv89oP1V9SbT/H/KZB8ZZY78me9HWo0e62zGQY8Xkf0K8SNHOBTYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756813840; c=relaxed/simple;
	bh=6PHHebMlrd9cTBVjOtA5XSpV+1kfwCmgVSvtWwrAOyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmAEU9QxybsS+IInHc231GSL8AxFTkDQB3/MxBB1j7mSBRwaREiH0y0+jM/1nSQpufWoLimakQD1dPHV6Njj8XgUcOL59DZPlXbQTMD775jQzmvlwkea1w0BkbxXdUHq6xg49oqhY8QG3WkVZ2X9QNP4J0MN46QELB+Tk+gqjYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nybMVs+E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BGFao010341
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 11:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5EB/XrOSwrBg61UCKv90VdlyE8eMUv62GQ7Noo3Ndow=; b=nybMVs+EeKRJq3LU
	bPFyv0XreWU751FtGKaUNSSqfxImrsxXGm4HO76Rs8IjceRiN/7h1BfWakmZhaMW
	ik3zINYG+NTEQPwfetg2GfiA18kcbVoNTKxE8b50RWjPZGZ28QKZqqHr4gahKllq
	qXFnBR02M7R2ksQyqUwFVjQA5ASDMJbYVNMrHdcjxejP6ogAKHXU6Ot+Mj7ghEqe
	UOMNbwX4bgnM2n80mbKA7spzXNa97mkMgE7HHybsXNuwBpbSPZYXAsydbcfIdvWI
	Cky99Dw1803sPo7Z89Ps/TubwD1L+wTkm5qFuo7rx+Pisn49zb+De5Qcc1jGiFBo
	TZGceg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjfn0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 11:50:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so87771cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756813836; x=1757418636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EB/XrOSwrBg61UCKv90VdlyE8eMUv62GQ7Noo3Ndow=;
        b=s+r1M8KRwE+yKCFb2sof+l2KmOS4IhQto36IBwu7471cvwygue9qF/NYAwZjCVc669
         b0enGYlD93zDKq8+HYoI+B0NCa9IwjMp8HyrMX1wQDfM9AKlpiI9tPmFbsOViGo8YO5g
         QuEg4gMRT15QrYDYhGZKQ1O3LrZPfFk4MKZIC17lQ0TpFUF950vQH4lIjmumoPzmlxjL
         +ZpCrdV03CKzHSpvwGKyu8ISdRNRkfhBvURXcE4dpF6pHScvYlsew9Tc1nQfHjA4guks
         AYecJQEwxR8WejJ9be6s9yYQtusVXjtylpE7Yc5sXVvzqb9zMLKsRzyhP6FYq/qvLBlM
         VKFg==
X-Forwarded-Encrypted: i=1; AJvYcCVVPpGYoN37n8YOSN964VayxIqm3C0OW7zPoIaxRUUGvC4Atry5SfPuT4aSmDFFYiSsUiAgPEvXRWJy6bTD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/9blzQXPk7u8PTAwUiEKLaIc35aCdIMp4YPx1DiGAyZjv4jyo
	fxxUOMi/4SHzYxAZnp+eYSkWzB4Me2cN6U5FP+Qzdr1N3wWyflYdju8lHF2WZLxS2nDNAA8Fw3/
	UtcgvH8qjIfnBa90LNhWGxfgpOle8iG2XqznYveMaG7PtWbwn5BWblRx6NrMC9KhLY560
X-Gm-Gg: ASbGnctcp/bbAQpYb86ul1eSI0WjR1rwx9zCOSl2fr77KYbE//0RG1FRt8WSzsaV0og
	qYn2Orw0Eepfocu9w9P7C4oUuVPcrCFoTfgYsZa9hB8HXDTd/hx/qgLG8beypfZjDLs6P24Krry
	85rEqsesVv9lm5wv6vFOECSO9npeSMXVrMNWctqY7jYnt3pq6k/4NwjhcNoEM64v4HCcVe7H1S3
	K+/8KaZVwL7gtD79o6EJ/ouEU14rQZiyScWGlxYb+H5Unl8CTqWVt6YrJm0DXhYzEMmpszOZskL
	tyYIbEe5dtUvDKm+P3VwthxJyaT2+b0mEjwnuHXVu3usuv2vVkZrIDWZLwvuDZRpONZqYKc57Gx
	t/Cdl48PvBL5E7kUalAwUSQ==
X-Received: by 2002:ac8:5ad3:0:b0:494:b722:141a with SMTP id d75a77b69052e-4b313fb8f60mr107758121cf.13.1756813836161;
        Tue, 02 Sep 2025 04:50:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+rzTco+7fQp7WZWydorG6/Vw8s23rOxW1SECVccT+ronOW4dFkZRBskA4ygd4Rv1M9i7TYQ==
X-Received: by 2002:ac8:5ad3:0:b0:494:b722:141a with SMTP id d75a77b69052e-4b313fb8f60mr107757911cf.13.1756813835705;
        Tue, 02 Sep 2025 04:50:35 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04132c77d9sm665564666b.20.2025.09.02.04.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 04:50:35 -0700 (PDT)
Message-ID: <4dff9cc2-2152-48a0-b8ab-eea57ce2ace2@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 13:50:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document static lanes mapping
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6da0d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=TNrL9Qa0OoqJGZUcVMkA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mYPuwvdfs4yCGwTJkhP_HkaISWIIDEG8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXxH4Oi4P3nJAJ
 2Lj1Cx1WLPF/h7IoJmuDuVb8DTA3aOStg+bUC3pZmnV3fB/5iecGxofyLxAKE7Y66rgjg+bIDl8
 aYtOcQast/1r3HYurcQVihgqWKLE+UmzkgxRkKj2rN+3ao2rezsdy3gUbyKxUI0nyzGsFsIoKGk
 qLM27akSxK/P2HGjcSJ2gzOx9tqZQeGISqJhjpNshjPG9Z/T3U0sk3hYMlUdstwVZo219DAZ4JP
 KSDyntoBKVUw8VOmITKDIW+3UEC/Z/EVWgl6bcFKq2tMxNOm3HPSoFMR514XawvMU60H618FTDS
 IhOja5kx/Jz3jt4xiK0lZsmXxNMti5Bg+IZb/EX9Am3Knqs4EcnhaMNU1JKCMbCifv8xprIybiN
 eGgej4EH
X-Proofpoint-ORIG-GUID: mYPuwvdfs4yCGwTJkhP_HkaISWIIDEG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On 9/2/25 11:00 AM, Neil Armstrong wrote:
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 2 DP + 2 USB3
> - 4 DP
> - 2 USB3
> 
> The layout of the lanes was designed to be mapped and swapped
> related to the USB-C Power Delivery negociation, so it supports
> a finite set of mappings inherited by the USB-C Altmode layouts.
> 
> Nevertheless those QMP Comby PHY can be statically used to
> drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector,
> etc... without an USB-C connector and no PD events.
> 
> Add a property that documents the static lanes mapping to
> each underlying PHY to allow supporting boards directly
> connecting USB3 and DisplayPort lanes to the QMP Combo
> lanes.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> index c8bc512df08b5694c8599f475de78679a4438449..12511a462bc6245e0b82726d053d8605148c5047 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> @@ -76,6 +76,35 @@ properties:
>    mode-switch: true
>    orientation-switch: true
>  
> +  qcom,static-lanes-mapping:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 4
> +    items:
> +      enum:
> +        - 0 # Unconnected (PHY_NONE)
> +        - 4 # USB3 (PHY_TYPE_USB3)
> +        - 6 # DisplayPort (PHY_TYPE_DP)
> +    description:
> +      Describes the static mapping of the Combo PHY lanes, when not used
> +      a in a Type-C dynamic setup using USB-C PD Events to change the mapping.
> +      The 4 lanes can either routed to the underlying DP PHY or the USB3 PHY.
> +      Only 2 of the lanes can be connected to the USB3 PHY, but the 4 lanes can
> +      be connected to the DP PHY.
> +      The numbers corresponds to the PHY Type the lanes are connected to.
> +      The possible combinations are
> +        <0 0 0 0> when none are connected
> +        <4 4 0 6> USB3 and DP single lane
> +        <4 4 6 6> USB3 and DP
> +        <6 6 4 4> DP and USB3
> +        <6 0 4 4> DP and USB3 single lane
> +        <4 4 0 0> USB3 Only
> +        <0 0 4 4> USB3 Only
> +        <6 0 0 0> DP single lane
> +        <0 0 0 6> DP single lane
> +        <6 6 0 0> DP 2 lanes
> +        <0 0 6 6> DP 2 lanes
> +        <6 6 6 6> DP 4 lanes

Would

oneOf:
  - [0, 0, 0, 0]
  - ...

or something similar work here?

Konrad

