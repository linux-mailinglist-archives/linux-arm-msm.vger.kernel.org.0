Return-Path: <linux-arm-msm+bounces-66337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52B5B0F7C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 18:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3A725853F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 16:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B051F30BB;
	Wed, 23 Jul 2025 16:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kju2Vkh5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5431F3B85
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753286657; cv=none; b=lpEFpudTqP4qF8l8BIF0V+xtY2ocOxv5NUdnO6YphYU3D0nWC/+SSJrym0VVUlgtZ//+7GmsHVr4cTPUjmJ2O33dImj4y07KkwcrGeFgtRUoIha52XB09NdCL+eYQ0jUsg/WrOx0nColIrzJRbf1WgRsbR5D1GlFRWxJzLEWzQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753286657; c=relaxed/simple;
	bh=KCfstuN77De2m94GHTvsNHvFZ1vdK9nOTEgDVUINVok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fcvxX0ti/1aYvinZXt70SSa5SJWXhJqoQ8qbOmzoPoKb2x3xUXrzn+81wDsnsHZHREH3Jiu0Ue0RGGZfUCaDT5vpUTBNaWsdEd9FjlPVOc3Nk9ZVQURR2D7QjnNHKAQceJMiECXQlIk016iwZWqm91m6ot6sqVYXaJjXceJBXTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kju2Vkh5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9ILli025883
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 16:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1IVq+bSzc+i0gbcHvdWX5X0gFlHkos8QZkR6QJHMwvk=; b=kju2Vkh5qgJixjmy
	0LuCVz/DmtBSHrsGDasQ2Tu4i4rfNXAg2XZijdJlxWiM0RpwLAZbVFKCm8Hoovgd
	WyypJ2Tp2ECJ6/D1ZBIJHVqwaTsrmnVKfxO05S/8LVeJ0NmZJe+U7mjn8HyvKFW5
	WcNqfS5NM8YhZeMkOp0DKg7PAe1X3OEvU2mHfm1mF6KDDKQijF22o/x9jptCNyUh
	BOS1stNXo85wblzZy+glcyioFMYcaFb4KIcBZXUd5gJC3WFcJPxUA5DOEv/iR8ME
	wjI4qeGDb7YbpAdubb2R/ukaMSlVLcn4TxEL7E+S9nP8vhm/uE+yAodgIFoYaY9w
	wTDMiA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ucbq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 16:04:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e350826d99so7298885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 09:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753286654; x=1753891454;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IVq+bSzc+i0gbcHvdWX5X0gFlHkos8QZkR6QJHMwvk=;
        b=LXRorFRhVV5aJ9DgyxCGibQj4e3N1L6IHgNjN16Bm3ANyuwqqOJg2JcEHXymdkiO3C
         XNfvSCrDsGQ68GMYu50j2X1RaerBLxalbJMjewz5NY2sezD/r2rWtlawQVmgZYSXmle5
         41HZ450jpG6e2CjoI7b6BPL2BPgPnKgoTDJ5rP0dJojmV5ieIIvqcZvim8ICVLraF1SZ
         f3/3xcADiE9aZDi6Lj0/EpDxQ4bj0pXOR9uYNO+atOCEky8Aiv+Gpu+fqpSVBOrL9P7U
         65U6IvkEmP/S5HKue7o1YMkggY3o90YjKjVIAE9LWdqxc1k+n6nHbp1kCytwAXewuzxU
         97Fw==
X-Gm-Message-State: AOJu0Yzoc3I2e2wQNduZ+5OSLbI82jGktKznifazFmrhD2wKgMldAiXh
	k3NZeAZ0GX3KEZT00K2BXaZ++CSvUKtdFOLFJRgweCvjgbIwNpR1SS4mv/YKEpYyYhckGSkFxaX
	wLA6AtLs1S4g20WnhTWwqb6guelNnb9/O00z+dFSK+ExLArGlNCsuI7kMalv0dVxJC6a1
X-Gm-Gg: ASbGncvHLyl5PLfRHEbGWQlpgS3/QmvSi3cfJoCKksOlQPFEV7neBqO7/SJtnW7Ft6D
	6LlwJs7J/PrCcisMncehk14JsfZPWrt416sy4bmt8pk/bltiZQ5CSvr+wIJIYYZOkTPQMWROj0A
	yzsmFNQB/UnRRkTBIfR3xUV3YeQlZLtU25GEfnU3NvdMRPmft9yie6jfwnTvxPDLjYkWjNRdDU1
	/nfLmXC2dlPwSNHvqdEnwuHurlfR5LD66j9PCR05xMaQCxHdwO/hMryoSjJJgETGNG2KhZi2GoD
	Btj5OfYK4mqjXslPu9yqBeCbtPWOJiGN9A4=
X-Received: by 2002:a05:6214:1c86:b0:6fa:c81a:6231 with SMTP id 6a1803df08f44-707006aa843mr42537796d6.8.1753286653654;
        Wed, 23 Jul 2025 09:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhZaSVPPcM0H02S0SyrGlN2YH/RRRuvuVz7tS54TmJPI+kAWBGLQw4aW0+GxosM+D8oehJNQ==
X-Received: by 2002:a05:6214:1c86:b0:6fa:c81a:6231 with SMTP id 6a1803df08f44-707006aa843mr42536996d6.8.1753286652887;
        Wed, 23 Jul 2025 09:04:12 -0700 (PDT)
Received: from [192.168.1.17] ([61.2.112.87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051b8bc2dasm64468956d6.12.2025.07.23.09.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 09:04:12 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
In-Reply-To: <20250718081718.390790-1-ziyue.zhang@oss.qualcomm.com>
References: <20250718081718.390790-1-ziyue.zhang@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/4] pci: qcom: drop unrelated clock and
 add link_down reset for sa8775p
Message-Id: <175328664500.29282.12330427204137280127.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 21:34:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=688107ff cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=L2vWZV9GmkZVUxua0bORKQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=AxdmJqN1ex9b-t5leqYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEzOCBTYWx0ZWRfX9yToa7ptcUyy
 uiY4gDc9iuR6MR+TIj7+qlSS9hgVkbfpTTUSMPWMZyaBoKYZjSzaN+Z/PjwANzn3MMrlmTda8Y9
 rJBUeCcZpJeNQmaf5B0F8fh+nFhzPB8JJZuyqiMw/hdGzxZ6M24th/c6VnXc71FgvmU2SG0crJK
 6YWfNaf+nDGaXXpjSpyEkrHjEWIZ5PMPFRr5359oP2e9mbfvpDfNV4DgJIofCMUA+hBKG1UKpLX
 d2SgGY1VfrkT9yj1wZvd9XFNmSzeLRdVJA+LTXHNOA+dLY4I/IPLh1vdVZlOgkuWPye7gLpuXpx
 xV9Bf1IA5F2RmDo6tPDs+ud+04NQQCPZfFvonbSlLoVdX81lO7YiKaQxHHj3uXZ6UKYSillqK7F
 TB9scMFqD9JhN7M88PdHG2BGV6p1UyPqZ9zvqmYa50Ev9PJGH9VkRDUzd8LkD/9khWCYNRVm
X-Proofpoint-ORIG-GUID: -_kuc9M3WLs6JYV-EiKRosSZ_i94gbJx
X-Proofpoint-GUID: -_kuc9M3WLs6JYV-EiKRosSZ_i94gbJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=842 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230138


On Fri, 18 Jul 2025 16:17:14 +0800, Ziyue Zhang wrote:
> This series drop gcc_aux_clock in pcie phy, the pcie aux clock should
> be gcc_phy_aux_clock. And sa8775p platform support link_down reset in
> hardware, so add it for both pcie0 and pcie1 to provide a better user
> experience.
> 
> Have follwing changes:
>   - Update pcie phy bindings for sa8775p.
>   - Document link_down reset.
>   - Remove aux clock from pcie phy.
>   - Add link_down reset for pcie.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: PCI: qcom,pcie-sa8775p: document link_down reset
      commit: 10e7298dc0f14c52d9b5c52fb52558f567815b7c

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


