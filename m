Return-Path: <linux-arm-msm+bounces-76353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20358BC428F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 11:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF971401922
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 09:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49C423BF9B;
	Wed,  8 Oct 2025 09:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o03U3zoW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D11FA178
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759915903; cv=none; b=C20C6jsxtWzAV2n3lovjN6SqMvzYKo059tO4DtlPZHbBGqMTH3bM6HIYT+UunHtRc/EKhGB6rIMQDk5mGl1GfkxfcJOUVXb/T7W7bjXO05TV7HzfFCzb4rViEQ/a5JNoXJ1g8IZp6W0fGRS4/7kgsYLZJYvtpbvDTj+RMdtnQiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759915903; c=relaxed/simple;
	bh=tCc1PMyHmBOqMiV0qFZ9o/QlCes0mAXRkZbAUL7jqnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q7CFlTN4PpliHTV68kpOFUXnOZVFFFFdbrvWUbrs9ByTypHRECm5Osy1qcLoACXl4ubL5tKMzmqSuiCH8N2TE1wzrh47Cpp48WrTv1P893mRj2e9cusQ0LZpkkeArfGySrVOD2mGNlZHdopI+EcWjy6dB4VbP3fJthOZmgm8r8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o03U3zoW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890mrQ023842
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 09:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ShStu+tivNWxJNb9OpE76BCF0d8VuC1LAfixqiQb3OY=; b=o03U3zoWFsowrXnn
	2UNigC+icoONELY/Je7uWbX7abtPdVQPs2yUfZH45SO34KnUy0fOZ0eZAw9W3jb3
	fKIja23PN1qijci21AWhrvIssw4XnhLrruuJkHCXoApQJq57Qrv65rN4sXRIB/UO
	eaB+tBzRx9Mc8L3QxzcsuVJp440uCxZvhP7/jrJLtxiIaPy0TK58pVVK40gmQ3r+
	uKRglkUqDn3Lrymqb3KNUtDiQvdNVklWP5PuUKcVNNWBHgZTu2gkYiLpBUlWoZLu
	Po9aK7wFuLL8aYcTCUVfQOOeCHqmCr15Iz9c3HoCnVSpA2ME1JanAvtJLrErABBs
	IG/dgA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n4wktdtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 09:31:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d6c3d10716so13468991cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 02:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759915900; x=1760520700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ShStu+tivNWxJNb9OpE76BCF0d8VuC1LAfixqiQb3OY=;
        b=vdYHTTN0s4/kBCUaaCw/4DkZdrAyf/vMA4skBr6TEBlhb1MZA1fZEbIGph2R/5CtBs
         k3sZKo+My2PNzLdjfuIKYUkzf2wzyilVZ/XbK9zqRPKMnLBXlWX0sgpEbj9w5+uR8+Ct
         1TbN83pkH8pIz6TRu3WghGUHVEr4THWmMVZG7kv37WsqbI+ARVR58MJmHp42/PNlNdCf
         fENnFmZgBTCbzaIqyi3hHiavgTVPj0sP/I29RMt0PDW/p7ie+DXuJsHImUOAaE3uZi5y
         6egFXQgw7XuLt0KkMpXWT7JR/6L9wxb7CdgpbuWz6SsY3g7cWKWHkRt/eGqg5UYG+ZE5
         OQLg==
X-Forwarded-Encrypted: i=1; AJvYcCVwgcIGGD8hAFn+cGg5AD1oMevCNBlTUdhQ2qEyAZrjrkvfH94AjsDFyIakoBdpPWrijoC5S5fyX2QxvvxT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1IMxBqflUd61cKfWHp2o+iVGLOS+pO5+os+EMWNIWPqWp+ZIv
	47Hd+wutrzQkSu1KwT4v98cAdWa6HA3iQc6EtCAvH6NDMPUviltw7X7fNZm+D+gFNVQUJOxQjd7
	7PXWhSO7dYZfCfKLxOp7U68rooXHDnGfeM61sxmFdi1WcQ42HPFU9B9Jt5To+z0pekuLW
X-Gm-Gg: ASbGnct9MFhifJ3dXOC86mCktYnDorTIOOYepRnQWsKXhS1wxCG5Ho8lHXRo4I8sN1O
	Z4jSazA5Rq748XBBGPwP/R+tNknsNO7Y9H1ckY7TIJPrIt8l/D7/4uxmVR8kRh6FAepplllw6wh
	/MBZLdsUEmsRBMihRLpuT4DqO232P/zT2Mb//044uJd/ntjPCKYJPpzgiSWo6POGI3K3vKz8pgO
	satbWSJYwKufnaPoAQB46R5FvysDCBrEPezyCcYhHogch09CysaDteOP7a/3FUfsL9egveWeyGL
	Q41209u6NT6kTorFTKvzv421Z2zw7akc7ulXlC51bwedp0OtEmCx+n+O3HJjzGPo0xS8GxdbOep
	OktqmYNUqD8j7Ald05+CMZP+qEGo=
X-Received: by 2002:a05:620a:4802:b0:810:a76e:ffa0 with SMTP id af79cd13be357-8834fb91810mr254823685a.0.1759915900153;
        Wed, 08 Oct 2025 02:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgI4JjYPgSltjbrXNMG5XKEPcSfJAFH2WNqprb2InV6i1eGoR4lz/eu3nqT6ttxe1KsGCpqg==
X-Received: by 2002:a05:620a:4802:b0:810:a76e:ffa0 with SMTP id af79cd13be357-8834fb91810mr254820585a.0.1759915899691;
        Wed, 08 Oct 2025 02:31:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4c1f6sm1656500366b.78.2025.10.08.02.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:31:39 -0700 (PDT)
Message-ID: <141e33fc-c963-4f58-a69c-e7068c9ec6e8@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 11:31:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251006-topic-x1e80100-hdmi-v5-0-c006311d59d7@linaro.org>
 <20251006-topic-x1e80100-hdmi-v5-2-c006311d59d7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251006-topic-x1e80100-hdmi-v5-2-c006311d59d7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNyBTYWx0ZWRfX6tZHYifKCZKc
 hykcevXSIs/EvaarpPO0ylrOrgi2O8ycyST5DXe4mzLS73s7H+SlFs86vcRqbc0E0YKqUeuSxvp
 fc5VPba5fVp2yhtGWKQtVUx0t1DV9pTXGGtF5X7hfEW2PAJkcuRIKEV8hXsoYJq6vqp6F2Gw9vs
 9pRG2XYBrKzh4SKhQqA+BKf3BQjUeUj2x/scon6TD9xAT+zs7bgxshgWGjlt1jBJ5eP7AKo+Edz
 nMtryLjGMsLCfdkRynNOYGvzxkPgaVT53sBm0de6mONOiHXA6zbIXwLn7lTcqOM+yE2OvgbZ/XV
 5Wy9Bu+rZSKojfdZyFhRzsSEu//ym+IRFyR2UUwimQBdGbZgcJfyXmOUNEvEGwVVnbz4j4MOZlu
 0Zo7vn10rQt1jXURA13D833J1hR5Ew==
X-Authority-Analysis: v=2.4 cv=BP2+bVQG c=1 sm=1 tr=0 ts=68e62f7d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=GTBF0nZXcthx15BNZngA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dhF1j2l533Nq4N26L8irDyxvw1hQvHJk
X-Proofpoint-ORIG-GUID: dhF1j2l533Nq4N26L8irDyxvw1hQvHJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070117

On 10/6/25 3:55 PM, Neil Armstrong wrote:
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 2 DP + 2 USB3
> - 4 DP
> - 2 USB3
> 
> Get the lanes mapping from DT and stop registering the USB-C
> muxes in favor of a static mode and orientation detemined
> by the lanes mapping.
> 
> This allows supporting boards with direct connection of USB3 and
> DisplayPort lanes to the QMP Combo PHY lanes, not using the
> USB-C Altmode feature.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +static int qmp_combo_get_dt_lanes_mapping(struct device *dev, unsigned int endpoint,
> +					  u32 *data_lanes, unsigned int max,
> +					  unsigned int *count)
> +{
> +	struct device_node *ep;
> +	int ret;
> +
> +	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, endpoint);
> +	if (!ep)
> +		return -EINVAL;
> +
> +	ret = of_property_count_u32_elems(ep, "data-lanes");
> +	if (ret < 0)
> +		goto err_node_put;
> +
> +	*count = ret;
> +
> +	ret = of_property_read_u32_array(ep, "data-lanes", data_lanes,
> +					 max_t(unsigned int, *count, max));

if (*count > max)
	return -EINVAL;

> +
> +err_node_put:
> +	of_node_put(ep);

__free(device_node)

> +
> +	return ret;
> +}
> +
> +static int qmp_combo_get_dt_dp_orientation(struct device *dev,
> +					     enum typec_orientation *orientation)
> +{
> +	unsigned int count;
> +	u32 data_lanes[4];
> +	int ret;
> +
> +	/* DP is described on the first endpoint of the first port */
> +	ret = qmp_combo_get_dt_lanes_mapping(dev, 0, data_lanes, 4, &count);
> +	if (ret < 0)
> +		return ret == -EINVAL ? 0 : ret;
> +
> +	/* Search for a match and only update orientation if found */
> +	qmp_combo_find_lanes_orientation(dp_data_lanes, ARRAY_SIZE(dp_data_lanes),
> +					 data_lanes, count, orientation);

You can zero-initialize `count` and drop the custom error parsing above

Konrad

