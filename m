Return-Path: <linux-arm-msm+bounces-42977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC569F91B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 12:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEA751895F56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 11:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2215A1C3029;
	Fri, 20 Dec 2024 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AiKjFUUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979631853;
	Fri, 20 Dec 2024 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695553; cv=none; b=gTBbD65HQvIJDMhNeKmMNwdLzUwNwgR1bq4hxZ7qspwGbmeTEfZJwtJWK5sbmqQJ1y0MyBQkLOrYXN3RJK7DWZ+xEXJcJcsvGrMNqLoESJc8jDtyfv7v7Nb1EaQVmzm95VL2vjtf4TINSsq/d95zRsGnPUY9qJweENMZCH5tBgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695553; c=relaxed/simple;
	bh=/G4AGvnq1wWWq9F/jQE9R0fzA6MhXpuSkNRl8GA4AP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HXq/ZdzDlBLLQBg7PfmkyJYvGKlxm4KPwfgec2ryaTXU+xxN53faA5jlIFNeG3WgMVF+Jx8PB62qdQquDWwoh1FN2Zuozybj3wktQUwT7jIElGopS9czjQKpDt1hUZT+jmXy2XIWv3WVwm5+3G0MRMgGaHUGTlCZ9Hqfjbu/hqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AiKjFUUG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7LqdI028658;
	Fri, 20 Dec 2024 11:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVfYQabebuq6Njt2Oq7HSoeCUvuGxMqCgHX7O5Eoxrc=; b=AiKjFUUGL/mMEBCb
	jQoxulm0hbOGMGWurxQKYYSKLq5EouD4YqCPkrwYjSE3Y6NjhLCD+pvsREDoMdPs
	ZwjUT5oYsZOBPlu6h3vhmC4FA+laKxSgWcn26xsFrmxeWBST4LBi5NoEZpaNJnFw
	Xp7BVcWII6aQFjcM2HRI2ev/kk1s1+DpYJHERqziemccTtB/INWymSuME5jg8JX1
	RLzlCViIqEgYm96p8wMa+77AQ6i08u5Lhcq5kc4EGDKW2MQyPcdCZDy5kyPhK/u4
	KO2VRg4LvPzSHGqrfd1iaek9SjiTVQLBmIih/4yi2DSsf5V+rhSnQHzvWG6nuh4b
	I2Pt1w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44hrq0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:52:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKBqRgR024631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:52:27 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 03:52:24 -0800
Message-ID: <d301a695-a5d8-4e76-862a-a6ea5c125617@quicinc.com>
Date: Fri, 20 Dec 2024 19:52:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 the EC
To: Maya Matuszczyk <maccraft123mc@gmail.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <20241219200821.8328-3-maccraft123mc@gmail.com>
Content-Language: en-US
From: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
In-Reply-To: <20241219200821.8328-3-maccraft123mc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OFIo3lUKH1CipchLDM4VRp0lvoDoS24r
X-Proofpoint-ORIG-GUID: OFIo3lUKH1CipchLDM4VRp0lvoDoS24r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 mlxlogscore=862 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200098

On 12/20/2024 4:08 AM, Maya Matuszczyk wrote:
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>

Is the commit message missing for this patch?
> ---
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
[...]


-- 
Thx and BRs,
Aiqun(Maria) Yu

