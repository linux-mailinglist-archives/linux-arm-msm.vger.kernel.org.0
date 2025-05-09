Return-Path: <linux-arm-msm+bounces-57426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F71AB12F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 14:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75D23189B6AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 12:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35D228FFE3;
	Fri,  9 May 2025 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUuXKYHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AAE233D64
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792383; cv=none; b=PD8wP3zVBzGTCHHPpghPDrdJtpgUsuldfo++LkvMYa3/MPEcYDAgb67tAkyaqNmQAjEu86xS/3gCraM0oYSa+NveukOM2ChPVuNMoWkfYUcEth6IqxaKg5a0tUbB2jXDiVLGr5wfo7iYk95iVLxDZrT5pGzj7FR/Txj2jI0UGLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792383; c=relaxed/simple;
	bh=96Tg58Lc+vMRWzL00RdF0preMK39zEFWmb1QusjV0vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzu10AVhPGzb7KlN52GMOgUzqHSjh5HoI24vbLfmHBOKPTOI60fG5apF59NmC/9578dKMNiMIDXnH5ap0mSNykkloPhhvYQgPVMDhJ8uviovq0nchqBUj+oyV6bn0TYm5wdelssBwU4PtQnUHGXnQkgKFS8MefT+yZxchTzKQVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUuXKYHL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BQIAX008635
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 12:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VFG5Da+YfOlVw9RRbBfTzV9AWaQl9DWU8KlZRXqpzfA=; b=JUuXKYHLxyincbcH
	3IGZUI6NarqsJFKHAkE9EDmhzizZVQ2IR08pkiGbNr2KAFQNrnEXgmYTNlmb3Bnx
	L0/eaE/pzf+yeN1QyIp2dRsDa7fhhIBi0g+E8VSFhoYifYX9l2KSfw45QUMk/+3C
	zZiVoKL42bV7C5S2m2RezcPr+Dr/MyQ6FNW7XFEQoq2svb13zA4bGAjnZmPdu2ll
	tmi0asOc6LfdH7cwiThVAfoKhfFMtz+aZDp9y6OOf2q3pSvipJWwmM3lqrsFw/w0
	YvrcOQzoVvoxkQV79s+WyyltceWdfBZpLjishapJBDeHIxHK5E1pzKxnCsl2pESl
	U1Vl9A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5cjtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 12:06:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f6e71d6787so1907916d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 05:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746792380; x=1747397180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFG5Da+YfOlVw9RRbBfTzV9AWaQl9DWU8KlZRXqpzfA=;
        b=pEpccSAxh93jNPmn3odDmZ5gVzPt8ZfTDj94PUBEVsucnEMYtYXXInNX/o89aZnSQU
         PUKZfr1QGN2YHjGGM6RG/FCkMtf4gCwtJARao3f9i4YWIYvWe5ijcFmH8S+RFwI+LbEX
         4rzq3qs9Tk6o1Y+lgL/CpLglk53jj9OIECkGwr1r3GCpK12VXt4pgyY+nSlD62EvvNfO
         G0yufKCci60d3zfznOxTtuJOw1H93ct2KGa+6mDpJgiMnBVBMjAlkh6SxAVKrVmMevc0
         qnED4R787h5uPTIJ20XHcjMj9xagm9W2vYAX0K9i9Qpqx1dtCjvzvzmhrRgnouofLgMW
         L/2w==
X-Forwarded-Encrypted: i=1; AJvYcCVZaUX79W2o1jxVQKnDbanXIBlFra+wFWZ44SN9KcIoOQDlwoiW6wOSVcu+mZ795lB73oXosK9hGjaRiD+Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyCaRHwWIG4cRE0k1GXQtYFFf2fSibKHSxRRCG/Qtbq0qR6EEYt
	YHercp1YBoxXJPA2X2OkAyInqivNqQfOCy6PqFtfTuXxODC9Z3CaXpq+CF/vMGkFYc8YYHHekwF
	Gw4ed0PzvYLke6m1MSQG8+7UPOiS4tb5Dy7SDuLLFAbXE4UjxpuNkMEdvHk2EK9jN
X-Gm-Gg: ASbGnctz1/C9HZtBpfGKcPe69WF0CL0cvbiUagez+CUKeJWR9bVwbp9qLQw21Ar8Tcm
	KCWrwP3ayadwwzy0vS9F0bkbKv1DLi2eYl8+vd8XPH1r6/w+v4FPc+yA/6op/Fn/3T0UOt9/Bds
	dAowM820vo2qGeuYFUvz9OEocAjQG1KD1d1K0PqSsf/kXAfFG9KLETrxLyVXvSriFJ7HXJge9Hn
	GcXbcUIFhX3+/mOXYvF0YEoNRnqpA1Ssm8wwl3yxM+2eXWl/IxHu0PKPEi5Tzdxsx5X8wgiXP53
	tMqIUTLRvdd7fjAEFVCc/z/5MZJWghJ8kpWS67a0eh/w13MHueI7v4oPYvH49Cog9Uw=
X-Received: by 2002:a05:620a:290b:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7cd01108cb6mr190528685a.8.1746792379810;
        Fri, 09 May 2025 05:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKcBKsJkKgfMZZzUCoL4UmLzaEErHDasd9ek1N9pmcMcSpwfQinc55ChB7fmY4ymnXRybyaA==
X-Received: by 2002:a05:620a:290b:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7cd01108cb6mr190526685a.8.1746792379449;
        Fri, 09 May 2025 05:06:19 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192cc449sm140992266b.20.2025.05.09.05.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:06:18 -0700 (PDT)
Message-ID: <7695636a-e6c8-476d-ba8e-51185a7ae2cb@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:06:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 01/11] scsi: ufs: qcom: add a new phy calibrate API
 call
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-2-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503162440.2954-2-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681defbc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Z92jOV8uMcrVojWvk68A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kA1X3ecxKF0TQXqMnCsRXmn_bsNnei82
X-Proofpoint-ORIG-GUID: kA1X3ecxKF0TQXqMnCsRXmn_bsNnei82
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExNyBTYWx0ZWRfXxBjR3HczSpgH
 z0gmPamodo4vz/KFjdd/96HGmwbuoX0vbWBANf5UZf2vEBl1kaY8cPxYBM9vpvYA7ytOP69mqrm
 gsdq6eJsjQuz7b+f3EzHKGVASeaFnbvqyuCXlbKkIkZluGceJxLkP7J3KHpF9jnzzN3fyzJTyBM
 TkmynSqNdO7AdqPcivwYoATxTULsjIqO9e5aXIwlI7GkF+C8U5vVCO15Zi065nRe8ezBmBO1cPg
 MlseTpDQwK7tLb2TzkFGLrXhukZQlq5YlB2S0wah6odOh203NsXSfQxXyvHZVCzCGpI0XoR3eph
 tKTesRdrxfV8msGhZsjvn33e225A39iGW8oKZlxvHnNsgy09s1hHZiTr8u5wsBn2JH65kkVMYo4
 M7po4xpeIwxO5nBJKOjql9cUvy7aNrIx2j97XM4ZzMCHb36ursF+hS83h/OHSQg9goq5CYwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=808
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090117

On 5/3/25 6:24 PM, Nitin Rawat wrote:
> Introduce a new phy calibrate API call in the UFS Qualcomm driver to
> separate phy calibration from phy power-on. This change is a precursor
> to the next patchset in this series, which requires these two operations
> to be distinct.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---

I would imagine this would all go through a single tree - be it phy or
ufs, up to the maintainers - unless you want to merge it right now,
Bart/Martin?

Konrad

