Return-Path: <linux-arm-msm+bounces-22109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97873900EFF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 02:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3447B1F21FEE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 00:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB78717F5;
	Sat,  8 Jun 2024 00:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eKLKvHeu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5284563CF;
	Sat,  8 Jun 2024 00:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717807599; cv=none; b=CjXGWbEYyK5Ar+9bbLAZzn//6TqWndgK46Ebuza+dbG3pHpbLldxya0qGnba/viRA7Glp7GbZX4YrwkVVIfJMqBF7jKgm9ZuZ0xNuIqmH5xWAQzOQRy7inJVJx+Oub0dWvuDTu00+kz13bN/hFaHNc0obOfJLefojsFpN76qpPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717807599; c=relaxed/simple;
	bh=Qy4HZTKZjW/5esVi/ngfnvw6RkfErWE8FRdnG0OedSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FH0aeqvzcDA6E3VD++GM6ygsoLVwC8Pj5ejw98zDpWquG8llSO+mzMdhntH4TpcTuJz+NFqtCGpUVjDOTOIFOqU2MYfiwBINQMQlCohWNiiUlfrgNXlB9PhCecCzri1K1yGg4zhURsFSroW6kRTTr7OLkiSeL7Cok6vR30WYZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eKLKvHeu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457L8oPG025762;
	Sat, 8 Jun 2024 00:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chSzIRgENd/J1rGKgmWI1PC4ROoFSMddsKn62eWgNaw=; b=eKLKvHeuntk1IJUK
	QLC6KQj4Y/kfM184LDXxPGDi0+aA2qqK63QhhrQrHEBu3qQ/esr8FWum23+hMq8B
	Fw9hqtJ36h2DrgUbF+yKAv0sKb3BuFUIGOwWcs/HKQcHid+P8hOHORm/sZXq7WBM
	tzDGfyhNvTLcbrQEVhbPiDTdUkiUNqpsZjy/HK1KLYr3IKrGkbgah7EvjyG1BNdp
	lqsk6/GYVSSri5WrxZ7JUO0PnKFk88AdTjQgU55oqesPmfBAW3o3zAyHVoKWfPVF
	Dnaxuf8aNi3ktN0ug8iPvFLtYnLfY0hAOh3mVNQvVKcII7nzT/ivymtDzSndIQBi
	DJ5Ypw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ym49w1614-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 00:46:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4580kU7g027448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 8 Jun 2024 00:46:30 GMT
Received: from [10.110.22.192] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 17:46:29 -0700
Message-ID: <933f7759-3561-4ad3-8d4e-a05e5fb0ddf3@quicinc.com>
Date: Fri, 7 Jun 2024 17:46:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] remoteproc: qcom: enable in-kernel PD mapper
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sibi Sankar
	<quic_sibis@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        "Alexey
 Minnekhanov" <alexeymin@postmarketos.org>
References: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
 <20240512-qcom-pd-mapper-v8-5-5ecbb276fcc0@linaro.org>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240512-qcom-pd-mapper-v8-5-5ecbb276fcc0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b9iPqyYF3nWn2F3acMDqbuIfSVlp9gMd
X-Proofpoint-GUID: b9iPqyYF3nWn2F3acMDqbuIfSVlp9gMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_16,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=710 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406080003



On 5/11/2024 2:56 PM, Dmitry Baryshkov wrote:
> Request in-kernel protection domain mapper to be started before starting
> Qualcomm DSP and release it once DSP is stopped. Once all DSPs are
> stopped, the PD mapper will be stopped too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/remoteproc/qcom_common.c    | 87 +++++++++++++++++++++++++++++++++++++
>   drivers/remoteproc/qcom_common.h    | 10 +++++
>   drivers/remoteproc/qcom_q6v5_adsp.c |  3 ++
>   drivers/remoteproc/qcom_q6v5_mss.c  |  3 ++
>   drivers/remoteproc/qcom_q6v5_pas.c  |  3 ++
>   drivers/remoteproc/qcom_q6v5_wcss.c |  3 ++
>   6 files changed, 109 insertions(+)
> 

Thanks for looking into whether this could be implemented as a 
remoteproc subdevice.

Reviewed-by: Chris Lew <quic_clew@quicinc.com>

