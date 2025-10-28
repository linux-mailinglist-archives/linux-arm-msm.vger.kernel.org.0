Return-Path: <linux-arm-msm+bounces-79188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6530CC14A59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 13:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 378F04F5FC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0412232D7D8;
	Tue, 28 Oct 2025 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4kv3vN2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB18311C39
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761654885; cv=none; b=SFQT6Jc+Prj0Eq5JajWYe17gDrDe6/ta3SeNzk0+m7T+GW2/ubaux+h6guaoV6eX6xwXyHXN24P59L3/r6h/PG/4Q49zE4KSmEiftn08ePw0MG8LpFmP4SKFcTUP9WlYmPN6VVw7NHuvWc7f0S9j9ejgQcDqe3GdFmvHKwUC4Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761654885; c=relaxed/simple;
	bh=KyBNCgzXGkyMfGBWB7EOwo8zzP48TIxps6ZrPhg/LD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mv0p/roIXX6ur44opqFGMiTm878WZW6qojCOmSY6QRwVrsIGLIZ0beVGl6rHh8WzbMlL3p0tFcBJlK7w9KWbSuD4yEQU6rreR7S8IKXd5FV8xzcLHy6sDh9sipIU9jJixZ3PLiD0Jtk3y9+BDOQa+d9eJfUkJ75AXth9zQ62i30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4kv3vN2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S7hbnC3813812
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M95gJXcFdZpIJCFc0EnHtF25lf7trZtvDZHldkLO1f0=; b=B4kv3vN2EwmWINN9
	sZs9ldxIb139BIykET7LxTnr+S3DFN+TiahNLuZnetvaShrB+1nweAbWDRlmGUlh
	FFygzEccaAa6mpG+ifBID/vXi41nt1FV4iGloT16EP6X1ldhBeOF0EREEfA4RgzJ
	tlugQ2aqUlA5uMj7SvQ6Z1FyybpzDhQYUiGu4xfxOdmRTsJ0HS330u6a1u2rW4R+
	MGTRKeL6VR2ld2Qkk54922zb1swUTy5/O/pnpI2YWaR1CQZND4htsgqtr+Rfg8PO
	31Mv5OoQGpxwxZp7gIGNELqdtHGciBJAz2dNH73aROCPkvduq0bDIGaORAUeldwH
	2UgjzQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2g2ftd5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:34:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-781253de15aso11676184b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761654882; x=1762259682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M95gJXcFdZpIJCFc0EnHtF25lf7trZtvDZHldkLO1f0=;
        b=PU46SD2VoygwQn/NQeBQSWOODmO03euun8CBtXzbd+udcdfum5L5zz9VCSZsSNmqjG
         zZCVdBp8gYXTLjhDBwVkmV33x2jB43Ce3KcwDfIN9r7HCc5JPNx+0y/VNS6bd9nzB7Bg
         yaXD5rC3xcU/4cjquNrD0AuLfQZFaXVQ7EdFl8JQSozfF0sy7ue+NToTOIZu5pdmtfcP
         zxikmOy3iLgLCrWZtIMmpFjdXOqS1J9G63S+aApiKPvWDxuiH4/G2y82GPq7TRMTh2yT
         RadQdln5tU1cBi6hlSc9TrmOuyNLhJaFofpUA3E5XT9W0efij2NSeT2fM3gUu1RyCuWC
         Ox8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhL2d9sL/r7nhM6IRHEVrYVI1TBkmC+sf8OG/JITfH3cCim4TAs0pp9CQL6VGjjxbJBb3ZmNaMfxY6emFb@vger.kernel.org
X-Gm-Message-State: AOJu0YzFtIDtyR/dVnWKxlCm/L8BY3KfhshefS//BrAGXuawCIHJhH6v
	tntCmkcQZgZZ8+zLUBBS5w8JsEr2TCyGdRlamFXa7TvgZrmOijbW55V7aj5uEp8n+EixlGWi5co
	kLoNGgfYOkX3aI5xccuoP6pl92giSlEoAi+ZOEFh2HWCMhiyTe4Sfd7WTG4qzKNbSZAtFCE1Rwo
	0y
X-Gm-Gg: ASbGncuKslZd4VP5tAbxkVmqE1e0sO5oH7UyDQohy4eyCAFutZ9UE475FkVU4AYsoo8
	6nHCRZcL8QUjjhxI1wV7UzxryBIhVUCss166/u6MYKYhuuBkDQ/mihxHjzNS/Spx9eSVu0PsB2L
	xQmaSlLYztI+bekTKJYWXU/kXWTWhhsRjVBWxH9nKjiU5FJOxiP1V9I57HnfHTK062YDzSpe29J
	/UiX0hc1PpDqhMLoStFIx0ICVBnWRb9qMxbvypFyXt0gEFDKM2u/0LtNSgWf1fAKo2e8JAWDbrC
	gLFBVOE3KxH4JBH1q4JR2EFrn9axfuhPb9S6iVDQSrhTTidkzJheUQ9qdXlKstpX0jibXRLmjLC
	3qdxFO5Wn4Hd6sy1+0+KUqFYhZ5baArkL
X-Received: by 2002:a05:6a00:14c4:b0:7a2:7833:8b5d with SMTP id d2e1a72fcca58-7a441c36fd9mr4823918b3a.17.1761654882463;
        Tue, 28 Oct 2025 05:34:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDZgEIJrt0gDk5O/GM4oOTTTrpxlFBa6bU7qOKpY2eoQVr68fPqZaq01zJuj3yQEKGsGh9lQ==
X-Received: by 2002:a05:6a00:14c4:b0:7a2:7833:8b5d with SMTP id d2e1a72fcca58-7a441c36fd9mr4823878b3a.17.1761654881999;
        Tue, 28 Oct 2025 05:34:41 -0700 (PDT)
Received: from [10.204.100.217] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a427684bddsm8298102b3a.31.2025.10.28.05.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 05:34:41 -0700 (PDT)
Message-ID: <bb39b556-dd70-ad95-3d29-1e2bf7f45380@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 18:04:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 6/6] media: iris: enable support for SC7280 platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
 <20251028-iris-sc7280-v6-6-48b1ea9169f6@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-6-48b1ea9169f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEwNSBTYWx0ZWRfX3ThyKgdDIAyG
 lN+hyrBKEY4wxXB8wNcbaS8iZ9GMyi7+yU1nNrPZcaflst2ncGE25C6UhPzEEnsy7ooA6zHMnVo
 p3H/bkhDxcym8CPIuAiZeEvASsHW/yBttVlpoMhdaw+MQ3+8r17N5LZBGeA7W6mMaFKOWRgRWa8
 Vx33R8eduiKyRklpM/Kae8e7FIkVzZzFDf7PWPFETvJfE2eQzj3WmYbtVwaLVJ7YJALRS6NeEYN
 pnDMch/kuIfXe7IAdERLoP2hwSNgCj8tugTpfeYOjsROXNCBpYkS6aaw9fPlA0d6Qpe9G8lW1/v
 I2Zesq6cZZA+l553+AoQYlgRFXVWcLBj8PDg8NYhcUkJrG6OdItrZ1Rwk6zRQsGKMJ3b+5vv/wS
 mBkZxBLlfGPs8waDVtX/7iWSJqX1FQ==
X-Proofpoint-ORIG-GUID: l07fQ8kjlvkhKHSkBIFJVtIssZsMUdHX
X-Proofpoint-GUID: l07fQ8kjlvkhKHSkBIFJVtIssZsMUdHX
X-Authority-Analysis: v=2.4 cv=FIMWBuos c=1 sm=1 tr=0 ts=6900b863 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fr3eplbp6RILtt3BeFwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280105


On 10/28/2025 5:16 PM, Dmitry Baryshkov wrote:
> As a part of migrating code from the old Venus driver to the new Iris
> one, add support for the SC7280 platform. It is very similar to SM8250,
> but it (currently) uses no reset controls (there is an optional
> GCC-generated reset, it will be added later) and no AON registers
> region. Extend the VPU ops to support optional clocks and skip the AON
> shutdown for this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

