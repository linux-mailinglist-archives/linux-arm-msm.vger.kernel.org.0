Return-Path: <linux-arm-msm+bounces-77117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D871BBD846B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CA23424C0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34972D2497;
	Tue, 14 Oct 2025 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zo5RysR2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A01322068F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431819; cv=none; b=d4uck8PQw2akHnmzeOCBCQ8PGQmHhD3vmTvKjNKh/6AXIZLpcWS8O0qGAc0dcKGCPBlb8F3lJq5rjqwympZuL9uPnnM3Q3iLTNBobRv/U/Dgi58htUpXcV3WpdLKHxPK4Gypcn2PFekupoZsiNzbvE5JTdP8JUz9F9j2iWvCEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431819; c=relaxed/simple;
	bh=Ev8yq2QjwLEFLAMs+VMUIoDBcm44QvbV0Ol5FrupKII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSeQBAggXdn2b7VN340AAjVCxBTZX/OPEuUxv9G5JL+t3ETnvurxcV6Emrw2N+LWmK3KG/7iLP4oux4L9fc+r8LHAICfW+LannY8eAq5BT+cSbT/Uw1SXhcsIaae4hSbOELAXSCF7Rtbipp1DaXom1gQ6RcKzuMtr2jcxD6YmaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zo5RysR2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87JDa017811
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9f+nU3HFmyw3t1LjMr87pwsziNsqNNp4ZBv/CxMUqQ=; b=Zo5RysR2nSJ1P/l9
	Gv4rXznAsDaXcX20UGMwXmzOTYRwOHAUfdoWz3N8frLH2mt7IAOFnzDkxh6XIeqm
	yoq/eBKKmMwhq63IOUPGZIS4Tsj6WdX15Q+p4sAJfdMGbW67i39F0LWY1+hcEXzD
	aXiRH9H3/Qe89sWS4f0orvxqRob87W8ZKGRCcgl8FTNzNhM+0LTaPOZiIkYPpmrg
	PyBDYZ/n/VBw3ZUL5M2s/RzfPFL0SqmJ5Agjm8VWBR24S5sbO/WDAnMu4Me09D0K
	IfinSpluojMyeC9hgCeELv8VO4TAhKhtCupAA4KdQLaFrFhbutWvSx99M7f+hGhm
	Y3BR6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1ac4k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:50:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8649a8dbff8so224680285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 01:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760431815; x=1761036615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9f+nU3HFmyw3t1LjMr87pwsziNsqNNp4ZBv/CxMUqQ=;
        b=jfJDNjuKGfokTvGdYFylx6BnD2dhLIm5Aiozx9dI/6W6p7zQkhna1Gzgx/IPfYnfby
         wZ0HBIET8Sy4Sr4NNuD5NOuMiNO7oFOworrNUVDEftSg5Y7pFIgsqaImYmzgOar+Noe0
         fSLQTnIFEPzXWiexkdeu6uu3ZdjRXY3xcVAk6K4Jy7+oPn0+QOO6Lx557OQWlyjaGv2/
         QfbG1SF8G/lgKAJk7oy1ZJyP09fPgXQolEV1xXIkL7yUVUYwlLfbcp0kfrZGxz4ecKj4
         C+VGguNHM99DKNKUxXCDlGb8FGDDM3JhWOqSM3BaLi0FkQ8T7qNzPRHd/fzCU8o5padV
         MTIg==
X-Forwarded-Encrypted: i=1; AJvYcCWWP9Zcl4ZEBztomdUVNpHnlR7Xp+/1dhgfVV13Mfs9qhf/Qhntszh/Vr7hxtsU8rTOB/kGvm43f2EW8RBD@vger.kernel.org
X-Gm-Message-State: AOJu0YyW+fH3kUERe0eSED7hQWX6gGZ1HQKwVul+DyYZ64+pfir9Ek/0
	deapVXsUocynMMbAdwK7hbP4BeISore3d+2uaAAP06hbCjTsE/kgE7U/1Cm1OmBrbJlVnTCpKsM
	ayyTtcjEH+68s/Q6mTEDI/+ljVtShxvwLQIzqav0HCRb7Vw/6a8AreW/R+MsuzNegS4z7
X-Gm-Gg: ASbGncvb4h3Ym3HRvWBxuMzpJzw9EbjQrEKvrZZOW9i7XNMMMAtmev6Po7zJSl+m6Q3
	2KUPKmUGA7i85GaYb9EzE6Ja7yG9zlBQ1LFFkrJcmGA4wX/QpN0H9FxizKHNfPfJwaNtIbUNan3
	oc7lNIzvZ+T+dQRgUxoDKs76Z3mqUSopYF47neSsGA7Pu0DR07VvftTEXH/9qEcLqQx6iicLCio
	1MRHTWoCCfsHNt9w0MApF+fNbebETeRjcxPhuW0ox9O0oY0gAaKODAr2u/MAigHP3/S/CyiS1y9
	j7TZHc2HhowoZp3t5JeqdwACID8/MLCK5lQLSjQYFLBowTpKC2eNf9Vlq2fEkGKjm9dT7iIEYbp
	oEsSif6QNl4gOb+a45fUAEg==
X-Received: by 2002:a05:620a:44d3:b0:85f:89:e114 with SMTP id af79cd13be357-883527c9c39mr2343740285a.1.1760431815042;
        Tue, 14 Oct 2025 01:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGncIKVFHxsfaJ6UTmQUqWxi7M6jn0t0eJxUvQoUPR5cx0i1d2AEnVAwqZq7xbGoqN/fnaSzQ==
X-Received: by 2002:a05:620a:44d3:b0:85f:89:e114 with SMTP id af79cd13be357-883527c9c39mr2343737385a.1.1760431814478;
        Tue, 14 Oct 2025 01:50:14 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12a08sm1122876166b.52.2025.10.14.01.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:50:13 -0700 (PDT)
Message-ID: <096f3063-ba79-4676-864c-d9d9312a7634@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:50:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: apq8096-db820c: Specify zap shader
 location
To: Valentine Burley <valentine.burley@collabora.com>,
        linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20251014084808.112097-1-valentine.burley@collabora.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014084808.112097-1-valentine.burley@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ee0ec8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=vzHCU5_V8cFStwcBz_4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: OKaKiwRIXefLhgYEOae7Yt0mhNwnzezV
X-Proofpoint-ORIG-GUID: OKaKiwRIXefLhgYEOae7Yt0mhNwnzezV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX4iuH4PZ5blo5
 ms0M2Hfqc1Uc1I2aQbDifJg0tnxN22O4m5o4ZW++1HAty/T1COddEBT2zgIFWACcd5vo9d6nvSZ
 zWp79ILBkNBRTD7YvvWs/4UtrML9aXXOVejdAZVFVI0a8I1Xfplh/QCbEibRHhyW0Ah5mZz11kD
 E7oYemzybZlXcBZQ+ltRJBtorLkFTyNm1FSjqNwLSbFFT1gKGAWHrhjCht7h5n7CbOknfbRs75s
 4PoogRQ+MnitaQ0jF97+tht7tMhZOSa2XwiCX+x70WJnDlwKrX9fpKfPUmcX6RHm/Y5BWCH1Mvy
 zXp3Y6xoi+9lehMnGHNccsg4g2BfInmJoCceDm/Rts8Cg2XQBjSUMryCwMWsAITI1g8RLOozWG8
 RzO8O9MRdV5uIIzQz6Sc0ibgyUWE7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On 10/14/25 10:48 AM, Valentine Burley wrote:
> The zap shader was previously loaded from "qcom/a530_zap.mdt", which is a
> symlink to "qcom/apq8096/a530_zap.mbn". Update the DTS to reference the
> actual firmware file in linux-firmware directly.
> 
> This avoids relying on the symlink and ensures a more robust firmware load
> path.
> 
> Signed-off-by: Valentine Burley <valentine.burley@collabora.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

