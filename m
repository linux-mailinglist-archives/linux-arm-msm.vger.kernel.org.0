Return-Path: <linux-arm-msm+bounces-43705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E679FED13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 06:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4280C1882FE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 05:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C6F1714A5;
	Tue, 31 Dec 2024 05:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SRt3Q272"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C531662E7;
	Tue, 31 Dec 2024 05:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735624687; cv=none; b=AdMiSYzpoxI74qW7NVVzgLN8px98J0JPxOfxUiVooeyEs2j/Lv7HZ0CSvzDNFKQE0kJ5q80sdeP8tEQObomAUzSte3mJETG2jH8B4rcFOPOv0L3Ubzsi2f8sakhk7YvDurTheTgtHpE1KCIjpgYrekbrxx+IHLeo+PD8J/Sbhr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735624687; c=relaxed/simple;
	bh=bSkGNIkNgIkNPIUhPfbjI7PNGmITCV7EEIOegGxRgk8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAukTUPGbSP6VRTDTDYccYbW4Ui+SbyO6BaZFK2aLMOeKMnbmbCK22EVD0GfdZ1shaEfVSdfjfaUQhME6XFtProXZBkwXCH5Yy1kGJMAPa/DdWnHxb99YuhZn3As1ToIHRWtkPvCfuh3RlcukeqL/ndeYWBGlBN6/aRBUzpPu80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SRt3Q272; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV4qWWY018892;
	Tue, 31 Dec 2024 05:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NBub3KNw7gPNCpWsD0AzVTBA
	z+zryfHe9eRAPgFBtbU=; b=SRt3Q272Sa+hKOyTU62lnNtjizf6aVbISF4/UlvD
	ZH+qdkMoL1o7bz9LJdUkbx4pdnCtxU7bsi4ZUuDJzK/nlIlaS8FhtROunitpJA3W
	w15eVizTFetyl8yuprB93jGUdr9P/cxZcjEozR44qoff8XbINL9PwsVulKqdJJw6
	+vvJGsthDTtwywmHXgykMIYGpbDUzZgqv1QvSeZ7MGJ/v8/IEi/hYPZWMWP33Jx6
	oGa7vZAgMF50aHgazkxOit6rr0CR1ZXa7Kn3uQiO4aFxVpRvaCcD/mQwxUBmuZ5/
	aesYjS1axuBVdcJBHo9WpMAp+Q30Blp9VjwuWEjrfvnJww==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v9yk844s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 05:58:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV5w0A0014005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 05:58:00 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Dec 2024 21:57:56 -0800
Date: Tue, 31 Dec 2024 11:27:52 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Sricharan R <quic_srichara@quicinc.com>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
Message-ID: <Z3OH4E6YIAJ2varv@hu-varada-blr.qualcomm.com>
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
 <20241231054900.2144961-2-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241231054900.2144961-2-quic_srichara@quicinc.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 32NzHXs_6BC096FIuBkjUk5WcOWJG7y0
X-Proofpoint-GUID: 32NzHXs_6BC096FIuBkjUk5WcOWJG7y0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1011 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412310048

On Tue, Dec 31, 2024 at 11:18:59AM +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>
> TMEL SS provides different kinds of services like secureboot, remote image
> authentication, key management, crypto, OEM provisioning etc. This patch adds
> support for remote image authentication. Support for rest of the services can
> be added.
>
> The QMP mailbox is the primary means of communication between TMEL SS and other
> subsystem on the SoC. A dedicated pair of inbound and outbound mailboxes is
> implemented for each subsystem/external execution environment which needs to
> communicate with TMEL for security services. The inbound mailboxes are used to
> send IPC requests to TMEL, which are then processed by TMEL firmware and
> accordingly the responses are sent to the requestor via outbound mailboxes.
>
> It is an IPC transport protocol which is light weight and supports a subset of
> API's. It handles link initialization, negotiation, establishment and
> communication across client(APPSS/BTSS/AUDIOSS) and server(TMEL SS).
>
>    -----------------------------------------------       ---------------------------------------------------
>   |                                              |       |                                                 |
>   |                 SOC  CLIENT                  | SOC   |                TMEL  SS                        |

Fix alignment for last character in above line.

>   |                                              | AHB   |                                                 |
>   |     ----------    ---------   ---------      |       | ------    -------     --------    ------------  |
>   |     |        |    |       |   |       |      | WO    | |     | R |     |     |      |    |SERVICES   | |
>   |     | APPS   |<-->| TMEL  |<->|       |------------->| | IN  |-->|     |     | TMEL |    |--------   | |
>   |     |        |    | COM   |   | QMP   |      | RO    | |     | W | QMP |<--->| COM  |<-->| a) ATTEST | |
>   |     |        |    |       |   |       |<-------------| | OUT |<--|     |     |      |    | b) CRYPTO | |
>   |     |        |    |       |   |       |      |       | |     |   |     |     |      |    | .. more   | |
>   |     ---------     ---------   ---------      |       | ------    -------     -------     ------------  |
>   |                                              |       |                                                 |
>    -----------------------------------------------       --------------------------------------------------
>
> This binding describes the component responsible for communication between the
> TMEL server based subsystems (Q6) and the TMEL client (APPSS/BTSS/AUDIOSS),
> used for security services like secure image authentication, enable/disable
> efuses, crypto services. Each client in the   SoC has its own block of message
> RAM and IRQ for communication with the TMEL SS.
>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>   [V2]  Added HW description as per comments.
>         Removed the fallback compatible.
>         Fixed naming convention to TME-L in all places.
>         Fixed indendation for example.
>         Removed the 'description' for some items.
>
>  .../bindings/mailbox/qcom,tmel-qmp.yaml       | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml b/Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml
> new file mode 100644
> index 000000000000..a434359e0a2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/qcom,tmel-qmp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm TMEL IPCC channel
> +
> +maintainers:
> +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
> +
> +description:
> +  TMEL SS provides different kinds of services like secureboot, remote image
> +  authentication, key management, crypto, OEM provisioning etc. This patch adds
> +  support for remote image authentication. Support for rest of the services can
> +  be added.
> +
> +  The QMP mailbox is the primary means of communication between TMEL SS and
> +  other subsystem on the SoC. A dedicated pair of inbound and outbound mailboxes
> +  is implemented for each subsystem/external execution environment which needs to
> +  communicate with TMEL for security services. The inbound mailboxes are used to
> +  send IPC requests to TMEL, which are then processed by TMEL firmware and
> +  accordingly the responses are sent to the requestor via outbound mailboxes.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,ipq5424-tmel-qmp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      The first cell is the client-id, and the second cell is the signal-id.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - mboxes

Should 'mbox-cells' also be a required property? Since tmel_qmp_parse_devicetree -> mbox_request_channel seems to expect it.

-Varada

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    tmel_qmp: mailbox@32090000 {
> +        compatible = "qcom,ipq5424-tmel-qmp";
> +        reg = <0x32090000 0x2000>;
> +        interrupts = <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;
> +        mboxes = <&apcs_glb 20>;
> +        #mbox-cells = <2>;
> +    };
> +
> +...
> --
> 2.34.1
>
>

