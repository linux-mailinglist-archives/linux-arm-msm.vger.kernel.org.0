Return-Path: <linux-arm-msm+bounces-59878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD60AC8C7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 12:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D09857B3EF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 10:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA77223DF5;
	Fri, 30 May 2025 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BL1kigCT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B02E22126C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602561; cv=none; b=SbtEkiowkPg1UUJDbUoKO2lmoOb8AChS5HNi9bqf0lP9kFiHwrrX4wFENY9k+yINfKKSzgIfGftW+s7MeCPSgCSpZ/HcHSGi04T+Jy/zkr1OJiPkZEi7N+EIj3kGQPs+VmK64FLPaMCzUg/cTFC/wEbFKSdu09KPomO2iZKyk7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602561; c=relaxed/simple;
	bh=whNY3yVCRWOs1BSgLRWZD1ZKuBKGEyxBXuEhTV4AVDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpUkXUGPDOMbjE4vOVL3/lDJdnJ+tIe4NseciSsak+eyQ9oKUpN6dMH2K0oD0W+l0uVY0U+TFOc/X4NKgiLaQ3PBRx8KcZ0IimF9R5BCvadKBrwQoz3MRi0oQz4B1/gAslJeCkbOFSxMRdrUlHTLC6dcThvx5PBFqz5NS6TQ03g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BL1kigCT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0qjS2031490
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1z1t2Z30GL9L8T6xsR59OpWGVjJYpG/IvxPuy7JAA8E=; b=BL1kigCT4uvS+RBL
	+PEnw942ziW+AAXU6nO5vrxC807BjyquQkycSlo9BE/5/e8tvA8h3d76lyUq8HUf
	NMyXRRL6rmkP5txdGQbazF2c1QWPFKnjif+d0Is41uCLSzcEWuagQG8+vZ59AERD
	Gk9W65rhTHqU+YOjVMp7VawEw6D/F8Sq3/rKYFre5Zx14GBxeLZex5xVD/PhU1oV
	+cohbpobIbSxtjanSUx2EKiBL/ZBSEBLcN1krFVACDJzKhMI/Qead2ORaS3pxRWL
	t/R7s2YV4h5wUTjv43YnU52qi27VkdjUDUNPBLiglqtpqUkbvqreGUot+F9rcfNv
	IrXQiQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vk0sc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:55:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso39566685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 03:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748602558; x=1749207358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1z1t2Z30GL9L8T6xsR59OpWGVjJYpG/IvxPuy7JAA8E=;
        b=dBo5e48c/5QE0MlHpt8AR0YNTx3p0gv34Cqr9iFtGH0jlJz/RyXFHafvNEtqjVFeRO
         RSTkN7ojsdKOjDtI4Peh4Rpg9WSDJKLyk+PsIJRjLgjWjKvoOB9vsJ2hRpI2Gw0Lr65x
         81uOyxKcPi6u4sQZIsUDh+4RBJzVDZYNE8K1Ods8M99Eed9LSAYASxCUYykmkDtrHyCF
         qLTdmX+9yRS1EvklXJ3pnEg4D23b+LhTeHDr47z+kwsz++8KfqHOBWgsR0YjXiWyY3UV
         oC55bCBwwepMs6dYSg4Fkjj1Y+zrKCk3zHGby2sNmZkU6YjMY3Ds0gcZz+8c88CYFwVP
         I2wQ==
X-Gm-Message-State: AOJu0Yz/Wafs63BETpWegBKfcR2cv+OpS7UFvb9LC3xRpvGt/AYqX8yX
	g9fO8LSh+QLPEDFnKHpyJdjZcI2c6uW/H2yovJW3oxzh6tVU+pvTRM2weENLwO51H+Zk04Bu1cG
	w2+9ZTbSYlhrnJTxvSq27hBulyX2H/+WGo5EC3je+RibxAyiiVqwnsexpqmsFdMDSg8Qp
X-Gm-Gg: ASbGncscTYpoyq6a07+ganfKR/uErAlW16VI4iqupcL2M+ATy0xaCV1ugtnSbXhoEPX
	pqA/JeTfFGzhJwkvkurkhGtYt7cLAGh2b/c0VFPtLfByJE54eRnkV2NfpfWi8fM+K/YvENtFIWt
	AMAsnZmf4SLQnc/IeDgEDtillv0Sduf0gzpfOvNBZXz7d02wr2zpdrP7lhd+fDZYxFExQtYAMFZ
	Qr/lBS9SaP3sUUe5tnau2u64AOS8jYDfGu1vQSoJMxcYvF9+zeNryBRbOKqQ4y5RjjlKgBzZI2P
	M2Fqykxes+bA8yyMvfmSh5kj9vVLoEuvP5Qi/EyByNBJolhZBIw0HzxDS5jYvotYjQ==
X-Received: by 2002:a05:620a:1917:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d0a1fbbf12mr144603585a.4.1748602558451;
        Fri, 30 May 2025 03:55:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJbVbPBnzxBc1ipfoPAXrfEh5Qfo2HTeThK9slvahJ8kJvoNGDfCAapCiPVTOYKSDB2waJKA==
X-Received: by 2002:a05:620a:1917:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d0a1fbbf12mr144601985a.4.1748602558042;
        Fri, 30 May 2025 03:55:58 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6056716beeesm1435854a12.80.2025.05.30.03.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 03:55:57 -0700 (PDT)
Message-ID: <2503abb0-8ea4-4d9e-8569-3ee295dce37c@oss.qualcomm.com>
Date: Fri, 30 May 2025 12:55:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: Add support for qcs9075
 IQ-9075-EVK
To: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Rakesh Kota <quic_kotarake@quicinc.com>,
        Sayali Lokhande <quic_sayalil@quicinc.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-5-quic_wasimn@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530092850.631831-5-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68398ebf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zgs5Lv6q46mbt4vC44UA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GDIiauBFFc7HKk7f4RIcn-K9PcyBQ4cm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5NCBTYWx0ZWRfX4KVLwMD9katO
 OyzisfixRMryGCMcLFSuf6PafWKipbgwxbms5wdci1SmBJ0o0lpunnqZWt8ALwL6L4KajU8p9cw
 vJ3B+E03+b1AB0KnhvnU4TWTzkD0wsy6LFVMmsrV1mgTkc9qQSHZGN0Nq27Tvsk9mH1QzYxBqxR
 19hSn+/1DGNyrNbmGgTLTk5g1Wl1Hjw6ZpA+fuleRe+2sa9en0C/Ag7GEw6UHKGXh5ZelJn0Dic
 4afsglictF08ZawpYcXAq+dRXOQSZv59objQas/WMFJzEVx6dIUEsGeJfHx65IyLY6bWdhobn11
 +Y9PxDajvQ5JPqH9iRtUdDlTubZc87/EA7nEvb+mWRbM59c+I1CI3BBeHE51WJOJN+dz+62Zl0n
 AtMb0qLUnETd890kQj+uXHeLo3omcJTULlVwtHpFO53tLDVKPRdG16M4/5yT1SaSbxF0wcNF
X-Proofpoint-GUID: GDIiauBFFc7HKk7f4RIcn-K9PcyBQ4cm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=718 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300094

On 5/30/25 11:28 AM, Wasim Nazir wrote:
> Add initial device tree support for IQ-9075-EVK board,
> based on Qualcomm's QCS9075 SOC.
> 
> Implement basic features like uart/ufs to enable boot to shell.
> 
> Co-developed-by: Rakesh Kota <quic_kotarake@quicinc.com>
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> Co-developed-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

