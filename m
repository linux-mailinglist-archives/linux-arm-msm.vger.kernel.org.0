Return-Path: <linux-arm-msm+bounces-43603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3FA9FE372
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 08:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AFCD3A1C9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 07:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CE819FA93;
	Mon, 30 Dec 2024 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zhs9RpKE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AAE19F42D
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735545065; cv=none; b=TbyyD1mOGG3TUIYrI50dcmwyrt5UFjQO5dyyMtrETiwHrf1JkrNv6eZ5l3tJFsUt+WZcCrLD+w7gZazPhSy8Uj53qdBrZdeuC36aKvpac5LWzD9sUVQIu0w9ctBw+zmncGmrE/tVdfiwfAetiT3FgjJst5ndEaMTYGV3pyqy3cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735545065; c=relaxed/simple;
	bh=z8+qun/QPqLHjPWgOxfTIvg6DV88xiKwezK3Sj/y6Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tClcQT/vNhL9A8dbZgC+tag8zoz2TyG1KYGlzC04AFeb3obQZ2+aW+UmfDPwVKzXYtUewZmPkNg5twkJxEjAw/07RLMS1ATVzlc848V56YIp7PeXdkINljx6+UYnlyUIrd2IUVzuOF8eLKNMfENgoSwMx8eMJL0cI3oPfFBk1pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zhs9RpKE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU00CkJ025794
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IIP4QYEQeRtuKFwkCRLYPNjg
	fxJu3vcNySyd6RWA2UU=; b=Zhs9RpKEMTx30Wos/mNJ7Zr9UDxxEXTJ5SgX+DI0
	pL1LBE5M5Hd7dkxBct4jlJs0kUIArM+sPpy0yJN5s9IoD/pCUNSXa6HPstLawOap
	ja04ukYJ6NJB7H3H3aGiu6jIJh1i2ipCllDj/f2DK+eCrAZf+8A5dTZr/kA1ufmo
	PPwpjL4ADxS7hr46K+OgvXU1mQ79yH6fnqxHouXG6lMVOSK3Z48EdZGL9cw9J95w
	d8j6ZT7VYcfwIZfY4+BAlKpGoyhJi238+H2lppVvNxQw5+r6+3E7/zgFptS2bs+j
	AurwVSDR2Ml9XUhGYazTgTbelz7l1sqxqc1qWXlGaDOfqw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43u9hu968a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:51:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso12170931a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Dec 2024 23:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735545061; x=1736149861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIP4QYEQeRtuKFwkCRLYPNjgfxJu3vcNySyd6RWA2UU=;
        b=Fky4LOHK1u6lM4XzyLHpjgF1xl9alU5faAl4JZdSPtGhScc00Joq4sJudU6O21bMsk
         Wy7fTtnSyVuJV4BI45A4qNuFPS9u7NNfHGO3634X14k/mSENfrxzPntcr/BC2Y1T9f/K
         VFPCadiAdZ3RYdYrqOZs/cIVoL8WvrhpDyJhOblLJ0TllPkusKr+U8VjKbBQsRMnQSmt
         oBJqjHh+oROAoMsiJ8s2vLd/GP+ugwacdVvz3wZqg9Bc15p8d7Z+4GzDfvKHp9xoJzyt
         3Fhuj2KeOve5yWIjXGDsAzDTcG9QlCJuQiEX8+luRNi9Odghf1sWdGC+e8eoyar7HWmb
         rcUw==
X-Gm-Message-State: AOJu0Yyi0IqWAWC+/jCjYK29zHU67xzoQSkx6LA4P31Ewb0mxOVGa6n9
	P9AfcjQMahT2J4yZIv3TNWlk2Qn8J3N8nLvgXWKNnNlf63rd7sed8c7r7txPAfKcvv17vCFo5l/
	fmfNoZbWhCZsYx6lbrDOAttngvN0B2M0MVV1rxrVWWcuO5/jvX7QcBO6DnJuU5YqK
X-Gm-Gg: ASbGncsG8spxrhjNK5ZSl1gvwpuku96v9llNpbjbYvalkDuRmC2Ok4eA4EwcbwEi4Sf
	yRnm3Z1jAu+jBkGJDo1yHXbK1yx4j5pMwfgJezzP5gY6BYFPIrj8rK6r1Bhzd/H6XCD+xEoom4U
	oohdGzJSsxJrF2TX4CZz6859a7vGJrGqUi7am4lt3lFbHBuX3eIiwi90HBdGE32wIU0UjGzwxEJ
	FPTA8/LXD6zCAyn2OjNWiKzSb0LLARpP9+7LixZNrwJCMHSdFhusuPe3+IQZZyssB5YG10NcCE7
	9n4L69O9
X-Received: by 2002:aa7:9319:0:b0:725:ef4b:de30 with SMTP id d2e1a72fcca58-72abde2ff67mr46847374b3a.14.1735545061536;
        Sun, 29 Dec 2024 23:51:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBQ3f1Gc5Oyil5dbOsR/lgRIAeYa3cZWqfEdlo5j/49DiXLSRReZ+q/Cu36MODzLkgMAOGTQ==
X-Received: by 2002:aa7:9319:0:b0:725:ef4b:de30 with SMTP id d2e1a72fcca58-72abde2ff67mr46847358b3a.14.1735545061165;
        Sun, 29 Dec 2024 23:51:01 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad835469sm19329806b3a.60.2024.12.29.23.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 23:51:00 -0800 (PST)
Date: Mon, 30 Dec 2024 13:20:56 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mojha@qti.qualcomm.com>
Subject: Re: [PATCH] mailbox: qcom-ipcc: Reset CLEAR_ON_RECV_RD if set from
 boot firmware
Message-ID: <Z3JQ4HFSoIYmc4+r@hu-mojha-hyd.qualcomm.com>
References: <20241230070644.2512780-1-mojha@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230070644.2512780-1-mojha@qti.qualcomm.com>
X-Proofpoint-GUID: hd3x7mIZFI6-wg7T-dJ3UwCBcQazWVoV
X-Proofpoint-ORIG-GUID: hd3x7mIZFI6-wg7T-dJ3UwCBcQazWVoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=672
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300065

On Mon, Dec 30, 2024 at 12:36:44PM +0530, Mukesh Ojha wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> For some SoCs, boot firmware is using the same IPCC instance used
> by Linux and it has kept CLEAR_ON_RECV_RD set which basically means
> interrupt pending registers are cleared when RECV_ID is read and the
> register automatically updates to the next pending interrupt/client
> status based on priority.
> 
> Clear the CLEAR_ON_RECV_RD if it is set from the boot firmware.
> 
> Signed-off-by: Mukesh Ojha <mojha@qti.qualcomm.com>

Very sorry for the spam, please ignore this patch, will send another one
with corrected email Id.

-Mukesh
> 

