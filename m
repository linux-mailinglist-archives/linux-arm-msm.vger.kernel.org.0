Return-Path: <linux-arm-msm+bounces-77957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160DBEFC20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 09:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 364D03A7389
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 07:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503E82E22A7;
	Mon, 20 Oct 2025 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1ZNNLQ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FE92E2DFB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760947041; cv=none; b=eJkrKe/huRSl08MAi/gx8k842RgvjSp8yBWKXCDk6h7tR3ZldHu/rRIuHE4CakncVCN5tpilos+jGU8SC7Dbqk+DjvohP4VzbkbBYUSwvNaZOxIKNwGtHGVFRkAlIf+/rwVh8l9so5lr2XuMB8cXNhBQpBs44jL/TQMhF/NGZ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760947041; c=relaxed/simple;
	bh=gJnVeTLhVTmho589boVCAJSxWIEgmPLZUR5r3i0UnO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VAqGUnnUMwz39B0r9EPTyfe//U8c0oABtD9loSnzhqVoxGYcA8f4K6JSBN9EJ3YGtP0ipRTrw9I5g13DWs1c/LReyg3p06MsfztKwgJvLcOaFHMYAUccId853mXHyc6vh8gba+T2jyp6OYiTpaZzQNYvEWVGaiYXjG3zrwA5yfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1ZNNLQ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JL0ROl019259
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ic5bNXxreVSIVO1Go5QvhyrCQOLU1BzWAxz5v8DrSQ=; b=K1ZNNLQ6LVjaczUZ
	hs26L1lDBuSAPCx4tS9XllytcsdrALVP+Rhehfantj4NkrUOBxN7D5LFY4xAD4vB
	fzXJBiKbhBt9fgpx4HcTgBhC4mVZCEhzjJ4ClCmO32M4RoBkfJjIQcuPQIEzn+/M
	z31PlbMDLbhe3qeRnxFYhMrz6Rtp3C3AxBMGPqGLb5xY45g6ZzVsbN0bHYMj1Ggd
	eAiY7tye26dhNSGIBS52flSj0YJBnabov0R5Mfq130uw8rM6gqh/SblhAzS5VyFz
	AGBp7q8va2IeLp1+hO69MQtMQU271el/UIye/ZKdvPhRYp5kfzp0oGEocYfHgIXq
	U4Y0tw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pc9h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:57:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-886eaf88e01so184272785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 00:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760947038; x=1761551838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ic5bNXxreVSIVO1Go5QvhyrCQOLU1BzWAxz5v8DrSQ=;
        b=M2PGamBZnKRfLcLGdYDjbL9rIx6ln4cGCFcBqhfrZKgiYFBgxOWt3ItyMQEXhSAlT8
         xtVBcD6S20993GE5/5tGPGEgJuYt1+yJnP+xPUnGSdoPSuI6JLqSvp8zfZC2bnsyRVB4
         KNuApM3tFIXqxgKrUsiyVRUoCEd5tmzB+NRyhr+sJ+/lwYUueQmm6ab7XertfPozJtwO
         wF3J55f1JfFQWeBmIyMAQuXX0k3d+xdurybLWd/sIiWmViMVQZbpYZMInoDTqs6ANrsv
         RXWux+UNykDaPJUO4jyg5jO9BGR521W9Ox7whhYJgRHrRWQy9Rntxany2/rbFHhe08VL
         kYjg==
X-Gm-Message-State: AOJu0Yzdol4bzf+85507AsR1CEvz9LWzHM9RdJ8uloHBZ3CVRT+qL28+
	17xtpg4qVNpVghg/j6KnnTqajotVnKFYFQ5ieg1dbJUYoDt194UD+t4mZnKClB8MzyoncS1P4Ih
	A1+PVplREtBYj5UxxP266rPx+DV6x9fSUUPMrUFCl/dulb2JXFpQyNoihITQC7d3eMT0i
X-Gm-Gg: ASbGnctgQx5hrXGbKXpw1DfmtYMLjoXcWcHWfylwbP0XK8qSHbQ2UJOJRWOF12V9r1b
	b1CBLHK6anrj5LRz5rJbpiVi27zAHaLp9U2Ssh2jHwj5nDCWq0/f1RJGUp1UwVXWQ0voyR3hskF
	9bbjQQhBLh5bRjQ6qoZUzBMd4OXY1U0QT2v6uqabR5Q29whbyN69XVKkrs9PGkarjNcqxaqBUi7
	8NMihdwmP/4MebqLnp9Vel0E6o7embt2wRAPXCpkHtmXuzKc/5dM9yviTJCBRduRqVu6giV7Eta
	jsDLB/+1XxDpwhYdMTRYnfsYrsesWMRuQWDD5r/FnKCC9N1cSLGMkyF5pdJ7uGrU+5CXh0fXJJR
	TVlkco456Z6fWvenKcdWG2j4NA2Sz/FqYRE2l/wFinhVcbcJmAG0yZCS7
X-Received: by 2002:ac8:7f45:0:b0:4e8:9af1:366c with SMTP id d75a77b69052e-4e89d362902mr105943381cf.9.1760947037884;
        Mon, 20 Oct 2025 00:57:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBnWJcnNlKu9/v8lp9BtHCdJ5pN1JcnYbdJjV94hLdxAt6+Sr2jW+D0brGc3dRHU+JONj8xg==
X-Received: by 2002:ac8:7f45:0:b0:4e8:9af1:366c with SMTP id d75a77b69052e-4e89d362902mr105943331cf.9.1760947037470;
        Mon, 20 Oct 2025 00:57:17 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4949998csm5964950a12.38.2025.10.20.00.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 00:57:16 -0700 (PDT)
Message-ID: <e3547ed7-9fc6-4521-a9c8-6318dcd76324@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 09:57:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-6-0baa44f80905@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-6-0baa44f80905@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX6xfTx3Pne0cx
 2GNphfKDUQ7BWfn0RD+Nykdk2eLxVQIwA/XS04A7EpnLOzGCrr2awecY0vPfPBS9zO6YDiUOUTW
 t9qSHWGveFI2XzMzOrNTriTHgAnTUxuclvTRwbfokk4ccgLu/e9Z/rWBN85i2+8pocL9duwKYyu
 0rX76YGHGGPDKcF0lchZdS7kqlW7S+q/QoRsS77l23tuinKBf6b66YzvdoinB+uucgD6Wt+/GPr
 KenYMzX1iFLRQAAQReYvuCxc+I6rWV4E7XvT4ZpNx6fvGK4pgZEgWyFDh39yArYbvNv4BiwVtfQ
 YImIU+TvkF+feANGYoEZmWOkPUSYNaIfQz2w6lIdjKRt6XEtbh2IcQX91yOz0+zPl2qGCJzl+UX
 +byzj6L8g0NySyfZcmhSQugmex8/qg==
X-Proofpoint-GUID: FM2iaoij5eIR7RD_umb5E5PmiDV2BpsV
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f5eb5e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iJWliPolnP7GhHh1kxwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FM2iaoij5eIR7RD_umb5E5PmiDV2BpsV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On 10/17/25 7:08 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

