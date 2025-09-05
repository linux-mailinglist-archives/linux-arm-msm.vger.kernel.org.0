Return-Path: <linux-arm-msm+bounces-72181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE84B44DA8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 07:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AD2C5A450B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 05:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBD627054C;
	Fri,  5 Sep 2025 05:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eL9N0aeC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8F23B611
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 05:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757051080; cv=none; b=W4v6sPNTcMsRFh+hO84k0ftHKkKciKeZlT23QZBtEP9o4UH6Aogq7hdHk1ONj/beY5IEUaYGmK8N0hz8NVAFes4VO/7fdp4+Niyubre5Xp6XoZQEROCywJi3ccQIhwVXxlnBymxpJBvHxAKbFidebk9kZGY11rMUBvJgZXpbuDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757051080; c=relaxed/simple;
	bh=l2K9hkdSGW3vzFGYLomASCSKhDoFegz/q+JLfFhJDQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0uCArcN+3HXPFr8LreZUdCdxx19zmgMrijpFMtBi5cuWRazpqHHPE4ZC1eakybPuwkCX7ifvijFTCdfhC/kCkm8sZ+Wni0dT9se3ijv52/AyKFMNbvgAeAGJ+Gspky9rdYI+lyvDUXBZk/b+rGJMe+LUEeLT9dPVQVYfXGWWRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eL9N0aeC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IMZsk003799
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 05:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ms0JkJGzKTaaIXjP6AglLat7tx0edPS44Ql4Yb4cQWI=; b=eL9N0aeCzJytClEt
	7mGIZwOjR9emg1aa1/VwbQnpG+J8btAILZ0e3PjSBt0c7kuW9JAJBL3/DmGVGP4V
	MEB3ljw3IPuhbd+1tNwxSJ+PU2ayX38C3mjKppS/HnsdzAuBPIo2XKDeD/ebaGa/
	OtxCYPbqMDtP4vl8TXnbKRKOrgxFnaU8OyygOcC0krmelkTamdsqDgEE/Ui8R0JC
	ywHDOQ3kblQRqOhz2DbKQtX7u28PE72npt3jqv/GIxndap0dmW0Eiq91gyzMlvm7
	NmVWv56zdWrzvxzbgfjvDmiHXuCH0UyqBmZHTN4zHnOF20e4OdkV7Fb7HLijpUJM
	W2wypA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8sa216-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 05:44:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445806b18aso23151245ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 22:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757051076; x=1757655876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ms0JkJGzKTaaIXjP6AglLat7tx0edPS44Ql4Yb4cQWI=;
        b=B9H2Zo7kYtz3ZcCCJuw2M7JK76/6bev+lnzoS/jNYCi2L+6aVpoEETdeGRO7gANOva
         OjN+KfNR8oEoKVMgiMNwjTKer5+kH2ExgANRLLnrBpU6yX8BqBzG4EMGa/I+MsdLaX3K
         mkpB5nAF+CRDU3zv6SjUqAkpph9uyNdGO6ncgEF6E3kEVAfkGlN4ubgx5leKPq8DO0Dm
         EorLdJ24Laz+Qr9eCzyoXsMEBXGtA+rwMCTsDXFu6DTcs6YUP7d29wEIJYlUsKADDN3o
         LeeXj/SGiQjGe7oFMLXmkVnFtQh5hL9rD4aRKSkLd9mPKPAhkNy4IEu1MD/sQ4J/zjPL
         QqLA==
X-Forwarded-Encrypted: i=1; AJvYcCXPsohaGmEmOkg6ruyPyLmL4sDllg9xg0wcgyADEUOXmElAwG0BWezXujSZX6qwM2QUx9LOn7DhR7Sq9sVS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ytLthyI7mJ0TDnTu0i9RoJ2DSCQu84EAPtS2Zm9I/UfLfwNp
	InuEubqz6NUq6ZpkScUA2fVh+1muToPnKnvnFUzYePdf5EJ3GaUI3zIRdwjZLp+N1v8J9AXmSft
	EeoTKTn5eYoxXzHIC7MZeIZF0pvrM9BHPsY6f0PtZi40alqQaHNCVQtfWZaikPscKxzHg
X-Gm-Gg: ASbGncvpHvWtSDsVaSQ86pGwFnGnY4SSyVtgYViSm89t90rUIDP8nyLb6R0h3/1ZQJu
	woPmYQE0W3ZAmwnXto5HrGZSuGOaQMN/blOLaz801f57Y92jLkBHa+2x41RGr3vXnzQVuOK/WWc
	x3mK52xUnjywZAgWB/7Hza0NfGdbRqhgQQ6EMfDpQUcPzXtG+C6+6PVcdhC+Iq6wEOOLJ7kBrhV
	iwbOQHA/hRVg5kjW7atdRsEdSjTCYL9YudSndVox21ewKhS3eX4B4GzBOUISiyVbbVMlKzKvIMj
	HYmsxvuXagkyTcWzbd0UCefBNKl0NSFb/rDafzncO8WjA64Ct+ivGesfd9EuolMARCeqTdPx7g=
	=
X-Received: by 2002:a17:903:19eb:b0:24c:c8fe:e273 with SMTP id d9443c01a7336-24cc8fee5d8mr71914475ad.7.1757051075756;
        Thu, 04 Sep 2025 22:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRJUcOuTKyrOxFLUCjdl9XJd/rnpeZLAb9neaQ8aeqiBCGunSyzzjqZ5ctTOwZOmAqKHh8Lw==
X-Received: by 2002:a17:903:19eb:b0:24c:c8fe:e273 with SMTP id d9443c01a7336-24cc8fee5d8mr71914135ad.7.1757051075247;
        Thu, 04 Sep 2025 22:44:35 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24d17d6b694sm9499055ad.136.2025.09.04.22.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 22:44:34 -0700 (PDT)
Message-ID: <e825026d-f365-4e95-bb1f-3eec5f0a8305@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 11:14:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Fix potential kernel panic by calling dev_err
To: Adam Xue <zxue@semtech.com>, mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        quic_yabdulra@quicinc.com, chentao@kylinos.cn,
        quic_mattleun@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: imocanu@semtech.com
References: <20250904183405.32986-1-zxue@semtech.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250904183405.32986-1-zxue@semtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX/EiXRTH412uE
 xnGhUwkWj+/nDnn8SY2lofJ06X7eKTRmNalxio7SUG05v2MF8/KBpZ8iJOIssK59QBLOOnAoAuX
 iN6yNipSKlsi9f7CgkQeBPgGTRGs3fEAaW6/EcD0zSYK80p2/wja2tBE3R4hzlRCi+7wyDbaFpX
 Ot+fyXcA6tjcH+wZ6alSNZctC4xWQFiSRuQFBj5MbugMCBiZmz6icTxn/ICC6exxVJs4jCm4bd2
 K/1CK/GYlkPWdFapxvwFdjLLlSfqwQaQHWgkUZ07pZcrAERSUa4FQzxouufXlDsKZyNasXapCMr
 xZjibeERtND/agjw1fAV1KHYriWoVriFQ8PL/AYjTa46wA9KzPmkQKpUySvgkhl62Km+nI3ruj3
 jSQ32ulo
X-Proofpoint-GUID: qOzQqu87giACGTvAupzLOZ5Ns3a6W0e5
X-Proofpoint-ORIG-GUID: qOzQqu87giACGTvAupzLOZ5Ns3a6W0e5
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68ba78c4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=SfXQzQb2AAAA:8 a=EUspDBNiAAAA:8
 a=7zsGc3PXLyXOka2lzKcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=187EmVsF5pRpP46aC3wK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019



On 9/5/2025 12:04 AM, Adam Xue wrote:
> In mhi_init_irq_setup, the device pointer used for dev_err was not initialized.
>   Use the pointer from mhi_cntrl instead.
> 
Don't we need fixes tag.
> Signed-off-by: Adam Xue <zxue@semtech.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/host/init.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 7f72aab38ce9..099be8dd1900 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -194,7 +194,6 @@ static void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
>   static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   {
>   	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
> -	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>   	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
>   	int i, ret;
>   
> @@ -221,7 +220,7 @@ static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   			continue;
>   
>   		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
> -			dev_err(dev, "irq %d not available for event ring\n",
> +			dev_err(mhi_cntrl->cntrl_dev, "irq %d not available for event ring\n",
>   				mhi_event->irq);
>   			ret = -EINVAL;
>   			goto error_request;
> @@ -232,7 +231,7 @@ static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   				  irq_flags,
>   				  "mhi", mhi_event);
>   		if (ret) {
> -			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
> +			dev_err(mhi_cntrl->cntrl_dev, "Error requesting irq:%d for ev:%d\n",
>   				mhi_cntrl->irq[mhi_event->irq], i);
>   			goto error_request;
>   		}

