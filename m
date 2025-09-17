Return-Path: <linux-arm-msm+bounces-73927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F7AB7F82F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60D772A3B71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A0633C770;
	Wed, 17 Sep 2025 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQmH3nN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7416D32340D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116338; cv=none; b=o7IfZwo4gyylGM4DTZNKqqD+je9f3EkVVz9K/+u45aR+1WhnCXihAPhT9PKgUuZAMAUkaTgxjeOwmc9d2yYZaXzyXv6Mm9Wzl3RR/42XJo+m2OlkPIYb/HARy+yx/SesRbBZ3KjmkEOmWMHmKjFe1/rq1PEkMAzzj28NilkvRw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116338; c=relaxed/simple;
	bh=WnpB1rdEO8C8gBBpcqfW3oGIN1T5ges9hvMvfxGvjOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtWpkBc8aypVTgWy4k27TskbTvR/VTniFj1HCMUYUA5Umx7kWrxrfbRULmgTo1JqSwSYvuyCYlfcr1O3mS1RTbcI/Tb8qeVtpGdFZhqJn5msCAO8Kv8NB+Gjb8NjyfM/nnsVI+oIJv2AqexEWF5s1qQFHnauO+sCOUsTnazf7A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQmH3nN6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XfXX027352
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AEb37FUZ9ZFrM0ruvM0nnA6r
	/dbC6hG67INK4u3oVrw=; b=cQmH3nN6OKbRemf38hsMytrBcUs6TbZyp0BIB1+d
	pNf9DAnIEDHFuIEBZBj8d3WSMcv6mFHcmHKtAzyaeOp0QK82Zzd9r080qsnEkk/U
	jB0xvX3Td0vlNUlV2CdXXygUIadvd+U70CjqH33k7k4lpBEHLNGJ1CkbfBhIWjrQ
	isJaG8a9bUn2C0/uuJlIEFZbKsu0o4tWekxQOw1FQLHVcFiw760kMGUMVvTuNg/o
	MaDH0yuExU9tEbwU5k+1NatQ+gvbLSezt2THhnlj40o0NQZQP0k+x18NG/nxXf1G
	LJALo/lcNbhwvglCS3eJmlsDztd2f3VPk6h+sg+qXigfzQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwjhyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:38:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b78fb75a97so48826131cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116334; x=1758721134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEb37FUZ9ZFrM0ruvM0nnA6r/dbC6hG67INK4u3oVrw=;
        b=wf/srsRANa2FaJRYvuVr/E68pi5om8rMebbJH4P56mbE4vyAOI4ndOfkse50j0XZR/
         D26ENNYQ47wxD2XvRWuVJYHxwICxpKLDWPGvs1AXhLvAbrl2s9vAlHFIpSMyY07CKMq8
         +oVXG/EKWBHai7K4B5G9JQmgTBbwBssXeWlpfvo1BOrw6eJ918Bp3BXprhORMf0YCIut
         GAE8+CzuP+eEdyR/4yKbfwwwiho4YDsKdeO3XuUE7xD49al2l4n+QLnFCIK5GeGRkCH3
         KBsXknEobz+Ihh2pfoLvWIkiuVk7CJyFGoN1X/0OTDTUSKEYam/N1dpxE6rqt3qCWawB
         aLFg==
X-Forwarded-Encrypted: i=1; AJvYcCW1OtrBLlnlhn9odekagawMLY0lyL4yrIpexnFkYqKUSMP579ikA3qcv2E0jOzTgPG0xzpVYVukLuGURB2H@vger.kernel.org
X-Gm-Message-State: AOJu0YwhU26KPveOO+t66aj90/fGCPXObArKx1LoHTgt3nPqiZNLt2+b
	L4DvY6sEjQE+Opf6ZJs/Tpobkm///uiNnAsEgzcal8lDqHD9QC3yYdo+5HVPY2oK8uGbC8NSFkR
	ttdusliBWOLFhfNOoTRyp97xQpVWxmgWHqhDslApFAEs/94RM2IhAqAng6r+6FRj7+43b
X-Gm-Gg: ASbGncsQDgJf3K6X+l+zhUfLnxzAs+X8vXIwx0GwzzNPUPORg1p4XJd950QLna48DId
	59Ti6cpkALiP7gXXu2PntFnC3yqyPl05gh2irGAaZKcMgeL3c435ix6fdbmsZ3D4LkAQBXhVNOM
	s6x1kPCXxAKtRlWsX7ZBfyKWSw+DWrbzs9UILR7Ea3BKJTctQj4yu4BDDbyRXyAg9IEqOmvE1cf
	UQWAX7BrVl8jC2BHjbyizXmlLYo5J/ZPPTrtn/cwxemc+aap8OYxSYxsj0FIpti2XprKkaOo4dJ
	wtD5sNB4QVj1rOGOAtqPmedZiWrIzXku821T0V5WCtgnu0vXu2Hng2Dmfxcvd0jc8DxF1V3h3Y2
	VwsU2KvDJCRacelA26/zgp24aRDM1gIWK0CrvDzxcQi8l+I2mwZNh
X-Received: by 2002:ac8:5f4d:0:b0:4b4:9550:47e9 with SMTP id d75a77b69052e-4ba6b276faamr27142041cf.67.1758116333649;
        Wed, 17 Sep 2025 06:38:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgkzMQK2lU8XCt0Sr+SErXfKdCjc4BZ7173ctPAQrQhNRm4t2Wv56etQwEQRN4aqeeiB3Ojw==
X-Received: by 2002:ac8:5f4d:0:b0:4b4:9550:47e9 with SMTP id d75a77b69052e-4ba6b276faamr27141531cf.67.1758116333013;
        Wed, 17 Sep 2025 06:38:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571a0fd0825sm4354732e87.125.2025.09.17.06.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:38:52 -0700 (PDT)
Date: Wed, 17 Sep 2025 16:38:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tessolve Upstream <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingweiz@qti.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for QCS615 talos evk
 board
Message-ID: <f3y4ibzkyfdub6gszoliaenuiudfrtqfr5u4zqpibfdr44hr7l@z5ap4odsoiti>
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <20250909125255.1124824-2-tessolveupstream@gmail.com>
 <v2d4e6py34xb2hjrfnmlrmd7xme45equ76zb2c5cmftgylk7w6@5lmexwfupj4e>
 <70c2f78b-c3ce-4b7b-a961-9f3957ce40f8@gmail.com>
 <axtz5euoa5lyg5clwj44jhdn5gvfubic6un3ilndzzoy22rici@rqqk4eyw7yas>
 <3fae286a-dc5b-4024-be28-ab51dc907ba5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fae286a-dc5b-4024-be28-ab51dc907ba5@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX46LThFC2lOL7
 3LKTIyKhiY9O6mdo+wS7In/GkC1PtqndGfnyHELIh2AGKzQ5rbmMe0yWYRa/0IqTz/FU6/0YU/m
 xWhExeV5BIkvvPEYCzgj7aq6gC2sr9XrJYmfEsWhA20wKxOQqTuDGAS4uJn5Ert/a7jg/xWbTcP
 mFQTZYJTpa53YVLqEoBBE3OdsF6fqWEBJZOf+O3IS0ZjEpuZ93VG67S/NLPUI6Vet1COdYeQNHg
 QH4naqUt7O2oxjBnxH/Rx9RU2CqL3u8ZYCehPywUhHZ+oveDPotIZOF9CqZ80d9y+4n53rmE+em
 0MpTFXVj8Jl2twBvUOHymzK7RCuSq83+6AWNT8yaLmY271zchK4afXexJr1kViF/Y8q1F9v3CJ9
 uWjpAcOV
X-Proofpoint-GUID: XVP2OkKdWVexEUzEp0enlB7I_azASQiI
X-Authority-Analysis: v=2.4 cv=ROezH5i+ c=1 sm=1 tr=0 ts=68cab9ef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Gd-i2Mvy5wnFlDERGwYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: XVP2OkKdWVexEUzEp0enlB7I_azASQiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Wed, Sep 17, 2025 at 11:00:36AM +0530, Tessolve Upstream wrote:
> 
> 
> On 16/09/25 15:55, Dmitry Baryshkov wrote:
> > On Tue, Sep 16, 2025 at 11:22:02AM +0530, Tessolve Upstream wrote:
> >>
> >>
> >> On 09/09/25 19:28, Dmitry Baryshkov wrote:
> >>> On Tue, Sep 09, 2025 at 06:22:55PM +0530, Sudarshan Shetty wrote:
> >>>> Introduce the device tree support for the QCS615-based talos-evk
> >>>> platform, which follows the SMARC (Smart Mobility ARChitecture)
> >>>> standard. The platform is composed of two main hardware
> >>>> components: the IQ-QCS615-SOM and the talos-evk carrier board.
> >>>>
> >>>> The IQ-QCS615-SOM is a compact System on Module that integrates the
> >>>> QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
> >>>> SMARC standard, which defines a modular form factor allowing the SoM
> >>>> to be paired with different carrier boards for varied applications.
> >>>>
> >>>> The talos-evk is one such carrier board, designed for evaluation
> >>>> and development purposes. It provides additional peripherals
> >>>> such as UART, USB, and other interfaces to enable rapid
> >>>> prototyping and hardware bring-up.
> >>>>
> >>>> This initial device tree provides the basic configuration needed
> >>>> to boot the platform to a UART shell. Further patches will extend
> >>>> support for additional peripherals and subsystems.
> >>>>
> >>>> The initial device tree includes basic support for:
> >>>>
> >>>> - CPU and memory
> >>>>
> >>>> - UART
> >>>>
> >>>> - GPIOs
> >>>>
> >>>> - Regulators
> >>>>
> >>>> - PMIC
> >>>>
> >>>> - Early console
> >>>>
> >>>> - AT24MAC602 EEPROM
> >>>>
> >>>> - MCP2515 SPI to CAN
> >>>
> >>> No WiFi/BT/ethernet?
> >>
> >> Networking peripherals such as WiFi/BT and Ethernet will be enabled in follow-up patches.
> > 
> > Why? WiFi/BT are supported for the RIDE platform. Is EVK using something
> > different?
> 
> We used a Quectel based AF68E module (PCIe for WiFi and UART for Bluetooth),
> which is different from what is used on the RIDE platform. I plan to
> enable these in a follow-up patch series.

It would be nice if you mention this in the commit message.

-- 
With best wishes
Dmitry

