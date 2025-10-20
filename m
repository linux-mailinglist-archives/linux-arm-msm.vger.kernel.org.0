Return-Path: <linux-arm-msm+bounces-78025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D3BF1DF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8A3E4F1BC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964DF17C203;
	Mon, 20 Oct 2025 14:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFqUAi+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4B91DF24F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970736; cv=none; b=HzXBOPc+15IspfMdFjEte/fHGgPlYkYzB+4QxZbBegnwRt7h4zmPojVzVhp7p/KajsKf+5K4CzbtUBN7s+WqOKp+HvdmX68ueV2UMsgp8TJtJ3Iqp2b0n6J5JvMGy7gStweG+faxPnyrFAabnRW/J31yRmKDXJs71N4FdTNu8hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970736; c=relaxed/simple;
	bh=j54qH2i/WmwpFEt2LcQauxw6o6wQRBlPAlYUavy/kYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfdfY2QXO0TxB0sKJUi/n+G5IjqEA2zPkhAshMir4dM5rtZICA6ASCnTKZFB3hOlCBS6jtH+z1Rrgi7zpr05lAr8kL+k8iBP1cVwljc+f2PCISPtTqpTGBYXlCrrB0u2iyigo0JUv5ICf34t76TrtEJcutmXSlZYs3GFAmjs6bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFqUAi+u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KC4puR002445
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z9XGD/GFWyOwQLNRUGjz4eK7rXcXnETL4d32kW5RT68=; b=PFqUAi+u79dZYAeo
	LOOCFdojEKdYC6KDWsln3euYSFDwYdXiKbhzgoiC9PW2WXz2ucNFRQwh2I6mNZ+D
	4DClCQf0PJQfP9ExIlNgEYyILE9hcieLq1ung/Dvplak428vqFEVlXGBzTDdrGRS
	z0l5u527n6H22e4GsvlOBQGijavT9cXNuieLxCNxRNNq49uNPZ9mFqmdgKnEgB6J
	XyS0sgmozCff839g3U+3RQtBzO4mMBI5m2vOm6ownrPnVf399KTBXl2wokRzkLFN
	Va/vBE8gktLW7R/4/pOjs7r358MsIDkfWznrD6zbDAyRhAI6wk5lPk7xNlBWTJeW
	qJ0eHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469cy9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:32:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28a5b8b12bbso111406855ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970732; x=1761575532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9XGD/GFWyOwQLNRUGjz4eK7rXcXnETL4d32kW5RT68=;
        b=l4qjRT+qji8KOqNJQ/vNmAws+a4pE8i7DKBQBLqKcxPq4EpvhpOcKAv7eBFaK6a4Mu
         9A1PTxMI2a3p+dM6WmKL1KWkvz/xotyRluzWN5PpFh8QlzVRgID2l1KrTIqbRnsJB+9C
         WK33D8xyOJ8sbB1KP3ZN55U9FetewGKusbJYf3neyUG+wDcN2O+3r981CLFRfnbbII5e
         KyzqgzGcWRPKlzIT9qj7GoXREDY/VjpeJXGFInHwWiPg3LuJ6qJc09x0Mmh9U8+zsne9
         CHqWx1MyPk6/RXbvGKgTjhA2harCz5RhYmqv4e0W4xAouBl3AY9esmOP/cZqphPQkbfH
         NsBA==
X-Forwarded-Encrypted: i=1; AJvYcCXVCcFoVlYlU5sH/yxgTKC6I66NKskEGtmUpB1w0dtxvZm6H/i8qu1f/XSnNA/8E7e/TBYdU3ZlCdoyr+dR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe/o2miRpZkyiATw64UHltrYtl6nWQxfOvjFIjU8vmS/dvHJOD
	5WsWXUWyFDc7FFtGFGF0B53R0GJi7MSF4o36ZRLsVPTScbpbhoF9kiT12bfJnY6/UaaU2hmYHzF
	zK0hUWimaAgYkSCFiDcMTejlpQ+remvCxzXToqniN/8EXTLZnuxxX+Fq46jqy1ufr/e4n
X-Gm-Gg: ASbGncva4ZN6YkINn/+D0qJPNs+Mcon1LMJTiO6kNz7/KdwxhEr8QzZh73dC1rv/nlV
	Ze+iutweeoGvLRIvEd8H92bbybQWz0FVSSu1t0xTuoWWJAb0+PGJc2Tpr9ue6xqHJq+NFdVtana
	wgS1XjgJ5G4cMuXyOZexyexJR8fsUURLMw+ixPFcVngjnEqzt6xxqR+EoKcxQmetBGqtRRvauBZ
	BRGSr+vdPFZQJWeYMPxBczNgxvV7JvbyG3TmYqePX9R3tAoEiupmk/EkcPt9QiwR7bNPGB5dvKJ
	V+ygjj+Pkuuhm9tUJGTqHzQkJMJHjCG91YbDnxlVEk8xiYh2HQy/i9MmXGTCQSxD1BV/My5Hz4g
	5CoLJXU4A1Lz8uAlk3HfuItVlVapLrAY50GVwNgJ81DWuOnQrFuFS
X-Received: by 2002:a17:902:d4c4:b0:269:9ae5:26af with SMTP id d9443c01a7336-290c9d1b4d0mr166740475ad.13.1760970731632;
        Mon, 20 Oct 2025 07:32:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS/mIKTl5UbZvn7hMYZrKbCnXYIo9B4gr+dMoKKYxFJoyVou5bnTpWeOCTY5nXHZ5UcoyzsQ==
X-Received: by 2002:a17:902:d4c4:b0:269:9ae5:26af with SMTP id d9443c01a7336-290c9d1b4d0mr166740085ad.13.1760970730699;
        Mon, 20 Oct 2025 07:32:10 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292c6cc17ecsm4797865ad.48.2025.10.20.07.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 07:32:10 -0700 (PDT)
Message-ID: <d161d0f6-ea55-4fef-be40-d4e6f5241096@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 08:32:08 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/qaic: Use check_add_overflow in sahara for 64b
 types
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015165408.213645-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251015165408.213645-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LqNoLv_ZzjIbbXHh_cjhLzm4TgC7yXRC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX6sqiS73KKNh7
 PtrLhrj98wAXX9WOOTMN0tRSQfrBD3odTbqeZ1rCGN0lLZw6AlnQ3FvnsHt0Vj0dZbu/HQbq5Cr
 hGB3/wudlbA4rw8hEnk7G1ljVzmJ7AeraaSNNGXgAzMHkzqEZQMz7ZMTvh/QUZ+N4lK//mNrcvT
 ReGdytb6wNiVl6aoo1WQ1iZs3f60GCmoWJl+gexz6nFXii4dCiRHt4UDOqNj0jNYrw6qFJTrDUZ
 qlg8grGt5Ra5A65AiTKY2ePStffuKrWvBOMHLROdKvKqWmGvJPIq7XyoaUFf1Bm/8dmINGwp/Qj
 LT16xko2i8ELaYSuuUrTN1+LOGtJKFWNB1WKSH+B6i0/canqrLfdYbfBFzBjDeUFnP3G6WK1KuH
 SYXzRqp/VYdFDM9TeEuM9ZA+HBkyFQ==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f647ec cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LcUbNKWctW3TofkTIeQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: LqNoLv_ZzjIbbXHh_cjhLzm4TgC7yXRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On 10/15/2025 10:54 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use check_add_overflow instead of size_add in sahara when
> 64b types are being added to ensure compatibility with 32b
> systems. The size_add function parameters are of size_t, so
> 64b data types may be truncated when cast to size_t on 32b
> systems. When using check_add_overflow, no type casts are made,
> making it a more portable option.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff

