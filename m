Return-Path: <linux-arm-msm+bounces-49272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC06A43BC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697B33AA0E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294CC265CC5;
	Tue, 25 Feb 2025 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mce3Anb9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951BF157E99
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479372; cv=none; b=k1bU6WcisnHNjgYDEWKeeIlfiKu9WLIa7AhWTyw1YRMZWhxAhDEPUNBwK8GFNIOu9lFd3dbYsNttDyyqHaQbbo7pu0NAFVcJub5lSNathU5tLLN2AS92vU36zqd7iUZb5/avqVYINXsIFbagmbJFmIRw8OTpYLnK/cTHSqaKnqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479372; c=relaxed/simple;
	bh=ZdNm0AMIfwc917iQdW2Rl2zXJ5BDonFSHY32W1L5r4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTnnLgWlW14K4k6/kBiIuqFIHzbgc5KHqIzKvJA486V9KpH4fNh0Xqn5sQrLvgxb+vpduLP124pQE1EkIBLPWAgshPtv6oGkIWUJo4XC4vaAHyXQUkK8dPEPaX2Ap5dIwZBMkJHuNrL3KZnMlVq1kvuv28bnGyCiBSGHgPevXFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mce3Anb9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8ECc1009750
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 10:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GequlyylXnIqG4LtGD84B3VsVCx7KNiPZUld/TTZp8E=; b=mce3Anb9rvwWfev4
	HB80HiedQmNlC24nEJXU3b4s6phbsqDnfsk91jfq0SUQMoodrT5lgGqK7OW8tLXN
	OE7rUHnif0PRQJXyl8ezdU1jzxM6gcFEXffO6GeTbRcGr1+pDeciwjvt1X4OvhRk
	LcYeyZCJQVbb9VcbSUc1ezMTXwoIaK+bKo+qTZtxxh5KIl2YPa/owByu9YXDYLzF
	QYKjbG5m6dxM5A9q5uzhXD/s8xaiivbJ8YIoHeqlBOo1JBO2y3bU9OifYVrjbhqJ
	Bu4WcQGYo4kLyQ7B592uVpcN1H6d3WhUF0U1qomygrnco4dLtNVqq23nrUPgcZf8
	+YmIiA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xngrsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 10:29:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e662a02f30so16064226d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 02:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479368; x=1741084168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GequlyylXnIqG4LtGD84B3VsVCx7KNiPZUld/TTZp8E=;
        b=ACmmNSiBKW7zXqoQvvyXanEH8crURMTjoNVRZ/gD+vsjqclJ94yrmuzj92Qm2DZr+5
         HP1dMhoH+U7ineN8lRC/AUhB9E0rh/XzOa8ifRlAsfYLzaVPqJknDy0FRHoR2i07mhv4
         /TH48A0ha1/wCm8Gb5g2Mg9HLBXniRdxVU9DXl8sY919iCC6eCCgCmDrJzQuL3jEB7vo
         E0Vd+eUXwo+ulR1ee/yLlqI79FSaDCLTIBRVfiNd83frnjh7XHFEOVR2Uc5XHv1KUs9s
         HBrVqtRMdNxcNb4qZCb2iWixg5u0UfbzIfhQ7dEySsc9HdLDavJqr05BCoqKTnDtykTL
         klyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZyZyTOjykOiWEt1O0PMiNnayeXgKDfYBJbOaoxd/t2b4+oRyaFYWt/kLOSszWnj2lERj5ERMNvEZWNONZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzmoGD03feAy0i/ZjnXG65VOoImvfhD1m1IFvvnXIj/Wn7JWz8G
	E+fRmZFQ3Cq+5dAAh5D7Ybh232r9Qv9rjINCxjiniy6kXmJpxdg34FQMktGccTxtVtNPNnok7Dc
	nsRP1wVwTskuvUlxYRaBISifuuvg8j3vF1lEwbmS7MfY6Pk/kmcnBNFozhmAC5VmH
X-Gm-Gg: ASbGncsmyzbJv8hmCnv+GPfPyOUmrTbcIjN9IXn1U3FSWLH371EVhmyA8KCc1t0kFNp
	+keL9t9x+/d3zkwCmZoh/kJMxJkO3DHXZfmcGd3pTHI1h5a19u+HvMia9a75rbl1ogLXVeUUzUw
	/Lg3deIdZw76naft8O67NBwSYV+CiwB5VCNMLucT7GADE+AezY7qQmyYdEqtzZRKj+x4lVoTPTl
	nH7fa6C6LrsYPr1JIZOroKoGtg3ajblUCB29+P6KcABcQHHy5z2eQVaocRR3zT4Se4dMNFtM4KX
	q0HHmXM4aP85UX89WBI1XTOyg6mPFqnbbGlxp+VdwCP/dscKDwQw7xjFhSxKRAE7/yjRTQ==
X-Received: by 2002:a05:6214:4105:b0:6e6:68df:6052 with SMTP id 6a1803df08f44-6e6ae84f58fmr81439686d6.5.1740479368418;
        Tue, 25 Feb 2025 02:29:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn3RkTQaD2JXSuUMFzGjX6e1+EnlYdi9qDfqQpXuA2RsXKEk2lOILqYaECeRfVX82dBJcTAg==
X-Received: by 2002:a05:6214:4105:b0:6e6:68df:6052 with SMTP id 6a1803df08f44-6e6ae84f58fmr81439636d6.5.1740479368132;
        Tue, 25 Feb 2025 02:29:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460d1bcdcsm1009166a12.61.2025.02.25.02.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:29:26 -0800 (PST)
Message-ID: <466134a8-439a-4029-af2f-023a8349f048@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 11:29:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: enable Qualcomm IRIS & VIDEOCC_8550 as
 module
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250225-topic-sm8x50-upstream-iris-defconfig-v1-1-8a17e2e193d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250225-topic-sm8x50-upstream-iris-defconfig-v1-1-8a17e2e193d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eytn_d-dfeITRqB0PP_5RLfCfC7XchpJ
X-Proofpoint-GUID: eytn_d-dfeITRqB0PP_5RLfCfC7XchpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=858 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502250072

On 25.02.2025 10:10 AM, Neil Armstrong wrote:
> In order to support the Qualcomm IRIS driver on the Qualcomm SM8550
> platform, enable the IRIS and the VIDEOCC_8550 dependency as modules.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

