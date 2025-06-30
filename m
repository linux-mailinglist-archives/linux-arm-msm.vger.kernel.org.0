Return-Path: <linux-arm-msm+bounces-63052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E04AED9D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 12:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1723A174A5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 10:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140031E2858;
	Mon, 30 Jun 2025 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pO8dkdIq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8804E2580FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279362; cv=none; b=sBZ8Rh+sSOczJ4yMoz6cjwjSgvxPfwM0g6c+QsLvBiKa0uETETE4RwPOPwJ+8nnhHAZlru48LLvf2vNQ4RGgSpO019IspXlKl+Zn3IDnXbrgqbdkxHHdgEZfdIhG0PbdKhkivLyv2zHyOMQqK+NQGK9yWlLg0dCewKgTvPH6zas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279362; c=relaxed/simple;
	bh=Qfeus0fi75FXlK5dsvHPm1RM9rlMOVJ4gaAPUwGB0oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRgxyOGw6snFoCsyiDG45UI8V1Rv+nrYDWeROofTaqk1AnhcOfLUckPloKU5FIcIhXK23OFFuBUS7sOYoyS5pGsvmyapJ1hQIHmp0iEj75hWKVJVhPC+HPQnaTvxDdFEfO9u8nKg2yTpXeAicDobPW3mBpjIl2BU6ntEDsUiT0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pO8dkdIq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8D6rB007050
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxRkhXbBD2jXozBBx8BaBKLc4O0rV/qo+XOBpnpdB7g=; b=pO8dkdIqCs5mR6H2
	8d1kW08EEifkh7AoWffDfS9pzsrLwDbXMzQ2MSuJDEIenQLdH/G47ieou+KhwjI9
	JORYzC7OB+pLBEEji+zx/7JsA0eL4cVtSZz35OG9qz3uuKLfwK7qeJpaDSAZJbHH
	Glf9MTCv9mY+5zks0K0lBnn10fg3xSnUiqeOjO3DGnfLYJ/xJWbujNaqEZ1e6hD+
	vSJmpzqu0RYQ8KhuD1vy3S53HqfdOusGEYcffdFWoKjkUpelpnZRN1yIMBYp7xcr
	uUBSizyHGm5LiEYGZ5bKvbrYNM6HkyXhvdizrV1Vg/3/OE7zbJ+5kzG0w/anN97G
	dB2fbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5j8rbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:29:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0a9d20c2eso111159885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 03:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751279358; x=1751884158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxRkhXbBD2jXozBBx8BaBKLc4O0rV/qo+XOBpnpdB7g=;
        b=QmH+qJOmij91a7xSpjmKz1LBATxg8SQYVSYjEC0R9M6quJraroJQOBblrLsjJBos7J
         4nBzuspq/xKIoukwfY1M3DuMWC2/be1Qpyb186anBGUCwWtS2ZkydKMDEsbx4OHVu2Rq
         7xkbKpZb9q0vGp8Qnp4RG56BIOMulNdbN2aIpS423/dwqi6MU+rURD+mbtPiMhObAI7C
         CXqryRFbuSBST/5GPs/rXOL0L23Gv/T1bTaO01vim0b1KcpqYYjH1ca+aCp/wgYEU7Mr
         i23VWyJ+sAl7hPMrNCZ8tIbbsLyzwk0jVHoNitWVoc6wNRM5476ttG3aTtJDAfbPWvNf
         OyKg==
X-Gm-Message-State: AOJu0YzKdooH8ZiGj2XVD6o+C29Fdqd2nVPeIvICQgvfxoS1mOBzdWJb
	KG4GqBGwa1V1FGhycQ33wIglONG0KQZ/ftY21xtjBbd2dwHZdkNBktFDzcIcrPDGf4xQD9c7Btq
	9mtA7VOhxFpHUlLIRg9dKmmUVDy5OxRO86j4woq+rErO2MKI5lgmQ9Q4op0Rh9k6oj/aP
X-Gm-Gg: ASbGncumfQCNrOsKRQyey+hYQeoxVNYiybgP0ebfPROvAr7zRITb2SIxkrMzlQ2Dm6D
	XqJX37U4T4VY4/k+wZ6SyL5+whCx+3qHm+OzjqLK0XdsCdENwnfy+vOk3X9jgP/x3lZoGCPCNfI
	GJRYwVMNWyAtcUb8QkN+6/tRht9Fu8DTQ8mThaOynVnEKzAXGfQmAcYHnvopuATbe850xkYe3pX
	fICvEvfbneSXRGkpgX7eSuGJ2NVczjb5JGVfocVn44eku2fly5GEru7BRPZW6cTv2sKPOwItOD1
	h03rV3ZZWDv6NCAFENcYMAYjwcYoGBy+XRdcViYcrCQPAZP9D2miLKLANNv3+URDCm5RxaHib/Q
	OIOqagTlb
X-Received: by 2002:a05:622a:22a9:b0:4a4:3b38:cfe6 with SMTP id d75a77b69052e-4a80739305cmr48946491cf.4.1751279358067;
        Mon, 30 Jun 2025 03:29:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq3TUuq9QQu4q+5eVhyu3awFeRhvpmt64uHtXnfazNC8wlrVyLUUqKAbg7zRjdnEtGDAV3YQ==
X-Received: by 2002:a05:622a:22a9:b0:4a4:3b38:cfe6 with SMTP id d75a77b69052e-4a80739305cmr48946321cf.4.1751279357583;
        Mon, 30 Jun 2025 03:29:17 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6beb8sm649121966b.132.2025.06.30.03.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 03:29:17 -0700 (PDT)
Message-ID: <2ac4f10d-c9d4-42a5-afff-54153f8531e1@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 12:29:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy
 initialization sequence
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20250630-ipq5332_hsphy_complaince-v2-1-63621439ebdb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630-ipq5332_hsphy_complaince-v2-1-63621439ebdb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=686266ff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=xc97Rp9ifvSRjCmUYYIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: DbfdalzKG_8iN8S8Inkm7oJ3E5AFXQNb
X-Proofpoint-GUID: DbfdalzKG_8iN8S8Inkm7oJ3E5AFXQNb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4NiBTYWx0ZWRfX/DDdsX1FA5lC
 bX+eW94XqoFx+Uer8b98wbU33qvfDH3P95+Ojn46seErVKSF3zyLDHKumUgnHzd9s813QDqNdRa
 qmbiUvcw7hAH+jAaxkJrtJxukOMC6tmwORwN0Mz+vg6eak3ckowLdWxBZBaa1JQltaZ3IGhLVsY
 TFewapEMuTFiVvyyMFVzFAZkf2GYpu9JwpZizG7Cled9Va92dCRD8DqPU1MzJMq54upOzs4OlLN
 uMCLhWmokEfqRZH29AJDRBIqq7GTmmrYfNmMPwTZyIKqc9mAB3IuUh2xYzzibNg3k/+SlSHv5Nr
 sjyZ6MW+liyxt6BKXyJqj2tSq60z9OSvpqQNf+ctR29wLd/R/Fqd2lTZSmx9nQtozXchw08WKQq
 Eso65DQs5p52nGGV/YiLSfKJXCb5AoZ0k/AP+++gByCGJhLiGNO9Og1yfCgQN4wQzI7dqWBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=744 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300086



On 30-Jun-25 10:18, Kathiravan Thirumoorthy wrote:
> The current configuration used for the IPQ5332 M31 USB PHY fails the
> Near End High Speed Signal Quality compliance test. To resolve this,
> update the initialization sequence as specified in the Hardware Design
> Document.
> 
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Cc: stable@kernel.org
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

