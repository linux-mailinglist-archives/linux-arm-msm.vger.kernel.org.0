Return-Path: <linux-arm-msm+bounces-42952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA529F8F43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8848166BEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16781B6D08;
	Fri, 20 Dec 2024 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sb5yAL0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829141A83EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687989; cv=none; b=YP3Ly0MRNU5IGpw8ghsUmiu0zr1ckRbZb4eZzzwfdCsf/kmikiItD32DSLPrb8E9DqVhqFJ5wmvhcIfVdcq6UP9TcHrG8OtzQOO7YpaBUBQkai+sBxxLJFIX9JX2r6CmL8jq1OKM2Ty/i2tGcxkOU5HJ5sdp3qOzvldw465NwO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687989; c=relaxed/simple;
	bh=mBNfBE7oeLsgdg4CtNXU6wSkywoB8HLK8sQBF7se2oM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qx+fYE0qFmt25663aQuz6p0SdfMJDhVeHpUDPh9RnPiBUL9y+L1Nw1g19q9a9v5tbCGPIegPZpWVSySWknSrJJzR+nGUmTC3/oy2kf5smHUV+qV/HZTV3FhzosCjLAgdHvX8W25XFeXI8ixeqFT00IKJlRlJ68/pmoSbTcwiWUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sb5yAL0O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK9AUT2024386
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/keBtx+lziY+J4n4NX0Uz08s2W2+4V/g5gGeBJI5lpU=; b=Sb5yAL0OYPsAeaZb
	V5AqpokDUyYeK7E4CQfBU9OujTFFmyp3TTaUOSj3APr5Z9iTnookzz2yps4bQfV9
	Lk+3jnpwpr2b69mQJUedKXuYzNGOHFih086MkYZJ0HHgkiTrsR3rBvaAqfHrPRtY
	2j/HEEgSVVB8OQ6ouSOqflxjM20eaDUJi2tv/yuryO42O7W812rlQn6QHvRCGlrn
	LZTFLbDX+qkSOAoEFc+887azX7c6rI0aeHrCyEwLmASIEvmpuy3YL1Z4IOuOWVyE
	7yke9XxiAdkZ5TqThqFyLVb5XqMbJMStfmp2/dWUcjkiZ5o1Ei++qJolBz11Ewbt
	XTsnog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mt1wss1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:46:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d880eea0a1so5081136d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:46:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687986; x=1735292786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/keBtx+lziY+J4n4NX0Uz08s2W2+4V/g5gGeBJI5lpU=;
        b=TVGOCmESnWGnyRaMKdr7741tQsMejKn74IvDw4PFmLc1tE5ncD0WPFPxHE2D/dqu3A
         6K19WAoDNV7MWSvMLU3L0KITL0uYV0xz710/j6gkXBn2u1s6qW6y5UYVS3TKaojS99h3
         hFJ914xNAu0VJzfI6oCgugFAqK+pMDsPpLBlsH1mDrqj1rsPNmZ0mfohVCSLIq1MF78V
         VPl+ydxICgo3EZmqmlcdQxY+Rvq6EJXtl0Qooc661VsgejWU9CbaHVT40RFFl7sQEl8F
         AnJZ3VXeoXfACv3uGgvPgB059PDB106SZBmqmCDH+vo/WfBJ+jfPeSC5nHk+4g7jy4VM
         LyKA==
X-Forwarded-Encrypted: i=1; AJvYcCUxnCcFYK2pq0V79Y1XCFnKnlry59MRl46L49wrftARs/VM/qf/bwwNfnyQtgiS+9gnPSBOSBnd5RROzsV8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy/9BSeQH6ySSwDTTzMrpbu00EsBdVjx8z2BPozC/59TVg/sED
	G++Sil+XAa4EouRNrUbdpPGrvu3iPnwyzXaISWwytllqvKRkWvQqwzUS3i913zo4XVjS0/Q4iKj
	5M7j2Ib5YGVp1pfDBpQ0cfFmVxQsPD4arhsA2Osdc05uwIai88KOyipoWOnDZNkMz
X-Gm-Gg: ASbGnctal3dOThzDbCZABjwX0ZHjQY3pJ5agyFgsP9jH+y1dxM1rVymieRqF5yifsJH
	ZRDiMKbeK7QE3PbQJWQGRyiJghIOLKoxaFT7uUrWkQI93fdox38u6nWffPoIlg8CmMlNXpQmGwX
	DG400l1KymDNhB7t/qopuwZ+jrb6xjA4M7z+VbC+u6QV8FSHj/xOMGZkjy5ZSaZ3JnOYJ3STfa5
	fbSWD9XdZtEQ+BBrb8d1mFRYMU/amBGf9yv/RH9132geHS4f39xB1FoXP+lrOA9lC7QKgJtbv9s
	bKuM9t75mnNTcx3DaWs05DHNz6YDubqocx8=
X-Received: by 2002:ac8:7c56:0:b0:467:6379:8d2f with SMTP id d75a77b69052e-46a4a9a3aa9mr14334491cf.15.1734687986127;
        Fri, 20 Dec 2024 01:46:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrWm/DRMIqTiN7nrqZdEWZUIfJVqGG7OhaCG2Jr00FGVKrkXP3kiVCmMy6B+itTJQHB9rOlQ==
X-Received: by 2002:ac8:7c56:0:b0:467:6379:8d2f with SMTP id d75a77b69052e-46a4a9a3aa9mr14334211cf.15.1734687985753;
        Fri, 20 Dec 2024 01:46:25 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8954bfsm160794066b.60.2024.12.20.01.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:46:25 -0800 (PST)
Message-ID: <041c19bc-980b-4fe6-9627-73358fcd9851@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:46:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq5332: update TRNG compatible
To: Md Sadre Alam <quic_mdalam@quicinc.com>, herbert@gondor.apana.org.au,
        davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_mmanikan@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
 <20241220070036.3434658-5-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220070036.3434658-5-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m7aY0JBnmMSRQMA1seZEnUl-W8raxV5F
X-Proofpoint-ORIG-GUID: m7aY0JBnmMSRQMA1seZEnUl-W8raxV5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=697 priorityscore=1501 mlxscore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200080

On 20.12.2024 8:00 AM, Md Sadre Alam wrote:
> RNG hardware versions greater than 3.0 are Truly Random Number
> Generators (TRNG). In IPQ5332, the RNGblock is a TRNG.
> 
> This patch corrects the compatible property which correctly describes
> the hardware without making any functional changes
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

