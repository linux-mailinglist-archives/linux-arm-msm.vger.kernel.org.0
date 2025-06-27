Return-Path: <linux-arm-msm+bounces-62769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E71DAEB77E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDD50565B47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D78D29B8D8;
	Fri, 27 Jun 2025 12:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2mYc7i4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1627F4ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026670; cv=none; b=azFTS9a3Ld2bF0V85ldLkfIF5oKED1VPYvAhBRJhNa1PPSA8HkWFKNSDowL+I29SYI2dPhbX65ULxsuruAp0oOkdJ/LCVimvVq8tjuvTLQ85Ww0irsIbWzMJrqwQ/5e0UVA5ajTGn0OeYdijmM0skU7TsiM+TytbIyzx0GDVPIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026670; c=relaxed/simple;
	bh=lccNhp6FqIRSa/Q9kLRCcCT7NqJsIU00/JLCxD8q/oQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmFpNNfO251VFWTrdgH55v3xfANeVGTIGHFgfX4bNLLy1FDTQauNY58qE5vmXbyBbF+AmWRRj/efGk8q5q1xqtkl0iZ/rOhgq1Iw0XR0Rmo6/ZPBe9tPt/j6kigHDMvuZE7HnBFGlpvux1hYDIq7AnFxwfU8ZKq+JsRS9a0ZpOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2mYc7i4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4D9mb011216
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJ19J1LIBwAi1TN0tW2T4j6V8Ae2MTfdTDqckVMIpqg=; b=j2mYc7i4EvQ/nNkj
	aRo4PcxFrCba/VMkMsNwtWEc1u7WDv2paXrJLHlMPWOXmKt5lkU69Ll8yhYF9mu+
	R50p/AC9BRl6XeBaPLJ6WB2jehuJ3OiWdg6bI8E91DhsXP/i6WMB4b78856mlfb1
	WhtGCij4FlPhdCMz3VyzukA0zdp2RD7RH2s1xjulgPjyMJeAsuC4hhCFKNVVfV7Q
	xX90rvmVEzdrqoPKz4IGD3Qfo2VvYsVXW2azychnvYX7LxGalFPnmiqAuoE4nZwT
	AHZLAhVABcIrepqEhQPrBWMWkvWzyNtNXuot46uAzccaF7banUZ4dJVR8l+GyWHx
	IsOIjw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgpqqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:17:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb030f541bso5432626d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026667; x=1751631467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJ19J1LIBwAi1TN0tW2T4j6V8Ae2MTfdTDqckVMIpqg=;
        b=pF2n2XTg8o/Yblp0U0rfcO0PQZa18lwqDSjsT9UFtFemUOVHLvgMTg8qhqFSgfLbF2
         JkZsFRqQ66YPPWPRI7avbzykUeobvk6sxYxuOZI9Mp6OwK7I9kFtUEh0kK9CFB21oceB
         b1e2Zk1sDsntWmShxKH74YCphomI/Q+fZu+SneZKrql9AI8sFTUnQ1DmLjKwRpmi4hfh
         dFeDmJ3Cel4TTKwJJ4+H7v4LsO6XDMh3BpBgZrAYqc2f/rVgiJN7baYOvkx75crINuZT
         46LiKK0gqm7jNWWZlg7w2Hx1fLXDa9wWC/FEV/3jcrp5DYwqk4K2pVqBIyz9hHBIPxY9
         a4mg==
X-Forwarded-Encrypted: i=1; AJvYcCXzYMON4zmvSkOMCxgG3nrXwgS3b0xfsJbUWxqsFaraCC/IUIstznviiyNR7DJ7wwvKcXb39ZwVC+1pikRA@vger.kernel.org
X-Gm-Message-State: AOJu0YwoGcGoyWgJivTt02HGLWPPoQqhbbzjU+BWsqUx/nyea0NcrwDY
	+ZaizeMTb1/Uf6G1Iuu1DSDHPxYrzUFrsCh/SRnBwCE89ba5yGkTmE94H5+VJ+Uii6buTOkmwg4
	eDkzeixd4TZhFIWpuIBRCudu0EF79tas7CF+Z0kGr4SDAsem65B4O/lEa9yTY9pfXuKx4
X-Gm-Gg: ASbGncujmfekgx3pBoDNKe/38aNfIEy5E0+zbUUSZ0pE2mBhlmPu8naK3ZgHKU2c4Oz
	jNBtKMGKJk70cPRboDzs0A3IkjGHFzkA/g7YKvs9ZGCKcUrKxu8p9BOpFqdT6ZACFnyKfJNNOQW
	w8ISzTUF04LlW/QinsTBKhf5vjRJq3ahhw9ytoYmujDVshGOS5MaIKO6qgU7FpgOV+fok9cuO/0
	Xu+gODrTOs0BfP9pAc4z4V7PTzHx7MR6X97PY/JvhcbPkSSQ9K7lovNRCK6Wn16JmozUmny4EDI
	x52kwnULVliFD/xxbTh2KUzDENACdoQTvas5VI6kb2eeG7WPZGSzqn4ON/F+YrrUg1JFBdamMzC
	ZWTc=
X-Received: by 2002:a05:620a:198a:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d44394f337mr156190985a.12.1751026666699;
        Fri, 27 Jun 2025 05:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIK9htb9TjdDdSp1TC694025TRJoUgCOt8XrvN3XdaNpk29pDfLu1EUHUVl+ULYjW5QjCFLw==
X-Received: by 2002:a05:620a:198a:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d44394f337mr156188785a.12.1751026666346;
        Fri, 27 Jun 2025 05:17:46 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca205dsm113371766b.160.2025.06.27.05.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:17:45 -0700 (PDT)
Message-ID: <3f2279ce-7d4c-4ea7-8d3d-ba98208e212f@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:17:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: sa8775p: add GDSP
 fastrpc-compute-cb nodes
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-3-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627103319.2883613-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5UrC1oI_j0TxGAAlkX83RG3oZnpQloyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMSBTYWx0ZWRfX6Wq4jmvJGfMS
 uNRSHslmHVja90dY7kAOSvEgjHJ1s9jT3mgHwpwdthkhGdeL9ELPY1G2LsQViZrxHvRwoUYPgf9
 nz3gZ1wDBBGXl6wcDNOSyYhAGRu6F5x1KvpCOF2VDNJhUUgtlKnXdOUlKKiaBgrc5gd2+UAc14d
 XCSG3DMjC8nYfXr09voCRPTkAOTovg4JmvNkoWUGvmeKU30NC0Dqwme5cizx55IyGRqM8L55CPd
 8IZ2xirN7E+hv6G0G0gZeggQ1YtSNKJQpZF5WMZrkJivH3Z5THAtZNuDofbpmZ2ANPGMBt8/h5O
 rAWqgsu3QMYBf+cvAQfjmBZxVf9Atk7o1sMySobmXJLCltZMpVirc/ZXCGqog8y2Y6pZYGiCmKI
 nX2tG+Y9tBpLpNc20nVM6G9NIUKEhfGUiYuZ1eGdRGQs4PzpZaIsHiqWPd5PYnWvpqyDWR4a
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685e8beb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=iYJyFzv8ufejENf4NzsA:9 a=QEXdDO2ut3YA:10 a=pMdvUiCErLUA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5UrC1oI_j0TxGAAlkX83RG3oZnpQloyX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=784 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270101

On 6/27/25 12:33 PM, Ling Xu wrote:
> Add GDSP0 and GDSP1 fastrpc compute-cb nodes for sa8775p SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

