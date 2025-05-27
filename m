Return-Path: <linux-arm-msm+bounces-59599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C0CAC59F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11A901BA825D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 18:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00DD280A4B;
	Tue, 27 May 2025 18:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p78TEFY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C6A27A915
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748369731; cv=none; b=hQu24L6L7aO3Fcj0Th8gQ2Xx2kGCQayDcLDMoVlO/DxyUasnT5RMgqz7gDbBthyJr1eruqRawU54SZWA/mAAJ3Cm96sIFH1ziN9dBveXTNQE2SIuJr7n64QXssfJFTnbeUqszZJcWZxgBXDS2DwMD6IJF7y6he50pC4E30IgFGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748369731; c=relaxed/simple;
	bh=zxQjR+nrUWNNLX+WQ5kgnXyHQ2cMKdlioEaSfwbXPMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKSaRbaBLwhgC8pdgy9Iexe9OBssfCn8YZEzZmQIYwpt5MTdUsnK+mM/7uuEoYP09W6MJjze6oLi2xfkdS4tx6GGYKODXuep3boL1+r3EaAzi2hbl/4ZgWgYE+feodeOt9XiCkv09rgwaEL7wzCTm1im07/9T27cnc9P/gthfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p78TEFY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RFYlRQ029130
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5FrToTgKpEpyWJyX95g1VDxp
	8dgYn5P0X/JsOpxJh/o=; b=p78TEFY2jsQtyhhi+hAXNn3jFQlqxg6hW44xxEHY
	dJxX8sPwnGrkdkOsaA+hMZ9MlouECNtEyrEPOv0WlVxGQqtrEl0/vHnOQ4SgJrcC
	zI1L7YFNoWb0LHiUKEIx+mON0ZtgsBoy38hpY1PNfBCDQ3SHXXUdGCV5ojzm3+ea
	Ha/lB94wG72keMuPeXa5QLqNFU2d/OaSn2wQLc+Lu+B33WRW8ihtM9SO48XU+F4F
	3Wbk1sPj7W+V2XGDPLUfGiVMtjIF7pdCtQSuz+qOtcVN9NMGPitdKxsH/i4gicm3
	z9MVA7MKHqWKlullz0JluK294yjLp2WSLGnF95krjnHhfA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992ht2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:15:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47689968650so28694771cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748369727; x=1748974527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FrToTgKpEpyWJyX95g1VDxp8dgYn5P0X/JsOpxJh/o=;
        b=Hb7OBIuLgcTm3B0KtGbVGNYgbahKLTUFoKH3Mby0Kjfq7oVeFTWnNyKPSxRAP7i/w9
         mpRwl07yLPCz4GYrhOepdZGqxfe0fZsQVM+64DSSGsWrSOCegNtei6xuUYHnqt9cRxsP
         VIP5xRIyo+v2oXaYuLmEmQFD5b/OEnDEaL0wDVuytOVwcY4Al3K05HSfNOsYit8/OXdR
         ithz+GTAtDJkH6p6UGpYVA+PsYhwpSanIEsFJfjouBDlYbDNVJ7ev39J0Yu9qJgY8Q4j
         xpkkLVlJSTlT31C8GGEZ4Nx4oJdhQZFInn4tEK9VL8qLYfz+ivP1+q7zBN8ymXWpYARh
         Hj4w==
X-Forwarded-Encrypted: i=1; AJvYcCVtMQKH9I2x7Z6xo1EPglUnX3igG6rAIUH10S8Qbo6SYkKII/IBks1u1aWAGRa+DtoH7mUlx7nqW4qt6y4p@vger.kernel.org
X-Gm-Message-State: AOJu0YwJhQ7rsnBmp5601nBiWG0B5EXQ4slQLKSj68nMaIikfbvkmIkN
	awAhZWjXrGVlKUVzJ2uzKq7lpdEVXqqvwuVvnWmypv3PB0BOzFDV5oMHzNNkrXq2/MwzGyENu+e
	Tl627q7edoY/aglqv3+yykcYeQDhDpVVj29vMSQNqL9Kh51lgXPCcosyUK2kUW/IOucRV
X-Gm-Gg: ASbGncspyHcdVxSZzH7HJ9FM5quTkWffrjZ4KcwYlmUirTQAvSQkosMW9YiUpTh6irz
	UEX6CMO+u4DLsVDGywn00FS2kEcAfSlQv+n3GBG6MjuhZiq6mcxp2n323We4OlxgLD+1Ygo6znl
	r5P2yEOTdq7wAH91T9CwBF7GFuiq5V8JU2uxTtZhF/5LRh9mvg+uYQTc86QUZPFkautmRQVuIB1
	xnGKSK4/dGc815NS1Ah8Hir2hLOV6w2a6Qr/ThaNKTbzMOMu2CxVSfrHKzpkkWPlOsNaKLG0644
	wKfXdndFt4oEMzAqm9WrMRAoK55WDxkzN6AF1lMk8WJ9+hU/xAscYtreKs5G4aRS8pVxvIaVej4
	=
X-Received: by 2002:a05:6214:401b:b0:6fa:99e5:3282 with SMTP id 6a1803df08f44-6fa9d2b15edmr237865196d6.39.1748369727104;
        Tue, 27 May 2025 11:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXA/YzgkL1inn42Tt4wzjgLoOU4auPxjkwT8XZ9UwiD7dtmlkR653zVXKnH6yCJzQBikHEPQ==
X-Received: by 2002:a05:6214:401b:b0:6fa:99e5:3282 with SMTP id 6a1803df08f44-6fa9d2b15edmr237864726d6.39.1748369726743;
        Tue, 27 May 2025 11:15:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5521d86fe3dsm1720727e87.29.2025.05.27.11.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 11:15:25 -0700 (PDT)
Date: Tue, 27 May 2025 21:15:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_jiaymao@quicinc.com, quic_zijuhu@quicinc.com,
        quic_mohamull@quicinc.com
Subject: Re: [PATCH v1] arm64: dts: qcom: Add Bluetooth support for qcs9075
 IQ-9075-EVK
Message-ID: <ecn6rv7ase2h2q3qjseunu5unftgicynvvrshd23j6ctxzd43p@bge5fhiq3cps>
References: <20250526054228.221095-1-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526054228.221095-1-quic_chejiang@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE1MiBTYWx0ZWRfX4QvSyAmUe+bP
 Zdb7fbwmiHWeb75zjzsZbTIjRlGi0ofUjV6kEMDZceIaRsg8LK9KEOgNVmwHODP5qXF6qhlfsEz
 w6/tRyhSmIEOrHfskE9ix3k/TwuQhHtWjwRtMhE+VHPvoSv/mFNLL/Lvp5MJxJfFxUu03K0Y6Wv
 BdAHw65XQv2rlJp5//ZuFXkQvRTs7Mj1MVDLXQDZCy6t9HDj072SFJ6m76telYD/Q2xwGhmCy7Y
 k7kOhMpxapMPtWuDCx1WAjfAzBIqxAioMyJUfOvjuipA0QmuiPqGkBYaAJHI2idp79jhyosyZ+4
 pCoZt12pCTXovy0Xoly92O/nx3ZMs9e+zEHKVEjLEdSBhlawaEiiS9bNd6aCNxKZHlmkqsk+n2k
 IjD8AbSmRVUPgIcx0S08wTUtfpX5WFg0mjAXuPAIax14n6rv0a0NN6ieOA2QNc0S5XSWuF7I
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=68360140 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=rGHGw5yESEm4sh0OadwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JWTZOcuZ82ta2fxIS-6eO3dWtoLZ2ENj
X-Proofpoint-ORIG-GUID: JWTZOcuZ82ta2fxIS-6eO3dWtoLZ2ENj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270152

On Mon, May 26, 2025 at 01:42:28PM +0800, Cheng Jiang wrote:
> Add Bluetooth support for qcs9075 IQ-9075-EVK
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> @@ -273,6 +300,21 @@ &uart10 {
>  	status = "okay";
>  };
>  
> +&uart17 {
> +	pinctrl-0 = <&qup_uart17_default>;
> +	pinctrl-names = "default";
> +	qcom,load-firmware;
> +	qcom,xfer-mode = <1>;
> +	status = "okay";
> +
> +	/* HS UART Instance */
> +	bluetooth: bluetooth {
> +		compatible = "qcom,wcn6855-bt";

NAK, missing PMU supplies. This wasn't tested against schema. Please
read internal docs on sending kernel patches before sending the next
iteration.

> +		pinctrl-names = "default";
> +		max-speed = <3200000>;
> +	};
> +};
> +
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
> 
> base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
> prerequisite-patch-id: 853eaf437b81f6fa9bd6d36e6ed5350acaf73017
> prerequisite-patch-id: 6d9fd3e0257f120cff342c287774454aad2be2e8
> prerequisite-patch-id: 736cbcd47d5e7cfcc53fcaa7da920eac757ce487
> prerequisite-patch-id: 4eddce6daeaa125f14380586c759f8cb8997c601
> prerequisite-patch-id: baac180e8715b5cf2922f79346440d92569704f6
> prerequisite-patch-id: 65730290d31f18e66e2ba0dfdeb1844d7442c272
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

