Return-Path: <linux-arm-msm+bounces-82083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3412AC63E10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68D924EE096
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB4128640B;
	Mon, 17 Nov 2025 11:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgPZxWJk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9zk53CN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C48426B973
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379506; cv=none; b=Bshn1GoGOzwqFzNzaOeJJjfLvSb7xhUhhffR5z29Z9F28yp2YuIlK/5GauwmZpnW0VBWy0CjBmd86ZRFG6zfPPVKtSZwxfsDBGjZ59XPHYn0FQLKi9rUfWVI+AbCcj6lGllrAhHR2Hgjs87+4YbSCnKllguSed5N+5gFW4tX5C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379506; c=relaxed/simple;
	bh=ZqbVURUzV8TNx1QP0tYclT+Jx9qy2Y20ZcsMtoLw7Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uS86ogk0UoKmaETRg3ylCYEMlCI1t/E5gq3dwBeYILNuZXPaoQrnWnG5tToollxfBOd8V+O3S1wSOlCf2jJUCERdN8EZ4fGh1NiMcrHBTop4CBQPROc21uakVRMDobkTgpXkZkQiQMbAp1ZwVQH1wZ87HwAx0e96GsOC0Ew6/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgPZxWJk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9zk53CN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAkMsb2790796
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwviYvGC4hGDO1XyMoO6tJdps1gyGQjz9DjVBbWsY7c=; b=AgPZxWJk9Ntfzjk6
	+QT09PGRdFHL+HoTv5bBaeai1oJWAoG2ZoaiIeTrBJMx9f9RHRIggEO3unxITXR8
	y49nT4I8jMvkBzBIolUwUvat+e1qiHRxOgePL1eljVlqlcbfp5cyY1MZGeEqGTDu
	WKaphYJ+hVcqhAlUtZERtw60TXLNmGNTMnRMLEp8G4I71G/yP8K5QYC2iDpdyMgm
	0C+XTEEQDYJYBgiLEKCl6qNo5TURszJfTpUVi/JK8U5VKIXuQKU1mE9RkVZ5vQQW
	Luo34XsiS7e2vKr7DwEp8AIL6khY+erEQGaEJlPnZZrk6OK45qsC0X9WDq6lgh6D
	4u3BBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bhdvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:38:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2ea2b51cfso35373485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763379503; x=1763984303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwviYvGC4hGDO1XyMoO6tJdps1gyGQjz9DjVBbWsY7c=;
        b=W9zk53CNJeqbzaw/4LFcIse660mB+GGARw/AEVfWenA23plmgYO/jKAyvDA4ob4KVZ
         hU6pNyEwUxVp37UECQ9KZus6Cp8i4eLT+d8y26pS8+fqFn7phxWCWeK8ICj05ksjWfpF
         1D5D4lqcIPqVgcftD40TcyR5qpCBzGCfDGsTWzTvVcREBDtgCOmX+hgtyxOuAM7tHItR
         vadkSslduEqWU6uD93Kv7E6OJpyqN4oXzqmogs0eCJ5ky0xKFp23hGcW/UfL2K9Uhrb2
         x2Bw8VSImsT+HwYHXU5OH+c+SEJmEk+9T85lTwxjEdMOLqmV2borkwnv19mCAsfPqjlx
         8bNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379503; x=1763984303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwviYvGC4hGDO1XyMoO6tJdps1gyGQjz9DjVBbWsY7c=;
        b=swvX1ByK6AYiVlikjheNFeugWJsMh7Ad2xYNt2dKZASx9K8oDo18wUiua56R0ndbjP
         dYmO8htK5VCez+zIa1TzOyMoANhG8OIZQ1fOg+Dwzjz3ngWEiez/Fjqh1ZGAJ1OBNHoX
         J+OPwSdM1NB/pkVFJbgjH4lxcZBUjmcpoRiQ9/Hnlty1SRtAhoUpwLWc0o1tIq0p2BOS
         kW3jFwxxc0rZXOFMoQ+RBqIYNztFY50KMrWH1y6j1BXgK/1WWUHmMwrYbQ6CFOV3I+wh
         oj8A0Y1xRNQFgT9k/0QKZyxQ4Gb6k7yy7ivV1DuNQ3AOzLNk2n+DuTk+Fb3i1p9GoNd1
         nMMQ==
X-Gm-Message-State: AOJu0YxmkxX/F0xS849+7NA5cxTnnyFh19q891EHAJPfuC/h4j7ahxo/
	Qv+afVLxyPSZAGrCrU8vedgZogdQD2lKWgxOWI395nxcwsQ5UW0orSn7qIhJ0eOhD2mZ277Z/uC
	czZhD76bqZJQtY9GM/cgVOILKZtpWOL7++FHiZiv2t9qvwNSzyRREqhY8RbarMx3FogO4
X-Gm-Gg: ASbGnctdeo4IPkZLykMZj72JM7umg06tc5UL6KSfUWsCeshcH6J6KuXvEbBUA1FXVNn
	kRc+hnTVibi3kjwsUoY6BMwC52dHq1lD0FuVWtXuzgvCtnxMyU5ApVHAPXM/nVJG/qc5l8Z0pMa
	Gdyh9+dQT8TtGHwk0MUZcIrMLtGx4IChcTg7lpVw3//V/3dALe5GvMCLr1ccgel6F1bm81iJ7HT
	nyfSLss6icKCxhHT+yOQACNcDvU3KjuGKj8T6V3DyGxC9gKQ6tlx9R+nP60keoFdOLPxyb9dxlU
	Agp2kRoBGmxz8plTh94jHcSmkPX5/JLVjROOVsC4maLjAXRLfRszYfE82IAdxBJwrv1Fhi+nYhl
	oG3fpNFOlQOiEHL7S+Q6aD047mXIhPUNhdq0jvKE0B8EEbOoPPGFyY5Py
X-Received: by 2002:ac8:570b:0:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4ee1c71756cmr33875841cf.6.1763379503160;
        Mon, 17 Nov 2025 03:38:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfzAtHkPdUPh4MDq2xgPdgW4d7n/UOa3Jta8gd33/AtnHpF+T+jlkdaWTR6LG71ny2kVEuNQ==
X-Received: by 2002:ac8:570b:0:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4ee1c71756cmr33875581cf.6.1763379502663;
        Mon, 17 Nov 2025 03:38:22 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b28b0sm10074161a12.30.2025.11.17.03.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:38:22 -0800 (PST)
Message-ID: <e5bed4eb-66d1-4bb9-91e8-bf9d6ae183b6@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:38:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] soc: qcom: smsm: Use __cleanup() for device_node
 pointers
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-8-5f107071d171@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-8-5f107071d171@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _wCdnHD9gaf6IWe4yhyA3xrikZePDALc
X-Proofpoint-ORIG-GUID: _wCdnHD9gaf6IWe4yhyA3xrikZePDALc
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691b0930 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=00rvZbY-6gurv9TMER0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5OCBTYWx0ZWRfXyib6YX4Bt2Uy
 3iOod00RRCmZTKEQBk/EVy8HOe1l9/D9aruB9gjWIo8cnOhNLkKZg2EMTNLQaN9KseL5T6I+OzR
 1hgfLooejf6DlxNTC00uPjNERtbo/pZYPeCIRFYfMQnk0gBK2C3rdxeyDrtm1BkV4TpFL6kv0yL
 F+YpRmAHsgcFSfexuLbc5ZmS+/pJSkx3xEguxlMhUdlrx1c3S6pgECvk7ADuJGI85uhTCHuB9l0
 jmONNRVIgiMz+4d0rdmYFbiWmQZqDZCJKNOnySVvqZibNaKhDo0ZzExuARUmgYETTi/fgyZAW6H
 KUKGJJQ4G2okOwiwOfNLx7ZVhzx+wiL7z8NCtrDYeuIoCIAMlwsnZQceFsg1ov0yG2HkRDHEJCq
 ZiDVZtA6VgoBlchNOrJhd87wIKDCsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170098

On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
> Apply the __cleanup() attribute to device_node pointers to simplify
> resource management and remove explicit of_node_put() calls.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

