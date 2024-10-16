Return-Path: <linux-arm-msm+bounces-34537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3D99FEF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 04:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E76491F21F8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 02:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4759D15C13E;
	Wed, 16 Oct 2024 02:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lFTG1QIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76611531CC;
	Wed, 16 Oct 2024 02:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729046463; cv=none; b=q2/oVAoHuKieV3f0Q+sqtjPtkKqD5d8xUMLz7xJ7Eytnt1SrGBP/qwizJVkUyqQfUl3UqBxYxuiixI3Srrr4H6hTKh9yV22Hi5SRvyQ/aSN9BiZSh+1VcwJQNuOHzVNCYWQKeGLNsJtwSDV9RnhYHchyXxE0Gt/IKOXtcqtqDVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729046463; c=relaxed/simple;
	bh=R1/vu6FPwNBNv8jyAsDCVKP2c2G/BCN9tI7X1EJPr+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J0bPObyTpwylMKH7ub2S22w+qCHpsI3raibfgge5eRn+N9e1VzEOHGH34Td+fOeWp4y+PM8IcaFcoN8wEbHO2opqpGoq+1Nj6V+fTRi5tRuIJuw+qfLbbqVD62lBLzMIe/sBGxNI7+yhd+Y6FIZ0YG6QRusujCYgVK6rZKHgiJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lFTG1QIQ; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G2MmeY007733;
	Wed, 16 Oct 2024 02:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=RUUNz2VQU9g5TlKvOxbDM/F4igFjFqI7kDUAxQblPm0=; b=
	lFTG1QIQf4URypGFoikjvZBvRqawGhezSZfDeqQSNueJwcPOf1VtWKb/lkvLUbKb
	vXRQq96JU7NB0LYH8MHAQjtWtiXdp8YMZM9ccoLDelHI+5eWfGmMQtAT1GwxWO1q
	g/3+kuSzsicOE4zxPESVv9gu9Q0mbjLjz6WFLfg0f2eMK3S+XryQ2XIig3YPvR55
	rj4DXd8mzu1kGdkNLt5IvY0W1aD3JVkuPTsIDi71mg4ay/IqcPK9ckQS8OuVWZ83
	F+ads7b9AKY/kE87tGsARohioVgFnRsghrAzhO+4MqRzU9ktujjjNxmJcRF+KD1+
	6vXKmtmKx4EoTNlR8MZ99A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427g1ajgy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2024 02:40:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49G012YE027565;
	Wed, 16 Oct 2024 02:40:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjesy0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2024 02:40:50 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49G2elg9001510;
	Wed, 16 Oct 2024 02:40:49 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 427fjesxyf-6;
	Wed, 16 Oct 2024 02:40:49 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xin Liu <quic_liuxin@quicinc.com>
Subject: Re: [PATCH v2] dt-bindings: ufs: qcom: Document the QCS8300 UFS Controller
Date: Tue, 15 Oct 2024 22:40:07 -0400
Message-ID: <172852338075.715793.14239679166370383976.b4-ty@oracle.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240911-qcs8300_ufs_binding-v2-1-68bb66d48730@quicinc.com>
References: <20240911-qcs8300_ufs_binding-v2-1-68bb66d48730@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_21,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=781 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410160016
X-Proofpoint-GUID: DfdLMPcR6XyUZNix-HC1K0PDCIVjjR7i
X-Proofpoint-ORIG-GUID: DfdLMPcR6XyUZNix-HC1K0PDCIVjjR7i

On Wed, 11 Sep 2024 15:06:36 +0800, Jingyi Wang wrote:

> Document the Universal Flash Storage(UFS) Controller on the Qualcomm
> QCS8300 Platform.
> 
> 

Applied to 6.13/scsi-queue, thanks!

[1/1] dt-bindings: ufs: qcom: Document the QCS8300 UFS Controller
      https://git.kernel.org/mkp/scsi/c/c602a04b27ec

-- 
Martin K. Petersen	Oracle Linux Engineering

