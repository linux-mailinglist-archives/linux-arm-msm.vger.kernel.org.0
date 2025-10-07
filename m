Return-Path: <linux-arm-msm+bounces-76228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B4BC1E26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 17:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE9A94E334A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 15:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B06F130A73;
	Tue,  7 Oct 2025 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pbOMTFOF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD2E8BEC
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 15:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850212; cv=none; b=GTCcDVGZIxbPmBeBUhSJv8R6GEnEkfaHD7oU2MEFREIJaZygOL7g6HUzaXGyfzpBVqDFO23EuBwJEnhH3/DttrTCqI9NKSjNJ8gvvX5UOrg2xW2lceUohs7NVsutAZg54nRyvp1BrLVEswcCt0cxbm8FuroSIu4esMenOOw7ZiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850212; c=relaxed/simple;
	bh=rVgK4x/zLmMl4PXaMULBd3Dfw1W09rFtiIlguMPtHrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrMcKS3r5c3AIeWMl5TNTc4Pe/2HzTqmCXx8spAM97x/AaQfWcBK2usZyFT78/4DSNwuZ3mcCsrxYnqGStuI1yEtM76JPHUI0pKUHjcFMQjAa7SC+MtdSKqRpPCskz5zVrI+W1qO43CJVhPota279WTsAj7oDSpL3DBFYOTbLUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pbOMTFOF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET6Li000458
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 15:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HR6W3PNgXeuo+1X26mr5w2I1dLqYNB+kRJz4U7kFt3Y=; b=pbOMTFOF3BD+kd4O
	Dk5s2hJB/cdEkQsQjiGlSIuE9THLLjFGpnSg6mcng2ZSlwxXqv2n3v0pNkTadvf2
	MH0etp07j9h4k0vkxTTWEDBtHZxFsn+7XNVxfbN7hqFF93ETGmpnRHKvSXCfFWFX
	XdwWekWyVE0mW3OnYDWD5j2CSpKhq8WXKSapAI0luBz7lVJt1ken0cQZWEU04cm5
	Pe4IdFPr5FzDsWBphr5OxnsXtFUvFUm7P1x/dZOPU95t1OYGeMp5aeDcCbYfngLX
	Co/Dzr4RVru5sHMJaDNPu393ac7CtPmsc8M4flvBRpUe43q25P/lfDCGW5VWq5bb
	HfERpw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgqq9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:16:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78108268ea3so6609444b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 08:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759850208; x=1760455008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HR6W3PNgXeuo+1X26mr5w2I1dLqYNB+kRJz4U7kFt3Y=;
        b=UszmANrjocBBqrm/wscMNUfETdpSssLFj0LmlYKwPoAHDw+ekPovPFRxM/wFQDbIlr
         oard3ytOGctO/pWczem5ZoheuP0r0+VI2/zDG3MsSaqFyHMdDo1jEhmWvFAcmxcnQ6O7
         /7MjqilPHSZ9x50yDDSapDhO2nr4TFyfzBjZRPm3T827OM4JSUCy9Ig82yeEMzrU8Zk5
         7v5jLSHBF8YPWs1/7QkIIc2OFp1MYOsIHq9b0loLkmPprRk+3RCd6RZ+LDp5EAAOEyst
         1kTP5OuQJ/J3cPdsnpo4NnvCjNRBrWazgunXNCZTvlzWzTMad4W7s2pXTDwVQEUgX7VC
         v+kg==
X-Forwarded-Encrypted: i=1; AJvYcCUntOKFSJ4GxJyew0OCJR3HYMFANb8/gNUvOLJJb0IlEppiErkUlPFeS3KU45dFZisralWUV0iPP5JKKghE@vger.kernel.org
X-Gm-Message-State: AOJu0YxAHTIYQRPSWP76iqVaNfLVy4yKxleRqspJGUaz+J6rBMcAxjXd
	eMsUrWBq3E3PrPfJ3PhRKQWJ/DNS5i07W6aqgdipoqXmNnfcaYSZyJVItliD7lv6OBA06ovX8kg
	mq5wSwBIVNuBxEOjENs9ZvxOd3OM1st7813CAexO1cUCrf4hGNMgUEGJ7HTz2EaiwkW54
X-Gm-Gg: ASbGncv0MMRBzKjgxvjFneRGoTL017ONeDpTvv/uIRIz5OFujsSSvBL44pvzHOnpCRJ
	xlfwB2WyhjUZxUF3a6bwjawK+ILuSSi0gCa69qTgt/RA+UpZ+B29gvP5iknYWHwccr61XOOJY0n
	P085SF1bq3H3D/95g7Mr92Scwv+eo0d1sIcCy8VkJAkOaL8XLv+hZWiIxhyFek2jb6Jv1+Ztdzp
	ZlsgsotYs8/1lSzEIYs/gHVTc3VFlYnsBRUIhTHR9TqFP3ic5lN98ySD4ZFqI1HCUX4sYOcO9t8
	DoXVzsqDrk+Z2yPI6Zu73uyf3ifWpep3SOn+Ezaxms2bA3mX0Z7qHHOgLGHw3+UqcAqUv7U1sge
	muiyIMjItU33fuUirMRQ=
X-Received: by 2002:a05:6a00:399b:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-79230757802mr4520403b3a.5.1759850208105;
        Tue, 07 Oct 2025 08:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvJqFvW5buhCRtmfrhGok+KqzqcDk0Wk8TcAaqtN/kQq9czL3L/pKYGzmNx91UF/+tiKO0wQ==
X-Received: by 2002:a05:6a00:399b:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-79230757802mr4520351b3a.5.1759850207501;
        Tue, 07 Oct 2025 08:16:47 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb16d9sm15910593b3a.22.2025.10.07.08.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 08:16:47 -0700 (PDT)
Message-ID: <3a210ae1-2c3b-4bdd-9e13-abcd0cb312c6@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 09:16:45 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Treat remaining == 0 as error in
 find_and_map_user_pages()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX8s5f1cI/JbP4
 Bo+ei7L67DAGQq89Pyq1G4mSi1wFDU9sbnktTO/0T0R1hnCeX+8Hr6Ph2nSIAZcLWjXd7oLB1rK
 ltRoD9oqQRkJty9TEFHmC1kg/4dS4g3MbbKRyBdN0ezNTi/MXjOvFPCryOJHV7vN8ZRh/IsQimB
 SGKb411vx2X7S3NpP9NmRkFhh2X25PLPC8NC1FNQuOSKEt4UK+SJhPt3L6mmLMmayk73PlfhN4S
 q743/lnlnj+TReVguOgnTq86pFYMimfT0vLVV/PR4/SYbAJLBkIzR+jGmYl4I7tRdYsY1g+uats
 SwHOmhfB8EPFPARAqfXxqcoPcIuK762MePcOkCWZLWIUj4bjc6w3TpxZ3uqtpNs6RML1lnzMreT
 IIU1KSksV6+6KGRbq6vySmZfJP8BeA==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e52ee1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mizEDCQyCps1tdB_wZQA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NcYfvgPo3c4o65SqjBCez4pszHpC7nUL
X-Proofpoint-ORIG-GUID: NcYfvgPo3c4o65SqjBCez4pszHpC7nUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On 10/7/2025 6:23 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Currently, if find_and_map_user_pages() takes a DMA xfer request from the
> user with a length field set to 0, or in a rare case, the host receives
> QAIC_TRANS_DMA_XFER_CONT from the device where resources->xferred_dma_size
> is equal to the requested transaction size, the function will return 0
> before allocating an sgt or setting the fields of the dma_xfer struct.
> In that case, encode_addr_size_pairs() will try to access the sgt which
> will lead to a general protection fault.
> 
> Return an EINVAL in case the user provides a zero-sized ALP, or the device
> requests continuation after all of the bytes have been transferred.
> 
> Fixes: 96d3c1cadedb ("accel/qaic: Clean up integer overflow checking in map_user_pages()")
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

