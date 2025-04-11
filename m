Return-Path: <linux-arm-msm+bounces-54040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BFCA861FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 17:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3C041B60067
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 15:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238F11DFE8;
	Fri, 11 Apr 2025 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dw2jU6Iw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A462367B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 15:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744385774; cv=none; b=scjQmPjRZTsFjebKLENQKtW3YlVdTAhh4GhhJpfUFgK9uh6RsaDf4FRtZavQzyHAVTe8YUf5CxccCX3pNPhtzQU8X515Qb4tAcmh6DJBHfBAhQoJ/pKc+j+SbI+ju/BMq+c6byl8YE5H4AG/oG97V/aKQsYTIHv6bi5sDDxOCas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744385774; c=relaxed/simple;
	bh=/WEE5ScEJq0P/LsDQLPxL0pEQuguX7tuGeEQLsCV8/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qnh6SY+BhFlabvjddVAvYpCJJ7OLM0pwtdoFdQFkPZ9qdSMsAjdcz/NFM2w4mnI/QTOiJBzXwrXXXA2BEkrcmqqYfz1U0jj99njWI2SvpMyfUgvMo1lTs4rhfl27QGJDt8ZgYCd+vv+9legeqF3SBYbN5djt4Ze+jRo8KN0pXkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dw2jU6Iw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BC8FMM006966
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 15:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I/f0AoIahJfkhGbYsJHUxeRCAL+AbEIMXiMqEigSljY=; b=dw2jU6IwBw8HcsWv
	V6X+RuHQho7kEjqtB9U/r2IyX0wyBhfGTQIcM1ncALCQT1bgGqfhxssnFFUe5qkz
	+A3YxWeX5CZ3lg++aZ/2PtiLD24yg/13X6AFFgseDfXIfLJWN1ccbO0VsTYyy3hu
	MRNqBhO1xT3PHWads/ezeOFE7Hcc/zIHZI3D1sNKZhcF0zWw9/drsjDKFGicrkMB
	Mw03lj5S3rH5aQqebQWSHpIYOTFfZbB+p2FUcimPjruHt8G/Oo4bH9iWO7qmfg6P
	fn9P4mVhUA0Cb3X6zRb/JLJAxWFFrzmOmG951o05WQoKGNJQBBlw805qt1eA5IUI
	6ucU2w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3kuh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 15:36:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff78dd28ecso2484272a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 08:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744385770; x=1744990570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/f0AoIahJfkhGbYsJHUxeRCAL+AbEIMXiMqEigSljY=;
        b=VZskcYqPNrzyWE0aa1G31/nJbsPnOQKYYR2LCcElG4ctUObdsYWSaLHJaAqV5Tg3RO
         tjQ2S6HVmOG84xZNmp3AxLcK0rUr3TYjeDsJ40YAY8qDgDHCvYqXqA4ROSMShB5cli/s
         O+BDK6Rnnz7+0FPJHCKEdXhQmzILUBZEK8lk17Xiq65up2j55rQxyUyiB6exywcJITm+
         amk2XBH/YV1cWk5oB9NyCWYYoAlUA1vylLbwVt5Uy3O0+s2iknVbEfJnlypuacB6EjpX
         VmEMzBED8Q4Aae+yDSxqVCkdv2wloDWLOLIC4cdzkG4fTxGUChjDb2ECC/XpVoca+1GB
         I47A==
X-Gm-Message-State: AOJu0YzAQyEiInHPJ76sbx5LZELvRKSiLcgGa3YGQUivUa7eYdaXIKvY
	QELP/+j7JHOftCAi/YELgV79SpNOQnM9rWBhrGzI4JsrFCG7DvJ3ks443LrGdB8uePRxlim0DS4
	7gmIRNR+epHSIePO1HSvcNw7k4iudNOokFHOSwZmvsB9XlTfJ4geLRle3IiOy7oUq
X-Gm-Gg: ASbGnctPjcBTX2U68tgVuXBg5lQZdcsVzZfa36FWehWF6RGkPXGnz35B34DZeqXcmQN
	CVGl3ObUm9ARfUi1IZAKOJyq1q4uBWFYLF+jnWJyVcpjgPQ5p0IIEtC2/RAFG+BCXp5G/btnrdX
	G7DZWizi+xpyCawSLp8S0IQrwxZcmrSnrzh0TaQG4HbDaVXiAEr3fZYeqs8cT4ZSaM0LIqJNvLV
	OkuCHlambRv7gvGrPL4AfpY5sizL9Krzkll6Y0KiKtux7bB/UBHUPy8ghsbn857mtkRl9u9u6Li
	roX6tv3Giql4dk+Fy0OrTsyL6/cOOfLvPBXljwUHbCmazpeGkUjrJZWR8S3GrQ==
X-Received: by 2002:a17:90b:1f8c:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-308235930d1mr6367269a91.0.1744385769796;
        Fri, 11 Apr 2025 08:36:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7jVoTk0bgA2blmCpqsRfRAq5Raa4igq+CHmM0l5hT9aUMWE7n0pyovhqVx2qrtaLDVK0K4w==
X-Received: by 2002:a17:90b:1f8c:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-308235930d1mr6367230a91.0.1744385769368;
        Fri, 11 Apr 2025 08:36:09 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df07fd69sm5745231a91.17.2025.04.11.08.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 08:36:09 -0700 (PDT)
Message-ID: <16a967fd-a787-40a5-a680-da6cf2c2def4@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 09:36:07 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>, quic_carlv@quicinc.com,
        ogabbay@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250408115237.428985-1-tzimmermann@suse.de>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250408115237.428985-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f936eb cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=HMLxokm-dE5sQ3OGyH8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 1W1nAxHwcl978qUXKES_PdACjUBMy5hT
X-Proofpoint-ORIG-GUID: 1W1nAxHwcl978qUXKES_PdACjUBMy5hT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=748 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110099

On 4/8/2025 5:52 AM, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

