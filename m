Return-Path: <linux-arm-msm+bounces-65307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2807CB07BCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 19:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 520DF7AB1BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F422F547C;
	Wed, 16 Jul 2025 17:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcrgpN0R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC82F273C
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 17:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752685895; cv=none; b=LPNkDou1r5SrPCUeAWZU2Xlhf79KwbY/XRLRYNFfB6GKscrdxgdevuH/CyDrZQm2WRcQpZ93S/SFvBninUCun4A3+wL+oWF4dzQEK2SVCv+E9x8DzWQ5axyPdJNftfcv8Me9n2sPqknl5ZJZvwgrap9Wb0MfUv86zjjT+/lPyko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752685895; c=relaxed/simple;
	bh=teMc9fjwUgbak3TeVa32zmM1K7Kuh41Gi+pH8Ju0/BM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H2MYNkVJ2ZyhRmBEdKJWVzOqUtbo66RMaPT076jdj+KLi8Y/pd1q/N0+AbrbE6Ad3qzyK6hHyW8eiHZ6IJrE/bQvGVH9Sy9wjw+uY6uYPy4wZpIHV1yjGFmkdoJfSuCmxvYnNeFnPQdronoJuB8NpTA3VSQ9WsREUHgtGg3HVrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcrgpN0R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDdcA008788
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 17:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AvZu+s6FPUG3iM8B2iDP144HoBABMQMyB2lUuofN4v8=; b=lcrgpN0RS21s/wFj
	BA3V9E2v1JVAb0Jubcya9oPGT/MF+0yYlDwuJymmhDfnmwOBvvSZbbRcJCBu1TOY
	8NLV+BAE+cMui13Nej2B0JwpSsfbb4p+XU1HEM8aFm6g/eSVLKdLXMhUan+Wo37U
	LyaF8coJAdDXauV/J+qOph7zsKyDCWH2iAWQGHe/M6upStdCLSQNHLxJHs2xdLyA
	3EyrsJuzQ5fqObKx9gfBbbjcyyVvdCO4R/aO/aN3jLhSi+KVjnO5pgQcPhEFwVp/
	8OZdVTpXIZiVJPZLCb1QIh2yqciql6cFRNZ8xSj9ykqhbeAsK6/K1AvK9BPDslu2
	Z0w+Ag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb4u6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 17:11:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234f1acc707so299705ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 10:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752685891; x=1753290691;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvZu+s6FPUG3iM8B2iDP144HoBABMQMyB2lUuofN4v8=;
        b=RFd2TSXWiuXg0T1FupU8NOlOKHcEWHruJ6eVomuK18Rxnh9DAVkZqM9CL5rqvSsY3+
         HsYRFpL1F/8P/yokAkQYv2Z9J2dNUsvtyPImdJL9D4R457sKquUErET1mIYcbr3Oz6ln
         ZyO0eXrTyNiqWaz2YfIBqiL9t2H41QQO9dxzmSP7BbPjri9/pK9+Ot0fUaPyQuQ/z8oE
         04sg70SDFqIKqS804z1qaq1UaliS4Lx10Qjc0b3UIDXYMGrGYUt4E/FLwiixnSPscrSZ
         mwdK0rwKG3uRinm+eJhsITmz7KXyhAJWuEUnboBQ8hvo6dOqp2EF7XXrRy8Ty6pDl/d4
         gRtA==
X-Forwarded-Encrypted: i=1; AJvYcCVA+WL3TFo7n4qEIyS1qk3L//5pEpf5LZAMfGBb8GdGwYANOK/sOHMY0ydQcfQnS/VUPMVMrBbKyW10x8BH@vger.kernel.org
X-Gm-Message-State: AOJu0YyAhKXGL/IQGG6hoQFgAfWhE6IGtLU/W0dyTJe4SKsjjKEWEFvi
	MZZPDzLiJuoN/wI9qD1YujVNSlZKxMqPjWtu/P5bCVTa0/GMfWNQqfb8AHaQPleyPKkhHgC8idV
	YT5heuFjlT9ePGXbyxZkrl5J1GwiqZnp65AE2rjPVeyFP3ZlASMYnD23zk67FViPpl/MQ
X-Gm-Gg: ASbGncvuYdQakWnaQrVF3SU9V63fqEKQwaj4WtfcwaDoF+1RP97SBXBjovEEuTmqsxH
	mOTW8ezZjdtQs5jMAJ9w5u4jBYSPlSHEQdrTwjQ+UWJL9owkG7cqWcmM7QD7ZeJUVxi9oZwHfMN
	dSw34vKaw9p1zJD0alO+unAYbUs9DIylDqzL5Rf8Aj89dSb6TrBP/Il/qk3yQ/vm+SAGjosThdj
	Mmqug40b3wrsUhLhIvoBwibZgAM+HVd3UGZdPflTprQfyw5yRrWQ6RXnvs8KLlsR7xDOcEQlOHc
	MCnSR+GlHJ/3tFNHjW60A34sxh5iV0aM3TAz/lH0VKTQrW0uMH+DkAo6L25ZIHGKQbR84ZfePzg
	l5aPV0aq4D2rtCO9qT9A=
X-Received: by 2002:a17:903:1cf:b0:235:efbb:9539 with SMTP id d9443c01a7336-23e256b6e94mr60970565ad.17.1752685890853;
        Wed, 16 Jul 2025 10:11:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCaXQ8h/tJKVUb7+n8ZsAIn5RASnIJXRAkFzeIQw6HcoivPyubiz6hlD2vF/imJdL6JmfECw==
X-Received: by 2002:a17:903:1cf:b0:235:efbb:9539 with SMTP id d9443c01a7336-23e256b6e94mr60969775ad.17.1752685890010;
        Wed, 16 Jul 2025 10:11:30 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42abd8esm128205355ad.54.2025.07.16.10.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 10:11:29 -0700 (PDT)
Message-ID: <f3374104-684d-48c7-9e2d-e97dd48700e9@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 10:11:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] PCI/ASPM: Fix pci_enable_link_state*() APIs behavior
To: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>,
        ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ajO6gadZJaHaKYXxGm1rgs9PkOtr3UX0
X-Proofpoint-ORIG-GUID: ajO6gadZJaHaKYXxGm1rgs9PkOtr3UX0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE1NSBTYWx0ZWRfXwg5p57ePWwqy
 O+VAVatk/OFqxQFL0/OuDwA7ZMB7l5GvghT7FpqLG8GWZBpp4zi7xOVplfNuJs/aaAj+IQNUTH5
 z5dyouVyi95MKN7EohybErmN12zswUOZ5bY4ZcNg7vNSceQHhJezsX4RDzsS4koNMGuEC8e9cdh
 PsQ4QlQlm1/8uxrx/VZhzTXGPP+7WxZ/VDTrC7Z3suSlXmQ2lSXrEl+R9UBHcpdRjn3bvoTMZ6n
 m6hKzB13iGajG2a55m/0FXU/fyHkpCyaRi5Tn2PiWH65iYjEVhoqgt/eNxdF0sHxwEUwDARj6rh
 7dNwRZAYLGAhqFkvJvIvhq8ggcINUYb4mW5EtMpijO0QF/SNcGlIKyxSztSJ4yPz0IAWMMjgOJG
 VDN5q0LlhXBE2orj/vLmNLyRzBgLJLUO3GTihEP6qBpPLgG+YIj6UCrzchUmmSsLYB1iZwOW
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6877dd44 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=rhYh_zIkBfzxVmIspk8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=434
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160155

On 7/16/2025 5:56 AM, Manivannan Sadhasivam via B4 Relay wrote:
> Merging Strategy
> ================
> 
> Even though there is no build dependency between PCI core and atheros patches,
> there is a functional dependency. So I'd recommend creating an immutable branch
> with PCI patches and merging that branch into both PCI and linux-wireless trees
> and finally merging the atheros patches into linux-wireless tree.
> 
> If immutable branch seems like a hassle, then PCI core patches could get merged
> for 6.17 and atheros patches can wait for 6.18.

I'm fine with either strategy. In the first case I'd merge the immutable
branch into the ath tree. Note I plan to issue my final PR to linux-wireless
for the 6.17 merge window on Monday, so we should close on this decision soon.

/jeff

