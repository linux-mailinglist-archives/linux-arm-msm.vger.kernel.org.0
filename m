Return-Path: <linux-arm-msm+bounces-86096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CE4CD4AEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 05:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE3C63009A82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 04:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112AC320A01;
	Mon, 22 Dec 2025 04:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSdVdvfX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gH0rTufT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482DD1F8AC8
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 04:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766376766; cv=none; b=rJoWeVPwjoLtUiXxFlN7JYpxeS0ijH3xVYHJMvn0jwxUBmXAlMe+DIXbKFh6Y7Ht1OlmdbYR1wPsYIawys5PN64P6rpBu1QqxzKvFj/ZNwPrjO07QDHCulB7XIDWndu6bMXpUeriwVBxfhMKiaxLzBaGQhyyjKU0px+LO/diiYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766376766; c=relaxed/simple;
	bh=uiGL6bI9E5xhV5thK+bUKPSVKRCLQkIzEcUzK7Tya30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REhfEW2LvJT0rnQ5vP6M+qQGlJYxS7nB1xFFpjNjv2WtwMTUQX72y0tvtuvVNQcPKOkoInZm/Ila/aoj4Vt9VJZABIVt4YOd74C+U20KTNLo7qErFl+Cv9/LtOqAI06VuE6taGPSsvrfpvzgErOksWSf4Ty/RIqQM/d5xTfz8ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSdVdvfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gH0rTufT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLMXrZp3107894
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 04:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=io5VZPhhZrnfLxSbtVM4Pb6q
	V0WDFXxp11fXTfGXScM=; b=FSdVdvfXTUW09YZj4ydMRPmjqSDB0a3dt+/vRzfh
	v634P01uY0GEMWMZN4zP9NUx3YNuFjOBrDp+/xqQTMmU+fqCvvSacq8wVUN6bgAw
	FWZ/6UV0IeVeJrmRIbGNf1kC/UskdI8w5HSMHyMjXfOpcRX6L8K/7LFog80RXHTP
	aBkNUaMIudfH2szKmdXWegywxEIFg/ik11anJni/Ck0hubUXB9EjZi98oFiblIwr
	dlEXgmvBXBw9qGVCnK2QujhRok7k/JxZpYoOBFGuB8Iv3kULe+I0rI2Ud1cF8adF
	DbRtG6SBT9Z773DsrRlqqkU5r6uWZ5kdW5jWmRKKqwvDTg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5n36kkp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 04:12:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34abd303b4aso10176776a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 20:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766376762; x=1766981562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=io5VZPhhZrnfLxSbtVM4Pb6qV0WDFXxp11fXTfGXScM=;
        b=gH0rTufToecYNjApsjFnM90Ilf3no917O2wfMEgrNCYIfSnq/VugSDiII6fFHOoqWB
         uUkqExykzyV3wEzUx5EL8uK+FA7WtP1+MRLs62GiFOUj0wewJgiCrDmGSpDXtl6C2HJf
         LsphnmTx81ZgR1sye3EB27ZuUpsJDrqxERHnBL9i386Oet9J2hLRd3etS5zpV6yk0ezQ
         gALHxNBSpL1ARQWS6eVBl0RlYfZatmom6GpsVcVURh5hvI8GmkIUssNKrPNImLpdZhSu
         sPTsJeznD4uEYRqb0Auklp4/i+QF/hrxX3KXcIHW0hi5yrMs6RezoVJgmi34yenJLFmb
         AqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766376762; x=1766981562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=io5VZPhhZrnfLxSbtVM4Pb6qV0WDFXxp11fXTfGXScM=;
        b=Vm4qXYB7OMCCVX+1h9DWUCPGZRYFIyAKqsn1JxO2DWXQ/NeAd+HMcms+6e1kRET5ck
         t/y7JfaH1M6uh7cgg9MphEi5vB+o1prBhJI+GuYN3X3zM6r5m7Pis/Y+2S0aiPmvugkL
         oyykRHmQjEhv/mRlGRHZ3gXwLwgxh3X97PalrCDYv+qbAHAMgG3qnACdtERPJQhAKD8g
         uR/dO5rTYicUmyYMOQJZgLTJmtzVWbLFcotOGD/88HXUzUNxgNTxKUicYm7x0bwya9p9
         LLhfJKljGCIxlpRJXrpg2UfOKPXIPyDHPnb5ab0IET2zf0f/G8FJNmFVLUdo2Be2FG1s
         8EUw==
X-Forwarded-Encrypted: i=1; AJvYcCUMfjeRae4chWNPI+2mCXkrhJtwIxzNOltMt5My9ipbPrD3rExC9Z8oFUdOlqLAme0tW74J77AziSwAwYHG@vger.kernel.org
X-Gm-Message-State: AOJu0YyQAQp0lw0s7XKBA2jryN/P5aoIu88GDeipXAh8fsnGHN5gSoxU
	d1znqoYRPOVlENY1iKOnQ+r56sIrvj9wT86GhzEUS8GyKSSvcAlDZR/7I0zndLwRB8SnLd2Aswm
	SUsquYWeZODZ5WVlLNqsIn3HOvbidtYTv6EaATIOJKUFeD8Bx4iuZxUoUra/GDeQsifBK
X-Gm-Gg: AY/fxX43BTcXkj1Sr8PLd2fOXdFh7AsFEhV3jjZL89+K0tNMQl2nNlh2hHMSj9+qX/Q
	d8xcb+a7GomNKn4MweAxqaHAxmaB90T3JJhlShtqPfnWmzNF+AjRvfnw0/S5vPM8/ZN1Yk6ebcq
	200HVqI37PuKubCVLZYQBu74UAW6ywKGD+aJAmlT9GGYg5qpquF6BSxsPmuXg7F5foNJ2G7RXoZ
	W4/Q2owXqDvOpOr6huaTXR+o+zhTsFpP3ez/rUbmqzzobBjsnf2fLDj0UMMv1HL/XWJ/5rjo3zM
	58XO7d47uYbINXNOol4AHcLYPHPe71PzlpLlPzWRDvH+kYRy16ACe9IV2tIVux7MYE8/c89J5E/
	uIimcaQIcpkFWLPMhxXlUZeub9yvf0IRFOCxNoLMnMFXd3Bb4rquBCKPEaLbOoVkb4Hzw45gG2H
	XS73z7ShtcC0B7/fq7O2imrlzulOBKMQLHGVht4s8=
X-Received: by 2002:a17:90b:33c9:b0:340:dd2c:a3f5 with SMTP id 98e67ed59e1d1-34e921235efmr8551039a91.3.1766376761762;
        Sun, 21 Dec 2025 20:12:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtjxZjxhbJ9a4spzMpfyauFiI1BR5fR5WYEOsvsf4JMslo4jt2FEXrVJMnaIe39yHda99Eew==
X-Received: by 2002:a17:90b:33c9:b0:340:dd2c:a3f5 with SMTP id 98e67ed59e1d1-34e921235efmr8551010a91.3.1766376761193;
        Sun, 21 Dec 2025 20:12:41 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e76ce0b4csm4338155a91.1.2025.12.21.20.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 20:12:40 -0800 (PST)
Date: Mon, 22 Dec 2025 09:42:34 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        George Moussalem <george.moussalem@outlook.com>
Subject: Re: [PATCH v8 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Message-ID: <aUjFMstHMHD7jgvz@hu-varada-blr.qualcomm.com>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
 <20251219031010.2919875-3-varadarajan.narayanan@oss.qualcomm.com>
 <20251220-amphibian-nippy-firefly-d4fac0@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-amphibian-nippy-firefly-d4fac0@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAzNCBTYWx0ZWRfX3owO7g4hlPum
 tlfxnDb5pbx5jwVVRWVFuL2bw2thm9wqCrYTB2ec98ELYcIxhhGEJ4VUQ3FJJs2M9kCDV6iQ6Q2
 mpqLJrG0tmY3P1hpp9tiLhFdEkNHMA8qC0vKiKrALuzpYrDz1DrX3ZExFuhuh22P0hr3kUfe4Ew
 kRH+3e0ge/7IrpGk10YNaxCkW57Z9Es0A/QKajswb5AAyZRdRxklkge9ROJiYjehtfzhwz0BmLZ
 6dbMKpNmh0yg1LVooEgWfIyQSXCBrgYz9qYw8eKi4oORtoC4K00Tb1uffNsBGaEmIovfIH1RgOh
 9l+TSpH02uIW5Dbn031Dmv7hpMnxJ+nXspuAcaUqp+G6F7KW2VZ6vvtkx4gUVGp3tHseF5cnLpI
 0phIR0yHwu7K4smBN9o8YYgBODRHGAYv3lWzPnY9bzI+3pHNC8Jo2+598LFAccSRyNybTYOQxDf
 eTEAZ5imbCRwAu7US0g==
X-Proofpoint-GUID: l-X2_yit89wMmutoboTolhQwJvJ2JUys
X-Proofpoint-ORIG-GUID: l-X2_yit89wMmutoboTolhQwJvJ2JUys
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6948c53a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=A8Rii4P67zMKQ2kysyEA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220034

On Sat, Dec 20, 2025 at 09:39:54AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Dec 19, 2025 at 08:40:06AM +0530, Varadarajan Narayanan wrote:
> > From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> >
> > Add new binding document for hexagon based WCSS secure PIL remoteproc.
> > IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.
> >
> > Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> > Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> > Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> > [ Dropped ipq5424 support ]
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> > v8: Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
> >     Drop ipq5424 support
> >     Update example to ipq9574 instead of ipq5424
> >     Change 'mboxes' description
>
> I do not see any "significant" differences in the binding. You ONLY
> dropped one compatible (no problem, why would we care?) and renamed one
> description in mboxs. No other changes, nothing, so I do not understand
> what was the significant difference here.
>
> Dropping reviews at v8 is really unexpected and to me it feels like you
> rewrite everything, which should not happen at v8.

Sorry about this. Was not sure if the changes introduced in v6
(https://lore.kernel.org/all/20251208-ipq5018-wifi-v6-2-d0ce2facaa5f@outlook.com/#t)
had your approval. Hence wanted to seek your approval once again.

> > ---
> >  .../remoteproc/qcom,wcss-sec-pil.yaml         | 172 ++++++++++++++++++
> >  1 file changed, 172 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
> > new file mode 100644
> > index 000000000000..0fe04e0a4ca5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
>
>
> Well, since you ask for re-review and I really cannot find the
> difference, then let's start nitpicking from scratch:
>
> Please use one of the compatibles, e.g. the oldest device, as filename.
>
> > @@ -0,0 +1,172 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/remoteproc/qcom,wcss-sec-pil.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm WCSS Secure Peripheral Image Loader
> > +
> > +maintainers:
> > +  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> > +
> > +description:
> > +  Wireless Connectivity Subsystem (WCSS) Secure Peripheral Image Loader loads
> > +  firmware and power up QDSP6 remoteproc on the Qualcomm IPQ series SoC.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,ipq5018-wcss-sec-pil
> > +      - qcom,ipq5332-wcss-sec-pil
> > +      - qcom,ipq9574-wcss-sec-pil
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  firmware-name:
> > +    maxItems: 1
> > +    description: Firmware name for the Hexagon core
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Watchdog interrupt
> > +      - description: Fatal interrupt
> > +      - description: Ready interrupt
> > +      - description: Handover interrupt
> > +      - description: Stop acknowledge interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: wdog
> > +      - const: fatal
> > +      - const: ready
> > +      - const: handover
> > +      - const: stop-ack
> > +
> > +  clocks:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
>
> What is this? How did it ever appear here? Sorry, but this is not a
> syntax present anywhere.
>
> > +
> > +  clock-names:
> > +    $ref: /schemas/types.yaml#/definitions/string-array
>
> Neither this. Look, I have never reviewed something like this:
>
> https://lore.kernel.org/all/20240829134021.1452711-2-quic_gokulsri@quicinc.com/
>
> NAK, that's not a binding style at all. Please do not invent completely
> different style.
>
> What's weird, this change did not happen at v8, so you still kept my
> review tag even after inventing this weird code.

These were introduced in v6 https://lore.kernel.org/all/20251208-ipq5018-wifi-v6-2-d0ce2facaa5f@outlook.com/#t by George, not me.
This is why I felt the changes were 'significant' and dropped your reviewed-by tag.
Will restore them to the way you had approved earlier and post a new version.

Once I restore the above to your approved version, can I include your reviewed-by?
Or, shall I wait for your fresh approval of v9. Please advice.

Thanks
Varada

> > +  mboxes:
> > +    items:
> > +      - description: TMECom mailbox driver
> > +
> > +  qcom,smem-states:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: States used by the AP to signal the remote processor
> > +    items:
> > +      - description: Stop Q6
> > +      - description: Shutdown Q6
> > +
> > +  qcom,smem-state-names:
> > +    description:
> > +      Names of the states used by the AP to signal the remote processor
> > +    items:
> > +      - const: stop
> > +      - const: shutdown
> > +
> > +  memory-region:
> > +    items:
> > +      - description: Q6 reserved region
> > +
> > +  glink-edge:
> > +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
> > +    description:
> > +      Qualcomm G-Link subnode which represents communication edge, channels
> > +      and devices related to the Modem.
> > +    unevaluatedProperties: false
>
> Best regards,
> Krzysztof
>

