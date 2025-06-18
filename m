Return-Path: <linux-arm-msm+bounces-61749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1AAADEFF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 16:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95BB81889282
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 14:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB312EB5AD;
	Wed, 18 Jun 2025 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nccYx1e0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915672DFF3C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257695; cv=none; b=aDISPlaIbO6RdkfUzkADAElmukjTRwSlECiLvPQhtvzv+YOXOHt1wcIgwVrGcZ+d+dza6C1NfgNl7Xn6vIGv9fE9T++We72gEzdSwysFEu/CqPKmTBNMvAah0W/ByJY5uJJj+87xkSKdmF8pe7FNDrjdk5LGglp9aOgKoOXZ+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257695; c=relaxed/simple;
	bh=+/kUoxpwy+yvBDT++5o5/YrPxXFnUi+BeFnYK1qWQvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUhsQBzLzFuZ2t2per1bvn/8M9HMScZWHd9DMWJ7r2oEpHS3FtUlURO/+h4OU4NU9ZjbWOLKDrebXbjT9/+9IW83XZ8MvGo8S6ytkuirDNumvIMHEkAUPFMyiaLY9iVQPmJViKnJ/enHXVpV1aUPecCXawXzZ2E/61vQu25eCcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nccYx1e0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAUgkY022469
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 14:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdkjN7cQtXvfbdtYqO2/u7xrAMjNp8r9I5gqRta1Kos=; b=nccYx1e07IQHOsLw
	3n0rbXcDloPJuBMwJrU6efqHyKIThbaVupKDI29g2NCgYowrgri6erfjm7Pt3HRY
	LPTI4ckHVpPcRXeFTROyLurlpS6DezZLa0RsjLNPoGbXTLnShzC1FbUgq9JbpOq9
	bCzPVKpCSAvwbM6GkWC70iQRpzGy7B6+9epoGY2SXJK6UiPIu/9tlDH3LeAWDOdt
	zJ+UUedO50PlgLwPT+05XYT+RIMCXGsKXzYfVUatWVraL/cV4utRYH5AwJ+2aqUT
	f9csXbQKjQy2seFAKABD6s+I4Q8zjBMWxNRlZ9yyKJzg9TIEZ0v+ZNEigXgvuPwa
	53OQLw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca4m1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 14:41:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so10951293a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 07:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257692; x=1750862492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdkjN7cQtXvfbdtYqO2/u7xrAMjNp8r9I5gqRta1Kos=;
        b=bSAj8J/dasgMjEa8HLOGFH0Ib59lP0FyP+h5TM9lSkS9BLo2/oDAfKsjxwn4YRzh/y
         ASb3axslB78Dkw7mqezowagiKpkrpoWkSRrYl3vEQ2VPz/1YEvVKeSM0Cnvg4y5S0VN3
         WUjDPpwm+qk358QyUa6s4H/a4CuBFk/112vWMBTm5E9qxaMXA/qcf+6Q0gvDAE3SIQgl
         uRAKIKmPMTuMyLAnJCjlwdfPnzWmj7C2TRs9s18p7b1knXXc3WPxYFZ3WsulimSkZgzy
         TCVsr4nOVxsIUrwplVrwt/LcllwBcCYuh/7Fs7sTaxnCVZ1pwb/s0sIsJ3w1QVpb1z72
         CKnw==
X-Gm-Message-State: AOJu0Yxrq9p9diGt6aBWVf/XZmZ2tKsb7UTGQDL1nVzlkyvWEmvvI65O
	5gr7Sa8BSq/iwtdQ5kYDeZMVMrBIAErVk+WK/KSX//GkoZb2WKePNX2m/ZSCFwts+3FZZabv7Gc
	K94AtP9yRiQEwNurv8qtz+UaeWzRMNHBNkmYaQwMO04nElsa2mZAuewOKQhJY3IAneeu5
X-Gm-Gg: ASbGnctB9WSnugkUCYGioBbtZYrKK3yOxYDhXnWNAypTrUYWWbGyUaazo1FUTJmmv0h
	mUHPStPzfaCXQR053StKAkuVcRv5QWLJ6MiDMNW108EAogBZwfq9IgzjcMY6q5yZ189p5mSz8jD
	tNqV3kGysnZ5Lv4lxS54rlL7IfiZ9gUm1rtMaoZMLIthFbqxI5+Ez27G31zCKZz4HpRUZnL6A8H
	P/JgMpCjDoHAYQR6GhKhxEZzGb7PnqqD3IUKl2ysLpw0G5cocQka5mQxwzPDTnfxnK1g1Elp7fT
	ry0UudgO/5Lc0FjHZVLxktQN0C3lHrc/wZJhqtOFwrxaYvw1PjKfp+4UeyLZ3m48DdBm+bDD
X-Received: by 2002:a17:90b:524b:b0:311:ab20:159a with SMTP id 98e67ed59e1d1-313f1d1c00cmr24251108a91.29.1750257691683;
        Wed, 18 Jun 2025 07:41:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmA2bW/1zuZ6NhOSuWKpqZfn21PWtERB2Y9DfGzXkHDK1YYr282G1Ivdt6vHyvyU6L2Njbtg==
X-Received: by 2002:a17:90b:524b:b0:311:ab20:159a with SMTP id 98e67ed59e1d1-313f1d1c00cmr24251066a91.29.1750257691162;
        Wed, 18 Jun 2025 07:41:31 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b5efa2sm12826992a91.41.2025.06.18.07.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 07:41:30 -0700 (PDT)
Message-ID: <8c969e2e-e1a4-4c53-9a83-b11debf3615b@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 08:41:29 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Make local functions static
To: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250617064906.14079-1-mani@kernel.org>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250617064906.14079-1-mani@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Nl8x8pKtVDhoQaZVTtYYiXTQg_hboVnG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEyMyBTYWx0ZWRfX3kRWxotACrA/
 Ym8f0+gcAVCfTz7xt+3zpQz4uPsCbmbtZ0ATc87IcjTVXK/Y9q461spGYVT+NQekItWEFBdjz+i
 9BVmihr7Jtk3t5pvRoiuvZ5X9Z/AqU8BnJYXFRp/7848J6D2Wu5OWimv63jEeOUrw6MwCR6jik+
 NPcapndeF/Wi+CEIla6nts24pxttUFe6VWs+Ycegh/fQvFv0+KecuqQCuc9YEZZtypH/oLqok7k
 2gxkdiR5D554M+fmmZ2ItKdeU44b7TAKMvi9wQt6LTWMD3nVWXHDFRVBa5VingYa8wqs1Tx+pWJ
 L1+76Vfu05k1KvcH+N6ExJlybkaDxwRUdgEsbQsAMWsholMmMVsY/9qgCHsHTCikqqVPz+jCzTt
 gtC5XJfBx9h828tjVpBonL+voA8V926a6fQZMUzQxSVK3dQ8Q9UyRQ9OIZC9NloR4HSwbJKn
X-Proofpoint-ORIG-GUID: Nl8x8pKtVDhoQaZVTtYYiXTQg_hboVnG
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6852d01c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Bs19kDPuFU4Rk2GLDhQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=898
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180123

On 6/17/2025 12:49 AM, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> These functions were not used outside of the file defining them. So make
> them static as they should be.
> 
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

