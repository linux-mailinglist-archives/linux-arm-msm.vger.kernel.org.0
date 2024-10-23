Return-Path: <linux-arm-msm+bounces-35488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC879ABA82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 02:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97FD61C220EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 00:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4874A1798C;
	Wed, 23 Oct 2024 00:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mfum9IjA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938A3322B;
	Wed, 23 Oct 2024 00:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729643160; cv=none; b=mhogbbtXeyFZD6Y95VXjEDFc3cXYt0bHSTgc240HVtlCuSTECQVW5v3iV3CHMUCgGXRB3Yt7IvU/Mb+Sw3dmN+tDzzxvo6LiY21Cvm1gQkxZbgISnWft8nOgQSCe+kCZtL8xLT+NZjmaJz+nMtwq1njNziSLg6Qv8KA+6OdO8Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729643160; c=relaxed/simple;
	bh=h6JzDILR1DPuxl8LZb987FWLyuj/Z8EX9qPsVg+20EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gQJWdF9CDbfwFYGLUItU8j/6NXULZe7HaNM3VdI62TgfqwBngx9yqga8vJhZs4OO5hFPNkZ3Ymnb/zLdK7YlvXhUVD5zFk8fDkOPDmdJim7mOkmhs2s3x0YbblGjcRspzWBfYtLXpnDYiAoUSDd3XIP8YBccLalO9frmoYgRTVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mfum9IjA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLafDg009312;
	Wed, 23 Oct 2024 00:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ie/qF0lq9AKN6Q3By+zupjvz/24wiHybHMb3RzJH0yU=; b=Mfum9IjAe0AQ9MmS
	su56FfM6nHHf59PPJ7szwg6x+1zr8pHjubyRjHmMOOomWc1uyvKbmxsRtVgVDs2o
	ejECzPxdBbUWlITAnMO6xBfF/zp7bMIvneef8beC0+VjlXeQvYMitu7jOZnzSVDM
	RQRktiuCDmaZEC4AC+3KdzV/4pxSB7M78T9UM1ijx974Z+mk9qJ//dMdOB+h0xQ9
	9TpvxPRaa3fXTfZDwtQ/9SqH0zeMcrjWvO2Wzay51xNUQu0CDOsd9gZHqEVSnjPd
	3xljz6xLximb/EiMffIQrGe+YAoE2xkhoJ0A+E8ierOAXkqwGNkcs0p8wpfNOHhM
	zx0pCQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em438a2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 00:25:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N0PjFA026529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 00:25:45 GMT
Received: from [10.110.103.186] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 17:25:44 -0700
Message-ID: <479ef16f-1711-4b16-8cad-c06fc5b42da0@quicinc.com>
Date: Tue, 22 Oct 2024 17:25:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 10/10] net: qrtr: mhi: Report endpoint id in sysfs
To: Denis Kenzior <denkenz@gmail.com>, <netdev@vger.kernel.org>
CC: Marcel Holtmann <marcel@holtmann.org>, Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241018181842.1368394-1-denkenz@gmail.com>
 <20241018181842.1368394-11-denkenz@gmail.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20241018181842.1368394-11-denkenz@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TN39BrabjIVmcQFNMt0uVikhkpYF0sOo
X-Proofpoint-ORIG-GUID: TN39BrabjIVmcQFNMt0uVikhkpYF0sOo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410230000



On 10/18/2024 11:18 AM, Denis Kenzior wrote:
> Add a read-only 'endpoint' sysfs entry that contains the qrtr endpoint
> identifier assigned to this mhi device.  Can be used to direct / receive
> qrtr traffic only from a particular MHI device.
> 
> Signed-off-by: Denis Kenzior <denkenz@gmail.com>
> Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
> Reviewed-by: Andy Gross <agross@kernel.org>
> ---
>   net/qrtr/mhi.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 69f53625a049..a4696ed31fb1 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -72,6 +72,16 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
>   	return rc;
>   }
>   
> +static ssize_t endpoint_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%d\n", qdev->ep.id);

%u might be more appropriate because the endpoint id is stored as a u32

> +}
> +
> +static DEVICE_ATTR_RO(endpoint);
> +
>   static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>   			       const struct mhi_device_id *id)
>   {
> @@ -91,6 +101,9 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>   	if (rc)
>   		return rc;
>   
> +	if (device_create_file(&mhi_dev->dev, &dev_attr_endpoint) < 0)
> +		dev_err(qdev->dev, "Failed to create endpoint attribute\n");
> +
>   	/* start channels */
>   	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
>   	if (rc) {
> @@ -107,6 +120,7 @@ static void qcom_mhi_qrtr_remove(struct mhi_device *mhi_dev)
>   {
>   	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
>   
> +	device_remove_file(&mhi_dev->dev, &dev_attr_endpoint);
>   	qrtr_endpoint_unregister(&qdev->ep);
>   	mhi_unprepare_from_transfer(mhi_dev);
>   	dev_set_drvdata(&mhi_dev->dev, NULL);

