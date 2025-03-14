Return-Path: <linux-arm-msm+bounces-51511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8AAA61FBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 23:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 761873BC4FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 22:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD6218E756;
	Fri, 14 Mar 2025 22:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mMrfETTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCE712B63
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741989811; cv=none; b=L3Gpbyri/VvQkCmrEHFPMxP13hypvbXgeGN4Ao3Kv3cvJEvEVwQDIsr5PrKGO3xmoN2mM/pFOdNrsGo2Ajc7EQBz1Ym6KGo8N7LkaKrYnmgYMVCRtn2Jtt+RyPY7Z2C5mhHfIdv+QTASfQnAwVr0d58jBUZy/KcOrywvhXXj0n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741989811; c=relaxed/simple;
	bh=YPYAgaNXP2IIPLWgofpyQneMOCtNp97g1EQ3HHk81m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrDmaV9XIJ8NqxKFHc3+8SlPVSXPfcSeLjLJW0R2ssddvdyJ9R1ugqdglm6FKK/q473pm/lLgGPL+ZUQ4ZdXyO8GzSApc5JNQt2crdx37xaauYi6l+hIkhEUW9ILphCsY32Sf6W1yNDoJg1HzBlUO7BYqi3Tagzqrnd0/Uod0mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mMrfETTR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ELqL8l028043
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dnm2t5CfeS/52MGOLwOHFsVRcUbMcJKyNFgAPRvdxfA=; b=mMrfETTRYc1MtFbr
	cegihmZQto1dlyr23SbC7wUzzyfgoNOJ0Gs8mQhzGWxWCGXeJla7XfXJ/j5VmjAq
	JMaLBwc7iJeHklYpZHFVZKe76u93ZgMr2/YzGE9gR7JoueYH3XS67FjUhYk7QRBx
	yaTN9mHUV766P/2LuAfFM/KUJp7xUyjH8hHHEGKHfLuXvaF13xsjTkh6KvJdjX2F
	5otqNdogdoLixYBmeKfxC4pdVQD3vqALdzmWaLfY1O/9sMh5JeKIafDQ0B+qVG3E
	VXiDZKSgkVShwTsj25dNcnd62oHLbZZuR8YkcHPbkXRsKLnnA2ZByySVEKyGqU/E
	53ltcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2q2n0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:03:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso33414385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 15:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741989802; x=1742594602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dnm2t5CfeS/52MGOLwOHFsVRcUbMcJKyNFgAPRvdxfA=;
        b=Vy7wxYPHErNP31lsgOF6D8azhhw1EGYKvxI2cuPl+DvsQ6294BVcMyaxxZh86yIr9N
         /T+4T7WX/OagdSwqIZ8B2JzL6aLHekvAY3TWI6k0r13tJmN2FsRvaVJrCm5a8vPGj+Xg
         WoHpyx34RPBZ0bLPC65ZQLRG5YFtxGVNI7sqkI20rPfWLveE12cBUhLt9wuZIaTaBB2c
         d+Wc4GDqfju6NaRzp6DN2FGpigVL8oACgDme9m3xu0O0HDGoD77yu6UlaTK8Cr53VQKH
         rIu61h3H511/v3HxLI3PaYWHN8UwckH53eMcuuKd5grWBFcVATIymAolCyZxuvAYmR/e
         XXrg==
X-Forwarded-Encrypted: i=1; AJvYcCV4W3SSNZjkB4R8Yvm/o6N45MAAPIpALVc5Lk6pVpKUXNazcVU3Pme4DNjQkrRbq4fYWx/koW4AIe2wZOwl@vger.kernel.org
X-Gm-Message-State: AOJu0YyBx4Zorvw0ve48rD/NYR9RPy/MoeRsY4OhSdD+qfdklUDhxLrV
	GwOL1FGChIEG8T8gVE/sV1cw3JTf+Tm9pBBmVl/rbh5j5d/EWTO++IekUBtOgkvsBLq4aWxRk3i
	2Gy6q8Arq4zoWR8IWf05T1mMJzgRbDWNoe0PsqMAZnz6w5u2uIQxu/8uuKnT0cCwt
X-Gm-Gg: ASbGncuDSCQnO7KeWGJST893Zlrm3Cu657BwKxelPubooesTjDbsw2ioS4TMaQnRZoM
	XgZHoYfts0C0Ij4KY9QdPXbfjHyJyPerI0XGjIPh2akziuuUDSkyrAscxYErbXdt6YeoPEppl8L
	tOscqZXPASHrp5uIJrCq5CDdUGAFgkpnW9mSQ6o9r6lbzwR/ghwTU0bp7ZRXPEC70Px14FbmjLH
	E8XeaNhYoc44BZ2s8KPgqxfl78HjVWSsmjAtulYoDlltfVd0/BPPtt8NZXgBJq6fMNXkNSr8iYM
	jJNbJmIC6hnXI6QyBekpjoUG6QIhB0LpojeWiJd04wnm+y2+mtvVUSOzCNYNPGSKcnbh+g==
X-Received: by 2002:a05:620a:31a4:b0:7c3:c814:591d with SMTP id af79cd13be357-7c57c795580mr190183085a.1.1741989802133;
        Fri, 14 Mar 2025 15:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGTEH8+2F/jBXZWadtElmUZ1siIaSDospZBCxTdVcPZR8v0O64Ck/1fxS27sV0REmM7K0WJA==
X-Received: by 2002:a05:620a:31a4:b0:7c3:c814:591d with SMTP id af79cd13be357-7c57c795580mr190181285a.1.1741989801750;
        Fri, 14 Mar 2025 15:03:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816afdfdbsm2397154a12.74.2025.03.14.15.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 15:03:21 -0700 (PDT)
Message-ID: <948b3f2d-3834-479b-b165-7191778dc5c3@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 23:03:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm6350: Fix wrong order of
 freq-table-hz for UFS
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-1-3600362cc52c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250314-sm6350-ufs-things-v1-1-3600362cc52c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P506hjAu c=1 sm=1 tr=0 ts=67d4a7b0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=08tnehPgh3LRQT3fcTIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: laGudVKM3MIsI6iBZFMG2p6xnQIGWIi8
X-Proofpoint-ORIG-GUID: laGudVKM3MIsI6iBZFMG2p6xnQIGWIi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_09,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140170

On 3/14/25 10:17 AM, Luca Weiss wrote:
> During upstreaming the order of clocks was adjusted to match the
> upstream sort order, but mistakently freq-table-hz wasn't re-ordered
> with the new order.
> 
> Fix that by moving the entry for the ICE clk to the last place.
> 
> Fixes: 5a814af5fc22 ("arm64: dts: qcom: sm6350: Add UFS nodes")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

