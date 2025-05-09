Return-Path: <linux-arm-msm+bounces-57356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8CEAB0A93
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 08:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D04209C0423
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 06:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F097926A1DE;
	Fri,  9 May 2025 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Apz7bv8m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4D26A1D9;
	Fri,  9 May 2025 06:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746772191; cv=none; b=BlaDwykwuZjfdBrkuSiVrvHavk+xdRj3K2ygXHu6WDSPSYtUkQKcXR2p97t3siODcQvSCyBQ0RM5DwQM0OdLONVKItsU8WtbIKDaRYAr9z9+vHBhPlmQgzEecFeaFB2KpE9J6axLDz/yTaFlSU6oZU7oTi8BJ3X3NA8liEkt8v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746772191; c=relaxed/simple;
	bh=fcJkwYNRgVHXiiy2QMT7pZmzjXhKaNdQhrZ+agbkImE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IT7oVyPdqj50T5YK8OuFcy345yDLdBTx6QvZOIEAHYq53boXXKBZbawZVFzRw0vIeHBFDbLndZkwjZFNLJZ1rFNL7pFyCGqej6GYLOaRam9i2ksPMvrjP3l2zAGEoV2BtAyrO11QlrzBY27ZzRk4ZWq7ZDam0bGeaaf18H4Oth0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Apz7bv8m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491gmPZ025053;
	Fri, 9 May 2025 06:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcJkwYNRgVHXiiy2QMT7pZmzjXhKaNdQhrZ+agbkImE=; b=Apz7bv8mJX/JO7ZU
	NcIv3KdnGUSQfXMxKY2vrFXrclktuWKCDirIhu13gg8J+lvLex/i67fL1mhFu5+/
	GahGAEnrxjP/2pyrdR9waeuLXDdW4MlSrrGocrF4PWrDE6pP0wIYrappA1LX/Xd3
	yhYVmAliMTGL7tKmgk4cfB5FiQo2G9kU6uJ90c2dV8+hQ8WNsHCNEUeUFyYkYQAV
	xXi4ifb8wLZsNjSNem6scLRb588mXEQvOhHC5Vb8MK2q53Jg4VtWNc3gE3Hx2RNd
	wrTkdPTDXWgOpxJ8mXlFlWCfIzoPyCMCUsZpVVgVqfBxI9IErOnVxZItafo2A6zX
	fAVdOg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp13p24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 06:29:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5496TNmT024474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 06:29:23 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 23:29:20 -0700
Message-ID: <e6693a71-6c91-407e-9a63-93b99877445b@quicinc.com>
Date: Fri, 9 May 2025 14:29:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] scsi: ufs: qcom: Check gear against max gear in
 vop freq_to_gear()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <neil.armstrong@linaro.org>, <luca.weiss@fairphone.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
 <20250507074415.2451940-2-quic_ziqichen@quicinc.com>
 <b3c662ca-16bb-44df-ba68-faf55b1e3dfa@oss.qualcomm.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <b3c662ca-16bb-44df-ba68-faf55b1e3dfa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA2MCBTYWx0ZWRfX41UybqokYC0c
 34b+7ZPzj5MiwdHgY1WQ32u8ICorF5goCNLsKuVOK6+gcxhfaDIHSfyqeRICbxdvOzHPFLS94Iq
 qXslS9mJzG3eY2rOK7LK2DgxYZzr2doT7U6e13H8oKGXGQcj494gucK81dbZHFaCpKzZxF0CRHu
 4zvVh+BSlWaFO1cxAF0mvOZzpzPIpveGbdeUBM0mGL2+BNbvD0AQN7EwNlhRdRIlec/gHqZ7TB0
 RN7RWzI6/zeBCAzFndXZoSm+PBRX1zn3nC7u/d5zAna4DLrwlZcLOj8Qjw7oAKDius48egTdRNp
 6DxGee/h2unwjQTGCzCvLFGRJr/nvSJJnmcImSSTOlx7oX/xTnVD6Npcrczhf6pyaWJL8CxY5J1
 ksHh59HlcaQBBLNlh5huAt+AUZe1AfBpTT3iU0e4WEJZL/W73sRviDedKk3O+Ncx3VFG0xu+
X-Proofpoint-GUID: ae47ub59BYRapimsIX-dx5VMzhcXTOrJ
X-Proofpoint-ORIG-GUID: ae47ub59BYRapimsIX-dx5VMzhcXTOrJ
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681da0c4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=2qxVyAQQ_MGMW2kZJIEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=931 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090060



On 5/8/2025 11:30 PM, Konrad Dybcio wrote:
> That's UFS_PWM_DONT_CHANGE, please it so that the reader can more easily
> make sense of the code.. Actually, perhaps this function could be tagged
> to return an entry of this enum specifically

Sure , Thanks Konrad .

BRs,
Ziqi


