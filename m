Return-Path: <linux-arm-msm+bounces-39500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E14D9DBD6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 22:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADA15B21FAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 21:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49D21C4609;
	Thu, 28 Nov 2024 21:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5i/wUbg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AFD1C3035
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 21:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732831091; cv=none; b=bjhM8xFmCBBxC5qhGhXAUPTdYg1rAW/C8aDpn1UPwfNIJrbO+KTHL+g47mDLvNeXKWN7Uzott4P3ZgET5ShQY6I5tmEDGAULmX7q1pJQfXH5BmzX6ndcZnARjsDZ2EFfVySJcl6i34QrnwJ/A/ujrxtb9C+6DkAS80HuxOgbU+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732831091; c=relaxed/simple;
	bh=2vwxfsmn74MF7w+ksTz1WddkUGDmHHSJaLJtZOCA/J8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMyoBBo9aziDSLErpNQ9xUA+AIpJSqdXyMibPCufNG77NPn1r/kSWSc9z+RaAyPd5LbMMvw2yoa9dgYWN4ZiutvfNdv+6AlTcqNkbZaMZsvVQDKRG5UWqG/U4JjAf9BBm8f7BEOeGxxxNOAvJd4l4fITuRd5WbnpKpQ6MT+ZJzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5i/wUbg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASLbHlw020107
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 21:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/7+OpqThhWjJD5m7lFQiVxIVoy609XKF5K8pjfWPBY=; b=O5i/wUbgmyy0b3sE
	Y+7KaOPiVru8GemKHGb0j68BbPIG3HkW1tOg5GTGHPhTa3N0W8xtpbB0fU2ffqXi
	fPDRJJHJLWMr/EkJMSpsVnco7lnDdMrdFAKj+wkxbJFM3ofDoCWdhpL2tHe3tx6O
	65+by0VOtnFVlqQ4URyM0LHtWR843WSi+ad7H8c3CFAvSa5ZExXH4OItkqaWdXUP
	Ubbl4u9ylJM8yBklVCy20qfBbyQKz27lVPN70TB55kE8lh8ti6Y/WQ56To0QfHrQ
	eb0Zhn6GHIjTHpPRd2kfs3exS/2XVdtGS8uYfIGSKSQL+APKaI+YXFgmegiWIOr+
	qkzMEw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xw3t7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 21:58:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d41129974dso2997506d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 13:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732831088; x=1733435888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/7+OpqThhWjJD5m7lFQiVxIVoy609XKF5K8pjfWPBY=;
        b=QDrYXJtdgdXGjCuQU+N5r1BPXQ97BMtYzwg3sYoZxmlgWwj+VIVOPMLtExTw1iC1Ry
         cDn/BCp02E3xVSHrM+2+Zitc7fmETpM0c7+ep8fN7vlEN4d9orDWWGfpDC+nIrVBs9TC
         3X7IcqPyyzr8neN8kwh2S0koOLya3sfIUoBdSnXZRPx1Ut4VcuDpvDPEEP2bdUQSItXf
         V1mYslVCBsaslCiBb0BQNReHSe4ox5PR7cjJu171vtXdizzbC7EqHptTTrjh+D5H7pUq
         mUkOnyvbjr38RE5hT4MCW7yu2Ikdv4cpvFQkOQoPTj8xFIiFH7jeky7PCBpF8Uyz92/0
         3IKw==
X-Gm-Message-State: AOJu0Yw8fKZx9OCX5u1XZTSn+C5j0RdPlT7qxGKR1UIhm5rOWfPFt44X
	G2NaYbRU7MDqDwvRSGeo70gXTluRHizSl8lEBIng32ldgAAQ0bXY/1NpG+EgjDIRKZcvV/mXiHY
	VhS/rulNj0mDGSVhdI8Kq3w+9SsXiMtcoey0at0eJz0KazndDceFd7hSR58TR3iKy
X-Gm-Gg: ASbGncu+Pfn10xRs2qD+bkVoibe0N4daPeyJW1CM6OvbxhtstB66tWLnaZFKDpZbvEo
	eLmgmVqCfTM5blmhJ9/vCAeOJpBa4vlCNJLi/fG1JKP5m6SDIB/40vNsCY2q8HSAlN+liRgpOym
	N0Z+cSojb10QwFQ0FovggLmEAFd7JkjL+/rEnno0zPEtULT7gmNTEpQawhCb5j0HZvMCDr4tb4p
	ulghSZE7i/Ves0v4uMnVwdllFhmKvQNTaLwhTKlOeEH4edEGnC9TYc+BQyWGl3/PIv0awSUUAd8
	97RsDHhDQKlxGboheF6dCxHcrpaaDKo=
X-Received: by 2002:ac8:594e:0:b0:461:4467:14bb with SMTP id d75a77b69052e-466b34cba38mr55288431cf.2.1732831088009;
        Thu, 28 Nov 2024 13:58:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2UX9AyLIHl8dl8K8esTyxImHPB3s6JDHd8I9cH0u6SvNGtg9eq6fo13XWcc1+veZ/mvMEtw==
X-Received: by 2002:ac8:594e:0:b0:461:4467:14bb with SMTP id d75a77b69052e-466b34cba38mr55288321cf.2.1732831087705;
        Thu, 28 Nov 2024 13:58:07 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c19e4sm105463066b.6.2024.11.28.13.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 13:58:07 -0800 (PST)
Message-ID: <f29d09e9-8739-4e25-ad52-531af1cdb283@oss.qualcomm.com>
Date: Thu, 28 Nov 2024 22:58:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Fix the size of 'addr_space'
 regions
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241128145147.145618-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241128145147.145618-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hi01Ez8qDGxxO6MqV1p6U2JPWrnSnLl1
X-Proofpoint-ORIG-GUID: hi01Ez8qDGxxO6MqV1p6U2JPWrnSnLl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=658 phishscore=0 adultscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280176

On 28.11.2024 3:51 PM, Manivannan Sadhasivam wrote:
> For both the controller instances, size of the 'addr_space' region should
> be 0x1fe00000 as per the hardware memory layout.
> 
> Otherwise, endpoint drivers cannot request even reasonable BAR size of 1MB.
> 
> Cc: stable@vger.kernel.org # 6.11
> Fixes: c5f5de8434ec ("arm64: dts: qcom: sa8775p: Add ep pcie1 controller node")
> Fixes: 1924f5518224 ("arm64: dts: qcom: sa8775p: Add ep pcie0 controller node")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

