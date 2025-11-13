Return-Path: <linux-arm-msm+bounces-81601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6609C576B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 13:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0173E4E1D41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 12:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754F134DB6A;
	Thu, 13 Nov 2025 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDxCiDHQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiayYikV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0F327B4E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763036756; cv=none; b=ochv6F2USGt9lYzF6CJqY14n5W+hSJTU3gfNsp4XjHbrVbYNsUVY2+hnXWXj2iY1xiKAFZwb/XYkFUtl0d5frouX6lGqXDROwz9XKvhS1QBwvNzQ0t6dV/UzBla3WignasqUbgfr2F890b1tzroZFZe+KCpxe6Wb4IPXeL9g32M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763036756; c=relaxed/simple;
	bh=4f1Zjw1zCq47Ur2vodP9rbPlRo/8QwIyPNmawQp8sOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ce0LoofVToalbN6e0jqNeSCypEyaF/wcfnNFjJgjXsf7NJoA7rgPiaZThuimBEdU9w1y/6YSj9hbkekT/x5ki3sD28STFf6xABcOfzVfxO9gg1C17lBLil7GAKvgYuAErB41ShJigKRa4Si06JoefxhCmuNa0ckx4EbGNIJ+qmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDxCiDHQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiayYikV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD8d63s2993501
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wygzyebzYJNMZqpqCjdykX+g
	xqQ5wcv57efQBabWDfI=; b=DDxCiDHQMivdVXcbKpUJRqBq1RHC0KLJJRapRP/u
	82XlkvpKvud+un9zRIKgVaWx73J250lDKxyMUpL/RHfpQlctODCewEskRNLU/l8o
	8L2b3uhr0L++PjfhrDhV9cWIajs/GtRPeW/tZglgU55oYXttDeYdNji6yqiq5FPs
	qODam1xnt66jOb4H1UG43VvAoINCRIND8uzpO8JwKXaRH4KzDQmNmeUj3QmOG2YW
	0jjv2KALidH2bwWG58qxmARBm4usG5fi7y7Vufgcie7ZbqsAKdwSe2vPUQ2p489Z
	0FCOw3gouoc/oio3He1W1XZt/aFz73mjB+E1jOTKr/LCgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad47jj5ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:25:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed5f5a2948so18156861cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 04:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763036753; x=1763641553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wygzyebzYJNMZqpqCjdykX+gxqQ5wcv57efQBabWDfI=;
        b=YiayYikV7H32ieLQtSy8zXTR8+qycpwcpGvUiwjhSdMmpjg1gRu9tgNk/WOOt3gVQD
         AsPFHQOPxb94HR+ZIxVeRFPwrS2wA1KP7IBHwqegSx3hHiziKdsFA+Dy3uQXpDH7lbWT
         +rGumdr23CVKNZPtyf1CgVu2g+zsrm27UnZWoxzkuFcdOC5tLBxlwx7uUSF1RsMbDNCS
         bSaC1h7Dsnw6U2/rQFRyRFiFwatKPvQ1qxSiR8SAglyCs6v2M61ytNOMF62PzstSObln
         Ae2gwQUbMmGExxWic5jbiTUy3bjP4lT/+mKN7QxZdk2PnFl1wl1sd2yWyO3sbmHcqnaF
         6/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763036753; x=1763641553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wygzyebzYJNMZqpqCjdykX+gxqQ5wcv57efQBabWDfI=;
        b=Mm4Om82weaG2m8jvhbXubYrwWZtrHcEgD09yLu0QCq5rjKjOjzH47oINMvfVzc1Ev6
         3rDB8+g8U67N2EQvgBQxPh8aijEFI2K9cSHl4M2anGhLBR8O3gvlBX7hQb8k/oV6mnP/
         QY6niauT0Em2wlPIUuhFhmktbEpxTt56I+xu1wPxWEQy/jqLVlt9mL2J9ISgz+nRO6hl
         mujUA5OaZuupZJHFRlpmeUtaL8RejHxdPX7sxQGFXLdK1i/mKW4M+ylNOhvXpZxot7pD
         eH24jj4T9MwoR0w9irQigaUljkhz7onNV4P9JHg6jWBKErWyxrXsTXlqdz4+7ueO10iJ
         Gw6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLmovVdRG6tr3npNnDIzkJ7mjuk14H033Nez5gzHVInWfOJsM21l4ELCWkUJmOgje6ItSbbaIj0YFyPMDv@vger.kernel.org
X-Gm-Message-State: AOJu0YwhitgIXgFXnNedypMwq8gdrWH+N4lB3L9nh6+Re7UCo62HYyrU
	JpbpYZ0yylmtoIM1AERhBKa41wii3vTrUsi24+tpQ3xFXUzdR5P6swd7hlRa3sohl/DO2zHevno
	/CbKCCHR06eSykj3z2vdo7zrLIM235TLSz1T24Jif/enU85cboQYoWDBFkj3eOnmK3Zum
X-Gm-Gg: ASbGncuorIS+iwUk3o+ebKtjETiEKLpaN1WmahrZc6u9NhvsY2WXsn+ymP7VJcJXNND
	22EYGMJIrwYDlg+br+w11tUqAWam1jCwrl2b4RjwsQJIPBEOE/MDG8Hpj2t1oiGIkTME6xiGUBT
	Q7rMwNT/k9x7g/ToKKFMxl+DlA1+8vxqyWUw2FlKT4SB4o9vuIA4tKuc8Lae2DfwObnXlGXRY1y
	knxKxELOLsdrUqCO56yxFZsdal70MwJ84QaM5bJ/TkjbST7wvmLsYrd7Q99AAIMD9+BIfRRVZeL
	ohb5S9/eKKi0n+gPdf/vLVasgdgQcJjWMBHDdbzyhHC8hbWHJfIi1wY5vO5q16OCkbgqgUeEKXN
	7s7l7X4aTc4MpnuN0UHyfNF2Ys0GEPif+T35SToiiCH2RBDFttgSZx/AM6NwIjFzlHkdCnQl79v
	6Uk1OO4Q9CLx0f
X-Received: by 2002:ac8:5f94:0:b0:4c4:dfac:683f with SMTP id d75a77b69052e-4eddbe1c3e3mr88980571cf.56.1763036752715;
        Thu, 13 Nov 2025 04:25:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPgUir/gxQ0BS5g947vsiBdKwcdqknLcUDWg+UY3VwNvd5Mq0nQvdnu7KRIrQj37IVNdbiDA==
X-Received: by 2002:ac8:5f94:0:b0:4c4:dfac:683f with SMTP id d75a77b69052e-4eddbe1c3e3mr88980061cf.56.1763036752047;
        Thu, 13 Nov 2025 04:25:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040eed4sm369960e87.110.2025.11.13.04.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:25:50 -0800 (PST)
Date: Thu, 13 Nov 2025 14:25:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Kaanapali
Message-ID: <we7qsu2aivdnqttvxzveiryp2axy3dxu4dw7s43xmytxnaifzt@ajyt5y4cqwy5>
References: <20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com>
 <b623c7f6-f28f-49ba-b6f6-25084117a6b3@oss.qualcomm.com>
 <l4mb5pi7kz7uuq6o3eueoxl2ngt2sdd6dv3kyudw6i54co5v5h@w6ya2nuas322>
 <ad00835e-bc20-4f97-aba6-e1b4f5e97191@oss.qualcomm.com>
 <f2q7a7r7quq6pplcn3kklwrhdc6hxa5zvc7osygshtyurwyvi4@t5iyragt7irh>
 <b5ecf5e7-4dc4-41ac-9b56-7c52afacb950@oss.qualcomm.com>
 <01de9616-825b-4fbb-83cf-e0bf91e8cf39@oss.qualcomm.com>
 <81174278-c3c4-4dc6-856e-b58aa2cb6fea@oss.qualcomm.com>
 <br3fmilhh7fihv4atnf4olvy4w66z4p7sh4ypicuc3766ky6tb@pppfdynfhfz7>
 <bf706156-1413-42cb-a463-803063c347fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf706156-1413-42cb-a463-803063c347fc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5MyBTYWx0ZWRfX6j94I05VLk8P
 xiI00xebrtSZXPXYiYuAN4mK40DyiZDQotM5NDdjGXI+TL8K8FlAbQnyfaUz/9O4Dh57FlWtUnE
 1yRz45HnDs+0VMun2ViZLJOwY3qtixNNakXjVCtNbb43H749eb6FjDDXMP68EQ4Sp8WTZOiFsY2
 ASRFI0v3a7MjCavg7T0sOsP2TciP6M3rCAI+uyQ1QAjvObxbDENoFr/zGMiqdKQUaTvDwJGi3Na
 soiEpkSK7Hw3e3SNG/wI2BaPRhiTJOb2mbSUYTSMuR76/PG5hexGjMsoH88drZHWMu8zbskfi6S
 r362ZHsqfICCSI9u3DJ0mqi8ab0V5yEF7+b45Usvy919KobcYVC2XWKGoUmD/qsYXiDz0db8zmk
 TbHaz7CjThWMzG0klbbuWjM8d+bZrA==
X-Proofpoint-GUID: 5fqsf7xjbZ9tOZqqV-iDdig9pN-I1Apr
X-Authority-Analysis: v=2.4 cv=A5Fh/qWG c=1 sm=1 tr=0 ts=6915ce51 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jYguEzgl6mIPwd92HLwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 5fqsf7xjbZ9tOZqqV-iDdig9pN-I1Apr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130093

On Thu, Nov 13, 2025 at 06:03:33PM +0800, Aiqun(Maria) Yu wrote:
> On 11/12/2025 12:05 AM, Bjorn Andersson wrote:
> > On Tue, Nov 11, 2025 at 08:27:17PM +0800, Aiqun(Maria) Yu wrote:
> >> On 11/7/2025 12:24 AM, Konrad Dybcio wrote:
> >>> On 11/6/25 11:16 AM, Aiqun(Maria) Yu wrote:
> >>>> On 11/6/2025 5:06 AM, Bjorn Andersson wrote:
> >>>>> On Tue, Nov 04, 2025 at 01:35:01PM +0800, Jingyi Wang wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 11/4/2025 12:02 PM, Bjorn Andersson wrote:
> >>>>>>> On Tue, Nov 04, 2025 at 11:34:25AM +0800, Aiqun(Maria) Yu wrote:
> >>>>>>>> On 9/25/2025 7:23 AM, Jingyi Wang wrote:
> >>>>>>>>> Document the qcom,tcsr-kaanapali compatible, tcsr will provide various
> >>>>>>>>> control and status functions for their peripherals.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>>>>>>>> ---
> >>>>>>>>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
> >>>>>>>>>  1 file changed, 1 insertion(+)
> >>>>>>>>>
> >>>>>>>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> >>>>>>>>> index 14ae3f00ef7e..ae55b0a70766 100644
> >>>>>>>>> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> >>>>>>>>> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> >>>>>>>>> @@ -48,6 +48,7 @@ properties:
> >>>>>>>>>            - qcom,tcsr-ipq8064
> >>>>>>>>>            - qcom,tcsr-ipq8074
> >>>>>>>>>            - qcom,tcsr-ipq9574
> >>>>>>>>> +          - qcom,tcsr-kaanapali
> >>>>>>>>
> >>>>>>>> It looks good to me. Glymur didn't have this functionality verified yet.
> >>>>>>>
> >>>>>>> You spelled Reviewed-by: Aiqun Yu <..> wrong.
> >>>>>>>
> >>>>>>>> Remind for review.
> >>>>>>>
> >>>>>>> No need for that, reviewers will review when they have time.
> >>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>> Hi Bjorn,
> >>>>>>
> >>>>>>>
> >>>>>>> But that said, most modern additions to this binding follow the common
> >>>>>>> format of qcom,<soc>-<block>.
> >>>>>>>
> >>>>>>> So I would prefer this to be qcom,kaanapali-tcsr.
> >>>>>>>
> >>>>>>> Regards,
> >>>>>>> Bjorn
> >>>>>>>
> >>>>>>
> >>>>>> qcom,tcsr-kaanapali is used to distinguish with binding for GCC:
> >>>>>> https://lore.kernel.org/all/20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com/
> >>>>>>
> >>>>>
> >>>>> So, qcom,kaanapali-tcsr is the clock controller region of TCSR and
> >>>>> qcom,tcsr-kaanapali is the non-clock controller region of TCSR?
> >>>>>
> >>>>> Sorry for not understanding that earlier, but this doesn't work for me.
> >>>>>
> >>>>> It's a bit of a lie that TCSR_MUTEX is a separate node in devicetree,
> >>>>> but it's always an nice chunk of 256K in the beginning (or end in some
> >>>>> cases?) of TCSR. But for the rest, there should be a single tcsr node in
> >>>>> DeviceTree and that one node should be a syscon and a clock controller.
> >>>>
> >>>> I've been dive deeply on this tcsr block. And actually the tcsr clock
> >>>> controller part is a very small trunk size(0x1c) of the tcsr block. And
> >>>> this block have contain other multiple purposed sys registers. So maybe
> >>>> we can have a more discussion on how to have device tree node describe
> >>>> this situation? It is not straight forward that to have a non-tcsrcc
> >>>> related area being described in tcsrcc.
> >>>>
> >>>> What about option 1 (tcsr_mutex + tcsr_dload_syscon + tcsrcc):>> tcsr_mutex: hwlock@1f40000 {
> >>>> 	compatible = "qcom,tcsr-mutex";
> >>>> 	reg = <0x0 0x01f40000 0x0 0x20000>;
> >>>> 	#hwlock-cells = <1>;
> >>>> };
> >>>>
> >>>> tcsr_dload: syscon@1fc0000 {
> >>>> 	compatible = "qcom,tcsr-kaanapali", "syscon";
> >>>> 	reg = <0x0 0x1fc0000 0x0 0x30000>;
> >>>> };
> >>>>
> >>>> tcsrcc: clock-controller@1fd5044 {
> >>>> 	compatible = "qcom,kaanapali-tcsr", "syscon";
> >>
> >> Remove "syscon" here. Not need for tcsrcc fallback to "syscon".
> >>
> >>>> 	reg = <0x0 0x01fd5044 0x0 0x1c>;
> >>>> ...
> >>>> };
> >>>>
> >>>> What about option 2 (tcsr whole block + tcsr_mutex  + tcsrcc):
> >>>>
> >>>> tcsr: syscon@1f40000 {
> >>>> 	compatible = "qcom,tcsr-kaanapali", "syscon";
> >>>> 	reg = <0x0 0x1f40000 0x0 0xC0000>; //align with the whole hardware
> >>>> block design.
> >>>> };
> >>>>
> >>>> tcsr_mutex: hwlock@1f40000 {
> >>>> 	compatible = "qcom,tcsr-mutex";
> >>>> 	reg = <0x0 0x01f40000 0x0 0x20000>;
> >>>> 	#hwlock-cells = <1>;
> >>>> };
> >>>>
> >>>> tcsrcc: clock-controller@1fd5044 {
> >>>> 	compatible = "qcom,kaanapali-tcsr", "syscon";
> >>
> >> Same here, don't need to have "syscon" here.
> >>
> >>>> 	reg = <0x0 0x01fd5044 0x0 0x1c>;
> >>>> ...
> >>>> };
> >>>
> >>> Is there anything wrong with what we have done for x1e80100?
> >>> ______________________
> >>> |             |       |
> >>> | TCSR_MUTEX  | mutex |
> >>> |_____________|_______|
> >>> |	      |       |
> >>> | RANDOM_REGS |       |
> >>> |_____________|       |
> >>> |	      |       |
> >>> | TCSR_CLKS   | tcsr  |
> >>> |_____________|       |
> >>> |	      |       |
> >>> | RANDOM_REGS |       |
> >>> |_____________|_______|
> >>>
> >>
> >> Second you! We can firstly have a option selected for kaanapali, and
> >> then other platform can be followed or fixed afterwards.
> >>
> >> Here suggest to have option 2 which is remove "syscon" from tcsr clocks,
> >> and only add the whole "syscon" to "tcsr" whole block.
> >>
> > 
> > I think you misunderstood Konrad, or perhaps I misunderstand you.
> 
> Maybe let Konrad help to explain more here. I thought the chart below is
> very clearly indicate the tcsr_clks is only part of the tcsr block.
> 
> > 
> > This is what we have for Hamoa:
> > 
> > tcsr_mutex: hwlock@1f40000 {
> >         compatible = "qcom,tcsr-mutex";
> >         reg = <0 0x01f40000 0 0x20000>;
> >         #hwlock-cells = <1>;
> > };
> > 
> > tcsr: clock-controller@1fc0000 {
> 
> 
> It is not a clock-controller start from 0x1fc0000.
> 
> >         compatible = "qcom,x1e80100-tcsr", "syscon";
> >         reg = <0 0x01fc0000 0 0x30000>;
> 
> This is what we have a discussion initialized here:
> "qcom,<platform>-tcsr" is only a tcsr clock controller binder, reference
> from [1].

SoC-tcsrcc? Make it more obvious, please.

> "qcom,tcsr-<platform>" is a common tcsr block. reference current binding
> patch.

SoC-tcsr, please, if it didn't land yet.

> 
> For below hardware block information, is it really a recommendation to
> combine the tscr block with tcsr clock controller all together?
> ______________________
> |             |       |
> | TCSR_MUTEX  | mutex |
> |_____________|_______|
> |	      |       |
> | RANDOM_REGS |       |
> |_____________|       |
> |	      |       |
> | TCSR_CLKS   | tcsr  |
> |_____________|       |
> |	      |       |
> | RANDOM_REGS |       |
> |_____________|_______|
> 
> [1]https://lore.kernel.org/all/20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com/
> 
> 
> >         clocks = <&rpmhcc RPMH_CXO_CLK>;
> >         #clock-cells = <1>;
> >         #reset-cells = <1>;
> > };
> > 
> > This is exactly what I suggested above and Konrad is asking you why
> > this doesn't work for Kaanapali. The addresses are even the same, what
> > is the problem?
> 
> The problem is the current patchset document a separate tcsr block as a
> mfd. While the suggestion here is to use the tcsr clock controller
> binding to document the whole tcsr block which is not belonged to tcsr
> clock controller.

What prevents us from using TCSR as an MFD and describing hwmutex and
TCSRCC as subdevices?

> 
> > 
> > Regards,
> > Bjorn
> > 
> >>>
> >>> 8750 was different because someone decided to stick the "TCSR clocks"
> >>> into the TLMM address space, but it was a one-off
> >>>
> >>> Konrad
> >>
> >>
> >> -- 
> >> Thx and BRs,
> >> Aiqun(Maria) Yu
> 
> 
> -- 
> Thx and BRs,
> Aiqun(Maria) Yu

-- 
With best wishes
Dmitry

