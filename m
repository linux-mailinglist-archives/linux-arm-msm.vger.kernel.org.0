Return-Path: <linux-arm-msm+bounces-94840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFUVIA1kpWmx+wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:18:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1EE1D64EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB3DB300B56D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F2939B940;
	Mon,  2 Mar 2026 10:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9Mcxopk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y52mq3Jr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD6439900D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446365; cv=none; b=il4ssyLWoSJbtgyF12N8X+ZycDJR+kZWSeGIMmnmBS8zJtzRZn3c1JLQqQAxOOi8o8Nyt8lIi87ksTgK36N2pEnEHyf5oTbOkOrDp6ULwSnGFrmxavltZNvxquIlFeDin7kVPqhLsP2RLQzKTdVv/hwJ2E9QCuhpbAdrJtom8xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446365; c=relaxed/simple;
	bh=CIIMhn3McArRDaeoOfcnUn1JTR+N9J0Ef9jm7IK7od0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSwxepLeBiM2mTfReAjyQiPMPAgBJ64410xfd3EuKz/RNqfA8mVOD2LEUrV7H5rTCPX803YgzZSTeMuo2zHzd17Fno/0K2xldjSnffIh+hUhJFddFAJCmPP0OarnTefAQsoTRWfCopU8hexKQV6QW3RhTgGa0BgYD3YpWXROfqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9Mcxopk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y52mq3Jr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226h9rF2504590
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ubbob+1wg4HlG3B3+x+CMsZSPa7kvzw4na3apzS4rx0=; b=R9McxopkenPFwsEa
	uTHzckATe97Tv4pLBBAlwjvE+xCqv5PMh3FEVDzrl7ipCwA8wcoGEegK5kdGuTgW
	D1PCsOD9A7MxnKwfweoPTYQ5FByMmEhI8EcTtB3AlCBGmm9RBB9GiE9dE4N2rXrO
	h38j9kf0DOga6xkwal/tX6k9EENuzhZaQXQOSXDa1kAID4khRZkRtm8j5bsRlohP
	8lYP4kSUYcZgUEEbYwRack3uAtG/d/PwKUGx8Izq+CJOnN/7hGpCE8uVYuwTBhID
	vY4OpbXzouopqj+E9/wTPy5sHH2BMODz0An/ysCSF/Xszvaqsz31EJUL3dgM9QsP
	949f6g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hersj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:12:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-359812e4fefso939639a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772446363; x=1773051163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubbob+1wg4HlG3B3+x+CMsZSPa7kvzw4na3apzS4rx0=;
        b=Y52mq3JrS+Bhoq2swEn1jqPWL2zU08atcrRelBuU3XyqL/mtnChWtkzM7Vxgwjy49t
         eWVr79cgb6joA6JMpxT8C30TWLuV7UY+9FDW6YDEE8iotg4Jp3Isp84Kk8B/IvW+EP63
         HTbRqWFrPjzbbXWIzZT80nsTE2RVtTiS4dO+m5U7QJDyLMpzS+fMz05tKOL4+NYR0Cdb
         0k0BwqCZVqDzxT+e84mKAbPJQAxvwNbbITLinrIcgr2xPo2z6pT5+A5f/ZEN0zMtNtm/
         HR+96bHSJqjQCjAx+UK7BMyx9rikM+ZQMdWSqV35OW0yKFCGhtvE1qZUCikwrPxkXCN1
         33tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446363; x=1773051163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubbob+1wg4HlG3B3+x+CMsZSPa7kvzw4na3apzS4rx0=;
        b=mVod9VkDc4x9Pftt9IrSAJQ6FyydewSEQiFT1MHoDEwGLmCDNrChAUIJ+UxdkxTcPD
         7ChhHg3lc15rt5P8OiqqFmj5ZBHJ8yDEnOi6VDRmNmKL4YLKCMPsh11UIbJ/adOMGvKT
         zBOHhxXl95M83hqGEdON3m9JgLRoHONxRZmxC6YxRJZ5hyPo1OumLTe4q/KQPycJyJB1
         LcdToM3xEKo/Oljas9f4w5K+R8vIbut0kcur+kqUK2PwUNy8BezxcyIa4vnmw8V0xuyl
         uFf/auhC/8fZa2iOUtDdzenqrsbStBR/28EBc+A1lud7sLfEB98hBGpaaf3QeVNbXMCz
         ZwKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW9IedodoyiSJuBosngAl4OD2w/xlIMzqtGltA544m3UX2csp0L0nsoJNvlq6vZHZOEA1KTSvm0m4rIf6H@vger.kernel.org
X-Gm-Message-State: AOJu0YymRwmlgD1/a0d36sTWr1JrOPeNDilHmtq3LCsZC0LntWlrB5Z9
	yi8/WRbR169xTdzk+XjJF2Yu5tVxC9XsrN7lDjuTmiAx69NMIOiY2fUU/tkRx7boosTIaWLb6/m
	Y5gY5pg8Y2n02BDwrj5lxjbmv7JYn4yq1zw0ChuKHQdCJ7O0k7P7BrJmiwTfEC+wa7wpQ
X-Gm-Gg: ATEYQzwmld0tfQtf05RoAFAvPyk0OJOsuQ1f4L0MnWLLu9v2YLCDwLLS2ai4Y2zFGPz
	krxq7WgofUXzpUrkJgJ2ysS3kN1e9IEReYd3BH4Gn2SZlfzjev9hI7l1CM6J5lKU0ILiIM3msF1
	LpPPdfnK8ZtAXN+repXLU/qqHhdFyICBAFaPUXPGaXeJfN8kwKgxSfNR/0KY7h7QWuYoKuoMpgU
	0eW9R5vY9Fg/6UpTXbU7CGAQeSIv3bthOD2HhpSEmhqAjwXaviDzS7rwDbirzZMW1Nftmki0uPs
	sT9Pf8RVUgCYW/3QiLItnzjSLokX5ex6fNEDQLhE6OA1q7uBJFiqemGVbUq/hZVjRyJn/gsbAo9
	jAtzTPklRCLUggr1J5By64s+dz8tGqp4+mOcID28PmwJm98PRU1L5QA==
X-Received: by 2002:a17:902:e88f:b0:2aa:dc83:242c with SMTP id d9443c01a7336-2adf79c2f84mr157989365ad.26.1772446362742;
        Mon, 02 Mar 2026 02:12:42 -0800 (PST)
X-Received: by 2002:a17:902:e88f:b0:2aa:dc83:242c with SMTP id d9443c01a7336-2adf79c2f84mr157989045ad.26.1772446362253;
        Mon, 02 Mar 2026 02:12:42 -0800 (PST)
Received: from [192.168.0.172] ([49.205.253.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3c4d69a2sm66087915ad.48.2026.03.02.02.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:12:41 -0800 (PST)
Message-ID: <3fbf91f8-b8fd-4116-9fd2-b101154ac2d7@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:42:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] media: qcom: iris: Add hierarchical coding support
 for encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com>
 <20260206-batch2_iris_encoder_enhancements-v5-4-fb75ed8fa375@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260206-batch2_iris_encoder_enhancements-v5-4-fb75ed8fa375@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a5629b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=WNU4mP0iZEZjDg176sUGxg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kPUnIz1Ah4fUb2HUMqcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: ovZZpnIEbiuTwFmncWwmhBS4s-1c1yhr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NSBTYWx0ZWRfXwiPaUYtBtys2
 Ql1RJQLDKx0JqEae8yCMXVyf2ZJrT9tFxdn29kEsin5HDzzSXSk8mo1ZqNnLs9VqxXXYnxUQk3E
 M0myYKMUFYjVVpCtlqiOGWGEV12X3OUUSaZrIUQKK2TfkD5AiLqc4/ZoGGjQ794SKIqbbSz6BNi
 eK3zipL5J1a39KsvSkJqFLbjXUOrOMecp7hZqsxcfs3YnQoyDbxdS/c3b2FIF7b/P1pIMY29QCo
 /95kPdpX+DrxuC2oIFYbPyhHFGP5mpic58lD8x0BdpcUBbd9ukEfnx97X/OCU2jMf/AfKuec0FX
 9+aOMfqcszuN8C6pibvAZ65ss1AnTk2Y8OVU/E19FMKixMh5+Vfu92NCOYH24NGM3Yzdgf0kWTd
 nyp6sfMVRyrYyQ1LreTw7iNwXLOUa+LIc22Vc3Ee2T7Q2u6roBIwIdtCiYQNxvshkqWjW6sXJng
 ZJl4ZWnbShJs189JhAA==
X-Proofpoint-ORIG-GUID: ovZZpnIEbiuTwFmncWwmhBS4s-1c1yhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94840-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B1EE1D64EF
X-Rspamd-Action: no action



On 2/6/2026 1:42 PM, Wangao Wang wrote:
> Add hierarchical coding support for both gen1 and gen2 encoders by enabling
>   the following V4L2 controls:
> H264:
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING,
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER
> HEVC(gen2 only):
> V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE,
> V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

