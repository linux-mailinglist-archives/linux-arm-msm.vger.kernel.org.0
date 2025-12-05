Return-Path: <linux-arm-msm+bounces-84434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E30CA7116
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEED6308479B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2589B309EFA;
	Fri,  5 Dec 2025 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWH1PLfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAOznVks"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423DB306B0A
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928892; cv=none; b=lqOTNfVi5T3Pri3m8IElBi1fQl4FTbzpJNdYTDdzLMUkSGcbjXAvW5bbUXQUu7PY9h+I5WRLNTCNAHY436GcfTdKpPb9nt9LngLzRhyNIGgbH4GkAtYJ034c8r8ACJLFP3K508fEN1Dwy/p3F7oFvumMpF51SVivdQlh25kgDtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928892; c=relaxed/simple;
	bh=1UfligJQHsBEf/oWTPoxlgLQvvDW/tlYGi3/ZN3SZds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KqsBQZVBzhK7FJkf1VdhJZ7y8b1E7QUvHBFG8pNU8QYW3jLympzkdQBY+VEvWdkMj50+zKqI+tDQvG7gQxj3nHnLB0fZoy9cLcCWePNv5OkZ5kuHGo2cupjPJRxE0mNBUq6o53ghjoTybeb25L5CJchRxVuBxiR6smTgzoSt+nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWH1PLfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAOznVks; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B52BK2B3212056
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 10:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oeP/m2fJagJh7n1ezuCSp5/oRqR7bYSQxaqZUom0L6E=; b=lWH1PLfQW/wBOKj/
	KmfW/o8v++WoKd+IZB9jTgv5J+PYwc5XoNY2upqQHZWHIFsg7fZcyD6AaUbVarNf
	vn+r2OLxJ0tICRLQ/VAfJIMLDysHiDiP+PD8nLAp+xWz6co+fyRkBSs8n25WZ1rB
	WW9aQUNgenvB6pFZR9GUSTc32kMQ8UCGuiw7TFh8Avyq208mnrEpAp/GeI7YZWrL
	ImFFLub9/Tt1lSzZEd4iyF84Es1CGjyo/23eMLT6ZUhMvnfxNMyiK3/u1QaeuPWz
	QptHjo5241rwkZpGUt8p5b8VDCU6SeueDoNhViOnyaTy3SOvEmXfioo144yXkimr
	oUE+2A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aupcph601-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 10:01:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso4583051cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764928881; x=1765533681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeP/m2fJagJh7n1ezuCSp5/oRqR7bYSQxaqZUom0L6E=;
        b=HAOznVkss/O6/Gjml7Osiev4gOL2QCOeyVWBuU0ub5uqsELvbe1Dlju/xnquj0MvhM
         HIs9l66sucESxLYQjsnzznMDOBVC7abMfIWD6uvfbdEQzs94zNW94w/hRq/cjyG7pLvp
         Xx8ovzrthcYShzw+npKT0J8IAG9wgC5UD8QKWl9emnYlxO4PYloSgLiWSM23Xm614TrO
         T0W2ZjxvsURq4Doic8ZzNhy1AXCb9S9DzjJbZZUSp2zc3MUe3U8Eqt1xvJi05dL8l5lD
         5N8DeBMywJEAbwtXUTIUIerrWmOgDpSvrQ2kvlsIkoo1sfJSCq9j4QyrUwjRkmKr3OAY
         MBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764928881; x=1765533681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeP/m2fJagJh7n1ezuCSp5/oRqR7bYSQxaqZUom0L6E=;
        b=EL32Vsi+aJ9DBDA+o+c1oi9IkYYVQQe7WWMXf3gSkee+7VMAe5O0krTOm8sJsJSuJy
         RZUsde++zpw1omvIxgXylCMWPlxgAjfq6/EIQQi+DEkayu77zYEDVOH3RyV4/21lOere
         rJMOuF9qfzdmVQW3UCdpBl97djiSzfGKJBQcVKYwUO+XPq2mzvK9qF1m1fdWBJ9Pjsab
         J/yUI0+VlSTrL7A41lLjPyOX0GQlHcIX+uNQowJR3BniBo/iV98Oq4TycueWn9UbN6OB
         ooFFVDA18HLrZcnE9+m2LHLN6G49Qzd7ZuXHLG0453rgNgjuWAqAkVjLkMPDoUUY++MQ
         AU4w==
X-Forwarded-Encrypted: i=1; AJvYcCVRLfVGzrZqbR54s5MVvbpqHwZCEDHACEcAVREBp3yQTay3OEpgvfgNrS3pb8ka8zh3402NCKHtM1RWZqnz@vger.kernel.org
X-Gm-Message-State: AOJu0YzJg3GtIPI+Qi7iEPow6XEJYepEVS4LYwCDPOtZslzrbN/bMAjm
	jzKHXRA+RmtXt9EHzuW8vtFYMn+nMwR5QHz5IJdPtkQWjq+hOuQY5VU5SjUdYRwhhHFbT5WCZSH
	s4TGhPYvEU0M0OqOie6YDMlJp25nz8j2+Jj0r7IUyLTJb2aNOHGA+D4eTGV3qf9mKoIFf
X-Gm-Gg: ASbGncvn5VawbU1TFipoGGCOzRXxXKKRcDbwlTzHYweGCaUg8mwWOoICZNqOMFX+I8/
	2L1PcUSUkXO8RQ6MAQUc/lBUebIvpREe5bpHFn+t0fnVKh0LQQmgs8njSfQAjo/MJVs70Z5aU/a
	WTBkAxCK+arow2OuFDrTemfJCqn5dhl2Ik/RSXrnjMV9A6XxvCR0914o49l1EPWEt6OTQibVLnh
	F1Tt31GeDxZ9iLgl3U2s88oVJqy6p/got11FFqtzwYSVrsSr3YEAHaGIlhmjdrGOwoZrjtJsR/o
	IVzDBlnzX03mPug0RIoUErxLW9UJbQqoChKXsiINoYj4qXHiMW7g2loLgXxWayq669NjeOYHhjX
	Bnc8jTJA9ADlr+8hnavfPegoa0kFq76HQwe2xPts+2/+TUnpIqXtr6h9+JMLipmBnQA==
X-Received: by 2002:ac8:5702:0:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4f01b21e81dmr87142471cf.6.1764928881115;
        Fri, 05 Dec 2025 02:01:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKshyoRtp9ZzsajxtgrEuEZW1LKNnO0PjqbOpSQZBzXPV/Xv7fWXBN10MdVp54WsP1yl7acg==
X-Received: by 2002:ac8:5702:0:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4f01b21e81dmr87142021cf.6.1764928880561;
        Fri, 05 Dec 2025 02:01:20 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2edf5a7sm3383939a12.13.2025.12.05.02.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:01:19 -0800 (PST)
Message-ID: <e0c5f40f-9bb2-4e62-b057-772dd3d6806a@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 11:01:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wnbBeTEeWHx0eD51cZ3HZWDZHGIKGK3G
X-Proofpoint-ORIG-GUID: wnbBeTEeWHx0eD51cZ3HZWDZHGIKGK3G
X-Authority-Analysis: v=2.4 cv=Me1hep/f c=1 sm=1 tr=0 ts=6932ad72 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5e6XgBO0iodNXUd1Y8AA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3MyBTYWx0ZWRfX+AGZOUOqgY0y
 GEeIJh4i7oSGxRZnuxbjUvkmRuPcHEDZZloQL4PHfDea+NyRRYRsmf32Ucjc4ErjihVAjdm2iAX
 NmpS/ZvpKzzAYGw8IlIBGzVnvpljmYSft7lk/ZV6KiWTpFUmOOmeoZH88iEzRU+HkwzUbswAVpf
 F2fNiA9WY1zXEQxOdra0m7WC74GhzUT5zi5mTZ8SJPaJaBoTznJqZ0/VZNSXdhP9polJFaiksaz
 3YMCMvBf3xo0MvmVWrkxkZTl/wHpZZ+vCANNpMHfqdgd486ObaS8fbKAOZFpnFZKe6/G3shaOJP
 MnFEGF61HEvdRoeiN2qw39HPEZQ+XuTRrUoglrUwB0ckCDxQqT2zPvGYrLrdLU94ymmT4HECk+A
 V6QHFDv7qJjXfd8s/oeOCgwxeJVKOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050073

On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Make sure we have proper lane registers definition in-place for each
> generation, otherwise C-PHY won't work.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 48 ++++++++++++++++------
>  1 file changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 6d6dd54c5ac9c..c957f7dbfb243 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1222,8 +1222,12 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  		}
>  		break;
>  	case CAMSS_2290:
> -		regs->lane_regs = &lane_regs_qcm2290[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */

If you're checking for C-PHY specifically then just say it in writing
instead of printing a magic integer

Konrad

