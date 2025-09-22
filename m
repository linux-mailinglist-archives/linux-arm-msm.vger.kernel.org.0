Return-Path: <linux-arm-msm+bounces-74381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B67B8EDB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 05:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5D1E3AFAFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 03:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB802ED842;
	Mon, 22 Sep 2025 03:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/U6xiNz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9A272613
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 03:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758511432; cv=none; b=uYmNr46XtE/THTB0+sypgS6g+MlGAU7wmO8ffNcLGrkkTeoHBJALacjAeGyqomZg7r/WpVxT1N6fc5VIDyGTsP+5/nJrAtv1OV/3Cq98Wupz8KZpDxP1Na4bNZxkCuYxucwTFlHfhzUM5qb74Otv7N/lD1+wQ7GykiE/emwJ/LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758511432; c=relaxed/simple;
	bh=h7yHlQhi2qFi7HRsPncnuEeU/Tis0Jc8LC1Q6SBfx7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rPnueqhXMTKAhbU9cKyzb8KK6R6j355iS4y2cUIL9RBVAS0Cq7gBIx9d8ZfmsQl+PzhnqI5piUrvQ6I2gc0FFYiukHfBBT29raWKWtUNg++VpJa2Jw2G6W5wykSNhr7z/m2vp4sfCwvsCthShG4hxG5fEkeuL9yk2FG7qxPibeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/U6xiNz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LMFtTP018290
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 03:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNOuyexfI1zurDE81bZpL3amoeTGP01KN4jEw4M/iDE=; b=G/U6xiNzV2UvfuHY
	w9UYJxdZAPN0SctDzMP7+/Sd8DUwyT9kgq1KRYZnwWLhNELJQRR47/OlUsYWQR/n
	ihVWLh9PRHCmsn4hHg3GZ8wrVebIlGc6XS+ybPfwfiKgQyKvc6yaxk2jR1FDAZup
	J6uRA5DDCdtqnOjqrvHjuT++/mg/ohNwgBVDYqeEyxNaCv4o3beQO62JQRvO/Ni4
	2ZNyhu8jnRIc0E5ZCuZ8OqpibzOKhSlKoHUwjQPqY+AxYRgeyLS5VclAw+iuYt/f
	BY1OvTAJZxNWn28UruCdaz/cZV3TmIyAeHvJFrW4GYGOObmCMhoXxbJ/qqpDpXK2
	3i+w1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fb4u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 03:23:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26b7fc4b7e3so7757125ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 20:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758511428; x=1759116228;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QNOuyexfI1zurDE81bZpL3amoeTGP01KN4jEw4M/iDE=;
        b=tIU9ID9ZfJcpUKo0CDG8eeuaIkzmZrovIoKOEjTipy4Gh4Fb5MX1EVvtZQIQKbK5oz
         d3HFocxoopwZSLHI5p0m9uYS6nVB15PJFqeTk08/E8kcwsVWIATG37v3CyHxdRsO+bw0
         iTIRymLu9OopT8oK0eO8KmmTP+94WxRlReWU/akwqy/MvJlS8LNNcBSMgiSidaLDYTLd
         zot49XrjbhKzX0TB7j/rCFxCHAB5ERLclc9jQ6XrGmICCzSooUDsmbCLVOmfDgSEEvii
         e0mP012GdjRM/samxLiaqR/53D1gNDgTJr2xvw8w0zaoISh9BOny/Sc5xCc8trV5Aaq2
         0UaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1YJaDd8oHdUdAtRXYeP8YFEpCFse1haUESxPcBBFs0cu2qzJ6LwVFisJ+b2rqF6lJ1HG6/3Rhi6vzXIwQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjx9KDFTkkT7yYwnJ5ohPnlhy1hn3lVL60Xj1y3oiDTWDqroYv
	CDmo9V984ZrLBb1aR6kFxD1zPSQBXpuciFYDq0+Cv12v40vSnUKZp8r2860pQRLdh5UxdKirgnl
	fi5x5lrsCdUAtUaPBbr1CGlxZL6uPJ59fgAJqQC2dKTKyiNPxe42L7Tj+zKnelGiJnPeO
X-Gm-Gg: ASbGncs2J0hbz/Ulg8u0rglW4G6PGk8N0CnWNkQb/jgkycvF5JW0Kk7zz+QM/op+UKJ
	t/2VdGwONqFt9nVFat4CHCi0WNWrRuyXbznj6nMO85J8ChJSsP0LThichMpkwmQHlORdV9pmwx8
	iJLUFc9pXXh2PzgghXvCPz2cehfmRQc+zp8cvXWqVLKTPSqEIEcpKpEGRjNOiauiuILDkik+fQx
	gfVzhRuXL6OoQ2+iNUqRCAXGsGSHSDDEdY7HTPulUZXis6xEeIxmKpZy7/bbuAgnfcHhg1i+MWK
	fMTDE3ajSwhHMeFtJNoX+opRzKy7oADsczp13jSmldr+T+qig8BvwI72Gff8l3ElgJIYuPvKmil
	YsA+/1lDb24eV/IdwaDl5qhLBZuryWARVpw==
X-Received: by 2002:a17:903:22c8:b0:26b:992f:d872 with SMTP id d9443c01a7336-26b992fe5aamr70458335ad.3.1758511428460;
        Sun, 21 Sep 2025 20:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZqyYB8DrXuJB2KI3l1495xieQN/jAycrK65rdpR541CtvuXZ3P/PsTk/gjpllb2oItS0VQg==
X-Received: by 2002:a17:903:22c8:b0:26b:992f:d872 with SMTP id d9443c01a7336-26b992fe5aamr70458015ad.3.1758511427930;
        Sun, 21 Sep 2025 20:23:47 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802df446sm117628455ad.68.2025.09.21.20.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 20:23:47 -0700 (PDT)
Message-ID: <b8d2c97b-2b23-4866-8d20-c20868e878e3@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 11:23:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
 <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bl7oBmXa7GfwwM9udLzSLokzjLO1ZRO4
X-Proofpoint-GUID: bl7oBmXa7GfwwM9udLzSLokzjLO1ZRO4
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d0c145 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=z90s4CAT84tkWkAwxOgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX+GE4SRUdTs0n
 E8uXFQ+9ONF9IPMQQ75agrLK2/tv7mQ3eaWthR9yicIQfS72t3l+5wdpEYwJTKYhiSCj+c9knvZ
 S4pqKmxLeUl9sw/phJZjI5JmjU9MzcXdaOQnLbwcqRnBu05WWX8IiE6O0oS25SAYVYI3VmMoA+3
 n/EEp8MHP7P7i/FOt/Nn/xywEIkNiycdof3jJfb9coOF0qKGjVKLSCEWPykHU51inXsWJrLXr4e
 lR52NXWO+bVUxgPDzTrj3nA1zEUVnCvr7QwObG0j1Qt1ppW3x0u8l4MHDx3QtrLn2iWqYdLfZ1m
 0fg12CYy/tkuAISMq5DgTkDdndkxNhzhNSq1uu6otnsK5C/d+/SFDRtu+T0cRZVO6WJhhURGtIC
 tci9aZBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037


On 9/20/2025 2:35 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:31PM +0800, Xiangxu Yin wrote:
>> QCS615 platform requires non-default logical-to-physical lane mapping due
>> to its unique hardware routing. Unlike the standard mapping sequence
>> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
>> configuration via the data-lanes property in the device tree. This ensures
>> correct signal routing between the DP controller and PHY.
>>
>> For partial definitions, fill remaining lanes with unused physical lanes
>> in ascending order.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
>>  drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
>>  3 files changed, 66 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
>> index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f13352f7b3513aa88da2a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> @@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
>>  	return frequency;
>>  }
>>  
>> +/*
>> + * Always populate msm_dp_link->lane_map with 4 lanes.
>> + * - Use DTS "data-lanes" if present; otherwise fall back to default mapping.
>> + * - For partial definitions, fill remaining entries with unused lanes in
>> + *   ascending order.
>> + */
>> +static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link *msm_dp_link)
>> +{
>> +	struct device_node *of_node = dev->of_node;
>> +	struct device_node *endpoint;
>> +	int cnt = msm_dp_link->max_dp_lanes;
>> +	u32 tmp[DP_MAX_NUM_DP_LANES];
>> +	u32 map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3}; /* default 1:1 mapping */
>> +	bool used[DP_MAX_NUM_DP_LANES] = {false};
>> +	int i, j = 0, ret = -EINVAL;
>> +
>> +	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
>> +	if (endpoint) {
>> +		ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, cnt);
>> +		if (ret)
>> +			dev_dbg(dev, "endpoint data-lanes read failed (ret=%d)\n", ret);
>> +	}
>> +
>> +	if (ret) {
>> +		ret = of_property_read_u32_array(of_node, "data-lanes", tmp, cnt);
>> +		if (ret) {
>> +			dev_info(dev, "data-lanes not defined, set to default\n");
>> +			goto out;
>> +		}
>> +	}
>> +
>> +	for (i = 0; i < cnt; i++) {
>> +		if (tmp[i] >= DP_MAX_NUM_DP_LANES) {
>> +			dev_err(dev, "data-lanes[%d]=%u out of range\n", i, tmp[i]);
>> +			return -EINVAL;
>> +		}
>> +		used[tmp[i]] = true;
>> +		map[i] = tmp[i];
>> +	}
>> +
>> +	/* Fill the remaining entries with unused physical lanes (ascending) */
>> +	for (i = cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANES; j++) {
> Nit: i = cnt, j = 0; Don't init loop variables at the top of the
> function.
>
> Other than that:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>

Ack.


>> +		if (!used[j])
>> +			map[i++] = j;
>> +	}
>> +
>> +out:
>> +	if (endpoint)
>> +		of_node_put(endpoint);
>> +
>> +	dev_dbg(dev, "data-lanes count %d <%d %d %d %d>\n", cnt, map[0], map[1], map[2], map[3]);
>> +	memcpy(msm_dp_link->lane_map, map, sizeof(map));
>> +	return 0;
>> +}
>> +
>>  static int msm_dp_link_parse_dt(struct device *dev, struct msm_dp_link *msm_dp_link)
>>  {
>>  	struct device_node *of_node = dev->of_node;

