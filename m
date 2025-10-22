Return-Path: <linux-arm-msm+bounces-78299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44BBFB132
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 11:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 965C63B7C86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEE3311C2F;
	Wed, 22 Oct 2025 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zu7BKZ+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBE03101B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761123963; cv=none; b=Jm9GUNuALGciiJVQy6KMAIbNYuVuMU7jzY2EqN9cskSrgBurMd9kYwlbe/1jNwLTshsiCnOPVIloMV4pwteuegq/YXS2W0e+GViIFjpfy0xjlZYkzrmlGZqNs/pezza9SX/pd4ojlQYGMLppKjZsyEGqJa2EzU9QuiAU0ClPt4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761123963; c=relaxed/simple;
	bh=9bZkDnRNiEXqyc3S1PQOtaXGMf5T8b20jTObFEOp2Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwoeTTQXBSTEeuXFu6e90a0kNxPYwXJxX79I+FfkvQElElgaXun+HrVL9YvoTelqg4GuEzvefRT+BnZqnqrLxzNhu2cNeRCr231HAQnpi0pCXsgXJQM7geUoBSEGOHnIRnwJfTzvgLcb1GnBZu9ZRNvFXP9A8n/cobhRQLlBUDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zu7BKZ+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2js8s002534
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zyo+jA7QwjVcJeqaUFtT0d4w
	dZwzQCIBohN18VYyAbg=; b=Zu7BKZ+43PSstvQ6AhC1A+gwhtO0x5SE79t/NC/5
	obpD29SJ4I2jJWDySHm2vls2UlCgb9ZdorcmSUDEYMXgvHiBVJjnq2BnqsIHRoJi
	kqpIxhgtcs7wR073Gc2Adhtf2R/X4uoiRRAaUldep1diiFoSmunnw5yEpfHpmt1f
	YvTe200Musj7mEWH5gy3BnaeclV08maengPfBXYmIV7LzkmMoYilpdCSiU3ukLit
	KWg9xhjrXAwZQ0Atdz4jbtsVgVP06tRI9q4yghe+rzdSt8qcconlg32yFWvDg9g0
	JUZEou/qWi5A5+aWZK7955FLEIo9dVFcmbWca56LJQXL8g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w9mkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:06:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290d860acbcso116823305ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 02:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761123960; x=1761728760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyo+jA7QwjVcJeqaUFtT0d4wdZwzQCIBohN18VYyAbg=;
        b=SLuSLUKYxJF8Lz/PQzGIiqJF+wv+8SJ7tjBAkMWtLPzStMKWecYhiVo6RJiP1Kh7nz
         uREOCZvEmpRcSgcEln+6AOQNRgD4rHNg+3ByvW966XmUZM4UZxDq8qWHBqZqK038cZMm
         hGJmvSUs58vbQIimXcskLSM+V2+IRH/LfUbmmnCdML2XtN5QDd9PL6C2TxcI6DzT8Bgm
         Ow0w49grDyOTcOcInR9OkHqYkXpCpy99d8aA+NNzMZO1i0+ohO5NSf5XVKD1DVC/oScN
         dCpmp+xYtksNktoc922lVfv7Na63CntmwvWa6t+05U/yPecf6b3B8eOtmoS3gxDTeq90
         r/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXN9JPaeSW2LqHrp3qXzkJv8zla6xJEQ1pIwU5WHglxrJlK1JDYDJOTeDuauAsWaAkQedY+XvM4T3FM6mXI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/8W1ltYDCddm9jmbxxfG0ao7UH5ZESzBCcvdG/fz6s+zZfgZi
	VM5Q8bjOzzfEphdHbZqGNWNrGvYHcNMyiaTAjLAsMevE8nBkSIQ8Wbzoe+NzZe/OvtOO7Z0/+j1
	hsjIYmCTW3KO838OoB/CVsJVvmck5gGnK2mYoqHg85iHLj3a6PDoIseImFHVkrZNPCu1e
X-Gm-Gg: ASbGncuMlbXQfldVPlR2KffRATaJQVSldAJ7qGelyGvEWTGE4j0Qfn3v5TpsYEGnEbl
	dbwRBVRXx+SGJj/5jjupUTn2vv5QVIS3UdgKBtdLx1a1OHyJaRKtN1tZLns6PgXJzuz3FN2YyR4
	CneDaBUu2HsgdS7lUbVLWNBFRsu3E+fVxRjzDt+Ubcotjt06lOrN7/cWDBJpRfHwBMEgVPYd8xo
	mkJnEGSSy/Ao7KUXDQTnyJ87z0SFyB/0pLSDmDsC4+3B5lo3YWLuWQFzonIkTwd92GFOZDFjGcR
	jvD/a4VPjx42ilY63Kiufw4IpF34EwcNoH5CMPcqxo3nCdtxntRfOdZ8nkMukXnBtg4JnFk/1WR
	AHlzdnGbwdZBoqQ6Tas7dja8JElHI2ZCXZeduGD/dqBiDQA==
X-Received: by 2002:a17:902:da90:b0:258:9d26:1860 with SMTP id d9443c01a7336-290cb27ec6emr288713195ad.40.1761123960512;
        Wed, 22 Oct 2025 02:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn7MtRv1ZaaGZs0um744eTrCze2LKDcbAPooB3tr0+4yM3N/aBwX8RbAaQaUb34hQLAc+mNw==
X-Received: by 2002:a17:902:da90:b0:258:9d26:1860 with SMTP id d9443c01a7336-290cb27ec6emr288712705ad.40.1761123959960;
        Wed, 22 Oct 2025 02:05:59 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fd7675sm133137885ad.26.2025.10.22.02.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 02:05:59 -0700 (PDT)
Date: Wed, 22 Oct 2025 02:05:57 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Qiang Yu <quic_qianyu@quicinc.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the Glymur QMP PCIe Gen4 2-lane PHY
Message-ID: <aPiedUYhUhPe319h@hu-qianyu-lv.qualcomm.com>
References: <20251017-glymur_pcie-v5-0-82d0c4bd402b@oss.qualcomm.com>
 <20251017-glymur_pcie-v5-2-82d0c4bd402b@oss.qualcomm.com>
 <f5ae0d20-3282-4386-b5dd-aa55142d2b7c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5ae0d20-3282-4386-b5dd-aa55142d2b7c@kernel.org>
X-Proofpoint-ORIG-GUID: drtGZRmKCGRxPkVmSsCq6oJIwf9jLCxT
X-Proofpoint-GUID: drtGZRmKCGRxPkVmSsCq6oJIwf9jLCxT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfXzaQng6ldC8Zd
 8SUhZrjTGmK4Mx7eO62OBNSeSYhhIZJAYQ71HpLdyePG8WrzwdBiQ737ntmwfN4ovnZVRflAlt6
 EKpN0lMieAVwBRK6Nd4hA5WT4pWvk5HzFq4Wr39umQVdSTAlk2YfL+1TUqY/2oWaly/kr5ypEzo
 VnJTj9b+ZLJstHWtk+pzZX1FgLWrFVxxGVDp6P3VNz73OdXGXjimGuOuG72fouV+u+6NvaP+98L
 tcigIvUS0bQPqD10Y/sEo0U7BnWXHSNEY12Z04RJN+pVg9B7Lg+EcMEV/1V3cEorFfjS8T2Lnjo
 Onbl8t32ZbLq0aahOxLkJ+ShzHRzp5UETYKbcHilO4kCbJ8U0D1CZ9DdHglFbnU48KrsWn8RMFy
 Irs8yHfDSthl8vdrrRAYnHcuyjwLoA==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f89e79 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=azfrWeaavPrKhEuwe18A:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On Tue, Oct 21, 2025 at 09:04:10AM +0200, Krzysztof Kozlowski wrote:
> On 18/10/2025 03:33, Qiang Yu wrote:
> > From: Qiang Yu <quic_qianyu@quicinc.com>
> > 
> > The 4th and 6th PCIe instances on Glymur have Gen4 2-lane PHY. Document it
> > as a separate compatible.
> NAK,
> 
> Why are you duplicating Abel's patches?

Please ignore Gen4x2 patch. When I testd PCIe 4 and 6, I missed Abel's
patches when I tested some dts changes for them.

- Qiang Yu
> 
> Best regards,
> Krzysztof

