Return-Path: <linux-arm-msm+bounces-85588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAABCC8FD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 18:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FA98308D506
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4BE33DEC5;
	Wed, 17 Dec 2025 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZU1M/hi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUCKPCb7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5029933B963
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765990994; cv=none; b=mbZWETH+lAFOT0CTFdGtiOaFY99yyXlLVC4N6THmzrsaKsgXfxuOTEFpSDPnO0fdabENRCbqCcfwMomY03Nv2mBbeHA9qZ4VEdWuB+UEhADZf8kRIrro67WoZQs/Y8Vd9xADSdoIYL5YhW7rGP2dKcGwZqWpeq5YX9lYfI21LZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765990994; c=relaxed/simple;
	bh=jFfml0PbMAt6dL2CYkFFQUy06q66HDr6RMPI80bPBC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksE3yMpgJWlBkjDZww/MtPNWuOH4jx3FcaLOdBSnwQFqziheHK1jK+ovoOzwPFKTaLva/ZkaWLJEtCJjTK1Cc0HgW7Op1e6aqWgTTwFjfNxMYAWMdLunYvveVQYlB0ahtnB6DwwcWtunwsvlqvLvXzSyNEwkZzZjK8gCDkjseV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oZU1M/hi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUCKPCb7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKnsG3329722
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 17:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z261fyPupslYBkJ5cxTf5CKDeIlO2UYDYvtaabHqFiU=; b=oZU1M/hiYsh0lRiI
	f9r03Hh6MJAEoWL3pKlgBQS2qmPhcXQtcgKzo1nqrpHDGmbQqGU/WR3NVyqCJQQ3
	Z4+ayejXUA8x84OjvGGaC91EL/gcuanoBve/NqpHdQrHmRZBn7YxcGmocH/PLFIO
	OYUAOgKH7tY9O5DlPCHB2kuSRJopCye6T1EelHhxHqU5IT0eHXw7dCEkbSXapq08
	LQgybBiTWPeQKZh5bgbRgntMyRdCD9guN4MaDmVrDhM5NA1CoZpetM+p7t3wU784
	0bfESd1j68GTDQbNxSlz1ZrNo3sFAHlEiZKRpL56i0PCvF3xp/HDgYiwiGlalyB8
	R+FHGw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkjc4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 17:03:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c93f0849dso895495a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765990990; x=1766595790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z261fyPupslYBkJ5cxTf5CKDeIlO2UYDYvtaabHqFiU=;
        b=fUCKPCb78sRUJabI0571uJnbF9JLW4bySNdZkQk3ZmzbEp7K1+xui/lYUfzU+yYw+h
         HQt2HsZ0cWYUNKpXawDVNeri4BKLZOwJofpVjEiIFsSFnwFQ2YPmqwgrsthBbNXbPUjh
         qPGoz/+f1XmscYBzpOZyxGUtk1KgiMsgq1k9k9wY4BJ8jGXu53deQy3eTf+vGU9CH6Np
         dpivNrQASzxSt7uB6qoRjpoAbC6Gj7JAojdzWJuknXEYq6B5OUI7wIta7mdSRGSeniUq
         WDS8J1bvRfp5sYZH1zvRLUbgi64Ranr+lVBgdUwy9Bm42/bHumMwGqPctpONseSNd50R
         VURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765990990; x=1766595790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z261fyPupslYBkJ5cxTf5CKDeIlO2UYDYvtaabHqFiU=;
        b=xDAm+Ar92R/hQDOz2VeNvgyK2MhepN438spq+ZjqRgfTZTkuRS2pu4vBBvbWds+gh4
         JbzkDVmTZz8RMNjDT10AcbPe9/GMgotVDkwdnCA8mZ78+43/szn1sPp+/fOHadilev8U
         tfAyb0ne0YKYShka/ayyl8lz2aOaxspovuCSjZRDtqoXCOhqESB16e6/g/rIWVP+wrX7
         dC9V2v/OnmFCgVPSebtVS64QqdYnOrEHzbLZ6mSvCgWXoxQ5LXvmJx2LHI0hWFW0sMbi
         Bkrik0Ao7ExKOIIDF9lfOumiHGpssdg/EonfjqzqyrwAZq3drhdnt0rMRxDnYFAr6v51
         hcjA==
X-Forwarded-Encrypted: i=1; AJvYcCWS8caYK5Xdj6TJg0ASxrkVXsjV0h/hBtQH4gvVOE8Dv30zsfG8D0toLzir7bNJHc6m8QDaMtpCR0ViAmtc@vger.kernel.org
X-Gm-Message-State: AOJu0YziabsQr6yV1Akt7UrvswJ1QUD6SNo44EDiyty9CQAoi+wMBgoM
	QAsDixsCLN2YSNQcf2O6h8JE6vYnrMwAaAUYvtoedOnnKIXxQPwnoboibIz7ah+fHMNGecXz9jI
	YILMRx1Z/jAQfigEK0rRMhd89dU8QFnEgWQLrim4TMNv4DKXW0XvyQKAgj+rX+ZkwLQpz
X-Gm-Gg: AY/fxX5kyg8clcP5VrZrL8ythWNqwDyzRXzAsWlwhfVPHtvYEuw2nYoeJZZBcUap1Cs
	Wr34Zf6n0J8jOnglrrQj7442r1SxEIXQ/AM4JqBQUynGrChbKHCp12hQZ/NFYoWraY89dg46Ppx
	15wlrDdX8xl370m1dxV5oH8FUOfVudbLAHZU6sG7MVObjq5Qj+pG/vJw35GeuddJQw4XTEMS0Q1
	mpe20yZGp5dq/0NI2bqeTfhjxRb60qxN7HrHxby/c17TXb91hBLzTWz0Ht+LEL7OoYeo84UX5tw
	05r/jSthogwRGT/EPMzEBVrocxF9ufmb1vCNf0GTmlSn8btjyrztNxM45xM9/v31FFbFtwonN2z
	dnQDa4eeE/UdRNmCNNNxJna+Z3Tf5y12RVnuU
X-Received: by 2002:a17:90b:1f86:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-34e71dff8fdmr73802a91.15.1765990989967;
        Wed, 17 Dec 2025 09:03:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGi0CjPdXURNC9AmcXtnkh9wxDqTCsj/JCLC8T/NKV+5GRB2gbi0Z9PFj9R1nneBL2QAgKgyg==
X-Received: by 2002:a17:90b:1f86:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-34e71dff8fdmr73691a91.15.1765990988200;
        Wed, 17 Dec 2025 09:03:08 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d4f7e2sm126905a91.2.2025.12.17.09.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 09:03:07 -0800 (PST)
Date: Wed, 17 Dec 2025 22:33:01 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v11 2/3] firmware: qcom_scm: Support multiple waitq
 contexts
Message-ID: <20251217170301.cpiemk2hn4vufogn@hu-mojha-hyd.qualcomm.com>
References: <20251217-multi_waitq_scm-v11-0-f21e50e792b8@oss.qualcomm.com>
 <20251217-multi_waitq_scm-v11-2-f21e50e792b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217-multi_waitq_scm-v11-2-f21e50e792b8@oss.qualcomm.com>
X-Proofpoint-GUID: -qGRJ3zEtIeqg9BoMKdho6CuCyPHugCl
X-Proofpoint-ORIG-GUID: -qGRJ3zEtIeqg9BoMKdho6CuCyPHugCl
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=6942e24f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=QzrcfVhLTvighugrL7YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzNSBTYWx0ZWRfX8eEnYReTrPZx
 2bYmfrNboBKbqOBQ4P+SORQYN9tjl9xKAjiID0v7WdI9hdJkMhLqBz87ULZTd8vvPyXw3Xswo0v
 I9MjrEJrvFgv3jXdlAiYXsNRNkG+DZDoTzZBexfHchS740Yty9J9yGg4QFV1z7KPGZAi/9wLBvb
 lsmuEXclCnO6D5V3G2xVPzTHVYg+/0xsYHmZillO6v4rzGyISaibZoeGnaEpe6GoSlEDtULdphh
 SPwOEY0qCZYyV/+Ej6MCpGB9K1RI1T1tuh/+Iym3Pi+XSmVyHl4ADzuDBiBGxBMWNYTQqLM88c2
 AjKyu9ppo8JCgB4pYq5MnXK62zhI8ff4UtnTSDX1EYmck74tXsjZT/d/jyKPfGK/TjXCWTD/pCS
 PJQOUe+6G1uiDYEbBF9HwSHJLdZgwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170135

On Wed, Dec 17, 2025 at 08:04:20PM +0530, Shivendra Pratap wrote:
> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> 
> Currently, only a single waitqueue context exists in the driver.
> Multi-waitqueue mechanism is added in firmware to support the case,
> when multiple VMs make SMC calls or single VM making multiple calls on
> same CPU. Enhance the driver to support multiple waitqueue when
> support is present in the firmware.
> 
> When VMs make a SMC call, firmware allocates a waitqueue context,
> assuming the SMC call to be a blocking call. The SMC calls that cannot
> acquire resources, while execution in firmware, are returned to sleep
> in the calling VM. When the resource becomes available in the
> firmware, the VM gets notified to wake the sleeping thread and resume
> SMC call. The current qcom_scm driver supports single waitqueue as the
> old firmwares support only single waitqueue with waitqueue id zero.
> Multi-waitqueue mechanism is added in firmware starting SM8650 to
> support the case when multiple VMs make SMC calls or single VM making
> multiple calls on same CPU. To enable this support in qcom_scm driver,
> add support for handling multiple waitqueues. For instance, SM8650
> firmware can allocate two such waitq contexts, so the driver needs to
> implement two waitqueue contexts. For a generalized approach, the
> number of supported waitqueues can be queried from the firmware using
> a SMC call.
> 
> Introduce qcom_scm_query_waitq_count to get the number of waitqueue
> contexts supported by the firmware and allocate “N” unique waitqueue
> contexts with a dynamic sized array where each unique wq_ctx is
> associated with a struct completion variable for easy lookup. Older
> targets which support only a single waitqueue, may return an error for
> qcom_scm_query_waitq_count, set the wq_cnt to one for such failures.
> 
> Reviewed-by: Bartosz Golaszewski <brgl@kernel.org>
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

