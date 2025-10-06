Return-Path: <linux-arm-msm+bounces-76044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914EBBDAE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2BBF94EA21F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA90D230BDB;
	Mon,  6 Oct 2025 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FhcZ85ZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C20C22FF22
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759746318; cv=none; b=IgeWq4nis/JIqy/lANpwXFIYonlJ01s7Xe2JH3OSVzdVYy8wDA262JFj/DRQ+3rn9xqNxVPbj8XzCZnhQo7rhseqWKa+dN4DrNaD5RUIJMB71gJo/YdmwfgBDUKWiIjQStdh5qf6DyGtl2A4X5aTSx8/TNW+aQpJYadR/LVYB4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759746318; c=relaxed/simple;
	bh=UJQ7ATeIZKqg+H6Nc/MG5lNeEF4JIpt4M+nHiSy6knk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiIoSHB2yavDZTaT5VbVltge6K5d2hcbnfkivaQawn30cYBZ+A1R1E6YMmPd977e0qu68eEF+zNaAky0NJsWTRd4M20KBdnSqb5wPFdYOkqpF7OzOyJ9WXjO1/ouiwbinf4BrFje8Al7k6vkpptWKO2pC3kyw9UliVHQk53JAUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FhcZ85ZC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960kr2P002823
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HBDnqR+G9iEwaHQ+SA6dOyDlxOy5jo2xatcpOEfaBqk=; b=FhcZ85ZCtkGl8qlM
	+BxR0U0WgNixSZ9oEEx+2uL9PgGDMIsVdRr9e5uJb+CCTSFGA8w/6KZyCE3l+xPC
	9kqtdR6Vw2nSYJT1epHyPozlbUiWVXmpRsfYcbOb0w6L7oZ9Cv4d2ypJYBijc1Gg
	xh/vR5o5o/FrtbTmOdvYRrIDuSD4mdf3j0L17E8LscjU0sceI5bxz/2ABFul1Z4y
	4VIYwNIyRdILSNmAjpIj2eB2874XZfJAiXkTThaHx4pZFwRvGWvNv3l+E2703r8E
	0pFPBeyfS8h519Fnuzk4oWTkDXNK9BpBxolZUhWOibmvjfacYB764zakstpQ5GHy
	ISAVXA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49k6bfjq4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:25:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-84fb3e80002so12105016d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759746310; x=1760351110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBDnqR+G9iEwaHQ+SA6dOyDlxOy5jo2xatcpOEfaBqk=;
        b=GmlKdz68GUyLeqa9KurUEZ5YDN93KPd89gbGfk1nN3l6/n4xa7F+mrKtf+0TEhGefb
         qe6ABgqlYcYf3LhWBdYWDOIBbWFQpRR1y6v/gttF25luXZkQJu6E+9iW8RyN296PLfoG
         9oD2E4eH5IR2Z6zD/pCxs8ioIWLyftVy7ngpN0GHSqAt7Ni5oXx6EIUA3ZCyBNKPQbDJ
         Rj7tZr9r9PWJ0rKf/aKYqi/WpWtJU09zuNs1LtPANW76dJvPY+vRkFAmYLASZiZl+qDU
         c8sQ+smXVSBRCriPswFFzY9PXw2eggre8ZqopBL8yG4olMWBzHcJQpmLUcpPjuc1guDt
         rdXg==
X-Forwarded-Encrypted: i=1; AJvYcCXIAalbSZRxmEZgRFGd0Gm1gaV81xLvPDmbsxuKQ/T3q7uAJE+8PsdAjwsRBM+1NRw3NWOm7mV8hO//kB6s@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9wE3TNuOkb+LMtQm0ZD4DlxlMl2wNMYXjeFTKt+fiEeRxFQ4F
	1cnRxGQTgiz707U/b0INb6VkD55TRK2eNqdGd/rdpEsZrd7snxrQCcbwDDX68Q8ZH2hwDioFSAj
	bMNyvhlK9jLM0Lo78VNZAqSH3zok3/8BfNg+jY713hYKkNocgtXgmLddZcg8wUJ1hezI5
X-Gm-Gg: ASbGncuqLPCvZmoSVDTjCLBJ6FuK7oTcrTrYhlVInFxa+/hqMhHVIbvo1p1HrZ0AzZR
	KAMTK11dXbQaAOm0mHyM3s3VdKJ8CDyZieU21+JNciBJZ+Yc0fnApDJ5oBzcaWP1jYp3WUqslD1
	iy5+AaghhbT2nHmi7gwXg1ZDZyCmVgmsYmbpF56JjmLDLO9tNfjVPbs9Bv4+qgDnuNFF+Du1K3B
	Z6ggkJhOFenVBuFkj3HRn5x6yYgeyve62H2Nck0QzkY4ZNukPjPFkaemEuEfeAxzz0GHbDMDapp
	v/U3DpTcuweNM7OxOm7AKntwMFoHMe6bZmeQngmhJNkiWT1EodO1F4NM7sqVkj8Mv0C/9cpI2Qe
	dzJIbvkF4fgv7mXn5DE1wpsX7PAY=
X-Received: by 2002:a05:6214:20a3:b0:763:83c3:5977 with SMTP id 6a1803df08f44-879dc7875eemr104493276d6.2.1759746309725;
        Mon, 06 Oct 2025 03:25:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAsA2+8LmsPWiW3AgLrAN4zG8ewGH8WJ0c21RL7gCTD0Oc50rVsz4UkK95aBRsmX1q0+0njA==
X-Received: by 2002:a05:6214:20a3:b0:763:83c3:5977 with SMTP id 6a1803df08f44-879dc7875eemr104493176d6.2.1759746309238;
        Mon, 06 Oct 2025 03:25:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3ad614sm9765621a12.1.2025.10.06.03.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 03:25:08 -0700 (PDT)
Message-ID: <38416f73-9570-4f01-b179-cb653a874b69@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 12:25:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
 <20250930-topic-x1e80100-hdmi-v4-3-86a14e8a34ac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-topic-x1e80100-hdmi-v4-3-86a14e8a34ac@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bYm5JN5JanV3F8dNXQyXrxI5orOg0ftC
X-Proofpoint-ORIG-GUID: bYm5JN5JanV3F8dNXQyXrxI5orOg0ftC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDEzNSBTYWx0ZWRfX/qhLvt6XIOiC
 Ilj2xqDtNbSPjovCta1qKBbjWMTPnFwIzJwFg39QLn6gvD0n13tYVBK9knLTToF7PZZmDGMpNiO
 r5dhqb+CON5OEmxMR6Xp/WCKDieFdl0BVZONsko4+RieZn3dJE8qW9nGHgwtUyDABz2w6hjvbMR
 Ovr7pwiB50B2Powxr24fHK6C+fF1cuoER1t9AhDPsFxzU+plybhaWiQeUhYXh3qotnYR+Sz2/LK
 gCYBsJ4JCnINc1ZPkR+ANv5nUlQ7vyKpCvkMHAfMyZBGDDCHyK3SMOS/JtS38v1wzKBWBDNiyYk
 EA1qcio49kpQr66w6HAN9a5E+G32NLLCs3H9YhfXnXC0mat17hJhNCmtjvCH2hPZvC0hAbPQRn8
 RNaJ60knlcEjicxWEn7HYayB/EUybw==
X-Authority-Analysis: v=2.4 cv=Hr572kTS c=1 sm=1 tr=0 ts=68e3990c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=b4hOb4oQgmsngjji8b4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040135

On 9/30/25 9:39 AM, Neil Armstrong wrote:
> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> connected to the third QMP Combo PHY 4 lanes.
> 
> Add all the data routing, disable mode switching and specify the
> QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
> the underlying DP phy.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			usb_1_ss2_qmpphy_out_dp: endpoint@0 {
> +				reg = <0>;
> +
> +				data-lanes = <3 2 1 0>;
> +				remote-endpoint = <&hdmi_bridge_dp_in>;
> +			};
> +
> +			/* No USB3 lanes connected */
> +		};
> +	};
> +};
> +
>  &usb_1_ss1_hsphy {

You have to move your _ss*2*_ node below the _ss*1*_ nodes

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

