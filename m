Return-Path: <linux-arm-msm+bounces-99690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFPxI0+Zwmm3fQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 15:01:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA6A309D8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 15:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B21CB3067107
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8413FE342;
	Tue, 24 Mar 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7TInatF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFPAJa2T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413FB3FCB2E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360241; cv=none; b=TJbBtI1zuwVTh1SLoq1UpxVEhOW9kI0qRnHftKKHggEoym92OXP1RFQ9n8i0p+D9I+kDIap1nZBTPsse50XZQd82OgodsrPRKB570boOmVu0TjZ4S8IJvHzEt52pqIbK1Mf6G6FFPi8qLP+ByvFEz27FS90klns+wAGwbWSd6o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360241; c=relaxed/simple;
	bh=pRpXqKX3DGcpGHW4S1fO6rEvBtyVW5LqY/TcQkUDdAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PdUyVr8f07nm+JXj3tNEDrdo0gLBZXqkoG4XXQR0k/k+dxXwMucS1dtkrKqg8YTtcpc5UwDrvMYVAu+/zuLLNZnd8qfqBRnrMZZ0zcGDrIegIsut/UDLTEAqjhSnx/+aG2uTS/ajsW1XlLw1VjpuFcplsX37ILg+WXPImzyfv+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7TInatF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFPAJa2T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC50HA409241
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1DKfsPVlgxtOA6J/xo55HFoYXQ/cUtB7i3T3emkwyDg=; b=J7TInatFj9ehsEo/
	jB3397IxH024in81il1Vx2I4kXtr1YPpiB8RuM2zIQtGWqMIdledSobbNBS4HnDX
	SLcY0RF2DtK7SxPHO5ktHKvbs2DDO5J/oh1o9UpERaiyjxr/EL9MrciUCfRN8foC
	z2fflsDhXOxgNsRuX85XQbfeeNJuLudrjq38AQ8Kgu886pCU7Jr5+DCrFngXHTTx
	xazU5khmMTGYzGgUgrWdhvCHLepXp+oZh43zb5A8l94xD+x+dNbX/I/7Jts30SIU
	TLtIiaCKflPavgzK3uM31W87F2uwGw7X2p71R9Cbt7SN290PVGLP9TiRQO0dj8Kn
	1RnkUA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nexsm77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:50:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b31f391b8so33383651cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774360239; x=1774965039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DKfsPVlgxtOA6J/xo55HFoYXQ/cUtB7i3T3emkwyDg=;
        b=YFPAJa2T6k2qroJD5XIrA2bdr2sZ+c9zz4oMlP5eyGApoLchKl3nZU0Uox90aJD+v9
         1IS0VNbPqyVgFcvHXaMb/E93E5QOw5jQLKtYhPrt46qwc8uxfOzcS8IpeiD9UUbgKT37
         0Wx5eSbraC+rcjuyyO/l26b70nD2H4yvBn14+jb1rNFjJjt3LbVfTSLTFhNB+ZCmYc1X
         TRglP9NAdWAs67NzZuu1BxqZGezlwvyyEt0FXcorRQRt6Z0jeJjo5RLJeX7mFfVm6kgA
         OX4aBy0znezEgytHUL7DanUISjIx3FL+ZYhopu5uUv02Ng6ND0vQs6CqCeSC8s52Y6Oi
         MJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360239; x=1774965039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DKfsPVlgxtOA6J/xo55HFoYXQ/cUtB7i3T3emkwyDg=;
        b=IQXT7evnPG6Wp7aqsHqQni1hCXuViq2Le/na8gDcmhN5Tf7+MQFu49XrTxYgNNUv4b
         gk1MIoW2LoFX3ug4k2STgwsin+ongSGi5eCez4pY9tKtFRxMxbM78BozjuH2n1tM/nVz
         LvECPoYSWGg2Q1+A6Wn8NnBggh2oaowkwV9u0hH2WnT9coU7tLVan+gx1b6paDaLc3Xy
         F8PycG1OhgFhvwTmrMGmTdRy5HtCIa79cdcXSouxatmS05ev/5k2bTwFOP6TOgJqsWtA
         WaQsIi6ojRfiqWui43x9WEUWIosgGWKnVj6ibxI70EDhOW376zmlzbIdeKX+Wu1hM2EU
         o8UA==
X-Forwarded-Encrypted: i=1; AJvYcCUTfjav/IMQX629L6lpaekZHiW0yvRJ/c11ug4t3Fmwa6Zsive11GBInkdTUl7u5HMQK3/G5DJdyeAqFRQD@vger.kernel.org
X-Gm-Message-State: AOJu0YyNpU1QODJziFDMeHi13DOVedATTMtskiznHjtSQK5A+S//YoSz
	ihszNKnrlCPLB/AjF9bt/qbRh+LpQExOOjH2bOMKKOfNGbI/hQVshKZq/flvp0/c7glJewekVHf
	8xCtwtLeipyQc/osdioOGG1SIFUPjd7W2iNbXADdsqRubiHUsxtyYx2dPKyD2iYACmbqF
X-Gm-Gg: ATEYQzwRgwH/1++XBBzs1h6Lvc/oUcvKggu5GCIwN8ix2rPNbXnblpoCLNImow4p0IA
	lyb3tknh0wrKUYidfeclqXBCqBJgftVL7eiGvwz9SfPm69kQCGVYmzpizi540Zwf/52Hsq2IlFg
	VgPUS5vM4xGjeI361wiYfHUhDtPXPgc1RwaYQkaM6/5QCgPXfux6cu7zOu80p9RfGNDqqLVCFi1
	dU1IFuCOOOCUV7AUY49h0Jd+HfLl8LmPEWyBZCuPOIsAQJEbHY1XR6irLohKTBTXc01bHDeSUlC
	hDadg1ZpDhel+sPFuYQqeyLb7xHpc1woNQpNGGHV9yF6Oj9YVSd39KR+DHheLoF1TFJc69KxDLQ
	QxIoHtAroGG+UjCairMPiGIvQySnsoR2jWVO/g9zkrNE5TC9AXvVZZC3AyR3zj3genBHI7Fp+WP
	g+Sqc=
X-Received: by 2002:a05:622a:a18:b0:509:882:9e7b with SMTP id d75a77b69052e-50b37606f0cmr190864071cf.8.1774360238422;
        Tue, 24 Mar 2026 06:50:38 -0700 (PDT)
X-Received: by 2002:a05:622a:a18:b0:509:882:9e7b with SMTP id d75a77b69052e-50b37606f0cmr190863581cf.8.1774360237885;
        Tue, 24 Mar 2026 06:50:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cf4f89fesm4782268a12.4.2026.03.24.06.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:50:36 -0700 (PDT)
Message-ID: <36bbe3c6-e83d-48be-8a9c-9cbc5b26e064@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:50:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
To: Bjorn Andersson <andersson@kernel.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
 <gvj7tsivu6w2fzfcus6oi3pwc7jcfqdrx62uuzny674mj5ftus@dpnn4pzizbqc>
 <388c4c45-2338-4520-abf6-6a15aeb5db42@oss.qualcomm.com>
 <acH2K3-qhGMgkAtX@baldur>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <acH2K3-qhGMgkAtX@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwOSBTYWx0ZWRfXwtygPdLp/taR
 hmgvJjjbwRAbrwcJQV3eg3y7UDIbT3hvHr7V1XExf29CHYlQ1DKV+zM4m5py+7yp7vzv1iYj94M
 g+VRELvcpOvDEenOOZPAfNm3Wv94fcsY6ZzW8HQQC4Yb6wLTgZVSJu4jwM6avRkEzWcUuifqRA0
 6UpP3pP/jdmSdQ4NZuRag+43456n6/GAky5SlQ6nh8/P8tv5Xhft4849iuqTutdUrH2a/ZeHRat
 FzYZYdkQBfzDYKHshK/Z6200G0tI9i5jos9GvlNlErM/AQT5ycwngcwBzcIakNMgphSZonnS4/q
 H+1vMK4RbS9/+TAA0GixKyjyFHHUtT0wpgjjShxdeIzBfTu6al2C6TWS2OfrOQeuqsrPWpduZ6W
 pGdYeBwpGHJGm60hB+iI+bs2YG4v5MUVrRQE57hpppbZ7QvcUJ0V2FYR7GiCsvV/+hwXohMTQUj
 uESsjmxPMuFJiAf5ElQ==
X-Proofpoint-GUID: WPcbIZi8ujGUGlU1X5oMSgy_cyZX-Cob
X-Proofpoint-ORIG-GUID: WPcbIZi8ujGUGlU1X5oMSgy_cyZX-Cob
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c296af cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NIEm_JVVVNGBJfZDzK4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240109
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99690-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBA6A309D8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 3:33 AM, Bjorn Andersson wrote:
> On Mon, Mar 23, 2026 at 10:26:53AM +0530, Jagadeesh Kona wrote:
>>
>>
>> On 3/16/2026 6:26 PM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 16, 2026 at 04:38:21PM +0530, Jagadeesh Kona wrote:
>>>> Keep GCC USB QTB clock always ON which is required for SMMU
>>>> invalidation on X1E80100 platform.
>>>>
>>>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>>> ---
>>>>  drivers/clk/qcom/gcc-x1e80100.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
>>>> index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
>>>> --- a/drivers/clk/qcom/gcc-x1e80100.c
>>>> +++ b/drivers/clk/qcom/gcc-x1e80100.c
>>>> @@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
>>>>  	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
>>>>  	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
>>>>  	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
>>>> +	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
>>>
>>> Is it used during all SMMU invalidations or only for those related to
>>> the USB controller?
>>>
>>
>> Yes, it is required for all SMMU invalidations.
> 
> What happens if it's not enabled?

Board goes kaboom if you suspend the system with the flattened USB node
(why only with the flattened one? I would assume that moving the iommus
property makes a difference)

> Why isn't problem described in the
> commit message?

That would be good..
> 
> If it is _required_, wouldn't that imply that this fixes a problem, and
> if so, why isn't there a Fixes: tag?

Certainly

Konrad

