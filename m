Return-Path: <linux-arm-msm+bounces-56484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8662AA7066
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 13:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48FFC3A4F89
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 11:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2B9241690;
	Fri,  2 May 2025 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gtOQkSj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22270221F09;
	Fri,  2 May 2025 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184101; cv=none; b=IUx/dRSWfWcZf6am+wdxtfGkSbzx43MoUypPaRvkTksJDddEJSE6uiEfO/z+3HDDONDT9zEThIsiy3zLFk9dtbmEMV7FUKpgaIdwhKR5v7f63FszRqc1fHXi8EXmaHkGtBv0kjMXR8B5yKCY0mw0RXVJFY3Ffha54Udsly5Fgs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184101; c=relaxed/simple;
	bh=G/alf/CyFPtEf9EitW4X8ppe6uI9sk3QZwlrS6sR55I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TcpvM3/YRDZg+P5HwGbrc4mzWYkk6VvFCAN0ezW4uSlhdkB8pZRpksC7utMb3SSliqogje2Gg11G4g9Qth/KQYhlP5lO2j+clfnlOb8v4cDr9fUBMZAkbAoRlMOcGZ7jLN7Vi33DayO5Ud4ewqGisvnVptUBBoLXo9cEf0S22xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gtOQkSj6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421N16d021089;
	Fri, 2 May 2025 11:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcdQRBt4OgqBQrMDcSI6actSvnwROz3wtM01sRycdFs=; b=gtOQkSj6X3vbngat
	jf3xRGZjoCWr/gcX3iR3aZgu8MR1Owi0Bn/AKMZkHqY+GpqYMpOE9ZXfrVd/icAL
	E0sood1qe/CtyEHLvhZbvd4D+YA4k76Rtj+TwcMcDeBTaraXR0LyD+cG3MphFnSJ
	uyX2thh/kvBN0QBEPIuM9HD/cBfMt2XeVnTMX6sclzPnKRpX7wyoyK8ekNy1mC+i
	W8oPZ6lpD9nYXYCzKZv77ob3nceT8q6xwEFMsuQwsSWqNm2fDFTxkMnYqIKPZFBZ
	1PU7FVLh/eFKpuhgrFfmq3rugLWbAenbBvUojqJ+m7SsCzCa7kuKRg75haJpHI1J
	jS3WZQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8fy14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 11:08:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542B8FGX025196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 11:08:15 GMT
Received: from [10.216.12.65] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 May 2025
 04:08:12 -0700
Message-ID: <7075d026-9be0-491b-af1a-e7d0565e976d@quicinc.com>
Date: Fri, 2 May 2025 16:38:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-x1e80100: Set FORCE MEM CORE for UFS
 clocks
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250414-gcc_ufs_mem_core-v1-0-67b5529b9b5d@quicinc.com>
 <20250414-gcc_ufs_mem_core-v1-2-67b5529b9b5d@quicinc.com>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <20250414-gcc_ufs_mem_core-v1-2-67b5529b9b5d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=6814a79f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=yWR8sHoMQUO8avVd8zcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: i4NY0zC9ykyYkAU5HTPzakDBuv436fXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4NyBTYWx0ZWRfX++mvlUEetJwL IZjfxELf+sXRt8bU5TjstZMpKDaWkT6S89T+cfy2hhX+IO7z4/1VcsAegVCihLYvIo6ghIFExOD jp1gGes+HvXs9TjY0uBO40RadZAD1vP0K5jP4GW6E4S0YwUEzzRDyj+zwCURUFqhbkN6WMvAtPy
 MESqomGALhAbjQ6gZGwIH076of3nbZvQ9512Rv48v9+oM4MAjN1pw5Focei4x/B1zfwFYIDeHFK 8OXIOtcq5MJoXtWoA95FJRdHOsyqg3zD9aOwFb33yVudrE1e4fI/hFQoqlJdOqILGBsxnOFtWKQ PkGpg2PhyB4zKLjWSl2JAS1E3bn468ei3+GyI/qFYfqYn2eJ+iQbCuvXL+qTJJgWQ2pM+ys+HlP
 dqY3U/opvWbHIhUkuCxi+z2QgbVgzpzioFcEKxWubicl+FwQ9LybaYDDLVwSbusphv+NTE90
X-Proofpoint-ORIG-GUID: i4NY0zC9ykyYkAU5HTPzakDBuv436fXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020087



On 4/14/2025 2:30 PM, Taniya Das wrote:
> Update the force mem core bit for UFS ICE clock and UFS PHY AXI clock to
> force the core on signal to remain active during halt state of the clk.
> If force mem core bit of the clock is not set, the memories of the
> subsystem will not retain the logic across power states. This is
> required for the MCQ feature of UFS.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>

Thanks,
Imran

