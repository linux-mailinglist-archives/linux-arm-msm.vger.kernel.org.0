Return-Path: <linux-arm-msm+bounces-72591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58917B492F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13F643BDF6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD1230CDA9;
	Mon,  8 Sep 2025 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1IkmVTD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C196125634
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757344877; cv=none; b=ZBM5h9hhsir4lIRLDZ6+oik0yHB2paQot1nrfNINGEuoVJSp8F6kOMtvUDEpX+jqVN4ba0PonggDM9XEhxdFGktBN5g0mXy7xdPvA5RMObjca/9LIHaNE3eAoSkQT2V0bzU25jva+d16ckx2r+pe1ShTBbOPCDbquwK2Mew5Hn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757344877; c=relaxed/simple;
	bh=PReJpi8e6c+cy8uZc9AKsgF+ro3fiy/sGgR42bM5gzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ichwwIGFfWAas2k5I3RlzyrzVFY8Rnp3MoKbQQ9pt+UbXHUxct1NmAtk9ZknQ7y4B+9IYruymgeaNRy/qy6cl5piI1sIMzCxnwYS3bUHzUs7ABqChWxvzjOtMizNV2S149UFt+9Zp/a2pcf5K4n8pZstCA4pveFbZW6ODjaAvcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1IkmVTD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588DjiKc004745
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 15:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f6Pkzb5kg5j3jhry+0rAbxrUj/psaHYMGrHrVc/RvVE=; b=b1IkmVTDioXYCvCt
	NGOY6mesOdodrYENwnVsGxDKbMOM8N1ZDWhZnwe7KEg2T09hiYFosNFK5sNCFFID
	QQsFpfmAWTm6CK9AhopTyak4RxBI2DEFtAdDzMXr0+sMOXtDcR3JMPnnDZ2F2LXt
	ac1m6HXUzAcNiBDCbITYeeeXTnupsdBwNUQAmhSEg5qNrSLOu7oQ/jbGT47U/rBw
	ObinWYLympLe1DMcq5yZ+CigfODqgc5DUqFqVess2ieX/geqg4qvfo8mqfjuP+m5
	7Lc/CyFhxqwY+1m4ts23U2E7AbTgyZLvmydMPcHxmNFLFaX6e1tlNFyVpA3I8xzh
	YQaHTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37sfp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 15:21:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so9292061cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757344872; x=1757949672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6Pkzb5kg5j3jhry+0rAbxrUj/psaHYMGrHrVc/RvVE=;
        b=p5HIferM951fGkv1V/7ODAKR83BKBwRC+joOTcvhULkmthfZm4bHqwR+vmmmjAYV/f
         qjqjixTbdUF6tjBiZ7amEXQulZs5TvcnbUrUuIdvOTFK7N8bWXAyMalhhCXlRfvEtDr4
         AkzdUcy4BUSxCAHHniGVVlJnrjE854hB84edUIEzOb5fFrqJgQK+f0+9UqHYCNGnzXNV
         aXzLwHPgAUmgcJt8xgaKeK3fdT/eBTLNhH9G9xAV+4vcgh+m4ezKhGepDBcIQSiXNaeJ
         co0FJaXNgatrAu9JMWI+nzHhEyECUdsmBm604ijfRU8KDVgAkbrOiq/tLPEeHRun9w/5
         BMBw==
X-Gm-Message-State: AOJu0YzJ+uQpzbzj6JZ9zhNK99nPEZ0Utr31vUNdle+f4aVhOPr0dctp
	m06fXFTmcH7HLfgamlvQJ/6PworGZs+cs1NIwxTjiGrgSsf8qXKs9+G+AlAUVA0YI3IHutxH7Cq
	64/UKoqUJ5AVH4RvbiCjdujZlRuxApzChqf/dlS5wHxeW6FptyeNeU84MZYIA5G7VWCGc
X-Gm-Gg: ASbGncuG5f2dMkWxljHsaIk7V5bBlmDqmJRu9p3R6+x2xHoVkuW4xa69lalAHONWM78
	E9h3Igx8QS6O9EG8UTnxEuM14o9Dx1K1/7zqkGEi8YWFWXsL0qckmZMr7WbIS3ty5lrPGGuU+P7
	JVnTL/MAojlrWdYtb1r3cGLpM1wNbgC+z7MuCHg1HBCQlrZWjzNB+Qgw1WXFKnQE64z34lpMkX7
	oCEz5VAh/HJUmqzAkgV3SYVXUDJNqKSWm8bO79NLxA/e52PO5mpZFkxv/W5sB6sxxrsjSuuuGHQ
	2wDo7IqH2bkRZYqbj7m1dKoauqc2MnZZs7KmChEPJLybcHwfbQc3M3VCTqkqxRxY9U2ESrwemLZ
	BW6/W5GVbiUanZf+T7zWvxQ==
X-Received: by 2002:ac8:5787:0:b0:4b4:9d39:3432 with SMTP id d75a77b69052e-4b5f85322c4mr61314821cf.10.1757344872105;
        Mon, 08 Sep 2025 08:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsQXC64Y9u+F8HSfWVUBHFUIev7jGr7kCnI+D3oKSm/zJ4ylRrmHPoXwe05OfIypUYK6l3lA==
X-Received: by 2002:ac8:5787:0:b0:4b4:9d39:3432 with SMTP id d75a77b69052e-4b5f85322c4mr61314421cf.10.1757344871484;
        Mon, 08 Sep 2025 08:21:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0409bf055esm2249764966b.85.2025.09.08.08.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:21:11 -0700 (PDT)
Message-ID: <f034dd83-0f50-4632-94a4-ff68400dd922@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:21:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-5-631b1080bf91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-5-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m0GPjBNM0Ay7w0DMuZE8EH7jcJr6w4RI
X-Proofpoint-GUID: m0GPjBNM0Ay7w0DMuZE8EH7jcJr6w4RI
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68bef469 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vomQ-D7Nz7_NnwrRMiMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX4YKauRKO7yyt
 zca/L910sNIREkBgycBYTF3QHw6BcZfcwBG/UOeRoHJjpU2B/yxRG5o81BL1Jq3RmbIEicUOF9U
 EGlx6t087olsMQ8SeNEyWGhURxc6bE8SpylppiYvYgMuZo/hivodOMH1pnNZtKRz7RG93ATYlRU
 OymvJbZeNJVLBS6aZUJynP6tvgTzXctp/l4D3Fk/ogGcSsx9eZRN3hQ3oQSyTbGeRv/1Zv1sxPs
 qjKH6v7mm6baEoSLXSNXo+04FBzMqpajY/SdTsQJKUPWDFSL0RtRqdpkWb7yF+tgFhU7Yxj/nz3
 ixMxwZ9DHNQwwY3WZeKBzQEGtF8Uggxql7nPW2IXJB6NpKhvw79nNAvpo5xa44s0VME2HEi4mhp
 T9wKKgFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On 9/8/25 10:26 AM, Akhil P Oommen wrote:
> A minor refactor to combine the subroutines for legacy a6xx GMUs under
> a single check. This helps to avoid an unnecessary check and return
> early from the subroutine for majority of a6xx gpus.
> 
> Also, document an intermediate unknown low power state which is not
> exposed by the GMU firmware.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

