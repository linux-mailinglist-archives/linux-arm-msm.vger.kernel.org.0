Return-Path: <linux-arm-msm+bounces-35946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F09B0CF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FF0B1C21323
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 18:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFCD185B4C;
	Fri, 25 Oct 2024 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZABtq7Sz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7288720C30B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729880231; cv=none; b=iQX0S25De8w/7tDEIlEoYctIkpC/NjPOMbnD5pe+CSS7ySyYyICBNCVzVAjsYLJgIlk1Cc8G6/8raG0yfMKUaU1eS9ZwREXkYmipZq5FJx4ItWRxuGJT/qD7MvrjeAJL/Y7V4opZSRPr3zZIBnTaMMPn1LYBLu2Ih6iUNZFr9q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729880231; c=relaxed/simple;
	bh=CLS/iIPGDJE60av5udYuI/xjQzJ7unxdzp+4M0UFoyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRy8/VdgnUqNoKQYlAnfMDuV+uhqbiUAYEse/yxfT5zmbzhh8nAeTBrj7HBb74ccsjFmSiSg0rrULRgc2oJo59bsvAtyM+TQjPSKzg3Ivq1yzcgWskYbTbocp3D85XsW5TGb9BBqaoD5v5FCbLk+d9Nwg4Yi/yyU7Ama/jriARk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZABtq7Sz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBPOdV026083
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSJlO0TfoNk3Ycf8qBZrvMLnGxcnluZFEUKQHGyj/j8=; b=ZABtq7SzlRm1k9EV
	uprK+tTiR6xL0H49FF6vgr4ymQ6KhebJC4QgT1Vp/WBkutonRsik3ozfKeVpEPw/
	lS+QZGBx0M1NSIB3noFVYletL3I1eGj75kXptq63yr1kCytujaos+BlGK56i7u1O
	fRMN2W6KKXukNjmYNHfcFsaVdrl6ybPZUnaEslp/qtu1SFXNgaJOTH74M7azW600
	aNKSY7Pty/c7XIaeyCFC8xUBdMdhdvY0Q6pKVrN4ptyhCUqkEF8mBTFAjBBVml0W
	dVlJTWAi6xK+IItBi5uH/t71j3dSVIV0bJP/9qgqbtpb03B1NigNnBcNuB21UMqV
	GEzVWA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wt3mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:17:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbe993f230so7137986d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880227; x=1730485027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSJlO0TfoNk3Ycf8qBZrvMLnGxcnluZFEUKQHGyj/j8=;
        b=sa6pQ6UMNV3dOahx/elzQKL5M922HXRV7+S+LB3biDV9BV48xGSnQG8LZVpOy/h01q
         TLToYtJAlVgz4OCi4Q6Tac8NrRkySlweNR7QSPt5H791mzdPTDaqaNrk5YQybRbIYuPo
         RDklch18coaB7NYo2XHwSb0uAwob8GZ9uujhdiGqNE8ZQAmBZYQ53+XyahxnIJbUZqQj
         c6p2NMkV8vhPpkjtYWCjUqpwzRJhL9/gBVSSz85p/DWmGKefHkEH9UcbkPJzrJzhU8iP
         Yjpn3S5mJYlYs22jDSDBZEKhT2RQqfvmPzNBfI9lilSuYK0P2Nij84n0qStEoYaB78d7
         lazQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQDlNmL9Xla58uYO6T01UCwSvqF25a9AA7V3/q/cy8z4RKf5Tb5JveJzFSAQV+pRBfzx5wbBqLp8Sb/R4v@vger.kernel.org
X-Gm-Message-State: AOJu0YyHLPd0RoqS6Cm8mfB6/M1CeWqWRh6Oww3z80sFJgQU1AJwxjX1
	eaPZ2rynTJYSlhgmbEjyaUsDgFGIiWL2NpOikbj9R0ULKQep1zKBx+T/bA4L4SHo2a6HlPIyAXL
	ve+tlnsvPUa7ZYqIEcvjdBLGdLeqVDI/4MbbwTV4/byRyN2ntsEOxE969IifSMWIX
X-Received: by 2002:a05:6214:d45:b0:6cb:c6da:5fe3 with SMTP id 6a1803df08f44-6d18567a31cmr2484756d6.1.1729880227482;
        Fri, 25 Oct 2024 11:17:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8+KqX0qE5evxjRaHUn806H0k1eImIZc7s/QW9fbWd1DSEaL/b0S3oNWR+qh1FZINISLpdqQ==
X-Received: by 2002:a05:6214:d45:b0:6cb:c6da:5fe3 with SMTP id 6a1803df08f44-6d18567a31cmr2484616d6.1.1729880227230;
        Fri, 25 Oct 2024 11:17:07 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a081d59sm95061466b.189.2024.10.25.11.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:17:06 -0700 (PDT)
Message-ID: <333948f0-44ff-424a-8d38-5fba719d2aeb@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:17:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] dmaengine: qcom: gpi: Add provision to support TRE
 size as the fourth argument of dma-cells property
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-4-quic_jseerapu@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241015120750.21217-4-quic_jseerapu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1fruJDY9MVJBVmKaz98rBCWZYWazhSzg
X-Proofpoint-ORIG-GUID: 1fruJDY9MVJBVmKaz98rBCWZYWazhSzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250139

On 15.10.2024 2:07 PM, Jyothi Kumar Seerapu wrote:
> The current GPI driver hardcodes the channel TRE (Transfer Ring Element)
> size to 64. For scenarios requiring high performance with multiple
> messages in a transfer, use Block Event Interrupt (BEI).
> This method triggers interrupt after specific message transfers and
> the last message transfer, effectively reducing the number of interrupts.
> For multiple transfers utilizing BEI, a channel TRE size of 64 is
> insufficient and may lead to transfer failures, indicated by errors
> related to unavailable memory space.
> 
> Added provision to modify the channel TRE size via the device tree.
> The Default channel TRE size is set to 64, but this value can update
> in the device tree which will then be parsed by the GPI driver.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---

1. Is the total memory pool for these shared?

2. Is there any scenario where we want TRE size to be lower and
   not higher? Are there any drawbacks to always keeping them at
   SOME_MAX_VALUE?

3. Is this something we should configure at boot time (in firmware)?
   Perhaps this could be decided based on client device settings (which
   may or may not require adding some field in the i2c framework)


Konrad

