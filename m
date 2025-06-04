Return-Path: <linux-arm-msm+bounces-60235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E445CACDED7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 207341895877
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 13:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B054128F933;
	Wed,  4 Jun 2025 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPftu2LN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9D028ECF6
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043167; cv=none; b=ffYJRodA4J6Jf1BRgX+R1wUrdAUi8XhAQTREDcwUWirT20CW88BXoIIEPAezynewaKVJ5JRo3+lItEI4M6IGlStzkgCbJaMEGOh1E+8+zxHVRnxnN07umP6/WmAFnMbSDbwJXe9km7MiFipyhUgKRj4jBrcvzkw1kfv0qQtuujY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043167; c=relaxed/simple;
	bh=wTGQA2MQdl24nKqbtgv4fmUZIT+gcMlYHT8VuLVGmyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMeru2pVeNkNFlpKGgPQWdgbOPKYjDHlaCllVRYTOiGW8dysQrYCSehORCgcGpju0U24Uli/bH8jvGdR9KriUs2VN0sCxjbcpJgOGxMEplD/vOVO6CgTr9jCX/TG1jmSFBCyOY9+sEhywRHbG+urjnQ/QpXq5y5L/2bB4AyGW9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPftu2LN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5548KRja000674
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 13:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AswgeJqCiwnzTJPIuOWk5TVVklGP7eakncy9+WM5WK0=; b=hPftu2LNVjzuOYgD
	QJLJSz8nBlytT11l5owXfIWEpJNojejLBK84ukSOs7+9yh9+q39+jmsjdLxKwIBC
	Kt0J1UDIZva9G+acYtDQ9+B0hHlop22mmQAI7kmJbYJCsfufLORoce9gNAlR8h8E
	6uIxS4p11HlvdiUNplzVqllCuOmlU4SHjWcxM23fxZe9xxvx+IK+QXNL3Lwg1i69
	YPTjTai975aW/25RBnkjnpE/CzmEQT3BVC1tRP2q/ea6ex7JsGndZDfXcDeVRkNZ
	+woW3yYpJKV9MZqdtNR2BxPpQ+gDCqGu8nfi+K9pmQtTTnn1TI8r+hiXkI+4OEDp
	b+u03g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q65t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 13:19:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee988153so1140755085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043164; x=1749647964;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AswgeJqCiwnzTJPIuOWk5TVVklGP7eakncy9+WM5WK0=;
        b=NS8YwwTmCAqZskMFZOecK+4flpCCc3UrRFQhMGU9Fm+7+r4s4/w2+SnwX7c479CmZ9
         js0b3y7oU0Y4DgbkRAUSncUPzaBBDgPoDSeter3IEkKzsHxC7579aXCh4XESJ+rLHxJG
         606gKWDG32NRdUBNEsoT6wJy5jwcy7DHa/gQHUH+N01DpsKKcnx6cCTyDDPhnoamDwx7
         0Xi4jIqlaJRLNmqleA2NkgQ9Eww/51zGd4wlFDOHyjt2Koiza3GYzNrblrqx/CWBy/Yh
         xOFwDDh0xSbPFbteOrQloJq2XIB7SBJYpH7L/t7WqYi9DptKcuYYs3leMfDZzwzvHIV2
         G9rg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ+ZFJCrcVOdVN+/CSJfsmjBkcDLWC/l3tLcGMRm3bcxAw2rUVw67mMi6EhceDIT5Hx1vLII5IuSZvqNPY@vger.kernel.org
X-Gm-Message-State: AOJu0YwVJKhzqKtIbcK2+rVSu4cSd5tvi+G1DlGbOHi0hKgY2dIEcaBU
	x5AYDKN33a+/H85ij7FpPBpfSki93wWiKNDzMIPafk9jkBtUGg47NTqK1bej9IYbZn32P4jmK3F
	j30NtsKTwlejUXCv0DsStQqxFrbijYgrGRAAcbJbFK2K/NCG5qBM0fGrxgOXNnhHzNkD6
X-Gm-Gg: ASbGncs+qcIfTKalQbWifpQ0oqVS40dBvfn/bXyeAMLBnhkj1+iybweY1I+4vfiMzuH
	IJs+x40ZFLj20eEDaqXtN7tOOcnlqAJX5NN8tDiRaPHXWlGDvZrVJ872wmuwC9xdf36XCZtjKFH
	28IQMWyrISOmWzh+2pCZJ4B48f5j9JNrdw8OFWZpG8XijWjkT6n5Sa+q1tmsGRB7EJUb5vG0xFr
	tj1pC73qEp2G+wN/ivg/AKCHfDtt5y3G7MdYjqmnXNR65XstTKWqjUciyDdw6fnrV7fbtsxN2b7
	PBWCbZ1Kz1LwiaYisYUlCM7j27X3hEVEAeIUgY5AFA7NtDlJ3gzNxHddD0YNeseSCKEm/5FSYVr
	2Z2kd50Q+PA==
X-Received: by 2002:a05:620a:17a8:b0:7ce:e010:88bb with SMTP id af79cd13be357-7d21a680f7fmr325496785a.22.1749043163550;
        Wed, 04 Jun 2025 06:19:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxd2DF9ZZitPuPShjI9mgm9ONIB9V2QAlo0khxT5DcL/JlA3x9QRIZjM9V+8DeFW1VeyZ+ng==
X-Received: by 2002:a05:620a:17a8:b0:7ce:e010:88bb with SMTP id af79cd13be357-7d21a680f7fmr325489785a.22.1749043162859;
        Wed, 04 Jun 2025 06:19:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd25cbsm23502601fa.89.2025.06.04.06.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:19:21 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:19:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, lpieralisi@kernel.org,
        kwilczynski@kernel.org, manivannan.sadhasivam@linaro.org,
        robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com,
        conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_krichai@quicinc.com,
        quic_vbadigan@quicinc.com
Subject: Re: [PATCH v1 2/4] dt-bindings: PCI: qcom,pcie-sa8775p: document
 link_down reset
Message-ID: <mzubbiwkfshplawugahzbtilibnq3wiy6bqetfarbv4kxw46rs@eranz4lm4bu5>
References: <20250529035416.4159963-1-quic_ziyuzhan@quicinc.com>
 <20250529035416.4159963-3-quic_ziyuzhan@quicinc.com>
 <drr7cngryldptgzbmac7l2xpryugbrnydke3alq5da2mfvmgm5@nwjsqkef7ypc>
 <e8d1b60c-97fe-4f50-8ead-66711f1aa3a7@quicinc.com>
 <34dnpaz3gl5jctcohh5kbf4arijotpdlxn2eze3oixrausyev3@4qso3qg5zn4t>
 <43a6e141-adab-42e9-9966-ec54cb91a6de@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43a6e141-adab-42e9-9966-ec54cb91a6de@quicinc.com>
X-Proofpoint-GUID: XRIdd53dz_RRDCe55I_co5tCrRnaSNaz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMSBTYWx0ZWRfXz1Ww29xUp7ml
 kOI0Avcv/c6eEaenQxk1nlggbvCV+bQw9UuvbN+pU9c3jaksKLRKgJOsAoBKiClLLit3KlSVn4q
 NOxVhy9cEo/Bjsaqv0jcSYP4MWnyzyeu5ld1jvT632v49HV1/ov4hQyHbYLEpxOwyke/XFXMdTz
 tYTW5kJFAz1J1rfUY0PxVCVTGMkhTzkGFPVKUeKkGYhchAz04G+DXMnZW/E25W9AiXRLVaQ90E+
 oj0bsLtsL/eY09SntL5ftUVjPFKqPxR/KMEMASz/QLcFJRx5ovJb0xmtS1oId6kBVSFj3wYJi1m
 OJ1c6sUzq7r5LcJAEs3Ov2vpo5hRyMJXtnwgQ2P0pZeg+X0ZR6gftljobTSidTMgpmns6dBCDW3
 SpGvbd1qf54BIZHKb0d02jOJjC7jg1SY7RqqlZM4yWOq9GMLzGd4goA/lU7eg9H3HXN2sclI
X-Proofpoint-ORIG-GUID: XRIdd53dz_RRDCe55I_co5tCrRnaSNaz
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=684047dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=JfrnYn6hAAAA:8 a=COk6AnOGAAAA:8 a=b_c0941waCFHaVHBhDUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040101

On Wed, Jun 04, 2025 at 06:05:21PM +0800, Qiang Yu wrote:
> 
> On 6/4/2025 5:15 PM, Dmitry Baryshkov wrote:
> > On Wed, Jun 04, 2025 at 03:58:33PM +0800, Ziyue Zhang wrote:
> >> On 6/3/2025 9:11 PM, Dmitry Baryshkov wrote:
> >>> On Thu, May 29, 2025 at 11:54:14AM +0800, Ziyue Zhang wrote:
> >>>> Each PCIe controller on sa8775p supports 'link_down'reset on hardware,
> >>>> document it.
> >>> I don't think it's possible to "support" reset in hardware. Either it
> >>> exists and is routed, or it is not.
> >> Hi Dmitry,
> >>
> >> I will change the commit msg to
> >> 'Each PCIe controller on sa8775p includes 'link_down'reset on hardware,
> >> document it.'
> >> "Supports" implies that the PCIe controller has an active role in enabling
> >> or managing the reset functionality—it suggests that the controller is designed
> >> to accommodate or facilitate this feature.
> >>  "Includes" simply states that the reset functionality is present in the
> >> hardware—it exists, whether or not it's actively managed or configurable.
> >> So I think change it to includes will be better.
> >>
> >> BRs
> >> Ziyue
> >>
> >>>> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> >>>> ---
> >>>>   .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml  | 13 +++++++++----
> >>>>   1 file changed, 9 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> >>>> index e3fa232da2ca..805258cbcf2f 100644
> >>>> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> >>>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> >>>> @@ -61,11 +61,14 @@ properties:
> >>>>         - const: global
> >>>>     resets:
> >>>> -    maxItems: 1
> >>>> +    minItems: 1
> >>>> +    maxItems: 2
> >>> Shouldn't we just update this to maxItems:2 / minItems:2 and drop
> >>> minItems:1 from the next clause?
> >> Hi Dmitry,
> >>
> >> link_down reset is optional. In many other platforms, like sm8550
> >> and x1e80100, link_down reset is documented as a optional reset.
> >> PCIe will works fine without link_down reset. So I think setting it
> >> as optional is better.
> > You are describing a hardware. How can a reset be optional in the
> > _hardware_? It's either routed or not.
> 
> I feel a bit confused. According to the theory above, everything seems to
> be non-optional when describing hardware, such as registers, clocks,
> resets, regulators, and interrupts—all of them either exist or do not.
> 
> Seems like I misunderstand the concept of 'optional'? Is 'optional' only
> used for compatibility across different platforms?
> 
> Additionally, we have documented the PCIe global interrupt as optional. I
> was taught that, in the PCIe driver, this interrupt is retrieved using the
> platform_get_irq_byname_optional API, so it can be documented as optional.
> However, this still seems to contradict the theory mentioned earlier.

I'd say, it should not be defined as optional.

> 
> >> BRs
> >> Ziyue
> >>
> >>>>     reset-names:
> >>>> +    minItems: 1
> >>>>       items:
> >>>> -      - const: pci
> >>>> +      - const: pci # PCIe core reset
> >>>> +      - const: link_down # PCIe link down reset
> >>>>   required:
> >>>>     - interconnects
> >>>> @@ -161,8 +164,10 @@ examples:
> >>>>               power-domains = <&gcc PCIE_0_GDSC>;
> >>>> -            resets = <&gcc GCC_PCIE_0_BCR>;
> >>>> -            reset-names = "pci";
> >>>> +            resets = <&gcc GCC_PCIE_0_BCR>,
> >>>> +                     <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
> >>>> +            reset-names = "pci",
> >>>> +                          "link_down";
> >>>>               perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> >>>>               wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> >>>> -- 
> >>>> 2.34.1
> >>>>
> >>>>
> >>>> -- 
> >>>> linux-phy mailing list
> >>>> linux-phy@lists.infradead.org
> >>>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 
> -- 
> With best wishes
> Qiang Yu
> 

-- 
With best wishes
Dmitry

