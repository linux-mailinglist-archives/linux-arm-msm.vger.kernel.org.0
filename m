Return-Path: <linux-arm-msm+bounces-61238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E885AAD8F32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 698EF17FC4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5647D1A3155;
	Fri, 13 Jun 2025 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phlfbA9i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B988019DF8B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823776; cv=none; b=URQvKvC24fsLUVR16ivj/TWO8nCzKLaAhDGhFrJoDauEdgJlazNdFfHnrXlFU1tf6S1XPgs5t22F+nWLtyS6bcVaZPMVDWSmVlibnJvTNqK0Mf1vNoFIDP0S9B8lASPjcW9KCp3EMZvqcGB3RRqag9BUYnIhwpfiq9IIS8qJTbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823776; c=relaxed/simple;
	bh=9ybk7RoIxVOTSKEF8RhhpxFfV6/NthPvrJR3mww0pOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgCABLSbxrNf2bzmXUw2lTdNbBo5nqcLZMDcYy70XteYs1JUUfTuDNZP1jTC2JcymfMXAY6XSqbe9HmWHczqZi18W6+xGTL2L3RKdO+rBc1sBvC/OGBu59Kvyg+q6CHVx5004f3jcb73P2lCJnN27l/2VSDLBdDgRiwsG0R+AYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phlfbA9i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9K5Ds015796
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dBbKcLZy+Jxr/umSkxl0m8Tk
	8e+YIMdKicRZEcvJZzA=; b=phlfbA9iTDvq1WogUJYlWJS8EhtGPIDz2A6VewGW
	3Yq3W1pyrbl/1giXjxXG7Ovg7eSya2uVhq5cxbPlwugPyawQDkwhDKBr22IuENs6
	Z6iibqYWe1PPDgRfrafXyBQJUycsLZULTX434MtUAGY5nV2PqnVMW8gZyU1slf7B
	8JiiF07QDEgl5O4BNLEFVfAJXgTG4/orRouz3R/O/ZI9YsfvEApvXBNYKrnZdkUc
	9iRPZgl2rPOthRhVW0yxNQVp8gAlozhOkT3CT25y/Kr+uL3Rv+vPJ6plkFoQ1M5k
	DMWLSWrrqwSAAV+SOIaeoy4CpI6gvQ0PWXq65ZzEAJtrDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 478h8krj91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:09:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097fd7b32so512929685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823773; x=1750428573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBbKcLZy+Jxr/umSkxl0m8Tk8e+YIMdKicRZEcvJZzA=;
        b=tt3K0Oc/CkPtCV9UoNbEIrFWyZcLccxuhvYpCFhB81cmkwcF7qSBNaClrNFfain6KD
         W4igUrNR4AOR9r2DWGtH+iJsxafqlvl/CDfYQJs1gemaSF1gBAPYtiaDt79DJE3xfh8b
         TyDkFE1MT3zDRIo91NA0U+vSfCoQr41TZa8Duw4O3sdRondGC8hB6o/iyJc9fACMxL9g
         xnHlUYNB7uEcwS8zow8BJxtJVK3ikXjAvWw/DDzPY2TAfvbUOMwABFawF+RvwqQTgZPz
         aqniWC9ZGpq11qwZQiTETzFGSVolQrvWA3dN93irWTbB12Ml5w3+vkqY+iCcQBwM1zyr
         4Mgw==
X-Forwarded-Encrypted: i=1; AJvYcCXPT73cg5ZvV1i8sYLy+QsBPT+I8DYhaDxo7II3lwyspndHMonUybClzHJgA283DgnAtyh5qFvbc83QfROy@vger.kernel.org
X-Gm-Message-State: AOJu0YwR9B9gvLHg0mBxbvrsatBj8Re1C5kV66Z/87nqaUuxD9P7iT5D
	WQxakD6pj5ZPvVClVtIcpjOxJLCmVw5NbsWvV2+8gVIOdCIBU6mc7T12x4UNbofDpa2jtG9BrdT
	WlWfbQk0XJ+8Evvcy4WIfJGZiLj+6Z4a9wOSwifVHWktp+xGHuA47bFgwqlA4awN0YZ9L
X-Gm-Gg: ASbGnctX5PQXedPDKDGWmdYx4y02YppJtwMFhi8jAWlPNwyJIeCvEO+BWcRBl/OiL4S
	8h9jUZfsYKAP2YiSrGQxR6yXmXbx33QSr2pRHiR9Qbz2Yjv4Fyl0eKCS8XGtKse0wCK3KKjqG7/
	CsHgFpvN+4cDeoR+ntt1rtQHrZrF7uurzSVxBN9rksEsStH/HcYb1BH9lMBxXRmrzp78L2dLtwj
	JSKLloRzci34eJWiA2yVFxu8ZCl+4zz5RE0eFxhDrn9NFAy1tEb6DxKsk2insjncIEQCumPx1ZB
	vXflFDG/XanaplFNezcVYCs+O72ycbNcJEE1IyFBY369Uw3upU3qxkYJyrLQQZ+WJ4j1Nxwqc2g
	NeiNNKJRA0SlCuzZGP/T0BJgLjIN0ZF7psSw=
X-Received: by 2002:a05:620a:2989:b0:7d3:9201:850c with SMTP id af79cd13be357-7d3bc3ace08mr455412085a.14.1749823772894;
        Fri, 13 Jun 2025 07:09:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl8SN7pbaLAjQfx5kpcmJcfOmKWAhZsdbfkETLGHu4trAzY1dXsnxEVeHBZOpN1dpoy0tfGQ==
X-Received: by 2002:a05:620a:2989:b0:7d3:9201:850c with SMTP id af79cd13be357-7d3bc3ace08mr455406685a.14.1749823772367;
        Fri, 13 Jun 2025 07:09:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac134f46sm459281e87.57.2025.06.13.07.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:09:31 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:09:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sa8775p-pas: Correct
 the interrupt number
Message-ID: <bjys3ptti725husvinnny6k5qtblqpcnsnignt5t62psuhgkz4@rlabonf2wwe2>
References: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
 <20250612-correct_interrupt_for_remoteproc-v1-1-490ee6d92a1b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-correct_interrupt_for_remoteproc-v1-1-490ee6d92a1b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jdn1xflGcvydQQHxtPLB3xSmiSszaR4E
X-Proofpoint-GUID: jdn1xflGcvydQQHxtPLB3xSmiSszaR4E
X-Authority-Analysis: v=2.4 cv=Pp2TbxM3 c=1 sm=1 tr=0 ts=684c311d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zHrrO1oeWpa5Vr4l-gIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNCBTYWx0ZWRfX/Lkvd5COnFzz
 QollShB+Dal2b6gYhfPpLFgsB6LNX+L+LI3DM915PfTU7F6nxMuKGMLorlomDWXJMVRiZFk32xp
 ST1jbawvB7bWmDTlhRzqcc7ateVS6arkrXUkGyaTOF45x951CcN1Vh+itkO3IG5zZ/fifvWssnF
 GCQ57SAEhYhrqJFNKgePD9ukAVhN1PItaqz6gF5u6Vl4o+OJoas8FqJ35ALBYKY4GwH5/GTm3FX
 GBlMVo6a8DjtQSUKa/N3/r01T1sPpayBXyDIj9JDjVEL+vIq0X53ey7lhn4Ygktj5uBESAlq/qH
 rZgKG6kRtLO1toRRAe+yxhOWsHLTk2Qwf0xXko68tbUEB1PsoHstz3Dyju06KhjXab4ub7DK8jb
 1g7JduxoSIIjkexoWp7N+1xt0WauzU4fKDBmbisx+NvbL6vsU5mnPtna8ANR1lYW/UaCBX7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=731 mlxscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130104

On Thu, Jun 12, 2025 at 10:39:32AM +0800, Lijuan Gao wrote:
> Correct the interrupt number of ready and handover in the DTS example.
> 
> Fixes: af5da7b0944c ("dt-bindings: remoteproc: qcom,sa8775p-pas: Document the SA8775p ADSP, CDSP and GPDSP")
> Signed-off-by: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

