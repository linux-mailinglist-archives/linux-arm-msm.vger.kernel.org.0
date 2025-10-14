Return-Path: <linux-arm-msm+bounces-77230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 086EDBDA4AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 17:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A402504966
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 15:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421542FF16E;
	Tue, 14 Oct 2025 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R86WF9W0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B971E520E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454720; cv=none; b=lGBmC4ey7rMcclWmhwrcKDkRurMy3nyOTPmfqR1ReKGJiFOE5MdNA/F5FEWStVTNjRrOTAw0AI41jfexGx5oCVjckYKTEInjg8TTUzge5pji5akLNEfwslIRGPfRoRFZZrCmk+Q+0/n1wd91X+ke5QE5ZYsEEkrlHRUhBfqmavA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454720; c=relaxed/simple;
	bh=rD56wAJSJJyrwquI5AsmbLaxqWeo0Ey0jBkymViU7VI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jf1LRRgDclxmhLoWkOLjswsaGFQ/ZNFGOxf7H44RUfTSi6iw4EoYYUX6N04NUKRal3yMMy+HEJmwtA5VZfiGDdJukXyk5olV3J8V4BLu/8/nR9lkibdo3ngRdc6iN8ovQ9rditUJ/ut1lsj8REC2aaVO7OmgFNNouNNj0vc2d40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R86WF9W0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Iqn017772
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GOaw54+GyvB4/lhEX8P2neuiKfXjGA142b/PiS9SSz0=; b=R86WF9W0f5/xtk5D
	XX2lAB6AkykZgkQm85zM3+m9mcFG4FjEeJ//ViUCRNhC2qyEfF8ueeuAxA1V0UZS
	TaickaK1ur5ol2IHuu5D5+q7IvmowU+8WnA6Nq2C6fVu1CfB4qdDGY3XnxHNeFfh
	l04MclUDm/FS+S6M/Tc9F4Q+24l/lkFZAsNsEUXnkfv3tClwIHGrZJzMb1666InS
	xbpCBEX3iHhmDJAABJeZpzmDCr8KQM33HVkL5zSp67pYpFxM9qomdXHtVxZKrJmb
	suEZUc0wYyZva9+TU6PpeZJe6rivpcEc3KC+wlaCR0f0F8cCfKqnPcNDlCVpdJhI
	I3LJ6g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1ad9jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:11:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befbbaso12330704a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454717; x=1761059517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GOaw54+GyvB4/lhEX8P2neuiKfXjGA142b/PiS9SSz0=;
        b=LSf2r9fojXOqGdHyhZHsl0NvDlw3r7wl1R6Q9/goG5cweiyE5HER0y8eVEMuq66/wX
         8ror2fBeqPa45RTGitkd5hx2ki+uOtYQrSi85vdfvncgwj20YsSK2NHaXfmPfOoRXkX+
         zDjTqnUairM+5ufiTny6XQOuFXBQPCkYEPEbx6NURhI2ig0wSamU90R9mSgH4lrcdyrz
         jFTOpEo6dzsjvf5Gm44OMxNpxQWEva4enQM7FqQoUSdhW63mCIWVhBXgBUQFCjePutGk
         gtmBwDplrDHNt1KXf01634i6lu+2aBrHH2j/MvE4U9OUX4He/Unw4eOem5z710f0I1l4
         HQQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV05NpHMxiUmtG/EaKud4IjILGLwWT39kqp0MbT4UbU0c7ad+Cif7YcNf4jCwF4ufPtgskLV5y0SiOhQs2m@vger.kernel.org
X-Gm-Message-State: AOJu0YxB/g35UCuI/wDURYVG66VMSRbU5CIMoNHIR+0q4fhGTQTrw7UO
	OID21f1haer3HnVvD1l5Np75OPrxqK+mAuPwrLm3lbptaGvi6/jFwIw4475dWL27XEzkmIYTxsG
	WKjdkm9WPCb4otezi8KfM1ea7/D50fzcoPTvOKpYi5PrnDmQNAQuc9mRiRENDEQVNygaK
X-Gm-Gg: ASbGncs2LDqCj6ZePiI+//4vwREECNEM5h2TEcMQ6zftke4C9u6eG1tXCIUcIhZD0yk
	MV1yBJxWEnkn4p9zgiXcGvrvu2cpmpWRD/TsHMf0kwQ60+nv+X7Ukttx8LShcNo50Natb1+96YP
	yxJ4Z36fq+HvLPXpSx6rI92tg52VCTqxDJUs5qmMoA9TbQGuj/3fgb00OoFqt4ZcFWxNt4GgqUE
	lEf2D1XgUoFRmBfkBcW7UcAlo4wL0iCj6av+Ze7p8X65croZb4WAwjmfCssKlbYYYd+VOrsstTQ
	ReLAdx2S4LkgJdOoVOWmosEIH8MBcVh9h58DmzCt7EVHP0ilBFsqJsanc9sDQu3Lsu9kPsZDHmI
	dNEERIoLexX0ebw==
X-Received: by 2002:a17:90b:1c0e:b0:335:2823:3686 with SMTP id 98e67ed59e1d1-33b510ff59bmr30318692a91.2.1760454716871;
        Tue, 14 Oct 2025 08:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtjZf3YduDUFftq8D9vl54/Qj2lBCEThZgoUnbV7KXOedRjfTSpvK6arvWPi0gwGopNWtriA==
X-Received: by 2002:a17:90b:1c0e:b0:335:2823:3686 with SMTP id 98e67ed59e1d1-33b510ff59bmr30318661a91.2.1760454716278;
        Tue, 14 Oct 2025 08:11:56 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aabbe8sm16268963a91.12.2025.10.14.08.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 08:11:55 -0700 (PDT)
Message-ID: <07a43d80-5158-4af8-a475-788e980a32c4@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 09:11:54 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Remove redundant retry_count = 0 statement
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ee683d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mnYluDPEoM_Hn9eIMYsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: I4IdE-3Ii3I2BdONtK3IAPMYGjjLzw6c
X-Proofpoint-ORIG-GUID: I4IdE-3Ii3I2BdONtK3IAPMYGjjLzw6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXxFMTVhlB0xsf
 RpJF2+pG3UHxWk4mGBzxur+D9SNLadbfuJnyCBQ++bnVyPGHJH31lG7QOTZy59qrpUz2gVEyOa7
 pVQYP4/B++so3I577j0/clb63zwc48rc8l4VkFAk4O9BFRValdDMFaeoFsooaXyDiNcl3DPOryM
 Yl9fTSb2SAigJseXqOEnGSbFAXtcNqKoX59z3z9uJ/5sg8sT1RfDjWSlNOeOjQfP8msS9gip5ob
 In4gQZNqtWNDiud0GJCgbIlMne3neFk7Z2lYqBmaMk428BVh9evxOilGNbwYVxlrBgd+P5j6AAI
 L7sDcuUib2X9KKth5SWUf0KkEugPwSZDqvsQEqLhLT5uHKsOnkCyIuKZymFQYDT9uccfiydg66P
 7d1niIrql2f2zciw81d7aTNu5JOMKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On 10/7/2025 10:11 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> If msg_xfer() is called and the channel ring does not have enough room
> to accommodate the whole message, the function sleeps and tries again.
> It uses retry_count to keep track of the number of retrials done. This
> variable is not used after the space check succeeds. So, remove the
> retry_count = 0 statement used later in the function.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

