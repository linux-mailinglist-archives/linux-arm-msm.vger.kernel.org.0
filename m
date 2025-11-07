Return-Path: <linux-arm-msm+bounces-80809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3815BC4144D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 19:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A31854E348E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 18:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E023376A5;
	Fri,  7 Nov 2025 18:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9Brygu9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0ZWpDbj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9817932E131
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 18:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762539609; cv=none; b=K9U72LL2i17FejKNMDkMpoevJ3dr0LsIyzJYS9+ipUrb8U43s9zG9R2U3eJf3ahrsIwV/yXXH1EAIgG83J3emRsN8wS3+IrT/Ux9p1X0CSnE7oV4osMOnqvYBXUgR8hGME9UmOWqTBNwOEvnILZ9Y4mARiU23q1RspAedRL8iYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762539609; c=relaxed/simple;
	bh=xcLet4h483lTh2iRL1swcZS5C34KdkgrAnjBZDFu9Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqlReaM+JiVVAUmenrddPNxuNV2t9YFJ91okzOSwLVCfpDU33CO9pFwMYxXhTjuJwWfutDyuGiuAiIY6TYIwmKyrAHRGYax3z7+tNS0WYrltTkt+IsRT2KPwH7GWlXl9CEb3ympK42ldcVm+pkAVJJ+iT0ssos9wYodXONyPW6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9Brygu9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0ZWpDbj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7DIHNR2281828
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 18:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FBKKKOY6HcIvB5a6Juec3NHU+NJqetQMMf0kDMtKHp0=; b=J9Brygu9GaDcEEVA
	e41uy+R+ptYjJWj3FfXtAx3dGvpA+VBwNrtjYV7ydh9Gr5WMHHiiQEdbfJaMp8P/
	QMxKapKbY93SV6zqIJdgkXy6qVgdQOD//Qr3RV2U0Kdzsw0zIA3iq3VNarAyTK58
	8AeastUHFNV7BG0lAS3z/GHJ1JdVdU07JaU1rSzuZf+w0NXZCF7l7mehx9U2Bb5l
	ktol6EtjTJKuJXDw6bI8Hj6YPR+XyBtIIjfiC/Dx8nKZAWjC4eFiAVqu7ZJHiiTe
	aJyXyNkcMLqRxMdV0Iwr0VyvVgHgcuvfZObjKbXCqSrFCt1ssai7K+BV8JuZXxe6
	22ly8A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9a9sj6p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 18:20:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7aeb762bc40so886064b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 10:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762539605; x=1763144405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FBKKKOY6HcIvB5a6Juec3NHU+NJqetQMMf0kDMtKHp0=;
        b=K0ZWpDbjJDL2B27lHjzWJHyvClCO7tvLcSSBTOLt0Ah7r7N4FYcfDN5wrww0OeIA/5
         BwDWPKZYFcHGeOm8+m7F1majeIO0qbn58dRakgYfdAEaSBz/18MsA208eUsOtAKqBUWt
         7HR6JsHEY8FvT0Xt12zR1xC3nw3CLYDKTKNYpfVinPxSDnZ/dcMWWSTsQi8Y9uKpcsQX
         gJMU2xaiBuQx4UkDFbyn7jOS9aZOAaujYHAJ3Dn5PvH+mKJIC/aUagz8ew7kls7nIDC1
         rN2sHfbUhru6QBhIvg/DvdqsWZV3u6SFhcjzHT2iivKombr7sFUH6uzAYaEIIWL+XNDh
         jVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762539605; x=1763144405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBKKKOY6HcIvB5a6Juec3NHU+NJqetQMMf0kDMtKHp0=;
        b=TokEmh26NlJQbcdZ7ubC2mH5XsK6yebWTNWDJoYgmbEXsmGMx1LMyrvir3d7uNke6O
         PrtcU5/XrgnQDZbIhA0tHH3nT9E+KqKraHlfq7vtoKpRxlwu4Sop8oyQTDDerkGB5tA+
         R4Sa/Po+6ssBrn03FcTBUc7q5ydc0L7lAO2uIPzLNC/RhraMrGEtOr1EeHTl/xjAOsHq
         yspfaO+qzSavEyCdQqeZ0bqf2y/9TQYqIV1e468p5DeGw7w8LuV58fm92sbbK/7y3c9n
         kDy7ns9DrxzjdbNzn6s0zIfdxeDDEPqLftDeDNU++574ZUjwaIXAg689JzejzfGDYPH+
         BQHA==
X-Forwarded-Encrypted: i=1; AJvYcCXpKnkaX2yOYDxVYPuY2Oelg5P0ZN21GnYwoJizhnqplbmKosKDc8hb4nr+zDKAD9JFYCpJ6+X3V6npSg+O@vger.kernel.org
X-Gm-Message-State: AOJu0YyYVQejVGsII3+na++eG1ai96Cb46fpblblupsW9HXt/0FNe1NJ
	I0iATjQoGrdDYPv3F+ZdLYKa5cpAKbIZH2bhMd2xD0xeO+DnoL5TeU1ZiFB7VB+UW4t9nks9rhB
	pg5G2A4xW6k/nmyI7clpg/ktOkw5PWPcIGLGwU3O3EXuCnADE6iAX75fV47fpt5JLrK8zSXD+w8
	0Q
X-Gm-Gg: ASbGncskBlP5Try/MYOMiBZ9vmmHhn4+WPTTXCgCMbTUW8g4vNCcjz2mOZxA0U0uUp4
	VXQY7HCu0bfoOLWKMShQIlt8dNkYzlYgKTxJziUoG6rKl18gw3DBIiyVHehynRvGiNRb58+hC4m
	K/hyRvCypfKI5vAOjPhjFcxk5QiOVjd46HVkH9rCX4vl6TeWbD5rXk5IoEG7lwK5fef97VowWy/
	KObnpAjgRtVw13Fr8D7IwRFv7iAIXfE9JmlYc3OqEhcvpvqM8FYTNL3+awJRdIACM1BhHQlNiSK
	ygiItpA1AP7GbS6QXoBdMFs+F5YT41INiBy+Ec/3hnZpz6wS+cPvBPR+L2J1K0CLKreqOPQp1aB
	xk6JvLwGiLunscrUX08g+mwRpwr9pbRQG3F6NuOM0ghfEYHKdZ8+f
X-Received: by 2002:a05:6a00:18a1:b0:77f:4a83:8f9 with SMTP id d2e1a72fcca58-7b225aea5c9mr263897b3a.2.1762539604643;
        Fri, 07 Nov 2025 10:20:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEp48slzuNf2xNDfQ7pSwJ8KFhe1kEu7Fg9h/l0QPWqoKufTcN0wnRDUQmOiMOymyCwPYOK+g==
X-Received: by 2002:a05:6a00:18a1:b0:77f:4a83:8f9 with SMTP id d2e1a72fcca58-7b225aea5c9mr263854b3a.2.1762539604085;
        Fri, 07 Nov 2025 10:20:04 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccd5c75bsm3550855b3a.70.2025.11.07.10.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 10:20:03 -0800 (PST)
Message-ID: <98956b34-ee28-4cc0-bb8b-321ac37e6d43@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:20:02 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add qaic_ prefix to irq_polling_work
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andersson@kernel.org
References: <20251031192511.3179130-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251031192511.3179130-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CdgFJbrl c=1 sm=1 tr=0 ts=690e3856 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VFpHpITcvpFWFpzWYsQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE1MiBTYWx0ZWRfXxGXRT5H9XYno
 0c4lcMno7sA5mB5M4sp9+7ObFGo7jlx/T8ypTcN/ob8x0nioxc46etdHI+2lVImE47aYUyMcuQh
 u5ZLsw96pokz1RPh6MnYK5A+XVQ0cTJugDg273zx/9sAqdiCblTYiaFtM5Z7cYcNKBAYj4HENv5
 DRtwdQ4f4yyQ1lJYVJWA/hI6RaIdyImuRsIQxxKR/538B2Nzz0GClm9VmLFXrMzO9ZVZIU9une7
 +6Q5haEzdMXwzICCMdVZ/HG5N0Sk75DiH729BaqY7HVA/jSq5kciZJayIUzPj+BVAdPcVWWhHrf
 E64VQhGEGnhNElQ8CXe3lB8/Dr4egCU0b335z/NBYa9f5SqzeSopW/pbiXoJE+PX09DK/9uQJLg
 Qu6QHecs8hpNBQd34Y+tyvgkyzoo6g==
X-Proofpoint-ORIG-GUID: 8EavB8PQOHAJ-27wSgoAaXQmkgV9cGuo
X-Proofpoint-GUID: 8EavB8PQOHAJ-27wSgoAaXQmkgV9cGuo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070152

On 10/31/2025 1:25 PM, Zack McKevitt wrote:
> Rename irq_polling_work to qaic_irq_polling_work to reduce ambiguity
> and avoid potential naming conflicts in the future.
> 
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

