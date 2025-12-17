Return-Path: <linux-arm-msm+bounces-85451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 17803CC6A80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 09:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81F153016029
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 08:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA46B34A77E;
	Wed, 17 Dec 2025 08:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BoE1QrtK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LshYq+z8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221E34A77A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765961554; cv=none; b=juXWjob27CHbdlB6WEjxcQ+POgutMaMtGHcey2uF4dKeuwZvn32QD/K3AZdZFE+iVFApUhpbG23ZpEUgDY5m97km4VDZwGGKbQoQtNWXtlf3LIenWRwVmZjTzOl4QALsbos2mvdBX1gm+BfPlIcmrPqizgZWlEBMrx9WEKP158s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765961554; c=relaxed/simple;
	bh=zG31ZDDK3P3Y+9nGe+SlkTBlHBz+s+y443iDZhxPtI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZxvTvOlHGEXwRCjvyyupVrIgysK1X2/eF2ZUDabPW4rpU+ChrNdCkMFyUqV4w5YbphU79ygwwCJ3rD4PE+o42H4DJesO6PUjuaoTNSyB0pUcP2zAwH+Daq4L+iAjecL4c/wxFkK9uug7HF3BljuWMomDPfzaRiPV1TrhtPxTj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BoE1QrtK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LshYq+z8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F1F32023848
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0lZHu0zP8AY39KyBo9sp8qu30vPSnqw8T8jcXq8Wpr0=; b=BoE1QrtK+5SjbELs
	GPBrC448NlVtSFhugS7AiO74IccNYDDsC4PcMcaUWmJzWaBFbpJiIwVVJ6SSoXEi
	f4BPVF/7C8IW0YGWiR+X7XMQ+XtMNgwsykU1pwraOaqlof8/T9Pe6Cx3aAmxHdbA
	vel2sB3sjZxYtumyFBWZF/JGEBJAnQ+dvFe06zcPv1neOcj9PmmuClEEvfI4vmWQ
	9Rt5LZxbpM6CvCFTOAf5rPq820HS7qlj56yFHc/t97BsKVSBrJY+EQ7GbnaGfIep
	l2ZYEfovDZQ/HXyZXXU1cgl7p44rd75F02JuIHG3BMZ1ovvF8vw+7jvkJIpWUJll
	7BJTNg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39hb7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:52:30 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6574475208eso4241813eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 00:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765961550; x=1766566350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lZHu0zP8AY39KyBo9sp8qu30vPSnqw8T8jcXq8Wpr0=;
        b=LshYq+z8bwjnhtdqP/0WlYt6XYEm0jRnJjFTqi5iEo4CNdq74JN//5G/YR1f9qj/xl
         uBetjaAFrOhm8QyAZFXP6bNob1nZtVgkgj1/lBxbhRMguIE6HFv1GgXpVWH2J9KUrS5w
         5K6XlaD29YeioqVkGBRKpt59lgeGmP/uEf3F2HhbNa0rl/pLUegMqT4k+ciQMKEMxS+T
         rETr910MN464ZkUBgJyi0MBlwb38ENRUy6xyW7iqb+fF1NcvpVZ9QUWtqT4AOufcJ0MM
         ebg0hvKfnWSa0iTTA/FAaNKe160eio5vGNhi1sqYf572O0L7VVEh9sAfOL9r2/3hXXh0
         3iow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765961550; x=1766566350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0lZHu0zP8AY39KyBo9sp8qu30vPSnqw8T8jcXq8Wpr0=;
        b=lpXh7umy1jJMfP3vdOqjJQEkzEW+Sn7xakSgIcuETyV5ERqq28Tlfhcl24/X3p0bo4
         yH4bZJfT9MsoDc/hgNJFeVtppd0/e729Uuvh00RYcFcqvvWjXOO4R4azwXH75jAFHonE
         niEpjeb2H7wUpEn3bEP8B9jDPEjIV1EpCfq+OFiTPw/Cil8Q65qllf0p3McogigYui9z
         LqnQznGy2zRyQ+JaU0C5mwEMaLL25c19USLpfaCNUsPIBpe68osCmZ/svYNsR90/2Dxq
         icPE3YGV+YcyTDbwknscXy0fXu5JkLoJyNHfqXIRlFbvxpMXkIlpHUxc1yqEY8ao7ZmK
         Nxqw==
X-Forwarded-Encrypted: i=1; AJvYcCWfVG9D3hH6LB3eKKN0ZpsIv3HtC1F2fPPVquRej1gCBbtLAb67xRG389LfqxSdCLKsD3VuZ+Qdke88WBhn@vger.kernel.org
X-Gm-Message-State: AOJu0YwdYdIIhf8PLlAoH+1pjb5hIu7KOmdgohIXluf+YPEofQ7NMs+G
	Ihopr0NyNWov2Op6RM7WzgpiZH0ZzWlfRa9pHFfRXtWTEpBDixOzaavYD4sEopl7BUUvKn+JIl8
	VK9OwKCqVmMOON+iYyJSDdrvcW+ulTThouD7VvfviplKE3XYbZ53jyMMvRaP/yIw5Cquni4zoSj
	xn3TDA/BTRq55PDl/iVJu4g2pX8l7DMAXMvHw6QilJmA0=
X-Gm-Gg: AY/fxX5kcHr3n6M6IWztdgNIn9+xy7Ds1wxs/3yGViUW1dUe19nIzqBbOfpkkkaNJCQ
	1CvNG2HoTqzwGFNvpNB9k/9wPzN0OSxmjfXUdZ6vXRrJHDk5g2VqI3hk5OanrVPKatd7vbgZOJF
	b1xmBn7BPeXJ6ATWH04DHz7WzpDrRjhyIiJpb7FuW2KbTh966vqApi1mA+RSV18MHLUSM=
X-Received: by 2002:a05:6820:1987:b0:659:9a49:90c0 with SMTP id 006d021491bc7-65b451ee568mr7568567eaf.63.1765961550255;
        Wed, 17 Dec 2025 00:52:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtnLL3IuK8y7pqftlVXJ4xn5wbP+GPsuHHu7bSkjSTPXumGhvAiUyKkzFMIAYqgHnz64D4MjwSKhWE2LCDOKc=
X-Received: by 2002:a05:6820:1987:b0:659:9a49:90c0 with SMTP id
 006d021491bc7-65b451ee568mr7568550eaf.63.1765961549888; Wed, 17 Dec 2025
 00:52:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-firmware_managed_ep-v2-0-7a731327307f@oss.qualcomm.com>
 <20251216-firmware_managed_ep-v2-1-7a731327307f@oss.qualcomm.com> <176589894648.2511603.9461849499751093485.robh@kernel.org>
In-Reply-To: <176589894648.2511603.9461849499751093485.robh@kernel.org>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:22:19 +0530
X-Gm-Features: AQt7F2rECtOrhS1bZFzhQl40G4gW_mCmIgD8HnISW_4IDdXYwYsXpZifcb6GWwo
Message-ID: <CAMyL0qNwZxysUGJu7YowPn2CpmdPrUwnCOeVjm_2M-ik4s+kgQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: qcom,pcie-ep-sa8255p: Document
 firmware managed PCIe endpoint
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        quic_shazhuss@quicinc.com, Bjorn Helgaas <bhelgaas@google.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rama Krishna <quic_ramkri@quicinc.com>, quic_vbadigan@quicinc.com,
        Nitesh Gupta <quic_nitegupt@quicinc.com>,
        Ayiluri Naga Rashmi <quic_nayiluri@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA2OSBTYWx0ZWRfX8H9LMrQ+R2r9
 /fCJ2R4O4cYCx/EillfApOFx/SwgR778Lep/HDjr33QEp/iPszIkonKsLv+bi/HJdvmy8LtWQvZ
 qE2amH7sGXm3XrgwBJ9uQLoxpKW7ge9VR7m1ecgg4/Ng3rKqJiNuvZmVVrkAJTPYK9uoOiQq7uY
 htu9OAcMUu9O8p/d/BnCXpz+NL94hZKVff9JCt8z6MF0FITNBkUK0kLUVXZG6ul+bqu//eeKRNd
 sDSKOLWPUUVmEuCOKvzEOJp4EQe81og0H7MsU6yQ7Wr4D3v3v492F496VJ148jeRGOLISYh51my
 g0N99W4+Ti0/cAYhvyiLEwIWmAk5O7UgwNl+LS+SDo4l2VoetVZEgBqhsYVhcGzBTGWpJjG8rzc
 mhszQ+NYG0AwU8W+RuOb9pPvk8Cftw==
X-Proofpoint-ORIG-GUID: u7meHvYFI6fVTzcHhaxxcopMDm5-Ul7r
X-Proofpoint-GUID: u7meHvYFI6fVTzcHhaxxcopMDm5-Ul7r
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69426f4e cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QcnDgq45NsFIHwn4wVcA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170069

On Tue, Dec 16, 2025 at 8:59=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Tue, 16 Dec 2025 19:19:17 +0530, Mrinmay Sarkar wrote:
> > Document the required configuration to enable the PCIe Endpoint control=
ler
> > on SA8255p which is managed by firmware using power-domain based handli=
ng.
> >
> > Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> > ---
> >  .../bindings/pci/qcom,pcie-ep-sa8255p.yaml         | 110 +++++++++++++=
++++++++
> >  1 file changed, 110 insertions(+)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pci/qcom,pcie-ep-sa8255p.example.dtb: /=
example-0/soc/pcie-ep@1c10000: failed to match any schema with compatible: =
['qcom,sa8255p-pcie-ep']
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20251216-firmwa=
re_managed_ep-v2-1-7a731327307f@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>
Thanks Rob for sharing this.

I already ran 'make dt_binding_check' but somehow I didn't see this error.
Maybe I need to upgrade all the tools ..

I will resolve this and submit again.

Thanks,
Mrinmay

