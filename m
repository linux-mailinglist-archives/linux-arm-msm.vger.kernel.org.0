Return-Path: <linux-arm-msm+bounces-86389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20335CDA171
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 203343011AB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBD930AAA6;
	Tue, 23 Dec 2025 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L41AucPh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fK0NWnQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EB62D0C63
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766510551; cv=none; b=j9CPipyK7Pzz1pRDbDhk5vydEamJFFYJKwR39Urn+G8L3xSaPMZZf0B68enPvCpZwkh7PuGM7cD9WWfUf+TKGfeAPZ0CVC0mbkcJbp7pS4hvdAMcQSgjW8nqGhlm2yewaB4v5csyN1r6JUiKMi126aCuQUPe9Tv7neIODlWzqMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766510551; c=relaxed/simple;
	bh=n/VZPJhCCfxyiBW0vEKI4xJrWGWKXKiLJn7+t3zRma0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FS6VnfVqCIVveXNV2h8SxLkIPaEFu8lcCJaaqd5DY5/qW7l01V0hFlaDyaZv39U0FtF6+MiFbqeVwF4mNEn6s/Yxa1XxhGQEq8GF86Y+iT9mi2lmZTXgiNVHdNNnKjcnEZr0EHIgVLEpj+/h7fQmodhTuXRw5XFS3iF7cfi6Hng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L41AucPh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fK0NWnQU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGYD2Q2748481
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Orq9wKUBvVzGkypvy0iRQgRQSCu3S8E+qVpuNnKHYM4=; b=L41AucPhLLeMv2qt
	k9eRXNzolkkHuyicIYlwhw5Qsgh7j8ZZ8cwkW7bJTKm29nwOtPMLWDXg2X403Mms
	oHFNnacoe1K5XV12S0J1r/ONKMgEMzQu466rdQry8+IbF04I+iyfJmITvlbTTkWE
	8denWBnH7n6cJWgLypoDDVp2n0btDZ5/xJmcNr97df2C4drI5I+ruRvqpjAXrlCT
	AMLGNTxYa6MfGeZBRNbnJGLVoQEoBVznQtARdk+rig2jYJgG+0if2jP0SXFuOvg4
	0jv4363heMn4EN9fq+69R3wNW0r5N6joDYmO/NEiMmwULdtdiV/e4oK4wjAi4z6W
	yLU6Gg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5ctxbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:22:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee05927183so6026001cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766510548; x=1767115348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Orq9wKUBvVzGkypvy0iRQgRQSCu3S8E+qVpuNnKHYM4=;
        b=fK0NWnQUZOxmV4t2C0ighlApyX3HyjubcqIIO01CSTKvE/nrypbbzF6KHcw2W68w1t
         rlcrs2EXYSemS4PXiK5Fa32R/dvu3YoKzhokRA+J/FJqQJ6/IBPjrqpB82oLdWtYd2ed
         jJr2jzfeHQ/GPtj8OcquHXgn/o9qDKcZLjhh7+aWqx1H3XszU2Run4j08pDY5W9mbiH5
         ejH8FQFZr61eJ+xTKlRW4Q0OK6CA7nV+o10pqu8lpGfigoyW14xooUBvrp//fzKqy3B8
         NyMF3kfGBMRrcjvZRMAgHjq+yFA6YRdbejC/qzJLfvJiLwzLANtCuTWBHS476XKHTz6j
         TfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766510548; x=1767115348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Orq9wKUBvVzGkypvy0iRQgRQSCu3S8E+qVpuNnKHYM4=;
        b=uqndcPs7GJqJw5ddpOdJVPnxjeHacFT2IEaIrVS7G918Rj2bZAmyNavntbU/L/x6jt
         9zKha1co1m5hcVI9zhY1MpQI7qePja2/9iwzKlmFpGFiWyqBl4BZ1pP0mUpiirrPDcln
         n+WqO9w4796d/t/vAea5XoguuYITXZdxoL/3pDAcpEpBsV9Yp1WEF9h6G3Mx7+vqQDSF
         J1hYGjXnBhadc4w8PmTu8NW7xq7CpcbJ0AahJ365Dl8nRn+q545yv5t4g7/3MqZxvJUu
         O1Y6vcKPffX1vsiSZNjD1M4iMIt+exV/zujOCAU6miuo4xtQiVi7519arLKh9VOtOsOt
         MbqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1/DuLWPOyS0mKV9ACsvQWC+Pzm+aL5vcizFnMiQsRVVRFPGvJCK/VMQgz/w8sIZHTw/VVAKVuCZQ9DkvG@vger.kernel.org
X-Gm-Message-State: AOJu0YzLaRDOzWtz9Bcw/V9SyuABTmNb0TVgIU0u76bnyT7w7EZAD/zz
	QMYXA5Iw86ezKBi54tvJUIKWb1db9u094XPCK+Z4dUTnHO7UMFMmulXlqwz5rbGERvdT83W50WI
	BqT4OxT/Hjk+A8plClIjK7+lCNeIJyIFsc2nfdr0b3BL20yM90zdnv4IMuwWfF4bWui9z
X-Gm-Gg: AY/fxX56NFSdDsYn71Ifsbfcok3RpDQAdr43UCdh+gXHOWQSAjmtXaWZgAgtJoBi7zU
	/aGZbSoW3spq9UOoU2JBJafOiQUI1qhqySYoGJ3Ayz/M7+ZnSBxrDRwoobB+TSt5nUunK3Csd3o
	YwLyO/jAEQ6t3lFG1+9Gd+fj08lnALTG3IhsIQxuVnx8sMEAef0gSXnJ9OUs5AFOfGHRz9Gi0Sm
	rWVxsCJ7I4FuNiflynRQJpS6AXkgWbXRyjFFkjXlGF5mjEtQd4qift9NvgScOEN8BlS29hxsbMs
	PeOb2+c2p8+Wf+qDbVXTcA+PAOO3Yctq/FS6agUYhx6+xaI+5JPnszwlUcYQH8tBD08+Ali1838
	HUEx/uZCp1CFykxJvTKJQgNpdNUbZmlVkYpG4orp4z7i3ZIOzfqcAZrmpYJz1GP1DLA==
X-Received: by 2002:a05:622a:1993:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f4abcd2349mr170578011cf.2.1766510548327;
        Tue, 23 Dec 2025 09:22:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELOZLadzmeT923Apr1q19BK8/IF5aqoXyY9oEU+mG0faNOOJ8/zuvfSBi302s+Dsez0NMa/Q==
X-Received: by 2002:a05:622a:1993:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f4abcd2349mr170577731cf.2.1766510547921;
        Tue, 23 Dec 2025 09:22:27 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6ebsm14023088a12.27.2025.12.23.09.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 09:22:26 -0800 (PST)
Message-ID: <0c805217-6c19-4c47-85a4-fa5316c55df1@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 18:22:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Use lowercase hex
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223152559.155703-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251223152559.155703-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0NCBTYWx0ZWRfX25jqNPA4xf0g
 tVCsKtmcm5STpqZ9Dla+tz8Z8uebDh/tdD58G3poCOu1/3s8JMI+7n/vh8U+YYkgq5l8RDFEwA0
 MRcr4J/1KWWhLtNAKElxpYKVixd+eZO+WPKVN7CpBnLXlvPa1nH79cLBKz7PrlweU+ljvr5Zz7E
 tdjQxFSgWwJzMLQwdlAZG5Wt5Cu8cGpcWtmPeUpzi1uORNVu9IBb3TUhfsNWXVJl2IobXgvErr0
 fpH3ykBooHeKj3GEwqMrVt+QA9IUd5+3i6xHM/2gu/xeD/qcaJL8In17iFciXHxJDuuD7tRFcCr
 /7fb5ZP7rZ3wdxRJizs4cd6bKuvc3nBRlJhe9ZokfIMMu5heHYCch1+SAEfIkDAW8PkwGvEW3xC
 iY+iayyK93/zE9j/1mDazrLtiVtVsVQk24BRxqlyqlzlNVq1ptodt16nd9/DltlA2+YZHNTzuCm
 hMpzPzN1IvLZvTM/uMQ==
X-Proofpoint-ORIG-GUID: 4LDQs6r-X_C1tbbWds3rcmyzj1dQlt9W
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694acfd5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=k3IfduSUFSsBsgMvupkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 4LDQs6r-X_C1tbbWds3rcmyzj1dQlt9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230144

On 12/23/25 4:26 PM, Krzysztof Kozlowski wrote:
> The DTS code coding style expects lowercase hex for values and unit
> addresses.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

