Return-Path: <linux-arm-msm+bounces-64739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A02B03478
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 04:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5EA3169C6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 02:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64FF1DB92A;
	Mon, 14 Jul 2025 02:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wz6YCxqk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D7F1CEAD6
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 02:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752460091; cv=none; b=epsZt3fekn5bH1NHbPl+VHR0R4OopqZI3nQPbt28hyo/fTCxQzuco+rsWOmrrtEikPOFNUANyT3BzYYLo1n+6xw/KMXeTMB2qrqeg5c++de41u20j1YMCnfaUJthW7PzASVtTSrrgFaFZ0NNJgxr1CwZHa8fF5YvVFD9qIs2nlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752460091; c=relaxed/simple;
	bh=3nJgZl9vP4SdfX+E5yML/xW+OYiWq6C5glcWeET+8VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKJINivDLnp7nEBP/j3k6PunibennbAMzYPwu4IODaoDTazHQ6VZmF8c12LkYRtce4mXz1++INjMExmtJKFaxSyM0Fhppu8JqvPmiln+67PSpgUW7KjZpXZKCgnk+T2qrePHKYSxZ9oBK+zA1OvyCvSTnpFkjh46hl/6YiXHOpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wz6YCxqk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DL02lP000703
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 02:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8OpwaFzraWMloUlXGdAgiuapqHg/Vvr2jLfpvwdlYE=; b=Wz6YCxqkz1Ookwwo
	mwfv8M+KivyoXwwzHCHRR4PEuzJM4R/fuR1WjLum6Q7rwbARYOUeUHzA0x1wXleU
	JNESETe6FMEKAR3SoaAkf2lqHQ1FNQCUihgy2BaZ+zIsg1SoAnVqdcicUzbOZxiS
	zkCa5FP0Lrgz47fDh8KtRMuiu9AOHX1Go8/8QblPasIMYtcJob88q8z2sxlXyIyj
	BjTMhCaW+sD5E94aLdjRFdhuYh4Z+Gij4OLulq+Km+L/R8uy6PoDHdFBkRnAkBfQ
	DuwwyVrUxLriYtggCs1m1uk/lIru/aV26n0nIDIrSo+4M1SZiMTNF6smTYZ0q4G3
	QzjWNA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbaxkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 02:28:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3bc9d9590cso3592813a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 19:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752460087; x=1753064887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8OpwaFzraWMloUlXGdAgiuapqHg/Vvr2jLfpvwdlYE=;
        b=q/OAYPwViRCg41pzKRbnBZN5wypeAHOLpQ7PRFfWeTHabMhWKsa4ohsF0c9jfkSbrZ
         9z1GZ/622pdZ+hU+t8GV3Y7eBwn2FCvwD2ZuJER2K39cw27uRjFabKo94fDY0oDaZcr4
         B/1DOcDivNLoyMx0YfjBEC/KVTZsWGQiOyd0VWS+F89ZkYnJ7zfIih2qYixPM7pAWX7i
         cxm3UvUR+JKAm9ZLJlgqYbm/aON3pb7vz4t9oAzVRdQH9fwqY22cHN2zq+6CaktZ50u3
         RX1GQ9HV1VIBxlV3yAHuqxuz9LROMBLMSQMtQ28iAcaNpTwWwqwSQwoN61K60gDwBGTb
         tz/w==
X-Forwarded-Encrypted: i=1; AJvYcCXEkajLtUBV0iFqlm+oAuts3SulAweJAOprxHeD3Q1sihVEDSBJYVToPC9icUfAqHNXlK7UGgkNRObP+B8O@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf9ztsSxiFpQc6M8JnBbzbBHk0CK2MwleS9hipI2ABIPSBEC9n
	K6rqOOdy7xKmq5EP1ibWuZFKU3WLHgNnxUPlOf44lmlO5cUz118TgiIoo4kMQOWzPhKRyBCW9J1
	vGeSpbkzWGgcz6Rm61xn3pxTRCnjM/NUbLRp6zZTX+80a/armQnyU/45lSg6o1dXZ72pp
X-Gm-Gg: ASbGnct5givN+0Ci3lYfd7FeJdzrPI3Gy+q8cjszGz0kAiozuKNRykvw/dabWIrpi0Y
	8nx2lo7v/l4jBTYPAt4Sg6nRT5rFnctUMEliN8jwhYB2y0Bpu7PpGQiYilaQYcjWAAp8qYfL1j/
	3HQIwfCp04G37yOuyPmTkzluLmpTjejGMynX4hfHLFOSGs/s2nL8xtX2km0lv/rK6ah+EsKsgy1
	YyqsSbpDVNACgvUJvl/ym8yqys3wDhTU+xuW1g37FragBh6RxZh6Ii37C0xoXKeDxNkVrHp8HFW
	inr1JnQBBsLcD2X0LwPsVjwNQSM37KKKKalMKh5sMA+1QI0+Vzqnoif9QXqGBZxNSIEIoHjkVgg
	srvgFE5jJTcAUsqGGN5JNaO/Z0duM
X-Received: by 2002:a05:6a20:7491:b0:21f:7430:148a with SMTP id adf61e73a8af0-231201fa1f9mr17819873637.28.1752460087288;
        Sun, 13 Jul 2025 19:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERlTzQAbGBtic0xw9HUW209GmM3H8UeFAoNwCUVrD0zAm95+xPpoXxs/SybzhJTxECUBR7vQ==
X-Received: by 2002:a05:6a20:7491:b0:21f:7430:148a with SMTP id adf61e73a8af0-231201fa1f9mr17819826637.28.1752460086833;
        Sun, 13 Jul 2025 19:28:06 -0700 (PDT)
Received: from [10.133.33.227] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd598csm10053918b3a.17.2025.07.13.19.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 19:28:06 -0700 (PDT)
Message-ID: <465b60e7-fe68-407c-add4-856178f4cb7c@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 10:28:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Enable ethernet on qcs615
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAxMSBTYWx0ZWRfX13h0sj+EDTSx
 h/rspXm3T7ksyxhCTm3jfDJYtLNqk/bL3TO0Gy1WqCdBZugHa/5BVPXECNu4wg9ps/h05hiO1n0
 kdOEk1r8x6O/EO8Xpg+lUJNhCxlRIo9jnmtF98vWbi8z5jrjCy0/6XgMTE7aUqBYHezy8ko44Uq
 6p/jHgwiJBkSBKSkJwHlXJaYQ9Gjg5BAyeokwxuBTF8A7rS/+UNFCsFoizFwqQyJ2EXUtK9E/sa
 fLppCviwSIJQq4U/GjCu+BTFdnIkXd65nzDivOVsNNLKmu3nWENp6qyIgm+Z8W+ugBDmTaetg4E
 TvRQS+rq+mdDVYrwtjVe2BADZlKPKGS/HMR36y1aIO9eWGWR+ZNt5DKQr87aAi8FNUq+IEK7TjR
 cjBIPhEQDx53ZLupWIcufCPSGpzdvac7Vrp0GlxBV7uEOIShQV7n66Pg9j91FJuSJGYiUCG+
X-Proofpoint-GUID: 6AofoA_PZ6KPXtoPc9YAJKeeOxwB9f5f
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=68746b38 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=mTSKI_wBhsZyk7PTtHgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6AofoA_PZ6KPXtoPc9YAJKeeOxwB9f5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1011 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140011



On 2025-01-21 15:54, Yijie Yang wrote:
> Correct the definition and usage of phy-mode in both the DT binding and
> driver code.
> Add dts nodes and EMAC driver data to enable ethernet interface on
> qcs615-ride platform.
> The EMAC version currently in use on this platform is the same as that in
> qcs404. The EPHY model is Micrel KSZ9031.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
> Changes in v3:
> - Correct the definition of 'rgmii' in ethernet-controller.yaml.
> - Remove the redundant max-speed limit in the dts file.
> - Update the definition of 'rgmii' to prevent any further misunderstandings.
> - Update the phy-mode in the dts file from rgmii to rgmii-id.
> - Mask the PHY mode passed to the driver to allow the MAC to add the delay.
> - Update the low power mode exit interrupt from 662 to 661.
> - Update the compatible string to fallback to qcs404 since they share the same hardware.
> - Update base commit to next-20250120.
> - Link to v2: https://lore.kernel.org/r/20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com
> 
> ---
> Yijie Yang (4):
>        dt-bindings: net: ethernet-controller: Correct the definition of phy-mode
>        net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if configured with rgmii-id
>        arm64: dts: qcom: qcs615: add ethernet node
>        arm64: dts: qcom: qcs615-ride: Enable ethernet node
> 
>   .../bindings/net/ethernet-controller.yaml          |   2 +-
>   arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 104 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/qcs615.dtsi               |  34 +++++++
>   .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  18 +++-
>   4 files changed, 152 insertions(+), 6 deletions(-)
> ---
> base-commit: 9424d9acada6461344c71ac02f2f3fbcdd775498
> change-id: 20241224-dts_qcs615-9612efea02cb
> prerequisite-message-id: <20250120-schema_qcs615-v4-1-d9d122f89e64@quicinc.com>
> prerequisite-patch-id: b97f36116c87036abe66e061db82588eb1bbaa9a
> 
> Best regards,


Since my last submission, I’ve been working on an updated version of the 
patch that incorporates the feedback received and improves the overall 
implementation. I plan to submit the revised version shortly.

Please let me know if there are any additional concerns or changes in 
direction I should be aware of. I’d really appreciate any guidance to 
ensure the patch aligns well with the current goals of the subsystem.


-- 
Best Regards,
Yijie


