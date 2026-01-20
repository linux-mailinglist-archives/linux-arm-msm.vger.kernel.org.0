Return-Path: <linux-arm-msm+bounces-89832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFvjFwvXcGkOaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:39:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC5157A0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA65B6A886A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 12:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6533D523A;
	Tue, 20 Jan 2026 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIR4hLwX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEvYd4my"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED873D1CA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 12:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912555; cv=none; b=NMPQninj/Ck6FO03sBhDMmujt5KZIz9Mir+bjCzMIXv2FlSTbi3vOavF5QqZ7IjDiR7eP6hAc2urWTr/Ivw+jWY/1yBrUGiz/qY2vPZSeKGlzND9/7p12eQHXtYGBgOMzmKG1+vWMHr8P0jcCCup8HCDfPcb5D/I7ENLKp46m6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912555; c=relaxed/simple;
	bh=t73NbYyAq1PBG8U3RsIiMkQznS9BO3iUCCyxXhi5dJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ejz2t254S0PuvdJQmNQ70iKimV/EVdAAY14Xa0ewMY/2DX0KXzQyX5n7KfcJQ2BzCHUiU2BCA+OmvHZAmUbyDoTo6njeb2CnIczQlntUQkcKoRgP1wKXZ/9wDVeY6LnPjrTNCDrfv5GK1TvDpqmtMPWOwtnS7Q/p2X7by+l+SEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIR4hLwX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEvYd4my; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K74IEg1661064
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 12:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EFH+9mnCwRV+iOiubdBa5gTL
	l6RuPaR1Ug87h0+btIk=; b=cIR4hLwXyF3Aqmel6aXF3rjuc3RmMt5WM6ClHTFZ
	UHM0O9RKulVwzoE0Sa5v5x1+t5FZL/d2mif4ONyuRAKedKaKnnGfMnh4vRj/M97x
	Q1v/5Jkw4am+Pp0EJvDkubSFer9vkuZ7gB6PSp6W8T5BOrYAcb2PLiPqL6tiRi0i
	oaS0Iu+LZkck7msHO7DZfpo7n+dkCEWXUBXT3pkKRpK6SS5jxhrcgfa7mF8PCcu5
	fUF4R4LONrlybpPtrmJaxRH9HQb9bVSMBvSU6x7UGs59h6ugirJM04JZ8Vdws/js
	7NIhEWUfN56kOScHa7hR+J/lDOwyTQbxy2G0If40xDWjyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjvduu19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 12:35:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52f89b415so84246485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 04:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768912552; x=1769517352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EFH+9mnCwRV+iOiubdBa5gTLl6RuPaR1Ug87h0+btIk=;
        b=dEvYd4myq0QIK4zSJVXoW7ECJbcvqv/Hu7LWDoLzydiq5lBIr56zlq09b84LixJDUT
         Ym/J38r/mnom7514MeD1VcjLruJtVvWtbH3SEsok4qNY04D2bFaGUymQ6BfvdsnELLXW
         jkE4NwW24AvbHHBL4xMGBr9RqizBCTM0i/unflNZ3Z36pUk+BRdpe5WVOKNDo9KA7s/t
         Uar8QP7NGePPIyDzb7mah0H3E40OU4+NpLZQI6naCZ5tqnJbHiUalCGXycPATfL6cMOZ
         9mKmGp/TGtFktu9SukYbxcwA4kZn8wisw7DwiuSNbj1SSweRd3iUgq/oD9cblcBbhOPb
         UQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912552; x=1769517352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFH+9mnCwRV+iOiubdBa5gTLl6RuPaR1Ug87h0+btIk=;
        b=bLuZBFcuDZllqWcD6iwmjojhu3TnxnGTFW6jsZBRtDSCA4ahbqhp3gdk7gLkPFjZIZ
         JAxOAI8eauspsN6BOOoLbEaFZbjKG+L3TzFqH719O1KfLwAEQJ64kjnMpmoCXKCrDB5e
         r+NtW83roz32i0zMggDWAFN/EPiIIw+UxgVnVcSIf/eCejeQG+uiEXubFZcjqzawoHo/
         3/KtCnngIbZr3cA95BMoWdIdW8tWQ1CEUpooHCct+ks9BwWq5IYipplehgmhZv0UTEUF
         nhbYkS+iA7Nr8QtY7iWEmthw6EWfYfMU47sh9shvNHuIaJlkG7T3858sQHR7zQhMR0XH
         uFlg==
X-Forwarded-Encrypted: i=1; AJvYcCXVSh+JPm70og/476KkMt/q+Rc04H+2d2uOZ01+24l8Z1PSxzNWS5WD3+XyYaVjgJGlEQUvIspIAir6ygQH@vger.kernel.org
X-Gm-Message-State: AOJu0YxwASnSBHu0Hu/uTXngzukT3P3aJB85hwsHyT935qvzaR7DsqfR
	QSdvTgnv8LjcUvs9givNZ5ZGwbdSJGRNAs3C278ArAiJNaF+0/r3WA0GLnZq+Es6XzzOmiUFKzV
	1mvka6hXfIjBwauF7wkORXUhfObSX9opaGISnkoNftk82ZKm/hju1y1RkyFaJjZtcIP/i
X-Gm-Gg: AY/fxX5ceJUJ7yMcRvkiwVGcbyj/KTCsM2g9uazdzHEIV+flIXsGSBZ8a6K8XlnS4yj
	txYq9Xbv9BSXV4SYs7qtm7QCvE9nM3hpnbPs/4rp7o4OPHq1pdq+j4Q1I71X+kCCkWfpYhsfBnY
	qJeWtJ8K7ccd4duJflIALws2qxx1uIJ2xWDnmrMAeJtG6r6AQV/xmgpjdRg416XJjLmjIhPG+p8
	VnlpsrBc+A+H38hOgo8FDuh1ew8AXAU2BepokuXbQ0UAY9zRmGCEQxuP8gtaRDyXQlmdQ/H90IQ
	+nvCPOWJVz5lcwT5XL47KC5N3CdCu32QaOtnfs8iyWoW1WHsiZ0QK2VtAr2TfVsSFIzAxMk4LFH
	kaRY5b+q25D51XC9miQpvtasg
X-Received: by 2002:a05:620a:17a7:b0:8c6:a82e:16ba with SMTP id af79cd13be357-8c6cce505b8mr166699385a.84.1768912551541;
        Tue, 20 Jan 2026 04:35:51 -0800 (PST)
X-Received: by 2002:a05:620a:17a7:b0:8c6:a82e:16ba with SMTP id af79cd13be357-8c6cce505b8mr166695785a.84.1768912550891;
        Tue, 20 Jan 2026 04:35:50 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879516900csm1484553966b.23.2026.01.20.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:35:50 -0800 (PST)
Date: Tue, 20 Jan 2026 14:35:48 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH RFT 3/3] arm64: dts: qcom: glymur-crd: Enable USB support
Message-ID: <iwdb6x4rh25bs3o6yvqhr2yoylsng6mlno2giklltb25oenpjt@dpxdkktlnytp>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-3-98d6d387df01@oss.qualcomm.com>
 <1299cddb-8205-47bc-89c4-98b4ddcd688c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1299cddb-8205-47bc-89c4-98b4ddcd688c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Lxr3WkdOJFH6etSJT0XKOE2L8k1UdUvZ
X-Authority-Analysis: v=2.4 cv=U92fzOru c=1 sm=1 tr=0 ts=696f76a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tGu0c17UIxBQEtl-8TEA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Lxr3WkdOJFH6etSJT0XKOE2L8k1UdUvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEwNCBTYWx0ZWRfX97/3M1To5PlH
 8T8x4H7REucnZe6uy1Fxq9IsHw23YRUBjJf1hBI0jPaIvpgpGglPIhbfQSZ2eUd6pVk1whxWEWY
 1vvoVxOMXWYyvYql6DZc0FjirNvZgjvyVvyKBQ49Xg6Kv4j/Z1go43eUsEANPqaVBMBrHy1Wi2B
 tS6PTjSDUqAxbRj7jUQvKaj5OFkjBgQ66CB0C7LgqqkbYjvbjGWSdSFqSl7JWdmZsFblJU/Q2i7
 eZpWNsSNYffehVZMzZGzfIfEvhvvLGzWl1RMC1KrhWkRLeanHdhHPvTqccJ575MTClXF8ofDrVW
 syd9lsNmhSK6iTilqh5uUeyJcTJ5BHdR3ExTx8rZxEkwCpHmB6bvh90Li+sMsppgFsnS+07f+CW
 +YQnXZg3wZsfgB0/Hoy+P18TQxSOe5OFTxyZ/IYbvHmlZlh+H6hMjAhvP88VTojXu6WBo3pFr0E
 y+EVf8uxoAjJAGaK15Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200104
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[25];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89832-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BEC5157A0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-01-20 17:37:48, Pankaj Patil wrote:
> On 1/13/2026 6:03 PM, Abel Vesa wrote:
> > From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > 
> > The Qualcomm Glymur Compute Reference Device comes with 3 Type-C ports,
> > one USB Type-A, and a fingerprint reader connected over USB. Each of these
> > 3 Type-C ports are connected to one of the USB combo PHYs and one of the
> > M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
> > via one of the M31 eUSB2 PHYs and one combo PHY. The fingerprint reader
> > is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
> > eUSB2 to USB 2.0 repeaters, which are either part of SMB2360 PMICs or
> > dedicated NXP PTN3222.
> > 
> > So enable all needed controllers, PHYs and repeaters, while describing
> > their supplies. Also describe the PMIC glink graph for Type-C connectors.
> > 
> > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 283 ++++++++++++++++++++++++++++++++
> >  1 file changed, 283 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index 7c168e813f1e..3188bfa27bea 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -858,3 +1015,129 @@ &pcie6_port0 {
> >  	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> >  	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> >  };
> > +
> > +&usb1_ss0_qmpphy {
> > +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> > +	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
> > +	refgen-supply = <&vreg_l2f_e0_0p82>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&usb1_ss0_qmpphy_out {
> > +	remote-endpoint = <&pmic_glink_ss_in>;
> > +};
> > +
> > +&usb1_ss0_dwc3_hs {
> > +	remote-endpoint = <&pmic_glink_hs_in>;
> > +};
> > +
> > +&usb1_ss0 {
> > +	status = "okay";
> > +};
> > +
> > +&usb1_ss1_qmpphy_out {
> > +	remote-endpoint = <&pmic_glink_ss_in1>;
> > +};
> > +
> > +&usb1_ss1_dwc3_hs {
> > +	remote-endpoint = <&pmic_glink_hs_in1>;
> > +};
> > +
> > +&usb1_ss1_hsphy {
> > +	vdd-supply = <&vreg_l3f_e0_0p72>;
> > +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> > +
> 
> Board clocks are missing from this and &usb1_ss0_hsphy node

Board clocks? This PHYs are on SoC. Usually they do not have
dedicated clocks comming from off-chip. Am I missing something
w.r.t. this specific SoC ?

