Return-Path: <linux-arm-msm+bounces-76106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DE2BBF29C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 22:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D324A1894F83
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 20:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996982550A3;
	Mon,  6 Oct 2025 20:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4eG8C5D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10931846F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759781684; cv=none; b=h7pJzLUEfkyYk2yGSbu9jegEupmZtXegoCDC+qWQNY6A2jr5Q8kmjl8M5Zys7DgsRi+uN4Qrbot5oeF/iZtXZggQVJHhhAeVIj1wwDXwVLSRqh2D5ttYJvBIidYWSEDvYD1DJsz/Pc1/MUWZyCikls2rxbHsexDx4WukxZLW8vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759781684; c=relaxed/simple;
	bh=unEZd46w6pcU6IX3VINjSAYlvXxSw16jXnA2/y2+cMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpCr6TNfCisMfTHG6lvS9hT+WTXGS8lfR1Kf7h5vuERLOF5Dx3JsEaJwPDPNWAKuQc3TXNNYQ95+Tffj+qWMxL83ukK1M7tNgbnGMk25Ofb4hsxOTqZpyABdA2kpwh8BrEOcPtPBFHxxfhwvB/hDddEV7K6rZ8cnBz+z8EeWa94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4eG8C5D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FPUt5026735
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 20:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YafftRWByjLDaFGPU4UHzyU88JZd5Y6+rQcB/WOpZU4=; b=Q4eG8C5DypE2DTt7
	Bc4GnsGjFuklJUwlxMUDbeuWMYMlJg8+s1LJnwyqKp0gLPWbt9IULqaZJC3A75BD
	/jds4cD8tOoIM+Dc66lAQrXBvPGrT4q9flm1Y4rLKE6GoLfV6Yq45XW7x1MOKjFb
	nZ1qfVQrLXubjFna6WJYDI2rPFFofAxLN8Bngmisu2ayOk3mM/m6jaBhItNAunQW
	+XxwYHUypw1vK1Hvn0cjDgNosTp26QrVh2CwFBcPg9v0PM/Ix4ZFd2YxDxXUOTnA
	Ln32E/o006on6A0+uiw1GyIX+epNUrlMBAMka43Xt92DBoZ/LV5zxNV4gpTBMbuN
	nrGcqA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0grv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 20:14:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b62b7af4fddso2424644a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 13:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781681; x=1760386481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YafftRWByjLDaFGPU4UHzyU88JZd5Y6+rQcB/WOpZU4=;
        b=h6hYhSBmORaz9fOPpX0R2CI4LvoA38N1RqNJm5/j6Ir5IUFH8zbFeWQGdVaogkZkMy
         4QKcWAvyzvjDRGMVH3k+KQi/0M14fxxdV5e0v3jDf1Vd3FeUVr8K7JO3bPCTPMhViCEW
         5/nAXBBU1RFkpc37QDbrNlx+IzUUaMlmFQFAcxn+v5bw5zO+ur6OR3/9EQ56CLJ59vrq
         LC7xK5HPYSWoHOnkPkLko+iOWhnNgEYYIm9afQaI7Tu6ZeKdN14zM5cH+CSLm+GMpysR
         FMAqku3a+FyYX6CFzb4EDuF4/zYp+BMw0kgeMU+qAVS18amntdx4g2W07/feQB8Otbof
         Izsw==
X-Gm-Message-State: AOJu0Yxt7nIgvOhpzn1Zzm6bk9o4dOwlgYrewv+SK64eS0ymxUq1MJ5I
	pfMP5MZ2cNpwW+BcdJQH7D9aN8hsYZhfZvICx8sem73GqW5l7WczmVBhuw5E4EOV0UHNJPCk1or
	SZXvYNq8LCFi5mpY6+JSxB/Xzr+6xwC1Hxo1+B7zRDMrjBNRTpkfbSltYqkxnOSct6JkZ
X-Gm-Gg: ASbGncvWWHk2Ur2VIe9Z+/iti2ZxBs0xtMqnzQ2SHG+moKnj1EvH+5QlDl7tYXYljD9
	gYgAejxxsM82FpolST3JP8j1FSCJLdFVWMveeQPVhZeQj7ZDU4FV4+P8EXxKh/ZoCICArCnG1od
	a7hSr9VbbHXSOQemeAwA/WCzNygdPo+SgQ27sHalMpQk2uZBzxvX4RDkABLjQEw/R1YB3QJCqZ/
	TXdVKpZ2R7PPTl7ORn8tpR8mhHGBiw+EDKX6ixu+TBcKNQ6O6j7ZmWBP7qJdEEGQjI5Fkd1fA6X
	l79ICHdvBHhE+TeiFcOdd5cKR2ueFR9HNuMP3Wp36TjaDMLGHFrn+tHZOrzVRnfTdm6iyAtMRnB
	lhG6hirqqyVDMQJ3cIBk=
X-Received: by 2002:a17:903:3c25:b0:28e:9427:68f6 with SMTP id d9443c01a7336-28e9a593d32mr160462355ad.27.1759781680551;
        Mon, 06 Oct 2025 13:14:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMy6IH1KAtr1j9MdJ9iYW2madM3BGB3q4dXxdL4hFhciKoi1zB57zp/KlO68jvuc7tMpkzXQ==
X-Received: by 2002:a17:903:3c25:b0:28e:9427:68f6 with SMTP id d9443c01a7336-28e9a593d32mr160462145ad.27.1759781680134;
        Mon, 06 Oct 2025 13:14:40 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d11080csm141732895ad.1.2025.10.06.13.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 13:14:39 -0700 (PDT)
Message-ID: <1d46a5a2-3495-4111-97c2-b726452d239e@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:14:38 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/qaic: Replace kzalloc + copy_from_user with
 memdup_user
To: Thorsten Blum <thorsten.blum@linux.dev>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250917124805.90395-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250917124805.90395-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F0v0izrpc0ZDhwmVLQAaxHcOhLZY0Pyf
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e42331 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=mx5ec8yL7mgqVsH1_UkA:9
 a=QEXdDO2ut3YA:10 a=vyftHvtinYYA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: F0v0izrpc0ZDhwmVLQAaxHcOhLZY0Pyf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfXw4k8w873wmjj
 kXkQp9/8QX5falxwP5JBJufeW/SEVzgZl5FnV3d4NoNCqhd6SRKXCuJyEySnSxoM5elI3THab/M
 e+NhmU9vHVQiSKjx2gWfNUindHuIwbP587cvTixuddbRYedsiJENj8O8UvOWU9CijYJCiMcRhB5
 B5M70pOk3C6DoW7RseevO9EmCo7/iF/6WDDN+zQ5l1SdmscLEIz/rb8y2VNxPcZU8pNgdGZ+gBW
 jcahauSLazDyWGJzTKSAJH4Jlwx0WduZVKQ/UeZWjszmY6IyRn2QCE3c1dZrbAV0jzfQbx8yl1p
 b75RTqQuJ14H9V19gOjHnSikH9Q1lznPh9hxZPG6YXAvCJv0LF+PAyMJHdCB7J70ZNtEPAV7FEE
 AzRSXOrk6W28QJP/Ch8f5zwnoSz1EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 9/17/2025 6:48 AM, Thorsten Blum wrote:
> Replace kzalloc() followed by copy_from_user() with memdup_user() to
> improve and simplify qaic_attach_slice_bo_ioctl().
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied to drm-misc-next.

-Jeff

