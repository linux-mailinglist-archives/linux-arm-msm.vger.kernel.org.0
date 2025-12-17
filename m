Return-Path: <linux-arm-msm+bounces-85587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB39CC8FC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 18:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAF1E3100D2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85ACC3A1E9C;
	Wed, 17 Dec 2025 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TERg2u0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ggn2it5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E690E249EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 17:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765990849; cv=none; b=XEC3fC/dkEKoxgx94zrLUmMHQCfi3mFGLJx6wH7A4GbXHznvJu/4WxfeJD4rerXBbXg8FYqCbuzuMLK+qPqhSjn5so+WWXar5mmBtxT6LXzljxgO7RqofS7M9fEJkHU6aodhXrxPRKUk/b8/iJY67s2CeaodugC6jzr/C9m4cHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765990849; c=relaxed/simple;
	bh=50cXstabLLDv0tQ75py3Yi99TfN4dPiMNwiTTB+OZbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHABiL4ZVat8wMIZ/oNAsDgI0GgJ1PaBe4m3WdE7RoHH5DgMtYvJw9OsLS4uZwf0nSRwtjgHYjciGrF8IejXHrVUVdEw8fGs8gDvycGXv8vqIr6MzScL+lLlcF4AJgZ0xX8pmx8ADzmVEtFhER2cfvPkvhuT81QeVuTNWXZhoWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TERg2u0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ggn2it5Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKoB13048732
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 17:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KWbg4cEprAL6tbzRGjL9+xqV
	uqyLanKByFg/JRLwR6M=; b=TERg2u0bj6PrUmuKgVZdfEaeQJ8pmhnPMdQQlfeS
	+W8KSU0IZERpDas31pR8YbVxdwnkA0omZVXbRFt4yIxclzHPGtHR/YZvOla1Bri2
	+HmcgVx5Q1wlipRbmQhqutIk8XEFqsSLFaPpGQG4gnapCInxPTbeNLsPb9Qb07Mr
	dHaCmvSFZsBZ72mkprLf6RuLYrlpQkExLIW/AWttuZJAEDcbsgjS+lyy7mVZiBXN
	kXnLOif9VDhqgE+nAF5Bz5vSvtR7xvD2vKgdkOlHqrAwPEs9L4AGXQEQWSJ2YGtm
	y7H3ahS1XizTOtK755jY3oLApQz/LoopywtA46kPSUe+0Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgqatqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 17:00:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7f89d880668so5489132b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765990845; x=1766595645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWbg4cEprAL6tbzRGjL9+xqVuqyLanKByFg/JRLwR6M=;
        b=Ggn2it5ZoDyIH4e9BxckclOBDhbLBAbqznse1/Vt1hHf3fiQgtR7k7POQuzEmWtLXB
         GGLpmgWc0gzSphzyrlbmCnk37V31lttZ4GTH2upUsJpeauywvk0AiaFgrL69O5aF8eJ3
         +TegkgYcdWaq97UnbZ1UZvnpb9jrkceuOqyNrlkGm1LEq6EJUqgKlSrHTK2ZDkrOXjoL
         p6vXUMpp478vWzNy1nEVxwzDS+zT9v2YF+LvI1FvNYZUhMxYlTjY+iHPZH5IYg2mtrxU
         8I37Osx66CJ4jkvpZTart/ItnrcFq/pKh6fmPjdr9vsdckj03WstJseOQATS6CjbhH/J
         ULlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765990845; x=1766595645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWbg4cEprAL6tbzRGjL9+xqVuqyLanKByFg/JRLwR6M=;
        b=MAoH1EhPj+UW8+KjC/LodVJgFmmgihbro+jsTSUhk6Qs8Asdzrdga99bRdwRSHE9Ts
         RO+7xd5WT464Dt4nLGUq7vuiGbfdjN7POlI/WCi5nD8WMPChY5un1xvOfOqHfaE03/cf
         sEx+qyHhurHlooXCaMrx9i+22ZrtwBgQjkTjTLn0EGn6FK9++Pp7n70yA4pwNCQ6n9uN
         wg1fZmoMj7zKeVpDyRPQxnTmYoQq7mP2oEvKnL9Vrf6AEI5NMkJZtKBaDZ4hKicR3f+/
         lIyijNs5eq30pnlkpSElzlhq1aVpEBKlGD4/oMgfBpPpFZtxWwE/GCzP2lW0w8ulN5pC
         XM8w==
X-Forwarded-Encrypted: i=1; AJvYcCWzUvt6UGMCHeqoGcj+XR4052s1/owGZCRztEOP5BI4YPvsdvDra4DwMQKfgvm4fWHdNInNfmp79UM7eLsS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc9ke50sRnOK+p0sZMCG5DsI8zBe5lhVT5eOUXCg2jxnBP9vlX
	3T2LqN+Li7QClU1kInFpxwIGKvq0UOo4OvKNSjJsmsen7pBKhJd/eqNmXdsvoC3KxpeEDUFS4Xl
	gaj9DqjRB99Hkupycpe6zMAEYHRWS937y22pDiAsGKABK+jCb/Pndilpui1jbfHQaDsjI
X-Gm-Gg: AY/fxX4Qgh+T6R8VRcPyiPyrNfEZfZ/eD118oA7XuUADe5MpcwNiktygC7DUPCuThXJ
	huPVKEvhSFdkZv55UCURv7bXA7Sg/vxSeRM9wQBVZ8HONMrRrZfVO1cTuLmhrthFY4vo2GWgn2p
	bo3Xszu0mBYGFNwsqL8uP42dj+ydXHmXP+MKJ/xrLUydp/Fy3T0AmWGHF58bhGIdjkPXnTItzrQ
	rNcVcel5xzL+wL8hjAEYBycMFjv6ObzSAm5hB6oWAcFDkCBtuSR+tbYhTvuIySxPtTnO03BoCFD
	QAZOTaPtPmWCjdJiB85N46aHt8OczQ1jCdNP7Q1fnMDjPRhrb8CGBw+Gsq5FgYQA7WzgDHeyo3M
	Tyrckpz9tHj+pdug0/7syE+7TZdo5YFPL2a3y
X-Received: by 2002:a05:6a20:e212:b0:366:14af:9bb6 with SMTP id adf61e73a8af0-369b03d1690mr18844689637.64.1765990844139;
        Wed, 17 Dec 2025 09:00:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsNG8vssGRUFF+u4ehkR83bJbneG/nc86HdOke16PCv5ssNjMhEmyzTSPrHZmqQ77JwNxnQQ==
X-Received: by 2002:a05:6a20:e212:b0:366:14af:9bb6 with SMTP id adf61e73a8af0-369b03d1690mr18844532637.64.1765990841960;
        Wed, 17 Dec 2025 09:00:41 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1d25e2a8cesm16222a12.2.2025.12.17.09.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 09:00:41 -0800 (PST)
Date: Wed, 17 Dec 2025 22:30:35 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v11 1/3] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Message-ID: <20251217170035.mo4m4jxvzqvql7rc@hu-mojha-hyd.qualcomm.com>
References: <20251217-multi_waitq_scm-v11-0-f21e50e792b8@oss.qualcomm.com>
 <20251217-multi_waitq_scm-v11-1-f21e50e792b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-multi_waitq_scm-v11-1-f21e50e792b8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=6942e1bd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=M0ZQwVuGFC7C4G7xa3QA:9 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzNSBTYWx0ZWRfX3W1W47LSoKJa
 Je9ViYAgAZpHYiABNErQmy/q1RktGnt7ypseUJvN6nogmdAST5Eq3Aj+qn+4uySM4tg/F9uxTxL
 TpN3st54B1ItV2QXwoWFr5905BpZzJOSXrLBvZHo5f1zosyMhYmy8VlDujTwt26WZoyj997RwGt
 cgDianvpzBhwyEFK0pFdFdV+3WQo2QPZVrC/B6OuHgG3qM4w/mVASVrjuzAKfoOYa3LCiivvQjG
 g+/sF+NxHd7ghFmQgOoamV+40EofTZqKU6+8sVoTLsqQ870KOTyTIkjmCIYFJeJwA34Psy2FsEX
 xdL4UFBDA9XRPje8u7/zAlTcZUXbvVK0HUXeltNqUMs1o/8EUNwM97LWMKNC/qVQsh5U386/3it
 lpMzOzqpqXeT9l43iumcwgEUYZYvig==
X-Proofpoint-ORIG-GUID: ff8HDheU_17hEvcYFPeXrbLhycCmTfza
X-Proofpoint-GUID: ff8HDheU_17hEvcYFPeXrbLhycCmTfza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170135

On Wed, Dec 17, 2025 at 08:04:19PM +0530, Shivendra Pratap wrote:
> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> 
> Bootloader and firmware for SM8650 and older chipsets expect node
> name as "qcom_scm", in order to patch the wait queue IRQ information.
> However, DeviceTree uses node name "scm" and this mismatch prevents
> firmware from correctly identifying waitqueue IRQ information. Waitqueue
> IRQ is used for signaling between secure and non-secure worlds.
> 
> To resolve this, introduce qcom_scm_get_waitq_irq() that'll get the
> hardware IRQ number to be used from firmware instead of relying on data
> provided by devicetree, thereby bypassing the DeviceTree node name
> mismatch.
> 
> This hardware IRQ number is converted to a Linux IRQ number using newly
> qcom_scm_fill_irq_fwspec_params(). This Linux IRQ number is then
> supplied to the threaded_irq call.
> 
> Reviewed-by: Bartosz Golaszewski <brgl@kernel.org>
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

