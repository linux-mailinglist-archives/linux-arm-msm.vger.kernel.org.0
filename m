Return-Path: <linux-arm-msm+bounces-62658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8549AEA078
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 16:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18EDC173EB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF62A2E92D0;
	Thu, 26 Jun 2025 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+uWMRyj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D01929614F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 14:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947930; cv=none; b=lz6LJXAzKmfDZsuyCbC/yUBOIcwtkr8TVHmt3/vDbY4RduO/xNDm9KN+x3ktOoti4Ihga1fGOeEHoKOWXXX9RJcvhiM+oLQDExlP2JQppwRfx/t+jFQGk/NUFHYoLsjyFle9yfRM3m9TEX1PM7gF0ArT0hDVDPYBoUKucuoxxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947930; c=relaxed/simple;
	bh=UaAjEJBTuFQqZOwclYKXHCLOJefKqZur7hye3tXnyW0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OoVcTOpMXvwpDxz/ZRTo1XfK4xxVRTbYwZOq4GTTcqX0W9RPcKAhkgNqJK4jQK86Rq00W74J+an/4OzbRKbRIARo84twSsEwyjfwIffF5d+n6gnHC2n1RnW/bCi8tEyezznkNIRlklnfrIaOnYfK//ROuIssx3NbkgEuPYG8UAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+uWMRyj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9N2qI029548
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 14:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9NBKieE2jXv5JohaadTIjJU9
	wkNY5qr2lfsmoE12q7s=; b=J+uWMRyjsA7wHWdAlfudB9l69MqS0eF4jc0mq/ud
	0kZOxn8JJVOzMYcGn/e2OoFmj0XSJ+t9z//UAG8dnNeo/KZKLIn1KrIMatLfohvZ
	wGl4oTyIIvEtpOiyFUx6EFxJKlN5G53LC7AdJalwYkwPXeDb45t/twfAEQHEoEv3
	K1ao8oaE2+IaU9USMe8f3HFgbZYaOTTYToI0AYRi9wl4XEU9SaNVkLusOzYd/ud+
	Pep4MYbUNr2ZILQiCKgBsSmBKsTRQshiZ6yzXKfyT3PgsNQUfi4DRahQHPjVhXO/
	Zlx9HLT55mpvG3D6s3yhn0e+DUzFAiR9RnCAEF7ZUS/lqQ==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4vvuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 14:25:22 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddb9c3b6edso13531055ab.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 07:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947921; x=1751552721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NBKieE2jXv5JohaadTIjJU9wkNY5qr2lfsmoE12q7s=;
        b=nJIwuY2cg0rrKlrDByKawCnV9G+jVXoYeymOJZ8PLCkJOgQ3FGwkUkTxsCARRFasQe
         1pb6QFk27anoaxth8ylQCefzN2ULR5EaTL7UBLHhCXAuvzkr8dxeCNgJPWnSK+vSg84p
         b6B680HX+C7W/QdzzEfrm6iIVMIAxRhY2t+3zZ2ScSCQjRuZvYeDqxbN1Eb6F++R6oHz
         iBZQL0rAsPmPMGiYustQiUUl6xTPUwm+UMpgsp+icTDhILA2dlEClOKRV1mvEWAA4GlM
         dZgIy0b1tNB7ZyfErZodpnIFcBtByYGw2/yxt6EH/qsvdr8j28SIGrTmavV9awNtJKD9
         7qRg==
X-Forwarded-Encrypted: i=1; AJvYcCUxoqNwQAGc8eltgID7bgPBwgBUZRcp1W2oUvEmY1ofwWO4TxnBdoUTgLHaeqZwhnFdK1yF2V/IuSA/U05m@vger.kernel.org
X-Gm-Message-State: AOJu0YxL/AkLkG1DlbfP/7hxON9EoeCjl7Z7qKFQeh2paNXEH1ykBXjD
	6epO3BE0X7+taBEuej5Z40okmK5tuM+MnpNFq/8IeMFvju3/m9jsL4Ziw/EuAG+axtuYe2BON0Y
	JSDLH7YEWNK/Fs0/Ty+riNlcEHsp1nFA3Mdp9KUJFOFv5GOC09hHhfSew5c7uPIy26Xhk
X-Gm-Gg: ASbGnctabUVqA52jEnj3LjE8POz+m/N5/PFh/LUkB/XXd/FrhPOXZvkk0oBu/IHPObL
	A25lfTTfocWh4To7sVhuUWGXApHB2EIu+ekATmqZhlze8FIfpVlYWC3Tq1cjxCfm9+R1pq9R9Ps
	urv9gLSb+mzbQs13dpjfW0dzg9AeSqTbQpyYqD6hMqKnv9afB+frk1lQPEtK6XEghDGU4FML3sp
	Gvyb3sUzSVL98TYVEJPOuem6SIjUCg/dfdXrZdH11JG32JsROAUY4hl2orrt9A/UOxDrk9z8TiC
	M3GgOPbwGHgqX2ntWdqMcVt1tGEt1HZulLG2J8aYPuhXp3BYpAVPIjAm3g==
X-Received: by 2002:a05:6e02:1a08:b0:3dd:b6b4:11ef with SMTP id e9e14a558f8ab-3df329963ddmr85594935ab.10.1750947921286;
        Thu, 26 Jun 2025 07:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZwru9H4uMdVnuVCyUrwh8fkSlplx9chY9TYexo5hJ7asNWlDuOKdQ+3PCVawhe4C+yxM1EA==
X-Received: by 2002:a05:6e02:1a08:b0:3dd:b6b4:11ef with SMTP id e9e14a558f8ab-3df329963ddmr85594565ab.10.1750947920954;
        Thu, 26 Jun 2025 07:25:20 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a407b63sm21209855e9.34.2025.06.26.07.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:25:19 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 26 Jun 2025 16:25:18 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aF1YTmxF0pAVDFYe@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <08e3c707-3b39-4b67-ae9d-f9fe65ad210e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08e3c707-3b39-4b67-ae9d-f9fe65ad210e@kernel.org>
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685d5852 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=eotat5ZnXjsHnA-9JakA:9
 a=CjuIK1q_8ugA:10 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-GUID: Maus27aNG5sjO38B7Aai-oA-jn-Od_F6
X-Proofpoint-ORIG-GUID: Maus27aNG5sjO38B7Aai-oA-jn-Od_F6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMSBTYWx0ZWRfX/ktOwoQ+pH/V
 4s2xhcyphHpy3rWKktVzjDBLRtAsNWFnuiOawnJaRk2PlSxYkNxfTzW3pkIWGJxrjUQlJ2s8Qk/
 boXAKIyAsdGzxcjNKx47C4Gw5QesxsFPAGBZhu++pRHuj22ri6ByICd+qdVlDY6SRrMVFr9cG2L
 iEtyhs+AubSZlO67wE/Se0MfDAzZPzzjgfSNRramfZA+s4RwDznbH7MiMCg/QUhhuIC0eJGLHg9
 xxbOSKiy+4ld1DQ1U/K4LgOJ9S0gU/sbwgy239e7hZ26OAZHkp6YaA7MtrQzgZGwQ/+Sy9G6sNZ
 59Ao1ON29DZSlEBRg9DnfIkdWgEhjBL837thfJg2pSmIk8uDOXNxG0jkfXVv2MjgUN/w7wvpqt0
 cwli2lN60eM5RBY+3Gm4+x4SyCKy5K/espvSV0sYmUG/gaIX/IhTchzxkwXnKWr4SOPsqcXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=751
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260121

On 26/06/25 16:05:00, Krzysztof Kozlowski wrote:
> On 26/06/2025 15:59, Jorge Ramirez-Ortiz wrote:
> > +
> > +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> > +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> > +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> > +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> > +			interconnect-names = "video-mem",
> > +					     "cpu-cfg";
> > +
> > +			status = "okay";
> 
> Drop, unless you override existing node, but then this should follow
> standard override-label/phandle syntax.
>

yep



