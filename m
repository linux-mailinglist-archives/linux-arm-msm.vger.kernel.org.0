Return-Path: <linux-arm-msm+bounces-62708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E15D1AEABD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 02:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94C42562AB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 00:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06A3D2FB;
	Fri, 27 Jun 2025 00:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IToItY4L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0322BF4E2
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 00:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750984994; cv=none; b=nDzValNyajl5QBrAZF3n6BFgYrzdnKAINpvyI5Ol5QjlEm5r56nrilvmIMHEsEJeMTx/5VcJsRiFfQ6gEKkXthHf/KcJs5HToBA+v+OiuyH8f1FzdBi23jfdwEUqrDSY+sQ1rgFX2QWBQELoglhtEMZw2u6jvcbwN9idwgtf5mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750984994; c=relaxed/simple;
	bh=RxhgcxNVID0sgf/oC6xERaF2gkjuquriALvaig0OY0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iinWpPyJyqagQRTf3UBOK2Wi3/XBCWkB0dIXDai8CPUczYgN+9Ybd/D5OtvmdlXK8VyQk6JeXKUXgWaW/JLy19/ufRySVaasTLH5thoKgFaREyAqMyiUZq6nweh26IXi5zNTcE4MIwUZynSmTTmzf3NEfOPFOfEj9b/+pszdCLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IToItY4L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QHxSjI018662
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 00:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxhgcxNVID0sgf/oC6xERaF2gkjuquriALvaig0OY0A=; b=IToItY4Lwzj1s6Kt
	h/IhEoakhEmsSH2F4muogJbU0iEA2QIZSJp4GFYOzx28PULeMwbikjBBDbFQlxOn
	WBd4xhB75QgL4tZtiZo+aXu33HyMrhIX//51Aq7Y5T5N1uxDMndsTsxrYnNY6qie
	IDb+isz4IXvJGZj53FlmEQzj6dqSCpuJ0+BugBN6X5EuXejtbN+UBjr9+KejVkGc
	T2kM2iU9h61Ca2fUpSvYPUHhNJISa2D6LYcNaGLoLqphqT3Mnv0xFAZdNJPzdD0X
	ks0t4jP746Z0nN3jltcYMqtI8C/xxWJHxwx2B7Z39htoJIrcgfIKcqb4Rk1VXnYM
	HTSeuw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26fbna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 00:43:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so3612001cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 17:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750984991; x=1751589791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RxhgcxNVID0sgf/oC6xERaF2gkjuquriALvaig0OY0A=;
        b=kRxJTGm/m4ZQWqpcA2LYkS/zghWuhyztS2Sefavk22jU9uv1JsIBkQKPNW2v7uCxbo
         YkNNkacBhmSI/hQUzoGrC+nE76FPwFAzqVTQ/TcmtqM/i2si7glTwI6+Y+fK0Jg9jUm4
         7stSwwPqCQdm7GzPgymw5nAxR77Q2tST0THTd5NZb5hUo3spVeig0bRs6YB7ouu4NJcR
         uUr4yzaehOackE4VO7o/o6RzFNydqPjRQtCBiCzQVf6TrSi0wZ1Q7rE9aM47Mpd1gGf0
         cBGH8avM66OcKOsWoD7NkEUkSECK+L2pg7r8Ico1cELoRQPjVlw+a0bG7Z40IpcaL45t
         GyNA==
X-Forwarded-Encrypted: i=1; AJvYcCX+XG7xJ5Cqhsyrvk2FGHOOms5ie1TwwryuCDX9QYdhykF/dXM3Kq576BeD6jQjo7kUjfo/A61AvYexIpm+@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfNGqsWnSSIO8SVWBxoNgSXyBKyaBy7X+Sd0K987RcaneEXmB
	Ky1gaiYBizvAm1vEdAqS7lQPelNOutHeUQSCNLPkQQGEKh9EITS9rah47Kmnrp4qZpejBgj8f4q
	ExyhrET/+jG25dLze/gAx2VQc9kFZ/fRqRVd+ZdGg2uh+f10fbCkxZw7r8dzFjK1toId6
X-Gm-Gg: ASbGnct8JHjivi5sDc1QsiICCUWhA9/JiNwiyhfEVTFvohE4rwkFVnfLAaZkdwZcy3q
	vnfCkviqCcCfaUas83Y+A1MplK1Y4K4lr2fgir8RWJzpfC88JFRQr66PaMLw4WG3NWbMWlZuAer
	EqDGsm9vE0Q2+eDklp7qsOurg0VLTiqoF+c/68OVshYINd9xp4b/SyDEHdlmwB/wdDAbv30cyWS
	ym/rIt00ZJH1YOvwfWXrSUuAZt2A6fOIHIXfpMtI85XhUqg6QNxR+cVXkryFbk5d7uE2L8SFOvv
	lffzNRJKxkmV6ssDXhLu67XTH9Pg6D48yQNiYjlYJ3gFCasvAHAGfdEENS5Vcw6FkTYhf2kLctV
	klvU=
X-Received: by 2002:a05:622a:414:b0:4a4:35f2:a02d with SMTP id d75a77b69052e-4a7fcaae8b6mr11320591cf.7.1750984990740;
        Thu, 26 Jun 2025 17:43:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKNXI92cpFXVO0lV4wZlSgkD56FesYlOoMlNbr8h9q8T2Ti999UIq92tdwTKqeE/60aWjs2g==
X-Received: by 2002:a05:622a:414:b0:4a4:35f2:a02d with SMTP id d75a77b69052e-4a7fcaae8b6mr11320421cf.7.1750984990209;
        Thu, 26 Jun 2025 17:43:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b35dsm24433866b.13.2025.06.26.17.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 17:43:09 -0700 (PDT)
Message-ID: <0975cd75-2363-44b9-8ae8-b2430799ab78@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 02:43:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Remove extraneous -supply postfix on
 supply names
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vladimir.zapolskiy@linaro.org
References: <20250626012433.261328-1-bryan.odonoghue@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250626012433.261328-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAwNCBTYWx0ZWRfX/QH9v+MjrG4a
 n6eu0EKY9YIL8Fl2DeW7XDe2r0X6GZeXqyP/maUA5Gx/tB1F4MtzEE/73FFhXCF3D7IcJ6aUphj
 CwBRykQ5qO6nSYT//BBhYjgzeVUEHu8kA9025nce9Kie6isV7EBVLv6lRTMW4koEnhxRb3Iia7Y
 /2UOxOZmptMo5L9gijLl0ykvyY+wGkxZ8Y1kiALkq/xyecIzk3S/iqwIp93ajhgucDSbKCbCwOf
 IXZhX1csxMY2TXTHxs7O0A3ms3wFgmqtRJO4zUT+nfa9j+CENi3DtTNBQQx2YJkQRxzPpejEmFG
 ln2q6xIvxz43sdfB+3TJie5czlgQA4izzWHe8i+acymIC9arNXyTRUjjDnB8iI1Ko9bf7XTAgBd
 cJEeI69hXsJN8lfw8pvL7lLOB8sVsAO9uq8Kj53xx+uouAskjsylmA5zX0pEBCw6DYmGHMHK
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685de920 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=OGg3twXR7MAiZJUF5pEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: QLtMWLNRctdWp3gjmZtFWNwt2810yRO8
X-Proofpoint-ORIG-GUID: QLtMWLNRctdWp3gjmZtFWNwt2810yRO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=738 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270004

On 6/26/25 3:24 AM, Bryan O'Donoghue wrote:
> The -supply postfix is wrong but wasn't noticed on the CRD devices or
> indeed the Dell devices, however on Lenovo devices the error comes up.

Please give the commit message another shot, perhaps with "PM" in the
commit date above ;)

For the code:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

