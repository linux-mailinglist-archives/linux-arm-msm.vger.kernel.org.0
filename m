Return-Path: <linux-arm-msm+bounces-77246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB6DBDAF28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 20:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E7133E072B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 18:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3358E25D1E6;
	Tue, 14 Oct 2025 18:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlul6K7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D982746A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 18:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760466721; cv=none; b=uHe4ROuODp4UwsxteQZ/ic+196ZS4m+GWS7NSJl0Zvv09AKl4vMJJ7PQ1DZKy0JhZTwjzgfhMmGLAG12xO3mSLCT0xSpuWB7eyCEn02Epb+QZGdoSATtAMLnts0DIYrS56WfSeLF/abszIrP3QFLXnK9QuhCTlW3bOK52YtMsNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760466721; c=relaxed/simple;
	bh=b0FnpJelvexSgTR3n5xYeSJ9KW/C9PSWw6OiDRoLex8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d483QFtSZXbl+6CZs4TSNw6uYoyxLD/k2bhw+sQyro7SlevUa9pgTH29AjeWJXVKvg8Yga61Zetpu5EE3WWuWJxRiw1Zl4R1FNcN4SA+M+L9kab6df2rUrvn8HVrBbJ/q8W7r5zjgly5fm+2k5RURftvgGZlf6nNPVRz3Z6Zis8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlul6K7r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EG2PQs031000
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 18:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S0juoXgHF0YKeslMGNakmRLxGpZ7d+nHIP0t0vVpCcg=; b=jlul6K7rGWmoJNjY
	37wtxqjCpoGtpku8hm03KxwGM3bdFVOzmtbTGDIe13y2YHy8ufhgTvrkjJGe52/x
	/b1FFOkB//Kdd58DArOjPhqLD/2nCEnhCNpgWOT3NHoO2yyH46VEEbPT1sN6ncX9
	f2HCzWnaU/Jr1BjcWG5D8dhPpEjuDpUCMoTJI5qfOGwORq5KGYYvFwe7h79ubufG
	LCYkW9zyBYwP5ekgK9TdTtOyCGS1d1/VDoOm2m3c4ZFl86oep0hTWS/spumcmnlI
	8lJxV/HNdfZpgGh/uSpg4SB8Z0n4ioy/UWnSyc01GI5dmB7U7McuMfgDNuOiE49r
	6TVysw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0skwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 18:31:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7810912fc31so8723972b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 11:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760466718; x=1761071518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0juoXgHF0YKeslMGNakmRLxGpZ7d+nHIP0t0vVpCcg=;
        b=tD5aid0RDK1IQ/H927jklvrVidlAAVMJnSs50+u4mVXO25ZFF7aykxC08NCwaeF2Gh
         oXsicWEb/34IYA7kZ3zqF0ppmaMcXy0IdvLH9g64x0tHzKw9mheN12see/2ZT7f2k2Kf
         BPDpXIbFen52dvs9cSYEob6yWn33LnMzwfiN3/dMXWuV9pc9c4hfZ3gBCSqoq1SWI7bF
         RoujZZXEYxxf0gSJrzAC/1VFe1ZYNt1GWhqI+tf902cl+kn9VJ8ykS21jaEBnzEDMhQy
         qjXnhntoDtJLTFQ3NpCJUIfe061Z1NvrcHWBxu3XaXjjvHLFBlNTnkrwiJMDGr829Soe
         D/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVnzza/gnvJlGBpB31g6zrem82brjhvO9Jz5XmWeim3O0tKKHvUth4z+oH360eDVc6hPLnf3GFxJW2TnM0Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx02DSG4Qd8w4TOpl7YfPEKDjR1zSdybDehR1EELjllUwtc85mT
	RJGaGOVpypoqHqzFvGnzntWknqk7zogkdfPcwBdBZvLGZz1MGx3XJj+ctv9G0ac5BvkgQnJGsd2
	F+WOoueDDYlkbMNotvq/TxJEl7K/nbd49/UVYgfuc8MDooT4NxsXYVd+S7554KxNnOblI
X-Gm-Gg: ASbGnct1pwVho4N9aaoq4ZA0/7ordC7GkshOKQsgSB80kqNuvcv66EVf6+Ou+i4Kpnq
	+xm4XIxLVNCW+7+5BTmBACXkpeW6Z+aVTArchgUo1von22i1DeravTe8CkQil/MLKjrMrNyI1i/
	7UVIl+kyt6uOoqjSb7rPyP5yTDjsIdVDrG+9fEClA6Y3RJIVL+SgbtrG88aNR66kTLNHS3LqvP1
	VO0tlXV3wbHdzgdcjkMYXGsjAS/DWeQbvSbhSyIgmjtj1Jp/wBuFrpTj5b9eifU+w+erNnHgijv
	sAbvHbD6P4gAzQxI02rwwQ31dbWwXZO0rtj5v63No3nXud0XOm0FqmtHGxTQMmAyfNAuxFN2fBF
	F7LybPgvyAST6Gg==
X-Received: by 2002:a05:6a20:3950:b0:250:9175:96e3 with SMTP id adf61e73a8af0-32da839f016mr33483835637.30.1760466717931;
        Tue, 14 Oct 2025 11:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbBMDL+uw1tU0wlDGx+rVeL6nf9dS8iXtPJzRB++xc7b4k2Dblg7aRiYug20pk9SN7UMUf8w==
X-Received: by 2002:a05:6a20:3950:b0:250:9175:96e3 with SMTP id adf61e73a8af0-32da839f016mr33483817637.30.1760466717519;
        Tue, 14 Oct 2025 11:31:57 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b63e05csm15830781b3a.22.2025.10.14.11.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 11:31:57 -0700 (PDT)
Message-ID: <830edf8e-8cbc-41ee-874d-5ecb6450e182@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:31:55 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Use check_add_overflow in sahara for 64b
 types
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251014170927.3908383-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251014170927.3908383-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX6hEmd99h6EH5
 sCMntZ/Uoo4ZRjV9XhJSA6yS7+EY2NozkidKwk3kq+PkUzIZA0PZu0EaZEyZAcj5L54JO/d+0Ke
 syo7zMLNsBLlCpgDfh9yZqjPX5WEmT2AH6Vbn8Ba2E8N7Mypob0xCaxqZyuTWGh0ykXuJSeNs/Z
 EqCJVDOrbsVGxZ/JH1trTNB/jKuE3yuVKNytsERraGN8swcTmmnKc2e4xRh9lAvfAZoVVacI3Lm
 vEk7BrM3R1jfF9xFgSNCtz5sNgrFV+BvsmlWl1BY9MjMGNDiI2/6WHblyyVPcmBgE44ugKtMHyA
 dHjIESpptINPskA3HZhoTVLkQnaGbXwK5pta1TO/Q==
X-Proofpoint-GUID: V3d7Erf3IFmDmkr863cOYvdudJCh9vY1
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ee971e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GWqr9FCoMw_Da9qovAsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: V3d7Erf3IFmDmkr863cOYvdudJCh9vY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/14/2025 11:09 AM, Youssef Samir wrote:
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

I think you are missing two reviewed-by tags from v1.

> ---
> Changes in V2:
> - Use explicit casts with check_*_overflow() calls
> - Replace min() with min_t()
Fixing typecast warnings with explicit casts seems good, but min->min_t 
seems outside of scope. It doesn't match with the commit text, and I 
don't see a good way to include it without making this patch look like 
it should be split into two. Thus, lets do the typecast fixes for the 
min usage as a follow up.

-Jeff


