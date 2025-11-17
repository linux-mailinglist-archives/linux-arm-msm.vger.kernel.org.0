Return-Path: <linux-arm-msm+bounces-82106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8DFC644A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 46F494EB111
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E6232E696;
	Mon, 17 Nov 2025 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVNpG5PB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxoMoLBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A6E32937E
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384706; cv=none; b=bXdSU7KA7kRCXQfsjjU7ydiUaRWpA2ODzTHXd3zEC+5HJrIoPiGKWvMHwzWALTn/7hcDOYfFPCDdvEe+kr1zxM9ZwBn4k8F/9bLGErijvAV0QfIOK5yW52vrSAef1d7bxP17JhBisSB9ccH71V03n2oNcmciZasd5RVAp63b/qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384706; c=relaxed/simple;
	bh=5yCRmdi0Tv9gpuifWOHlnijXJyxiJz4oS4TwD9D1yOU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d21Lj+5oBRxS7Vw4ZczcWj/J+tV1X+Gmld5jdmISU/9FU33e6kqvSZ4PfspnggViLZYQjGCpPjqmEVD1beU4m5hI5kuDtBZJtMvUT/ORqDB8YL7yClx98WCES3OzRw8AabALiYdrFrq5QrdAffY7FAcRNH1UmAYN6LqFv56BugQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVNpG5PB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxoMoLBr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHBi48B3040387
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpsxNYWPsMe/6TFTnTzP+C3Ff4+xereCCMFTVc8U9nY=; b=VVNpG5PBbjKRzcwE
	mY+1UxDsOEAS1RvrLKOHhIv8aGeuPazKMIB8fcPvnciJ1SztomCZ927pqb/12LCf
	fh5Z44+MKOpqMzIGIF3+5/0NIcgWqexasfTorHNocjTkCqdgFNIjdqTUhXuPG8aW
	i/gYxeo0G4ibimlaaVP0FyhUoQZov7bz4H/q5YICGJTxj3SIKUt0TzgXd3jcj0bb
	HjzcFBpLAUzPSLSue3iD8L7DSeSJrJ6CHJci8vyySw9R9kuk4Yoo4V9pmDT/KAzd
	0WZBVvE+X80VLkMWe3fvonV0TNFsywbRJmQljrxAmDb9K7wcR3/4+ycGmEFeXEx7
	MbzF2Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh04smn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:05:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3436d81a532so9748150a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763384702; x=1763989502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpsxNYWPsMe/6TFTnTzP+C3Ff4+xereCCMFTVc8U9nY=;
        b=hxoMoLBrRM2geix+ElfwVajRocQQ5QeqZ0o8Alt0CEqU2gVPT23Rcs5MsO4maU09Wf
         DFmIS7Bp/n2eC0Qz0dHEsRi9YYP8mQ5cm2G4a7LmgvFHepXzu1je9U7vjC881VabiaIx
         KpSy39PYi8DM0OQx7wkzcg0mVwlltH+cRiDyVNoLjT+lTmFu0ANne84DZpdCr2gCWfkH
         uevpzUIX0nwQHBbNI2KZiDYIjmDsJJ+MB54nh+lKbWXZ0VxAv61iCnpVPEBN2ttAmdzG
         R/rPhXJdjG+AQJsROll4X1WV2TXnuwhOlRD7zT4Wd064d7j+rjWuL+Ef1uabr/3AsYjT
         3JhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384702; x=1763989502;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xpsxNYWPsMe/6TFTnTzP+C3Ff4+xereCCMFTVc8U9nY=;
        b=ijjqDXVRwVDccEpLcXHOYh8KQhpzTDaqE3c1y4v7EtqQId5LKkLr6u+lml1NYrsptD
         v53mpg2XDp+jJxqEXuwSdZfvBWtx1ugPwbkwoVlnCEe/9O9eGkj9UfSwCJGBGTAsSP0D
         uIZsJxFeIuVWZ7Noes2Pv5JOnOi3hbtXLk8q+6cBbBonZgLIZxTMkahNTMwlu0lH2suF
         Ce8zDLolTSB3rYwds3KugjcLBGiNPD2ZmbK/VTni2OYA2k1xMasSRGKFfoQPdjXOmB6g
         MU0guleqss3vWCKcfK0ZhzbjPZCQB3+ARlxkyQBX25k7ZCHTrX/mQR2E//Ihi9lrSxft
         9cGA==
X-Gm-Message-State: AOJu0YzDXNsj1RjrXB1PpFFjADW78DpELAgp8GAXJXK8hqY+YTf0WYv2
	wT33leHwiWAUI1oWfNPTc21TiM6pA0+542iSxgS2CFqQqhSs6G2s9nr3Y9tfm6gaEmliUk21Y+N
	wLK0cHaKaoaz/+rVzN36BWv2HPk1LVomNgS7GcPgjM6gcn0c0zISO/Mxz/pa1HdSS1ysf
X-Gm-Gg: ASbGnctcNqE6BC3Kp71FaekGJuSbrn0nGjNCs6raW1To3phogFYtrfaYMgLflTaLX54
	eO842oF1VmnXkW6uWKV2VhmOHs6LpYwWTigW49aGx0kWU1tF5rwsZA4HfhsbZ6nGqqbCLbHrULm
	wCDO2kOS9BdfJjhNybZ653kV40LrVJuTmyhlXqzm1ctkOHTAHEohzqtFO5T+YYYuIQAhnUf7n+v
	SEAFjQGDmdvdsLmTBpjLhSZpEBA8oNm6MqPmeas55k4l2r4i2ekBKX2zvj8vx8t50ar6qGUMdqa
	eZLpaU5vz7gSNYVR33jDRHpNoELnAQADYtKZh6MPkob5rpa+kpl7xvgOB4IJ4mkF5SHfO17b
X-Received: by 2002:a17:90b:3b4f:b0:343:5f43:9359 with SMTP id 98e67ed59e1d1-343fa74d185mr13287226a91.31.1763384702104;
        Mon, 17 Nov 2025 05:05:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4PSvYzJhtndiMBVP5ykwZcA1Q4a12OTYS+nC1rxVRvYZGYVu65h2SVT8TcOdvzNUaA+mZMQ==
X-Received: by 2002:a17:90b:3b4f:b0:343:5f43:9359 with SMTP id 98e67ed59e1d1-343fa74d185mr13287191a91.31.1763384701546;
        Mon, 17 Nov 2025 05:05:01 -0800 (PST)
Received: from [192.168.1.102] ([120.60.57.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36d842cb0sm12295125a12.3.2025.11.17.05.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 05:05:01 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
In-Reply-To: <20251030-dt-bindings-pci-qcom-fixes-power-domains-v2-0-28c1f11599fe@linaro.org>
References: <20251030-dt-bindings-pci-qcom-fixes-power-domains-v2-0-28c1f11599fe@linaro.org>
Subject: Re: [PATCH v2 0/9] dt-bindings: PCI: qcom: Add missing required
 power-domains and resets
Message-Id: <176338469470.49677.4156123055706530266.b4-ty@kernel.org>
Date: Mon, 17 Nov 2025 18:34:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=691b1d7f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=aYgwznu0jBjAPEED3YsA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=jd6J4Gguk5HxikPWLKER:22
X-Proofpoint-GUID: 6INV1kjHbhjyUStWLkVtcsIKCQOF5fz4
X-Proofpoint-ORIG-GUID: 6INV1kjHbhjyUStWLkVtcsIKCQOF5fz4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExMCBTYWx0ZWRfX66Zb7VcrYG8F
 MHkkfhLf9epPdpS+aW5P2LQlIav82X+8gSnXqBpCiIF9HI/UOkSnu/vIO7Awq+CjuPAQZ6djwva
 jMRqnbOor3E0yDhDGApOqKVYCSAcBqjaITztX0LEpfMTPTfccGxT1ye1tw7QyX82BVd5+8QXiGj
 RhnMjW1e+DV+RJB4U2rRYlFXgb4MG513HjEQNNTWRs0cjgqpkaUq5wo3v7n4pHMSP+9UJPCCqhv
 DDBJhGkAP2VFfrOvkkxunEtw4Rq5PtC+IPI0d+BKkawNsDJsZQWvdeU81twbnRztI1zXX4eIx8z
 RsNrTtC37KoEJ7E6SmM+W5sosgEf6kniwGmaKT8awYXPVtzEQ7aqYnuW8ABn8FwS60Z/HBM7wZs
 jUf4BHRmIRrG0xN/uzlgfQ3Tf31LSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170110


On Thu, 30 Oct 2025 09:50:43 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Add also resets
> - Drop cc-stable tag in the last patch
> - Link to v1: https://patch.msgid.link/20251029-dt-bindings-pci-qcom-fixes-power-domains-v1-0-da7ac2c477f4@linaro.org
> 
> Recent binding changes forgot to make power-domains and resets required.
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: PCI: qcom,pcie-sa8775p: Add missing required power-domains and resets
      commit: 2ca17727b3623228466d15a562c6c4f4bea8cc49
[2/9] dt-bindings: PCI: qcom,pcie-sc7280: Add missing required power-domains and resets
      commit: ef99c2efeacac7758cc8c2d00e3200100a4da16c
[3/9] dt-bindings: PCI: qcom,pcie-sc8280xp: Add missing required power-domains and resets
      commit: ea551601404d286813aef6819ddf0bf1d7d69a24
[4/9] dt-bindings: PCI: qcom,pcie-sm8150: Add missing required power-domains and resets
      commit: 31cb432b62fb796e0c1084542ba39311d2f716d5
[5/9] dt-bindings: PCI: qcom,pcie-sm8250: Add missing required power-domains and resets
      commit: 2620c6bcd8c141b79ff2afe95dc814dfab644f63
[6/9] dt-bindings: PCI: qcom,pcie-sm8350: Add missing required power-domains and resets
      commit: 012ba0d5f02e1f192eda263b5f9f826e47d607bb
[7/9] dt-bindings: PCI: qcom,pcie-sm8450: Add missing required power-domains and resets
      commit: 667facc4000c49a7c280097ef6638f133bcb1e59
[8/9] dt-bindings: PCI: qcom,pcie-sm8550: Add missing required power-domains and resets
      commit: e60c6f34b9f3a83f96006243c0ef96c134520257
[9/9] dt-bindings: PCI: qcom,pcie-x1e80100: Add missing required power-domains and resets
      commit: 3b83eea6334acd07ae5fa043442a6ade732d7a39

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


